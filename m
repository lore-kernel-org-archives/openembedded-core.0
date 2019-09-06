Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 253D06C42C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 18:47:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d26so6682665qkk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=vsRqY6NSv4BvQxnw8EyFsAcsjbZk6C2d8RyK0t4uT5w=;
	b=kFPr9bfonGazSyDyQn/HP485TcS52Chytsk/c8zGKo8sCZG+vFVJMqvcL5LXAlIMaL
	q/EkStykpEe/Lx2kEk6jOkN6vmC1STCd8qLYmpZ7UkUhEIAeZfVP6IbXhcEkYqlXk6RA
	xa3FQmguy/gPtiT1MMPHXrS3Jx0Ig7LxEJh9Mr3Ct5q2oVWG+9okmlSBPK+vY4LbehDh
	mqrF7dCA/GwK7gzXbaJQ+pdBsKzVQtZtWpDVc4jpRtdy95I24N7eobhW9xHD3TdRf5O5
	6/tWXSzcmwqZpLEhlrrAdd6FKF3MC56J6sPz0fDvh3Oxuuv8bDjJvvI+HxxzprjPqBaV
	BP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=vsRqY6NSv4BvQxnw8EyFsAcsjbZk6C2d8RyK0t4uT5w=;
	b=l3IBlQPw+vWiXDRyH47a8SPLV/tY/u99DtM+jvwM/QjjJlO1pGRB1aI/xAHwp/EUKK
	mRRKgQOEAoXfhBWliLwPz9scHCY2hOFu5Sd73Xbr9DhLcALQ18BJOALozcTHbTXPmOgI
	db/BwJVRH2sjyWvfQZCJeYNNikYin04N261ZC3VrTq8DwnPwGzqbzuqpFF0PmvXdzgFe
	xOZkhY63ZApR+VxkJVsxFg5waKEt77yVwNOKULG8973Am/N3fV1qN25nt2yvZB2Pr5xz
	xD1sKGxUIPbLQ2Y+Pd9T6qzRPQjDIBrqyhRDyI/iF6uVaYNvvQmLPCT7ZbeYkNDhsCjx
	b+bg==
X-Gm-Message-State: APjAAAU031yzZBZmIXuoJTlB9Fro0c+ysXWYZyq3Wup+4wOojsgw13MU
	dIK8Gv6Qwu46aX3mopa66LS/uYvy7cwAcg==
X-Google-Smtp-Source: APXvYqxadOS+pf+wQ8IFw3GIRTA+Ne1S7f5FNEohzLCr7R822KTuTgphsChVAJci1dfi9wyAG2HqqA==
X-Received: by 2002:a37:6003:: with SMTP id u3mr10827448qkb.166.1567795663597; 
	Fri, 06 Sep 2019 11:47:43 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id r6sm2502647qtp.9.2019.09.06.11.47.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 11:47:43 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 15:47:27 -0300
Message-Id: <20190906184727.552-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Fri, 06 Sep 2019 18:47:43 -0000
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio@ossystems.com.br>

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
 ...k-for-all-linux-host_os-combinations.patch | 37 ++++++---------
 ...on.build-make-TLS-GLX-optional-again.patch | 12 ++---
 ...Allow-enable-DRI-without-DRI-drivers.patch | 10 ++--
 ...rove-detection-of-Python-when-using-.patch | 46 +++++++++++++++++++
 .../{mesa-gl_19.1.1.bb => mesa-gl_19.1.6.bb}  |  0
 .../mesa/{mesa_19.1.1.bb => mesa_19.1.6.bb}   |  5 +-
 6 files changed, 71 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0004-Revert-meson-Improve-detection-of-Python-when-using-.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.1.bb => mesa-gl_19.1.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.1.bb => mesa_19.1.6.bb} (78%)

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
diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-meson-Improve-detection-of-Python-when-using-.patch b/meta/recipes-graphics/mesa/files/0004-Revert-meson-Improve-detection-of-Python-when-using-.patch
new file mode 100644
index 0000000000..8e42aa50e4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0004-Revert-meson-Improve-detection-of-Python-when-using-.patch
@@ -0,0 +1,46 @@
+From 7f1e017ec15fd1fbe91a56770739117bfdeec266 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sat, 17 Aug 2019 11:15:38 -0300
+Subject: [PATCH] Revert "meson: Improve detection of Python when using Meson
+ >=0.50."
+Organization: O.S. Systems Software LTDA.
+
+This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+This change need to be fix upstream. As a workaround revert this
+commit to prevent blocking update mesa recipe.
+
+Without this we get this error:
+
+/-----------------------------------------------------------------------
+|meson.build:765:2: ERROR: <ExternalProgram 'python3' ->
+|['../build/tmp/work/cortexa9hf-neon-imx-oel-linux-gnueabi/
+|mesa/2_19.1.6-r0/recipe-sysroot-native/usr/bin/python3-native/python3']>
+|is not a valid python or it is missing setuptools
+\-----------------------------------------------------------------------
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ meson.build | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index de065c290d6..88c74c2c715 100644
+--- a/meson.build
++++ b/meson.build
+@@ -761,11 +761,7 @@ if with_platform_haiku
+   pre_args += '-DHAVE_HAIKU_PLATFORM'
+ endif
+ 
+-if meson.version().version_compare('>=0.50')
+-  prog_python = import('python').find_installation('python3')
+-else
+-  prog_python = import('python3').find_python()
+-endif
++prog_python = import('python3').find_python()
+ has_mako = run_command(
+   prog_python, '-c',
+   '''
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.1.bb b/meta/recipes-graphics/mesa/mesa_19.1.6.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_19.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.1.6.bb
index 1d5d00f73e..f356d8109c 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.1.6.bb
@@ -4,10 +4,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0002-meson.build-make-TLS-GLX-optional-again.patch \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
+           file://0004-Revert-meson-Improve-detection-of-Python-when-using-.patch \
            "
 
-SRC_URI[md5sum] = "07cd8cd79de28ec1a374ee3a06e47789"
-SRC_URI[sha256sum] = "72114b16b4a84373b2acda060fe2bb1d45ea2598efab3ef2d44bdeda74f15581"
+SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
+SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.20.1


