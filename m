Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 609D8745C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 10:29:45 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k16-v6so8609007wro.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=ovoEJzBGcOU0stUSfUweSLh9IMB4lCh34STb69Lz5SE=;
	b=va36xqTHgyMytiaUQKcDKracwHYAIfFt+TtvHTRiL2U3fgC3/bUaDNt3/9FtbLJF//
	the8VI4ZFc9E5iQeKLIjRsIwnius8bkH1rsLzt4kh2tDl1HE0D4ok71VGtx1J2sWP1Z+
	bbHssC3z2LhDpyd4+vxgeAcuMYqoSbQ/njoGcdMV3793Hd3beC+PyPTDbfJIe8DNJBps
	1LK4OopspWjwKnWy1wTJhkLcN2pNEqGRRAQiNQWvtloCGoxCRbJNxBb1+F2BVND+0tlW
	9LlvvRa3eNoPdpOm2Po51PAXTV42Likq/qtAE2muUJqr57ejHosniKUlEv++qSDIMCRR
	mpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=ovoEJzBGcOU0stUSfUweSLh9IMB4lCh34STb69Lz5SE=;
	b=LjWtOfFhiUhJPYaOnHhy8rqPWTox1fen22aJobNEbAY5rxydKKqfCjlit/op9M17mW
	2GP21zNQ3G/atB7OaUV+E/z1UKZDVAfriDyGfnIzfjjVv0qXq1JkH5JyN+QT/3rsSEK+
	GMsFIewt5gZXnmYgsnifufVcUgbVeoUYyVwutLVERDOhxD0ov1/lTeNmw8FjpMnr5xRU
	GllWk2aC4eFMM3v+agQxqbM2W+X/86U37wqTUOs3+VYjYctnokXC/gqDgrN6Qsm2OCaT
	Zxw833kwungj5E5/bhHp/DIlKRJVvEDpB97RmSQr2Ht89Qg95qJSUuzjQRcHdHEoosoa
	jhxA==
X-Gm-Message-State: ALKqPwdrdFiQwmjvr3ly70wI897t4jJ1fGebT5vm1NAQAAuGJNwUuogR
	eURLIp2KzN9evrVYR2bggzNk2Q==
X-Google-Smtp-Source: ADUXVKLGqBtaDrrXqdATdjp0PJ/CSV0fQSAhw05bm5OpIulDyC6IRNpyM1yBuPiA++CXlR2Bs61iYw==
X-Received: by 2002:adf:8af5:: with SMTP id
	z50-v6mr7853209wrz.22.1527848985402; 
	Fri, 01 Jun 2018 03:29:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i11-v6sm25749737wre.66.2018.06.01.03.29.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jun 2018 03:29:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 10:29:38 +0000
Message-Id: <a32569475d7b6392928c6d6e184895bc3f0ad7c7.1527848868.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
In-Reply-To: <cover.1527848868.git.Martin.Jansa@gmail.com>
References: <cover.1527848868.git.Martin.Jansa@gmail.com>
Subject: [master][PATCH 1/4] qemu: refresh patches with devtool and make them applicable with git
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
X-List-Received-Date: Fri, 01 Jun 2018 10:29:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...allow-user-to-disable-pointer-grabs.patch} | 25 +++++++-------
 ...mu-Add-missing-wacom-HID-descriptor.patch} | 24 ++++++++-----
 ...est-which-runs-all-unit-test-cases-.patch} | 12 ++++---
 ...-environment-space-to-boot-loader-q.patch} | 17 +++++-----
 ...patch => 0005-qemu-disable-Valgrind.patch} | 18 ++++++++--
 ...searched-during-user-mode-emulation.patch} | 34 ++++++++++++-------
 ...d.bfd-fix-cflags-and-set-some-envir.patch} | 12 ++++++-
 ...connect-socket-to-a-spawned-command.patch} | 33 ++++++++----------
 ... 0009-apic-fixup-fallthrough-to-PIC.patch} | 14 ++++----
 ...ebkitgtk-hangs-on-32-bit-x86-target.patch} |  9 ++---
 ...ch => 0011-memfd-fix-configure-test.patch} | 15 ++++----
 ...-treat-DISAS_UPDATE-as-variant-of-D.patch} |  9 ++---
 ...Queue-pointers-in-post_load-routine.patch} |  5 +--
 ...-libcap-header-issue-on-some-distro.patch} | 15 ++++----
 ...messages-when-qemi_cpu_kick_thread-.patch} | 11 +++---
 meta/recipes-devtools/qemu/qemu_2.11.1.bb     | 31 ++++++++---------
 16 files changed, 156 insertions(+), 128 deletions(-)
 rename meta/recipes-devtools/qemu/qemu/{disable-grabs.patch => 0001-sdl.c-allow-user-to-disable-pointer-grabs.patch} (86%)
 rename meta/recipes-devtools/qemu/qemu/{wacom.patch => 0002-qemu-Add-missing-wacom-HID-descriptor.patch} (87%)
 rename meta/recipes-devtools/qemu/qemu/{add-ptest-in-makefile-v10.patch => 0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch} (65%)
 rename meta/recipes-devtools/qemu/qemu/{qemu-enlarge-env-entry-size.patch => 0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch} (66%)
 rename meta/recipes-devtools/qemu/qemu/{no-valgrind.patch => 0005-qemu-disable-Valgrind.patch} (47%)
 rename meta/recipes-devtools/qemu/qemu/{pathlimit.patch => 0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch} (78%)
 rename meta/recipes-devtools/qemu/qemu/{qemu-2.5.0-cflags.patch => 0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch} (51%)
 rename meta/recipes-devtools/qemu/qemu/{chardev-connect-socket-to-a-spawned-command.patch => 0008-chardev-connect-socket-to-a-spawned-command.patch} (92%)
 rename meta/recipes-devtools/qemu/qemu/{apic-fixup-fallthrough-to-PIC.patch => 0009-apic-fixup-fallthrough-to-PIC.patch} (80%)
 rename meta/recipes-devtools/qemu/qemu/{linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch => 0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch} (87%)
 rename meta/recipes-devtools/qemu/qemu/{memfd.patch => 0011-memfd-fix-configure-test.patch} (88%)
 rename meta/recipes-devtools/qemu/qemu/{0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch => 0012-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch} (93%)
 rename meta/recipes-devtools/qemu/qemu/{check-PS2Queue-pointers-in-post_load-routine.patch => 0013-ps2-check-PS2Queue-pointers-in-post_load-routine.patch} (96%)
 rename meta/recipes-devtools/qemu/qemu/{fix-libcap-header-issue-on-some-distro.patch => 0014-fix-libcap-header-issue-on-some-distro.patch} (88%)
 rename meta/recipes-devtools/qemu/qemu/{cpus.c-qemu_cpu_kick_thread_debugging.patch => 0015-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch} (88%)

diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch b/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-disable-pointer-grabs.patch
similarity index 86%
rename from meta/recipes-devtools/qemu/qemu/disable-grabs.patch
rename to meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-disable-pointer-grabs.patch
index 77117890f4..add5d8b02f 100644
--- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-disable-pointer-grabs.patch
@@ -1,3 +1,11 @@
+From 273e1af49d3e0a58bb9464369deb2652f243e649 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 18 Sep 2013 14:04:54 +0100
+Subject: [PATCH] sdl.c: allow user to disable pointer grabs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 When the pointer enters the Qemu window it calls SDL_WM_GrabInput, which calls
 XGrabPointer in a busyloop until it returns GrabSuccess. However if there's already
 a pointer grab (screen is locked, a menu is open) then qemu will hang until the
@@ -11,23 +19,16 @@ them in a conditional that can be set by the autobuilder environment, preserving
 the current grabbing behaviour for everyone else.
 
 Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 18 Sep 2013 14:04:54 +0100
-Subject: [PATCH] sdl.c: allow user to disable pointer grabs
-
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Eric Bénard <eric@eukrea.com>
 ---
  ui/sdl.c | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
-Index: qemu-2.11.1/ui/sdl.c
-===================================================================
---- qemu-2.11.1.orig/ui/sdl.c
-+++ qemu-2.11.1/ui/sdl.c
+diff --git a/ui/sdl.c b/ui/sdl.c
+index 7b71a9a..29ce1b9 100644
+--- a/ui/sdl.c
++++ b/ui/sdl.c
 @@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;
  static int scaling_active = 0;
  static Notifier mouse_mode_notifier;
@@ -58,7 +59,7 @@ Index: qemu-2.11.1/ui/sdl.c
      gui_grab = 0;
      sdl_show_cursor();
      sdl_update_caption();
-@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,
+@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
       * This requires SDL >= 1.2.14. */
      setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
  
diff --git a/meta/recipes-devtools/qemu/qemu/wacom.patch b/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-HID-descriptor.patch
similarity index 87%
rename from meta/recipes-devtools/qemu/qemu/wacom.patch
rename to meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-HID-descriptor.patch
index cd06aa4ac6..281803ecb5 100644
--- a/meta/recipes-devtools/qemu/qemu/wacom.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-HID-descriptor.patch
@@ -1,19 +1,27 @@
+From a42726e017605ed3ca2b3fc2b1cc8d01ccf34730 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 27 Nov 2014 14:04:29 +0000
+Subject: [PATCH] qemu: Add missing wacom HID descriptor
+
 The USB wacom device is missing a HID descriptor which causes it
 to fail to operate with recent kernels (e.g. 3.17).
 
-This patch adds a HID desriptor to the device, based upon one from 
+This patch adds a HID desriptor to the device, based upon one from
 real wcom device.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Submitted
 2014/11/27
+---
+ hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 93 insertions(+), 1 deletion(-)
 
-Index: qemu-2.1.0/hw/usb/dev-wacom.c
-===================================================================
---- qemu-2.1.0.orig/hw/usb/dev-wacom.c	2014-08-01 15:12:17.000000000 +0100
-+++ qemu-2.1.0/hw/usb/dev-wacom.c	2014-10-12 12:13:30.540306042 +0100
-@@ -68,6 +68,89 @@
+diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
+index bf70013..2f6e129 100644
+--- a/hw/usb/dev-wacom.c
++++ b/hw/usb/dev-wacom.c
+@@ -72,6 +72,89 @@ static const USBDescStrings desc_strings = {
      [STR_SERIALNUMBER]     = "1",
  };
  
@@ -103,7 +111,7 @@ Index: qemu-2.1.0/hw/usb/dev-wacom.c
  static const USBDescIface desc_iface_wacom = {
      .bInterfaceNumber              = 0,
      .bNumEndpoints                 = 1,
-@@ -85,7 +168,7 @@
+@@ -89,7 +172,7 @@ static const USBDescIface desc_iface_wacom = {
                  0x00,          /*  u8  country_code */
                  0x01,          /*  u8  num_descriptors */
                  0x22,          /*  u8  type: Report */
@@ -112,7 +120,7 @@ Index: qemu-2.1.0/hw/usb/dev-wacom.c
              },
          },
      },
-@@ -265,6 +350,15 @@
+@@ -269,6 +352,15 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
      }
  
      switch (request) {
diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch b/meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
similarity index 65%
rename from meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
rename to meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
index e9639820be..dc073000c9 100644
--- a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
@@ -1,19 +1,23 @@
-From 4201a5791fc4798a45a9b9f881602d7bacb74ed1 Mon Sep 17 00:00:00 2001
+From fda1eee8bc717528d57f6ff454f72c5325043c31 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Thu, 31 Aug 2017 11:06:56 -0700
-Subject: Add subpackage -ptest which runs all unit test cases for qemu.
+Subject: [PATCH] Add subpackage -ptest which runs all unit test cases for
+ qemu.
 
 Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+---
+ tests/Makefile.include | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 diff --git a/tests/Makefile.include b/tests/Makefile.include
-index f08b741..3d1b3e9 100644
+index c002352..f557c26 100644
 --- a/tests/Makefile.include
 +++ b/tests/Makefile.include
-@@ -924,4 +924,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+@@ -935,4 +935,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
  -include $(wildcard tests/*.d)
  -include $(wildcard tests/libqos/*.d)
  
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch
similarity index 66%
rename from meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
rename to meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index c7425ab8d4..4f28e1676b 100644
--- a/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,8 @@
-qemu: Add addition environment space to boot loader qemu-system-mips 
+From ad70fdcaf75084da2e02474c61d1d441ca100ab2 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Fri, 28 Mar 2014 17:42:43 +0800
+Subject: [PATCH] qemu: Add addition environment space to boot loader
+ qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
 
@@ -10,14 +14,14 @@ to only 256 bytes. This patch expands the limit.
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 ---
- hw/mips/mips_malta.c    |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ hw/mips/mips_malta.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
-index 9d521cc..17c0391 100644
+index ec6af4a..6e76166 100644
 --- a/hw/mips/mips_malta.c
 +++ b/hw/mips/mips_malta.c
-@@ -53,7 +53,7 @@
+@@ -61,7 +61,7 @@
  
  #define ENVP_ADDR		0x80002000l
  #define ENVP_NB_ENTRIES	 	16
@@ -26,6 +30,3 @@ index 9d521cc..17c0391 100644
  
  /* Hardware addresses */
  #define FLASH_ADDRESS 0x1e000000ULL
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/no-valgrind.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.patch
similarity index 47%
rename from meta/recipes-devtools/qemu/qemu/no-valgrind.patch
rename to meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.patch
index 91f728042d..b9e01834ef 100644
--- a/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.patch
@@ -1,13 +1,24 @@
+From e85ee3cc9988172662d6969af01f23fa8ffd5262 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 20 Oct 2015 22:19:08 +0100
+Subject: [PATCH] qemu: disable Valgrind
+
 There isn't an option to enable or disable valgrind support, so disable it to avoid non-deterministic builds.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure | 9 ---------
+ 1 file changed, 9 deletions(-)
 
 diff --git a/configure b/configure
-index b3c4f51..4d3929e 100755
+index 0c6e757..c30fd45 100755
 --- a/configure
 +++ b/configure
-@@ -4193,9 +4192,0 @@ valgrind_h=no
+@@ -4741,15 +4741,6 @@ fi
+ # check if we have valgrind/valgrind.h
+ 
+ valgrind_h=no
 -cat > $TMPC << EOF
 -#include <valgrind/valgrind.h>
 -int main(void) {
@@ -17,3 +28,6 @@ index b3c4f51..4d3929e 100755
 -if compile_prog "" "" ; then
 -    valgrind_h=yes
 -fi
+ 
+ ########################################
+ # check if environ is declared
diff --git a/meta/recipes-devtools/qemu/qemu/pathlimit.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch
similarity index 78%
rename from meta/recipes-devtools/qemu/qemu/pathlimit.patch
rename to meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch
index 57ab981c61..9315f8561a 100644
--- a/meta/recipes-devtools/qemu/qemu/pathlimit.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch
@@ -1,3 +1,8 @@
+From c79c48a79710d0e2ef68062435596ac455cd9f71 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 9 Mar 2016 22:49:02 +0000
+Subject: [PATCH] qemu: Limit paths searched during user mode emulation
+
 By default qemu builds a complete list of directories within the user
 emulation sysroot (-L option). The OE sysroot directory is large and
 this is confusing, for example it indexes all pkgdata. In particular this
@@ -8,18 +13,21 @@ things if/as/when it needs to. This drastically reduces the files it
 reads and reduces memory usage and cleans up strace.
 
 It would also avoid the infinite directory traversal bug in [YOCTO #6996]
-although the code could still be vulnerable if it parsed those specific 
+although the code could still be vulnerable if it parsed those specific
 paths.
 
 RP
 2016/3/9
 Upstream-Status: Pending
+---
+ util/path.c | 44 ++++++++++++++++++++++----------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
 
-Index: qemu-2.5.0/util/path.c
-===================================================================
---- qemu-2.5.0.orig/util/path.c
-+++ qemu-2.5.0/util/path.c
-@@ -19,6 +19,7 @@ struct pathelem
+diff --git a/util/path.c b/util/path.c
+index 7f9fc27..a416cd4 100644
+--- a/util/path.c
++++ b/util/path.c
+@@ -15,6 +15,7 @@ struct pathelem
      char *name;
      /* Full path name, eg. /usr/gnemul/x86-linux/lib. */
      char *pathname;
@@ -27,7 +35,7 @@ Index: qemu-2.5.0/util/path.c
      struct pathelem *parent;
      /* Children */
      unsigned int num_entries;
-@@ -49,6 +50,7 @@ static struct pathelem *new_entry(const
+@@ -45,6 +46,7 @@ static struct pathelem *new_entry(const char *root,
      new->name = g_strdup(name);
      new->pathname = g_strdup_printf("%s/%s", root, name);
      new->num_entries = 0;
@@ -35,7 +43,7 @@ Index: qemu-2.5.0/util/path.c
      return new;
  }
  
-@@ -57,15 +59,16 @@ static struct pathelem *new_entry(const
+@@ -53,15 +55,16 @@ static struct pathelem *new_entry(const char *root,
  /* Not all systems provide this feature */
  #if defined(DT_DIR) && defined(DT_UNKNOWN) && defined(DT_LNK)
  # define dirent_type(dirent) ((dirent)->d_type)
@@ -55,7 +63,7 @@ Index: qemu-2.5.0/util/path.c
      DIR *dir;
  
      if ((dir = opendir(path->pathname)) != NULL) {
-@@ -78,6 +81,11 @@ static struct pathelem *add_dir_maybe(st
+@@ -74,6 +77,11 @@ static struct pathelem *add_dir_maybe(struct pathelem *path)
          }
          closedir(dir);
      }
@@ -67,7 +75,7 @@ Index: qemu-2.5.0/util/path.c
      return path;
  }
  
-@@ -93,26 +101,16 @@ static struct pathelem *add_entry(struct
+@@ -89,26 +97,16 @@ static struct pathelem *add_entry(struct pathelem *root, const char *name,
      e = &root->entries[root->num_entries-1];
  
      *e = new_entry(root->pathname, root, name);
@@ -97,7 +105,7 @@ Index: qemu-2.5.0/util/path.c
  {
      unsigned int i, namelen;
  
-@@ -123,14 +121,18 @@ follow_path(const struct pathelem *curso
+@@ -119,14 +117,18 @@ follow_path(const struct pathelem *cursor, const char *name)
          return cursor->pathname;
  
      if (strneq(name, namelen, ".."))
@@ -119,7 +127,7 @@ Index: qemu-2.5.0/util/path.c
  
      /* Not found */
      return NULL;
-@@ -164,8 +166,6 @@ void init_paths(const char *prefix)
+@@ -160,8 +162,6 @@ void init_paths(const char *prefix)
          g_free(base->name);
          g_free(base);
          base = NULL;
@@ -128,7 +136,7 @@ Index: qemu-2.5.0/util/path.c
      }
  }
  
-@@ -177,5 +177,5 @@ const char *path(const char *name)
+@@ -173,5 +173,5 @@ const char *path(const char *name)
      if (!base || !name || name[0] != '/')
          return name;
  
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
similarity index 51%
rename from meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
rename to meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
index eb99d14639..ad52f37d9b 100644
--- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
@@ -1,8 +1,18 @@
+From 4b21a8db60c32f93df56e6111bb926c91680d6f2 Mon Sep 17 00:00:00 2001
+From: Stephen Arnold <sarnold@vctlabs.com>
+Date: Sun, 12 Jun 2016 18:09:56 -0700
+Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment
+
 Upstream-Status: Pending
+---
+ configure | 4 ----
+ 1 file changed, 4 deletions(-)
 
+diff --git a/configure b/configure
+index c30fd45..b5312f4 100755
 --- a/configure
 +++ b/configure
-@@ -4468,10 +4468,6 @@ fi
+@@ -5115,10 +5115,6 @@ fi
  if test "$gcov" = "yes" ; then
    CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
    LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-to-a-spawned-command.patch
similarity index 92%
rename from meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
rename to meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-to-a-spawned-command.patch
index 6e6bf95c18..f0c0fa19b4 100644
--- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-to-a-spawned-command.patch
@@ -1,4 +1,4 @@
-From 3bb3100c22eb30146a69656480bdffeef8663575 Mon Sep 17 00:00:00 2001
+From 55c9510311b7481a0c8f3f71b3ce130cc25563f9 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Thu, 21 Dec 2017 11:35:16 -0800
 Subject: [PATCH] chardev: connect socket to a spawned command
@@ -45,13 +45,13 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 ---
- chardev/char-socket.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++++---
+ chardev/char-socket.c | 99 +++++++++++++++++++++++++++++++++++++++++++++++++++
  chardev/char.c        |  3 ++
  qapi/char.json        |  5 +++
- 3 files changed, 90 insertions(+), 4 deletions(-)
+ 3 files changed, 107 insertions(+)
 
 diff --git a/chardev/char-socket.c b/chardev/char-socket.c
-index 53eda8ef00..f566107c35 100644
+index 53eda8e..6c63555 100644
 --- a/chardev/char-socket.c
 +++ b/chardev/char-socket.c
 @@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
@@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 100644
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
                                      bool *be_opened,
-@@ -859,6 +921,9 @@
+@@ -859,6 +921,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,15 +133,14 @@ index 53eda8ef00..f566107c35 100644
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -925,7 +990,14 @@
+@@ -925,7 +990,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
      } else if (reconnect > 0) {
          s->reconnect_time = reconnect;
      }
--
 +#ifndef _WIN32
 +    if (cmd) {
 +        chardev_open_socket_cmd(chr, cmd, errp);
-+
+ 
 +        /* everything ready (or failed permanently) before we return */
 +        *be_opened = true;
 +    } else
@@ -149,7 +148,7 @@ index 53eda8ef00..f566107c35 100644
      if (s->reconnect_time) {
          sioc = qio_channel_socket_new();
          tcp_chr_set_client_ioc_name(chr, sioc);
-@@ -985,10 +1057,26 @@
+@@ -985,10 +1057,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *tls_creds = qemu_opt_get(opts, "tls-creds");
@@ -176,7 +175,7 @@ index 53eda8ef00..f566107c35 100644
      if (!path) {
          if (!host) {
              error_setg(errp, "chardev: socket: no host given");
-@@ -1021,13 +1109,24 @@
+@@ -1021,13 +1109,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      sock->has_reconnect = true;
      sock->reconnect = reconnect;
      sock->tls_creds = g_strdup(tls_creds);
@@ -202,21 +201,21 @@ index 53eda8ef00..f566107c35 100644
          addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
          addr->u.inet.data = g_new(InetSocketAddress, 1);
 diff --git a/chardev/char.c b/chardev/char.c
-index 2ae4f465ec..5d52cd5de5 100644
+index 2ae4f46..5d52cd5 100644
 --- a/chardev/char.c
 +++ b/chardev/char.c
-@@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts = {
-         },{
+@@ -793,6 +793,9 @@ QemuOptsList qemu_chardev_opts = {
              .name = "path",
              .type = QEMU_OPT_STRING,
-+        },{
+         },{
 +            .name = "cmd",
 +            .type = QEMU_OPT_STRING,
-         },{
++        },{
              .name = "host",
              .type = QEMU_OPT_STRING,
+         },{
 diff --git a/qapi/char.json b/qapi/char.json
-index ae19dcd1ed..6de0f29bcd 100644
+index ae19dcd..6de0f29 100644
 --- a/qapi/char.json
 +++ b/qapi/char.json
 @@ -241,6 +241,10 @@
@@ -238,5 +237,3 @@ index ae19dcd1ed..6de0f29bcd 100644
                                       '*tls-creds'  : 'str',
                                       '*server'    : 'bool',
                                       '*wait'      : 'bool',
--- 
-2.14.1
diff --git a/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-to-PIC.patch
similarity index 80%
rename from meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
rename to meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-to-PIC.patch
index d6a3522eda..915bfdac58 100644
--- a/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From bef93bb81588b5323a52d2e1886f2a77b64a976b Mon Sep 17 00:00:00 2001
+From 945f428016f278fa8e38bc8d153397c3195f85a5 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
-Subject: [PATCH 03/18] apic: fixup fallthrough to PIC
+Subject: [PATCH] apic: fixup fallthrough to PIC
 
 Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
 interrupts through the local APIC if the local APIC config says so.]
@@ -28,11 +28,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-2.11.1/hw/intc/apic.c
-===================================================================
---- qemu-2.11.1.orig/hw/intc/apic.c
-+++ qemu-2.11.1/hw/intc/apic.c
-@@ -591,7 +591,7 @@ int apic_accept_pic_intr(DeviceState *de
+diff --git a/hw/intc/apic.c b/hw/intc/apic.c
+index fe15fb6..8352c39 100644
+--- a/hw/intc/apic.c
++++ b/hw/intc/apic.c
+@@ -591,7 +591,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
similarity index 87%
rename from meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
rename to meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
index d2c52252f6..ceb3980fc5 100644
--- a/meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
@@ -1,4 +1,4 @@
-From 4fa4aae4176ef6d8f4d4b8323d061e2433918a26 Mon Sep 17 00:00:00 2001
+From 4333b2b269d997a719e19f00d044105e17700be2 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Wed, 17 Jan 2018 10:51:49 -0800
 Subject: [PATCH] linux-user: Fix webkitgtk hangs on 32-bit x86 target
@@ -18,10 +18,10 @@ Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/linux-user/main.c b/linux-user/main.c
-index 450eb3ce65..c7cc0a184e 100644
+index 146ee3e..1332b5c 100644
 --- a/linux-user/main.c
 +++ b/linux-user/main.c
-@@ -77,7 +77,7 @@ do {                                                                    \
+@@ -78,7 +78,7 @@ do {                                                                    \
        (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
  /* There are a number of places where we assign reserved_va to a variable
     of type abi_ulong and expect it to fit.  Avoid the last page.  */
@@ -30,6 +30,3 @@ index 450eb3ce65..c7cc0a184e 100644
  #  else
  #   define MAX_RESERVED_VA  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
  #  endif
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/memfd.patch b/meta/recipes-devtools/qemu/qemu/0011-memfd-fix-configure-test.patch
similarity index 88%
rename from meta/recipes-devtools/qemu/qemu/memfd.patch
rename to meta/recipes-devtools/qemu/qemu/0011-memfd-fix-configure-test.patch
index 62e8d3800b..880cb980a0 100644
--- a/meta/recipes-devtools/qemu/qemu/memfd.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-memfd-fix-configure-test.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
+From 0c8af3f651a125d636a71d93bafd35ff5240431a Mon Sep 17 00:00:00 2001
 From: Paolo Bonzini <pbonzini@redhat.com>
 Date: Tue, 28 Nov 2017 11:51:27 +0100
 Subject: [PATCH] memfd: fix configure test
@@ -19,6 +16,8 @@ file actually does not exist---it is a typo in the memfd_create(2) man
 page.
 
 Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
 ---
  configure    | 2 +-
@@ -26,10 +25,10 @@ Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 9c8aa5a98b..99ccc1725a 100755
+index b5312f4..ec12f36 100755
 --- a/configure
 +++ b/configure
-@@ -3923,7 +3923,7 @@ fi
+@@ -3920,7 +3920,7 @@ fi
  # check if memfd is supported
  memfd=no
  cat > $TMPC << EOF
@@ -39,7 +38,7 @@ index 9c8aa5a98b..99ccc1725a 100755
  int main(void)
  {
 diff --git a/util/memfd.c b/util/memfd.c
-index 4571d1aba8..412e94a405 100644
+index 4571d1a..412e94a 100644
 --- a/util/memfd.c
 +++ b/util/memfd.c
 @@ -31,9 +31,7 @@
@@ -53,5 +52,3 @@ index 4571d1aba8..412e94a405 100644
  #include <sys/syscall.h>
  #include <asm/unistd.h>
  
--- 
-2.11.0
diff --git a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch b/meta/recipes-devtools/qemu/qemu/0012-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
similarity index 93%
rename from meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
rename to meta/recipes-devtools/qemu/qemu/0012-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
index f90cae694c..be92502095 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
@@ -1,4 +1,4 @@
-From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:00 2001
+From 7354b9b24c36ee712bb6e881d39504bf1b6a4c8b Mon Sep 17 00:00:00 2001
 From: Victor Kamensky <kamensky@cisco.com>
 Date: Fri, 23 Mar 2018 18:26:45 +0000
 Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of
@@ -43,10 +43,10 @@ Upstream-Status: Backport
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
-index 31ff047..327513e 100644
+index 625ef2d..c381091 100644
 --- a/target/arm/translate-a64.c
 +++ b/target/arm/translate-a64.c
-@@ -13378,12 +13378,12 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
+@@ -11384,12 +11384,12 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          case DISAS_UPDATE:
              gen_a64_set_pc_im(dc->pc);
              /* fall through */
@@ -62,6 +62,3 @@ index 31ff047..327513e 100644
          case DISAS_NORETURN:
          case DISAS_SWI:
              break;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch b/meta/recipes-devtools/qemu/qemu/0013-ps2-check-PS2Queue-pointers-in-post_load-routine.patch
similarity index 96%
rename from meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
rename to meta/recipes-devtools/qemu/qemu/0013-ps2-check-PS2Queue-pointers-in-post_load-routine.patch
index f8d7f66ace..d2bdf6b017 100644
--- a/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
+++ b/meta/recipes-devtools/qemu/qemu/0013-ps2-check-PS2Queue-pointers-in-post_load-routine.patch
@@ -1,4 +1,4 @@
-From ee9a17d0e12143971a9676227cce953c0dbe52fb Mon Sep 17 00:00:00 2001
+From 065061dca34fa5b91be6dce9a87a8755d8826c78 Mon Sep 17 00:00:00 2001
 From: Prasad J Pandit <pjp@fedoraproject.org>
 Date: Thu, 16 Nov 2017 13:21:55 +0530
 Subject: [PATCH] ps2: check PS2Queue pointers in post_load routine
@@ -58,6 +58,3 @@ index f388a23..de171a2 100644
      /* reset rptr/wptr/count */
      q->rptr = 0;
      q->wptr = size;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0014-fix-libcap-header-issue-on-some-distro.patch
similarity index 88%
rename from meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
rename to meta/recipes-devtools/qemu/qemu/0014-fix-libcap-header-issue-on-some-distro.patch
index cee6a676ab..b662a41508 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
+++ b/meta/recipes-devtools/qemu/qemu/0014-fix-libcap-header-issue-on-some-distro.patch
@@ -1,4 +1,7 @@
-fix libcap header issue on some distro
+From 47fdb0b6e2e393194a8c81544c647fdd997aec7f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 12 Mar 2013 09:54:06 +0800
+Subject: [PATCH] fix libcap header issue on some distro
 
 1, When build qemu-native on SLED 11.2, there is an error:
 ...
@@ -52,13 +55,14 @@ http://patchwork.linuxtv.org/patch/12748/
 Upstream-Status: Pending
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- fsdev/virtfs-proxy-helper.c |    7 +++++--
+ fsdev/virtfs-proxy-helper.c | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
+index 8e48500..6490030 100644
 --- a/fsdev/virtfs-proxy-helper.c
 +++ b/fsdev/virtfs-proxy-helper.c
-@@ -12,7 +12,6 @@
+@@ -13,7 +13,6 @@
  #include <sys/resource.h>
  #include <getopt.h>
  #include <syslog.h>
@@ -66,7 +70,7 @@ diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
  #include <sys/fsuid.h>
  #include <sys/vfs.h>
  #include <sys/ioctl.h>
-@@ -26,7 +25,11 @@
+@@ -27,7 +26,11 @@
  #include "9p-iov-marshal.h"
  #include "hw/9pfs/9p-proxy.h"
  #include "fsdev/9p-iov-marshal.h"
@@ -79,6 +83,3 @@ diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
  #define PROGNAME "virtfs-proxy-helper"
  
  #ifndef XFS_SUPER_MAGIC
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch b/meta/recipes-devtools/qemu/qemu/0015-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
similarity index 88%
rename from meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch
rename to meta/recipes-devtools/qemu/qemu/0015-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
index 6822132541..a5621caa95 100644
--- a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch
+++ b/meta/recipes-devtools/qemu/qemu/0015-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
@@ -1,4 +1,4 @@
-From 697a834c35d19447b7dcdb9e1d9434bc6ce17c21 Mon Sep 17 00:00:00 2001
+From db914e0f93a32b6731a636517002ecadc207718b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Wed, 12 Aug 2015 15:11:30 -0500
 Subject: [PATCH] cpus.c: Add error messages when qemi_cpu_kick_thread fails.
@@ -19,10 +19,10 @@ Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
  create mode 100644 custom_debug.h
 
 diff --git a/cpus.c b/cpus.c
-index a822ce3..7e4786e 100644
+index 114c29b..c3dd2e0 100644
 --- a/cpus.c
 +++ b/cpus.c
-@@ -1080,6 +1080,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
+@@ -1510,6 +1510,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
      return NULL;
  }
  
@@ -31,7 +31,7 @@ index a822ce3..7e4786e 100644
  static void qemu_cpu_kick_thread(CPUState *cpu)
  {
  #ifndef _WIN32
-@@ -1088,6 +1090,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
+@@ -1522,6 +1524,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
      err = pthread_kill(cpu->thread->thread, SIG_IPI);
      if (err) {
          fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
@@ -71,6 +71,3 @@ index 0000000..f029e45
 +
 +	free(symbols);
 +}
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
index ab82c5fe56..2314262d7a 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -9,27 +9,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 
 SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://powerpc_rom.bin \
-           file://disable-grabs.patch \
-           file://wacom.patch \
-           file://add-ptest-in-makefile-v10.patch \
+           file://0001-sdl.c-allow-user-to-disable-pointer-grabs.patch \
+           file://0002-qemu-Add-missing-wacom-HID-descriptor.patch \
+           file://0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch \
            file://run-ptest \
-           file://qemu-enlarge-env-entry-size.patch \
-           file://no-valgrind.patch \
-           file://pathlimit.patch \
-           file://qemu-2.5.0-cflags.patch \
-           file://chardev-connect-socket-to-a-spawned-command.patch \
-           file://apic-fixup-fallthrough-to-PIC.patch \
-           file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
-           file://memfd.patch \
-           file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
-           file://check-PS2Queue-pointers-in-post_load-routine.patch \
+           file://0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
+           file://0005-qemu-disable-Valgrind.patch \
+           file://0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch \
+           file://0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch \
+           file://0008-chardev-connect-socket-to-a-spawned-command.patch \
+           file://0009-apic-fixup-fallthrough-to-PIC.patch \
+           file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
+           file://0011-memfd-fix-configure-test.patch \
+           file://0012-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
+           file://0013-ps2-check-PS2Queue-pointers-in-post_load-routine.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-
 SRC_URI_append_class-native = " \
-            file://fix-libcap-header-issue-on-some-distro.patch \
-            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
+            file://0014-fix-libcap-header-issue-on-some-distro.patch \
+            file://0015-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
             "
 
 SRC_URI[md5sum] = "61cf862b6007eba4ac98247776af2e27"
-- 
2.17.0


