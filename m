Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7C7C43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 12:57:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68965.1782997048372821471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 05:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=aoM6Soer;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 899071FCD
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:57:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75F203F673
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782997047; bh=lLCKdbLfQlbiAb76JUOExjfCY3TtTAM1LurwLPNsRto=;
	h=From:To:Subject:Date:From;
	b=aoM6Soerrm9yp1CjHkcAZzKETRB7okV+Xb1hNKMr190XspwpgRm/3m4ET9fghXKDj
	 C1udw/KhRKc0p4RqVNiZTFmY/RtoZ3Px5bXRLlowoBLO6eiFeVixQt35mT//6xQkhC
	 Ouw5iyL2C7AcGiLBEFFGV+afhCB6xxoLcGM0JZ5s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] conf/templates/local.conf.sample: add comment about headless qemu
Date: Thu,  2 Jul 2026 13:57:24 +0100
Message-ID: <20260702125724.979218-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 12:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240043

Add a comment showing how to disable qemu-system-native options if the
build machine is headless, to reduce build dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
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


