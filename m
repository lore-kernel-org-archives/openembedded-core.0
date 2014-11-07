Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D55465D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 12:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA7CNGGJ008401; Fri, 7 Nov 2014 12:23:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5AqSGLDy5DE4; Fri,  7 Nov 2014 12:23:15 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA7CNB59008318
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Nov 2014 12:23:12 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XmiZq-0007tW-Hm; Fri, 07 Nov 2014 12:23:42 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 12:23:40 +0000
Message-Id: <1415363021-30309-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] gdb: 7.7.1 -> 7.8.1
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
X-List-Received-Date: Fri, 07 Nov 2014 12:23:57 -0000

Drop patch merged upstream.

Also drop old arm/thumb patch which breaks the compile on arm. We've
had this since 2010 (or longer) and the issue has likely been fixed
upstream by now. If not someone with more knowledge will need to
figure out the fix against the current codebase.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gdb/{gdb-7.7.1.inc => gdb-7.8.1.inc}           |  5 ++--
 ...nadian_7.7.1.bb => gdb-cross-canadian_7.8.1.bb} |  0
 .../gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.1.bb} |  0
 meta/recipes-devtools/gdb/gdb.inc                  |  4 +--
 .../gdb/gdb/include_asm_ptrace.patch               | 30 ----------------------
 .../gdb/gdb/kill_arm_map_symbols.patch             | 26 -------------------
 .../gdb/{gdb_7.7.1.bb => gdb_7.8.1.bb}             |  0
 7 files changed, 4 insertions(+), 61 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.7.1.inc => gdb-7.8.1.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.7.1.bb => gdb-cross-canadian_7.8.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch
 rename meta/recipes-devtools/gdb/{gdb_7.7.1.bb => gdb_7.8.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.7.1.inc b/meta/recipes-devtools/gdb/gdb-7.8.1.inc
similarity index 70%
rename from meta/recipes-devtools/gdb/gdb-7.7.1.inc
rename to meta/recipes-devtools/gdb/gdb-7.8.1.inc
index aa16d5a..6fa13bc 100644
--- a/meta/recipes-devtools/gdb/gdb-7.7.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.8.1.inc
@@ -6,5 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "45b07b53d81832d32ccd4829465d4886"
-SRC_URI[sha256sum] = "eefadb9831e3695d1eaef34e98b8f1fb441df6fe5071317ea49c6bd6ba213eff"
+SRC_URI[md5sum] = "997492cc3475c96f35ecc8775248c9b1"
+SRC_URI[sha256sum] = "d7a923d876ecfa1cec4c1c79c014c9d8e58783a25855a95cf260275f61990647"
+
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.8.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.8.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 7b3e59a..2c95e03 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -2,10 +2,8 @@ require gdb-common.inc
 
 inherit gettext
 
-SRC_URI += "file://kill_arm_map_symbols.patch \
-            file://gdbserver-cflags-last.diff;striplevel=0 \
+SRC_URI += "file://gdbserver-cflags-last.diff;striplevel=0 \
             file://renesas-sh-native-support.patch \
-            file://include_asm_ptrace.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch b/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
deleted file mode 100644
index 85e0147..0000000
--- a/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-gdb: include asm/ptrace.h in two aarch64 source files
-
-Both sys/ptrace.h and asm/ptrace.h need to be included.
-
-Upstream-Status: Pending
-
-Signed-off-by: joe.slater@windriver.com
-
-
---- a/gdb/aarch64-linux-nat.c
-+++ b/gdb/aarch64-linux-nat.c
-@@ -32,6 +32,8 @@
- #include "elf/common.h"
- 
- #include <sys/ptrace.h>
-+#include <asm/ptrace.h>
-+
- #include <sys/utsname.h>
- 
- #include "gregset.h"
---- a/gdb/gdbserver/linux-aarch64-low.c
-+++ b/gdb/gdbserver/linux-aarch64-low.c
-@@ -26,6 +26,7 @@
- #include <signal.h>
- #include <sys/user.h>
- #include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- #include <sys/uio.h>
- 
- #include "gdb_proc_service.h"
diff --git a/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch b/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch
deleted file mode 100644
index 9fc45b9..0000000
--- a/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: gdb-7.3/gdb/arm-tdep.c
-===================================================================
---- gdb-7.3.orig/gdb/arm-tdep.c	2011-05-17 14:27:01.000000000 -0700
-+++ gdb-7.3/gdb/arm-tdep.c	2011-08-05 22:29:58.784201850 -0700
-@@ -7806,6 +7806,19 @@
- static void
- arm_elf_make_msymbol_special(asymbol *sym, struct minimal_symbol *msym)
- {
-+
-+    /* FIXME: We want gdb to ignore the ARM ELF mapping symbols when
-+	displaying disassembly so we use this horrible hack here to
-+	artifically set their address to the highest possible value.
-+	This is wrong of course, and it prevents the symbols from being
-+	used for their intended purpose - to distinguish between ARM
-+	and THUMB code.  So we ought to find a better way to do this.  */
-+    if (bfd_asymbol_name (sym)
-+	&& bfd_asymbol_name (sym)[0] == '$'
-+	&& bfd_asymbol_name (sym)[1] != 0
-+	&& bfd_asymbol_name (sym)[2] == 0)
-+      SYMBOL_VALUE_ADDRESS(msym) = (CORE_ADDR) 0x7ffffffc;
-+
-   if (ARM_SYM_BRANCH_TYPE (&((elf_symbol_type *)sym)->internal_elf_sym)
-       == ST_BRANCH_TO_THUMB)
-     MSYMBOL_SET_SPECIAL (msym);
diff --git a/meta/recipes-devtools/gdb/gdb_7.7.1.bb b/meta/recipes-devtools/gdb/gdb_7.8.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.7.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.8.1.bb
-- 
2.1.0


