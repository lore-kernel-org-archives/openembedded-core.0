Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640D6C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 21:42:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6179.1678311728502936271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 13:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D00AFEC;
	Wed,  8 Mar 2023 13:42:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 594203F67D;
	Wed,  8 Mar 2023 13:42:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] systemd: add ignore for CVE-2022-4415
Date: Wed,  8 Mar 2023 21:42:06 +0000
Message-Id: <20230308214206.3757908-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 21:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178200

The relevant fix was also backported to 252.4.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_252.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_252.5.bb b/meta/recipes-co=
re/systemd/systemd_252.5.bb
index 8b92b2cf425..784a2482075 100644
--- a/meta/recipes-core/systemd/systemd_252.5.bb
+++ b/meta/recipes-core/systemd/systemd_252.5.bb
@@ -826,3 +826,6 @@ pkg_postinst:udev-hwdb () {
 pkg_prerm:udev-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+# This was also fixed in 252.4 with 9b75a3d0
+CVE_CHECK_IGNORE +=3D "CVE-2022-4415"
--=20
2.34.1


