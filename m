Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3845870A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bd1mb009455; Tue, 4 Nov 2014 11:39:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qQraQFBomDRA; Tue,  4 Nov 2014 11:39:01 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bceah009427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Nov 2014 11:38:41 GMT
Received: from richard by ted with local (Exim 4.82)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XlcS6-0000Jc-HY; Tue, 04 Nov 2014 11:39:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:39:08 +0000
Message-Id: <1415101148-1142-8-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 8/8] gdb: 7.7.1 -> 7.8
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
X-List-Received-Date: Tue, 04 Nov 2014 11:39:40 -0000

Drop patch merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb-7.7.1.inc            | 10 --------
 meta/recipes-devtools/gdb/gdb-7.8.inc              | 10 ++++++++
 .../gdb/gdb-cross-canadian_7.7.1.bb                |  3 ---
 .../recipes-devtools/gdb/gdb-cross-canadian_7.8.bb |  3 +++
 meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb       |  4 ---
 meta/recipes-devtools/gdb/gdb-cross_7.8.bb         |  4 +++
 meta/recipes-devtools/gdb/gdb.inc                  |  1 -
 .../gdb/gdb/include_asm_ptrace.patch               | 30 ----------------------
 meta/recipes-devtools/gdb/gdb_7.7.1.bb             | 24 -----------------
 meta/recipes-devtools/gdb/gdb_7.8.bb               | 24 +++++++++++++++++
 10 files changed, 41 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-7.7.1.inc
 create mode 100644 meta/recipes-devtools/gdb/gdb-7.8.inc
 delete mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
 delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.8.bb
 delete mode 100644 meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb_7.7.1.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb_7.8.bb

diff --git a/meta/recipes-devtools/gdb/gdb-7.7.1.inc b/meta/recipes-devtools/gdb/gdb-7.7.1.inc
deleted file mode 100644
index aa16d5a..0000000
--- a/meta/recipes-devtools/gdb/gdb-7.7.1.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-SRC_URI[md5sum] = "45b07b53d81832d32ccd4829465d4886"
-SRC_URI[sha256sum] = "eefadb9831e3695d1eaef34e98b8f1fb441df6fe5071317ea49c6bd6ba213eff"
diff --git a/meta/recipes-devtools/gdb/gdb-7.8.inc b/meta/recipes-devtools/gdb/gdb-7.8.inc
new file mode 100644
index 0000000..f4e9a9e
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-7.8.inc
@@ -0,0 +1,10 @@
+LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+SRC_URI[md5sum] = "38d816d641093db2e13ba284e26090b4"
+SRC_URI[sha256sum] = "46be505fc1bc157a01124333ef37ed195147fa6a405cbfd32dea63bacaaabbe4"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
deleted file mode 100644
index 3010359..0000000
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require gdb-common.inc
-require gdb-cross-canadian.inc
-require gdb-${PV}.inc
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
new file mode 100644
index 0000000..3010359
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
@@ -0,0 +1,3 @@
+require gdb-common.inc
+require gdb-cross-canadian.inc
+require gdb-${PV}.inc
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
deleted file mode 100644
index f9da486..0000000
--- a/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require gdb-cross.inc
-require gdb-${PV}.inc
-
-SRC_URI += "file://sim-install-6.6.patch"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.8.bb b/meta/recipes-devtools/gdb/gdb-cross_7.8.bb
new file mode 100644
index 0000000..f9da486
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.8.bb
@@ -0,0 +1,4 @@
+require gdb-cross.inc
+require gdb-${PV}.inc
+
+SRC_URI += "file://sim-install-6.6.patch"
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 7b3e59a..3321a24 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -5,7 +5,6 @@ inherit gettext
 SRC_URI += "file://kill_arm_map_symbols.patch \
             file://gdbserver-cflags-last.diff;striplevel=0 \
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
diff --git a/meta/recipes-devtools/gdb/gdb_7.7.1.bb b/meta/recipes-devtools/gdb/gdb_7.7.1.bb
deleted file mode 100644
index 1abc9d8..0000000
--- a/meta/recipes-devtools/gdb/gdb_7.7.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require gdb.inc
-require gdb-${PV}.inc
-
-inherit python-dir
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
-PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
-
-do_configure_prepend() {
-	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
-		cat > ${WORKDIR}/python << EOF
-#!/bin/sh
-case "\$2" in
-	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
-	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
-	--exec-prefix) echo "${exec_prefix}" ;;
-	*) exit 1 ;;
-esac
-exit 0
-EOF
-		chmod +x ${WORKDIR}/python
-	fi
-}
diff --git a/meta/recipes-devtools/gdb/gdb_7.8.bb b/meta/recipes-devtools/gdb/gdb_7.8.bb
new file mode 100644
index 0000000..1abc9d8
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb_7.8.bb
@@ -0,0 +1,24 @@
+require gdb.inc
+require gdb-${PV}.inc
+
+inherit python-dir
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
+PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
+
+do_configure_prepend() {
+	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
+		cat > ${WORKDIR}/python << EOF
+#!/bin/sh
+case "\$2" in
+	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
+	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+	--exec-prefix) echo "${exec_prefix}" ;;
+	*) exit 1 ;;
+esac
+exit 0
+EOF
+		chmod +x ${WORKDIR}/python
+	fi
+}
-- 
2.0.2


