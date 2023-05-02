Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78459C7EE25
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 19:59:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.689.1683057576948452655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 12:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4DBE150C;
	Tue,  2 May 2023 13:00:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28C683F64C;
	Tue,  2 May 2023 12:59:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] vulkan-loader: upgrade to 1.3.249
Date: Tue,  2 May 2023 20:59:31 +0100
Message-Id: <20230502195932.2196823-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502195932.2196823-1-ross.burton@arm.com>
References: <20230502195932.2196823-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 19:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180767

---
 ...{vulkan-loader_1.3.239.0.bb =3D> vulkan-loader_1.3.249.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.239.0.bb =3D> vul=
kan-loader_1.3.249.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb b/me=
ta/recipes-graphics/vulkan/vulkan-loader_1.3.249.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.249.0.bb
index e11f936a0a1..4404190698d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.249.0.bb
@@ -9,8 +9,8 @@ SECTION =3D "libs"
=20
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D7dbefed23242760aa3475ee42=
801c5ac"
-SRC_URI =3D "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=3Dsd=
k-1.3.239;protocol=3Dhttps"
-SRCREV =3D "fa421a02686e7f01c8e4af24650fa04374df8338"
+SRC_URI =3D "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=3Dma=
in;protocol=3Dhttps"
+SRCREV =3D "71254bedeef4b9e94f7a51ec0fe6e4134dbfcfec"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


