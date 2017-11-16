Return-Path: <limon.anibal@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF1A7822A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 00:56:33 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a132so17326591oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 16:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vqqoFrYjH2u5sNTZWHSQEitjGT6I9pR2XvEsZVFJBzc=;
	b=OpD1jUXKDgpmOSeKWEbq09ygFs8dTYj7BxrTPjRUT6x+hzh6aHjzGd8FfY2kfuRFt8
	keLtn3QEljl4RpT1+TWkyv7RiOsB2Ig7ynyPQVJJ7uJKGd2BsDVu7OXrK4zIDBF3JVXP
	NsvWVS+iydr2gAC/9Un9goKk8Me4ijZ+Crw0P84C77ArKX1pAHb1qYHnqV05jOvteHWe
	lSRqYSK0fmA0gillKW7ZK1qSqd2vz1WYmrk8rm3RPs+c5UXz3zBT5vZHUAzH8vVDq7zu
	obYoYiFsjXgNj5z8DxMMHWSg+r4H34zH3szvZebcmahyYTalazB7NjMiLoK4k02SbWTn
	99Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vqqoFrYjH2u5sNTZWHSQEitjGT6I9pR2XvEsZVFJBzc=;
	b=O4Tp1lJhp+4Ssee/Srgc1p46q1gcebDcrgjzaBCh7Wr6Ii9STj0RA9qEMBTaYvYV8y
	fQBkkgArrR2snN84n5KctFxhghhaZXL4Lt3IOaAiBBrc1eTUys6I2v4guP3+94vs1eKn
	mkEqTsqOxHOjfl1m3OpaEcKcKgGSVBzAc4MOZsJ5U7afutxkssTIcSiTm6zK6vAJ8Gfm
	MlKzGI0uz2dB8feVMHy25t/snOLeo0M0suoD88BihKeCrYLKSQT3SzASxbTGr+Apm+uZ
	Ls+D8Ghipy0gqZFJEXuQYHeTjr7i0kfoKD22pBCX7ioYxZHqUlcLTXVKzJS3gECLTYVS
	jWbA==
X-Gm-Message-State: AJaThX5dZNjCAsbjc1bhkOLF2WAjK8D22n0t0LvUEzvk0nJd7kL3h5P7
	c9b0D52IFHEQ4gxRhv4+18IPAtBj
X-Google-Smtp-Source: AGs4zMZ9eFtan94bkFcD/3gVE5JQz8BIDOOShl7FSV8aJFBYOdWtEB2HTF1rU1noQDi3PBFIlCDxYA==
X-Received: by 10.202.56.86 with SMTP id f83mr10233578oia.108.1510793794652;
	Wed, 15 Nov 2017 16:56:34 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id 80sm2602278otj.75.2017.11.15.16.56.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 16:56:33 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 18:56:22 -0600
Message-Id: <20171116005622.25680-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][morty] python-3.3-multilib.patch: Fixes getpath on multilib configurations
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
X-List-Received-Date: Thu, 16 Nov 2017 00:56:34 -0000

From: Jose Lamego <jose.a.lamego@linux.intel.com>

When using multilib configurations either on arm/arm64 and x86/x86-64
python3 failed to execute due to a failure when looking for its
platform independent and dependent libraries.

This patch fixes this issue by assigning lib_python to the appropriate
macro.

[YOCTO #10812]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3/python-3.3-multilib.patch            | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 056e8e7631..860190340e 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -138,6 +138,15 @@ Index: Python-3.5.2/Modules/getpath.c
  
  /* Get file status. Encode the path to the locale encoding. */
  
+@@ -494,7 +502,7 @@ calculate_path(void)
+     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
+     _prefix = Py_DecodeLocale(PREFIX, NULL);
+     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
+-    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
++    lib_python = Py_DecodeLocale(LIB_PYTHON, NULL);
+ 
+     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
+         Py_FatalError(
 Index: Python-3.5.2/Python/getplatform.c
 ===================================================================
 --- Python-3.5.2.orig/Python/getplatform.c
@@ -185,7 +194,7 @@ Index: Python-3.5.2/setup.py
 ===================================================================
 --- Python-3.5.2.orig/setup.py
 +++ Python-3.5.2/setup.py
-@@ -492,7 +492,7 @@ class PyBuildExt(build_ext):
+@@ -495,7 +495,7 @@ class PyBuildExt(build_ext):
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -194,7 +203,7 @@ Index: Python-3.5.2/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -550,8 +550,7 @@ class PyBuildExt(build_ext):
+@@ -553,8 +553,7 @@ class PyBuildExt(build_ext):
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -204,7 +213,7 @@ Index: Python-3.5.2/setup.py
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -743,11 +742,11 @@ class PyBuildExt(build_ext):
+@@ -746,11 +745,11 @@ class PyBuildExt(build_ext):
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -268,7 +277,7 @@ Index: Python-3.5.2/configure.ac
 ===================================================================
 --- Python-3.5.2.orig/configure.ac
 +++ Python-3.5.2/configure.ac
-@@ -876,6 +876,41 @@ PLATDIR=plat-$MACHDEP
+@@ -883,6 +883,41 @@ PLATDIR=plat-$MACHDEP
  AC_SUBST(PLATDIR)
  AC_SUBST(PLATFORM_TRIPLET)
  
-- 
2.11.0


