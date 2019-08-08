Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 17DBB7F265
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:11:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id s3so2967261wms.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QGJnc8HgxDjvC5VOhwQFgz8bLrmU7yZMQds3bYMJJ10=;
	b=Y8uhOMLNbOm/+DFfyGt/PbPT6I05dgrFQSDklzH/le89ZkKQ5Q7cHRd5MiLntELrRN
	zpgWwY3MXL8hssIcMaGnYwe8mnxy6v/exNN2Toqe0mwqcikPJoPci60ehTqPd+8xP/nE
	03CXbMJnaxBQe/YwdOIThwhphW+tXgeOtStlqfjIOlr+60VKDFzbYcl+sG3cWFOLCDi4
	zuAIt+VWM4dB1SyG0JODHM28rsPXRaugJqeQbWQUVfWf2h9fPemS2XDsvONW7odKFR/h
	mYrkTW1qBnlUS9uSGMv7vFXKU7n6XRVrAuIeBVymjERMaEq6GNXrLq0ej9KoEPWecBfK
	HMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QGJnc8HgxDjvC5VOhwQFgz8bLrmU7yZMQds3bYMJJ10=;
	b=bcR90q2Cl/bKhWVZRA1/QwC40A41eZ5cv9bukfprftiRenxpszAaFvVLo94vK+2HMJ
	QXOMcbaBUZfmTExG4qwm/W+bQLWrOdmE4mSX56H9ayz0VF1joLGdZRoidWh1kLvZqAkC
	8rDsBVrAJilUNbk7aO2qVYxkP2HKwWl636ldQmlVgzYFbgPtYl1pSQngOc8r4UyZyU86
	p+u0zhvaoqaGSVLYlpNbqwG5hww934rkJ8kR3YS3hKe0fCmuJvu5eza55UpycKtgCTXa
	Uu0ECAHkcA9jzKnsjY6J0wFLIzJIwSS77VpUT4sEuqs2DbM3E545gtrPjwVxHz8gXeIT
	RSQg==
X-Gm-Message-State: APjAAAVuHXuUIsUtdovcHNhKbaA4zBKTizvzzgzM8vjbrS1woK4wZicP
	DHd0iyYhbl8dqjZv/odxvusNC+D+ohg=
X-Google-Smtp-Source: APXvYqwT9PJqbOFCNxgVGj8t5j0bjWHbaeZ24vQ3c2m7G3xwvZTT8p3mjgxrDHR9ceMnJhdbe3JNUg==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr5135127wmj.11.1565280718524; 
	Thu, 08 Aug 2019 09:11:58 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	i66sm5499876wmi.11.2019.08.08.09.11.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 09:11:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:11:48 +0200
Message-Id: <20190808161150.44877-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808161150.44877-1-alex.kanavin@gmail.com>
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/7] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Thu, 08 Aug 2019 16:11:58 -0000

Rebase files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch

License-Update: clarified license for numpy/core/src/multiarray/dragon4.c (it is MIT)
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-and-so-on-for-libraries-by-default-.patch | 47 ++++++++-----------
 .../python-numpy/python-numpy.inc             |  8 ++--
 ...umpy_1.16.3.bb => python3-numpy_1.17.0.bb} |  0
 3 files changed, 24 insertions(+), 31 deletions(-)
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
  
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 43c3053cd88..c5d2a15ff21 100644
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
 
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-npy_cpu-Add-riscv-support.patch \
            ${CONFIGFILESURI} \
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


