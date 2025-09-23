Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FA2CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:21:13 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.18090.1758637268267233921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BVilHNl3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NEL7cj1006753
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758637267;
	bh=rOx4Vcv4WddYG8lpwOQnEj/sg79qJaERnI4KKFEdEqQ=;
	h=From:To:Subject:Date;
	b=BVilHNl3A1oMIF2z/HfZXs8p6BiiQAOOdXMrxkhomgGMKErxEc9XR2wvh7796YvYr
	 aFr6zc2+IN3WVX2sdB/CCpx25R2PLgtOU6mcwPmHVzdEVAwGQf2ZO4jLoo1SETLXXa
	 aJn9jDkwfLpd6J2svD/BGOYukk3VqxMjxQcKCwtA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NEL78f1138699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:21:07 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 09:21:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 09:21:07 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NEL6oQ427457
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:21:06 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v13tC-0005IF-RX
	for openembedded-core@lists.openembedded.org; Tue, 23 Sep 2025 09:21:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] piglit: rename virtual/opencl-icd to virtual/libopencl1
Date: Tue, 23 Sep 2025 09:21:05 -0500
Message-ID: <20250923142106.20096-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223881

A change in meta-openembedded that provided virtual/opencl-icd [1]
changed the name to virtual/libopencl1.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=87b44d29b6942427bfb1fab02a4564e41dcc01a0

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 59f014afee..63c0cf1ac0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG ??= " \
 "
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
-PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/opencl-icd"
+PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,virtual/libopencl1"
 PACKAGECONFIG[x11] = "-DPIGLIT_USE_X11=1 -DPIGLIT_BUILD_GL_TESTS=ON -DPIGLIT_BUILD_DMA_BUF_TESTS=ON,-DPIGLIT_USE_X11=0 -DPIGLIT_BUILD_GL_TESTS=OFF -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,glslang-native vulkan-loader,glslang"
 PACKAGECONFIG[wayland] = "-DPIGLIT_USE_WAYLAND=1,-DPIGLIT_USE_WAYLAND=0,wayland-native wayland wayland-protocols"
-- 
2.17.1


