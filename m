Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49DDF6065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:01:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4U91eLP006577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 02:01:40 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 02:01:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 17:01:32 +0800
Message-ID: <96dd5c44787436021c817a84f6f4ada84a94fc27.1369820334.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369820334.git.hongxu.jia@windriver.com>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] fuse: import recipe from meta-oe
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
X-List-Received-Date: Thu, 30 May 2013 09:01:39 -0000
Content-Type: text/plain

add version 2.9.2

This recipes is required by ntfs-3g-ntfsprogs and exfat.

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch |   20 +++++++
 .../fuse/fuse-2.9.2/gold-unversioned-symbol.patch  |   60 ++++++++++++++++++++
 meta/recipes-support/fuse/fuse_2.9.2.bb            |   38 +++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch
 create mode 100644 meta/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
 create mode 100644 meta/recipes-support/fuse/fuse_2.9.2.bb

diff --git a/meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch b/meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch
new file mode 100644
index 0000000..180f544
--- /dev/null
+++ b/meta/recipes-support/fuse/fuse-2.9.2/aarch64.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Submitted
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+
+--- a/include/fuse_kernel.h
++++ b/include/fuse_kernel.h
+@@ -88,12 +88,7 @@
+ #ifndef _LINUX_FUSE_H
+ #define _LINUX_FUSE_H
+ 
+-#include <sys/types.h>
+-#define __u64 uint64_t
+-#define __s64 int64_t
+-#define __u32 uint32_t
+-#define __s32 int32_t
+-#define __u16 uint16_t
++#include <linux/types.h>
+ 
+ /*
+  * Version negotiation:
diff --git a/meta/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch b/meta/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
new file mode 100644
index 0000000..8ee97df
--- /dev/null
+++ b/meta/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
@@ -0,0 +1,60 @@
+Index: fuse-2.8.6/lib/fuse.c
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse.c	2011-10-19 09:20:27.537099939 -0700
+@@ -3947,11 +3947,11 @@
+ 				      11);
+ }
+ 
+-FUSE_SYMVER(".symver fuse_exited,__fuse_exited@");
+-FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@");
+-FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@");
+-FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@");
+-FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@");
++FUSE_SYMVER(".symver fuse_exited,__fuse_exited@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_new_compat22,fuse_new@FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
+Index: fuse-2.8.6/lib/fuse_mt.c
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse_mt.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse_mt.c	2011-10-19 09:20:27.537099939 -0700
+@@ -113,4 +113,4 @@
+ 	return fuse_session_loop_mt(fuse_get_session(f));
+ }
+ 
+-FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@");
++FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@FUSE_UNVERSIONED");
+Index: fuse-2.8.6/lib/fuse_versionscript
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse_versionscript	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse_versionscript	2011-10-19 09:20:27.541099939 -0700
+@@ -1,3 +1,6 @@
++FUSE_UNVERSIONED {
++};
++
+ FUSE_2.2 {
+ 	global:
+ 		fuse_destroy;
+Index: fuse-2.8.6/lib/helper.c
+===================================================================
+--- fuse-2.8.6.orig/lib/helper.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/helper.c	2011-10-19 09:20:27.541099939 -0700
+@@ -409,10 +409,10 @@
+ 	return fuse_mount_compat22(mountpoint, NULL);
+ }
+ 
+-FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@");
++FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_setup_compat22,fuse_setup@FUSE_2.2");
+-FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@");
+-FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@");
++FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_main_real_compat22,fuse_main_real@FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
diff --git a/meta/recipes-support/fuse/fuse_2.9.2.bb b/meta/recipes-support/fuse/fuse_2.9.2.bb
new file mode 100644
index 0000000..5d7cdfd
--- /dev/null
+++ b/meta/recipes-support/fuse/fuse_2.9.2.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+HOMEPAGE = "http://fuse.sf.net"
+SECTION = "libs"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
+           file://gold-unversioned-symbol.patch \
+           file://aarch64.patch \
+"
+SRC_URI[md5sum] = "7d80d0dc9cc2b9199a0c53787c151205"
+SRC_URI[sha256sum] = "81a728fb3f87da33063068735e2fb7e2cd89df207d32687d3d3278385279cefc"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-kernel-module"
+
+PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
+
+RRECOMMENDS_${PN} = "kernel-module-fuse"
+
+FILES_${PN} += "${libdir}/libfuse.so.*"
+FILES_${PN}-dev += "${libdir}/libfuse*.la"
+
+FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
+FILES_libulockmgr-dev += "${libdir}/libulock*.la"
+FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
+
+# Forbid auto-renaming to libfuse-utils
+FILES_fuse-utils = "${bindir} ${base_sbindir}"
+FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
+DEBIAN_NOAUTONAME_fuse-utils = "1"
+DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
+
+do_install_append() {
+    rm -rf ${D}${base_prefix}/dev
+}
-- 
1.7.10.4


