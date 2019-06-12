Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id ED3047E6D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 21:13:13 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c70so11322207qkg.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=4+dsQjeSCgSXX7L06I56eEdXIBOrdiTMYZ4WSdjOPj4=;
	b=P2/9MMRdVISoYCTgG+/ti52KueNRMiABJYGbE5hz5OgRgoJQErVzad15I+SJzvKG96
	nZ2irBn/lG1q31DnjM3sdrLCwyAkQhh0AegW1oSVVDZDTzPKt/k5km/CsKJHIGWOa3Ij
	RprBiKfj5zgcXbNQXkLKnZPznhVoFZkKjNmY1wYISJ+XFk3ErjCQuIcF4f30MpDO24Tz
	vbp3573M71+3k+458yJS3A5VmK7feA1bWuceGUtxNbdfJbB+N8tsHJBXW/ITpl3/EzgI
	U1zYLSi8NUV+ITVv94nNO43n+LQed0V+u407iCK+X4ya75BuUYhGs3hYDko8Lh2XtovC
	dUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=4+dsQjeSCgSXX7L06I56eEdXIBOrdiTMYZ4WSdjOPj4=;
	b=sB6kVC20qwuOaFYg9EAyK9Ebi28xd4xyQCdOXBRBqD5B1wS2Mcgm09AO28opcWE2M5
	7ytkbmAACUPMOMfgoxsRmIVUF8y0yS7YziiG+QgkgTzjqiO3RZmXFoMYFrcBVYz1WoKc
	hUj2HUShWkjB5FxIVVmbwuQgSCWLmH8F+eA724lBx2LWCrWBnwuW5XHze7o2rbTGEWLX
	AoHsLQXfDOOGPqKNNGLFubBNipIDZdUGqoUAGlFtt5X013zKg2+CwDipXwFhtbN9x5Wp
	d4kN9radbyyuUrUgUQzZmvs5V+awEsbfktHuWVRLLOEh0Co0wtqMt2kpDX437vgT+PXT
	H2aQ==
X-Gm-Message-State: APjAAAXDnAMGb7NxGnoJxhXZyu8neipUdjMt1UmuQCyZZ8B4bcNH0c2Q
	MpM/CYhhcpoZ6Wfi/PirOjooMO8rffIlJg==
X-Google-Smtp-Source: APXvYqys+EX2PdecNugiX/kDOy8JWTiSc4O0CdkGk3reAF8ct6HIm+vop3Yw31UXVIsJLDcrSv700A==
X-Received: by 2002:a37:615:: with SMTP id 21mr48286766qkg.64.1560373994467;
	Wed, 12 Jun 2019 14:13:14 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.86.53])
	by smtp.gmail.com with ESMTPSA id
	t187sm431201qkh.10.2019.06.12.14.13.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 14:13:13 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 18:12:57 -0300
Message-Id: <20190612211257.16651-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Update 19.0.6 -> 19.1.0
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
X-List-Received-Date: Wed, 12 Jun 2019 21:13:14 -0000
Content-Transfer-Encoding: 8bit

Update all patches to apply on 19.1.0 version.

See full mesa 19.0.1 changes here:
  - https://www.mesa3d.org/relnotes/19.1.0.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...k-for-all-linux-host_os-combinations.patch | 25 ++++++++--------
 ...n.build-make-TLS-GLX-optional-again.patch} | 30 ++++++++++++-------
 ...llow-enable-DRI-without-DRI-drivers.patch} | 29 ++++++++++--------
 .../{mesa-gl_19.0.6.bb => mesa-gl_19.1.0.bb}  |  0
 .../mesa/{mesa_19.0.6.bb => mesa_19.1.0.bb}   |  8 ++---
 5 files changed, 53 insertions(+), 39 deletions(-)
 rename meta/recipes-graphics/mesa/files/{0001-meson.build-make-TLS-GLX-optional-again.patch => 0002-meson.build-make-TLS-GLX-optional-again.patch} (58%)
 rename meta/recipes-graphics/mesa/files/{0001-Allow-enable-DRI-without-DRI-drivers.patch => 0003-Allow-enable-DRI-without-DRI-drivers.patch} (50%)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.6.bb => mesa-gl_19.1.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.6.bb => mesa_19.1.0.bb} (70%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index dfc67b83d9..0064dc643c 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,7 +1,7 @@
-From 498f230c9446fc7a1b4dc77ff6b84ee1a3b53bf4 Mon Sep 17 00:00:00 2001
+From da6b9188f29942684d4262f0c6264d09bb6fe7de Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 24 Apr 2019 17:01:24 -0300
-Subject: [PATCH] meson.build: check for all linux host_os combinations
+Date: Wed, 12 Jun 2019 13:40:20 -0300
+Subject: [PATCH 1/3] meson.build: check for all linux host_os combinations
 Organization: O.S. Systems Software LTDA.
 
 Make sure that we are also looking for our host_os combinations like
@@ -9,15 +9,16 @@ linux-musl etc. when assuming support for DRM/KMS.
 
 Also delete a duplicate line.
 
+Upstream-Status: Pending
+
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Upstream-Status: Pending
 ---
  meson.build | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 53d02e31097..c41f6b4e402 100644
+index 8ab8a550f56..e11880f2902 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -34,6 +34,8 @@ cpp = meson.get_compiler('cpp')
@@ -29,16 +30,16 @@ index 53d02e31097..c41f6b4e402 100644
  # Arguments for the preprocessor, put these in a separate array from the C and
  # C++ (cpp in meson terminology) arguments since they need to be added to the
  # default arguments for both C and C++.
-@@ -89,8 +91,6 @@ if (with_gles1 or with_gles2) and not with_opengl
-   error('building OpenGL ES without OpenGL is not supported.')
- endif
+@@ -107,8 +109,6 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+ # Only build shared_glapi if at least one OpenGL API is enabled
+ with_shared_glapi = get_option('shared-glapi') and with_any_opengl
  
 -system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'linux'].contains(host_machine.system())
 -
- _drivers = get_option('dri-drivers')
- if _drivers.contains('auto')
+ dri_drivers = get_option('dri-drivers')
+ if dri_drivers.contains('auto')
    if system_has_kms_drm
-@@ -792,7 +792,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
+@@ -836,7 +836,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
  endif
  
  # TODO: this is very incomplete
@@ -48,5 +49,5 @@ index 53d02e31097..c41f6b4e402 100644
  endif
  
 -- 
-2.21.0
+2.22.0
 
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
similarity index 58%
rename from meta/recipes-graphics/mesa/files/0001-meson.build-make-TLS-GLX-optional-again.patch
rename to meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
index 8fabafcb35..81454aaa29 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-make-TLS-GLX-optional-again.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
@@ -1,23 +1,26 @@
-From 48318f1a5c9042a8e1bb4456c2584362b25c4a59 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 15 May 2019 17:21:51 +0200
-Subject: [PATCH] meson.build: make TLS GLX optional again
+From d31718999797ffc4dd177d14760ef7b8fd95ac2f Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 12 Jun 2019 14:15:57 -0300
+Subject: [PATCH 2/3] meson.build: make TLS GLX optional again
+Organization: O.S. Systems Software LTDA.
 
 This was optional with autotools, and needs to be disabled
 when using musl C library, for instance.
 
 Upstream-Status: Pending
+
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
  meson.build       | 4 +++-
- meson_options.txt | 6 ++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
+ meson_options.txt | 7 +++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index c41f6b4..8843f3c 100644
+index e11880f2902..7a07974ba61 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -336,7 +336,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless)
+@@ -362,7 +362,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless)
    endif
  endif
  
@@ -29,10 +32,10 @@ index c41f6b4..8843f3c 100644
    if not (with_platform_x11 and with_any_opengl)
      error('Cannot build GLX support without X11 platform support and at least one OpenGL API')
 diff --git a/meson_options.txt b/meson_options.txt
-index ccf7065..0f1e800 100644
+index 1f72faabee8..fcd49efea27 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -324,3 +324,9 @@ option(
+@@ -339,6 +339,13 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
@@ -42,3 +45,10 @@ index ccf7065..0f1e800 100644
 +  value : true,
 +  description : 'Enable TLS support in GLX',
 +)
++
+ option(
+   'I-love-half-baked-turnips',
+   type : 'boolean',
+-- 
+2.22.0
+
diff --git a/meta/recipes-graphics/mesa/files/0001-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
similarity index 50%
rename from meta/recipes-graphics/mesa/files/0001-Allow-enable-DRI-without-DRI-drivers.patch
rename to meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index 4b9220aa30..0f254a1d91 100644
--- a/meta/recipes-graphics/mesa/files/0001-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -1,30 +1,33 @@
-From 8e0a58c8eea7ed70071cac139655700fdfa16445 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei@gherzan.ro>
-Date: Wed, 22 May 2019 18:32:07 +0100
-Subject: [PATCH] Allow enable DRI without DRI drivers
+From 417ff3a03313aa003244990ed5c0188c421e6181 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 12 Jun 2019 14:18:31 -0300
+Subject: [PATCH 3/3] Allow enable DRI without DRI drivers
+Organization: O.S. Systems Software LTDA.
 
 Upstream-Status: Pending
+
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
  meson.build       | 2 +-
  meson_options.txt | 6 ++++++
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 53d02e3..9a8578f 100644
+index 7a07974ba61..5c7cbe38376 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -119,7 +119,7 @@ with_dri_r200 = _drivers.contains('r200')
- with_dri_nouveau = _drivers.contains('nouveau')
- with_dri_swrast = _drivers.contains('swrast')
+@@ -137,7 +137,7 @@ with_dri_r200 = dri_drivers.contains('r200')
+ with_dri_nouveau = dri_drivers.contains('nouveau')
+ with_dri_swrast = dri_drivers.contains('swrast')
  
--with_dri = _drivers.length() != 0 and _drivers != ['']
+-with_dri = dri_drivers.length() != 0 and dri_drivers != ['']
 +with_dri = get_option('dri') or (_drivers.length() != 0 and _drivers != [''])
  
- _drivers = get_option('gallium-drivers')
- if _drivers.contains('auto')
+ gallium_drivers = get_option('gallium-drivers')
+ if gallium_drivers.contains('auto')
 diff --git a/meson_options.txt b/meson_options.txt
-index ccf7065..5174320 100644
+index fcd49efea27..0529200b3bb 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -34,6 +34,12 @@ option(
@@ -41,5 +44,5 @@ index ccf7065..5174320 100644
    'dri-drivers',
    type : 'array',
 -- 
-2.17.1
+2.22.0
 
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.1.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.1.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.6.bb b/meta/recipes-graphics/mesa/mesa_19.1.0.bb
similarity index 70%
rename from meta/recipes-graphics/mesa/mesa_19.0.6.bb
rename to meta/recipes-graphics/mesa/mesa_19.1.0.bb
index 02e2c86dde..05c315349c 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.1.0.bb
@@ -2,12 +2,12 @@ require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-           file://0001-meson.build-make-TLS-GLX-optional-again.patch \
-           file://0001-Allow-enable-DRI-without-DRI-drivers.patch \
+           file://0002-meson.build-make-TLS-GLX-optional-again.patch \
+           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "b97159690eba564311d88a818bdbd64d"
-SRC_URI[sha256sum] = "2db2f2fcaa4048b16e066fad76b8a93944f7d06d329972b0f5fd5ce692ce3d24"
+SRC_URI[md5sum] = "090cd351cf938fc1729dee983520216a"
+SRC_URI[sha256sum] = "2a6c3af3a803389183168e449c536304cf03e0f82c4c9333077933543b9d02f3"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


