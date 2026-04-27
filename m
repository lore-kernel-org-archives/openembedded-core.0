Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625B7FF8864
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:08:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6474.1777324130509543197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jvFEcsgQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ED6D16F2
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90F293F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777324130; bh=LRamqHTszjnHih6b5i3fjK92BkCTPmiEyF1pNh2H7VQ=;
	h=From:To:Subject:Date:From;
	b=jvFEcsgQoyRXRRtzQj33y2X3yO97eJ5byz9LnHvN7+S08uv6NGaxnuUFGqUShatsK
	 acZhG3dco0H5n+avmdNu9j+ke7ImWku/GWU7ocV0R6Hobijvky3Ycb/tzt7C+ZdkQb
	 yOCzr+eTAkMzLgxXK8EBAvZW8IrkTYQ3xYtgnCJ8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] dhcpcd: remove obsolete explicit debug packaging
Date: Mon, 27 Apr 2026 22:08:43 +0100
Message-ID: <20260427210847.3027890-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236025

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb b/meta/rec=
ipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
index fca7d8b11d9..44dbb3dba59 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
@@ -63,5 +63,3 @@ do_install:append () {
     chmod 700 ${D}${DBDIR}
     chown dhcpcd:dhcpcd ${D}${DBDIR}
 }
-
-FILES:${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"
--=20
2.43.0


