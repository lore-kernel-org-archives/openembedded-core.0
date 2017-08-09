Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBEA77D48
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:19:33 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id v189so28665109pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DvFYMc8q+xnXn7Q4vrCLAHgZAmc1kwEtl0mdZ7uF1Xs=;
	b=WeJeFtviwdU8mcXWinfZgH+SlSYfg9mDcohnMbfZVQi6/fdz6yS/4hQBey2LNuXaFe
	oq0Ww8JpHDtrRaHlnEtCbOg92QxpLnWLXuy5pedR02RRU/TVtqmQCErdwBszCiW17X3d
	tBZcnLsgIC7C7B/8+N6bWtaRKM0YenStyNFeHA4OZ9CMn8Tzp+4wusx5YZg4RwdphU1g
	NKwkpBI/HJFg59hkaeQQMUilNB+lY6VBvUeWDS1DYDEkBvyRRHUk8D129yuVLGHTdTyT
	ZwSmuf/EoMuGbznvTdLbhuXjICxj7MDjsjew/s8t323qkIvbFQuw6eYjZ/zFOfPzRBsH
	hKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DvFYMc8q+xnXn7Q4vrCLAHgZAmc1kwEtl0mdZ7uF1Xs=;
	b=G3eESdavpSv+cYiWWVyem+AXOofvfNeI2dJx+BzI9Woc4sUaMhRlaLnCAMFGKiDEhk
	fSnHfBHkS/mzPUxXQaz5TAaigqDWoScq4k1962ZxuMFBZ/vHAqT3aZ70h8TrdV99L2Te
	u7stVHfXc2zffNtWg1JbdBuUp736I5XnrBblExec3KPP4X5QiUfZlbwC/cqmf6/mBNk3
	c7cf80S/Wn+OeJpzEiiuGxDD7/Y33n4m59HjNHDd5+koEJKeRyfa4yByOYOlnjG93pBW
	qcgQP+iQqxx9PKNFcwk/oJBvYcZO1THIZBaHimq55cHFO43DvJoQUacEdKUvgnoTukmZ
	kwng==
X-Gm-Message-State: AHYfb5gPLCpk4R5GUiGU0RWZvI99HpCoPmRSl2ScsleYOwZmwit2MDjo
	SIOrlEpvlOuUtyMI
X-Received: by 10.98.215.21 with SMTP id b21mr8552475pfh.120.1502288374725;
	Wed, 09 Aug 2017 07:19:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id
	s89sm9342832pfe.155.2017.08.09.07.19.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:19:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 07:19:21 -0700
Message-Id: <20170809141922.2603-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170809141922.2603-1-raj.khem@gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
Subject: [PATCH 3/4] python-numpy: Upgrade to 1.13.1
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
X-List-Received-Date: Wed, 09 Aug 2017 14:19:33 -0000

Update LICENSE to BSD-3-Clause as per
https://github.com/numpy/numpy/blob/master/LICENSE.txt

LIC_FILES_CHKSUM changed due to copyright year change see
https://github.com/numpy/numpy/commit/b2ff4f13197dd58508d3d025a9034519974750bd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...h-usr-and-so-on-for-libraries-by-default-.patch | 24 +++++++++-------------
 ...thon-numpy_1.11.2.bb => python-numpy_1.13.1.bb} | 15 +++++++-------
 ...on3-numpy_1.11.2.bb => python3-numpy_1.13.1.bb} | 14 ++++++-------
 3 files changed, 25 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.11.2.bb => python-numpy_1.13.1.bb} (86%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.11.2.bb => python3-numpy_1.13.1.bb} (87%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 5b134edf07..ffd6ced136 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  numpy/distutils/system_info.py | 50 +++++-------------------------------------
  1 file changed, 6 insertions(+), 44 deletions(-)
 
-diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index 9dd48e2..80e197a 100644
---- a/numpy/distutils/system_info.py
-+++ b/numpy/distutils/system_info.py
-@@ -204,51 +204,13 @@ if sys.platform == 'win32':
+Index: numpy-1.13.1/numpy/distutils/system_info.py
+===================================================================
+--- numpy-1.13.1.orig/numpy/distutils/system_info.py
++++ numpy-1.13.1/numpy/distutils/system_info.py
+@@ -211,51 +211,13 @@ if sys.platform == 'win32':
      default_x11_lib_dirs = []
      default_x11_include_dirs = []
  else:
@@ -29,7 +29,10 @@ index 9dd48e2..80e197a 100644
 -                            '/opt/local/include', '/sw/include',
 -                            '/usr/include/suitesparse']
 -    default_src_dirs = ['.', '/usr/local/src', '/opt/src', '/sw/src']
--
++    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
++    default_include_dirs = ['/deaddir/include']
++    default_src_dirs = ['.', '/deaddir/src']
+ 
 -    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
 -                                     '/usr/lib'], platform_bits)
 -    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include',
@@ -50,7 +53,7 @@ index 9dd48e2..80e197a 100644
 -        # tests are run in debug mode Python 3.
 -        tmp = open(os.devnull, 'w')
 -        p = sp.Popen(["gcc", "-print-multiarch"], stdout=sp.PIPE,
--                stderr=tmp)
+-                     stderr=tmp)
 -    except (OSError, DistutilsError):
 -        # OSError if gcc is not installed, or SandboxViolation (DistutilsError
 -        # subclass) if an old setuptools bug is triggered (see gh-3160).
@@ -64,15 +67,8 @@ index 9dd48e2..80e197a 100644
 -    finally:
 -        if tmp is not None:
 -            tmp.close()
-+    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
-+    default_include_dirs = ['/deaddir/include']
-+    default_src_dirs = ['.', '/deaddir/src']
-+
 +    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
 +    default_x11_include_dirs = ['/deaddir/include']
  
  if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
      default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
--- 
-2.6.2
-
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
similarity index 86%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
index c4bc354036..63821d30fa 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
@@ -1,16 +1,20 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7e51a5677b22b865abbfb3dff6ffb2d0"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1002b09cd654fcaa2dcc87535acd9a96"
 
 SRCNAME = "numpy"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
            ${CONFIGFILESURI} "
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/numpy/files/"
+
+SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
+SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93"
+
+UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 
 CONFIGFILESURI ?= ""
 
@@ -81,9 +85,6 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "03bd7927c314c43780271bf1ab795ebc"
-SRC_URI[sha256sum] = "04db2fbd64e2e7c68e740b14402b25af51418fc43a59d9e54172b38b906b0f69"
-
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python-unittest \
                   python-difflib \
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
similarity index 87%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
index d5fe50c36f..0bf9e914f9 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
@@ -1,16 +1,19 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7e51a5677b22b865abbfb3dff6ffb2d0"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1002b09cd654fcaa2dcc87535acd9a96"
 
 SRCNAME = "numpy"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
            ${CONFIGFILESURI} "
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/numpy/files/"
+SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
+SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93"
+
+UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 
 CONFIGFILESURI ?= ""
 
@@ -81,9 +84,6 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "03bd7927c314c43780271bf1ab795ebc"
-SRC_URI[sha256sum] = "04db2fbd64e2e7c68e740b14402b25af51418fc43a59d9e54172b38b906b0f69"
-
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python3-unittest \
                   python3-difflib \
-- 
2.14.0


