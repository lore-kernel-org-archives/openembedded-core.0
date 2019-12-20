Return-Path: <alistair@alistair23.me>
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
	[64.147.123.27])
	by mail.openembedded.org (Postfix) with ESMTP id 069737F7E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 04:15:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 76CE08EE;
	Thu, 19 Dec 2019 23:15:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Thu, 19 Dec 2019 23:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm2; bh=T/3bA3Hwm27EQ
	EQzhtv/SqCyLz7I/apF75jLLrUAx4M=; b=2VG42kCNR2ILzPF6YttHZyOCUWSo0
	eLDvZEgsBYR0r0ciZ3wyy68/iClZ43meji5s7i/7JsVE71MW7k4HfPt08WuRYZZy
	IYzbwvw8qWqaBazEadXTZ77AjiIIQNKbexK1sL6Z0H7e/r7vujlgoTbYdwxs3+Rg
	hxnRVMmAJCDIm3bUc1Q2JUSOSE/vZbGfxhi2f95tKGOzAQ19sfixIgRn9JvrAGpK
	osP+zl6m+7/MHD5ZSu/pR4YdfNk0IRCLfxMHMJDOxVWO5dsSGgO0lLsEAkqtVJVg
	Pq3lJQXUyn26KvLeZlV3KlpIjmDFmxauXhVQ4mlswTwFpBPF2rxy/Wpgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=T/3bA3Hwm27EQEQzhtv/SqCyLz7I/apF75jLLrUAx4M=; b=x5GI5opB
	BRbOOjybJU4v4UuoJs2epJKRQlX4XQd3Ja55s9yTmgKEys2VNiJ54BZWnK/WTMtY
	FDiO4Ko3B7nE9Y+7Yaawct71M4HsmQ3rAKMJJbJAuxf61NDkL3EXlJYpxRrS2qzv
	fycUXBUktO9xWk568DhEw5EsW4OG8uoGhXWrRcDxi/Y4fHvHbHW/2vMW+fiuctMj
	lkJjNfzgG/afyX2HGv1IHNRlqP40IzFoF++6JSO40P/4veuifv+4pfbIAF9qy6mU
	T9fQZ/hZQd3XVLaGsLQMjEyIyMdBEC6qZ54Ju3A96PuzEUyaMyxpgl82Ea2KHCpA
	AcmIRNI5tPLZSg==
X-ME-Sender: <xms:yUr8XTzd1iNZAhTupj7mmb2VLh8gli-6-j1KHGcBlKtu1bES07YRfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduvddgieeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucgovehorghsthgrlhdqhfeguddvqddtvdculdduhe
	dtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehl
	ihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfe
	drmhgvqeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpghhithhhuhgs
	rdgtohhmnecukfhppeejfedrleefrdekgedrvddtkeenucfrrghrrghmpehmrghilhhfrh
	homheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvnecuvehluhhsthgvrhfu
	ihiivgeptd
X-ME-Proxy: <xmx:yUr8XRS6IyEuk2Cx_l9RuNKu18BnkoeGX8rG1g_gfbVNTDrrTotr1A>
	<xmx:yUr8Xa8oHUz2X7aiZOv17gA6RLzso9NXkoy0KYn2vVVi9kGGiDLJsQ>
	<xmx:yUr8XYrVJQbDgJIkG5j10nVz8lqjinUO83VNxy2u2xJQLXgxAjwFtA>
	<xmx:ykr8XbvCQ61TmIC9rCfzpBllTzJHogYhsuLUg7zfMqUvSuqKb2Sfe23BTEE>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5B4D7306099E;
	Thu, 19 Dec 2019 23:15:05 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 20:15:01 -0800
Message-Id: <20191220041501.19716-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220041501.19716-1-alistair@alistair23.me>
References: <20191220041501.19716-1-alistair@alistair23.me>
MIME-Version: 1.0
Subject: [PATCH v3 2/2] mesa: Upgrade to 19.3.1
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
X-List-Received-Date: Fri, 20 Dec 2019 04:15:08 -0000
Content-Transfer-Encoding: 8bit

Upgrade mesa to 19.3 and refresh the patches.

Also change the regex to not look for x.x.0 versions as they are
development versions.

As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are going
to change the do_install and add a patch to libepoxy to use the new
define.

1: https://gitlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 ...atch_common.h-define-also-EGL_NO_X11.patch | 26 +++++++++++++++++++
 .../libepoxy/libepoxy_1.5.4.bb                |  1 +
 ...k-for-all-linux-host_os-combinations.patch | 18 ++++++-------
 ...02-meson.build-make-TLS-ELF-optional.patch | 18 ++++++-------
 ...Allow-enable-DRI-without-DRI-drivers.patch | 10 +++----
 ...le-asm-unconditionally-now-that-gen_.patch | 10 +++----
 .../{mesa-gl_19.2.4.bb => mesa-gl_19.3.1.bb}  |  0
 .../mesa/{mesa_19.2.4.bb => mesa_19.3.1.bb}   |  8 +++---
 8 files changed, 59 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_19.2.4.bb => mesa-gl_19.3.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.2.4.bb => mesa_19.3.1.bb} (60%)

diff --git a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
new file mode 100644
index 0000000000..7262945181
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
@@ -0,0 +1,26 @@
+From 6f15cc28d17cfdd86f5974f06ad97b8afedd5627 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 25 Oct 2019 11:09:34 +0000
+Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11
+
+MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
+https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Pending
+---
+ src/dispatch_common.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/dispatch_common.h b/src/dispatch_common.h
+index dcb3a35..c206253 100644
+--- a/src/dispatch_common.h
++++ b/src/dispatch_common.h
+@@ -52,6 +52,7 @@
+  * should do the same
+  */
+ #  define MESA_EGL_NO_X11_HEADERS 1
++#  define EGL_NO_X11 1
+ # endif
+ #include "epoxy/egl.h"
+ #endif
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
index 4caf672369..af9867407e 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
@@ -10,6 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
 SRC_URI[md5sum] = "00f47ad447321f9dc59f85bc1c9d0467"
 SRC_URI[sha256sum] = "0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2"
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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb b/meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.2.4.bb b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
similarity index 60%
rename from meta/recipes-graphics/mesa/mesa_19.2.4.bb
rename to meta/recipes-graphics/mesa/mesa_19.3.1.bb
index f4b33df227..d105fec4df 100644
--- a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
@@ -7,15 +7,15 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            "
 
-SRC_URI[md5sum] = "5c047732b81651ddb341597528b4b096"
-SRC_URI[sha256sum] = "09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e548e30f"
+SRC_URI[md5sum] = "5c5965db31993af47fee82c9a7ccba5e"
+SRC_URI[sha256sum] = "cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb8274723e033beae59"
 
-UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.^[1-9]\d+)+)"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
-- 
2.24.0


