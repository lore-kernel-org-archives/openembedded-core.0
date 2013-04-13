Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1UR5ZE-0006qv-77
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 20:52:52 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id F1F3E2232545
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2013 20:35:14 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 79D2E2232544
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2013 20:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052239062.adsl.alicedsl.de
	[78.52.239.62]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2013 20:35:13 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 97CF93C510; Sat, 13 Apr 2013 20:35:11 +0200 (CEST)
From: "Henning Heinold" <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2013 20:35:11 +0200
Message-Id: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.10.4
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] qemu: define fdt_t types in libfdt_env.h from qemu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 18:52:52 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>

* fixes
In file included from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/libfdt.h:55:0,
                 from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qemu-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/recipes-devtools/qemu/files/fdt_header.patch |   39 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.4.0.bb          |    4 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/fdt_header.patch

diff --git a/meta/recipes-devtools/qemu/files/fdt_header.patch b/meta/recipes-devtools/qemu/files/fdt_header.patch
new file mode 100644
index 0000000..dccfe53
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/fdt_header.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Pending 
+
+qemu: define fdt types in libfdt_env.h from qemu
+    
+    * fixes
+    In file included from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/libfdt.h:55:0,
+                     from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qemu-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
+    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
+
+Index: qemu-1.4.0/include/libfdt_env.h
+===================================================================
+--- qemu-1.4.0.orig/include/libfdt_env.h	2013-02-15 23:05:35.000000000 +0000
++++ qemu-1.4.0/include/libfdt_env.h	2013-04-13 14:17:27.918885225 +0000
+@@ -21,6 +21,10 @@
+ 
+ #include "qemu/bswap.h"
+ 
++typedef uint16_t fdt16_t;
++typedef uint32_t fdt32_t;
++typedef uint64_t fdt64_t;
++
+ #ifdef HOST_WORDS_BIGENDIAN
+ #define fdt32_to_cpu(x)  (x)
+ #define cpu_to_fdt32(x)  (x)
diff --git a/meta/recipes-devtools/qemu/qemu_1.4.0.bb b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
index e705a03..d968782 100644
--- a/meta/recipes-devtools/qemu/qemu_1.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
@@ -3,7 +3,9 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://3f08ffb4a4741d147634761dc053ed386243a0de.patch"
+SRC_URI += "file://3f08ffb4a4741d147634761dc053ed386243a0de.patch \
+            file://fdt_header.patch \
+           "
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "78f13b774814b6b7ebcaf4f9b9204318"
-- 
1.7.10.4


