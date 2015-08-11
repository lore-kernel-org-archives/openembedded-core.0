Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DFC72767F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:26:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 08:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,653,1432623600"; d="scan'208";a="746460183"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2015 08:26:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 18:27:16 +0300
Message-Id: <24c21202012adf0c10fbe8e056720331a4330726.1439306707.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439306707.git.alexander.kanavin@linux.intel.com>
References: <cover.1439306707.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/2] apmd: update to 3.2.2-15
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
X-List-Received-Date: Tue, 11 Aug 2015 15:26:31 -0000

This basically means replacing a "-14" Debian patch with "-15" patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd.service      |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy        |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy.conf   |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/default           |   0
 meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/init |   0
 meta/recipes-bsp/apmd/apmd/legacy.patch            | 133 +++++++++++++++++++++
 .../apmd/{apmd-3.2.2-14 => apmd}/libtool.patch     |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/unlinux.patch     |   0
 .../apmd/{apmd_3.2.2-14.bb => apmd_3.2.2-15.bb}    |   5 +-
 9 files changed, 134 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/apmd.service (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy.conf (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/default (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/init (100%)
 create mode 100644 meta/recipes-bsp/apmd/apmd/legacy.patch
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/libtool.patch (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/unlinux.patch (100%)
 rename meta/recipes-bsp/apmd/{apmd_3.2.2-14.bb => apmd_3.2.2-15.bb} (92%)

diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service b/meta/recipes-bsp/apmd/apmd/apmd.service
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
rename to meta/recipes-bsp/apmd/apmd/apmd.service
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy b/meta/recipes-bsp/apmd/apmd/apmd_proxy
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy
rename to meta/recipes-bsp/apmd/apmd/apmd_proxy
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy.conf b/meta/recipes-bsp/apmd/apmd/apmd_proxy.conf
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy.conf
rename to meta/recipes-bsp/apmd/apmd/apmd_proxy.conf
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/default b/meta/recipes-bsp/apmd/apmd/default
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/default
rename to meta/recipes-bsp/apmd/apmd/default
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/init b/meta/recipes-bsp/apmd/apmd/init
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/init
rename to meta/recipes-bsp/apmd/apmd/init
diff --git a/meta/recipes-bsp/apmd/apmd/legacy.patch b/meta/recipes-bsp/apmd/apmd/legacy.patch
new file mode 100644
index 0000000..5db895e
--- /dev/null
+++ b/meta/recipes-bsp/apmd/apmd/legacy.patch
@@ -0,0 +1,133 @@
+From 3595933d221f0ba836917debc0776b8723972ec9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 11 Aug 2015 17:40:50 +0300
+Subject: [PATCH 1/3] Patch with fixes provided by Debian.
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/a/apmd/apmd_3.2.2-15.debian.tar.xz
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+
+---
+ Makefile |  2 +-
+ apm.c    |  3 ++-
+ apm.h    |  9 +++++++++
+ apmd.c   | 15 ++++++++-------
+ 4 files changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index bf346d9..92fc0fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -43,7 +43,7 @@ DESTDIR=
+ 
+ CC=gcc
+ CFLAGS=-O -g
+-XTRACFLAGS=-Wall -pipe -I. -I/usr/src/linux/include \
++XTRACFLAGS=-Wall -pipe -I. -I/usr/src/linux/include -I/usr/X11R6/include \
+ 		-I/usr/src/linux-2.2/include -I /usr/src/linux-2.0/include \
+ 		-DVERSION=\"$(VERSION)\" \
+ 		-DDEFAULT_PROXY_NAME=\"$(PROXY_DIR)/apmd_proxy\"
+diff --git a/apm.c b/apm.c
+index b21c057..0359b1c 100644
+--- a/apm.c
++++ b/apm.c
+@@ -219,12 +219,13 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+ 													    
+-
++#if 0
+     if (!(i.apm_flags & APM_32_BIT_SUPPORT))
+     {
+ 	fprintf(stderr, "32-bit APM interface not supported\n");
+ 	exit(1);
+     }
++#endif
+ 
+     if (verbose && (i.apm_flags & 0x10))
+ 	printf("APM BIOS Power Management is currently disabled\n");
+diff --git a/apm.h b/apm.h
+index fb24dfd..824cc06 100644
+--- a/apm.h
++++ b/apm.h
+@@ -20,6 +20,13 @@
+  * $Id: apm.h,v 1.7 1999/07/05 22:31:11 apenwarr Exp $
+  * 
+  */
++#ifndef _APM_H
++#define _APM_H 1
++
++#ifndef __KERNEL_STRICT_NAMES
++#define __KERNEL_STRICT_NAMES
++#endif
++
+ #include <linux/apm_bios.h>
+ #include <sys/types.h>
+ 
+@@ -93,3 +100,5 @@ extern int apm_reject(int fd);
+ #else
+ #define apm_reject(fd)   (-EINVAL)
+ #endif
++
++#endif
+diff --git a/apmd.c b/apmd.c
+index 49ed3a1..560f536 100644
+--- a/apmd.c
++++ b/apmd.c
+@@ -343,7 +343,7 @@ static int call_proxy(apm_event_t event)
+ 		/* parent */
+ 		int status, retval;
+ 		ssize_t len;
+-		time_t time_limit;
++		time_t countdown;
+ 
+ 		if (pid < 0) {
+ 			/* Couldn't fork */
+@@ -356,8 +356,9 @@ static int call_proxy(apm_event_t event)
+ 		/* Capture the child's output, if any, but only until it terminates */
+ 		close(fds[1]);
+ 		fcntl(fds[0], F_SETFL, O_RDONLY|O_NONBLOCK);
+-		time_limit = time(0) + proxy_timeout;
++		countdown = proxy_timeout;
+ 		do {
++			countdown -= 1;
+ 			while ((len = read(fds[0], line, sizeof(line)-1)) > 0) {
+ 				line[len] = 0;
+ 				APMD_SYSLOG(LOG_INFO, "+ %s", line);
+@@ -372,16 +373,16 @@ static int call_proxy(apm_event_t event)
+ 				goto proxy_done;
+ 			}
+ 				
+-			sleep(1);
++			while (sleep(1) > 0) ;
+ 		} while (
+-			(time(0) < time_limit)
++			(countdown >= 0)
+ 			|| (proxy_timeout < 0)
+ 		);
+ 
+ 		APMD_SYSLOG(LOG_NOTICE, "Proxy has been running more than %d seconds; killing it", proxy_timeout);
+ 
+ 		kill(pid, SIGTERM);
+-		time_limit = time(0) + 5;
++		countdown = 5;
+ 		do {
+ 			retval = waitpid(pid, &status, WNOHANG);
+ 			if (retval == pid)
+@@ -392,9 +393,9 @@ static int call_proxy(apm_event_t event)
+ 				goto proxy_done;
+ 			}
+ 
+-			sleep(1);
++			while (sleep(1) > 0) ;
+ 
+-		} while (time(0) < time_limit);
++		} while (countdown >= 0);
+ 
+ 		kill(pid, SIGKILL);
+ 		status = __W_EXITCODE(0, SIGKILL);
+-- 
+2.1.4
+
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch b/meta/recipes-bsp/apmd/apmd/libtool.patch
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/libtool.patch
rename to meta/recipes-bsp/apmd/apmd/libtool.patch
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch b/meta/recipes-bsp/apmd/apmd/unlinux.patch
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/unlinux.patch
rename to meta/recipes-bsp/apmd/apmd/unlinux.patch
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
similarity index 92%
rename from meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
rename to meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index 65dd01b..c919463 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool-cross"
 PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/a/apmd/apmd_${PV}.diff.gz;name=patch \
+           file://legacy.patch \
            file://libtool.patch \
            file://unlinux.patch \
            file://init \
@@ -23,9 +23,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "b1e6309e8331e0f4e6efd311c2d97fa8"
 SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5c75a2dbb52332d"
 
-SRC_URI[patch.md5sum] = "57e1b689264ea80f78353519eece0c92"
-SRC_URI[patch.sha256sum] = "7905ff96be93d725544d0040e425c42f9c05580db3c272f11cff75b9aa89d430"
-
 S = "${WORKDIR}/apmd-3.2.2.orig"
 
 inherit update-rc.d systemd
-- 
2.1.4


