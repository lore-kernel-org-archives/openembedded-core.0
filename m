Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC1FB7F33A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:14 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so392990wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rvEOj8t+TPq29KK1HHgfUNo5tTboyY26+qXP3GWXelE=;
	b=DJ49m7BdGd5o3a4N1XfjPNX/NIBuM3hLZHAyLreahbMqgPQeBUIocbdTLmNhr5SP6M
	xiI3Blpve6DNF+ByT2ceG+mJc/4EKQgZkuKLmSVWiH4R5qfsMr/zDy6OcL9Fzm74vtmA
	LKoD/rTeOb6dd5vz9FHe628b09G/8frrdIRV4PYJ0qrk7CwUGSiSWaIwGUFWQT9+67kR
	D0G9+F1ehXLshoYEKkVaSjKUin3ctM47KbuuJTEnHfoNmrqmqn6/u0CTFPo0+Xi7PEoa
	ZKE2M70UEdVG/Jtu7XjRO6cG2zcAzxoyivryCgGa1FXqVYqn7ADyFKQ1WyGNMawhfWvX
	MZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rvEOj8t+TPq29KK1HHgfUNo5tTboyY26+qXP3GWXelE=;
	b=etG5RRWkO9+wA0hXAXW8HsImY73EFgyaf1ogWEyrE13W0Y5sM0tO30ZNXIwA4tQ7Jg
	fm/4eQ4bnboPGRWeHfGW6Y/F3cpPiptJ+dheTT4W0oqw/44BKtBdBiuXub6msm1h54y0
	G1AXwZ4yUUzESgAFndDBOtPlA4Jox8YsmBfKiTRymbHB8EinAGqWW3+ykMSqThWQ+Vot
	O+9eBFP4S4xAHElvMMe4DV4hcUoCwp+ccijPefI8DhA62AC6fxYxyTohLSUwXis8TLAj
	uzXasxAWxDtvufj7Sdq5qZvz065se+RSjLb+1+WLcwdOCS7bs/vf2YXOc/Qo0lmyiVMV
	n7MA==
X-Gm-Message-State: APjAAAXvD6WuSJEv/8TmkLVG1QpFX4VtqGEiMU6L9955cF36ZE/JJoeW
	wOHFLC+AEUUGglZfK4y3q0ZE/2sa
X-Google-Smtp-Source: APXvYqxz+lW8nFf5iS4+WkFzRsU63xkz1pqj1n94dv42vF8E7kspxwXY+hb1ImtPu4Wfk09c37LSSg==
X-Received: by 2002:a1c:a512:: with SMTP id o18mr28632976wme.4.1575309315256; 
	Mon, 02 Dec 2019 09:55:15 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:52 +0100
Message-Id: <20191202175459.112655-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/18] libffi: update to 3.3 final
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:15 -0000

Add a couple patches to address ppc(64) build failures.

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-Address-platforms-with-no-__int128.patch | 27 +++++++++++++
 ...-missed-ifndef-for-__mips_soft_float.patch |  8 +---
 ...uild-failure-on-power7-and-older-532.patch | 38 +++++++++++++++++++
 .../libffi/libffi/not-win32.patch             | 15 +++++++-
 .../{libffi_3.3~rc0.bb => libffi_3.3.bb}      | 13 +++----
 5 files changed, 86 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch
 create mode 100644 meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch
 rename meta/recipes-support/libffi/{libffi_3.3~rc0.bb => libffi_3.3.bb} (75%)

diff --git a/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch b/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch
new file mode 100644
index 00000000000..2e32a502962
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch
@@ -0,0 +1,27 @@
+From 68f45b9049dffb54f5a29a3a495ab3dfcf010634 Mon Sep 17 00:00:00 2001
+From: Anthony Green <green@moxielogic.com>
+Date: Fri, 29 Nov 2019 07:00:35 -0500
+Subject: [PATCH] Address platforms with no __int128.
+
+Upstream-Status: Backport [https://github.com/libffi/libffi/commit/6663047f56c2932a6b10a790f4ac6666dd181326]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/powerpc/ffi_linux64.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/powerpc/ffi_linux64.c b/src/powerpc/ffi_linux64.c
+index de0d033..7364770 100644
+--- a/src/powerpc/ffi_linux64.c
++++ b/src/powerpc/ffi_linux64.c
+@@ -547,9 +547,9 @@ ffi_prep_args64 (extended_cif *ecif, unsigned long *const stack)
+               if (next_arg.ul == gpr_end.ul)
+                 next_arg.ul = rest.ul;
+               if (vecarg_count < NUM_VEC_ARG_REGISTERS64 && i < nfixedargs)
+-                *vec_base.f128++ = **p_argv.f128;
++		memcpy (vec_base.f128++, *p_argv.f128, sizeof (float128));
+               else
+-                *next_arg.f128 = **p_argv.f128;
++		memcpy (next_arg.f128, *p_argv.f128, sizeof (float128));
+               if (++next_arg.f128 == gpr_end.f128)
+                 next_arg.f128 = rest.f128;
+               vecarg_count++;
diff --git a/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch b/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
index 00a30a35545..397194bc930 100644
--- a/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
+++ b/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
@@ -1,12 +1,11 @@
-From 4149a7627a998731cc246d3f58a36808745d04c8 Mon Sep 17 00:00:00 2001
+From 14e2e74682db3bfcf057688f738fdd842a02ff2d Mon Sep 17 00:00:00 2001
 From: Carl Hurd <carl@Carls-MacBook-Pro.local>
 Date: Wed, 18 Jul 2018 09:04:32 -0400
 Subject: [PATCH] Fixed missed #ifndef for __mips_soft_float
 
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
 Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/442]
-
+---
  src/mips/o32.S | 2 ++
  1 file changed, 2 insertions(+)
 
@@ -26,6 +25,3 @@ index 44e74cb..799139b 100644
  1:
  	# prepare arguments for ffi_closure_mips_inner_O32
  	REG_L	a0, 4($15)	 # cif 
--- 
-2.21.0
-
diff --git a/meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch b/meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch
new file mode 100644
index 00000000000..8a7aea4311a
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch
@@ -0,0 +1,38 @@
+From 4dc6cc961300b9deffb648b1237390a5bea1c6d6 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Thu, 28 Nov 2019 12:42:41 +0000
+Subject: [PATCH] powerpc: fix build failure on power7 and older (#532)
+
+Build failure looks as:
+```
+libtool: compile:  powerpc-unknown-linux-gnu-gcc \
+    -O2 -mcpu=powerpc -mtune=powerpc -pipe ... -c src/powerpc/ffi.c ...
+In file included from src/powerpc/ffi.c:33:
+src/powerpc/ffi_powerpc.h:65:9: error: '__int128' is not supported on this target
+   65 | typedef __int128 float128;
+      |         ^~~~~~~~
+```
+
+The fix avoids using __int128 in favour of aligned char[16].
+
+Closes: https://github.com/libffi/libffi/issues/531
+Upstream-Status: Backport [https://github.com/libffi/libffi/commit/01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd]
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/powerpc/ffi_powerpc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
+index 5ee2a70..8e2f2f0 100644
+--- a/src/powerpc/ffi_powerpc.h
++++ b/src/powerpc/ffi_powerpc.h
+@@ -62,7 +62,7 @@ typedef _Float128 float128;
+ #elif defined(__FLOAT128__)
+ typedef __float128 float128;
+ #else
+-typedef __int128 float128;
++typedef char float128[16] __attribute__((aligned(16)));
+ #endif
+ 
+ void FFI_HIDDEN ffi_closure_SYSV (void);
diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 86a7fc9e405..62daaf4b389 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,3 +1,8 @@
+From 306719369a0d3608b4ff2737de74ae284788a14b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 4 Feb 2016 16:22:50 +0000
+Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
+
 libffi's configure assumes that cross-compiled builds are complicated and
 introduces convoluted path manipulation involving gcc search paths to the
 install paths, resulting in paths like -L/usr/lib/../lib/ appearing in
@@ -11,9 +16,15 @@ As this block is generally pointless, disable it.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b764368..d51ce91 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -350,7 +350,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -354,7 +354,7 @@ AC_ARG_ENABLE(multi-os-directory,
                            
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
@@ -21,4 +32,4 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 +if false; then
    if test -n "$with_cross_host" &&
       test x"$with_cross_host" != x"no"; then
-     toolexecdir="${exec_prefix}"/'$(target_alias)'
+     toolexecdir='${exec_prefix}'/'$(target_alias)'
diff --git a/meta/recipes-support/libffi/libffi_3.3~rc0.bb b/meta/recipes-support/libffi/libffi_3.3.bb
similarity index 75%
rename from meta/recipes-support/libffi/libffi_3.3~rc0.bb
rename to meta/recipes-support/libffi/libffi_3.3.bb
index 8acb699d4ab..f57d03d2f5e 100644
--- a/meta/recipes-support/libffi/libffi_3.3~rc0.bb
+++ b/meta/recipes-support/libffi/libffi_3.3.bb
@@ -8,24 +8,23 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=492385fe22195952f5b9b197868ba268"
 
-SRC_URI = "https://github.com/libffi/libffi/releases/download/v3.3-rc0/libffi-3.3-rc0.tar.gz \
+SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-Fixed-missed-ifndef-for-__mips_soft_float.patch \
+           file://0001-powerpc-fix-build-failure-on-power7-and-older-532.patch \
+           file://0001-Address-platforms-with-no-__int128.patch \
            "
-SRC_URI[md5sum] = "8d2a82a78faf10a5e53c27d986e8f04e"
-SRC_URI[sha256sum] = "403d67aabf1c05157855ea2b1d9950263fb6316536c8c333f5b9ab1eb2f20ecf"
+SRC_URI[md5sum] = "6313289e32f1d38a9df4770b014a2ca7"
+SRC_URI[sha256sum] = "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"
 UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
 UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 EXTRA_OECONF += "--disable-builddir"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
 inherit autotools texinfo multilib_header
 
-S = "${WORKDIR}/${BPN}-3.3-rc0"
-
 do_install_append() {
 	oe_multilib_header ffi.h
 }
-- 
2.17.1


