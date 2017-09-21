Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 88FEE78245
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:08:43 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b1so3826527qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=B2rV1tfHnMh5rFq1u0Pv5lJLF1DJaGbP6PmwvRPr4ls=;
	b=VTbA8spde4azbbeSDjuAbMjAUzJ40Ku+5gRK/RbtRdDtNlVyFE+wbfxfCEZ4CzyhlS
	ATBlOANqV61nXuuaS/My/qJY/FkjD/SMa+PEnlsPMmhvkzS8FM0gZTzoRhNbvsRifsJ1
	nkh8Yg5DVs69EqeMUqGZqWlS+Gw9rtA1Fz4iqXjZhWWekCF+KZXy21qbsI7c6DRg/VME
	a8nXQH3+qItIbHsWkJusBTC6WHodlOkvbXceEZyxzh6PM5w8ggdPoMI7XKjBx49COnn9
	FbZMOjOG06PCRatkayj/G9W2c2kOdzOgg+Mkve2M+06XizFrjErlpeICp/YytHntV0t6
	UJuA==
X-Gm-Message-State: AHPjjUiJz4IhAIbhJyA1CKXQkVE5KesGZX5NFku8n4BDTsmpOd5E7mOk
	+RcdjyBBtnr0DwzQI2GZNZ1ZPQ==
X-Google-Smtp-Source: AOwi7QCmxhZxTdw92dxYJn68bTWknmxZtHBjUloMWewpgD2NS4v3XO4FQEJLAXaa7yW1QMEdPQg6sQ==
X-Received: by 10.200.57.29 with SMTP id s29mr3512771qtb.309.1506002924212;
	Thu, 21 Sep 2017 07:08:44 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	i124sm1003186qkf.84.2017.09.21.07.08.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Sep 2017 07:08:43 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 21 Sep 2017 11:08:35 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 11:08:18 -0300
Message-Id: <20170921140819.21292-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] mesa: Upgrade to 17.2.1 release
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
X-List-Received-Date: Thu, 21 Sep 2017 14:08:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to a new stable release and drop patches applied on upstream.

For a full release notes, please see:
https://mesa3d.org/relnotes/17.2.0.html
https://mesa3d.org/relnotes/17.2.1.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
 - update to 17.2.1

 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ------------------
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ----------------------
 .../mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.1.bb}  |  0
 .../mesa/{mesa_17.1.7.bb => mesa_17.2.1.bb}        |  7 ++--
 4 files changed, 3 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb => mesa_17.2.1.bb} (77%)

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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb b/meta/recipes-graphics/mesa/mesa-gl_17.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.2.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb b/meta/recipes-graphics/mesa/mesa_17.2.1.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_17.1.7.bb
rename to meta/recipes-graphics/mesa/mesa_17.2.1.bb
index a50f32c025..59c40b1371 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.2.1.bb
@@ -7,13 +7,12 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-hardware-gloat.patch \
            file://vulkan-mkdir.patch \
            file://llvm-config-version.patch \
-           file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
-           file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-configure.ac-Always-check-for-expat.patch \
            "
-SRC_URI[md5sum] = "e40bb428a263bd28cbf6478dae45b207"
-SRC_URI[sha256sum] = "69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f39872a96d83d9e5f5"
+
+SRC_URI[md5sum] = "f53ed38110237d9df5f9198c09ef0ab0"
+SRC_URI[sha256sum] = "77385d17827cff24a3bae134342234f2efe7f7f990e778109682571dbbc9ba1e"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.14.1


