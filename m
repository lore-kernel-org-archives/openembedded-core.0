Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C604D78A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 10:45:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z13-v6so10064722wma.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=fWdm6iwNGzTc1AwQwCrskVGYEanQA8hHwVEAMk5xmc8=;
	b=axCxoIGvaVa7dB1J9neipkNJcIHNCEzXHBuopLLTtjgD2aG3yqJ5tYNpUTUc4Zmvee
	uNY486F6o7KR1Uw2U2DLnBTPzSNuvq0wU8c3uokn5Op7fD82cGhWw6sSdoJ2JCeD93xt
	4SSdHsMUyatSjuKM/subXS3mvVzpOuff2HkbuRObOMAB+Xu8Bj+51HqKUZYw+nW35gPt
	KlGjDXSvURtZXdZfgIgCyNhVobSgai95pede4z7cKPaDaiwDgNsvzH1cX+IukSYENvEX
	xF8TH1RVH4ACDTMZieD9+pyPwFT35XO08lxeC/FfERtqwKntyDg6hpFtfw/lKJ3r/Ki5
	E8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fWdm6iwNGzTc1AwQwCrskVGYEanQA8hHwVEAMk5xmc8=;
	b=lwcfGjD28uqvPNHU+UXgNdZXU3EJzV2mG4kzGh1FhlYLQf3vAifWtJDo2ngrfDj2kT
	6zmtZbAwZ5a9QO0qw9Www8thhZWSzZACw4MjnXplAUAsmCXs9GNd/KLP7KSLO2LeJIdA
	oEeRqP3Ho6aIvS88QUamSCJITy7xGKthAl0BAAb7TDpLd3xPWvV+ffn2Ht4g3xqkvqX5
	iRGsR3fBRpRLDIOlzOsDNMQqCKsXiyJvIGZldG8jECZJVG51VUkqGeG504lUsenRhWFv
	dMOls+cXLvnVRGw1/nUhbp1QlyhVoxoSaTdgDx2v+Gb7AgrcM2Vk40Aqwur7N385KrIm
	mIxg==
X-Gm-Message-State: APt69E1RsqLJQN4RfAVrr5Vp7gnaD7ci+hBtKeoFcs+sdH9DJ+T4FgaP
	OrzpXU7X6f4rVnVcRD4acw4tbldK
X-Google-Smtp-Source: AAOMgpf9BzLkdwUfddDL/4g9f5dLvRuTPpbuE0QE6zE19uFCJKObR6I27EdOre/fW2PA1wRxat3qGA==
X-Received: by 2002:a1c:c006:: with SMTP id
	q6-v6mr3563780wmf.107.1530787503985; 
	Thu, 05 Jul 2018 03:45:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	s13-v6sm6864321wra.22.2018.07.05.03.45.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 03:45:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 11:45:01 +0100
Message-Id: <20180705104501.4166-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: patch cleanup
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
X-List-Received-Date: Thu, 05 Jul 2018 10:45:04 -0000

0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch was fixed a
different way upstream so remove.

0007-dri-i965-Add-missing-time.h-include.patch is now accepted upstream so mark
as backport.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...lkan.am-explictly-add-lib-expat-to-intel-.patch | 46 ----------------------
 .../0007-dri-i965-Add-missing-time.h-include.patch |  2 +-
 meta/recipes-graphics/mesa/mesa_18.1.3.bb          |  1 -
 3 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch b/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
deleted file mode 100644
index 3529f493e73..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b514366df767da9acf991567bbee3eaa0c4ddaa6 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 11 Oct 2017 15:40:42 +0800
-Subject: [PATCH 1/8] Makefile.vulkan.am: explictly add lib expat to intel
- libvulkan's lib depends
-Organization: O.S. Systems Software LTDA.
-
-While built with "-fvisibility=default"
-...
-|i586-oe-linux-gcc ... -fvisibility=default ... -o common/.libs/common_libintel_common_la-gen_decoder.o
-...
-
-It triggered the failure
-...
-|i586-oe-linux-g++  ... common/.libs/libintel_common.a ... -o vulkan/.libs/libvulkan_intel.so
-|common/.libs/libintel_common.a(common_libintel_common_la-gen_decoder.o):
-|In function `start_element':
-|/usr/src/debug/mesa/2_17.1.7-r0/mesa-17.1.7/src/intel/common/gen_decoder.c:371:
-undefined reference to `XML_GetCurrentLineNumber'
-...
-
-explictly add EXPAT_LIBS to intel's VULKAN_LIB_DEPS
-
-Upstream-Status: Accepted
-https://cgit.freedesktop.org/mesa/mesa/commit/?id=05fc62d89f59ce19a18bfd4e63a09624910d6caf
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/intel/Makefile.vulkan.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/intel/Makefile.vulkan.am b/src/intel/Makefile.vulkan.am
-index 4125cb205a..356c4f8452 100644
---- a/src/intel/Makefile.vulkan.am
-+++ b/src/intel/Makefile.vulkan.am
-@@ -161,6 +161,7 @@ VULKAN_LIB_DEPS = \
- 	$(LIBDRM_LIBS) \
- 	$(PTHREAD_LIBS) \
- 	$(DLOPEN_LIBS) \
-+	$(EXPAT_LIBS) \
- 	-lm
- 
- if HAVE_PLATFORM_ANDROID
--- 
-2.18.0
-
diff --git a/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch b/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
index e559027c3d9..5b55b8a1fd0 100644
--- a/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
+++ b/meta/recipes-graphics/mesa/files/0007-dri-i965-Add-missing-time.h-include.patch
@@ -13,7 +13,7 @@ This fixes a build error when using musl:
 |     ^~~~~~
 `----
 
-Upstream-Status: Pending
+Upstream-Status: Backport [3c288da5eec81ee58b85927df18d9194ead8f5c2]
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  src/mesa/drivers/dri/i965/brw_bufmgr.h | 1 +
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
index c47c57e9d8e..1c76f4b1b12 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
@@ -1,7 +1,6 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            file://0002-Simplify-wayland-scanner-lookup.patch \
            file://0003-winsys-svga-drm-Include-sys-types.h.patch \
            file://0004-hardware-gloat.patch \
-- 
2.11.0


