Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RnFnu-0006ZI-Fg
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:38:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 12:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97550604"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 12:30:51 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 12:30:47 -0800
Message-Id: <b8e0859cf0bc609d134ce75fc763ff305549a0c1.1326831402.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
References: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326831402.git.nitin.a.kamble@intel.com>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/5] guile: new recipe for autogen
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 20:38:51 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

guile recipe is needed by autogen.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 +++++++++++++
 ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 ++++++++++
 ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 +++++++++++
 .../guile/files/opensuse/guile-64bit.patch         |   38 +++++++++++++++
 .../files/opensuse/guile-turn-off-gc-test.patch    |   48 ++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.3.bb         |   42 +++++++++++++++++
 6 files changed, 212 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
 create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
 create mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
 create mode 100644 meta/recipes-devtools/guile/guile_2.0.3.bb

diff --git a/meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch b/meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
new file mode 100644
index 0000000..e6df9b9
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [debian patch]
+
+From c53b49c63d7ed145fbaa3dde25063c407631f373 Mon Sep 17 00:00:00 2001
+From: Rob Browning <rlb@defaultvalue.org>
+Date: Sat, 23 Apr 2011 14:57:49 -0500
+Subject: Fix the SRFI 60 copy-bit documentation.
+
+---
+ libguile/srfi-60.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libguile/srfi-60.c b/libguile/srfi-60.c
+index 264f4cb..1ed3c9e 100644
+--- a/libguile/srfi-60.c
++++ b/libguile/srfi-60.c
+@@ -70,7 +70,7 @@ SCM_DEFINE (scm_srfi60_log2_binary_factors, "log2-binary-factors", 1, 0, 0,
+ 
+ 
+ SCM_DEFINE (scm_srfi60_copy_bit, "copy-bit", 3, 0, 0,
+-            (SCM index, SCM n, SCM bit),
++            (SCM index, SCM n, SCM newbit),
+ 	    "Return @var{n} with the bit at @var{index} set according to\n"
+ 	    "@var{newbit}.  @var{newbit} should be @code{#t} to set the bit\n"
+ 	    "to 1, or @code{#f} to set it to 0.  Bits other than at\n"
+@@ -86,7 +86,7 @@ SCM_DEFINE (scm_srfi60_copy_bit, "copy-bit", 3, 0, 0,
+   int bb;
+ 
+   ii = scm_to_ulong (index);
+-  bb = scm_to_bool (bit);
++  bb = scm_to_bool (newbit);
+ 
+   if (SCM_I_INUMP (n))
+     {
diff --git a/meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch b/meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
new file mode 100644
index 0000000..7176c76
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Inappropriate [debian patch]
+
+From 6614b8efc5a8d90a26a2b99308b909ac351b65e5 Mon Sep 17 00:00:00 2001
+From: Rob Browning <rlb@defaultvalue.org>
+Date: Sat, 23 Apr 2011 14:57:50 -0500
+Subject: Define _GNU_SOURCE to fix the GNU/kFreeBSD build.
+
+Author: Petr Salinger <Petr.Salinger@seznam.cz>
+Closes: #401168
+---
+ libguile/fports.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/libguile/fports.c b/libguile/fports.c
+index 1348b8b..3ac3ced 100644
+--- a/libguile/fports.c
++++ b/libguile/fports.c
+@@ -20,6 +20,7 @@
+ 
+ 
+ #define _LARGEFILE64_SOURCE      /* ask for stat64 etc */
++#define _GNU_SOURCE              /* ask for LONG_LONG_MAX/LONG_LONG_MIN */
+ 
+ #ifdef HAVE_CONFIG_H
+ #  include <config.h>
diff --git a/meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch b/meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
new file mode 100644
index 0000000..aa64f58
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [debian patch]
+
+From 0c91fa9270e86b20bfb8e62db5ac84617b2567d9 Mon Sep 17 00:00:00 2001
+From: Rob Browning <rlb@defaultvalue.org>
+Date: Thu, 10 Nov 2011 02:23:04 -0600
+Subject: Include gc.h rather than gc/gc_version.h in pthread test.
+
+See comments in recent gc_version.h.  It should never be included
+directly, and doing so was causing build failures.
+---
+ .../standalone/test-pthread-create-secondary.c     |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/test-suite/standalone/test-pthread-create-secondary.c b/test-suite/standalone/test-pthread-create-secondary.c
+index fe39c2a..d87fb33 100644
+--- a/test-suite/standalone/test-pthread-create-secondary.c
++++ b/test-suite/standalone/test-pthread-create-secondary.c
+@@ -27,7 +27,7 @@
+ #include <stdlib.h>
+ #include <libguile.h>
+ 
+-#include <gc/gc_version.h>
++#include <gc.h>
+ 
+ 
+ /* Up to GC 7.2alpha5, calling `GC_INIT' from a secondary thread would
diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch b/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
new file mode 100644
index 0000000..be3191a
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
@@ -0,0 +1,38 @@
+
+Upstream-Status: Inappropriate [opensuse patch]
+
+Index: guile-2.0.3/libguile/hash.c
+===================================================================
+--- guile-2.0.3.orig/libguile/hash.c	2011-07-06 15:49:59.000000000 -0700
++++ guile-2.0.3/libguile/hash.c	2012-01-13 21:49:43.332844884 -0800
+@@ -270,7 +270,7 @@ scm_hasher(SCM obj, unsigned long n, siz
+ unsigned long
+ scm_ihashq (SCM obj, unsigned long n)
+ {
+-  return (SCM_UNPACK (obj) >> 1) % n;
++  return ((unsigned long) SCM_UNPACK (obj) >> 1) % n;
+ }
+ 
+ 
+@@ -306,7 +306,7 @@ scm_ihashv (SCM obj, unsigned long n)
+   if (SCM_NUMP(obj))
+     return (unsigned long) scm_hasher(obj, n, 10);
+   else
+-    return SCM_UNPACK (obj) % n;
++    return (unsigned long) SCM_UNPACK (obj) % n;
+ }
+ 
+ 
+Index: guile-2.0.3/libguile/struct.c
+===================================================================
+--- guile-2.0.3.orig/libguile/struct.c	2011-07-06 15:50:00.000000000 -0700
++++ guile-2.0.3/libguile/struct.c	2012-01-13 21:49:43.332844884 -0800
+@@ -942,7 +942,7 @@ scm_struct_ihashq (SCM obj, unsigned lon
+ {
+   /* The length of the hash table should be a relative prime it's not
+      necessary to shift down the address.  */
+-  return SCM_UNPACK (obj) % n;
++  return (unsigned long) SCM_UNPACK (obj) % n;
+ }
+ 
+ SCM_DEFINE (scm_struct_vtable_name, "struct-vtable-name", 1, 0, 0, 
diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch b/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
new file mode 100644
index 0000000..ed56694
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
@@ -0,0 +1,48 @@
+
+Upstream-Status: Inappropriate [opensuse patch]
+
+See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10096
+why this test is turned off.
+Index: guile-2.0.3/test-suite/tests/gc.test
+===================================================================
+--- guile-2.0.3.orig/test-suite/tests/gc.test	2011-10-15 09:34:40.000000000 -0700
++++ guile-2.0.3/test-suite/tests/gc.test	2012-01-13 21:52:10.282540355 -0800
+@@ -65,23 +65,23 @@
+       foo)))
+ 
+ 
+-(with-test-prefix "gc"
+-  (pass-if "Unused modules are removed"
+-    (let* ((guard (make-guardian))
+-           (total 1000))
+-
+-      (for-each (lambda (x) (guard (make-module))) (iota total))
++;;(with-test-prefix "gc"
++;;  (pass-if "Unused modules are removed"
++;;    (let* ((guard (make-guardian))
++;;           (total 1000))
++;;
++;;      (for-each (lambda (x) (guard (make-module))) (iota total))
+ 
+       ;; Avoid false references to the modules on the stack.
+-      (stack-cleanup 20)
++;;      (stack-cleanup 20)
+ 
+-      (gc)
+-      (gc) ;; twice: have to kill the weak vectors.
+-      (gc) ;; thrice: because the test doesn't succeed with only
++;;      (gc)
++;;      (gc) ;; twice: have to kill the weak vectors.
++;;      (gc) ;; thrice: because the test doesn't succeed with only
+            ;; one gc round. not sure why.
+ 
+-      (= (let lp ((i 0))
+-           (if (guard)
+-               (lp (1+ i))
+-               i))
+-         total))))
++;;      (= (let lp ((i 0))
++;;           (if (guard)
++;;               (lp (1+ i))
++;;               i))
++;;         total))))
diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.3.bb
new file mode 100644
index 0000000..07aefc7
--- /dev/null
+++ b/meta/recipes-devtools/guile/guile_2.0.3.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Guile is the GNU Ubiquitous Intelligent Language for Extensions."
+DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for Extensions,\
+ the official extension language for the GNU operating system.\
+ Guile is a library designed to help programmers create flexible applications.\
+ Using Guile in an application allows the application's functionality to be\
+ extended by users or other programmers with plug-ins, modules, or scripts.\
+ Guile provides what might be described as "practical software freedom,"\
+ making it possible for users to customize an application to meet their\
+ needs without digging into the application's internals."
+
+HOMEPAGE = "http://www.gnu.org/software/guile/"
+SECTION = "devel"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
+
+SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
+           file://debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch \
+           file://debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch \
+           file://debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch \
+           file://opensuse/guile-64bit.patch \
+           file://opensuse/guile-turn-off-gc-test.patch \
+           "
+
+SRC_URI[md5sum] = "3b8b4e1083037f29d2c4704a6d55f2a8"
+SRC_URI[sha256sum] = "a53b21159befe3e89bbaca71e9e62cf00af0f49fcca297c407944b988d59eb08"
+
+PR = "r0"
+
+inherit autotools gettext
+
+DEPENDS = "libunistring bdwgc gmp"
+BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend() {
+	mkdir -p po
+}
+
+do_install_append_virtclass-native() {
+	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
+}
+
+export GUILE_FOR_BUILD=${BUILD_SYS}-guile
-- 
1.7.6.4



