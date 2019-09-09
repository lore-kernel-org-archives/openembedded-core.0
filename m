Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1880D7CE12
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 14:52:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j1so3732310qth.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=zRnZQvd0BM7qLB9idHGBoaBkgQLAwM79OLMzO09SAqw=;
	b=mOJLAiBQb3Uo5ufGeyuH16+nNlHAPS2QWbgiXrJMwzXu2wZWhoTYMMi9o5ZuXwaKYu
	LYsoXs8m3SHpY3xsF6ElHUY8A8h2oYDFFnj1BvB9AwqNM0FSYOEkEKr6C2RlF5CvCS0S
	uCh/hAmVkdzadP0lUaVFb9psyO93DqjWENEU0ikgWQkQ8z8NZLadsuN1+4XfFmxdDgW6
	GzEP844bofho2nME01hL02uhOEPXMhpXLJ91JQVT+PuOOrWewqBllxCxUWMryWNxSvut
	MZoKUxPtcbJCXw+YnLhDxb0SA45FHYzMU+bbWZm9B8lu662pKtALrzfvhPmb1r9e0ATK
	Lk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=zRnZQvd0BM7qLB9idHGBoaBkgQLAwM79OLMzO09SAqw=;
	b=PxS0gpCpD7BjwnOdJZiY2tw5Wf3WremQeazkcPenD/gObfnjTaemVM43r2CP7CSP1F
	c/7ZNNBZ3p6ErgZId8Ih3G/fRssE/2ydkrB6LRXnpWyEHvgDHF3w3IpqZQobBIHJbXs6
	qd2Tzgr1mJCdMZd5qdEmUKUooklxMu7B9LiFRtBd/mU4NmiVKFZe1VNwYUjGq5xkHAwj
	+OM+4Ov4unMDqKD2vx5HDeHSiMoyaPJmX5Bjy1n0L4mFRHfNqjlN3s4qMS0QVdGKgWhz
	yzVw9Zl3K+Z38wyfvfheEM53gvpSXjqj9rUYlK7X8YYO1jh2HgB4DGs3fvDAEb7gUyPw
	bOiw==
X-Gm-Message-State: APjAAAUhP02fDO9b5TFKtmnfr7r3ZBQbAOtdZMX4dfMe3x4so/2zHaNl
	6NAZsu7V/KAGitUvGSmw4U0ubmhxTW+ijg==
X-Google-Smtp-Source: APXvYqwKsIhzbZNsh788lNOmxWUmOc2RsTDfIK4B8AfbuQzv9aHTud6/PIMowqDA8DGzv4tVTZHXKw==
X-Received: by 2002:a0c:98b8:: with SMTP id f53mr9937180qvd.157.1568040724649; 
	Mon, 09 Sep 2019 07:52:04 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id g25sm6134913qtr.7.2019.09.09.07.52.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 07:52:04 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2019 11:51:47 -0300
Message-Id: <20190909145147.20573-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Mon, 09 Sep 2019 14:52:04 -0000
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio@ossystems.com.br>

  - Add python3 to DEPENDS: mesa commit cb3072488c changed function
    that verifies python installation and to this new function works
    we need to have Python3 in DEPENDS.

This is a bugfix only set of releases. Check following links for the
relevant release notes:

  - https://www.mesa3d.org/relnotes/19.1.2.html
  - https://www.mesa3d.org/relnotes/19.1.3.html
  - https://www.mesa3d.org/relnotes/19.1.4.html
  - https://www.mesa3d.org/relnotes/19.1.5.html
  - https://www.mesa3d.org/relnotes/19.1.6.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...k-for-all-linux-host_os-combinations.patch | 37 +++++++------------
 ...on.build-make-TLS-GLX-optional-again.patch | 12 +++---
 ...Allow-enable-DRI-without-DRI-drivers.patch | 10 ++---
 .../{mesa-gl_19.1.1.bb => mesa-gl_19.1.6.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 .../mesa/{mesa_19.1.1.bb => mesa_19.1.6.bb}   |  4 +-
 6 files changed, 25 insertions(+), 40 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.1.bb => mesa-gl_19.1.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.1.bb => mesa_19.1.6.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 0064dc643c..9fba5da4b2 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,7 +1,7 @@
-From da6b9188f29942684d4262f0c6264d09bb6fe7de Mon Sep 17 00:00:00 2001
+From ea966884e39aae9571c038fab55f3c1663d17850 Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Wed, 12 Jun 2019 13:40:20 -0300
-Subject: [PATCH 1/3] meson.build: check for all linux host_os combinations
+Subject: [PATCH] meson.build: check for all linux host_os combinations
 Organization: O.S. Systems Software LTDA.
 
 Make sure that we are also looking for our host_os combinations like
@@ -13,41 +13,30 @@ Upstream-Status: Pending
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
- meson.build | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 8ab8a550f56..e11880f2902 100644
+index 567a81afd6f..b33b430aed4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -34,6 +34,8 @@ cpp = meson.get_compiler('cpp')
- 
- null_dep = dependency('', required : false)
- 
-+system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
-+
- # Arguments for the preprocessor, put these in a separate array from the C and
- # C++ (cpp in meson terminology) arguments since they need to be added to the
- # default arguments for both C and C++.
-@@ -107,8 +109,6 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+@@ -107,7 +107,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi = get_option('shared-glapi') and with_any_opengl
  
--system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'linux'].contains(host_machine.system())
--
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux'].contains(host_machine.system())
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+ 
  dri_drivers = get_option('dri-drivers')
  if dri_drivers.contains('auto')
-   if system_has_kms_drm
-@@ -836,7 +836,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
+@@ -845,7 +845,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
  endif
  
  # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu'].contains(host_machine.system())
-+if ['cygwin', 'gnu'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+-if ['linux', 'cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system())
++if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) or host_machine.system().startswith('linux')
    pre_args += '-D_GNU_SOURCE'
  endif
  
--- 
-2.22.0
-
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
index 81454aaa29..641bacf1d9 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
@@ -1,7 +1,7 @@
-From d31718999797ffc4dd177d14760ef7b8fd95ac2f Mon Sep 17 00:00:00 2001
+From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Wed, 12 Jun 2019 14:15:57 -0300
-Subject: [PATCH 2/3] meson.build: make TLS GLX optional again
+Subject: [PATCH] meson.build: make TLS GLX optional again
 Organization: O.S. Systems Software LTDA.
 
 This was optional with autotools, and needs to be disabled
@@ -11,16 +11,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  meson.build       | 4 +++-
  meson_options.txt | 7 +++++++
  2 files changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index e11880f2902..7a07974ba61 100644
+index b33b430aed4..0e50bb26c0a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -362,7 +362,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless)
+@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
    endif
  endif
  
@@ -49,6 +50,3 @@ index 1f72faabee8..fcd49efea27 100644
  option(
    'I-love-half-baked-turnips',
    type : 'boolean',
--- 
-2.22.0
-
diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index 0f254a1d91..3458c19199 100644
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -1,20 +1,21 @@
-From 417ff3a03313aa003244990ed5c0188c421e6181 Mon Sep 17 00:00:00 2001
+From f1482e88c2295b9c7288f5b273335a8e18039de8 Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Wed, 12 Jun 2019 14:18:31 -0300
-Subject: [PATCH 3/3] Allow enable DRI without DRI drivers
+Subject: [PATCH] Allow enable DRI without DRI drivers
 Organization: O.S. Systems Software LTDA.
 
 Upstream-Status: Pending
 
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  meson.build       | 2 +-
  meson_options.txt | 6 ++++++
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 7a07974ba61..5c7cbe38376 100644
+index 0e50bb26c0a..de065c290d6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -137,7 +137,7 @@ with_dri_r200 = dri_drivers.contains('r200')
@@ -43,6 +44,3 @@ index fcd49efea27..0529200b3bb 100644
  option(
    'dri-drivers',
    type : 'array',
--- 
-2.22.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f916e553c9..210a7b6b0a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.1.bb b/meta/recipes-graphics/mesa/mesa_19.1.6.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.1.6.bb
index 1d5d00f73e..19221e9e25 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.1.6.bb
@@ -6,8 +6,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "07cd8cd79de28ec1a374ee3a06e47789"
-SRC_URI[sha256sum] = "72114b16b4a84373b2acda060fe2bb1d45ea2598efab3ef2d44bdeda74f15581"
+SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
+SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.20.1


