Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C36C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 19:59:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.688.1683057576618617933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 12:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A11EC14;
	Tue,  2 May 2023 13:00:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 72DB63F64C;
	Tue,  2 May 2023 12:59:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] vulkan-headers: upgrade to 1.3.249
Date: Tue,  2 May 2023 20:59:30 +0100
Message-Id: <20230502195932.2196823-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 19:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180766

---
 ...{vulkan-headers_1.3.239.0.bb =3D> vulkan-headers_1.3.249.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.239.0.bb =3D> vu=
lkan-headers_1.3.249.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb b/m=
eta/recipes-graphics/vulkan/vulkan-headers_1.3.249.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.249.0.bb
index a6b30fa8310..ea6312133ca 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.249.0.bb
@@ -11,7 +11,7 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
 SRC_URI =3D "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=3Dm=
ain;protocol=3Dhttps"
=20
-SRCREV =3D "2bb0a23104ceffd9a28d5b7401f2cee7dae35bb8"
+SRCREV =3D "870a531486f77dfaf124395de80ed38867400d31"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


