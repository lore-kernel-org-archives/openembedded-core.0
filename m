Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B7ED97D933
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 4so20052456wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qx+UqOEFbYqG0R21uLe9n8NGWSk9nExG/1GG9uh9/50=;
	b=Z5K0yV3Zk+ucq8zd2Zv5sJgwxJ6nTJnXMzNRqEfooIGEbaa+OL/rBhwAOvv8e4nlAa
	XB5lHMchM2swgq3HiligKtrbeGmm2kIzrPwuScDW8D9ftUNFssS7iNwxRX73sLg9Yc4Z
	JEXEBEt/s3F9xgCqxineTqRJvF3sXgKujq2bc+nOSkmAVseHymg6dVnQENnhji1f57UF
	qHACBI+63R4dMB856m16+8f0r0AWU42IFiuoY6IShFmLypC/N1MG7WVV8cCnECLMBT/1
	vSc/OUKx+aLJI6VKCiPTcreIuY0NQwXfKl2hKfSL8l7MMi0uT38nlJWBckqTCbI2wLB0
	ViYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qx+UqOEFbYqG0R21uLe9n8NGWSk9nExG/1GG9uh9/50=;
	b=JAjCxMoJPr2RN8aVN+w7P8P2lqi8/ybq1hUb3tC821mOJJ77HXwTsD6RRTz/8LuBdh
	TKiytCMGu5WjR7x5MyDLmAz2BnzBLnFh/FufrjTHj7PV5NyOkhs+A7EuXPnIL7Aa5lGG
	YrtrFaX9acRcngDi67X/FoZ0lUfXRvRGQ99cWUqYPXbCGPzr0bByWlbNe/jhAEeODDrk
	SnWdsn9PXyY1fB3HSrairgpCHyozKfzjVgr5z7m2uts4mfPIv68rC/KrhW1a3mbxSxil
	LjwnKhwZ2OOgE/lLbyn0KdPTZqONQdUQUt1OVWk4jhBQXLoFjRgixsCCh0Rxqa3kF9sN
	K/kQ==
X-Gm-Message-State: APjAAAVDubHrFTuegFZdRoS8K06FkTgmuK8ON9oRgTTqyJUTuMX5x64P
	opmlqtltZtNJyeAPBlfzY/aSVmSFBJc=
X-Google-Smtp-Source: APXvYqyr7rohYbq/PVPKk/yXPOVtom49TLVj3ouXNBTmOdBCP2QtcTFI7BsrIEmmDesrGLBUHD76eg==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr22442213wml.110.1555325722214; 
	Mon, 15 Apr 2019 03:55:22 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:57 +0200
Message-Id: <20190415105457.57067-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/19] python-numpy: update to 1.16.2
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:22 -0000

Drop files/fix_shebang_f2py.patch as the code has been removed upstream.

License-update: copyright years, file paths.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-and-so-on-for-libraries-by-default-.patch | 16 +++++-----
 .../0001-npy_cpu-Add-riscv-support.patch      | 14 ++++-----
 .../python-numpy/files/fix_shebang_f2py.patch | 29 -------------------
 .../python-numpy/python-numpy.inc             | 10 +++----
 ...numpy_1.14.5.bb => python-numpy_1.16.2.bb} |  0
 ...umpy_1.14.5.bb => python3-numpy_1.16.2.bb} |  1 +
 6 files changed, 18 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.14.5.bb => python-numpy_1.16.2.bb} (100%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.14.5.bb => python3-numpy_1.16.2.bb} (97%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 516ccd7b9bd..8fe0d1a27ee 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,7 +1,8 @@
-From c8c6649b29a08f82e1d6761a6d62ce5f632313c5 Mon Sep 17 00:00:00 2001
+From c14554c7e2fff8dd559dfb41e7dd11392c6f85e3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
-Subject: [PATCH 1/3] Don't search /usr and so on for libraries by default to
+Subject: [PATCH] Don't search /usr and so on for libraries by default to
+
  avoid host contamination.
 
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
@@ -9,16 +10,16 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- numpy/distutils/system_info.py | 50 +++++-------------------------------------
+ numpy/distutils/system_info.py | 50 ++++------------------------------
  1 file changed, 6 insertions(+), 44 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index bea120c..544e056 100644
+index 2424943..bf56a6d 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -262,51 +262,13 @@ if sys.platform == 'win32':
+@@ -274,51 +274,13 @@ if sys.platform == 'win32':
              add_system_root(os.path.join(conda_dir, 'Library'))
-                         
+ 
  else:
 -    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib', '/usr/lib',
 -                                 '/opt/local/lib', '/sw/lib'], platform_bits)
@@ -74,6 +75,3 @@ index bea120c..544e056 100644
  
  if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
      default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch b/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
index 4f5c4f5f0da..4decfe66ee1 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
@@ -1,21 +1,20 @@
-From 30fb1bf9244bb0789c02ec7c98a923acc7200206 Mon Sep 17 00:00:00 2001
+From 629891f67601275c9c4de0bb01afcf1a8c44fa3f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Mar 2018 19:55:21 -0700
 Subject: [PATCH] npy_cpu: Add riscv support
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/10761]
-
+---
  numpy/core/include/numpy/npy_cpu.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 84653ea18..9e88db873 100644
+index 5edd8f4..e1e4796 100644
 --- a/numpy/core/include/numpy/npy_cpu.h
 +++ b/numpy/core/include/numpy/npy_cpu.h
-@@ -78,6 +78,8 @@
-     #define NPY_CPU_AARCH64
+@@ -96,6 +96,8 @@
+     #define NPY_CPU_OR1K
  #elif defined(__mc68000__)
      #define NPY_CPU_M68K
 +#elif defined(__riscv)
@@ -23,6 +22,3 @@ index 84653ea18..9e88db873 100644
  #elif defined(__arc__) && defined(__LITTLE_ENDIAN__)
      #define NPY_CPU_ARCEL
  #elif defined(__arc__) && defined(__BIG_ENDIAN__)
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch b/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
deleted file mode 100644
index 8be6e4d21f9..00000000000
--- a/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Avoids using python from the HOSTs native sysroot for f2py,
-uses TARGET env python instead.
-
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
-Index: numpy-1.11.0/numpy/f2py/setup.py
-===================================================================
---- numpy-1.11.0.orig/numpy/f2py/setup.py
-+++ numpy-1.11.0/numpy/f2py/setup.py
-@@ -37,10 +37,13 @@ def _get_f2py_shebang():
-     should be ``#!python`` rather than ``#!`` followed by the contents of
-     ``sys.executable``.
-     """
--    if set(('bdist_wheel', 'bdist_egg', 'bdist_wininst',
--            'bdist_rpm')).intersection(sys.argv):
--        return '#!python'
--    return '#!' + sys.executable
-+    #if set(('bdist_wheel', 'bdist_egg', 'bdist_wininst',
-+    #        'bdist_rpm')).intersection(sys.argv):
-+    #    return '#!python'
-+    #return '#!' + sys.executable
-+    
-+    # On OE, we need to avoid using the HOSTs python-native, we return env python instead
-+    return '#!/usr/bin/env python'
- 
- 
- def configuration(parent_package='', top_path=None):
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 1b51f7baaf2..43c8960a184 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -1,17 +1,17 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc53b33304171d132128ebe82ea4a645"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d26bde5432613cce2334b93985576231"
 
 SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://fix_shebang_f2py.patch \
            file://0001-npy_cpu-Add-riscv-support.patch \
-           ${CONFIGFILESURI} "
-SRC_URI[md5sum] = "e3189ee851c3a0e2e6e4c6e80a711ec8"
-SRC_URI[sha256sum] = "1b4a02758fb68a65ea986d808867f1d6383219c234aef553a8741818e795b529"
+           ${CONFIGFILESURI} \
+           "
+SRC_URI[md5sum] = "4fc754be7ec3e0f80b042d907e99f4ad"
+SRC_URI[sha256sum] = "8088221e6e27da8d5907729f0bfe798f526836f22cc59ae83a0f867e67416a3e"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.14.5.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.14.5.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.16.2.bb
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.14.5.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.16.2.bb
similarity index 97%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.14.5.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.16.2.bb
index 915e6f8c2b3..d388e88d25e 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.14.5.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.16.2.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-numpy.inc
+
-- 
2.17.1


