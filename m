Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E65C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 19:59:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.703.1683057577687194900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 12:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A231C14;
	Tue,  2 May 2023 13:00:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D492E3F64C;
	Tue,  2 May 2023 12:59:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] vulkan-tools: upgrade to 1.3.249
Date: Tue,  2 May 2023 20:59:32 +0100
Message-Id: <20230502195932.2196823-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502195932.2196823-1-ross.burton@arm.com>
References: <20230502195932.2196823-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 19:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180768

---
 .../{vulkan-tools_1.3.239.0.bb =3D> vulkan-tools_1.3.249.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.239.0.bb =3D> vulk=
an-tools_1.3.249.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb b/met=
a/recipes-graphics/vulkan/vulkan-tools_1.3.249.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.249.0.bb
index 934bd53ee18..dc54c452bfd 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.249.0.bb
@@ -6,8 +6,8 @@ SECTION =3D "libs"
=20
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
-SRC_URI =3D "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=3Dsdk=
-1.3.239;protocol=3Dhttps"
-SRCREV =3D "84c61c463aecdda385de33b0149c7368119c23f6"
+SRC_URI =3D "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=3Dmai=
n;protocol=3Dhttps"
+SRCREV =3D "e8cfca418ac42b35d696c48595fb7a82a4822355"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


