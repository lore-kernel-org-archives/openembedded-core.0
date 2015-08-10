Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF24E7688F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745684032"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:20 +0300
Message-Id: <17f1f21601d991e414718a56bdb1952ea522c400.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/8] apmd: update to 3.2.2-15
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
X-List-Received-Date: Mon, 10 Aug 2015 14:22:24 -0000

This basically means replacing a "-14" Debian patch with "-15" patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd.service      |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy        |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy.conf   |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/default           |   0
 meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/init |   0
 meta/recipes-bsp/apmd/apmd/legacy.patch            | 112 +++++++++++++++++++++
 .../apmd/{apmd-3.2.2-14 => apmd}/libtool.patch     |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/unlinux.patch     |   0
 .../apmd/{apmd_3.2.2-14.bb => apmd_3.2.2-15.bb}    |   6 +-
 9 files changed, 114 insertions(+), 4 deletions(-)
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
index 0000000..6db223f
--- /dev/null
+++ b/meta/recipes-bsp/apmd/apmd/legacy.patch
@@ -0,0 +1,112 @@
+Index: apmd-3.2.2/Makefile
+===================================================================
+--- apmd-3.2.2.orig/Makefile
++++ apmd-3.2.2/Makefile
+@@ -43,7 +43,7 @@ DESTDIR=
+ 
+ CC=gcc
+ CFLAGS=-O -g
+-XTRACFLAGS=-Wall -pipe -I. -I/usr/src/linux/include \
++XTRACFLAGS=-Wall -pipe -I. -I/usr/src/linux/include -I/usr/X11R6/include \
+ 		-I/usr/src/linux-2.2/include -I /usr/src/linux-2.0/include \
+ 		-DVERSION=\"$(VERSION)\" \
+ 		-DDEFAULT_PROXY_NAME=\"$(PROXY_DIR)/apmd_proxy\"
+Index: apmd-3.2.2/apm.c
+===================================================================
+--- apmd-3.2.2.orig/apm.c
++++ apmd-3.2.2/apm.c
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
+Index: apmd-3.2.2/apm.h
+===================================================================
+--- apmd-3.2.2.orig/apm.h
++++ apmd-3.2.2/apm.h
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
+Index: apmd-3.2.2/apmd.c
+===================================================================
+--- apmd-3.2.2.orig/apmd.c
++++ apmd-3.2.2/apmd.c
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
index 65dd01b..ab00814 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -10,8 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "libtool-cross"
 PR = "r2"
 
+# legacy.patch taken from ftp://ftp.debian.org/debian/pool/main/a/apmd/apmd_3.2.2-15.debian.tar.xz
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/a/apmd/apmd_${PV}.diff.gz;name=patch \
+           file://legacy.patch \
            file://libtool.patch \
            file://unlinux.patch \
            file://init \
@@ -23,9 +24,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "b1e6309e8331e0f4e6efd311c2d97fa8"
 SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5c75a2dbb52332d"
 
-SRC_URI[patch.md5sum] = "57e1b689264ea80f78353519eece0c92"
-SRC_URI[patch.sha256sum] = "7905ff96be93d725544d0040e425c42f9c05580db3c272f11cff75b9aa89d430"
-
 S = "${WORKDIR}/apmd-3.2.2.orig"
 
 inherit update-rc.d systemd
-- 
2.1.4


