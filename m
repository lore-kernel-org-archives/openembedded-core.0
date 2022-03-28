Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4D0C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 10:26:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9280.1648463212387110641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 03:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C8F3D6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 03:26:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2F4D3F66F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 03:26:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub: ignore CVE-2021-46705
Date: Mon, 28 Mar 2022 11:26:48 +0100
Message-Id: <20220328102648.1138501-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 10:26:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163703

This is specific to SUSE Linux.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
index ba0596c9383..45852ab9b1c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -28,6 +28,8 @@ SRC_URI[sha256sum] =3D "23b64b4c741569f9426ed2e3d0e6780=
796fca081bee4c99f62aa3f53ae
=20
 # Applies only to RHEL
 CVE_CHECK_IGNORE +=3D "CVE-2019-14865"
+# Applies only to SUSE
+CVE_CHECK_IGNORE +=3D "CVE-2021-46705"
=20
 DEPENDS =3D "flex-native bison-native gettext-native"
=20
--=20
2.25.1


