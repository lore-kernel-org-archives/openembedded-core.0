Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UDeCl-0005C3-1a
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 18:02:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Mar 2013 08:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,803,1355126400"; d="scan'208";a="295918531"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 07 Mar 2013 08:45:31 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2013 18:45:39 +0200
Message-Id: <1362674739-1647-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox: Upgrade to v1.21.0
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
X-List-Received-Date: Thu, 07 Mar 2013 17:02:09 -0000

Removed obsolete patches

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   28 ------
 .../busybox-mkfs-minix-tests_bigendian.patch       |   34 -------
 .../fix-for-spurious-testsuite-failure.patch       |   27 ------
 .../busybox/busybox-1.20.2/sys_resource.patch      |   99 --------------------
 .../busybox/busybox-1.20.2/wget_dl_dir_fix.patch   |   30 ------
 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |    0
 .../{busybox-1.20.2 => busybox-1.21.0}/defconfig   |    0
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |    6 +-
 .../stat-usr-bin.patch                             |    0
 ...estsuite-du-du-k-works-fix-false-positive.patch |    0
 .../watch.in.usr-bin.patch                         |    0
 .../{busybox_1.20.2.bb => busybox_1.21.0.bb}       |   11 +--
 15 files changed, 6 insertions(+), 229 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-udhcpc-no_deconfig.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/run-parts.in.usr-bin.patch (90%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/stat-usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/testsuite-du-du-k-works-fix-false-positive.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/watch.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.20.2.bb => busybox_1.21.0.bb} (70%)

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
deleted file mode 100644
index 69bbe73..0000000
--- a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Signed-off-by: Radu Moisan <radu.moisan@intel.com>
-Upstream-Status: Pending
-
---- busybox-1.20.2/libbb/kernel_version.c
-+++ busybox-1.20.2-kernel_ver/libbb/kernel_version.c
-@@ -20,18 +20,15 @@
- int FAST_FUNC get_linux_version_code(void)
- {
- 	struct utsname name;
--	char *s;
-+	char *s, *t;
- 	int i, r;
- 
--	if (uname(&name) == -1) {
--		bb_perror_msg("can't get system information");
--		return 0;
--	}
--
-+	uname(&name); /* never fails */
- 	s = name.release;
- 	r = 0;
- 	for (i = 0; i < 3; i++) {
--		r = r * 256 + atoi(strtok(s, "."));
-+		t = strtok(s, ".");
-+		r = r * 256 + (t ? atoi(t) : 0);
- 		s = NULL;
- 	}
- 	return r;
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
deleted file mode 100644
index 089c5e0..0000000
--- a/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-patch mkfs.minix.tests to have correct md5sum on big endian platform
-
-Upstream-Status: Accepted, expected in next release
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
-
-diff --git a/testsuite/mkfs.minix.tests b/testsuite/mkfs.minix.tests
-index 8a33c16..7eecaf2 100755
---- a/testsuite/mkfs.minix.tests
-+++ b/testsuite/mkfs.minix.tests
-@@ -8,6 +8,14 @@
- 
- # testing "test name" "options" "expected result" "file input" "stdin"
- 
-+# '\n' produces 10 on little endian, but not on big endian
-+cr=`echo | od -i | sed 's/.* //g;2d'`
-+if [ x"$cr" = x"10" ]; then
-+	hash=4f35f7afeba07d56055bed1f29ae20b7
-+else
-+	hash=5adbc1b3ccd20ca5d0ab5bc1e13ac3fc
-+fi
-+
- testing "mkfs.minix" \
- 	"dd if=/dev/zero of=input bs=1k count=1024 2>/dev/null; mkfs.minix input; md5sum <input" \
- "352 inodes\n"\
-@@ -15,7 +23,7 @@ testing "mkfs.minix" \
- "Firstdatazone=15 (15)\n"\
- "Zonesize=1024\n"\
- "Maxsize=268966912\n"\
--"4f35f7afeba07d56055bed1f29ae20b7  -\n" \
-+"$hash  -\n" \
- 	"" \
- 	""
- 
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch b/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
deleted file mode 100644
index b75eaac..0000000
--- a/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Backport the patch from:
-http://git.busybox.net/busybox/commit/?id=a5ee090e8651692545514a81a16c6cde3a2dc577
-
-From a5ee090e8651692545514a81a16c6cde3a2dc577 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 10 May 2012 19:26:37 +0200
-Subject: [PATCH] fix for spurious testsuite failure
-
-Upstream-Status: Backport
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- testsuite/du/du-k-works |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/testsuite/du/du-k-works b/testsuite/du/du-k-works
-index 229a948..36dcaa8 100644
---- a/testsuite/du/du-k-works
-+++ b/testsuite/du/du-k-works
-@@ -3,4 +3,5 @@ cd du.testdir
- dd if=/dev/zero of=file1 bs=1k count=64 2>/dev/null
- dd if=/dev/zero of=file2 bs=1k count=16 2>/dev/null
- test x"`busybox du -k .`" = x"80	." \
-+  -o x"`busybox du -k .`" = x"84	." \
-   -o x"`busybox du -k .`" = x"88	."
--- 
-1.7.4.1
-
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch b/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
deleted file mode 100644
index bd55961..0000000
--- a/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-From c5fe9f7b723f949457263ef8e22ab807d5b549ce Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Fri, 06 Jul 2012 03:19:09 +0000
-Subject: include sys/resource.h where needed
-
-We use functions from sys/resource.h in misc applets, but don't include
-the header.  This breaks building with newer glibc versions, so add the
-include where needed.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
-Index: busybox-1.19.4/loginutils/passwd.c
-===================================================================
---- busybox-1.19.4.orig/loginutils/passwd.c	2012-02-04 11:34:24.000000000 -0800
-+++ busybox-1.19.4/loginutils/passwd.c	2012-07-06 17:48:27.388096092 -0700
-@@ -15,6 +15,7 @@
- 
- #include "libbb.h"
- #include <syslog.h>
-+#include <sys/resource.h> /* setrlimit */
- 
- static void nuke_str(char *str)
- {
-Index: busybox-1.19.4/miscutils/time.c
-===================================================================
---- busybox-1.19.4.orig/miscutils/time.c	2012-02-04 11:24:55.000000000 -0800
-+++ busybox-1.19.4/miscutils/time.c	2012-07-06 17:48:27.388096092 -0700
-@@ -16,6 +16,7 @@
- //usage:     "\n	-v	Verbose"
- 
- #include "libbb.h"
-+#include <sys/resource.h> /* getrusage */
- 
- /* Information on the resources used by a child process.  */
- typedef struct {
-Index: busybox-1.19.4/networking/inetd.c
-===================================================================
---- busybox-1.19.4.orig/networking/inetd.c	2012-02-04 11:34:24.000000000 -0800
-+++ busybox-1.19.4/networking/inetd.c	2012-07-06 17:48:54.852097259 -0700
-@@ -165,6 +165,7 @@
- //usage:     "\n		(default: 0 - disabled)"
- 
- #include <syslog.h>
-+#include <sys/resource.h> /* setrlimit */
- #include <sys/un.h>
- 
- #include "libbb.h"
-Index: busybox-1.19.4/networking/ntpd.c
-===================================================================
---- busybox-1.19.4.orig/networking/ntpd.c	2012-02-04 11:24:55.000000000 -0800
-+++ busybox-1.19.4/networking/ntpd.c	2012-07-06 17:48:27.392096048 -0700
-@@ -46,6 +46,7 @@
- #include "libbb.h"
- #include <math.h>
- #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
-+#include <sys/resource.h> /* setpriority */
- #include <sys/timex.h>
- #ifndef IPTOS_LOWDELAY
- # define IPTOS_LOWDELAY 0x10
-Index: busybox-1.19.4/networking/ntpd_simple.c
-===================================================================
---- busybox-1.19.4.orig/networking/ntpd_simple.c	2012-02-04 11:24:55.000000000 -0800
-+++ busybox-1.19.4/networking/ntpd_simple.c	2012-07-06 17:48:27.400095949 -0700
-@@ -7,6 +7,7 @@
-  */
- #include "libbb.h"
- #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
-+#include <sys/resource.h> /* setpriority */
- #ifndef IPTOS_LOWDELAY
- # define IPTOS_LOWDELAY 0x10
- #endif
-Index: busybox-1.19.4/runit/chpst.c
-===================================================================
---- busybox-1.19.4.orig/runit/chpst.c	2012-02-04 11:34:24.000000000 -0800
-+++ busybox-1.19.4/runit/chpst.c	2012-07-06 17:48:27.400095949 -0700
-@@ -91,6 +91,7 @@
- //usage:     "\n			a SIGXCPU after N seconds"
- 
- #include "libbb.h"
-+#include <sys/resource.h> /* getrlimit */
- 
- /*
- Five applets here: chpst, envdir, envuidgid, setuidgid, softlimit.
-Index: busybox-1.19.4/shell/shell_common.c
-===================================================================
---- busybox-1.19.4.orig/shell/shell_common.c	2012-02-04 11:34:24.000000000 -0800
-+++ busybox-1.19.4/shell/shell_common.c	2012-07-06 17:48:27.400095949 -0700
-@@ -18,6 +18,7 @@
-  */
- #include "libbb.h"
- #include "shell_common.h"
-+#include <sys/resource.h> /* getrlimit */
- 
- const char defifsvar[] ALIGN1 = "IFS= \t\n";
- 
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch b/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
deleted file mode 100644
index 3003965..0000000
--- a/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-In cases where busybox wget is invoked with -P <...> and the url ends
-in "/", the download directory is ignored (ie the file index.html is
-implied), this change enables the -P option for those urls.
-
-Signed-off-by: Amy Fong <amy.fong@windriver.com>
-Upstream-Status: Submitted
----
- networking/wget.c |   10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
---- a/networking/wget.c
-+++ b/networking/wget.c
-@@ -589,10 +589,14 @@
- 	if (!(option_mask32 & WGET_OPT_OUTNAME)) {
- 		G.fname_out = bb_get_last_path_component_nostrip(target.path);
- 		/* handle "wget http://kernel.org//" */
--		if (G.fname_out[0] == '/' || !G.fname_out[0])
--			G.fname_out = (char*)"index.html";
-+		if (G.fname_out[0] == '/' || !G.fname_out[0]) {
-+			/* bug: if we provide a default name, we should still look at -P option */
-+			if (G.dir_prefix)
-+				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, "index.html");
-+			else
-+				G.fname_out = (char*)"index.html";
- 		/* -P DIR is considered only if there was no -O FILE */
--		else {
-+		} else {
- 			if (G.dir_prefix)
- 				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, G.fname_out);
- 			else {
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/B921600.patch b/meta/recipes-core/busybox/busybox-1.21.0/B921600.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/B921600.patch
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-appletlib-dependency.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/busybox-appletlib-dependency.patch
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-udhcpc-no_deconfig.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/busybox-udhcpc-no_deconfig.patch
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/defconfig b/meta/recipes-core/busybox/busybox-1.21.0/defconfig
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/defconfig
rename to meta/recipes-core/busybox/busybox-1.21.0/defconfig
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.21.0/get_header_tar.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/get_header_tar.patch
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.0/run-parts.in.usr-bin.patch
similarity index 90%
rename from meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/run-parts.in.usr-bin.patch
index 1fe20d4..65f6c96 100644
--- a/meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
+++ b/meta/recipes-core/busybox/busybox-1.21.0/run-parts.in.usr-bin.patch
@@ -18,12 +18,12 @@ Upstream-Status: Inappropriate [configuration]
 diff -uNr busybox-1.15.3.orig//include/applets.src.h busybox-1.15.3/include/applets.src.h
 --- busybox-1.15.3.orig//include/applets.src.h	2009-12-12 22:13:28.000000000 +0100
 +++ busybox-1.15.3/include/applets.src.h	2010-04-30 15:35:40.000000000 +0200
-@@ -323,7 +323,7 @@
+@@ -304,7 +304,7 @@
  IF_RPM(APPLET(rpm, BB_DIR_BIN, BB_SUID_DROP))
  IF_RPM2CPIO(APPLET(rpm2cpio, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_SBIN, BB_SUID_DROP))
 -IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_BIN, BB_SUID_DROP, run_parts))
 +IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_USR_BIN, BB_SUID_DROP, run_parts))
  IF_RUNCON(APPLET(runcon, BB_DIR_USR_BIN, BB_SUID_DROP))
  IF_RUNLEVEL(APPLET(runlevel, BB_DIR_SBIN, BB_SUID_DROP))
- IF_RUNSV(APPLET(runsv, BB_DIR_USR_BIN, _BB_SUID_DROP))
+ IF_RUNSV(APPLET(runsv, BB_DIR_USR_BIN, BB_SUID_DROP))
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.0/stat-usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/stat-usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch b/meta/recipes-core/busybox/busybox-1.21.0/testsuite-du-du-k-works-fix-false-positive.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/testsuite-du-du-k-works-fix-false-positive.patch
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.0/watch.in.usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.21.0/watch.in.usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.21.0.bb
similarity index 70%
rename from meta/recipes-core/busybox/busybox_1.20.2.bb
rename to meta/recipes-core/busybox/busybox_1.21.0.bb
index 783261e..bbbd680 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.0.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -8,8 +8,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-parts.in.usr-bin.patch \
            file://watch.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
-           file://sys_resource.patch \
-           file://wget_dl_dir_fix.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
            file://busybox-httpd \
@@ -24,13 +22,10 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mdev.conf \
            file://umount.busybox \
            file://defconfig \
-           file://busybox-mkfs-minix-tests_bigendian.patch \
-           file://fix-for-spurious-testsuite-failure.patch \
-           file://busybox-1.20.2-kernel_ver.patch \
            file://stat-usr-bin.patch \
            file://testsuite-du-du-k-works-fix-false-positive.patch"
 
-SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
-SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
+SRC_URI[tarball.md5sum] = "d613f2e4b580305c1de8691f7b84285e"
+SRC_URI[tarball.sha256sum] = "eb9d268627783297f5f459cb9bd61a94e395dc7cb3647e10ec186e0159aa36ed"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.7.9.5



