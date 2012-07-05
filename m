Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnL2-0006Gj-2X
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:24 +0200
Received: by pbbrq2 with SMTP id rq2so12500911pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ctIrvT+5D2M1pk9jCZFEItkBexLRnrFR0NQUOsaAkqU=;
	b=ujS+ktf/9IRA9epEPN0gGyBOIBsrA4h2J0bs0nhZmfO5V5hWtvo6SdZ3vJmtahNShw
	nFFEuqoMJollb+uG0ArXM4w3Ln5YUUFiknRf0PZmzwXe7LWHik5CSeBVLwQKeGAYLt78
	vx+dCZiMJeryG9UwDaWsN8z5DJU1JWbvlRpHi6r+q1SLLOuQR5EeKsUi4w7dx9UgGZWu
	et2qplGVIR68cii2c1OjRnAgcBB8LSgFeN+aJdTQso9/t8UkYjqdV0+ZYcpt7FV0Xwhn
	OkIVu5IV90gfGmRzlb44EOeEksNeMlRlAmytY6o1GaSA1ERX9xOZyVaKV2wQgSerDERa
	aSqg==
Received: by 10.68.132.166 with SMTP id ov6mr29025704pbb.24.1341498978771;
	Thu, 05 Jul 2012 07:36:18 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:33 -0700
Message-Id: <0218f823021f888115dba8e26ef98efa612cbe42.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 14/14] eglibc: Add recipes for 2.16 release
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:24 -0000

Drop the patches that were either applied
or fixed differenly in 2.16

Add patches to fix ppc spe patches to match
eglibc 2.16

Fix CPPFLAGS to contain correct includepaths
so autoconf cache is generated correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.16.bb          |   44 ++
 .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 ++++
 .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
 .../eglibc_fix_findidx_parameters.patch            |   38 ++
 .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
 .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
 .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 ++
 .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
 .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
 .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 ++++++++++++++++++++
 .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 ++++
 .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 +++++
 .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 +++
 .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ++
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
 meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
 meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 ++++++
 18 files changed, 1389 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
new file mode 100644
index 0000000..88c701e
--- /dev/null
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Cross locale generation tool for eglibc"
+HOMEPAGE = "http://www.eglibc.org/home"
+SECTION = "libs"
+LICENSE = "LGPL-2.1"
+
+LIC_DIR = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
+LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9\
+      file://${LIC_DIR}/COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+      file://${LIC_DIR}/posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
+      file://${LIC_DIR}/COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+
+
+inherit native
+inherit autotools
+
+PR = "r0"
+SRCREV="19383"
+EGLIBC_BRANCH="eglibc-2_16"
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
+S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
+
+do_unpack_append() {
+	bb.build.exec_func('do_move_ports', d)
+}
+
+do_move_ports() {
+        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
+	    rm -rf ${WORKDIR}/libc/ports
+	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${WORKDIR}/libc/
+	fi
+}
+
+EXTRA_OECONF = "--with-glibc=${WORKDIR}/${EGLIBC_BRANCH}/libc"
+CFLAGS += "-DNOT_IN_libc=1"
+
+do_configure () {
+	./configure ${EXTRA_OECONF}
+}
+
+
+do_install() {
+	install -d ${D}${bindir} 
+	install -m 0755 ${S}/localedef ${D}${bindir}/cross-localedef
+}
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch b/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
new file mode 100644
index 0000000..b899562
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
@@ -0,0 +1,108 @@
+Its controlled by __OPTION_EGLIBC_RTLD_DEBUG
+so we should use GLRO_dl_debug_mask
+
+Singed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: libc/elf/dl-open.c
+===================================================================
+--- libc.orig/elf/dl-open.c	2012-03-09 08:54:34.691443995 -0800
++++ libc/elf/dl-open.c	2012-03-09 08:55:31.275446730 -0800
+@@ -154,7 +154,7 @@
+ 	  ns->_ns_main_searchlist->r_list[new_nlist++] = map;
+ 
+ 	  /* We modify the global scope.  Report this.  */
+-	  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++	  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+ 	    _dl_debug_printf ("\nadd %s [%lu] to global scope\n",
+ 			      map->l_name, map->l_ns);
+ 	}
+@@ -294,7 +294,7 @@
+   _dl_debug_state ();
+ 
+   /* Print scope information.  */
+-  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+     _dl_show_scope (new, 0);
+ 
+   /* Only do lazy relocation if `LD_BIND_NOW' is not set.  */
+@@ -438,7 +438,7 @@
+ 	}
+ 
+       /* Print scope information.  */
+-      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+ 	_dl_show_scope (imap, from_scope);
+     }
+ 
+Index: libc/ports/sysdeps/mips/dl-lookup.c
+===================================================================
+--- libc.orig/ports/sysdeps/mips/dl-lookup.c	2012-03-09 08:54:34.707443996 -0800
++++ libc/ports/sysdeps/mips/dl-lookup.c	2012-03-09 09:02:36.903467324 -0800
+@@ -111,7 +111,7 @@
+ 	continue;
+ 
+       /* Print some debugging info if wanted.  */
+-      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SYMBOLS, 0))
++      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SYMBOLS, 0))
+ 	_dl_debug_printf ("symbol=%s;  lookup in file=%s [%lu]\n",
+ 			  undef_name,
+ 			  map->l_name[0] ? map->l_name : rtld_progname,
+@@ -432,7 +432,7 @@
+ 		     hash table.  */
+ 		  if (__builtin_expect (tab->size, 0))
+ 		    {
+-		      assert (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK);
++		      assert (GLRO_dl_debug_mask & DL_DEBUG_PRELINK);
+ 		      __rtld_lock_unlock_recursive (tab->lock);
+ 		      goto success;
+ 		    }
+@@ -681,7 +681,7 @@
+ 	}
+ 
+       /* Display information if we are debugging.  */
+-      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_FILES, 0))
++      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_FILES, 0))
+ 	_dl_debug_printf ("\
+ \nfile=%s [%lu];  needed by %s [%lu] (relocation dependency)\n\n",
+ 			  map->l_name[0] ? map->l_name : rtld_progname,
+@@ -860,7 +860,7 @@
+   if (__builtin_expect (current_value.m->l_used == 0, 0))
+     current_value.m->l_used = 1;
+ 
+-  if (__builtin_expect (GLRO(dl_debug_mask)
++  if (__builtin_expect (GLRO_dl_debug_mask
+ 			& (DL_DEBUG_BINDINGS|DL_DEBUG_PRELINK), 0))
+     _dl_debug_bindings (undef_name, undef_map, ref,
+ 			&current_value, version, type_class, protected);
+@@ -925,7 +925,7 @@
+ {
+   const char *reference_name = undef_map->l_name;
+ 
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_BINDINGS)
++  if (GLRO_dl_debug_mask & DL_DEBUG_BINDINGS)
+     {
+       _dl_debug_printf ("binding file %s [%lu] to %s [%lu]: %s symbol `%s'",
+ 			(reference_name[0]
+@@ -941,7 +941,7 @@
+ 	_dl_debug_printf_c ("\n");
+     }
+ #ifdef SHARED
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
++  if (GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
+     {
+       int conflict = 0;
+       struct sym_val val = { NULL, NULL };
+Index: libc/elf/rtld.c
+===================================================================
+--- libc.orig/elf/rtld.c	2012-03-09 09:01:35.159464344 -0800
++++ libc/elf/rtld.c	2012-03-09 09:01:56.247465364 -0800
+@@ -2198,7 +2198,7 @@
+   GLRO(dl_init_all_dirs) = GL(dl_all_dirs);
+ 
+   /* Print scope information.  */
+-  if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES, 0))
++  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_SCOPES, 0))
+     {
+       _dl_debug_printf ("\nInitial object scopes\n");
+ 
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
new file mode 100644
index 0000000..cf58035
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
@@ -0,0 +1,17 @@
+import http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
+
+Upstream-Status: Pending
+
+Index: libc/bits/stdio-lock.h
+===================================================================
+--- libc.orig/bits/stdio-lock.h	2009-10-28 14:34:19.000000000 -0700
++++ libc/bits/stdio-lock.h	2009-10-28 14:34:54.000000000 -0700
+@@ -50,6 +50,8 @@ __libc_lock_define_recursive (typedef, _
+   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp));      \
+   _IO_flockfile (_fp)
+ 
++# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
++
+ # define _IO_release_lock(_fp) \
+   _IO_funlockfile (_fp);						      \
+   _IO_cleanup_region_end (0)
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
new file mode 100644
index 0000000..4313aa5
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
@@ -0,0 +1,21 @@
+In file included from ../nptl/sysdeps/unix/sysv/linux/libc-lowlevellock.c:21:
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c: In function '__lll_lock_wait_private':
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: warning: implicit declaration of function 'THREAD_GETMEM'
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'THREAD_SELF' undeclared (first use in this function)
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: (Each undeclared identifier is reported only once
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: for each function it appears in.)
+../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'header' undeclared (first use in this function)
+make[4]: *** [/var/tmp/portage/sys-libs/glibc-2.7-r1/work/build-default-armv4l-unknown-linux-gnu-nptl/nptl/rtld-libc-lowlevellock.os] Error 1
+
+Upstream-Status: Pending
+
+--- libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h.orig
++++ libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
+@@ -25,6 +25,7 @@
+ #include <atomic.h>
+ #include <sysdep.h>
+ #include <kernel-features.h>
++#include <tls.h>
+ 
+ #define FUTEX_WAIT		0
+ #define FUTEX_WAKE		1
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch b/meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
new file mode 100644
index 0000000..bbf4605
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
@@ -0,0 +1,38 @@
+Upstream-Status: backport
+
+Imported patch from: http://www.eglibc.org/archives/patches/msg01124.html
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/09
+
+Index: libc/posix/xregex.c
+===================================================================
+--- libc.orig/posix/xregex.c
++++ libc/posix/xregex.c
+@@ -2943,7 +2943,7 @@ PREFIX(regex_compile) (const char *ARG_P
+ 				  _NL_CURRENT (LC_COLLATE,
+ 					       _NL_COLLATE_INDIRECTWC);
+ 
+-				idx = findidx ((const wint_t**)&cp);
++				idx = findidx ((const wint_t**)&cp, -1);
+ 				if (idx == 0 || cp < (wint_t*) str + c1)
+ 				  /* This is no valid character.  */
+ 				  FREE_STACK_RETURN (REG_ECOLLATE);
+@@ -3392,7 +3392,7 @@ PREFIX(regex_compile) (const char *ARG_P
+ 			    indirect = (const int32_t *)
+ 			      _NL_CURRENT (LC_COLLATE, _NL_COLLATE_INDIRECTMB);
+ 
+-			    idx = findidx (&cp);
++			    idx = findidx (&cp, -1);
+ 			    if (idx == 0 || cp < str + c1)
+ 			      /* This is no valid character.  */
+ 			      FREE_STACK_RETURN (REG_ECOLLATE);
+@@ -6363,7 +6363,7 @@ byte_re_match_2_internal (struct re_patt
+ 		      }
+ 		    str_buf[i] = TRANSLATE(*(d+i));
+ 		    str_buf[i+1] = '\0'; /* sentinel */
+-		    idx2 = findidx ((const wint_t**)&cp);
++		    idx2 = findidx ((const wint_t**)&cp, -1);
+ 		  }
+ 
+ 		/* Update d, however d will be incremented at
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf b/meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
new file mode 100644
index 0000000..e69de29
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk b/meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
new file mode 100644
index 0000000..d2a28c2
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
@@ -0,0 +1,11 @@
+#!/usr/bin/make
+
+include $(IN)
+
+all:
+	rm -f $(OUT)
+	touch $(OUT)
+	for locale in $(SUPPORTED-LOCALES); do \
+		[ $$locale = true ] && continue; \
+		echo $$locale | sed 's,/, ,' >> $(OUT); \
+	done
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch b/meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
new file mode 100644
index 0000000..be29856
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
@@ -0,0 +1,20 @@
+This is needed since initgroups belongs to NET group
+so when NET is disabled in eglibc build then it reports
+as undefined symbol
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libc/nss/getent.c
+===================================================================
+--- libc.orig/nss/getent.c	2012-03-09 09:41:57.099581559 -0800
++++ libc/nss/getent.c	2012-03-09 09:42:13.095582334 -0800
+@@ -898,7 +898,7 @@
+ D(group)
+ D(gshadow)
+ DN(hosts)
+-D(initgroups)
++DN(initgroups)
+ DN(netgroup)
+ DN(networks)
+ D(passwd)
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
new file mode 100644
index 0000000..40ae6d3
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+The default lib search path order is:
+
+  1) LD_LIBRARY_PATH
+  2) RPATH from the binary
+  3) ld.so.cache
+  4) default search paths embedded in the linker
+
+For nativesdk binaries which are being used alongside binaries on a host system, we 
+need the search paths to firstly search the shipped nativesdk libs but then also
+cover the host system. For example we want the host system's libGL and this may be
+in a non-standard location like /usr/lib/mesa. The only place the location is know 
+about is in the ld.so.cache of the host system.
+
+Since nativesdk has a simple structure and doesn't need to use a cache itself, we 
+repurpose the cache for use as a last resort in finding host system binaries. This 
+means we need to switch the order of 3 and 4 above to make this work effectively.
+
+RP 14/10/2010
+
+Index: libc/elf/dl-load.c
+===================================================================
+--- libc.orig/elf/dl-load.c
++++ libc/elf/dl-load.c
+@@ -2107,6 +2107,15 @@ _dl_map_object (struct link_map *loader,
+ 			&loader->l_runpath_dirs, &realname, &fb, loader,
+ 			LA_SER_RUNPATH, &found_other_class);
+ 
++      /* try the default path.  */
++      if (fd == -1
++	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
++	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
++	  && rtld_search_dirs.dirs != (void *) -1)
++	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
++			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
++
++      /* Finally try ld.so.cache */
+       if (fd == -1
+ 	  && (__builtin_expect (! (mode & __RTLD_SECURE), 1)
+ 	      || ! INTUSE(__libc_enable_secure)))
+@@ -2169,14 +2178,6 @@ _dl_map_object (struct link_map *loader,
+ 	    }
+ 	}
+ 
+-      /* Finally, try the default path.  */
+-      if (fd == -1
+-	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
+-	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
+-	  && rtld_search_dirs.dirs != (void *) -1)
+-	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
+-			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
+-
+       /* Add another newline when we are tracing the library loading.  */
+       if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0))
+ 	_dl_debug_printf ("\n");
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
new file mode 100644
index 0000000..9b646fe
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
@@ -0,0 +1,26 @@
+
+On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
+section if a --version-script sets _RLD_MAP to local. This is apparently
+a binutils bug, but libc shouldn't segfault in this case.
+
+see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
+
+Upstream-Status: Pending
+
+9/19/2010 - added by Qing He <qing.he@intel.com>
+
+
+---
+diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/ports/sysdeps/mips/dl-machine.h
+--- glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h	2009-05-16 16:36:20.000000000 +0800
++++ glibc-2.10.1/ports/sysdeps/mips/dl-machine.h	2010-09-19 09:11:53.000000000 +0800
+@@ -70,7 +70,8 @@
+ /* If there is a DT_MIPS_RLD_MAP entry in the dynamic section, fill it in
+    with the run-time address of the r_debug structure  */
+ #define ELF_MACHINE_DEBUG_SETUP(l,r) \
+-do { if ((l)->l_info[DT_MIPS (RLD_MAP)]) \
++do { if ((l)->l_info[DT_MIPS (RLD_MAP)] && \
++         (l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) \
+        *(ElfW(Addr) *)((l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) = \
+        (ElfW(Addr)) (r); \
+    } while (0)
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
new file mode 100644
index 0000000..1542b1b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Replace the OECORE_KNOWN_INTERPRETER_NAMES with the value of 
+variable EGLIBC_KNOWN_INTERPRETER_NAMES.
+
+Lianhao Lu, 08/01/2011
+
+--- libc/elf/readlib.c.orig	2011-08-12 17:05:51.864470837 +0800
++++ libc/elf/readlib.c	2011-08-12 17:06:39.346942074 +0800
+@@ -52,6 +52,7 @@
+ #ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
+   SYSDEP_KNOWN_INTERPRETER_NAMES
+ #endif
++  OECORE_KNOWN_INTERPRETER_NAMES
+ };
+ 
+ static struct known_names known_libs[] =
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
new file mode 100644
index 0000000..203040c
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
@@ -0,0 +1,538 @@
+Upstream-Status: Pending
+
+2011-03-22  Joseph Myers  <joseph@codesourcery.com>
+
+        Merge from SG++ 2.11:
+
+        2010-10-05  Nathan Froyd  <froydnj@codesourcery.com>
+
+        Issue #9382
+
+        * sysdeps/powerpc/powerpc32/603e/: New directory.
+        * sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/: New directory.
+        * sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/: New directory.
+        * sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/: New directory.
+        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Update.
+        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Update.
+        * sysdeps/powerpc/powerpc64/e5500/fpu/Implies: New file.
+
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+@@ -0,0 +1,134 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float two108 = 3.245185536584267269e+32;
++static const float twom54 = 5.551115123125782702e-17;
++static const float half = 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++#ifdef __STDC__
++double
++__ieee754_sqrt (double b)
++#else
++double
++__ieee754_sqrt (b)
++     double b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          u.value = b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=f" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  GCC
++             insists on sinking them below the branch, however; it seems like
++             they'd be better before the branch so that we can cover any latency
++             from storing the argument and loading its high word.  Oh well.  */
++
++          g = b * y;
++          h = 0.5 * y;
++  
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
++            return __ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++          __r;})
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          r = FNMSUB (g, h, half);
++          g = FMADD (g, r, g);
++          h = FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
++
++          /* Final refinement.  */
++          d = FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_wash (b);
++}
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+@@ -0,0 +1,101 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
++static const float threehalf = 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++#ifdef __STDC__
++float
++__ieee754_sqrtf (float b)
++#else
++float
++__ieee754_sqrtf (b)
++     float b;
++#endif
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
++        __r;})
++
++      if (__builtin_expect (b != a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe = fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
++          y = FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
++
++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++          x = x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u = { .fenv = fegetenv_register () };
++      if ((u.l[1] & FE_INVALID) == 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b = a_nan.value;
++    }
++  return f_washf (b);
++}
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
+@@ -0,0 +1 @@
++powerpc/powerpc32/603e/fpu
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
+@@ -0,0 +1 @@
++powerpc/powerpc32/603e/fpu
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
+@@ -0,0 +1 @@
++powerpc/powerpc32/603e/fpu
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
+@@ -0,0 +1 @@
++powerpc/powerpc64/e5500/fpu
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
+@@ -0,0 +1 @@
++powerpc/powerpc32/603e/fpu
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch b/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
new file mode 100644
index 0000000..5289051
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
@@ -0,0 +1,112 @@
+on ppc fixes the errors like below
+| ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
+| collect2: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+ChangeLog
+
+2012-01-06  Khem Raj  <raj.khem@gmail.com>
+
+	* sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Add __*_finite alias.
+	Remove cruft.
+	* sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Ditto.
+	* sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c: Ditto.
+	* sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c: Ditto.
+ 
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-01-06 18:07:42.296909187 -0800
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-01-06 18:09:22.572914856 -0800
+@@ -39,14 +39,8 @@
+    We find the actual square root and half of its reciprocal
+    simultaneously.  */
+ 
+-#ifdef __STDC__
+ double
+ __ieee754_sqrt (double b)
+-#else
+-double
+-__ieee754_sqrt (b)
+-     double b;
+-#endif
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -132,3 +126,4 @@
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-01-06 18:10:37.068917644 -0800
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-01-06 18:11:33.408920635 -0800
+@@ -37,14 +37,8 @@
+    We find the reciprocal square root and use that to compute the actual
+    square root.  */
+ 
+-#ifdef __STDC__
+ float
+ __ieee754_sqrtf (float b)
+-#else
+-float
+-__ieee754_sqrtf (b)
+-     float b;
+-#endif
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -99,3 +93,4 @@
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-01-06 18:11:51.460925644 -0800
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-01-06 18:12:39.344924405 -0800
+@@ -39,14 +39,8 @@
+    We find the actual square root and half of its reciprocal
+    simultaneously.  */
+ 
+-#ifdef __STDC__
+ double
+ __ieee754_sqrt (double b)
+-#else
+-double
+-__ieee754_sqrt (b)
+-     double b;
+-#endif
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -132,3 +126,4 @@
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-01-06 18:13:00.892924586 -0800
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-01-06 18:15:27.992931106 -0800
+@@ -37,14 +37,8 @@
+    We find the reciprocal square root and use that to compute the actual
+    square root.  */
+ 
+-#ifdef __STDC__
+ float
+ __ieee754_sqrtf (float b)
+-#else
+-float
+-__ieee754_sqrtf (b)
+-     float b;
+-#endif
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -99,3 +93,4 @@
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
new file mode 100644
index 0000000..9a932ff
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
@@ -0,0 +1,123 @@
+ __ieee754_sqrt{,f} are now inline functions and call out __slow versions
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-07-03 22:36:01.172386436 -0700
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-07-03 23:04:37.396469515 -0700
+@@ -40,7 +40,7 @@
+    simultaneously.  */
+ 
+ double
+-__ieee754_sqrt (double b)
++__slow_ieee754_sqrt (double b)
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -77,7 +77,7 @@
+   
+           /* Handle small numbers by scaling.  */
+           if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
+-            return __ieee754_sqrt (b * two108) * twom54;
++            return __slow_ieee754_sqrt (b * two108) * twom54;
+ 
+ #define FMADD(a_, c_, b_)                                               \
+           ({ double __r;                                                \
+@@ -126,4 +126,12 @@
+     }
+   return f_wash (b);
+ }
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++   return __slow_ieee754_sqrt (x);
++}
++
+ strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-07-03 22:36:01.172386436 -0700
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-07-03 23:07:06.260476775 -0700
+@@ -38,7 +38,7 @@
+    square root.  */
+ 
+ float
+-__ieee754_sqrtf (float b)
++__slow_ieee754_sqrtf (float b)
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -93,4 +93,10 @@
+     }
+   return f_washf (b);
+ }
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
+ strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-07-03 22:36:01.176386435 -0700
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-07-03 23:14:16.328497458 -0700
+@@ -40,7 +40,7 @@
+    simultaneously.  */
+ 
+ double
+-__ieee754_sqrt (double b)
++__slow_ieee754_sqrt (double b)
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -77,7 +77,7 @@
+   
+           /* Handle small numbers by scaling.  */
+           if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
+-            return __ieee754_sqrt (b * two108) * twom54;
++            return __slow_ieee754_sqrt (b * two108) * twom54;
+ 
+ #define FMADD(a_, c_, b_)                                               \
+           ({ double __r;                                                \
+@@ -126,4 +126,12 @@
+     }
+   return f_wash (b);
+ }
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++  return __slow_ieee754_sqrt (x);
++}
++
+ strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-07-03 22:36:01.176386435 -0700
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-07-03 23:13:52.732496373 -0700
+@@ -38,7 +38,7 @@
+    square root.  */
+ 
+ float
+-__ieee754_sqrtf (float b)
++__slow_ieee754_sqrtf (float b)
+ {
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -93,4 +93,10 @@
+     }
+   return f_washf (b);
+ }
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
+ strong_alias (__ieee754_sqrtf, __sqrtf_finite)
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch b/meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
new file mode 100644
index 0000000..130a816
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
@@ -0,0 +1,63 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+From libc-alpha-return-31199-listarch-libc-alpha=sources dot redhat dot com at sourceware dot org Tue Jul 03 19:54:27 2012
+Return-Path: <libc-alpha-return-31199-listarch-libc-alpha=sources dot redhat dot com at sourceware dot org>
+Delivered-To: listarch-libc-alpha at sources dot redhat dot com
+Received: (qmail 20151 invoked by alias); 3 Jul 2012 19:54:25 -0000
+Received: (qmail 20139 invoked by uid 22791); 3 Jul 2012 19:54:23 -0000
+X-SWARE-Spam-Status: No, hits=-4.8 required=5.0
+	tests=AWL,BAYES_00,KHOP_RCVD_UNTRUST,RCVD_IN_DNSWL_HI,RCVD_IN_HOSTKARMA_W,T_RP_MATCHES_RCVD
+X-Spam-Check-By: sourceware.org
+From: Mike Frysinger <vapier at gentoo dot org>
+To: libc-alpha at sourceware dot org
+Subject: [PATCH] sunrpc: fix rpc bootstrap builds
+Date: Tue,  3 Jul 2012 15:54:11 -0400
+Message-Id: <1341345251-31730-1-git-send-email-vapier@gentoo.org>
+Mailing-List: contact libc-alpha-help at sourceware dot org; run by ezmlm
+Precedence: bulk
+List-Id: <libc-alpha.sourceware.org>
+List-Subscribe: <mailto:libc-alpha-subscribe at sourceware dot org>
+List-Archive: <http://sourceware.org/ml/libc-alpha/>
+List-Post: <mailto:libc-alpha at sourceware dot org>
+List-Help: <mailto:libc-alpha-help at sourceware dot org>, <http://sourceware dot org/ml/#faqs>
+Sender: libc-alpha-owner at sourceware dot org
+Delivered-To: mailing list libc-alpha at sourceware dot org
+
+If you build & install glibc w/rpc disabled, you no longer have headers in
+/usr/include/rpc/ (this is expected).  But if you try to build glibc w/rpc
+enabled, this gets into a bad state due to the new rpc helpers that get
+cross-compiled:
+
+$ make
+...
+x86_64-pc-linux-gnu-gcc -m32   -D_RPC_THREAD_SAFE_ -D_GNU_SOURCE -DIS_IN_build \
+	-include $objdir/config.h rpc_clntout.c -o $objdir/sunrpc/cross-rpc_clntout.o \
+	-MMD -MP -MF $objdir/sunrpc/cross-rpc_clntout.o.dt -MT $objdir/sunrpc/cross-rpc_clntout.o -c
+rpc_clntout.c:34:23: fatal error: rpc/types.h: No such file or directory
+compilation terminated.
+make: *** [$objdir/sunrpc/cross-rpc_clntout.o] Error 1
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+
+2012-07-03  Mike Frysinger  <vapier@gentoo.org>
+
+	* sunrpc/rpc_clntout.c: Change <rpc/types.h> to "rpc/types.h".
+---
+ sunrpc/rpc_clntout.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libc/sunrpc/rpc_clntout.c
+===================================================================
+--- libc.orig/sunrpc/rpc_clntout.c	2012-07-04 16:09:16.000000000 -0700
++++ libc/sunrpc/rpc_clntout.c	2012-07-04 18:04:34.498085075 -0700
+@@ -31,7 +31,7 @@
+  */
+ #include <stdio.h>
+ #include <string.h>
+-#include <rpc/types.h>
++#include "rpc/types.h"
+ #include "rpc_parse.h"
+ #include "rpc_util.h"
+ #include "proto.h"
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch b/meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
new file mode 100644
index 0000000..7f82253
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
@@ -0,0 +1,42 @@
+build system of glibc currently adds the cxx headers path by detecting
+it using provided CXX and expects that they are installed w.r.t to standard
+installation location but in OE we install and use cxx headers from target
+sysroot therefore that code needs to be adapted for OE
+
+Upstream-Status: Inappropriate [OE-specific]
+
+-Khem
+
+
+--- a/configure.in
++++ b/configure.in
+@@ -1094,11 +1094,10 @@ if test -n "$sysheaders"; then
+ -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
+   if test -n "$CXX"; then
+     CXX_SYSINCLUDES=
+-    cxxversion=`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD` &&
+     cxxmachine=`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD` &&
+     for d in include "$cxxmachine/include"; do
+-      i=../../../../$d/c++/$cxxversion
+-      cxxheaders=`$CXX -print-file-name="$i"` &&
++      i="$prefix/$d/c++"
++      cxxheaders=`$CXX -print-sysroot`"$i" &&
+       test "x$cxxheaders" != x && test "x$i" != "x$cxxheaders" &&
+       CXX_SYSINCLUDES="$CXX_SYSINCLUDES -isystem $cxxheaders \
+ -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
+--- a/configure
++++ b/configure
+@@ -5618,11 +5618,10 @@ if test -n "$sysheaders"; then
+ -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
+   if test -n "$CXX"; then
+     CXX_SYSINCLUDES=
+-    cxxversion=`$CXX -dumpversion 2>&5` &&
+     cxxmachine=`$CXX -dumpmachine 2>&5` &&
+     for d in include "$cxxmachine/include"; do
+-      i=../../../../$d/c++/$cxxversion
+-      cxxheaders=`$CXX -print-file-name="$i"` &&
++      i="$prefix/$d/c++"
++      cxxheaders=`$CXX -print-sysroot`"$i" &&
+       test "x$cxxheaders" != x && test "x$i" != "x$cxxheaders" &&
+       CXX_SYSINCLUDES="$CXX_SYSINCLUDES -isystem $cxxheaders \
+ -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
new file mode 100644
index 0000000..787c762
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
@@ -0,0 +1,6 @@
+require eglibc_${PV}.bb
+require eglibc-initial.inc
+
+do_configure_prepend () {
+        unset CFLAGS
+}
diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.16.bb b/meta/recipes-core/eglibc/eglibc-locale_2.16.bb
new file mode 100644
index 0000000..ce6c1d2
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-locale_2.16.bb
@@ -0,0 +1 @@
+require eglibc-locale.inc
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
new file mode 100644
index 0000000..c005889
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -0,0 +1,146 @@
+require eglibc.inc
+
+SRCREV = "19383"
+
+DEPENDS += "gperf-native"
+PR = "r0"
+PR_append = "+svnr${SRCPV}"
+
+EGLIBC_BRANCH="eglibc-2_16"
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
+           file://eglibc-svn-arm-lowlevellock-include-tls.patch \
+           file://IO-acquire-lock-fix.patch \
+           file://mips-rld-map-check.patch \
+           file://etc/ld.so.conf \
+           file://generate-supported.mk \
+           file://ppc-sqrt.patch \
+           file://multilib_readlib.patch \
+           file://use-sysroot-cxx-headers.patch \
+           file://ppc-sqrt_finite.patch \
+           file://GLRO_dl_debug_mask.patch \
+           file://initgroups_keys.patch \
+           file://eglibc_fix_findidx_parameters.patch \
+           file://ppc_slow_ieee754_sqrt.patch \
+           file://rpc-bootstrap.patch \
+          "
+LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
+      file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
+      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+
+SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
+S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
+B = "${WORKDIR}/build-${TARGET_SYS}"
+
+PACKAGES_DYNAMIC = "libc6*"
+RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
+PROVIDES_${PN}-dbg = "glibc-dbg"
+
+# the -isystem in bitbake.conf screws up glibc do_stage
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
+
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+
+#
+# For now, we will skip building of a gcc package if it is a uclibc one
+# and our build is not a uclibc one, and we skip a glibc one if our build
+# is a uclibc build.
+#
+# See the note in gcc/gcc_3.4.0.oe
+#
+
+python __anonymous () {
+    import bb, re
+    uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None)
+    if uc_os:
+        raise bb.parse.SkipPackage("incompatible with target %s" %
+                                   d.getVar('TARGET_OS', True))
+}
+
+export libc_cv_slibdir = "${base_libdir}"
+
+EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
+                --without-cvs --disable-profile \
+                --disable-debug --without-gd \
+                --enable-clocale=gnu \
+                --enable-add-ons \
+                --with-headers=${STAGING_INCDIR} \
+                --without-selinux \
+                --enable-obsolete-rpc \
+                ${GLIBC_EXTRA_OECONF}"
+
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
+
+do_unpack_append() {
+	bb.build.exec_func('do_move_ports', d)
+}
+
+do_move_ports() {
+        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
+	    rm -rf ${S}/ports
+	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
+	fi
+}
+
+do_patch_append() {
+	bb.build.exec_func('do_fix_readlib_c', d)
+}
+
+# for mips eglibc now builds syscall tables for all abi's
+# so we make sure that we choose right march option which is
+# compatible with o32,n32 and n64 abi's
+# e.g. -march=mips32 is not compatible with n32 and n64 therefore
+# we filter it out in such case -march=from-abi which will be
+# mips1 when using o32 and mips3 when using n32/n64
+
+TUNE_CCARGS_mips := "${@oe_filter_out('-march=mips32', '${TUNE_CCARGS}', d)}"
+TUNE_CCARGS_mipsel := "${@oe_filter_out('-march=mips32', '${TUNE_CCARGS}', d)}"
+
+do_fix_readlib_c () {
+	sed -i -e 's#OECORE_KNOWN_INTERPRETER_NAMES#${EGLIBC_KNOWN_INTERPRETER_NAMES}#' ${S}/elf/readlib.c
+}
+
+do_configure () {
+# override this function to avoid the autoconf/automake/aclocal/autoheader
+# calls for now
+# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
+# version check and doesn't really help with anything
+        if [ -z "`which rpcgen`" ]; then
+                echo "rpcgen not found.  Install glibc-devel."
+                exit 1
+        fi
+        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+        find ${S} -name "configure" | xargs touch
+        CPPFLAGS="" oe_runconf
+}
+
+rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
+	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
+	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
+
+do_compile () {
+	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
+	unset LDFLAGS
+	base_do_compile
+	(
+		cd ${S}/sunrpc/rpcsvc
+		for r in ${rpcsvc}; do
+			h=`echo $r|sed -e's,\.x$,.h,'`
+			rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
+		done
+	)
+	echo "Adjust ldd script"
+	if [ -n "${RTLDLIST}" ]
+	then
+		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
+		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
+	fi
+
+}
+
+require eglibc-package.inc
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5



