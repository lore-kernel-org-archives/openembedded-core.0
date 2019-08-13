Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5887E993
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:24:22 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z1so108660739wru.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VHFiAdNf3GGBhxGkaRN1izNv7a7QvolK8kwVMb8rn9E=;
	b=FWjAEp7Rd6sXOcyPAYnb0YEJJK0tk6ze9v3U/M91dodMkyfPG9FY8Uc29lNxWmOvi/
	mELauU54JWDP51vF+efwNKEZTrEnPvRuoQAOimECAMQSxVU64x5CX0lSNvAkwqDcoWNd
	wJ+Vpbm+o0R1QWhcXY0e+RwWStv5kMXc9Zt0MvXUkLtBoNuNv/jaKqTY7DylvodDIuDl
	SRHgd1ICS5H/EjJmfLApZnIKUCVZOs2deIvCAG6YTMPpF+ICRhiYVY0+8QF0q7WHumac
	DuG8BkmlOO08pzETBK0QoNu2+SfkHGFHx5++6hR6ZyGGaBiS1d7DQlMKJ5tc4zcXvI4h
	00Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VHFiAdNf3GGBhxGkaRN1izNv7a7QvolK8kwVMb8rn9E=;
	b=LQwBgoKgvV0iAd/O99u7TtPIOPBinO6i3FmiOUsayiPKOnskIN4uvR1vvduXKy++nm
	Z+gx8sopKqb6LR9R2mU1pHEf4j5Vp9OybVhNPoLOHFWutLxJClLQJOU6PkweIUBdqQdp
	rJoWfT094IsMH0vyKAWle6dfmWVerMjsdAt8df36bQtEge+oETMSIW31+xVRFSHCGFl6
	LF41a++OP3cPb1ItAaTEagDuWU4ItsIH4Jbdn+bWWIY/nlAmbkdJy6p/PlDWReYgylHR
	iI1dtrpnLky/ZGiamE7qSeWOKbgkqnShqjm24MrhEXx//wUD3+rcll8eytoGClUSGOFo
	KxUA==
X-Gm-Message-State: APjAAAWXKwlFVMjfmwz2F7AbFidWnVLfFn7ni8bSlfpxBDcear8p1zPG
	AQ8bteazgpUUBA4mYjshH1iOr2ZOiEk=
X-Google-Smtp-Source: APXvYqyq8bdiO//RnNhKwmS7ugvThVRgr5zcRAePn8n6KOFHaodPb57RUjAMWGtHau2stLK1KrcmBw==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr45547298wrt.278.1565720662756; 
	Tue, 13 Aug 2019 11:24:22 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c6sm3218230wma.25.2019.08.13.11.24.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:24:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:24:12 +0200
Message-Id: <20190813182414.2952-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813182414.2952-1-alex.kanavin@gmail.com>
References: <20190813182414.2952-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Tue, 13 Aug 2019 18:24:22 -0000

Rebase files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch

License-Update: clarified license for numpy/core/src/multiarray/dragon4.c (it is MIT)
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-and-so-on-for-libraries-by-default-.patch | 47 ++++++++-----------
 ...up.py-remove-the-detection-of-x86-ta.patch | 32 +++++++++++++
 .../python-numpy/python-numpy.inc             |  9 ++--
 ...umpy_1.16.3.bb => python3-numpy_1.17.0.bb} |  0
 4 files changed, 57 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.16.3.bb => python3-numpy_1.17.0.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 8fe0d1a27ee..98a97058312 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From c14554c7e2fff8dd559dfb41e7dd11392c6f85e3 Mon Sep 17 00:00:00 2001
+From 672a75c8417ce08db9e31fc415ec445479231d5a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -10,14 +10,14 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- numpy/distutils/system_info.py | 50 ++++------------------------------
- 1 file changed, 6 insertions(+), 44 deletions(-)
+ numpy/distutils/system_info.py | 42 ++++------------------------------
+ 1 file changed, 5 insertions(+), 37 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index 2424943..bf56a6d 100644
+index ba2b1f4..f94dce1 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -274,51 +274,13 @@ if sys.platform == 'win32':
+@@ -278,45 +278,13 @@ if sys.platform == 'win32':
              add_system_root(os.path.join(conda_dir, 'Library'))
  
  else:
@@ -45,31 +45,24 @@ index 2424943..bf56a6d 100644
 -            default_x11_include_dirs.extend(['/usr/lib/X11/include',
 -                                             '/usr/include/X11'])
 -
--    import subprocess as sp
--    tmp = None
--    try:
--        # Explicitly open/close file to avoid ResourceWarning when
--        # tests are run in debug mode Python 3.
--        tmp = open(os.devnull, 'w')
--        p = sp.Popen(["gcc", "-print-multiarch"], stdout=sp.PIPE,
--                     stderr=tmp)
--    except (OSError, DistutilsError):
--        # OSError if gcc is not installed, or SandboxViolation (DistutilsError
--        # subclass) if an old setuptools bug is triggered (see gh-3160).
--        pass
--    else:
--        triplet = str(p.communicate()[0].decode().strip())
--        if p.returncode == 0:
--            # gcc supports the "-print-multiarch" option
--            default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
--            default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
--    finally:
--        if tmp is not None:
--            tmp.close()
+-    with open(os.devnull, 'w') as tmp:
+-        try:
+-            p = subprocess.Popen(["gcc", "-print-multiarch"], stdout=subprocess.PIPE,
+-                         stderr=tmp)
+-        except (OSError, DistutilsError):
+-            # OSError if gcc is not installed, or SandboxViolation (DistutilsError
+-            # subclass) if an old setuptools bug is triggered (see gh-3160).
+-            pass
+-        else:
+-            triplet = str(p.communicate()[0].decode().strip())
+-            if p.returncode == 0:
+-                # gcc supports the "-print-multiarch" option
+-                default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
+-                default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
 +    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
 +    default_include_dirs = ['/deaddir/include']
 +    default_src_dirs = ['.', '/deaddir/src']
-+
+ 
 +    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
 +    default_x11_include_dirs = ['/deaddir/include']
  
diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch b/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
new file mode 100644
index 00000000000..ebb2a6f9df1
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
@@ -0,0 +1,32 @@
+From b881e0b2ba9cf1a4aa351a1c1ea90b1e1776ce21 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 12 Aug 2019 15:37:36 +0200
+Subject: [PATCH] numpy/random/setup.py: remove the detection of x86 targets
+ via uname()
+
+This was badly breaking compilation for ARM targets (and possibly
+other non-x86 targets); if -msse2 is desirable for x86 builds it has
+to be passed through another channel.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ numpy/random/setup.py | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/numpy/random/setup.py b/numpy/random/setup.py
+index a1bf3b8..60fb534 100644
+--- a/numpy/random/setup.py
++++ b/numpy/random/setup.py
+@@ -49,11 +49,6 @@ def configuration(parent_package='', top_path=None):
+     elif not is_msvc:
+         # Some bit generators require c99
+         EXTRA_COMPILE_ARGS += ['-std=c99']
+-        INTEL_LIKE = any([val in k.lower() for k in platform.uname()
+-                          for val in ('x86', 'i686', 'i386', 'amd64')])
+-        if INTEL_LIKE:
+-            # Assumes GCC or GCC-like compiler
+-            EXTRA_COMPILE_ARGS += ['-msse2']
+ 
+     # Use legacy integer variable sizes
+     LEGACY_DEFS = [('NP_RANDOM_LEGACY', '1')]
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 43c3053cd88..98405fee12a 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -1,7 +1,7 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d26bde5432613cce2334b93985576231"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a32aba007a415aa8a1c708a0e2b86a1"
 
 SRCNAME = "numpy"
 
@@ -9,9 +9,10 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-npy_cpu-Add-riscv-support.patch \
            ${CONFIGFILESURI} \
+           file://0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch \
            "
-SRC_URI[md5sum] = "0886e5b5017f08f2b7a624c0b5931e61"
-SRC_URI[sha256sum] = "adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f"
+SRC_URI[md5sum] = "c48b2ad785f82cdfe28c907ce35e2a71"
+SRC_URI[sha256sum] = "47b7b6145e7ba5918ce26be25999b6d4b35cf9fbfdf46b7da50090ffdb020445"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.17.0.bb
-- 
2.17.1


