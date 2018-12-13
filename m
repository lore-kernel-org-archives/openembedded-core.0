Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 694836C45F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 15:35:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m22so2843155wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 07:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JcpuzQkfi97vt2KSGqQcyFWn9ZVyYDy5e1yoquioPb0=;
	b=Yttg0H2Zl77JC2/5DSNBINHOfI+PtbgSqNteQwKIIks9/rO6661A5LWhxEM6anezPS
	LMgPIQ4dYubMh/05zXoCWA6fnNIaXOjwj7lxeraGWDKcWkaXX/BxSPY+vbLQocR9sOiM
	Bev/LhjQN3UbvcWq4ZVRc3TfPx3YxstmGIzRKM1SyFM4MN3TjPqJZHH6KxRK+rr+blBe
	0gc1XAA9O30LdX6ySCh2EgYnpxqjjYk8DCNIPKEB32m7l1+k9i0ZhD857Ysgx4lbDal2
	FDNXh6ilSXZ5CEojg9MngRiueohth/eMbmLaP8yzNkMY18Zf3MLNPoo1cVeFx5FNdMPU
	d7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JcpuzQkfi97vt2KSGqQcyFWn9ZVyYDy5e1yoquioPb0=;
	b=BVEFNVfbKzAhbEvaOVgMFGhCFCos6wnV08fCTxrqYc5X+W3AK6N8lLblLxwBORMeZb
	em6s/hXjKVQdvphUhNxoVGk55GV5Rl9bgaIPubbJvJ66sA3gqlQEiNslGc6GxQowyjg4
	lvbezSbrEMzfMcM0hsk5baofcYArmhXfeT1x8+urFPegUQOQrtg9PoiVHRE5i6/3+CtI
	tD0liQ+Gr3Q2FLgRuwF/uNCad4W8OGEGR5j3QaNl2r4XmNMOAbYW0+2S/r03wTDfYBiO
	KBPf1R9ZtPI+FOgAkKjFCZHzwoOPPrW2I1OzZPkHq5vscZBYCG/2Cs6Lw6LfBFbhYa9I
	MbSQ==
X-Gm-Message-State: AA+aEWYw2RJngI7pjWAckl6DtxjpVghYZU4tykiiDmJsWMlS94oSODq6
	bmRLnDqbMCApXxq6U9qvtd24l5rHxeA=
X-Google-Smtp-Source: AFSGD/U/rVFCj/JcvGi/7GH/JfKz1sP4tEno10p/ro6WmjEAqLCI/ypljRiidQZ3TZ4tsF3jswHq3Q==
X-Received: by 2002:a1c:1593:: with SMTP id 141mr10459311wmv.85.1544715356832; 
	Thu, 13 Dec 2018 07:35:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f187sm1679585wma.4.2018.12.13.07.35.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 07:35:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 15:35:52 +0000
Message-Id: <20181213153552.18793-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] vulkan: don't fetch from the deprecated repository
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 15:35:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb b/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
index 5496f539676..dd3adeeb0d6 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.1.73.0.bb
@@ -4,13 +4,13 @@ that provides efficient access to modern GPUs. These packages \
 provide only the common vendor-agnostic library loader, headers and \
 the vulkaninfo utility."
 HOMEPAGE = "https://www.khronos.org/vulkan/"
-BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Loader"
 SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99c647ca3d4f6a4b9d8628f757aad156 \
                     file://loader/loader.c;endline=25;md5=151b392f46568aaedb4ad22b246237ec"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.1.73 \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;nobranch=1 \
            file://demos-Don-t-build-tri-or-cube.patch \
            "
 SRCREV = "5998d6f444a85e6381b7a089ebf3f9e86482a31d"
-- 
2.11.0


