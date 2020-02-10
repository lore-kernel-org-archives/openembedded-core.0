Return-Path: <prvs=3027d17f6=alistair.francis@wdc.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Feb 2020 20:02:42 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 9E01360F6C
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1581364964; x=1612900964;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=fFeswcZ8Vtsx1YeUUYCLShGRF7Qd8Xn74vAorWzDmVE=;
	b=Tc5hFojGrCD9yDlb/pOm7B8QWAgNHlzhxFxPgwDvZYfDKXuxY4OixZkb
	2+v5EOmFvEA/hbvuXCv2NcbrbEwA4f/S61iy7asdxS1+AFr75V0KjXRK0
	sxU4DpUkjS6Q5kyPTMU/GP4qj2ax7RpTalYSelFjvpm4y/hkYz/o/TI69
	DOR7MnABATrOEmBTKmWIy6GKEQH9yXUD5AEWMxwXMultba56jULt4hEOe
	yYbqjAdJNamhr6woz6qmlCCmdNilhHnpQkLyoRbDfNcGGz9wi4h1bFU7i
	r4NGPsRs+Kf9dpe0S15Af39/3F5w5qt6w324xSsb0+e9ocUk5JWYIn/ol Q==;
IronPort-SDR: 4kcfy6xs09cvok+WdRKXLOzPuCFQssp8/nfGgWwiSf2Yrrqf31Ai3ZzSRj8pJL2LFk+7FMalN/
	JMT3067rw+0HbDubgWdY7K8sONDe4YygP1R3IeSTVGkU11KdRphBeh9yP1oH2mEAAMKpS0ZYUj
	9xZeCoPu+0bGQ1By5xWXPohcI8bLNZE7AHuVTfYq9Dqquh4YTt6ziYVbmxd0fm/+NQvtFFi2Jg
	fdNjPl/IjtHlaGUgVsZY0mgHjdeTERYgfmO7NO6io4TSfwXwLtltUTBAONr5VF3ofsnSdu6+Xs
	BF8=
X-IronPort-AV: E=Sophos;i="5.70,426,1574092800"; d="scan'208";a="237534742"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2020 03:55:35 +0800
IronPort-SDR: evIj4B1gJTyM+pgMdwVUortImnEM4ZOpAO9zBCnuyfHk57mlUp4RXpa8bMUqSkp+K4FTidjfZ3
	k5+4KyozD+OCbvpImZKYPX5zyyX+ye0oANVVNs1cJKZIM0ibnKkix2ExseKorz1NltJNjdv51d
	Pb0M10LzXFo/6onzMWsxXkIoU6SsHkQsEPELfzUu4D2Eu1c//vGCK5WfFxlXTozvWAItU0JxJl
	/LxT+1MR1F1Y1id/fUnnFYaOroo1qnmNlWUW84fGYSSRBmc8mt/iMTY/oKgx6A+8UaDy924T7R
	QKU9uNq9/pyuWE8ym7A/Uq8i
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Feb 2020 11:48:27 -0800
IronPort-SDR: 3/qdm4xWEPzqB1htenMSr6ApmYHdCHeYs6YvodTfEY8bu4cHU4MFL/zTfGUw84HUnhXDS28Ip+
	CQoxOCHoJMeodIBvcTmX3jGNmV1jAlBj4wrPxDSfKrT6gjwhX4k5HEZ7PBZ5X8aG8Ybw8txH6V
	M4CDnh5SUxV7099pydy1y9oJeDGqf66NYtbmhT4sjzAvue5kqJ/MG+524rwW/miJoUb6pWDsBe
	gU80AzxXfHhG2M0YiiiT4oyymhbTzSyoe62E8Xd8uzu0qetHgiPb0CqaLlKsjGYxgQ7D9+E1Vm
	HR8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip01.wdc.com with ESMTP; 10 Feb 2020 11:55:35 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@openembedded.org
Date: Mon, 10 Feb 2020 11:48:42 -0800
Message-Id: <20200210194842.18877-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2] qemu: Upgrade to 4.2.0
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
X-List-Received-Date: Mon, 10 Feb 2020 20:02:43 -0000
Content-Transfer-Encoding: 8bit

While we are upgrading let's refresh patches and remove the outdated
patches.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/recipes-devtools/qemu/qemu-native.inc    |   4 +-
 ...u-native_4.1.0.bb => qemu-native_4.2.0.bb} |   0
 ...e_4.1.0.bb => qemu-system-native_4.2.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   7 +-
 ...emu-Add-missing-wacom-HID-descriptor.patch |   4 +-
 ...test-which-runs-all-unit-test-cases-.patch |   6 +-
 ...n-environment-space-to-boot-loader-q.patch |  16 +--
 .../qemu/0004-qemu-disable-Valgrind.patch     |   6 +-
 ...ld.bfd-fix-cflags-and-set-some-envir.patch |   6 +-
 ...-connect-socket-to-a-spawned-command.patch |  14 +--
 .../0007-apic-fixup-fallthrough-to-PIC.patch  |   4 +-
 ...webkitgtk-hangs-on-32-bit-x86-target.patch |  12 +-
 .../qemu/qemu/0009-Fix-webkitgtk-builds.patch |  18 ++-
 ...dd-pkg-config-handling-for-libgcrypt.patch |  14 +--
 ...egression-in-parsing-vga-cmdline-par.patch |  53 +++++++++
 ...linux-user-remove-host-stime-syscall.patch |  61 ----------
 ...-libcap-header-issue-on-some-distro.patch} |   0
 ...messages-when-qemi_cpu_kick_thread-.patch} |   0
 .../qemu/qemu/CVE-2019-12068.patch            | 108 ------------------
 .../qemu/{qemu_4.1.0.bb => qemu_4.2.0.bb}     |   0
 21 files changed, 107 insertions(+), 228 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_4.1.0.bb => qemu-native_4.2.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_4.1.0.bb => qemu-system-native_4.2.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
 rename meta/recipes-devtools/qemu/qemu/{0010-fix-libcap-header-issue-on-some-distro.patch => 0012-fix-libcap-header-issue-on-some-distro.patch} (100%)
 rename meta/recipes-devtools/qemu/qemu/{0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch => 0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
 rename meta/recipes-devtools/qemu/{qemu_4.1.0.bb => qemu_4.2.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 936db5ae16..23f2ce97c3 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.33%"
 GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.31"
 LINUXLIBCVERSION ?= "5.4%"
-QEMUVERSION ?= "4.1%"
+QEMUVERSION ?= "4.2%"
 GOVERSION ?= "1.13%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index 69c2c43e6b..28cfd2cca3 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -3,8 +3,8 @@ inherit native
 require qemu.inc
 
 SRC_URI_append = " \
-            file://0010-fix-libcap-header-issue-on-some-distro.patch \
-            file://0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
+            file://0012-fix-libcap-header-issue-on-some-distro.patch \
+            file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
             "
 
 EXTRA_OEMAKE_append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
diff --git a/meta/recipes-devtools/qemu/qemu-native_4.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_4.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_4.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_4.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index eb9f060997..a557e74e97 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,14 +27,13 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
-           file://0011-linux-user-remove-host-stime-syscall.patch \
+           file://0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch \
            file://CVE-2019-15890.patch \
-           file://CVE-2019-12068.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[md5sum] = "cdf2b5ca52b9abac9bacb5842fa420f8"
-SRC_URI[sha256sum] = "656e60218689bdeec69903087fd7582d5d3e72238d02f4481d8dc6d79fd909c6"
+SRC_URI[md5sum] = "278eeb294e4b497e79af7a57e660cb9a"
+SRC_URI[sha256sum] = "d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e98768f0"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
index 9478102ae5..66ff996508 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
@@ -1,4 +1,4 @@
-From 4655dc18074e0be9d239f51dac32b61435da8549 Mon Sep 17 00:00:00 2001
+From 526cb7e26f6dd96c9ee2ffa05ce0a358d3bfbfb3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 27 Nov 2014 14:04:29 +0000
 Subject: [PATCH] qemu: Add missing wacom HID descriptor
@@ -19,7 +19,7 @@ Upstream-Status: Submitted
  1 file changed, 93 insertions(+), 1 deletion(-)
 
 diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
-index 8c43db93..3ff8ca28 100644
+index 8ed57b3b..1502928b 100644
 --- a/hw/usb/dev-wacom.c
 +++ b/hw/usb/dev-wacom.c
 @@ -74,6 +74,89 @@ static const USBDescStrings desc_strings = {
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
index 2ccddd53cf..7f7da51006 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
@@ -1,4 +1,4 @@
-From 67751f3a23e3db3012f391b3b3b73a4484488ce9 Mon Sep 17 00:00:00 2001
+From 8ee6281516bd9210e75e91d705da8916bab3bf51 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Thu, 31 Aug 2017 11:06:56 -0700
 Subject: [PATCH] Add subpackage -ptest which runs all unit test cases for
@@ -15,10 +15,10 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/tests/Makefile.include b/tests/Makefile.include
-index fd7fdb86..83b7f409 100644
+index 8566f5f1..52d0320b 100644
 --- a/tests/Makefile.include
 +++ b/tests/Makefile.include
-@@ -1183,4 +1183,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+@@ -1210,4 +1210,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
  -include $(wildcard tests/*.d)
  -include $(wildcard tests/libqos/*.d)
  
diff --git a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 5c42d68030..012d60d8f0 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 235b94f1188597873c8776b019fed49947983392 Mon Sep 17 00:00:00 2001
+From ce1eceab2350d27960ec254650717085f6a11c9a Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -19,15 +19,15 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
-index 20e019bf..d150b01c 100644
+index 92e9ca5b..3a7f3954 100644
 --- a/hw/mips/mips_malta.c
 +++ b/hw/mips/mips_malta.c
-@@ -60,7 +60,7 @@
+@@ -59,7 +59,7 @@
  
- #define ENVP_ADDR		0x80002000l
- #define ENVP_NB_ENTRIES	 	16
--#define ENVP_ENTRY_SIZE	 	256
-+#define ENVP_ENTRY_SIZE	 	1024
+ #define ENVP_ADDR           0x80002000l
+ #define ENVP_NB_ENTRIES     16
+-#define ENVP_ENTRY_SIZE     256
++#define ENVP_ENTRY_SIZE     1024
  
  /* Hardware addresses */
- #define FLASH_ADDRESS 0x1e000000ULL
+ #define FLASH_ADDRESS       0x1e000000ULL
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
index 0ac4ab40b1..bc30397e8c 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
@@ -1,4 +1,4 @@
-From 3ad7a375015d47fdf5016e03e11fa93440d6d8bd Mon Sep 17 00:00:00 2001
+From 4127296bb1046cdf73994ba69dc913d8c02fd74f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 20 Oct 2015 22:19:08 +0100
 Subject: [PATCH] qemu: disable Valgrind
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 9 deletions(-)
 
 diff --git a/configure b/configure
-index 714e7fb6..dad4fc59 100755
+index 6099be1d..a766017b 100755
 --- a/configure
 +++ b/configure
-@@ -5335,15 +5335,6 @@ fi
+@@ -5390,15 +5390,6 @@ fi
  # check if we have valgrind/valgrind.h
  
  valgrind_h=no
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
index a73681510e..ec303371b0 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
@@ -1,4 +1,4 @@
-From 80e6070bcdfe636b103a13598e6c38ad0d0e7624 Mon Sep 17 00:00:00 2001
+From 6cdf82af2eba312b9b8da86dda28b98d3d51f4d4 Mon Sep 17 00:00:00 2001
 From: Stephen Arnold <sarnold@vctlabs.com>
 Date: Sun, 12 Jun 2016 18:09:56 -0700
 Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 4 deletions(-)
 
 diff --git a/configure b/configure
-index dad4fc59..685bbe5e 100755
+index a766017b..72f11aca 100755
 --- a/configure
 +++ b/configure
-@@ -5971,10 +5971,6 @@ write_c_skeleton
+@@ -6085,10 +6085,6 @@ write_c_skeleton
  if test "$gcov" = "yes" ; then
    CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
    LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
diff --git a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
index a42385530f..0810ae84c0 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
@@ -1,4 +1,4 @@
-From ad853601e75f6d0dd09672bcca05fbe4fac766a4 Mon Sep 17 00:00:00 2001
+From bcc63f775e265df69963a4ad7805b8678ace68f0 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Thu, 21 Dec 2017 11:35:16 -0800
 Subject: [PATCH] chardev: connect socket to a spawned command
@@ -52,10 +52,10 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  3 files changed, 109 insertions(+)
 
 diff --git a/chardev/char-socket.c b/chardev/char-socket.c
-index 7ca5d97a..207fae4a 100644
+index 185fe38d..54fa4234 100644
 --- a/chardev/char-socket.c
 +++ b/chardev/char-socket.c
-@@ -1278,6 +1278,67 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
+@@ -1288,6 +1288,67 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
      return true;
  }
  
@@ -123,7 +123,7 @@ index 7ca5d97a..207fae4a 100644
  
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
-@@ -1286,6 +1347,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -1296,6 +1357,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,7 +133,7 @@ index 7ca5d97a..207fae4a 100644
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -1351,6 +1415,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -1361,6 +1425,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
  
      update_disconnected_filename(s);
  
@@ -148,7 +148,7 @@ index 7ca5d97a..207fae4a 100644
      if (s->is_listen) {
          if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
                                             is_waitconnect, errp) < 0) {
-@@ -1370,9 +1442,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1380,9 +1452,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *fd = qemu_opt_get(opts, "fd");
@@ -175,7 +175,7 @@ index 7ca5d97a..207fae4a 100644
      if ((!!path + !!fd + !!host) != 1) {
          error_setg(errp,
                     "Exactly one of 'path', 'fd' or 'host' required");
-@@ -1415,12 +1504,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1425,12 +1514,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
      sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
  
diff --git a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
index b50e8c2545..89baad9b7f 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From f51e49e7d7d87b7254242b7360f99c2df94a5a2d Mon Sep 17 00:00:00 2001
+From a59a98d100123030a4145e7efe3b8a001920a9f1 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -30,7 +30,7 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index bce89911..df4b582e 100644
+index 2a74f7b4..4d5da365 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
 @@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *dev)
diff --git a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
index e562f25bec..30bb4ddf26 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
@@ -1,4 +1,4 @@
-From 25a064f91f73630e5dff2a6aeb23d953c469cea6 Mon Sep 17 00:00:00 2001
+From cf8c9aac5243f506a1a3e8e284414f311cde04f5 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Wed, 17 Jan 2018 10:51:49 -0800
 Subject: [PATCH] linux-user: Fix webkitgtk hangs on 32-bit x86 target
@@ -19,15 +19,15 @@ Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/linux-user/main.c b/linux-user/main.c
-index 8ffc5251..4067e739 100644
+index 6ff7851e..ebff0485 100644
 --- a/linux-user/main.c
 +++ b/linux-user/main.c
-@@ -77,7 +77,7 @@ int have_guest_base;
+@@ -78,7 +78,7 @@ int have_guest_base;
        (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
  /* There are a number of places where we assign reserved_va to a variable
     of type abi_ulong and expect it to fit.  Avoid the last page.  */
--#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)
-+#   define MAX_RESERVED_VA  (0x7ffffffful & TARGET_PAGE_MASK)
+-#   define MAX_RESERVED_VA(CPU)  (0xfffffffful & TARGET_PAGE_MASK)
++#   define MAX_RESERVED_VA(CPU)  (0x7ffffffful & TARGET_PAGE_MASK)
  #  else
- #   define MAX_RESERVED_VA  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
+ #   define MAX_RESERVED_VA(CPU)  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
  #  endif
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
index 4072d9455f..7e273eeced 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
@@ -1,4 +1,4 @@
-From b633b9a1813fcd715dce44659a89293f1c64ae8c Mon Sep 17 00:00:00 2001
+From 613166007e3b852c99caf2cd34a972e2c8460737 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@lge.com>
 Date: Fri, 1 Jun 2018 08:41:07 +0000
 Subject: [PATCH] Fix webkitgtk builds
@@ -18,6 +18,7 @@ This reverts commit ebf9a3630c911d0cfc9c20f7cafe9ba4f88cf583.
 
 Upstream-Status: Pending
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
 ---
  include/exec/cpu-all.h  |  6 +-----
  include/exec/cpu_ldst.h |  5 ++++-
@@ -26,7 +27,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  4 files changed, 10 insertions(+), 23 deletions(-)
 
 diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
-index 536ea58f81..4c63a6a2e4 100644
+index e96781a4..a369f81a 100644
 --- a/include/exec/cpu-all.h
 +++ b/include/exec/cpu-all.h
 @@ -162,12 +162,8 @@ extern unsigned long guest_base;
@@ -44,7 +45,7 @@ index 536ea58f81..4c63a6a2e4 100644
  
  #include "exec/hwaddr.h"
 diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
-index 9151fdb042..cb2b8f329f 100644
+index fd499f7e..30575f60 100644
 --- a/include/exec/cpu_ldst.h
 +++ b/include/exec/cpu_ldst.h
 @@ -65,7 +65,10 @@ typedef uint64_t abi_ptr;
@@ -60,7 +61,7 @@ index 9151fdb042..cb2b8f329f 100644
  #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
  
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index 46a6e3a761..7735465462 100644
+index 46a6e3a7..77354654 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
 @@ -78,7 +78,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
@@ -110,10 +111,10 @@ index 46a6e3a761..7735465462 100644
  
      if (flags & MREMAP_FIXED) {
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 8b41a03901..bc5d85de02 100644
+index 171c0cae..fc18f244 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -4031,9 +4031,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
+@@ -4138,9 +4138,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
              return -TARGET_EINVAL;
          }
      }
@@ -123,7 +124,7 @@ index 8b41a03901..bc5d85de02 100644
  
      mmap_lock();
  
-@@ -6881,7 +6878,7 @@ static int open_self_maps(void *cpu_env, int fd)
+@@ -6990,7 +6987,7 @@ static int open_self_maps(void *cpu_env, int fd)
          }
          if (h2g_valid(min)) {
              int flags = page_get_flags(h2g(min));
@@ -132,6 +133,3 @@ index 8b41a03901..bc5d85de02 100644
              if (page_check_range(h2g(min), max - min, flags) == -1) {
                  continue;
              }
--- 
-2.22.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
index a8ab7daa42..34df78b7fe 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,7 +1,7 @@
-From 5214dd4461f2090ef0965b4d2518f49927d61cbc Mon Sep 17 00:00:00 2001
+From c207607cdf3996ad9783c3bffbcd3d65e74c0158 Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 28 Aug 2019 19:56:28 +0800
-Subject: [Qemu-devel] [PATCH] configure: Add pkg-config handling for libgcrypt
+Subject: [PATCH] configure: Add pkg-config handling for libgcrypt
 
 libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
 handling for libgcrypt.
@@ -9,12 +9,13 @@ handling for libgcrypt.
 Upstream-Status: Denied [https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg06333.html]
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
+
 ---
  configure | 48 ++++++++++++++++++++++++++++++++++++++++--------
  1 file changed, 40 insertions(+), 8 deletions(-)
 
 diff --git a/configure b/configure
-index e44e454..0f362a7 100755
+index 72f11aca..cac271ce 100755
 --- a/configure
 +++ b/configure
 @@ -2875,6 +2875,30 @@ has_libgcrypt() {
@@ -48,7 +49,7 @@ index e44e454..0f362a7 100755
  
  if test "$nettle" != "no"; then
      pass="no"
-@@ -2902,7 +2926,14 @@ fi
+@@ -2915,7 +2939,14 @@ fi
  
  if test "$gcrypt" != "no"; then
      pass="no"
@@ -64,7 +65,7 @@ index e44e454..0f362a7 100755
          gcrypt_cflags=$(libgcrypt-config --cflags)
          gcrypt_libs=$(libgcrypt-config --libs)
          # Debian has removed -lgpg-error from libgcrypt-config
-@@ -2912,15 +2943,16 @@ if test "$gcrypt" != "no"; then
+@@ -2925,15 +2956,16 @@ if test "$gcrypt" != "no"; then
          then
              gcrypt_libs="$gcrypt_libs -lgpg-error"
          fi
@@ -88,6 +89,3 @@ index e44e454..0f362a7 100755
      if test "$pass" = "yes"; then
          gcrypt="yes"
          cat > $TMPC << EOF
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch b/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
new file mode 100644
index 0000000000..1433e13d68
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch
@@ -0,0 +1,53 @@
+From a88c40f02ace88f09b2a85a64831b277b2ebc88c Mon Sep 17 00:00:00 2001
+From: Peter Wu <peter@lekensteyn.nl>
+Date: Sat, 21 Dec 2019 17:21:24 +0100
+Subject: [PATCH] hw/i386/pc: fix regression in parsing vga cmdline parameter
+
+When the 'vga=' parameter is succeeded by another parameter, QEMU 4.2.0
+would refuse to start with a rather cryptic message:
+
+    $ qemu-system-x86_64 -kernel /boot/vmlinuz-linux -append 'vga=792 quiet'
+    qemu: can't parse 'vga' parameter: Invalid argument
+
+It was not clear whether this applied to the '-vga std' parameter or the
+'-append' one. Fix the parsing regression and clarify the error.
+
+Fixes: 133ef074bd ("hw/i386/pc: replace use of strtol with qemu_strtoui in x86_load_linux()")
+Cc: Sergio Lopez <slp@redhat.com>
+Signed-off-by: Peter Wu <peter@lekensteyn.nl>
+Message-Id: <20191221162124.1159291-1-peter@lekensteyn.nl>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+---
+ hw/i386/x86.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/hw/i386/x86.c b/hw/i386/x86.c
+index d8bb5c2a96..9b9a4d5837 100644
+--- a/hw/i386/x86.c
++++ b/hw/i386/x86.c
+@@ -612,6 +612,7 @@ void x86_load_linux(X86MachineState *x86ms,
+     vmode = strstr(kernel_cmdline, "vga=");
+     if (vmode) {
+         unsigned int video_mode;
++        const char *end;
+         int ret;
+         /* skip "vga=" */
+         vmode += 4;
+@@ -622,10 +623,9 @@ void x86_load_linux(X86MachineState *x86ms,
+         } else if (!strncmp(vmode, "ask", 3)) {
+             video_mode = 0xfffd;
+         } else {
+-            ret = qemu_strtoui(vmode, NULL, 0, &video_mode);
+-            if (ret != 0) {
+-                fprintf(stderr, "qemu: can't parse 'vga' parameter: %s\n",
+-                        strerror(-ret));
++            ret = qemu_strtoui(vmode, &end, 0, &video_mode);
++            if (ret != 0 || (*end && *end != ' ')) {
++                fprintf(stderr, "qemu: invalid 'vga=' kernel parameter.\n");
+                 exit(1);
+             }
+         }
+-- 
+2.25.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
deleted file mode 100644
index 659e6be45d..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 2001
-From: Laurent Vivier <laurent@vivier.eu>
-Date: Tue, 12 Nov 2019 15:25:56 +0100
-Subject: [PATCH] linux-user: remove host stime() syscall
-
-stime() has been withdrawn from glibc
-(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
-
-Implement the target stime() syscall using host
-clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
-
-Tested qemu-ppc/x86_64 with:
-
-	#include <time.h>
-	#include <stdio.h>
-
-	int main(void)
-	{
-		time_t t;
-		int ret;
-
-		/* date -u -d"2019-11-12T15:11:00" "+%s" */
-		t = 1573571460;
-		ret = stime(&t);
-		printf("ret %d\n", ret);
-		return 0;
-	}
-
-        # date; ./stime; date
-        Tue Nov 12 14:18:32 UTC 2019
-        ret 0
-        Tue Nov 12 15:11:00 UTC 2019
-
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f]
-Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
-Reported-by: Cole Robinson <crobinso@redhat.com>
-Signed-off-by: Laurent Vivier <laurent@vivier.eu>
-Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
-Message-Id: <20191112142556.6335-1-laurent@vivier.eu>
----
- linux-user/syscall.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
- #ifdef TARGET_NR_stime /* not on alpha */
-     case TARGET_NR_stime:
-         {
--            time_t host_time;
--            if (get_user_sal(host_time, arg1))
-+            struct timespec ts;
-+            ts.tv_nsec = 0;
-+            if (get_user_sal(ts.tv_sec, arg1)) {
-                 return -TARGET_EFAULT;
--            return get_errno(stime(&host_time));
-+            }
-+            return get_errno(clock_settime(CLOCK_REALTIME, &ts));
-         }
- #endif
- #ifdef TARGET_NR_alarm /* not on alpha */
diff --git a/meta/recipes-devtools/qemu/qemu/0010-fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu/0010-fix-libcap-header-issue-on-some-distro.patch
rename to meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
diff --git a/meta/recipes-devtools/qemu/qemu/0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch b/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu/0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
rename to meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
deleted file mode 100644
index f1655e407f..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From de594e47659029316bbf9391efb79da0a1a08e08 Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Wed, 14 Aug 2019 17:35:21 +0530
-Subject: [PATCH] scsi: lsi: exit infinite loop while executing script
- (CVE-2019-12068)
-
-When executing script in lsi_execute_script(), the LSI scsi adapter
-emulator advances 's->dsp' index to read next opcode. This can lead
-to an infinite loop if the next opcode is empty. Move the existing
-loop exit after 10k iterations so that it covers no-op opcodes as
-well.
-
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=de594e47659029316bbf9391efb79da0a1a08e08]
-CVE: CVE-2019-12068
-
-Reported-by: Bugs SysSec <bugs-syssec@rub.de>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- hw/scsi/lsi53c895a.c | 41 +++++++++++++++++++++++++++--------------
- 1 file changed, 27 insertions(+), 14 deletions(-)
-
-diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
-index 222a286..ec53b14 100644
---- a/hw/scsi/lsi53c895a.c
-+++ b/hw/scsi/lsi53c895a.c
-@@ -186,6 +186,9 @@ static const char *names[] = {
- /* Flag set if this is a tagged command.  */
- #define LSI_TAG_VALID     (1 << 16)
- 
-+/* Maximum instructions to process. */
-+#define LSI_MAX_INSN    10000
-+
- typedef struct lsi_request {
-     SCSIRequest *req;
-     uint32_t tag;
-@@ -1133,7 +1136,21 @@ static void lsi_execute_script(LSIState *s)
- 
-     s->istat1 |= LSI_ISTAT1_SRUN;
- again:
--    insn_processed++;
-+    if (++insn_processed > LSI_MAX_INSN) {
-+        /* Some windows drivers make the device spin waiting for a memory
-+           location to change.  If we have been executed a lot of code then
-+           assume this is the case and force an unexpected device disconnect.
-+           This is apparently sufficient to beat the drivers into submission.
-+         */
-+        if (!(s->sien0 & LSI_SIST0_UDC)) {
-+            qemu_log_mask(LOG_GUEST_ERROR,
-+                          "lsi_scsi: inf. loop with UDC masked");
-+        }
-+        lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
-+        lsi_disconnect(s);
-+        trace_lsi_execute_script_stop();
-+        return;
-+    }
-     insn = read_dword(s, s->dsp);
-     if (!insn) {
-         /* If we receive an empty opcode increment the DSP by 4 bytes
-@@ -1570,19 +1587,7 @@ again:
-             }
-         }
-     }
--    if (insn_processed > 10000 && s->waiting == LSI_NOWAIT) {
--        /* Some windows drivers make the device spin waiting for a memory
--           location to change.  If we have been executed a lot of code then
--           assume this is the case and force an unexpected device disconnect.
--           This is apparently sufficient to beat the drivers into submission.
--         */
--        if (!(s->sien0 & LSI_SIST0_UDC)) {
--            qemu_log_mask(LOG_GUEST_ERROR,
--                          "lsi_scsi: inf. loop with UDC masked");
--        }
--        lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
--        lsi_disconnect(s);
--    } else if (s->istat1 & LSI_ISTAT1_SRUN && s->waiting == LSI_NOWAIT) {
-+    if (s->istat1 & LSI_ISTAT1_SRUN && s->waiting == LSI_NOWAIT) {
-         if (s->dcntl & LSI_DCNTL_SSM) {
-             lsi_script_dma_interrupt(s, LSI_DSTAT_SSI);
-         } else {
-@@ -1970,6 +1975,10 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
-     case 0x2f: /* DSP[24:31] */
-         s->dsp &= 0x00ffffff;
-         s->dsp |= val << 24;
-+        /*
-+         * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
-+         * instruction.  Is this correct?
-+         */
-         if ((s->dmode & LSI_DMODE_MAN) == 0
-             && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
-             lsi_execute_script(s);
-@@ -1988,6 +1997,10 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
-         break;
-     case 0x3b: /* DCNTL */
-         s->dcntl = val & ~(LSI_DCNTL_PFF | LSI_DCNTL_STD);
-+        /*
-+         * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
-+         * instruction.  Is this correct?
-+         */
-         if ((val & LSI_DCNTL_STD) && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
-             lsi_execute_script(s);
-         break;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu_4.1.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_4.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_4.2.0.bb
-- 
2.25.0


