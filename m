Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id F2C7561A16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:14:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c84so5956779wme.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P4HCJTcbcoRTEDRfQlblsFg75n9AOidX5mSlZbbdysE=;
	b=lzLen8swb13hWPsLTimkBckohLKHfO2n/2eESBi2l5vDjoOyAaIF7xgW8Jg0NFcGA+
	QMnUM3208dbkNHOZ16mAJN794/YO8bTJ7y2oLJRvvOL6WuOnpiLnkw4iHkamZDqDnSBp
	hH1M9nv27+3dGCneMCaVoV+iwfAges8bNZl78Xz4/H9S6XANyy8odKdB7XatSR6cH7C8
	TpUhH2tDLw4e42xUOU8O/Qo2YW0r2oO4o+Pe5GannJZa1R85Ab2obcl+sohjN5MkZ+0i
	+0DVRn1IKk5tMHxTjWmoJouDioyEWOaQ0UCy6RbpFLr1TdbMOAGgfCoo/ar1LDmUck+l
	9CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P4HCJTcbcoRTEDRfQlblsFg75n9AOidX5mSlZbbdysE=;
	b=l9uKrx8gVuwj1nMIXUqvsfaThooPv3KV8Nt6sdUgA/dqu7ii4fPjyvVmyanZmy/Z/l
	UHQhzu9I4gt6UUVSrTxy+sSn2WbtiTdBUtvF2TUvOjVOIoFG5H//Y8DDMGDvchMrny6M
	dATEXNzNyjT4U48eXxCTFu7wu7heF3grHx8hOYD4iQ/xgluY0y0HF/oxnNxGRolXyOPE
	H8Rvcmag4qZpKVKNRoAJzZWbwAeQimc5oRtZ/5xwNjh6o14HT+iHnWGYLlD6iT7btRS+
	0d1zT5/XEMmoNi8ktecP6P9QtUeNs3oNONiFYtg72MHEw/ftcl1+CvNRFS4ulLALrg4u
	OZJQ==
X-Gm-Message-State: APjAAAU85i+L9kE+Hnkk81yOVd18WH7i35qMpBZKMK/Vz7UPF0s6XSf4
	wvIj7VrggGaiIk/QnAP++hJc1Phi
X-Google-Smtp-Source: APXvYqzOgmk3Ex0LWtKhFfhLfQpW05xZiuBi8ANGaavekhRL6JUpYXvyefOc98PEyDFYSXlTPnaKdg==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr9439144wmc.111.1582971291969;
	Sat, 29 Feb 2020 02:14:51 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	a13sm16845564wrp.93.2020.02.29.02.14.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 02:14:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 11:14:32 +0100
Message-Id: <20200229101433.30787-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH 1/2] piglit: move to meta-oe
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
X-List-Received-Date: Sat, 29 Feb 2020 10:14:52 -0000
Content-Transfer-Encoding: 8bit

This recipe is build-heavy, yet is not part of any images and isn't runtime tesed as
part of oe-core. There's no evidence of anyone using it, as all
commits are revision updates. It also pulls in NumPy, which is also
a significant support item, and wouldn't otherwise be part of core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...-bash-completions-in-the-right-place.patch | 35 ----------
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch | 32 ----------
 meta/recipes-graphics/piglit/piglit_git.bb    | 64 -------------------
 4 files changed, 132 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 10095ffe76..97860676cc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -551,7 +551,6 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-pixman = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
deleted file mode 100644
index e07e810a73..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-cmake-install-bash-completions-in-the-right-place.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 26faa2c157a27a18a9f767976730fe0c115e3af4 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 13 Jul 2016 19:19:02 +0300
-Subject: [PATCH] cmake: install bash-completions in the right place
-
-The completionsdir variable is a full path and should not be
-prefixed.
-
-This does mean the files may be installed outside of
-CMAKE_INSTALL_PREFIX -- the alternative is more difficult and
-means that bash completion files may be installed where
-bash-completion can't find them.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [mailing list]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8e2abba..784a8f9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -532,7 +532,7 @@ install (
- if (BASH_COMPLETION_FOUND)
- 	install(
- 		FILES completions/bash/piglit
--		DESTINATION ${CMAKE_INSTALL_PREFIX}/${BASH_COMPLETION_COMPLETIONSDIR}/
-+		DESTINATION ${BASH_COMPLETION_COMPLETIONSDIR}/
- 	)
- endif (BASH_COMPLETION_FOUND)
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
deleted file mode 100644
index 5d6ec368ba..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3bf1beee1ddd19bc536ff2856e04ac269d43daa2 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Thu, 4 Oct 2018 14:43:17 +0200
-Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
-
-WAYLAND_wayland-client_INCLUDEDIR is an internal variable and is not correctly
-set when cross compiling. WAYLAND_INCLUDE_DIRS includes the correct path even
-when cross compiling.
-
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
-Upstream-Status: Submitted [piglit@lists.freedesktop.org]
----
- tests/util/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index a5f080156..a303a9f58 100644
---- a/tests/util/CMakeLists.txt
-+++ b/tests/util/CMakeLists.txt
-@@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
- 			piglit-framework-gl/piglit_wl_framework.c
- 		)
- 		list(APPEND UTIL_GL_INCLUDES
--			${WAYLAND_wayland-client_INCLUDEDIR}
-+			${WAYLAND_INCLUDE_DIRS}
- 		)
- 	endif()
- 	if(PIGLIT_HAS_X11)
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
deleted file mode 100644
index 58d10d6b9b..0000000000
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY = "OpenGL driver testing framework"
-DESCRIPTION = "Piglit is an open-source test suite for OpenGL and OpenCL \
-implementations."
-LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
-
-SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
-           file://0001-cmake-install-bash-completions-in-the-right-place.patch \
-           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
-           "
-UPSTREAM_CHECK_COMMITS = "1"
-
-SRCREV = "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
-# (when PV goes above 1.0 remove the trailing r)
-PV = "1.0+gitr${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
-X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
-
-DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl"
-
-inherit cmake pkgconfig python3native features_check bash-completion
-
-# depends on virtual/libgl
-REQUIRED_DISTRO_FEATURES += "opengl"
-
-# The built scripts go into the temporary directory according to tempfile
-# (typically /tmp) which can race if multiple builds happen on the same machine,
-# so tell it to use a directory in ${B} to avoid overwriting.
-export TEMP = "${B}/temp/"
-do_compile[dirs] =+ "${B}/temp/"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
-PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
-
-
-do_configure_prepend() {
-   if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
-        sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit/glut_wrap.h
-        sed -i -e "/^#.*include.*<GL\/glut.h>$/d" ${S}/src/piglit/glut_wrap.h
-   fi
-}
-
-# Forcibly strip because Piglit is *huge*
-OECMAKE_TARGET_INSTALL = "install/strip"
-
-RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
-	python3-misc \
-	python3-unixadmin python3-xml python3-multiprocessing \
-	python3-six python3-shell python3-io \
-	python3-netserver bash \
-	"
-
-INSANE_SKIP_${PN} += "dev-so already-stripped"
-
-# As nothing builds against Piglit we don't need to have anything in the
-# sysroot, especially when this is ~2GB of test suite
-SYSROOT_DIRS_remove = "${libdir}"
-
-# Can't be built with ccache
-CCACHE_DISABLE = "1"
-- 
2.25.1


