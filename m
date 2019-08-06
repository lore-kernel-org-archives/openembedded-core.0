Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 68F437F35E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:44:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 207so77877604wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9PT0KysHZUhIy/BCg176OXD9fHUljCo4G25GCgN9RDY=;
	b=P9cGUwB9TC9Pcgks73S8u18IhzmrVBcSeGkKm2xNoW6/kHykQgkUPK/TXHKNvuddxI
	Z1MBB9J2banPSfsHsGRMsqfx2mYsHXoi08ihqO4L3DrJDPXwGDdHwSWcpTlnFEASse7u
	Ykjro9NlPb7ENAFhlxksgSMPsdzPhskByFF6LFtbJoYRZf74yJc/IQAAXdVnq8osM9AV
	TBRHRzmw1u+KEZ2NcSv+wwxkIJzPTM/BJN4+tfMpfImKQD4gBntz1uSw4vhoVSw5rQwA
	DpYi76xHm/1pkda0BKDJIC34IR+jKVc5QIYWDkQislVcX9cx4ejJaX6lWMKXKU5HMz44
	5MXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9PT0KysHZUhIy/BCg176OXD9fHUljCo4G25GCgN9RDY=;
	b=lAgoSrxOiNYHQ09MATU80g6fpSEmqQBQHC3iACa7KjNu+HGQtYAh2dWl5vTOCrvcd6
	9Fh3GSMbr6ySfIcnmM3mTwEyk1m7+F7zuSt70oW2P8NgWd/RS7nUoy9aiH17yEiRb91f
	AF+SjBAfp8FEXRBqrz2ydgzhkZH9ofu5ijPUydAJPs8xvhdbecrRvIxXbOeP9GiIH//z
	Cy8pMoMxWSRC2/56WUi0g6t74a/2ML1Si0w/ozJAMGpL/UijdSc/9fheHQ3XAtrknzaw
	3eY5+bo6sPUVR7olgaaBpdp8WIH/hIYfAfiSH5kHGhpxGsjp1CmSrutpRX3Co5a2iB/m
	FPvQ==
X-Gm-Message-State: APjAAAUaOITfNuLAGM28SNPw8vPXKZgfBZdAa3Z2KJcGoCegaYQGigt2
	2dJqOefmfADO/eJ+jtYa150MnBnelDs=
X-Google-Smtp-Source: APXvYqxS0OGfF1RaAMsYlYdqYnHS0RqOhWHM43vfJ4LdjqRWV0dBZX14CwfFgy24XltVf90EJE1ETw==
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr4330068wmc.126.1565091880672; 
	Tue, 06 Aug 2019 04:44:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w7sm102312780wrn.11.2019.08.06.04.44.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 04:44:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 12:44:36 +0100
Message-Id: <20190806114436.6366-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] waffle: upgrade 1.5.2 -> 1.6.0
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
X-List-Received-Date: Tue, 06 Aug 2019 11:44:40 -0000
Content-Transfer-Encoding: 8bit

Switch to Meson instead of CMake.

Add PACKAGECONFIG for surfaceless-egl.

Inherit bash-completion for the new wlinfo completion script.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 -------------------
 .../{waffle_1.5.2.bb => waffle_1.6.0.bb}      | 23 ++++----
 2 files changed, 12 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
 rename meta/recipes-graphics/waffle/{waffle_1.5.2.bb => waffle_1.6.0.bb} (58%)

diff --git a/meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch b/meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
deleted file mode 100644
index a0c826ed933..00000000000
--- a/meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 3b9b8f5f6d1b99af43e95ec0868404e552a85b73 Mon Sep 17 00:00:00 2001
-From: Emil Velikov <emil.l.velikov@gmail.com>
-Date: Thu, 19 Mar 2015 22:26:11 +0000
-Subject: [PATCH] third_party/threads: Use PTHREAD_MUTEX_RECURSIVE by default
-
-PTHREAD_MUTEX_RECURSIVE_NP was used for compatibility with old glibc.
-Although due to the_GNU_SOURCES define the portable,
-PTHREAD_MUTEX_RECURSIVE will be available for Linuxes since at least
-1998. Simplify things giving us compatibility with musl which
-apparently does not provide the non-portable define.
-
-Inspired by almost identical commit in mesa aead7fe2e2b(c11/threads: Use
-PTHREAD_MUTEX_RECURSIVE by default) by Felix Janda.
-
-Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
-Reviewed-by: Chad Versace <chad.versace@intel.com>
----
-Upstream-Status: Backport
-
- third_party/threads/threads_posix.c | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
-index 5835e43..e122bf9 100644
---- a/third_party/threads/threads_posix.c
-+++ b/third_party/threads/threads_posix.c
-@@ -26,6 +26,9 @@
-  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-  * DEALINGS IN THE SOFTWARE.
-  */
-+
-+#define _GNU_SOURCE
-+
- #include <stdlib.h>
- #ifndef assert
- #include <assert.h>
-@@ -150,13 +153,8 @@ int mtx_init(mtx_t *mtx, int type)
-       && type != (mtx_try|mtx_recursive))
-         return thrd_error;
-     pthread_mutexattr_init(&attr);
--    if ((type & mtx_recursive) != 0) {
--#if defined(__linux__) || defined(__linux)
--        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
--#else
-+    if ((type & mtx_recursive) != 0)
-         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
--#endif
--    }
-     pthread_mutex_init(mtx, &attr);
-     pthread_mutexattr_destroy(&attr);
-     return thrd_success;
--- 
-2.5.2
-
diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
similarity index 58%
rename from meta/recipes-graphics/waffle/waffle_1.5.2.bb
rename to meta/recipes-graphics/waffle/waffle_1.6.0.bb
index 31572f25f7d..8a1d5748f63 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
@@ -3,34 +3,35 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
-           file://0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch \
-          "
-SRC_URI[md5sum] = "c669c91bf2f7e13a5d781c3dbb30fd8c"
-SRC_URI[sha256sum] = "d2c096cf654bf0061323a4b9231a1ef5b749a1e5c7c5bfe067e964219c2a851c"
+SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "61bfc1a478e840825f33ddb4057115e7"
+SRC_URI[sha256sum] = "d9c899f710c50cfdd00f5f4cdfeaef0687d8497362239bdde93bed6c909c81d7"
 
 UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
 
-inherit cmake distro_features_check lib_package
+inherit meson distro_features_check lib_package bash-completion
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-                   gbm"
+                   surfaceless-egl gbm"
 
 # virtual/libgl requires opengl in DISTRO_FEATURES.
 REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/${MLPREFIX}libgl', 'opengl', '', d)}"
 
 # I say virtual/libgl, actually wants gl.pc
-PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,-Dwaffle_has_glx=0,virtual/${MLPREFIX}libgl libx11"
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/${MLPREFIX}libgl libx11"
 
 # I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
 # DISTRO_FEATURE.
-PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,-Dwaffle_has_wayland=0,virtual/${MLPREFIX}libgl wayland"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/${MLPREFIX}libgl wayland"
 
 # I say virtual/libgl, actually wants gbm.pc egl.pc
-PACKAGECONFIG[gbm] = "-Dwaffle_has_gbm=1,-Dwaffle_has_gbm=0,virtual/${MLPREFIX}libgl udev"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled,virtual/${MLPREFIX}libgl udev"
 
 # I say virtual/libgl, actually wants egl.pc
-PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,-Dwaffle_has_x11_egl=0,virtual/${MLPREFIX}libgl libxcb"
+PACKAGECONFIG[x11-egl] = "-Dx11_egl=enabled,-Dx11_egl=disabled,virtual/${MLPREFIX}libgl libxcb"
+PACKAGECONFIG[surfaceless-egl] = "-Dsurfaceless_egl=enabled,-Dsurfaceless_egl=disabled,virtual/${MLPREFIX}libgl"
+
+# TODO: optionally build manpages and examples
-- 
2.20.1


