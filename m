Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUt-0002oE-NU
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982213"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:50 -0700
Message-Id: <42629c7c86394f5adf05be1c59c4f21c67d4d189.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 14/26] ghostscript: update to 9.04
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:05 -0000

From: Kang Kai <kai.kang@windriver.com>

Remove the old version and update ghostscript to 9.04.

* update ghostscript-9.02-prevent_recompiling.patch
* because soobj is not used any more, remove soobj related work
* gs provides a configure option --with-install-cups to install cups related
  files but disabled by default, so need update post install scripts

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ghostscript/ghostscript/arm/soobjarch.h        |   40 -----------
 .../ghostscript-9.02-prevent_recompiling.patch     |   74 ++++++++++----------
 .../ghostscript/ghostscript/i586/soobjarch.h       |   41 -----------
 .../ghostscript/ghostscript/mips/soobjarch.h       |   40 -----------
 .../ghostscript/ghostscript/powerpc/soobjarch.h    |   40 -----------
 .../ghostscript/ghostscript/powerpc64/soobjarch.h  |   40 -----------
 .../ghostscript/ghostscript/x86-64/soobjarch.h     |   40 -----------
 .../{ghostscript_9.02.bb => ghostscript_9.04.bb}   |   24 +++---
 8 files changed, 49 insertions(+), 290 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64/soobjarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/x86-64/soobjarch.h
 rename meta/recipes-extended/ghostscript/{ghostscript_9.02.bb => ghostscript_9.04.bb} (82%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
deleted file mode 100644
index e8772cd..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
index 8fde77f..c37e4c4 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
@@ -6,39 +6,39 @@ Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 
---- a/base/unix-aux.mak.orig	2011-05-03 15:35:55.196887997 +0800
-+++ b/base/unix-aux.mak	2011-05-03 15:37:57.766888003 +0800
-@@ -57,45 +57,45 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.
+--- a/base/unix-aux.mak.orig	2011-10-17 16:12:20.354167007 +0800
++++ a/base/unix-aux.mak	2011-10-17 16:16:26.774167008 +0800
+@@ -67,45 +67,45 @@
  
  # -------------------------- Auxiliary programs --------------------------- #
  
--$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h)
--	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c
+-$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(MAKEDIRS)
+-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c
 -
 -# On the RS/6000 (at least), compiling genarch.c with gcc with -O
 -# produces a buggy executable.
--$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS)
--	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c
+-$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(MAKEDIRS)
+-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c
 -
--$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS)
--	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c
+-$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(MAKEDIRS)
+-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c
 -
--$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS)
--	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c
+-$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(MAKEDIRS)
+-	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c
 -
--$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS)
--	$(CCAUX) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c
+-$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(MAKEDIRS)
+-	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c
 -
 -# To get GS to use the system zlib, you remove/hide the gs/zlib directory
 -# which means that the mkromfs build can't find the zlib source it needs.
 -# So it's split into two targets, one using the zlib source directly.....
--MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(GLOBJ)gscdefs.$(OBJ) $(GLOBJ)gsmisc.$(OBJ) \
-- $(GLOBJ)gpmisc.$(OBJ) $(GLOBJ)gslibctx.$(OBJ) $(GLOBJ)gp_getnv.$(OBJ) \
-- $(GLOBJ)gp_unix.$(OBJ) $(GLOBJ)gp_unifs.$(OBJ) $(GLOBJ)gp_unifn.$(OBJ) \
-- $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gsutil.$(OBJ)
+-MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gscdefs.$(OBJ) $(AUX)gsmisc.$(OBJ) \
+- $(AUX)gpmisc.$(OBJ) $(AUX)gslibctx.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
+- $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
+- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
 -
 -$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0)
--	$(CCAUX) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) -lm $(EXTRALIBS)
+-	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) -lm $(EXTRALIBS)
 -
 -# .... and one using the zlib library linked via the command line
 -MKROMFS_OBJS_1=$(GLOBJ)gscdefs.$(OBJ) $(GLOBJ)gsmisc.$(OBJ) \
@@ -47,37 +47,37 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
 - $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gsutil.$(OBJ)
 -
 -$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1)
--	$(CCAUX) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) -lm $(EXTRALIBS)
+-	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) -lm $(EXTRALIBS)
 -
--$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB)
+-$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(MAKEDIRS)
 -	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
-+#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h)
-+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c
++#$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(MAKEDIRS)
++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c
 +#
 +## On the RS/6000 (at least), compiling genarch.c with gcc with -O
 +## produces a buggy executable.
-+#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS)
-+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c
++#$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(MAKEDIRS)
++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c
 +#
-+#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS)
-+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c
++#$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(MAKEDIRS)
++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c
 +#
-+#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS)
-+#	$(CCAUX) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c
++#$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(MAKEDIRS)
++#	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c
 +#
-+#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS)
-+#	$(CCAUX) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c
++#$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(MAKEDIRS)
++#	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c
 +#
 +## To get GS to use the system zlib, you remove/hide the gs/zlib directory
 +## which means that the mkromfs build can't find the zlib source it needs.
 +## So it's split into two targets, one using the zlib source directly.....
-+#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(GLOBJ)gscdefs.$(OBJ) $(GLOBJ)gsmisc.$(OBJ) \
-+# $(GLOBJ)gpmisc.$(OBJ) $(GLOBJ)gslibctx.$(OBJ) $(GLOBJ)gp_getnv.$(OBJ) \
-+# $(GLOBJ)gp_unix.$(OBJ) $(GLOBJ)gp_unifs.$(OBJ) $(GLOBJ)gp_unifn.$(OBJ) \
-+# $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gsutil.$(OBJ)
++#MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gscdefs.$(OBJ) $(AUX)gsmisc.$(OBJ) \
++# $(AUX)gpmisc.$(OBJ) $(AUX)gslibctx.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
++# $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
++# $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
 +#
 +#$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0)
-+#	$(CCAUX) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) -lm $(EXTRALIBS)
++#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) -lm $(EXTRALIBS)
 +#
 +## .... and one using the zlib library linked via the command line
 +#MKROMFS_OBJS_1=$(GLOBJ)gscdefs.$(OBJ) $(GLOBJ)gsmisc.$(OBJ) \
@@ -86,9 +86,9 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
 +# $(GLOBJ)gp_stdia.$(OBJ) $(GLOBJ)gsutil.$(OBJ)
 +#
 +#$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1)
-+#	$(CCAUX) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) -lm $(EXTRALIBS)
++#	$(CCAUX_) $(GENOPT) $(CFLAGS) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) -lm $(EXTRALIBS)
 +#
-+#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB)
++#$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(MAKEDIRS)
 +#	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
  
  # Query the environment to construct gconfig_.h.
diff --git a/meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
deleted file mode 100644
index 5817b7a..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 4
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
deleted file mode 100644
index 359097f..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
deleted file mode 100644
index 359097f..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc64/soobjarch.h
deleted file mode 100644
index 0d0a16b..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/soobjarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/x86-64/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/x86-64/soobjarch.h
deleted file mode 100644
index a05de29..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/x86-64/soobjarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
similarity index 82%
rename from meta/recipes-extended/ghostscript/ghostscript_9.02.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.04.bb
index 1d48cce..dba92e9 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
@@ -15,24 +15,24 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
-PR = "r4"
+PR = "r0"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
 
-SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.bz2"
+SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz"
 
 SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-prevent_recompiling.patch \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
-           file://soobjarch.h \
            file://ghostscript-9.02-parallel-make.patch \
            "
+
 SRC_URI_virtclass-native = "${SRC_URI_BASE}"
 
-SRC_URI[md5sum] = "f67151444bd56a7904579fc75a083dd6"
-SRC_URI[sha256sum] = "03ea2cad13a36f8f9160912012b79619a826e7148fada6d3531feb25409ee05a"
+SRC_URI[md5sum] = "9c2fb4af1eb609d09dba5bb0fa76173a"
+SRC_URI[sha256sum] = "f1e333738c41c3bf2b47ceb9806abb8045bcdc7353002c32736150425a7c1ef4"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper --with-fontpath=${datadir}/fonts"
 
@@ -47,15 +47,13 @@ do_configure () {
     mkdir -p obj
     mkdir -p soobj
     cp ${WORKDIR}/objarch.h obj/arch.h
-    cp ${WORKDIR}/soobjarch.h soobj/arch.h
 
     oe_runconf
 
     # copy tools from the native ghostscript build
-    mkdir -p obj soobj
+    mkdir -p obj/aux soobj
     for i in genarch genconf mkromfs echogs gendev genht; do
-        cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/$i
-        cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i soobj/$i
+        cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
     done
 }
 
@@ -64,7 +62,9 @@ do_install_append () {
     cp -r Resource ${D}${datadir}/ghostscript/${PV}/
     cp -r iccprofiles ${D}${datadir}/ghostscript/${PV}/
 
-    chown -R root:lp ${D}${sysconfdir}/cups
+    if [ -f ${D}${sysconfdir}/cups ]; then
+        chown -R root:lp ${D}${sysconfdir}/cups
+    fi
 }
 
 python do_patch_virtclass-native () {
@@ -78,14 +78,14 @@ do_configure_virtclass-native () {
 do_compile_virtclass-native () {
     mkdir -p obj
     for i in genarch genconf mkromfs echogs gendev genht; do
-        oe_runmake obj/$i
+        oe_runmake obj/aux/$i
     done
 }
 
 do_install_virtclass-native () {
     install -d ${D}${bindir}/ghostscript-${PV}
     for i in genarch genconf mkromfs echogs gendev genht; do
-        install -m 755 obj/$i ${D}${bindir}/ghostscript-${PV}/$i
+        install -m 755 obj/aux/$i ${D}${bindir}/ghostscript-${PV}/$i
     done
 }
 
-- 
1.7.6.2



