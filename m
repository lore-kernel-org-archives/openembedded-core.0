Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CA5C7EE22
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:34:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14812.1683106447711605698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DB31C14;
	Wed,  3 May 2023 02:34:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C44683F67D;
	Wed,  3 May 2023 02:34:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 4/4] vulkan-tools: upgrade to 1.3.243
Date: Wed,  3 May 2023 10:33:49 +0100
Message-Id: <20230503093349.2836626-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503093349.2836626-1-ross.burton@arm.com>
References: <20230503093349.2836626-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180800

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{vulkan-tools_1.3.239.0.bb =3D> vulkan-tools_1.3.243.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.239.0.bb =3D> vulk=
an-tools_1.3.243.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb b/met=
a/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb
index 5dc6bcad453..dfdd716abd3 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb
@@ -6,8 +6,8 @@ SECTION =3D "libs"
=20
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
-SRC_URI =3D "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=3Dsdk=
-1.3.239;protocol=3Dhttps"
-SRCREV =3D "84c61c463aecdda385de33b0149c7368119c23f6"
+SRC_URI =3D "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=3Dsdk=
-1.3.243;protocol=3Dhttps"
+SRCREV =3D "18bdf5565f5d02831869785cbf758fa7b295b7d5"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


