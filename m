Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A82AC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:11:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89035.1782727902113457189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WWGTs+LO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19B9E1595
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:11:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 119723F836
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782727901; bh=BgHAIP6YwNq5T7rglpiIV0BEb0qe2oDVja3agrM5O5g=;
	h=From:To:Subject:Date:From;
	b=WWGTs+LOVabupn44x92aomJ/mpzArHSSOgCE+z7bIldS2pnkoEMUbUer/1bFRW6N5
	 D7zfw5gRYzzPFatGFr2l3lX460YbAY45Mw1+oXKjws9dwwcnXZy6zPbIXqFlIE/x2b
	 fgm6AeJobmfW7Yz4QD++PQFeV+L7rOsV0fucr0Xk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Add comment about qemu
Date: Mon, 29 Jun 2026 11:11:35 +0100
Message-ID: <20260629101136.1319045-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239743

---
 meta/conf/templates/default/local.conf.sample | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/te=
mplates/default/local.conf.sample
index 2a0eea493cc..2b837806b1d 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -228,6 +228,10 @@ BB_DISKMON_DIRS ??=3D "\
 # a handy set of menus for controlling the emulator.
 #PACKAGECONFIG:append:pn-qemu-system-native =3D " gtk+"
=20
+# Alternatively, if your build machine is headless then you can disable =
the graphical
+# options to reduce the build dependencies.
+#PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
+
 #
 # Hash Equivalence
 #
--=20
2.43.0


