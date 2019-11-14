Return-Path: <alistair@alistair23.me>
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
	[66.111.4.230])
	by mail.openembedded.org (Postfix) with ESMTP id 58A427FA39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 20:22:22 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1768A4DFB;
	Thu, 14 Nov 2019 15:22:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Thu, 14 Nov 2019 15:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=xpg428u8WgEG6v7E5c4onhJ2qd
	Kl9gYiEuekWKpsPHM=; b=SA9NYkm63qkOwhMmFD0OUU6CuPiSQieOBOd0Xg1G9J
	a4+8e54KHAp/oIMhuwFChBQLuwJ/0O4vg5wcKbFIrn39EZPq3UN/NB0EFywgOh07
	EZ1ZoudNzhvGHBuDQfM5vslMxP7yrK6TJS9yMC89cf7nU3lNQB51M0jG7t7dNdZ8
	zz0KRDf7ZihUce5Q4f5bAxy+7ls2Yl1y+VkFFXYa02QgvEEsXgyfLELBvaFg4Bac
	70jVqV+ErrrMSeBM66iyQ6Td/BCCm/412q2xpQvA8jup/2XUoTvlkxmZISThIjGY
	CTR14F+6bccDZGYqU2IqlahfUP8SvdBl1eWrrcS4qLQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xpg428u8WgEG6v7E5
	c4onhJ2qdKl9gYiEuekWKpsPHM=; b=yTIfWQeoeiRvfiQUi/UeGa6VJsXRjaR8u
	UhezOBp7b+s2AJ2L98JPKtToDCv+w5e53+WmnxpYgHW+5XsXZNcIW0piAB7wqRSf
	UpMxN3rnDnNJNfUmDWwVAwuvAXYd6ODo7ZMx/L6XkH8Kih9uBVGmRL8P9m/gY1er
	ythDB1CgUTe1KcEFK9Lr0Vt794gvw2V2W9O2qxAv2yLQIms0KB2gEnsxuwEHPQCX
	rmcqPb8k6VkgTCyKXM9g3RmZ4BtG1G1hMuuFvvMRKXj9y8popgX8EiMQV9TrWZdf
	yfaKrTKpDj4uH9aEPm/6nJFUU2d9PJu5yekXhUM2ZW6tQhm8ARqCw==
X-ME-Sender: <xms:f7fNXarA6KRrjzGsyG74BfKFSZtJZVDCSeVxZLC5389ZwwN_6VjOuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgudefhecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecuogevohgrshhtrghlqdfhgeduvddqtddvucdlud
	ehtddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhhi
	shhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhesrghlihhsthgrihhrvdefrd
	hmvgeqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhmvghsrgefugdr
	ohhrghenucfkphepjeefrdelfedrkeegrddvtdeknecurfgrrhgrmhepmhgrihhlfhhroh
	hmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgenucevlhhushhtvghrufhi
	iigvpedt
X-ME-Proxy: <xmx:f7fNXYxFfGecN-FGoo_MfyiwqpbkFm452UTm5kWE_ktkEjL55768Dw>
	<xmx:f7fNXXJuSKnbO9Hpqs53VOg5kaDvmPr1IA0e85ng2joZv-Q_AthbAg>
	<xmx:f7fNXSIzWDcr4VYTZO7eL_dzuGE8Imn0FnfaxAgzWMdWrrfS0hyWbQ>
	<xmx:gLfNXfIHakGYzn2oL-vpjuFKralqd957hcn0NW68_oMraMZ_Q09SQg>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0C6133060060;
	Thu, 14 Nov 2019 15:22:22 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2019 12:22:20 -0800
Message-Id: <20191114202220.3380-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH v8] mesa: Upgrade to 19.2.4
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
X-List-Received-Date: Thu, 14 Nov 2019 20:22:23 -0000
Content-Transfer-Encoding: 8bit

Upgrade mesa and mesa-gl to 19.2.4.

The license hash change was a trivial new line removal.

The glx-tls option was removed as it isn't included in the meson.build
file. It has been replaced with 'use-elf-tls' instead.

I have backported the asm removal as an attempt to fix the musl build
issue.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v8:
 - Add asm revert patch
 - Bump to 19.2.4
 - Remove INSANE_SKIP
 - Refresh patches
v7:
 - Update to mesa 19.2.3
 - Add INSANE_SKIP
v6:
 - Rebase on master
v4:
 - Add a patch (first patch in the series) to fix libsdl2 build
v3:
 - Fix missing Upstream-Status
v2:
 - Add back "make TLS ELF optional" patch

 ...k-for-all-linux-host_os-combinations.patch |  21 +--
 ...02-meson.build-make-TLS-ELF-optional.patch |  46 ++++++
 ...on.build-make-TLS-GLX-optional-again.patch |  52 -------
 ...Allow-enable-DRI-without-DRI-drivers.patch |  10 +-
 ...le-asm-unconditionally-now-that-gen_.patch | 147 ++++++++++++++++++
 .../{mesa-gl_19.1.6.bb => mesa-gl_19.2.4.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |  12 +-
 .../mesa/{mesa_19.1.6.bb => mesa_19.2.4.bb}   |   7 +-
 8 files changed, 219 insertions(+), 76 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.2.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.2.4.bb} (72%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 9fba5da4b2..1869e11059 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,8 +1,7 @@
-From ea966884e39aae9571c038fab55f3c1663d17850 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 12 Jun 2019 13:40:20 -0300
+From b6d9bc97cb0e8c540a45dba5440b036fb940ff95 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 11 Nov 2019 09:38:15 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
-Organization: O.S. Systems Software LTDA.
 
 Make sure that we are also looking for our host_os combinations like
 linux-musl etc. when assuming support for DRM/KMS.
@@ -14,29 +13,31 @@ Upstream-Status: Pending
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
 ---
  meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 567a81afd6f..b33b430aed4 100644
+index d584152..a1f098c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -107,7 +107,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+@@ -117,7 +117,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi = get_option('shared-glapi') and with_any_opengl
  
--system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux'].contains(host_machine.system())
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
 +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
  
  dri_drivers = get_option('dri-drivers')
  if dri_drivers.contains('auto')
-@@ -845,7 +845,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
+@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
  endif
  
  # TODO: this is very incomplete
 -if ['linux', 'cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system())
 +if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) or host_machine.system().startswith('linux')
    pre_args += '-D_GNU_SOURCE'
- endif
- 
+ elif host_machine.system() == 'sunos'
+   pre_args += '-D__EXTENSIONS__'
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
new file mode 100644
index 0000000000..199ed572d5
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -0,0 +1,46 @@
+From af6923544de02ded648a736e07b9bd8b7c52dba9 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 23 Oct 2019 09:46:28 -0700
+Subject: [PATCH] meson.build: make TLS ELF optional
+
+USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
+TLS GLX optional again" patch updated to the latest mesa.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
+---
+ meson.build       | 2 +-
+ meson_options.txt | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a1f098c..1e31eb4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
+ endif
+ 
+ # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
+-if not with_platform_android or get_option('platform-sdk-version') >= 29
++if (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
+   pre_args += '-DUSE_ELF_TLS'
+ endif
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+index b768c15..76cef24 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -333,6 +333,12 @@ option(
+   value : true,
+   description : 'Enable direct rendering in GLX and EGL for DRI',
+ )
++option(
++  'elf-tls',
++  type : 'boolean',
++  value : true,
++  description : 'Enable TLS support in ELF',
++)
+ option(
+   'I-love-half-baked-turnips',
+   type : 'boolean',
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
deleted file mode 100644
index 641bacf1d9..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 12 Jun 2019 14:15:57 -0300
-Subject: [PATCH] meson.build: make TLS GLX optional again
-Organization: O.S. Systems Software LTDA.
-
-This was optional with autotools, and needs to be disabled
-when using musl C library, for instance.
-
-Upstream-Status: Pending
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- meson.build       | 4 +++-
- meson_options.txt | 7 +++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b33b430aed4..0e50bb26c0a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
-   endif
- endif
- 
--pre_args += '-DGLX_USE_TLS'
-+if get_option('glx-tls')
-+  pre_args += '-DGLX_USE_TLS'
-+endif
- if with_glx != 'disabled'
-   if not (with_platform_x11 and with_any_opengl)
-     error('Cannot build GLX support without X11 platform support and at least one OpenGL API')
-diff --git a/meson_options.txt b/meson_options.txt
-index 1f72faabee8..fcd49efea27 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -339,6 +339,13 @@ option(
-   value : true,
-   description : 'Enable direct rendering in GLX and EGL for DRI',
- )
-+option(
-+  'glx-tls',
-+  type : 'boolean',
-+  value : true,
-+  description : 'Enable TLS support in GLX',
-+)
-+
- option(
-   'I-love-half-baked-turnips',
-   type : 'boolean',
diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index 346b217585..c20a1f7c52 100644
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -1,24 +1,24 @@
-From f1482e88c2295b9c7288f5b273335a8e18039de8 Mon Sep 17 00:00:00 2001
+From 5ad6515238bc042cccf9959abad44fdee9aeb07f Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Wed, 12 Jun 2019 14:18:31 -0300
 Subject: [PATCH] Allow enable DRI without DRI drivers
-Organization: O.S. Systems Software LTDA.
 
 Upstream-Status: Pending
 
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 ---
  meson.build       | 2 +-
  meson_options.txt | 6 ++++++
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 0e50bb26c0a..de065c290d6 100644
+index 1e31eb4..512eec6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -137,7 +137,7 @@ with_dri_r200 = dri_drivers.contains('r200')
+@@ -147,7 +147,7 @@ with_dri_r200 = dri_drivers.contains('r200')
  with_dri_nouveau = dri_drivers.contains('nouveau')
  with_dri_swrast = dri_drivers.contains('swrast')
  
@@ -28,7 +28,7 @@ index 0e50bb26c0a..de065c290d6 100644
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
 diff --git a/meson_options.txt b/meson_options.txt
-index fcd49efea27..0529200b3bb 100644
+index 76cef24..a8abd04 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -34,6 +34,12 @@ option(
diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
new file mode 100644
index 0000000000..b5658d0c9d
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
@@ -0,0 +1,147 @@
+From 1b1cb6e5ea25eaa98573328b9565728a08245997 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Thu, 14 Nov 2019 09:06:02 -0800
+Subject: [PATCH] Revert "mesa: Enable asm unconditionally, now that
+ gen_matypes is gone."
+
+This reverts commit 20294dceebc23236e33b22578245f7e6f41b6997.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
+
+---
+ meson.build       | 94 ++++++++++++++++++++++++++++++-----------------
+ meson_options.txt |  6 +++
+ 2 files changed, 67 insertions(+), 33 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 512eec6..a2bcc3a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -49,6 +49,7 @@ with_vulkan_icd_dir = get_option('vulkan-icd-dir')
+ with_tests = get_option('build-tests')
+ with_valgrind = get_option('valgrind')
+ with_libunwind = get_option('libunwind')
++with_asm = get_option('asm')
+ with_glx_read_only_text = get_option('glx-read-only-text')
+ with_glx_direct = get_option('glx-direct')
+ with_osmesa = get_option('osmesa')
+@@ -985,41 +986,68 @@ endif
+ 
+ # TODO: shared/static? Is this even worth doing?
+ 
++# When cross compiling we generally need to turn off the use of assembly,
++# because mesa's assembly relies on building an executable for the host system,
++# and running it to get information about struct sizes. There is at least one
++# case of cross compiling where we can use asm, and that's x86_64 -> x86 when
++# host OS == build OS, since in that case the build machine can run the host's
++# binaries.
++if with_asm and meson.is_cross_build()
++  if build_machine.system() != host_machine.system()
++    # TODO: It may be possible to do this with an exe_wrapper (like wine).
++    message('Cross compiling from one OS to another, disabling assembly.')
++    with_asm = false
++  elif not (build_machine.cpu_family().startswith('x86') and host_machine.cpu_family() == 'x86')
++    # FIXME: Gentoo always sets -m32 for x86_64 -> x86 builds, resulting in an
++    # x86 -> x86 cross compile. We use startswith rather than == to handle this
++    # case.
++    # TODO: There may be other cases where the 64 bit version of the
++    # architecture can run 32 bit binaries (aarch64 and armv7 for example)
++    message('''
++      Cross compiling to different architectures, and the host cannot run
++      the build machine's binaries. Disabling assembly.
++    ''')
++    with_asm = false
++  endif
++endif
++
+ with_asm_arch = ''
+-if host_machine.cpu_family() == 'x86'
+-  if system_has_kms_drm or host_machine.system() == 'gnu'
+-    with_asm_arch = 'x86'
+-    pre_args += ['-DUSE_X86_ASM', '-DUSE_MMX_ASM', '-DUSE_3DNOW_ASM',
+-                 '-DUSE_SSE_ASM']
+-
+-    if with_glx_read_only_text
+-      pre_args += ['-DGLX_X86_READONLY_TEXT']
++if with_asm
++  if host_machine.cpu_family() == 'x86'
++    if system_has_kms_drm or host_machine.system() == 'gnu'
++      with_asm_arch = 'x86'
++      pre_args += ['-DUSE_X86_ASM', '-DUSE_MMX_ASM', '-DUSE_3DNOW_ASM',
++                   '-DUSE_SSE_ASM']
++
++      if with_glx_read_only_text
++         pre_args += ['-DGLX_X86_READONLY_TEXT']
++      endif
++    endif
++  elif host_machine.cpu_family() == 'x86_64'
++    if system_has_kms_drm
++      with_asm_arch = 'x86_64'
++      pre_args += ['-DUSE_X86_64_ASM']
++    endif
++  elif host_machine.cpu_family() == 'arm'
++    if system_has_kms_drm
++      with_asm_arch = 'arm'
++      pre_args += ['-DUSE_ARM_ASM']
++    endif
++  elif host_machine.cpu_family() == 'aarch64'
++    if system_has_kms_drm
++      with_asm_arch = 'aarch64'
++      pre_args += ['-DUSE_AARCH64_ASM']
++    endif
++  elif host_machine.cpu_family() == 'sparc64'
++    if system_has_kms_drm
++      with_asm_arch = 'sparc'
++      pre_args += ['-DUSE_SPARC_ASM']
++    endif
++  elif host_machine.cpu_family().startswith('ppc64') and host_machine.endian() == 'little'
++    if system_has_kms_drm
++      with_asm_arch = 'ppc64le'
++      pre_args += ['-DUSE_PPC64LE_ASM']
+     endif
+-  endif
+-elif host_machine.cpu_family() == 'x86_64'
+-  if system_has_kms_drm
+-    with_asm_arch = 'x86_64'
+-    pre_args += ['-DUSE_X86_64_ASM']
+-  endif
+-elif host_machine.cpu_family() == 'arm'
+-  if system_has_kms_drm
+-    with_asm_arch = 'arm'
+-    pre_args += ['-DUSE_ARM_ASM']
+-  endif
+-elif host_machine.cpu_family() == 'aarch64'
+-  if system_has_kms_drm
+-    with_asm_arch = 'aarch64'
+-    pre_args += ['-DUSE_AARCH64_ASM']
+-  endif
+-elif host_machine.cpu_family() == 'sparc64'
+-  if system_has_kms_drm
+-    with_asm_arch = 'sparc'
+-    pre_args += ['-DUSE_SPARC_ASM']
+-  endif
+-elif host_machine.cpu_family().startswith('ppc64') and host_machine.endian() == 'little'
+-  if system_has_kms_drm
+-    with_asm_arch = 'ppc64le'
+-    pre_args += ['-DUSE_PPC64LE_ASM']
+   endif
+ endif
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+index a8abd04..0f4bd80 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -233,6 +233,12 @@ option(
+   value : false,
+   description : 'Enable GLVND support.'
+ )
++option(
++  'asm',
++  type : 'boolean',
++  value : true,
++  description : 'Build assembly code if possible'
++)
+ option(
+    'glx-read-only-text',
+    type : 'boolean',
diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e5808ee27..1771735915 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
 
 PE = "2"
 
@@ -57,12 +57,12 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-                   glx-tls \
+                   elf-tls \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls"
 
-PACKAGECONFIG_remove_libc-musl = "glx-tls"
+PACKAGECONFIG_remove_libc-musl = "elf-tls"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
@@ -70,7 +70,7 @@ PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
-PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
+PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
 PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_19.2.4.bb
similarity index 72%
rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_19.2.4.bb
index 19221e9e25..f4b33df227 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.2.4.bb
@@ -2,12 +2,13 @@ require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-           file://0002-meson.build-make-TLS-GLX-optional-again.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
+           file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            "
 
-SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
-SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
+SRC_URI[md5sum] = "5c047732b81651ddb341597528b4b096"
+SRC_URI[sha256sum] = "09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e548e30f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.23.0


