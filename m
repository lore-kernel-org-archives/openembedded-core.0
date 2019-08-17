Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0C77F364
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:36:38 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z4so9342116qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 07:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=/ICJBgNOoCVpiFdfph0TPp8VK9V98uaptdd4zvS0R0o=;
	b=DdpP3AW46q9vU3XSYtETC8xgCxhnQBwscUrfkysEMNsJfFILLhptwGQcelsBnHdvdO
	SaDhdGCTR6Rlyw6IhKkOKOIg+2vMtVSkVohwj8nV7kGQLvfym6Ta/pk380Z5e+Bk7RYQ
	k3yS6a/8XVrVNrhh0CdaDL78bEh4plfXp7fOAsDTGjdFfvZ7ViAIu7Rw1cIBwJdxxVNq
	9fL+FapxWipXdfMgbgU2OtV5Y8MRnBapRQgFfShjFjuR0eTXWKF6cIsVAgh+tg3YaP3d
	P4d+FBQR9eLYEjRs7OU/LyKyhRsoYuuxjmuBeFoYjWV9NLtBEGom8fd0Yj+UIy8L7zKG
	Kd3w==
X-Gm-Message-State: APjAAAVooS4nGG98C53e4w0hoGFbOTPq3phUlkvUzd3tqs3ZowXA8KPR
	5gdo/lMnjTUctfxz7zHp59QDgU4cMP0=
X-Google-Smtp-Source: APXvYqwYj0FuokD+gs8QQBLdQ4EBlr3fOCuGyJtW1A26Imbi2z5ibT2AeqR82G3j98E/kvYpkb/dXQ==
X-Received: by 2002:aed:24f4:: with SMTP id u49mr13653557qtc.110.1566052598893;
	Sat, 17 Aug 2019 07:36:38 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	23sm4367409qkk.121.2019.08.17.07.36.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 07:36:38 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 17 Aug 2019 11:36:34 -0300
Message-Id: <20190817143634.2403-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.4
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
X-List-Received-Date: Sat, 17 Aug 2019 14:36:38 -0000
Content-Transfer-Encoding: 8bit

This is a bugfix only set of releases. Check following links for the
relevant release notes:

- https://www.mesa3d.org/relnotes/19.1.2.html
- https://www.mesa3d.org/relnotes/19.1.3.html
- https://www.mesa3d.org/relnotes/19.1.4.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...k-for-all-linux-host_os-combinations.patch | 37 +++++++------------
 ...on.build-make-TLS-GLX-optional-again.patch | 12 +++---
 ...Allow-enable-DRI-without-DRI-drivers.patch | 10 ++---
 ...rove-detection-of-Python-when-using-.patch | 29 +++++++++++++++
 .../{mesa-gl_19.1.1.bb => mesa-gl_19.1.4.bb}  |  0
 .../mesa/{mesa_19.1.1.bb => mesa_19.1.4.bb}   |  5 ++-
 6 files changed, 54 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0004-Revert-meson-Improve-detection-of-Python-when-using-.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.1.bb => mesa-gl_19.1.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.1.bb => mesa_19.1.4.bb} (77%)

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
index 0000000000..17f2d87640
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0004-Revert-meson-Improve-detection-of-Python-when-using-.patch
@@ -0,0 +1,29 @@
+From 7f1e017ec15fd1fbe91a56770739117bfdeec266 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sat, 17 Aug 2019 11:15:38 -0300
+Subject: [PATCH] Revert "meson: Improve detection of Python when using Meson
+ >=0.50."
+Organization: O.S. Systems Software LTDA.
+
+This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.
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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.1.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.1.bb b/meta/recipes-graphics/mesa/mesa_19.1.4.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_19.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.1.4.bb
index 1a34a6577b..eaeec013ed 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.1.4.bb
@@ -4,10 +4,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0002-meson.build-make-TLS-GLX-optional-again.patch \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
+	   file://0004-Revert-meson-Improve-detection-of-Python-when-using-.patch \
            "
 
-SRC_URI[md5sum] = "07cd8cd79de28ec1a374ee3a06e47789"
-SRC_URI[sha256sum] = "72114b16b4a84373b2acda060fe2bb1d45ea2598efab3ef2d44bdeda74f15581"
+SRC_URI[md5sum] = "90eed05e3239c96ad9e92eb11eb67ada"
+SRC_URI[sha256sum] = "a6d268a7d9edcfd92b6da80f2e34e6e0a7baaa442efbeba2fc66c404943c6bfb"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.22.1


