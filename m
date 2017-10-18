Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 382D47833F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 11:17:26 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id j58so9709939qtj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 04:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=XjPUNY7kOyfjAaFiyoOd2iFc6uXcbSpJQRWU17pHABM=;
	b=Uf1Az81JhP1HxLk5GVCvPlGBdjQpnBuUXqiPF0zdfcUMASNd9IRKIWTXvRmf9EenH6
	nZmQyT2z9RbOAcHkeycwaG53nMXnV/scYlJGQDFzjt/wq0K5mWMK98UOghGZqu5lnHlL
	aHYxN+vcSSAMn+h9+w29CeWK411FIwnrgbQ3I4V3HIu2oi4+O0N+GkmG6gimsckV2PQS
	Cu+OfaeNmcvk5NVXd1okYrQthtVg/bpwxePC4wws31+t89CNlAr9OGYHhSl5Q/0uaIDO
	fbryjsER8MbClXNfTJXY8nMPeO6zyELSNDzBeLUOjTAPNdX5A5Xq6jFP6SHcZBggjigU
	Fg5g==
X-Gm-Message-State: AMCzsaXTWDfl9Girbt9JZPBa5kWYARF0Jkb0zBFXbTHBH4J+ZmTUSbuW
	j+BzM8ZEAnLIW6iPV5ZvuJGcbg==
X-Google-Smtp-Source: ABhQp+R4Gzhy5yIoUtMoPK18KzewEbyiVUXOFUgBr6Oao4z1cPs11NlBcPQ8V10aeKT40lSrKvJ4Dw==
X-Received: by 10.200.56.52 with SMTP id q49mr2444483qtb.309.1508325447615;
	Wed, 18 Oct 2017 04:17:27 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r83sm7364848qke.40.2017.10.18.04.17.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 04:17:26 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 18 Oct 2017 09:17:18 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 09:17:06 -0200
Message-Id: <20171018111708.2154-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171018111708.2154-1-otavio@ossystems.com.br>
References: <20171018111708.2154-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 1/3] mesa: Upgrade to 17.2.2 release
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
X-List-Received-Date: Wed, 18 Oct 2017 11:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to a new stable release and drop patches applied on upstream.

For a full release notes, please see:
https://mesa3d.org/relnotes/17.2.0.html
https://mesa3d.org/relnotes/17.2.1.html
https://mesa3d.org/relnotes/17.2.2.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
This patch has been tested using OE-Core current Wayland as well as v2
of Fabien patches:

 weston: Bump version to 3.0.0
 wayland-protocols: Fix installation patch issue
 wayland : Bump to version 1.14.0

The distro used for test had: opengl, wayland, x11 and vulkan enabled.

Changes in v5:
 - rebase on top of master

Changes in v4:
 - update to 17.2.2

Changes in v3:
 - fix build for wayland

Changes in v2:
 - update to 17.2.1

 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ------------------
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ----------------------
 .../mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.2.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../mesa/{mesa_17.1.7.bb => mesa_17.2.2.bb}        |  7 ++--
 5 files changed, 4 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb => mesa_17.2.2.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch b/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
deleted file mode 100644
index b27a3bc8e4..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9861437e58fdd0de01193a102608d34e5952953f Mon Sep 17 00:00:00 2001
-From: Christoph Haag <haagch+mesadev@frickel.club>
-Date: Thu, 20 Apr 2017 10:34:18 +0200
-Subject: [PATCH 1/2] ac: fix build after LLVM 5.0 SVN r300718
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-v2: previously getWithDereferenceableBytes() exists, but addAttr() doesn't take that type
-
-Signed-off-by: Christoph Haag <haagch+mesadev@frickel.club>
-Reviewed-by: Nicolai Hähnle <nicolai.haehnle@amd.com>
-Tested-and-reviewed-by: Mike Lothian <mike@fireburn.co.uk>
----
-Upstream-Status: Backport
-
- src/amd/common/ac_llvm_helper.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/amd/common/ac_llvm_helper.cpp b/src/amd/common/ac_llvm_helper.cpp
-index d9ea4b1..11fa809 100644
---- a/src/amd/common/ac_llvm_helper.cpp
-+++ b/src/amd/common/ac_llvm_helper.cpp
-@@ -44,9 +44,13 @@ typedef AttributeSet AttributeList;
- void ac_add_attr_dereferenceable(LLVMValueRef val, uint64_t bytes)
- {
-    llvm::Argument *A = llvm::unwrap<llvm::Argument>(val);
-+#if HAVE_LLVM < 0x0500
-    llvm::AttrBuilder B;
-    B.addDereferenceableAttr(bytes);
-    A->addAttr(llvm::AttributeList::get(A->getContext(), A->getArgNo() + 1,  B));
-+#else
-+   A->addAttr(llvm::Attribute::getWithDereferenceableBytes(A->getContext(), bytes));
-+#endif
- }
- 
- bool ac_is_sgpr_param(LLVMValueRef arg)
--- 
-2.13.3
-
diff --git a/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch b/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
deleted file mode 100644
index ac8caec74d..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a02a0dfda2712d30ad62b8f0421ec7b8244ba2cb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>
-Date: Wed, 10 May 2017 17:26:07 +0900
-Subject: [PATCH 2/2] gallivm: Fix build against LLVM SVN >= r302589
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-deregisterEHFrames doesn't take any parameters anymore.
-
-Reviewed-by: Vedran Miletić <vedran@miletic.net>
-Reviewed-by: Marek Olšák <marek.olsak@amd.com>
----
-Upstream-Status: Backport
-
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index 2a388cb..0e4a531 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -342,14 +342,20 @@ class DelegatingJITMemoryManager : public BaseMemoryManager {
-       virtual void registerEHFrames(uint8_t *Addr, uint64_t LoadAddr, size_t Size) {
-          mgr()->registerEHFrames(Addr, LoadAddr, Size);
-       }
--      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr, size_t Size) {
--         mgr()->deregisterEHFrames(Addr, LoadAddr, Size);
--      }
- #else
-       virtual void registerEHFrames(llvm::StringRef SectionData) {
-          mgr()->registerEHFrames(SectionData);
-       }
- #endif
-+#if HAVE_LLVM >= 0x0500
-+      virtual void deregisterEHFrames() {
-+         mgr()->deregisterEHFrames();
-+      }
-+#elif HAVE_LLVM >= 0x0304
-+      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr, size_t Size) {
-+         mgr()->deregisterEHFrames(Addr, LoadAddr, Size);
-+      }
-+#endif
-       virtual void *getPointerToNamedFunction(const std::string &Name,
-                                               bool AbortOnFailure=true) {
-          return mgr()->getPointerToNamedFunction(Name, AbortOnFailure);
--- 
-2.13.3
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb b/meta/recipes-graphics/mesa/mesa-gl_17.2.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.2.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4f31ed255c..cab8e4bfe7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -45,7 +45,7 @@ X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage li
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
-PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm"
+PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb b/meta/recipes-graphics/mesa/mesa_17.2.2.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_17.1.7.bb
rename to meta/recipes-graphics/mesa/mesa_17.2.2.bb
index 39cfce992f..14f5f5fd6d 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.2.2.bb
@@ -7,14 +7,13 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-hardware-gloat.patch \
            file://vulkan-mkdir.patch \
            file://llvm-config-version.patch \
-           file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
-           file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-configure.ac-Always-check-for-expat.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
-SRC_URI[md5sum] = "e40bb428a263bd28cbf6478dae45b207"
-SRC_URI[sha256sum] = "69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f39872a96d83d9e5f5"
+
+SRC_URI[md5sum] = "1a157b5baefb5adf9f4fbb8a6632d74c"
+SRC_URI[sha256sum] = "cf522244d6a5a1ecde3fc00e7c96935253fe22f808f064cab98be6f3faa65782"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.14.2


