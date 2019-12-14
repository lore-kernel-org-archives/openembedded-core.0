Return-Path: <alistair@alistair23.me>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id BE4237F35B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 18:08:45 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 1FE5B224D5;
	Sat, 14 Dec 2019 13:08:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Sat, 14 Dec 2019 13:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=lQR4NQIFtIzTNWXX3LM1gF2Y1g
	MU3bEoa0TtsT1f98U=; b=3UjWkZ644pOTbsURTaM1+bkEA3Hb8YyMXx3vRoBvWR
	zuygdLDv2JBcUYIGen8KSN9Pgu8LUMOsptk/326Z4ZYx7bD8aY9evcar84VyCNVC
	KX6n5jpZyRLxSH6yu3zg3QudxwNjQGSCNB2fvwvGQYFiB/qSYcsg6PBLZeYw29N6
	4a4eZ0w8XZKk1g0v8cBIoMyxvgY1mq/mXC0die0/iYCQJh1/7dHz8VIvcEcZFnXm
	dxB8eQOtqzl744Qn0nw8u1rlPMiO/Cq7pVjFZ7vjFCYmDmPJzs4p7NAy49+vnvxe
	J8eICgF52tJz4+siyRtVQREvqv4GMNglvIDY/rKatXVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lQR4NQIFtIzTNWXX3
	LM1gF2Y1gMU3bEoa0TtsT1f98U=; b=e4Y6qqDWI06AbOR1z9rbSLRbaUG2Nh3Ta
	+wpDS81IgG3NaEjB/FIr6zg0J658LaNsnWAr7RJhRYXVji3CfbqMOCGkcoq0NsMZ
	1PmIblFvk+WTixZKYEl4npUIMMGwpGcbt4wl0+8U/be3KJ1DTPy7MPODMenHWRSi
	FPe0jgc7z+w0f352KeHCAdigKbKyF1Sa/jjLw00Xm3zRdJR45DaD5doxEQOy8L4W
	0wE+CTkoK3fw1nYHOLOwQLMpYE6r4xk4jdKKh6sFP9gx0J6zPOnN7f3DNWuFEL8A
	swr5MxCiPNXaN7D5S63GBfUj/2HoWW/3cVflRlx8QH7LpjDMA90VQ==
X-ME-Sender: <xms:LCX1XUIpuL_qFQcu2eVSuKWy1g0r1wg67cuwK86UgCdnfp0soEUhCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtuddguddutdcutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
	rhesrghlihhsthgrihhrvdefrdhmvgeqnecuffhomhgrihhnpehfrhgvvgguvghskhhtoh
	hprdhorhhgnecukfhppeejfedrleefrdekgedrvddtkeenucfrrghrrghmpehmrghilhhf
	rhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvnecuvehluhhsthgvrh
	fuihiivgeptd
X-ME-Proxy: <xmx:LCX1XVOUA0PyTAwIMGe1nAn-UwKtseSTnbVsz-qMvYQ2mQvm8NdVeQ>
	<xmx:LCX1XXqO1KwFyOpZ29eueWskslJKSN8TEvBipD3lKntdnw_tRu7cJQ>
	<xmx:LCX1XfGL1AXPrQzTHfFNT3v-eVleaQOWxyrzx1agtGy-UwX4E6MlQA>
	<xmx:LSX1XddJoh5dUd51rRRkmKQ7cG8biLPLQXQqtemb3JFcfIwwFiRong>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 471CD30600BD;
	Sat, 14 Dec 2019 13:08:44 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 10:08:42 -0800
Message-Id: <20191214180842.14879-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] mesa: Upgrade to 19.3.0
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
X-List-Received-Date: Sat, 14 Dec 2019 18:08:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 ...ck-for-all-linux-host_os-combinations.patch | 18 +++++++++---------
 ...002-meson.build-make-TLS-ELF-optional.patch | 18 +++++++++---------
 ...-Allow-enable-DRI-without-DRI-drivers.patch | 10 +++++-----
 ...ble-asm-unconditionally-now-that-gen_.patch | 10 +++++-----
 .../{mesa-gl_19.2.4.bb => mesa-gl_19.3.0.bb}   |  0
 .../mesa/{mesa_19.2.4.bb => mesa_19.3.0.bb}    |  4 ++--
 6 files changed, 30 insertions(+), 30 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.2.4.bb => mesa-gl_19.3.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.2.4.bb => mesa_19.3.0.bb} (86%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 1869e11059..085254323c 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,6 +1,6 @@
-From b6d9bc97cb0e8c540a45dba5440b036fb940ff95 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 11 Nov 2019 09:38:15 -0800
+From 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
 
 Make sure that we are also looking for our host_os combinations like
@@ -13,30 +13,30 @@ Upstream-Status: Pending
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
 
 ---
  meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index d584152..a1f098c 100644
+index 898d025..09e3759 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -117,7 +117,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+@@ -124,7 +124,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
- with_shared_glapi = get_option('shared-glapi') and with_any_opengl
+ with_shared_glapi = with_shared_glapi and with_any_opengl
  
 -system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
 +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
  
  dri_drivers = get_option('dri-drivers')
  if dri_drivers.contains('auto')
-@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
+@@ -884,7 +884,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
  endif
  
  # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system())
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd'].contains(host_machine.system())
 +if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) or host_machine.system().startswith('linux')
    pre_args += '-D_GNU_SOURCE'
  elif host_machine.system() == 'sunos'
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index 199ed572d5..cd35a1f850 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -1,13 +1,13 @@
-From af6923544de02ded648a736e07b9bd8b7c52dba9 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 23 Oct 2019 09:46:28 -0700
+From df835389699b32bb6610b39972502e323f8e09e5 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
 
 USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
 TLS GLX optional again" patch updated to the latest mesa.
 
 Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
 
 ---
  meson.build       | 2 +-
@@ -15,23 +15,23 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a1f098c..1e31eb4 100644
+index 09e3759..a954118 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
+@@ -387,7 +387,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
  endif
  
  # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
--if not with_platform_android or get_option('platform-sdk-version') >= 29
+-if host_machine.system() != 'windows' and (not with_platform_android or get_option('platform-sdk-version') >= 29)
 +if (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
    pre_args += '-DUSE_ELF_TLS'
  endif
  
 diff --git a/meson_options.txt b/meson_options.txt
-index b768c15..76cef24 100644
+index 626baf3..637ff14 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -333,6 +333,12 @@ option(
+@@ -341,6 +341,12 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index c20a1f7c52..a0536c87ac 100644
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -1,4 +1,4 @@
-From 5ad6515238bc042cccf9959abad44fdee9aeb07f Mon Sep 17 00:00:00 2001
+From 7eaa21a79ce6d6e92f6bf98c28b68e3fcb4d7874 Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Wed, 12 Jun 2019 14:18:31 -0300
 Subject: [PATCH] Allow enable DRI without DRI drivers
@@ -15,10 +15,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 1e31eb4..512eec6 100644
+index a954118..62864c6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -147,7 +147,7 @@ with_dri_r200 = dri_drivers.contains('r200')
+@@ -154,7 +154,7 @@ with_dri_r200 = dri_drivers.contains('r200')
  with_dri_nouveau = dri_drivers.contains('nouveau')
  with_dri_swrast = dri_drivers.contains('swrast')
  
@@ -28,10 +28,10 @@ index 1e31eb4..512eec6 100644
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
 diff --git a/meson_options.txt b/meson_options.txt
-index 76cef24..a8abd04 100644
+index 637ff14..700c34c 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -34,6 +34,12 @@ option(
+@@ -35,6 +35,12 @@ option(
    choices : ['auto', 'true', 'false'],
    description : 'enable support for dri3'
  )
diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
index b5658d0c9d..8d614e571a 100644
--- a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
+++ b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
@@ -1,4 +1,4 @@
-From 1b1cb6e5ea25eaa98573328b9565728a08245997 Mon Sep 17 00:00:00 2001
+From 41cd8836d785c79381764e7de59319f87959a5cf Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 09:06:02 -0800
 Subject: [PATCH] Revert "mesa: Enable asm unconditionally, now that
@@ -15,7 +15,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 67 insertions(+), 33 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 512eec6..a2bcc3a 100644
+index 62864c6..b53be8d 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -49,6 +49,7 @@ with_vulkan_icd_dir = get_option('vulkan-icd-dir')
@@ -26,7 +26,7 @@ index 512eec6..a2bcc3a 100644
  with_glx_read_only_text = get_option('glx-read-only-text')
  with_glx_direct = get_option('glx-direct')
  with_osmesa = get_option('osmesa')
-@@ -985,41 +986,68 @@ endif
+@@ -1093,41 +1094,68 @@ dep_ws2_32 = cc.find_library('ws2_32', required : with_platform_windows)
  
  # TODO: shared/static? Is this even worth doing?
  
@@ -129,10 +129,10 @@ index 512eec6..a2bcc3a 100644
  endif
  
 diff --git a/meson_options.txt b/meson_options.txt
-index a8abd04..0f4bd80 100644
+index 700c34c..62e8472 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -233,6 +233,12 @@ option(
+@@ -241,6 +241,12 @@ option(
    value : false,
    description : 'Enable GLVND support.'
  )
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb b/meta/recipes-graphics/mesa/mesa-gl_19.3.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.3.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.2.4.bb b/meta/recipes-graphics/mesa/mesa_19.3.0.bb
similarity index 86%
rename from meta/recipes-graphics/mesa/mesa_19.2.4.bb
rename to meta/recipes-graphics/mesa/mesa_19.3.0.bb
index f4b33df227..bd7cc1ab94 100644
--- a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.3.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            "
 
-SRC_URI[md5sum] = "5c047732b81651ddb341597528b4b096"
-SRC_URI[sha256sum] = "09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e548e30f"
+SRC_URI[md5sum] = "b8b4aaeb021ab8b827b1e7b3ed05271a"
+SRC_URI[sha256sum] = "5fa0e4e9dca79560f6882e362f9db36d81cf96da16cf6a84e0ada7466a99a5d7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.24.0


