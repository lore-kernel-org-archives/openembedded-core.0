Return-Path: <prvs=128332a65=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 746CF7C617
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 21:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1566334979; x=1597870979;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=5kPdgAnbUF8QbgBcYEYNFxnlMXIz61XNIRA7mt2VtYk=;
	b=d2xmEPp7As5ZPc/FeW9oKdVx/bIWP7HZ0SW7TStX/IDjWcDCqvqUMvVF
	+q4zLONWPeT20GmdLRiT48qiO6ABUwXwVRBTu6ahSsqPCRWCONtGRuTT3
	OY5g6uKm/1O+BLsQaDJHMPVQUw9KTFO8yK8OTsoY4BdLu3velHp9GA2sZ
	n8OiqJFytZZGe6LriFIeKILxTJqiHV4KZ6VYPXqZyeJvgn95ahcSZjynG
	dCAputumWvYQAykdcmzKkL75kEGXPnn9Jy5WfayMCp10UfPDIFmJcaaIf
	pw0FBNNJGKIvuVgUKMDh91fs4jmiMxdbd1NgDA9oS7oOd+/cSZYmbx6T+ g==;
IronPort-SDR: FuqVRs9tQbneHG7F8F3n2iHCncQrWKHsCjbBxKAV2WGs+9Oq/uVOrNrnyoM1pbc2Xf112Wk7ff
	0ofeB2uW7BF3y4LmjmRAEzAtbPxwz6bMDxs6A09GL+QPKXFYpmIsjrzec7ZPpxIcLgI2cszG+8
	Q3JCBjRkpznvjFcKgXuM/dmRn7QRy8Og0KYCH2BmUTaxySmGbJpnCJXSvNIuxO2yxoJ/S7gAUK
	9/LK3SYu8LtLLhoMojR8+BSjIFbu9v2+2k03gm7q8F11J1JcTGZNs2k5bbVXYc4P4pYAvTjFfU
	pxI=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="120872824"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 05:02:55 +0800
IronPort-SDR: T2/ZwC2FzYYkQVudpMeSxaYRN2mKyyD3wkEQZasBRcJu6bOCZ8ORcx0gwuG801zamuhLd+5stK
	rY35x3e09a93kETQQpS87cD/OVAGULHMbsBwhAdaVjSdHc7sBieY6cdLU1vqMjwGn0e/qcfYi5
	Cxj4/VbQdmE2B/lF8A6kO78LxsHvF8hxt6V6KBpC7WMykzc9nVzvpODSShmsUqbwLk18rcZokl
	OV7dF0vWiOQ/7335XmnXY0trNyWuq01RqYD9BLT5bNdmXYLFNlYQbeP+3AgifI4wcgLVsJs8mE
	18czBtXq+MmeXtwKhWT5YIs3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Aug 2019 14:00:16 -0700
IronPort-SDR: ZQzwAIrlFv85Dchf0ShY6EooNRaaZvOFiRvW4oaoeYYHUM3VWX31NRmgriLI/VZr2CsE64mrp5
	9jO9LOlLowN6/CE4oDlmRPf9uULg9y4iFIUZPDDeV4SH6+xDGmUBC8Xml4AjsFIAXrvySFooSB
	cVkV30Q9ogXN162flKzKgrhaVsErHkwicacGLJHA362IhFcN2lNU9VijwBQl6Qgqtju4bV12FF
	55xMAdeRdjd+WM2A8hkyyI+3s/RPbcaowuqkoKwjFUAL6Sz0JejbCugZDMqtazPvfQjRKVMq5L
	rRE=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 20 Aug 2019 14:02:54 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 13:59:15 -0700
Message-Id: <20190820205917.21297-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH v2 1/3] qemu: Upgrade to version 4.1
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
X-List-Received-Date: Tue, 20 Aug 2019 21:02:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Fix the qemumips webkitgtk build failure

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/recipes-devtools/qemu/qemu-native.inc    |   4 +-
 ...u-native_4.0.0.bb => qemu-native_4.1.0.bb} |   0
 ...e_4.0.0.bb => qemu-system-native_4.1.0.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  20 +-
 ...emu-Add-missing-wacom-HID-descriptor.patch |  10 +-
 ...test-which-runs-all-unit-test-cases-.patch |   6 +-
 ...n-environment-space-to-boot-loader-q.patch |   4 +-
 .../qemu/0004-qemu-disable-Valgrind.patch     |   6 +-
 ...-searched-during-user-mode-emulation.patch | 146 --------
 ...d.bfd-fix-cflags-and-set-some-envir.patch} |   6 +-
 ...connect-socket-to-a-spawned-command.patch} |  18 +-
 ... 0007-apic-fixup-fallthrough-to-PIC.patch} |   6 +-
 ...ebkitgtk-hangs-on-32-bit-x86-target.patch} |   6 +-
 ....patch => 0009-Fix-webkitgtk-builds.patch} |  81 ++---
 ...-libcap-header-issue-on-some-distro.patch} |   0
 ...messages-when-qemi_cpu_kick_thread-.patch} |   2 +-
 ...et-arm-Fix-vector-operation-segfault.patch |  66 ----
 ...o-handle-variably-sized-SIOCGSTAMP-w.patch | 339 ------------------
 .../qemu/qemu/CVE-2019-12155.patch            |  35 --
 .../qemu/{qemu_4.0.0.bb => qemu_4.1.0.bb}     |   0
 21 files changed, 82 insertions(+), 677 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_4.0.0.bb => qemu-native_4.1.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_4.0.0.bb => qemu-system-native_4.1.0.bb} (99%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0005-qemu-Limit-paths-searched-during-user-mode-emulation.patch
 rename meta/recipes-devtools/qemu/qemu/{0006-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch => 0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch} (82%)
 rename meta/recipes-devtools/qemu/qemu/{0007-chardev-connect-socket-to-a-spawned-command.patch => 0006-chardev-connect-socket-to-a-spawned-command.patch} (93%)
 rename meta/recipes-devtools/qemu/qemu/{0008-apic-fixup-fallthrough-to-PIC.patch => 0007-apic-fixup-fallthrough-to-PIC.patch} (90%)
 rename meta/recipes-devtools/qemu/qemu/{0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch => 0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch} (90%)
 rename meta/recipes-devtools/qemu/qemu/{0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch => 0009-Fix-webkitgtk-builds.patch} (59%)
 rename meta/recipes-devtools/qemu/qemu/{0011-fix-libcap-header-issue-on-some-distro.patch => 0010-fix-libcap-header-issue-on-some-distro.patch} (100%)
 rename meta/recipes-devtools/qemu/qemu/{0012-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch => 0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch} (97%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
 rename meta/recipes-devtools/qemu/{qemu_4.0.0.bb => qemu_4.1.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1966dbd521..c89b8e012d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ BINUVERSION ?= "2.32%"
 GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.0%"
-QEMUVERSION ?= "4.0%"
+QEMUVERSION ?= "4.1%"
 GOVERSION ?= "1.12%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index c04297cad0..69c2c43e6b 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -3,8 +3,8 @@ inherit native
 require qemu.inc
 
 SRC_URI_append = " \
-            file://0011-fix-libcap-header-issue-on-some-distro.patch \
-            file://0012-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
+            file://0010-fix-libcap-header-issue-on-some-distro.patch \
+            file://0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
             "
 
 EXTRA_OEMAKE_append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
diff --git a/meta/recipes-devtools/qemu/qemu-native_4.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_4.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_4.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_4.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb
index 964dcee524..d83ee59375 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb
@@ -2,7 +2,7 @@ BPN = "qemu"
 
 require qemu-native.inc
 
-# As some of the files installed by qemu-native and qemu-system-native 
+# As some of the files installed by qemu-native and qemu-system-native
 # are the same, we depend on qemu-native to get the full installation set
 # and avoid file clashes
 DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 46c40b7d4f..d2dd2bc9c1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -17,20 +17,16 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch \
            file://0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
            file://0004-qemu-disable-Valgrind.patch \
-           file://0005-qemu-Limit-paths-searched-during-user-mode-emulation.patch \
-           file://0006-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch \
-           file://0007-chardev-connect-socket-to-a-spawned-command.patch \
-           file://0008-apic-fixup-fallthrough-to-PIC.patch \
-           file://0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
-           file://0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
-           file://0013-target-arm-Fix-vector-operation-segfault.patch \
-           file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
-	   file://CVE-2019-12155.patch \
+           file://0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch \
+           file://0006-chardev-connect-socket-to-a-spawned-command.patch \
+           file://0007-apic-fixup-fallthrough-to-PIC.patch \
+           file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
+           file://0009-Fix-webkitgtk-builds.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[md5sum] = "0afeca336fd57ae3d3086ec07f59d708"
-SRC_URI[sha256sum] = "13a93dfe75b86734326f8d5b475fde82ec692d5b5a338b4262aeeb6b0fa4e469"
+SRC_URI[md5sum] = "cdf2b5ca52b9abac9bacb5842fa420f8"
+SRC_URI[sha256sum] = "656e60218689bdeec69903087fd7582d5d3e72238d02f4481d8dc6d79fd909c6"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
@@ -141,7 +137,7 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
 PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+3 gettext-native"
 PACKAGECONFIG[vte] = "--enable-vte,--disable-vte,vte gettext-native"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
-PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
+PACKAGECONFIG[ssh] = "--enable-libssh,--disable-libssh,libssh,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
 PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
index 5373915ff0..9478102ae5 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
@@ -1,4 +1,4 @@
-From 1cb804cf0e47116202011f3386b4739af668224a Mon Sep 17 00:00:00 2001
+From 4655dc18074e0be9d239f51dac32b61435da8549 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 27 Nov 2014 14:04:29 +0000
 Subject: [PATCH] qemu: Add missing wacom HID descriptor
@@ -19,10 +19,10 @@ Upstream-Status: Submitted
  1 file changed, 93 insertions(+), 1 deletion(-)
 
 diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
-index ac0bc83b..6f9b22d4 100644
+index 8c43db93..3ff8ca28 100644
 --- a/hw/usb/dev-wacom.c
 +++ b/hw/usb/dev-wacom.c
-@@ -72,6 +72,89 @@ static const USBDescStrings desc_strings = {
+@@ -74,6 +74,89 @@ static const USBDescStrings desc_strings = {
      [STR_SERIALNUMBER]     = "1",
  };
  
@@ -112,7 +112,7 @@ index ac0bc83b..6f9b22d4 100644
  static const USBDescIface desc_iface_wacom = {
      .bInterfaceNumber              = 0,
      .bNumEndpoints                 = 1,
-@@ -89,7 +172,7 @@ static const USBDescIface desc_iface_wacom = {
+@@ -91,7 +174,7 @@ static const USBDescIface desc_iface_wacom = {
                  0x00,          /*  u8  country_code */
                  0x01,          /*  u8  num_descriptors */
                  0x22,          /*  u8  type: Report */
@@ -121,7 +121,7 @@ index ac0bc83b..6f9b22d4 100644
              },
          },
      },
-@@ -269,6 +352,15 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
+@@ -271,6 +354,15 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
      }
  
      switch (request) {
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
index 7b7c5d71a0..2ccddd53cf 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
@@ -1,4 +1,4 @@
-From 281116b31981b0b9e174bda8abe00f4eaa33c2ae Mon Sep 17 00:00:00 2001
+From 67751f3a23e3db3012f391b3b3b73a4484488ce9 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Thu, 31 Aug 2017 11:06:56 -0700
 Subject: [PATCH] Add subpackage -ptest which runs all unit test cases for
@@ -15,10 +15,10 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/tests/Makefile.include b/tests/Makefile.include
-index 36fc73fe..01fecd4d 100644
+index fd7fdb86..83b7f409 100644
 --- a/tests/Makefile.include
 +++ b/tests/Makefile.include
-@@ -1184,4 +1184,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+@@ -1183,4 +1183,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
  -include $(wildcard tests/*.d)
  -include $(wildcard tests/libqos/*.d)
  
diff --git a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 9a18ca18e4..5c42d68030 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From bf04acef9ec31ddcc18ddbb4ac5b7b1e7368bf7d Mon Sep 17 00:00:00 2001
+From 235b94f1188597873c8776b019fed49947983392 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -19,7 +19,7 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
-index 439665ab..285c78ef 100644
+index 20e019bf..d150b01c 100644
 --- a/hw/mips/mips_malta.c
 +++ b/hw/mips/mips_malta.c
 @@ -60,7 +60,7 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
index 9e326081f2..0ac4ab40b1 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
@@ -1,4 +1,4 @@
-From e40f797548bc3ff06c71b6cbe042a46406894d18 Mon Sep 17 00:00:00 2001
+From 3ad7a375015d47fdf5016e03e11fa93440d6d8bd Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 20 Oct 2015 22:19:08 +0100
 Subject: [PATCH] qemu: disable Valgrind
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 9 deletions(-)
 
 diff --git a/configure b/configure
-index 1c563a70..eaf9bb5e 100755
+index 714e7fb6..dad4fc59 100755
 --- a/configure
 +++ b/configure
-@@ -5311,15 +5311,6 @@ fi
+@@ -5335,15 +5335,6 @@ fi
  # check if we have valgrind/valgrind.h
  
  valgrind_h=no
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Limit-paths-searched-during-user-mode-emulation.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Limit-paths-searched-during-user-mode-emulation.patch
deleted file mode 100644
index 819720a3f2..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Limit-paths-searched-during-user-mode-emulation.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From 547c3710a1493d2fd6bb56b819cf162db433756a Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 9 Mar 2016 22:49:02 +0000
-Subject: [PATCH] qemu: Limit paths searched during user mode emulation
-
-By default qemu builds a complete list of directories within the user
-emulation sysroot (-L option). The OE sysroot directory is large and
-this is confusing, for example it indexes all pkgdata. In particular this
-confuses strace of qemu binaries with tons of irrelevant paths.
-
-This patch stops the code indexing up front and instead only indexes
-things if/as/when it needs to. This drastically reduces the files it
-reads and reduces memory usage and cleans up strace.
-
-It would also avoid the infinite directory traversal bug in [YOCTO #6996]
-although the code could still be vulnerable if it parsed those specific
-paths.
-
-RP
-2016/3/9
-Upstream-Status: Pending
-
----
- util/path.c | 44 ++++++++++++++++++++++----------------------
- 1 file changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/util/path.c b/util/path.c
-index 7f9fc272..a416cd4a 100644
---- a/util/path.c
-+++ b/util/path.c
-@@ -15,6 +15,7 @@ struct pathelem
-     char *name;
-     /* Full path name, eg. /usr/gnemul/x86-linux/lib. */
-     char *pathname;
-+    int populated_entries;
-     struct pathelem *parent;
-     /* Children */
-     unsigned int num_entries;
-@@ -45,6 +46,7 @@ static struct pathelem *new_entry(const char *root,
-     new->name = g_strdup(name);
-     new->pathname = g_strdup_printf("%s/%s", root, name);
-     new->num_entries = 0;
-+    new->populated_entries = 0;
-     return new;
- }
- 
-@@ -53,15 +55,16 @@ static struct pathelem *new_entry(const char *root,
- /* Not all systems provide this feature */
- #if defined(DT_DIR) && defined(DT_UNKNOWN) && defined(DT_LNK)
- # define dirent_type(dirent) ((dirent)->d_type)
--# define is_dir_maybe(type) \
--    ((type) == DT_DIR || (type) == DT_UNKNOWN || (type) == DT_LNK)
-+# define is_not_dir(type) \
-+    ((type) != DT_DIR && (type) != DT_UNKNOWN && (type) != DT_LNK)
- #else
- # define dirent_type(dirent) (1)
--# define is_dir_maybe(type)  (type)
-+# define is_not_dir(type)  (0)
- #endif
- 
- static struct pathelem *add_dir_maybe(struct pathelem *path)
- {
-+    unsigned int i;
-     DIR *dir;
- 
-     if ((dir = opendir(path->pathname)) != NULL) {
-@@ -74,6 +77,11 @@ static struct pathelem *add_dir_maybe(struct pathelem *path)
-         }
-         closedir(dir);
-     }
-+
-+    for (i = 0; i < path->num_entries; i++)
-+        (path->entries[i])->parent = path;
-+
-+    path->populated_entries = 1;
-     return path;
- }
- 
-@@ -89,26 +97,16 @@ static struct pathelem *add_entry(struct pathelem *root, const char *name,
-     e = &root->entries[root->num_entries-1];
- 
-     *e = new_entry(root->pathname, root, name);
--    if (is_dir_maybe(type)) {
--        *e = add_dir_maybe(*e);
-+    if (is_not_dir(type)) {
-+        (*e)->populated_entries = 1;
-     }
- 
-     return root;
- }
- 
--/* This needs to be done after tree is stabilized (ie. no more reallocs!). */
--static void set_parents(struct pathelem *child, struct pathelem *parent)
--{
--    unsigned int i;
--
--    child->parent = parent;
--    for (i = 0; i < child->num_entries; i++)
--        set_parents(child->entries[i], child);
--}
--
- /* FIXME: Doesn't handle DIR/.. where DIR is not in emulated dir. */
- static const char *
--follow_path(const struct pathelem *cursor, const char *name)
-+follow_path(struct pathelem *cursor, struct pathelem **source, const char *name)
- {
-     unsigned int i, namelen;
- 
-@@ -119,14 +117,18 @@ follow_path(const struct pathelem *cursor, const char *name)
-         return cursor->pathname;
- 
-     if (strneq(name, namelen, ".."))
--        return follow_path(cursor->parent, name + namelen);
-+        return follow_path(cursor->parent, &cursor->parent, name + namelen);
- 
-     if (strneq(name, namelen, "."))
--        return follow_path(cursor, name + namelen);
-+        return follow_path(cursor, source, name + namelen);
-+
-+    if (!cursor->populated_entries)
-+        *source = add_dir_maybe(cursor);
-+        cursor = *source;
- 
-     for (i = 0; i < cursor->num_entries; i++)
-         if (strneq(name, namelen, cursor->entries[i]->name))
--            return follow_path(cursor->entries[i], name + namelen);
-+            return follow_path(cursor->entries[i], &cursor->entries[i], name + namelen);
- 
-     /* Not found */
-     return NULL;
-@@ -160,8 +162,6 @@ void init_paths(const char *prefix)
-         g_free(base->name);
-         g_free(base);
-         base = NULL;
--    } else {
--        set_parents(base, base);
-     }
- }
- 
-@@ -173,5 +173,5 @@ const char *path(const char *name)
-     if (!base || !name || name[0] != '/')
-         return name;
- 
--    return follow_path(base, name) ?: name;
-+    return follow_path(base, &base, name) ?: name;
- }
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
similarity index 82%
rename from meta/recipes-devtools/qemu/qemu/0006-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
rename to meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
index b62a588c66..a73681510e 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
@@ -1,4 +1,4 @@
-From 107fd860529a3c1319d54c3c225758457b0d9394 Mon Sep 17 00:00:00 2001
+From 80e6070bcdfe636b103a13598e6c38ad0d0e7624 Mon Sep 17 00:00:00 2001
 From: Stephen Arnold <sarnold@vctlabs.com>
 Date: Sun, 12 Jun 2016 18:09:56 -0700
 Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 4 deletions(-)
 
 diff --git a/configure b/configure
-index eaf9bb5e..de2933d1 100755
+index dad4fc59..685bbe5e 100755
 --- a/configure
 +++ b/configure
-@@ -5928,10 +5928,6 @@ write_c_skeleton
+@@ -5971,10 +5971,6 @@ write_c_skeleton
  if test "$gcov" = "yes" ; then
    CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
    LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
diff --git a/meta/recipes-devtools/qemu/qemu/0007-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
similarity index 93%
rename from meta/recipes-devtools/qemu/qemu/0007-chardev-connect-socket-to-a-spawned-command.patch
rename to meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
index f3f3dc3f5e..a42385530f 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
@@ -1,4 +1,4 @@
-From 136e159482a1bc8676cbe6e767055d0c3fb20065 Mon Sep 17 00:00:00 2001
+From ad853601e75f6d0dd09672bcca05fbe4fac766a4 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Thu, 21 Dec 2017 11:35:16 -0800
 Subject: [PATCH] chardev: connect socket to a spawned command
@@ -52,10 +52,10 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  3 files changed, 109 insertions(+)
 
 diff --git a/chardev/char-socket.c b/chardev/char-socket.c
-index 3916505d..a8e9dce8 100644
+index 7ca5d97a..207fae4a 100644
 --- a/chardev/char-socket.c
 +++ b/chardev/char-socket.c
-@@ -1273,6 +1273,67 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
+@@ -1278,6 +1278,67 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
      return true;
  }
  
@@ -123,7 +123,7 @@ index 3916505d..a8e9dce8 100644
  
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
-@@ -1281,6 +1342,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -1286,6 +1347,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,7 +133,7 @@ index 3916505d..a8e9dce8 100644
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -1346,6 +1410,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -1351,6 +1415,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
  
      update_disconnected_filename(s);
  
@@ -148,7 +148,7 @@ index 3916505d..a8e9dce8 100644
      if (s->is_listen) {
          if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
                                             is_waitconnect, errp) < 0) {
-@@ -1365,9 +1437,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1370,9 +1442,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *fd = qemu_opt_get(opts, "fd");
@@ -175,7 +175,7 @@ index 3916505d..a8e9dce8 100644
      if ((!!path + !!fd + !!host) != 1) {
          error_setg(errp,
                     "Exactly one of 'path', 'fd' or 'host' required");
-@@ -1410,12 +1499,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1415,12 +1504,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
      sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
  
@@ -201,10 +201,10 @@ index 3916505d..a8e9dce8 100644
          addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
          addr->u.inet.data = g_new(InetSocketAddress, 1);
 diff --git a/chardev/char.c b/chardev/char.c
-index 514cd6b0..36a40d67 100644
+index 7b6b2cb1..0c2ca64b 100644
 --- a/chardev/char.c
 +++ b/chardev/char.c
-@@ -835,6 +835,9 @@ QemuOptsList qemu_chardev_opts = {
+@@ -837,6 +837,9 @@ QemuOptsList qemu_chardev_opts = {
          },{
              .name = "path",
              .type = QEMU_OPT_STRING,
diff --git a/meta/recipes-devtools/qemu/qemu/0008-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
similarity index 90%
rename from meta/recipes-devtools/qemu/qemu/0008-apic-fixup-fallthrough-to-PIC.patch
rename to meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
index 13037f33f3..b50e8c2545 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 1b3f264e2ba18caf658fae27293c426c8366c6a3 Mon Sep 17 00:00:00 2001
+From f51e49e7d7d87b7254242b7360f99c2df94a5a2d Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -30,10 +30,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 6ea619c3..f892811e 100644
+index bce89911..df4b582e 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -604,7 +604,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+@@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
similarity index 90%
rename from meta/recipes-devtools/qemu/qemu/0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
rename to meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
index c572ff94d0..e562f25bec 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
@@ -1,4 +1,4 @@
-From a33ae91504ea4d254b5ace64a84791d3c96c9773 Mon Sep 17 00:00:00 2001
+From 25a064f91f73630e5dff2a6aeb23d953c469cea6 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Wed, 17 Jan 2018 10:51:49 -0800
 Subject: [PATCH] linux-user: Fix webkitgtk hangs on 32-bit x86 target
@@ -19,10 +19,10 @@ Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/linux-user/main.c b/linux-user/main.c
-index a0aba9cb..34c54924 100644
+index 8ffc5251..4067e739 100644
 --- a/linux-user/main.c
 +++ b/linux-user/main.c
-@@ -69,7 +69,7 @@ int have_guest_base;
+@@ -77,7 +77,7 @@ int have_guest_base;
        (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
  /* There are a number of places where we assign reserved_va to a variable
     of type abi_ulong and expect it to fit.  Avoid the last page.  */
diff --git a/meta/recipes-devtools/qemu/qemu/0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
similarity index 59%
rename from meta/recipes-devtools/qemu/qemu/0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch
rename to meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
index 3418eb7c65..4072d9455f 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
@@ -1,32 +1,35 @@
-From 2a66bd95c856de6950fbd802c5b99075207c1d76 Mon Sep 17 00:00:00 2001
+From b633b9a1813fcd715dce44659a89293f1c64ae8c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@lge.com>
 Date: Fri, 1 Jun 2018 08:41:07 +0000
-Subject: [PATCH] Revert "linux-user: fix mmap/munmap/mprotect/mremap/shmat"
+Subject: [PATCH] Fix webkitgtk builds
 
-Causes qemu-i386 to hang during gobject-introspection in webkitgtk build
-when musl is used on qemux86 - the same issue as
-0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
-was fixing in 2.11.0 release, but with this patch the fix no longer worked
-as discussed here:
-http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150302.html
-http://lists.openembedded.org/pipermail/openembedded-core/2018-June/151382.html
+This is a partial revert of "linux-user: fix mmap/munmap/mprotect/mremap/shmat".
+
+This patch fixes qemu-i386 hangs during gobject-introspection in webkitgtk build
+when musl is used on qemux86. This is the same issue that
+0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch was
+fixing in the 2.11 release.
+
+This patch also fixes a build failure when building webkitgtk for
+qemumips. A QEMU assert is seen while building webkitgtk:
+page_check_range: Assertion `start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS)' failed.
 
 This reverts commit ebf9a3630c911d0cfc9c20f7cafe9ba4f88cf583.
 
 Upstream-Status: Pending
-
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 ---
  include/exec/cpu-all.h  |  6 +-----
- include/exec/cpu_ldst.h | 16 +++++++++-------
+ include/exec/cpu_ldst.h |  5 ++++-
  linux-user/mmap.c       | 17 ++++-------------
  linux-user/syscall.c    |  5 +----
- 4 files changed, 15 insertions(+), 29 deletions(-)
+ 4 files changed, 10 insertions(+), 23 deletions(-)
 
 diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
-index b16c9ec5..612db6a0 100644
+index 536ea58f81..4c63a6a2e4 100644
 --- a/include/exec/cpu-all.h
 +++ b/include/exec/cpu-all.h
-@@ -163,12 +163,8 @@ extern unsigned long guest_base;
+@@ -162,12 +162,8 @@ extern unsigned long guest_base;
  extern int have_guest_base;
  extern unsigned long reserved_va;
  
@@ -41,37 +44,26 @@ index b16c9ec5..612db6a0 100644
  
  #include "exec/hwaddr.h"
 diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
-index d78041d7..845639f7 100644
+index 9151fdb042..cb2b8f329f 100644
 --- a/include/exec/cpu_ldst.h
 +++ b/include/exec/cpu_ldst.h
-@@ -62,13 +62,15 @@ typedef uint64_t abi_ptr;
- /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
- #define g2h(x) ((void *)((unsigned long)(abi_ptr)(x) + guest_base))
- 
+@@ -65,7 +65,10 @@ typedef uint64_t abi_ptr;
+ #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
+ #define guest_addr_valid(x) (1)
+ #else
 -#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
--#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
--
--static inline int guest_range_valid(unsigned long start, unsigned long len)
--{
--    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
--}
-+#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
-+#define h2g_valid(x) 1
-+#else
-+#define h2g_valid(x) ({ \
-+    unsigned long __guest = (unsigned long)(x) - guest_base; \
-+    (__guest < (1ul << TARGET_VIRT_ADDR_SPACE_BITS)) && \
-+    (!reserved_va || (__guest < reserved_va)); \
++#define guest_addr_valid(x) ({ \
++    ((x) < (1ul << TARGET_VIRT_ADDR_SPACE_BITS)) && \
++    (!reserved_va || ((x) < reserved_va)); \
 +})
-+#endif
+ #endif
+ #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
  
- #define h2g_nocheck(x) ({ \
-     unsigned long __ret = (unsigned long)(x) - guest_base; \
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index e0249efe..cfe34b35 100644
+index 46a6e3a761..7735465462 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -79,7 +79,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
+@@ -78,7 +78,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
          return -TARGET_EINVAL;
      len = TARGET_PAGE_ALIGN(len);
      end = start + len;
@@ -80,7 +72,7 @@ index e0249efe..cfe34b35 100644
          return -TARGET_ENOMEM;
      }
      prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
-@@ -490,8 +490,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
+@@ -495,8 +495,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
           * It can fail only on 64-bit host with 32-bit target.
           * On any other target/host host mmap() handles this error correctly.
           */
@@ -91,7 +83,7 @@ index e0249efe..cfe34b35 100644
              goto fail;
          }
  
-@@ -631,10 +631,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
+@@ -636,10 +636,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
      if (start & ~TARGET_PAGE_MASK)
          return -TARGET_EINVAL;
      len = TARGET_PAGE_ALIGN(len);
@@ -103,7 +95,7 @@ index e0249efe..cfe34b35 100644
      mmap_lock();
      end = start + len;
      real_start = start & qemu_host_page_mask;
-@@ -689,13 +687,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -694,13 +692,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
@@ -118,10 +110,10 @@ index e0249efe..cfe34b35 100644
  
      if (flags & MREMAP_FIXED) {
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 96cd4bf8..e6754772 100644
+index 8b41a03901..bc5d85de02 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -3860,9 +3860,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
+@@ -4031,9 +4031,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
              return -TARGET_EINVAL;
          }
      }
@@ -131,7 +123,7 @@ index 96cd4bf8..e6754772 100644
  
      mmap_lock();
  
-@@ -6633,7 +6630,7 @@ static int open_self_maps(void *cpu_env, int fd)
+@@ -6881,7 +6878,7 @@ static int open_self_maps(void *cpu_env, int fd)
          }
          if (h2g_valid(min)) {
              int flags = page_get_flags(h2g(min));
@@ -140,3 +132,6 @@ index 96cd4bf8..e6754772 100644
              if (page_check_range(h2g(min), max - min, flags) == -1) {
                  continue;
              }
+-- 
+2.22.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0011-fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0010-fix-libcap-header-issue-on-some-distro.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu/0011-fix-libcap-header-issue-on-some-distro.patch
rename to meta/recipes-devtools/qemu/qemu/0010-fix-libcap-header-issue-on-some-distro.patch
diff --git a/meta/recipes-devtools/qemu/qemu/0012-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch b/meta/recipes-devtools/qemu/qemu/0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
similarity index 97%
rename from meta/recipes-devtools/qemu/qemu/0012-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
rename to meta/recipes-devtools/qemu/qemu/0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
index 04664195d1..e5ebfc1267 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
@@ -37,7 +37,7 @@ index e83f72b4..e6e2576e 100644
      if (err && err != ESRCH) {
          fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
 +        fprintf(stderr, "CPU #%d:\n", cpu->cpu_index);
-+        cpu_dump_state(cpu, stderr, fprintf, 0);
++        cpu_dump_state(cpu, stderr, 0);
 +        backtrace_print();
          exit(1);
      }
diff --git a/meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch b/meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch
deleted file mode 100644
index c1dd957dc9..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 2f143d3ad1c05e91cf2cdf5de06d59a80a95e6c8 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Thu, 23 May 2019 14:47:43 +0100
-Subject: [PATCH] target/arm: Fix vector operation segfault
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 89e68b575 "target/arm: Use vector operations for saturation"
-causes this abort() when booting QEMU ARM with a Cortex-A15:
-
-0  0x00007ffff4c2382f in raise () at /usr/lib/libc.so.6
-1  0x00007ffff4c0e672 in abort () at /usr/lib/libc.so.6
-2  0x00005555559c1839 in disas_neon_data_insn (insn=<optimized out>, s=<optimized out>) at ./target/arm/translate.c:6673
-3  0x00005555559c1839 in disas_neon_data_insn (s=<optimized out>, insn=<optimized out>) at ./target/arm/translate.c:6386
-4  0x00005555559cd8a4 in disas_arm_insn (insn=4081107068, s=0x7fffe59a9510) at ./target/arm/translate.c:9289
-5  0x00005555559cd8a4 in arm_tr_translate_insn (dcbase=0x7fffe59a9510, cpu=<optimized out>) at ./target/arm/translate.c:13612
-6  0x00005555558d1d39 in translator_loop (ops=0x5555561cc580 <arm_translator_ops>, db=0x7fffe59a9510, cpu=0x55555686a2f0, tb=<optimized out>, max_insns=<optimized out>) at ./accel/tcg/translator.c:96
-7  0x00005555559d10d4 in gen_intermediate_code (cpu=cpu@entry=0x55555686a2f0, tb=tb@entry=0x7fffd7840080 <code_gen_buffer+126091347>, max_insns=max_insns@entry=512) at ./target/arm/translate.c:13901
-8  0x00005555558d06b9 in tb_gen_code (cpu=cpu@entry=0x55555686a2f0, pc=3067096216, cs_base=0, flags=192, cflags=-16252928, cflags@entry=524288) at ./accel/tcg/translate-all.c:1736
-9  0x00005555558ce467 in tb_find (cf_mask=524288, tb_exit=1, last_tb=0x7fffd783e640 <code_gen_buffer+126084627>, cpu=0x1) at ./accel/tcg/cpu-exec.c:407
-10 0x00005555558ce467 in cpu_exec (cpu=cpu@entry=0x55555686a2f0) at ./accel/tcg/cpu-exec.c:728
-11 0x000055555588b0cf in tcg_cpu_exec (cpu=0x55555686a2f0) at ./cpus.c:1431
-12 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=0x55555686a2f0) at ./cpus.c:1735
-13 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=arg@entry=0x55555686a2f0) at ./cpus.c:1709
-14 0x0000555555d2629a in qemu_thread_start (args=<optimized out>) at ./util/qemu-thread-posix.c:502
-15 0x00007ffff4db8a92 in start_thread () at /usr/lib/libpthread.
-
-This patch ensures that we don't hit the abort() in the second switch
-case in disas_neon_data_insn() as we will return from the first case.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
-Tested-by: Alex Bennée <alex.bennee@linaro.org>
-Message-id: ad91b397f360b2fc7f4087e476f7df5b04d42ddb.1558021877.git.alistair.francis@wdc.com
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-Upstream-Status: Backport [4.1.0]
----
- target/arm/translate.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/target/arm/translate.c b/target/arm/translate.c
-index dd053c80d6..298c262825 100644
---- a/target/arm/translate.c
-+++ b/target/arm/translate.c
-@@ -6598,13 +6598,13 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
-             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
-                            rn_ofs, rm_ofs, vec_size, vec_size,
-                            (u ? uqadd_op : sqadd_op) + size);
--            break;
-+            return 0;
- 
-         case NEON_3R_VQSUB:
-             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
-                            rn_ofs, rm_ofs, vec_size, vec_size,
-                            (u ? uqsub_op : sqsub_op) + size);
--            break;
-+            return 0;
- 
-         case NEON_3R_VMUL: /* VMUL */
-             if (u) {
--- 
-2.21.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
deleted file mode 100644
index 7cac8ef3d1..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
+++ /dev/null
@@ -1,339 +0,0 @@
-From 8104018ba4c66e568d2583a3a0ee940851ee7471 Mon Sep 17 00:00:00 2001
-From: Daniel P. Berrangé <berrange@redhat.com>
-Date: Tue, 23 Jul 2019 17:50:00 +0200
-Subject: [PATCH] linux-user: fix to handle variably sized SIOCGSTAMP with new
- kernels
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The SIOCGSTAMP symbol was previously defined in the
-asm-generic/sockios.h header file. QEMU sees that header
-indirectly via sys/socket.h
-
-In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
-the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
-Instead it provides only SIOCGSTAMP_OLD, which only uses a
-32-bit time_t on 32-bit architectures.
-
-The linux/sockios.h header then defines SIOCGSTAMP using
-either SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. If
-SIOCGSTAMP_NEW is used, then the tv_sec field is 64-bit even
-on 32-bit architectures
-
-To cope with this we must now convert the old and new type from
-the target to the host one.
-
-Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
-Signed-off-by: Laurent Vivier <laurent@vivier.eu>
-Reviewed-by: Arnd Bergmann <arnd@arndb.de>
-Message-Id: <20190718130641.15294-1-laurent@vivier.eu>
-Signed-off-by: Laurent Vivier <laurent@vivier.eu>
-Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
----
-Upstream-Status: Backport [upstream commit: 6d5d5dde9adb5acb32e6b8e3dfbf47fff0f308d2]
-
- linux-user/ioctls.h        |  21 +++++-
- linux-user/syscall.c       | 140 +++++++++++++++++++++++++++++--------
- linux-user/syscall_defs.h  |  30 +++++++-
- linux-user/syscall_types.h |   6 --
- 4 files changed, 159 insertions(+), 38 deletions(-)
-
-diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
-index ae8951625f..e6a27ad9d6 100644
---- a/linux-user/ioctls.h
-+++ b/linux-user/ioctls.h
-@@ -219,8 +219,25 @@
-   IOCTL(SIOCGRARP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_arpreq)))
-   IOCTL(SIOCGIWNAME, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_char_ifreq)))
-   IOCTL(SIOCGPGRP, IOC_R, MK_PTR(TYPE_INT)) /* pid_t */
--  IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
--  IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
-+
-+  /*
-+   * We can't use IOCTL_SPECIAL() because it will set
-+   * host_cmd to XXX_OLD and XXX_NEW and these macros
-+   * are not defined with kernel prior to 5.2.
-+   * We must set host_cmd to the same value as in target_cmd
-+   * otherwise the consistency check in syscall_init()
-+   * will trigger an error.
-+   * host_cmd is ignored by the do_ioctl_XXX() helpers.
-+   * FIXME: create a macro to define this kind of entry
-+   */
-+  { TARGET_SIOCGSTAMP_OLD, TARGET_SIOCGSTAMP_OLD,
-+    "SIOCGSTAMP_OLD", IOC_R, do_ioctl_SIOCGSTAMP },
-+  { TARGET_SIOCGSTAMPNS_OLD, TARGET_SIOCGSTAMPNS_OLD,
-+    "SIOCGSTAMPNS_OLD", IOC_R, do_ioctl_SIOCGSTAMPNS },
-+  { TARGET_SIOCGSTAMP_NEW, TARGET_SIOCGSTAMP_NEW,
-+    "SIOCGSTAMP_NEW", IOC_R, do_ioctl_SIOCGSTAMP },
-+  { TARGET_SIOCGSTAMPNS_NEW, TARGET_SIOCGSTAMPNS_NEW,
-+    "SIOCGSTAMPNS_NEW", IOC_R, do_ioctl_SIOCGSTAMPNS },
- 
-   IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
-   IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 96cd4bf86d..6df480e13d 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -37,6 +37,7 @@
- #include <sched.h>
- #include <sys/timex.h>
- #include <sys/socket.h>
-+#include <linux/sockios.h>
- #include <sys/un.h>
- #include <sys/uio.h>
- #include <poll.h>
-@@ -1139,8 +1140,9 @@ static inline abi_long copy_from_user_timeval(struct timeval *tv,
- {
-     struct target_timeval *target_tv;
- 
--    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1))
-+    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1)) {
-         return -TARGET_EFAULT;
-+    }
- 
-     __get_user(tv->tv_sec, &target_tv->tv_sec);
-     __get_user(tv->tv_usec, &target_tv->tv_usec);
-@@ -1155,8 +1157,26 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
- {
-     struct target_timeval *target_tv;
- 
--    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0))
-+    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
-+        return -TARGET_EFAULT;
-+    }
-+
-+    __put_user(tv->tv_sec, &target_tv->tv_sec);
-+    __put_user(tv->tv_usec, &target_tv->tv_usec);
-+
-+    unlock_user_struct(target_tv, target_tv_addr, 1);
-+
-+    return 0;
-+}
-+
-+static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
-+                                             const struct timeval *tv)
-+{
-+    struct target__kernel_sock_timeval *target_tv;
-+
-+    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
-         return -TARGET_EFAULT;
-+    }
- 
-     __put_user(tv->tv_sec, &target_tv->tv_sec);
-     __put_user(tv->tv_usec, &target_tv->tv_usec);
-@@ -1166,6 +1186,48 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
-     return 0;
- }
- 
-+static inline abi_long target_to_host_timespec(struct timespec *host_ts,
-+                                               abi_ulong target_addr)
-+{
-+    struct target_timespec *target_ts;
-+
-+    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1)) {
-+        return -TARGET_EFAULT;
-+    }
-+    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
-+    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
-+    unlock_user_struct(target_ts, target_addr, 0);
-+    return 0;
-+}
-+
-+static inline abi_long host_to_target_timespec(abi_ulong target_addr,
-+                                               struct timespec *host_ts)
-+{
-+    struct target_timespec *target_ts;
-+
-+    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
-+        return -TARGET_EFAULT;
-+    }
-+    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
-+    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
-+    unlock_user_struct(target_ts, target_addr, 1);
-+    return 0;
-+}
-+
-+static inline abi_long host_to_target_timespec64(abi_ulong target_addr,
-+                                                 struct timespec *host_ts)
-+{
-+    struct target__kernel_timespec *target_ts;
-+
-+    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
-+        return -TARGET_EFAULT;
-+    }
-+    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
-+    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
-+    unlock_user_struct(target_ts, target_addr, 1);
-+    return 0;
-+}
-+
- static inline abi_long copy_from_user_timezone(struct timezone *tz,
-                                                abi_ulong target_tz_addr)
- {
-@@ -4790,6 +4852,54 @@ static abi_long do_ioctl_kdsigaccept(const IOCTLEntry *ie, uint8_t *buf_temp,
-     return get_errno(safe_ioctl(fd, ie->host_cmd, sig));
- }
- 
-+static abi_long do_ioctl_SIOCGSTAMP(const IOCTLEntry *ie, uint8_t *buf_temp,
-+                                    int fd, int cmd, abi_long arg)
-+{
-+    struct timeval tv;
-+    abi_long ret;
-+
-+    ret = get_errno(safe_ioctl(fd, SIOCGSTAMP, &tv));
-+    if (is_error(ret)) {
-+        return ret;
-+    }
-+
-+    if (cmd == (int)TARGET_SIOCGSTAMP_OLD) {
-+        if (copy_to_user_timeval(arg, &tv)) {
-+            return -TARGET_EFAULT;
-+        }
-+    } else {
-+        if (copy_to_user_timeval64(arg, &tv)) {
-+            return -TARGET_EFAULT;
-+        }
-+    }
-+
-+    return ret;
-+}
-+
-+static abi_long do_ioctl_SIOCGSTAMPNS(const IOCTLEntry *ie, uint8_t *buf_temp,
-+                                      int fd, int cmd, abi_long arg)
-+{
-+    struct timespec ts;
-+    abi_long ret;
-+
-+    ret = get_errno(safe_ioctl(fd, SIOCGSTAMPNS, &ts));
-+    if (is_error(ret)) {
-+        return ret;
-+    }
-+
-+    if (cmd == (int)TARGET_SIOCGSTAMPNS_OLD) {
-+        if (host_to_target_timespec(arg, &ts)) {
-+            return -TARGET_EFAULT;
-+        }
-+    } else{
-+        if (host_to_target_timespec64(arg, &ts)) {
-+            return -TARGET_EFAULT;
-+        }
-+    }
-+
-+    return ret;
-+}
-+
- #ifdef TIOCGPTPEER
- static abi_long do_ioctl_tiocgptpeer(const IOCTLEntry *ie, uint8_t *buf_temp,
-                                      int fd, int cmd, abi_long arg)
-@@ -6160,32 +6270,6 @@ static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
- }
- #endif
- 
--static inline abi_long target_to_host_timespec(struct timespec *host_ts,
--                                               abi_ulong target_addr)
--{
--    struct target_timespec *target_ts;
--
--    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1))
--        return -TARGET_EFAULT;
--    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
--    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
--    unlock_user_struct(target_ts, target_addr, 0);
--    return 0;
--}
--
--static inline abi_long host_to_target_timespec(abi_ulong target_addr,
--                                               struct timespec *host_ts)
--{
--    struct target_timespec *target_ts;
--
--    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0))
--        return -TARGET_EFAULT;
--    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
--    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
--    unlock_user_struct(target_ts, target_addr, 1);
--    return 0;
--}
--
- static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
-                                                  abi_ulong target_addr)
- {
-diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
-index 12c8407144..c918419306 100644
---- a/linux-user/syscall_defs.h
-+++ b/linux-user/syscall_defs.h
-@@ -208,16 +208,34 @@ struct target_linger {
-     abi_int l_linger;       /* How long to linger for       */
- };
- 
-+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-+struct target_timeval {
-+    abi_long tv_sec;
-+    abi_int tv_usec;
-+};
-+#define target__kernel_sock_timeval target_timeval
-+#else
- struct target_timeval {
-     abi_long tv_sec;
-     abi_long tv_usec;
- };
- 
-+struct target__kernel_sock_timeval {
-+    abi_llong tv_sec;
-+    abi_llong tv_usec;
-+};
-+#endif
-+
- struct target_timespec {
-     abi_long tv_sec;
-     abi_long tv_nsec;
- };
- 
-+struct target__kernel_timespec {
-+    abi_llong tv_sec;
-+    abi_llong tv_nsec;
-+};
-+
- struct target_timezone {
-     abi_int tz_minuteswest;
-     abi_int tz_dsttime;
-@@ -743,8 +761,16 @@ struct target_pollfd {
- #define TARGET_SIOCATMARK      0x8905
- #define TARGET_SIOCGPGRP       0x8904
- #endif
--#define TARGET_SIOCGSTAMP      0x8906          /* Get stamp (timeval) */
--#define TARGET_SIOCGSTAMPNS    0x8907          /* Get stamp (timespec) */
-+#if defined(TARGET_SH4)
-+#define TARGET_SIOCGSTAMP_OLD   TARGET_IOR('s', 100, struct target_timeval)
-+#define TARGET_SIOCGSTAMPNS_OLD TARGET_IOR('s', 101, struct target_timespec)
-+#else
-+#define TARGET_SIOCGSTAMP_OLD   0x8906
-+#define TARGET_SIOCGSTAMPNS_OLD 0x8907
-+#endif
-+
-+#define TARGET_SIOCGSTAMP_NEW   TARGET_IOR(0x89, 0x06, abi_llong[2])
-+#define TARGET_SIOCGSTAMPNS_NEW TARGET_IOR(0x89, 0x07, abi_llong[2])
- 
- /* Networking ioctls */
- #define TARGET_SIOCADDRT       0x890B          /* add routing table entry */
-diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
-index b98a23b0f1..4e36983826 100644
---- a/linux-user/syscall_types.h
-+++ b/linux-user/syscall_types.h
-@@ -14,12 +14,6 @@ STRUCT(serial_icounter_struct,
- STRUCT(sockaddr,
-        TYPE_SHORT, MK_ARRAY(TYPE_CHAR, 14))
- 
--STRUCT(timeval,
--       MK_ARRAY(TYPE_LONG, 2))
--
--STRUCT(timespec,
--       MK_ARRAY(TYPE_LONG, 2))
--
- STRUCT(rtentry,
-        TYPE_ULONG, MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr),
-        TYPE_SHORT, TYPE_SHORT, TYPE_ULONG, TYPE_PTRVOID, TYPE_SHORT, TYPE_PTRVOID,
--- 
-2.21.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
deleted file mode 100644
index c49a5e9a2a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d52680fc932efb8a2f334cc6993e705ed1e31e99 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 25 Apr 2019 12:05:34 +0530
-Subject: [PATCH] qxl: check release info object
-
-When releasing spice resources in release_resource() routine,
-if release info object 'ext.info' is null, it leads to null
-pointer dereference. Add check to avoid it.
-
-Reported-by: Bugs SysSec <bugs-syssec@rub.de>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-id: 20190425063534.32747-1-ppandit@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-
-Upstream-Status: Backport
-CVE: CVE-2019-12155
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- hw/display/qxl.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/hw/display/qxl.c b/hw/display/qxl.c
-index c8ce5781e03..632923add23 100644
---- a/hw/display/qxl.c
-+++ b/hw/display/qxl.c
-@@ -777,6 +777,9 @@ static void interface_release_resource(QXLInstance *sin,
-     QXLReleaseRing *ring;
-     uint64_t *item, id;
- 
-+    if (!ext.info) {
-+        return;
-+    }
-     if (ext.group_id == MEMSLOT_GROUP_HOST) {
-         /* host group -> vga mode update request */
-         QXLCommandExt *cmdext = (void *)(intptr_t)(ext.info->id);
diff --git a/meta/recipes-devtools/qemu/qemu_4.0.0.bb b/meta/recipes-devtools/qemu/qemu_4.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_4.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_4.1.0.bb
-- 
2.22.0


