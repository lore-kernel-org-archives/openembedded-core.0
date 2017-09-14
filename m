Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 21A1F785E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 16:58:14 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i14so2326147qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=viWNp1lh5apNOr7Oxg3Gx9tO8O15l9Z0wXdwT52xUN4=;
	b=18OsjYdK/s94/UN9S9V18nXfk8nR4l85f+l2ygelBfo2/mTPHd8AbwxJQZQqyJYfn1
	vjX+rcA2/mrM2kRqMP9CRpgwQsIxaCeqHeCGmJh3kD/kLdL591viFTRs5EsmJw29Mb3b
	q9hpoh5vjYTWcSFu7wgeS3P9sPNb5aj1bgVUkp4gfPHAI04M/ZEaz04o56kcmRzVNPup
	aNB8gkvuHnKfx6XaVo5rxp3ScHR93ONixz0AX/GqcvWo4h1BOsnlc4NHDbxj6C4XYt0j
	cFYP2mPv7gy+EaEq08O91JYqZgvvcNqIMlgY8I3wEN2pq0JDQbrTJ/evjRdDkR/I27Ec
	bPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=viWNp1lh5apNOr7Oxg3Gx9tO8O15l9Z0wXdwT52xUN4=;
	b=JqIdK6uzvR0wjjrrQGRLYS6ybmS+lETDB5/eubDDvO2tOWYkwJAtzJBI5bkrwE0JuJ
	PO1xhGbsHtQRjgeGcTn2dNTf3pTZupI1iVtV0eDCjI2rXiLMiQ2U5t3H5aYlRtYRsHB1
	fWUQzX9QCV/PoyTka0F4bKt8gv/GAx1NeR6PSZOhcSoqOBQbv4zCOqYoRMT/UxkJcpZ5
	7nBhTKa1FLhlbnh8zmFh4ANnp67pXyrNviR4+pVAwIqsVQdYmiSFyUz9F6gidUDcWPxZ
	PpGclzDtFITwcV6tCtNYEHlGTWCW+xJX4wXJ+VU9a1iwzTj7M7wdYr0c3SkI1W5GDTM4
	GDWQ==
X-Gm-Message-State: AHPjjUiah+OwU+8bQHb6518oyM1okAXGPu4UKGOkegQkWNqyOSybwWOb
	Lh9J2nFLJddBf5iL5fE=
X-Google-Smtp-Source: AOwi7QC4jfcD5udUSDdccaRoSvItI1xJE9bkfdzGSVBpT7EsIaPhCBB++0K7xObGq1z8BR8SXRKrWw==
X-Received: by 10.55.32.138 with SMTP id g132mr3739374qkg.122.1505408295660;
	Thu, 14 Sep 2017 09:58:15 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	k20sm11275745qtj.2.2017.09.14.09.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 09:58:14 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 13:57:58 -0300
Message-Id: <20170914165758.5897-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Upgrade to 17.2.0 release
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
X-List-Received-Date: Thu, 14 Sep 2017 16:58:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to a new development release and drop patches applied on upstream.

For a full release notes, please see:
https://mesa3d.org/relnotes/17.2.0.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ------------------
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ----------------------
 .../mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.0.bb}  |  0
 .../mesa/{mesa_17.1.7.bb => mesa_17.2.0.bb}        |  6 +--
 4 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb => mesa_17.2.0.bb} (77%)

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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb b/meta/recipes-graphics/mesa/mesa-gl_17.2.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.2.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb b/meta/recipes-graphics/mesa/mesa_17.2.0.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_17.1.7.bb
rename to meta/recipes-graphics/mesa/mesa_17.2.0.bb
index a50f32c025..0b6dd9885f 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.2.0.bb
@@ -7,13 +7,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
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
+SRC_URI[md5sum] = "1d8d7323d11146767a37c3cb6a6d411d"
+SRC_URI[sha256sum] = "3123448f770eae58bc73e15480e78909defb892f10ab777e9116c9b218094943"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.14.1


