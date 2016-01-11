Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 887466FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B0VVWR007344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 10 Jan 2016 16:31:32 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:31 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:32 +0800
Message-ID: <f457364648f238d8b0353c2f7d14a5b08ed427fe.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] elfutils: 0.163 -> 0.164
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:34 -0000
Content-Type: text/plain

Update patches from debian
http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.164-1.debian.tar.xz

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../elfutils/elfutils-0.163/arm_func_value.patch   |  165 ----
 .../elfutils-0.163/arm_unwind_ret_mask.patch       |   83 --
 .../elfutils/elfutils-0.163/non_linux.patch        |   35 -
 .../elfutils-0.163/redhat-portability.diff         | 1021 --------------------
 .../elfutils/elfutils-0.163/scanf-format.patch     |   40 -
 .../uclibc-support-for-elfutils-0.161.patch        |  106 --
 ...ferences-between-mips-machine-identifiers.patch |   34 +
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
 .../0001-fix-a-stack-usage-warning.patch           |    0
 .../0001-remove-the-unneed-checking.patch          |    0
 ...-support-for-mips64-abis-in-mips_retval.c.patch |  168 ++++
 .../0003-Add-mips-n64-relocation-format-hack.patch |  226 +++++
 .../arm_backend.diff                               |  389 ++++----
 .../fixheadercheck.patch                           |    0
 .../hppa_backend.diff                              |   69 +-
 .../elfutils/elfutils-0.164/kfreebsd_path.patch    |   15 +
 .../m68k_backend.diff                              |   61 +-
 .../mips_backend.diff                              |   71 +-
 .../mips_readelf_w.patch                           |    8 +-
 .../testsuite-ignore-elflint.diff                  |    0
 .../{elfutils_0.163.bb => elfutils_0.164.bb}       |   15 +-
 21 files changed, 735 insertions(+), 1771 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/0001-Ignore-differences-between-mips-machine-identifiers.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/0001-remove-the-unneed-checking.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/0003-Add-mips-n64-relocation-format-hack.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/arm_backend.diff (82%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/hppa_backend.diff (93%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/kfreebsd_path.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/m68k_backend.diff (89%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/mips_backend.diff (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/mips_readelf_w.patch (75%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.163.bb => elfutils_0.164.bb} (87%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
deleted file mode 100644
index 2fe4df6..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From: Mark Wielaard <mjw@redhat.com>
-Date: Sun, 15 Jun 2014 11:30:35 +0200
-Subject: libebl: Add sym_func_value hook.
-
-The ARM EABI says that the zero bit of function symbol st_value indicates
-whether the symbol points to a THUMB or ARM function. Add a new ebl hook
-to adjust the st_value in such a case so that we get the actual value that
-the symbol points to. It isn't easily possible to reuse the existing
-resolve_sym_value for this purpose, so we end up with another hook that
-can be used from dwfl_module_getsym and elflint.
-
-Rebase arm_func_value.patch from 0.159 to 0.160
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/arm_init.c          |    1 +
- backends/arm_symbol.c        |    8 ++++++++
- libdwfl/dwfl_module_getsym.c |    2 +-
- libebl/Makefile.am           |    3 ++-
- libebl/ebl-hooks.h           |    3 +++
- libebl/eblsymfuncval.c       |   43 ++++++++++++++++++++++++++++++++++++++++++
- libebl/libebl.h              |   11 +++++++++++
- 7 files changed, 69 insertions(+), 2 deletions(-)
-
-diff --git a/backends/arm_init.c b/backends/arm_init.c
-index 7171186..9f03630 100644
---- a/backends/arm_init.c
-+++ b/backends/arm_init.c
-@@ -78,6 +78,7 @@ arm_init (elf, machine, eh, ehlen)
-     eh->return_value_location = arm_return_value_location_hard;
-   HOOK (eh, abi_cfi);
-   HOOK (eh, check_reloc_target_type);
-+  HOOK (eh, sym_func_value);
-   HOOK (eh, symbol_type_name);
- 
-   /* We only unwind the core integer registers.  */
-diff --git a/backends/arm_symbol.c b/backends/arm_symbol.c
-index da4a50a..ccea03b 100644
---- a/backends/arm_symbol.c
-+++ b/backends/arm_symbol.c
-@@ -130,6 +130,14 @@ arm_check_reloc_target_type (Ebl *ebl __attribute__ ((unused)), Elf64_Word sh_ty
-   return sh_type == SHT_ARM_EXIDX;
- }
- 
-+/* ARM EABI says that the low bit indicates whether the function
-+   symbol value is a THUMB function or not.  Mask it off.  */
-+GElf_Addr
-+arm_sym_func_value (Ebl *ebl __attribute__ ((unused)), GElf_Addr val)
-+{
-+  return val & ~(GElf_Addr)1;
-+}
-+
- const char *
- arm_symbol_type_name (int type,
- 		      char *buf __attribute__ ((unused)),
-diff --git a/libdwfl/dwfl_module_getsym.c b/libdwfl/dwfl_module_getsym.c
-index 42d2b67..fb192d7 100644
---- a/libdwfl/dwfl_module_getsym.c
-+++ b/libdwfl/dwfl_module_getsym.c
-@@ -119,7 +119,7 @@ __libdwfl_getsym (Dwfl_Module *mod, int ndx, GElf_Sym *sym, GElf_Addr *addr,
-      descriptors).  */
- 
-   char *ident;
--  GElf_Addr st_value = sym->st_value & ebl_func_addr_mask (mod->ebl);
-+  GElf_Addr st_value = ebl_sym_func_value (mod->ebl, sym->st_value);
-   *resolved = false;
-   if (! adjust_st_value && mod->e_type != ET_REL && alloc
-       && (GELF_ST_TYPE (sym->st_info) == STT_FUNC
-diff --git a/libebl/Makefile.am b/libebl/Makefile.am
-index ec4477b..889c21b 100644
---- a/libebl/Makefile.am
-+++ b/libebl/Makefile.am
-@@ -55,7 +55,8 @@ gen_SOURCES = eblopenbackend.c eblclosebackend.c eblstrtab.c \
- 	      eblsysvhashentrysize.c eblauxvinfo.c eblcheckobjattr.c \
- 	      ebl_check_special_section.c ebl_syscall_abi.c eblabicfi.c \
- 	      eblstother.c eblinitreg.c ebldwarftoregno.c eblnormalizepc.c \
--	      eblunwind.c eblresolvesym.c eblcheckreloctargettype.c
-+	      eblunwind.c eblresolvesym.c eblcheckreloctargettype.c \
-+	      eblsymfuncval.c
- 
- libebl_a_SOURCES = $(gen_SOURCES)
- 
-diff --git a/libebl/ebl-hooks.h b/libebl/ebl-hooks.h
-index 2e31446..9df945d 100644
---- a/libebl/ebl-hooks.h
-+++ b/libebl/ebl-hooks.h
-@@ -191,5 +191,8 @@ bool EBLHOOK(unwind) (Ebl *ebl, Dwarf_Addr pc, ebl_tid_registers_t *setfunc,
-    (e.g. function descriptor resolving)  */
- bool EBLHOOK(resolve_sym_value) (Ebl *ebl, GElf_Addr *addr);
- 
-+/* Returns the real value of a symbol function address or offset.  */
-+GElf_Addr EBLHOOK(sym_func_value) (Ebl *ebl, GElf_Addr val);
-+
- /* Destructor for ELF backend handle.  */
- void EBLHOOK(destr) (struct ebl *);
-diff --git a/libebl/eblsymfuncval.c b/libebl/eblsymfuncval.c
-new file mode 100644
-index 0000000..c0b322f
---- /dev/null
-+++ b/libebl/eblsymfuncval.c
-@@ -0,0 +1,43 @@
-+/* Turn a symbol function value into a real function address or offset.
-+   Copyright (C) 2014 Red Hat, Inc.
-+   This file is part of elfutils.
-+
-+   This file is free software; you can redistribute it and/or modify
-+   it under the terms of either
-+
-+     * the GNU Lesser General Public License as published by the Free
-+       Software Foundation; either version 3 of the License, or (at
-+       your option) any later version
-+
-+   or
-+
-+     * the GNU General Public License as published by the Free
-+       Software Foundation; either version 2 of the License, or (at
-+       your option) any later version
-+
-+   or both in parallel, as here.
-+
-+   elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received copies of the GNU General Public License and
-+   the GNU Lesser General Public License along with this program.  If
-+   not, see <http://www.gnu.org/licenses/>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <libeblP.h>
-+#include <assert.h>
-+
-+GElf_Addr
-+ebl_sym_func_value (Ebl *ebl, GElf_Addr val)
-+{
-+  if (ebl == NULL || ebl->sym_func_value == NULL)
-+    return val;
-+
-+  return ebl->sym_func_value (ebl, val);
-+}
-diff --git a/libebl/libebl.h b/libebl/libebl.h
-index 7dbf460..96c076b 100644
---- a/libebl/libebl.h
-+++ b/libebl/libebl.h
-@@ -472,6 +472,17 @@ extern bool ebl_unwind (Ebl *ebl, Dwarf_Addr pc, ebl_tid_registers_t *setfunc,
- extern bool ebl_resolve_sym_value (Ebl *ebl, GElf_Addr *addr)
-    __nonnull_attribute__ (2);
- 
-+/* Returns the real value of a symbol function address or offset
-+   (e.g. when the st_value contains some flag bits that need to be
-+   masked off).  This is different from ebl_resolve_sym_value which
-+   only works for actual symbol addresses (in non-ET_REL files) that
-+   might resolve to an address in a different section.
-+   ebl_sym_func_value is called to turn the given value into the a
-+   real address or offset (the original value might not be a real
-+   address).  This works for both ET_REL when the value is a section
-+   offset or ET_EXEC or ET_DYN symbol values, which are addresses.  */
-+extern GElf_Addr ebl_sym_func_value (Ebl *ebl, GElf_Addr val);
-+
- #ifdef __cplusplus
- }
- #endif
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
deleted file mode 100644
index 8abb36b..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From: Mark Wielaard <mjw@redhat.com>
-Date: Sun, 15 Jun 2014 12:30:02 +0200
-Subject: libebl: Add ebl_unwind_ret_mask.
-
-Another ARM oddity. A return value address in an unwind will contain an
-extra bit to indicate whether to return to a regular ARM or THUMB function.
-Add a new ebl function to return a mask to use to get the actual return
-address during an unwind ebl_unwind_ret_mask.
-
-Rebase arm_unwind_ret_mask.patch from 0.159 to 0.160
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/arm_init.c | 3 +++
- libebl/eblinitreg.c | 8 ++++++++
- libebl/libebl.h     | 4 ++++
- libebl/libeblP.h    | 6 ++++++
- 4 files changed, 21 insertions(+)
-
-diff --git a/backends/arm_init.c b/backends/arm_init.c
-index 2266829..f8df042 100644
---- a/backends/arm_init.c
-+++ b/backends/arm_init.c
-@@ -87,5 +87,8 @@ arm_init (elf, machine, eh, ehlen)
-   /* Bit zero encodes whether an function address is THUMB or ARM. */
-   eh->func_addr_mask = ~(GElf_Addr)1;
- 
-+  /* Bit zero encodes whether to return to a THUMB or ARM function. */
-+  eh->unwind_ret_mask = ~(GElf_Addr)1;
-+
-   return MODVERSION;
- }
-diff --git a/libebl/eblinitreg.c b/libebl/eblinitreg.c
-index 5729b3c..ca681c0 100644
---- a/libebl/eblinitreg.c
-+++ b/libebl/eblinitreg.c
-@@ -56,3 +56,11 @@ ebl_func_addr_mask (Ebl *ebl)
-   return ((ebl == NULL || ebl->func_addr_mask == 0)
- 	  ? ~(GElf_Addr)0 : ebl->func_addr_mask);
- }
-+
-+GElf_Addr
-+ebl_unwind_ret_mask (Ebl *ebl)
-+{
-+  return ((ebl == NULL || ebl->unwind_ret_mask == 0)
-+	  ? ~(GElf_Addr)0 : ebl->unwind_ret_mask);
-+}
-+
-diff --git a/libebl/libebl.h b/libebl/libebl.h
-index 40cf635..be70027 100644
---- a/libebl/libebl.h
-+++ b/libebl/libebl.h
-@@ -420,6 +420,10 @@ extern size_t ebl_frame_nregs (Ebl *ebl)
-    tables) is needed.  */
- extern GElf_Addr ebl_func_addr_mask (Ebl *ebl);
- 
-+/* Mask to use for unwind return address in case the architecture adds
-+   some extra non-address bits to it.  */
-+extern GElf_Addr ebl_unwind_ret_mask (Ebl *ebl);
-+
- /* Convert *REGNO as is in DWARF to a lower range suitable for
-    Dwarf_Frame->REGS indexing.  */
- extern bool ebl_dwarf_to_regno (Ebl *ebl, unsigned *regno)
-diff --git a/libebl/libeblP.h b/libebl/libeblP.h
-index dbd67f3..e18ace6 100644
---- a/libebl/libeblP.h
-+++ b/libebl/libeblP.h
-@@ -70,6 +70,12 @@ struct ebl
-      otherwise it should be the actual mask to use.  */
-   GElf_Addr func_addr_mask;
- 
-+  /* Mask to use to get the return address from an unwind in case the
-+     architecture adds some extra non-address bits to it.  When not
-+     initialized (0) then ebl_unwind_ret_mask will return ~0, otherwise
-+     it should be the actual mask to use.  */
-+  GElf_Addr unwind_ret_mask;
-+
-   /* Function descriptor load address and table as used by
-      ebl_resolve_sym_value if available for this arch.  */
-   GElf_Addr fd_addr;
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
deleted file mode 100644
index 35b1b38..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Index: elfutils-0.159/libdwfl/linux-pid-attach.c
-===================================================================
---- elfutils-0.159.orig/libdwfl/linux-pid-attach.c
-+++ elfutils-0.159/libdwfl/linux-pid-attach.c
-@@ -393,6 +393,16 @@ pid_getthread (Dwfl *dwfl __attribute__
-   return false;
- }
- 
-+bool
-+internal_function
-+__libdwfl_ptrace_attach (pid_t tid __attribute__ ((unused)),
-+			 bool *tid_was_stoppedp __attribute__ ((unused)))
-+{
-+  errno = ENOSYS;
-+  __libdwfl_seterrno (DWFL_E_ERRNO);
-+  return false;
-+}
-+
- static bool
- pid_memory_read (Dwfl *dwfl __attribute__ ((unused)),
-                  Dwarf_Addr addr __attribute__ ((unused)),
-@@ -419,6 +429,13 @@ pid_detach (Dwfl *dwfl __attribute__ ((u
- {
- }
- 
-+void
-+internal_function
-+__libdwfl_ptrace_detach (pid_t tid __attribute__ ((unused)),
-+			 bool tid_was_stopped __attribute__ ((unused)))
-+{
-+}
-+
- static void
- pid_thread_detach (Dwfl_Thread *thread __attribute__ ((unused)),
- 		  void *thread_arg __attribute__ ((unused)))
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
deleted file mode 100644
index a0ff07d..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
+++ /dev/null
@@ -1,1021 +0,0 @@
-Rebase to 1.162
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- ChangeLog                   |   30 +++++++++++++++++++++
- backends/ChangeLog          |   12 +++++++++
- backends/Makefile.am        |    2 +-
- config/ChangeLog            |    4 +++
- config/eu.am                |   14 +++++++---
- configure.ac                |   61 +++++++++++++++++++++++++++++++++++++++++--
- lib/ChangeLog               |    8 ++++++
- lib/eu-config.h             |   10 +++++++
- libasm/ChangeLog            |    5 ++++
- libcpu/ChangeLog            |    8 ++++++
- libcpu/i386_disasm.c        |    1 +
- libdw/ChangeLog             |   13 +++++++++
- libdw/dwarf_begin_elf.c     |    8 ++++++
- libdw/libdw.h               |    2 +-
- libdwfl/ChangeLog           |   20 ++++++++++++++
- libdwfl/linux-core-attach.c |   29 ++++++++++++++++++++
- libdwfl/linux-pid-attach.c  |   14 ++++++++++
- libebl/ChangeLog            |    5 ++++
- libelf/ChangeLog            |   10 +++++++
- libelf/common.h             |    4 +--
- libelf/gnuhash_xlate.h      |    6 +++--
- src/ChangeLog               |   30 +++++++++++++++++++++
- src/Makefile.am             |    5 ++++
- src/addr2line.c             |    4 +--
- src/findtextrel.c           |    6 ++++-
- src/ld.h                    |    2 ++
- src/readelf.c               |   15 +++++++----
- src/strings.c               |   11 ++++++++
- src/strip.c                 |    6 +++++
- tests/ChangeLog             |   14 ++++++++++
- tests/Makefile.am           |    1 +
- tests/backtrace.c           |    1 +
- tests/line2addr.c           |    2 +-
- 33 files changed, 343 insertions(+), 20 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index d829783..89bfd24 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -253,6 +253,8 @@
- 
- 2012-01-24  Mark Wielaard  <mjw@redhat.com>
- 
-+	* configure.ac: Wrap AC_COMPILE_IFELSE sources in AC_LANG_SOURCE.
-+
- 	* COPYING: Fix address. Updated version from gnulib.
- 
- 2012-01-23  Mark Wielaard  <mjw@redhat.com>
-@@ -271,6 +273,9 @@
- 
- 2011-10-08  Mike Frysinger  <vapier@gentoo.org>
- 
-+	* configure.ac (--disable-werror): Handle it, controlling BUILD_WERROR
-+	automake option.
-+
- 	* configure.ac: Fix use of AC_ARG_ENABLE to handle $enableval correctly.
- 
- 2011-10-02  Ulrich Drepper  <drepper@gmail.com>
-@@ -292,6 +297,10 @@
- 
- 	* configure.ac (LOCALEDIR, DATADIRNAME): Removed.
- 
-+2009-11-22  Roland McGrath  <roland@redhat.com>
-+
-+	* configure.ac: Use sed and expr instead of modern bash extensions.
-+
- 2009-09-21  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* configure.ac: Update for more modern autoconf.
-@@ -300,6 +309,10 @@
- 
- 	* configure.ac (zip_LIBS): Check for liblzma too.
- 
-+2009-08-17  Roland McGrath  <roland@redhat.com>
-+
-+	* configure.ac: Check for -fgnu89-inline; add it to WEXTRA if it works.
-+
- 2009-04-19  Roland McGrath  <roland@redhat.com>
- 
- 	* configure.ac (eu_version): Round down here, not in version.h macros.
-@@ -311,6 +324,8 @@
- 
- 2009-01-23  Roland McGrath  <roland@redhat.com>
- 
-+	* configure.ac: Check for __builtin_popcount.
-+
- 	* configure.ac (zlib check): Check for gzdirect, need zlib >= 1.2.2.3.
- 
- 	* configure.ac (__thread check): Use AC_LINK_IFELSE, in case of
-@@ -391,6 +406,10 @@
- 	* configure.ac: Add dummy automake conditional to get dependencies
- 	for non-generic linker right.  See src/Makefile.am.
- 
-+2005-11-22  Roland McGrath  <roland@redhat.com>
-+
-+	* configure.ac: Check for --as-needed linker option.
-+
- 2005-11-18  Roland McGrath  <roland@redhat.com>
- 
- 	* Makefile.am (DISTCHECK_CONFIGURE_FLAGS): New variable.
-@@ -438,6 +457,17 @@
- 	* Makefile.am (all_SUBDIRS): Add libdwfl.
- 	* configure.ac: Write libdwfl/Makefile.
- 
-+2005-05-31  Roland McGrath  <roland@redhat.com>
-+
-+	* configure.ac (WEXTRA): Check for -Wextra and set this substitution.
-+
-+	* configure.ac: Check for struct stat st_?tim members.
-+	* src/strip.c (process_file): Use st_?time if st_?tim are not there.
-+
-+	* configure.ac: Check for futimes function.
-+	* src/strip.c (handle_elf) [! HAVE_FUTIMES]: Use utimes instead.
-+	(handle_ar) [! HAVE_FUTIMES]: Likewise.
-+
- 2005-05-19  Roland McGrath  <roland@redhat.com>
- 
- 	* configure.ac [AH_BOTTOM] (INTDECL, _INTDECL): New macros.
-diff --git a/backends/ChangeLog b/backends/ChangeLog
-index fe61d9c..9599623 100644
---- a/backends/ChangeLog
-+++ b/backends/ChangeLog
-@@ -498,6 +498,10 @@
- 	* ppc_attrs.c (ppc_check_object_attribute): Handle tag
- 	GNU_Power_ABI_Struct_Return.
- 
-+2009-01-23  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (libebl_%.so): Use $(LD_AS_NEEDED).
-+
- 2008-10-04  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* i386_reloc.def: Fix entries for TLS_GOTDESC, TLS_DESC_CALL, and
-@@ -825,6 +829,11 @@
- 	* sparc_init.c: Likewise.
- 	* x86_64_init.c: Likewise.
- 
-+2005-11-22  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (LD_AS_NEEDED): New variable, substituted by configure.
-+	(libebl_%.so rule): Use it in place of -Wl,--as-needed.
-+
- 2005-11-19  Roland McGrath  <roland@redhat.com>
- 
- 	* ppc64_reloc.def: REL30 -> ADDR30.
-@@ -847,6 +856,9 @@
- 	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
- 	(CLEANFILES): Add libebl_$(m).so.
- 
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 	* ppc_reloc.def: Update bits per Alan Modra <amodra@bigpond.net.au>.
- 	* ppc64_reloc.def: Likewise.
- 
-diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 21d7bd2..fe920c9 100644
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
-@@ -119,7 +119,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
- 	$(LINK) -shared -o $(@:.map=.so) \
- 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
- 		-Wl,--version-script,$(@:.so=.map) \
--		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw)
-+		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw)
- 	@$(textrel_check)
- 
- libebl_i386.so: $(cpu_i386)
-diff --git a/config/ChangeLog b/config/ChangeLog
-index 64b58e1..63b3e90 100644
---- a/config/ChangeLog
-+++ b/config/ChangeLog
-@@ -106,6 +106,10 @@
- 
- 	* known-dwarf.awk: Use gawk.
- 
-+2011-10-08  Mike Frysinger  <vapier@gentoo.org>
-+
-+	* eu.am [BUILD_WERROR]: Conditionalize -Werror use on this.
-+
- 2010-07-02  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* elfutils.spec.in: Add more BuildRequires.
-diff --git a/config/eu.am b/config/eu.am
-index 70d32de..65af085 100644
---- a/config/eu.am
-+++ b/config/eu.am
-@@ -1,6 +1,6 @@
- ## Common automake fragments for elfutils subdirectory makefiles.
- ##
--## Copyright (C) 2010, 2014 Red Hat, Inc.
-+## Copyright (C) 2010-2011, 2014 Red Hat, Inc.
- ##
- ## This file is part of elfutils.
- ##
-@@ -29,6 +29,9 @@
- ## not, see <http://www.gnu.org/licenses/>.
- ##
- 
-+WEXTRA = @WEXTRA@
-+LD_AS_NEEDED = @LD_AS_NEEDED@
-+
- DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
- AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
- 
-@@ -38,12 +41,17 @@ STACK_USAGE_WARNING=-Wstack-usage=262144
- else
- STACK_USAGE_WARNING=
- endif
--AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
-+AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
- 	    $(if $($(*F)_no_Werror),,-Werror) \
--	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
-+	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
-+	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
- 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	    $($(*F)_CFLAGS)
- 
-+if BUILD_WERROR
-+AM_CFLAGS += $(if $($(*F)_no_Werror),,-Werror)
-+endif
-+
- COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage, $(COMPILE))
- 
- DEFS.os = -DPIC -DSHARED
-diff --git a/configure.ac b/configure.ac
-index bc9ff56..27a1ef3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -106,6 +106,55 @@ CFLAGS="$old_CFLAGS"])
- AS_IF([test "x$ac_cv_c99" != xyes],
-       AC_MSG_ERROR([gcc with GNU99 support required]))
- 
-+AC_CACHE_CHECK([for -Wextra option to $CC], ac_cv_cc_wextra, [dnl
-+old_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -Wextra"
-+AC_COMPILE_IFELSE([AC_LANG_SOURCE([void foo (void) { }])],
-+		  ac_cv_cc_wextra=yes, ac_cv_cc_wextra=no)
-+CFLAGS="$old_CFLAGS"])
-+AC_SUBST(WEXTRA)
-+AS_IF([test "x$ac_cv_cc_wextra" = xyes], [WEXTRA=-Wextra], [WEXTRA=-W])
-+
-+AC_CACHE_CHECK([for -fgnu89-inline option to $CC], ac_cv_cc_gnu89_inline, [dnl
-+old_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -fgnu89-inline -Werror"
-+AC_COMPILE_IFELSE([AC_LANG_SOURCE([
-+void foo (void)
-+{
-+  inline void bar (void) {}
-+  bar ();
-+}
-+extern inline void baz (void) {}
-+])], ac_cv_cc_gnu89_inline=yes, ac_cv_cc_gnu89_inline=no)
-+CFLAGS="$old_CFLAGS"])
-+AS_IF([test "x$ac_cv_cc_gnu89_inline" = xyes],
-+      [WEXTRA="${WEXTRA:+$WEXTRA }-fgnu89-inline"])
-+
-+AC_CACHE_CHECK([for --as-needed linker option],
-+	       ac_cv_as_needed, [dnl
-+cat > conftest.c <<EOF
-+int main (void) { return 0; }
-+EOF
-+if AC_TRY_COMMAND([${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS
-+			    -fPIC -shared -o conftest.so conftest.c
-+			    -Wl,--as-needed 1>&AS_MESSAGE_LOG_FD])
-+then
-+  ac_cv_as_needed=yes
-+else
-+  ac_cv_as_needed=no
-+fi
-+rm -f conftest*])
-+AS_IF([test "x$ac_cv_as_needed" = xyes],
-+      [LD_AS_NEEDED=-Wl,--as-needed], [LD_AS_NEEDED=])
-+AC_SUBST(LD_AS_NEEDED)
-+
-+AC_CACHE_CHECK([for __builtin_popcount], ac_cv_popcount, [dnl
-+AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[exit (__builtin_popcount (127));]])],
-+	       ac_cv_popcount=yes, ac_cv_popcount=no)])
-+AS_IF([test "x$ac_cv_popcount" = xyes],
-+      [AC_DEFINE([HAVE_BUILTIN_POPCOUNT], [1], [Have __builtin_popcount.])])
-+
-+
- AC_CACHE_CHECK([for __thread support], ac_cv_tls, [dnl
- # Use the same flags that we use for our DSOs, so the test is representative.
- # Some old compiler/linker/libc combinations fail some ways and not others.
-@@ -122,7 +171,10 @@ static __thread int a; int foo (int b) { return a + b; }]],
- CFLAGS="$save_CFLAGS"
- LDFLAGS="$save_LDFLAGS"])
- AS_IF([test "x$ac_cv_tls" != xyes],
--      AC_MSG_ERROR([__thread support required]))
-+      [AS_IF([test "$use_locks" = yes],
-+	     [AC_MSG_ERROR([--enable-thread-safety requires __thread support])],
-+	     [AC_DEFINE([__thread], [/* empty: no multi-thread support */],
-+			[Stubbed out if missing compiler support.])])])
- 
- dnl This test must come as early as possible after the compiler configuration
- dnl tests, because the choice of the file model can (in principle) affect
-@@ -224,6 +276,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_valgrind" = yes)
- AM_CONDITIONAL(BUILD_STATIC, [dnl
- test "$use_gprof" = yes -o "$use_gcov" = yes])
- 
-+AC_ARG_ENABLE([werror],
-+AS_HELP_STRING([--disable-werror],[do not build with -Werror]),
-+	       [enable_werror=$enableval], [enable_werror=yes])
-+AM_CONDITIONAL(BUILD_WERROR, test "$enable_werror" = yes)
-+
- AC_ARG_ENABLE([tests-rpath],
- AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
- 	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
-@@ -388,7 +445,7 @@ case "$eu_version" in
- esac
- 
- # Round up to the next release API (x.y) version.
--eu_version=$(( (eu_version + 999) / 1000 ))
-+eu_version=`expr \( $eu_version + 999 \) / 1000`
- 
- dnl Unique ID for this build.
- MODVERSION="Build for ${LIBEBL_SUBDIR} ${eu_version} ${ac_cv_build}"
-diff --git a/lib/ChangeLog b/lib/ChangeLog
-index d04bf17..720c98d 100644
---- a/lib/ChangeLog
-+++ b/lib/ChangeLog
-@@ -73,6 +73,9 @@
- 
- 2009-01-23  Roland McGrath  <roland@redhat.com>
- 
-+	* eu-config.h [! HAVE_BUILTIN_POPCOUNT]
-+	(__builtin_popcount): New inline function.
-+
- 	* eu-config.h: Add multiple inclusion protection.
- 
- 2009-01-17  Ulrich Drepper  <drepper@redhat.com>
-@@ -129,6 +132,11 @@
- 	* Makefile.am (libeu_a_SOURCES): Add it.
- 	* system.h: Declare crc32_file.
- 
-+2005-02-07  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 2005-04-30  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* Makefile.am: Use -ffunction-sections for xmalloc.c.
-diff --git a/lib/eu-config.h b/lib/eu-config.h
-index 400cdc6..872f6bc 100644
---- a/lib/eu-config.h
-+++ b/lib/eu-config.h
-@@ -163,6 +163,16 @@ asm (".section predict_data, \"aw\"; .previous\n"
- /* This macro is used by the tests conditionalize for standalone building.  */
- #define ELFUTILS_HEADER(name) <lib##name.h>
- 
-+#ifndef HAVE_BUILTIN_POPCOUNT
-+# define __builtin_popcount hakmem_popcount
-+static inline unsigned int __attribute__ ((unused))
-+hakmem_popcount (unsigned int x)
-+{
-+  /* HAKMEM 169 */
-+  unsigned int n = x - ((x >> 1) & 033333333333) - ((x >> 2) & 011111111111);
-+  return ((n + (n >> 3)) & 030707070707) % 63;
-+}
-+#endif	/* HAVE_BUILTIN_POPCOUNT */
- 
- #ifdef SYMBOL_VERSIONING
- # define OLD_VERSION(name, version) \
-diff --git a/libasm/ChangeLog b/libasm/ChangeLog
-index 9b25af9..32b9fd0 100644
---- a/libasm/ChangeLog
-+++ b/libasm/ChangeLog
-@@ -87,6 +87,11 @@
- 	* asm_error.c: Add new error ASM_E_IOERROR.
- 	* libasmP.h: Add ASM_E_IOERROR definition.
- 
-+2005-05-31  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 2005-02-15  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* Makefile.am (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
-diff --git a/libcpu/ChangeLog b/libcpu/ChangeLog
-index a20f440..5ea23b7 100644
---- a/libcpu/ChangeLog
-+++ b/libcpu/ChangeLog
-@@ -51,6 +51,9 @@
- 
- 2009-01-23  Roland McGrath  <roland@redhat.com>
- 
-+	* i386_disasm.c (i386_disasm): Add abort after assert-constant for old
-+	compilers that don't realize it's noreturn.
-+
- 	* Makefile.am (i386_parse_CFLAGS): Use quotes around command
- 	substitution that can produce leading whitespace.
- 
-@@ -380,6 +383,11 @@
- 	* defs/i386.doc: New file.
- 	* defs/x86_64: New file.
- 
-+2005-04-04  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it instead of -Wextra.
-+
- 2005-02-15  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* Makefile (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
-diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
-index 832241f..c7a0df0 100644
---- a/libcpu/i386_disasm.c
-+++ b/libcpu/i386_disasm.c
-@@ -822,6 +822,7 @@ i386_disasm (const uint8_t **startp, const uint8_t *end, GElf_Addr addr,
- 
- 			default:
- 			  assert (! "INVALID not handled");
-+			  abort ();
- 			}
- 		    }
- 		  else
-diff --git a/libdw/ChangeLog b/libdw/ChangeLog
-index 487e34a..06c737b 100644
---- a/libdw/ChangeLog
-+++ b/libdw/ChangeLog
-@@ -889,6 +889,10 @@
- 
- 	* Makefile.am (known-dwarf.h): Run gawk on config/known-dwarf.awk.
- 
-+2011-07-20  Mark Wielaard  <mjw@redhat.com>
-+
-+	* dwarf_begin_elf.c: Add fallback for be64toh if not defined.
-+
- 2011-07-14  Mark Wielaard  <mjw@redhat.com>
- 
- 	* libdw.h (dwarf_offdie): Fix documentation to mention .debug_info.
-@@ -1248,6 +1252,10 @@
- 
- 	* dwarf_hasattr_integrate.c: Integrate DW_AT_specification too.
- 
-+2009-08-17  Roland McGrath  <roland@redhat.com>
-+
-+	* libdw.h: Disable extern inlines for GCC 4.2.
-+
- 2009-08-10  Roland McGrath  <roland@redhat.com>
- 
- 	* dwarf_getscopevar.c: Use dwarf_diename.
-@@ -2016,6 +2024,11 @@
- 
- 2005-05-31  Roland McGrath  <roland@redhat.com>
- 
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
-+2005-05-31  Roland McGrath  <roland@redhat.com>
-+
- 	* dwarf_formref_die.c (dwarf_formref_die): Add CU header offset to
- 	formref offset.
- 
-diff --git a/libdw/dwarf_begin_elf.c b/libdw/dwarf_begin_elf.c
-index 4e0d590..a6616a1 100644
---- a/libdw/dwarf_begin_elf.c
-+++ b/libdw/dwarf_begin_elf.c
-@@ -47,6 +47,14 @@
- #if USE_ZLIB
- # include <endian.h>
- # define crc32		loser_crc32
-+# ifndef be64toh
-+#  include <byteswap.h>
-+#  if __BYTE_ORDER == __LITTLE_ENDIAN
-+#   define be64toh(x) bswap_64 (x)
-+#  else
-+#   define be64toh(x) (x)
-+#  endif
-+# endif
- # include <zlib.h>
- # undef crc32
- #endif
-diff --git a/libdw/libdw.h b/libdw/libdw.h
-index 473e1a2..5a511cd 100644
---- a/libdw/libdw.h
-+++ b/libdw/libdw.h
-@@ -1004,7 +1004,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (Dwarf *dbg, Dwarf_OOM handler);
- 
- 
- /* Inline optimizations.  */
--#ifdef __OPTIMIZE__
-+#if defined __OPTIMIZE__ && !(__GNUC__ == 4 && __GNUC_MINOR__ == 2)
- /* Return attribute code of given attribute.  */
- __libdw_extern_inline unsigned int
- dwarf_whatattr (Dwarf_Attribute *attr)
-diff --git a/libdwfl/ChangeLog b/libdwfl/ChangeLog
-index a5253e2..59abfac 100644
---- a/libdwfl/ChangeLog
-+++ b/libdwfl/ChangeLog
-@@ -704,6 +704,21 @@
- 	(dwfl_module_addrsym) (i_to_symfile): New function.
- 	(dwfl_module_addrsym) (search_table): Use it.
- 
-+2013-11-09  Jan Kratochvil  <jan.kratochvil@redhat.com>
-+
-+	Older OS compatibility bits.
-+	* linux-core-attach.c (be64toh, le64toh, be32toh, le32toh): Provide
-+	fallbacks if not defined by system.
-+
-+2013-11-09  Jan Kratochvil  <jan.kratochvil@redhat.com>
-+
-+	Handle T-stopped detach for old kernels.
-+	* linux-pid-attach.c (struct pid_arg): New field stopped.
-+	(ptrace_attach): New parameter stoppedp.  Set it appropriately.
-+	(pid_set_initial_registers): Pass the new field.
-+	(pid_thread_detach): Handle the case of STOPPED for old kernels.
-+	(__libdwfl_attach_state_for_pid): Initialize STOPPED.
-+
- 2013-11-07  Jan Kratochvil  <jan.kratochvil@redhat.com>
- 	    Mark Wielaard  <mjw@redhat.com>
- 
-@@ -2469,6 +2484,11 @@
- 
- 2005-07-21  Roland McGrath  <roland@redhat.com>
- 
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
-+2005-07-21  Roland McGrath  <roland@redhat.com>
-+
- 	* Makefile.am (noinst_HEADERS): Add loc2c.c.
- 
- 	* test2.c (main): Check sscanf result to quiet warning.
-diff --git a/libdwfl/linux-core-attach.c b/libdwfl/linux-core-attach.c
-index 5a7b3b3..d05ac7e 100644
---- a/libdwfl/linux-core-attach.c
-+++ b/libdwfl/linux-core-attach.c
-@@ -29,6 +29,35 @@
- #include "libdwflP.h"
- #include <fcntl.h>
- #include "system.h"
-+#include <endian.h>
-+#include <byteswap.h>
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+# ifndef be64toh
-+#  define be64toh(x) bswap_64 (x)
-+# endif
-+# ifndef le64toh
-+#  define le64toh(x) (x)
-+# endif
-+# ifndef be32toh
-+#  define be32toh(x) bswap_32 (x)
-+# endif
-+# ifndef le32toh
-+#  define le32toh(x) (x)
-+# endif
-+#else
-+# ifndef be64toh
-+#  define be64toh(x) (x)
-+# endif
-+# ifndef le64toh
-+#  define le64toh(x) bswap_64 (x)
-+# endif
-+# ifndef be32toh
-+#  define be32toh(x) (x)
-+# endif
-+# ifndef le32toh
-+#  define le32toh(x) bswap_32 (x)
-+# endif
-+#endif
- 
- #include "../libdw/memory-access.h"
- 
-diff --git a/libdwfl/linux-pid-attach.c b/libdwfl/linux-pid-attach.c
-index ae71702..076b2c3 100644
---- a/libdwfl/linux-pid-attach.c
-+++ b/libdwfl/linux-pid-attach.c
-@@ -255,6 +255,11 @@ void
- internal_function
- __libdwfl_ptrace_detach (pid_t tid, bool tid_was_stopped)
- {
-+  // Older kernels (tested kernel-2.6.18-348.12.1.el5.x86_64) need special
-+  // handling of the detachment to keep the process State: T (stopped).
-+  if (tid_was_stopped)
-+    syscall (__NR_tkill, tid, SIGSTOP);
-+
-   /* This handling is needed only on older Linux kernels such as
-      2.6.32-358.23.2.el6.ppc64.  Later kernels such as
-      3.11.7-200.fc19.x86_64 remember the T (stopped) state
-@@ -262,6 +267,15 @@ __libdwfl_ptrace_detach (pid_t tid, bool tid_was_stopped)
-      PTRACE_DETACH.  */
-   ptrace (PTRACE_DETACH, tid, NULL,
- 	  (void *) (intptr_t) (tid_was_stopped ? SIGSTOP : 0));
-+
-+  if (tid_was_stopped)
-+    {
-+      // Wait till the SIGSTOP settles down.
-+      int i;
-+      for (i = 0; i < 100000; i++)
-+	if (linux_proc_pid_is_stopped (tid))
-+	  break;
-+    }
- }
- 
- static void
-diff --git a/libebl/ChangeLog b/libebl/ChangeLog
-index 51ae60f..aee0217 100644
---- a/libebl/ChangeLog
-+++ b/libebl/ChangeLog
-@@ -780,6 +780,11 @@
- 	* Makefile.am (libebl_*_so_SOURCES): Set to $(*_SRCS) so dependency
- 	tracking works right.
- 
-+2005-05-31  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 2005-05-21  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* libebl_x86_64.map: Add x86_64_core_note.
-diff --git a/libelf/ChangeLog b/libelf/ChangeLog
-index 30017cd..9ca9c73 100644
---- a/libelf/ChangeLog
-+++ b/libelf/ChangeLog
-@@ -398,6 +398,11 @@
- 
- 	* elf-knowledge.h (SECTION_STRIP_P): Remove < SHT_NUM check.
- 
-+2011-03-10  Roland McGrath  <roland@redhat.com>
-+
-+	* gnuhash_xlate.h (elf_cvt_gnuhash): Avoid post-increment in bswap_32
-+	argument, since some implementations are buggy macros.
-+
- 2011-02-26  Mark Wielaard  <mjw@redhat.com>
- 
- 	* elf_end.c (elf_end): Call rwlock_unlock before rwlock_fini.
-@@ -1075,6 +1080,11 @@
- 
- 	* elf.h: Update from glibc.
- 
-+2005-05-31  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 2005-05-08  Roland McGrath  <roland@redhat.com>
- 
- 	* elf_begin.c (read_file) [_MUDFLAP]: Don't use mmap for now.
-diff --git a/libelf/common.h b/libelf/common.h
-index 744f1bb..185ea59 100644
---- a/libelf/common.h
-+++ b/libelf/common.h
-@@ -139,7 +139,7 @@ libelf_release_all (Elf *elf)
-   (Var) = (sizeof (Var) == 1						      \
- 	   ? (unsigned char) (Var)					      \
- 	   : (sizeof (Var) == 2						      \
--	      ? bswap_16 (Var)						      \
-+	      ? (unsigned short int) bswap_16 (Var)			      \
- 	      : (sizeof (Var) == 4					      \
- 		 ? bswap_32 (Var)					      \
- 		 : bswap_64 (Var))))
-@@ -148,7 +148,7 @@ libelf_release_all (Elf *elf)
-   (Dst) = (sizeof (Var) == 1						      \
- 	   ? (unsigned char) (Var)					      \
- 	   : (sizeof (Var) == 2						      \
--	      ? bswap_16 (Var)						      \
-+	      ? (unsigned short int) bswap_16 (Var)			      \
- 	      : (sizeof (Var) == 4					      \
- 		 ? bswap_32 (Var)					      \
- 		 : bswap_64 (Var))))
-diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
-index 04d9ca1..3e25936 100644
---- a/libelf/gnuhash_xlate.h
-+++ b/libelf/gnuhash_xlate.h
-@@ -1,5 +1,5 @@
- /* Conversion functions for versioning information.
--   Copyright (C) 2006, 2007 Red Hat, Inc.
-+   Copyright (C) 2006-2011 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2006.
- 
-@@ -69,7 +69,9 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
-   dest32 = (Elf32_Word *) &dest64[bitmask_words];
-   while (len >= 4)
-     {
--      *dest32++ = bswap_32 (*src32++);
-+      *dest32 = bswap_32 (*src32);
-+      ++dest32;
-+      ++src32;
-       len -= 4;
-     }
- }
-diff --git a/src/ChangeLog b/src/ChangeLog
-index 15e6fae..78535c8 100644
---- a/src/ChangeLog
-+++ b/src/ChangeLog
-@@ -1598,8 +1598,16 @@
- 	* readelf.c (attr_callback): Use print_block only when we don't use
- 	print_ops.
- 
-+2009-08-17  Roland McGrath  <roland@redhat.com>
-+
-+	* ld.h: Disable extern inlines for GCC 4.2.
-+
- 2009-08-14  Roland McGrath  <roland@redhat.com>
- 
-+	* strings.c (read_block): Conditionalize posix_fadvise use
-+	on [POSIX_FADV_SEQUENTIAL].
-+	From Petr Salinger <Petr.Salinger@seznam.cz>.
-+
- 	* ar.c (do_oper_extract): Use pathconf instead of statfs.
- 
- 2009-08-01  Ulrich Drepper  <drepper@redhat.com>
-@@ -1763,6 +1771,8 @@
- 	* readelf.c (print_debug_frame_section): Use t instead of j formats
- 	for ptrdiff_t OFFSET.
- 
-+	* addr2line.c (handle_address): Use %a instead of %m for compatibility.
-+
- 2009-01-21  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* elflint.c (check_program_header): Fix typo in .eh_frame_hdr section
-@@ -1946,6 +1956,11 @@
- 	that matches its PT_LOAD's p_flags &~ PF_W.  On sparc, PF_X really
- 	is valid in RELRO.
- 
-+2008-03-01  Roland McGrath  <roland@redhat.com>
-+
-+	* readelf.c (dump_archive_index): Tweak portability hack
-+	to match [__GNUC__ < 4] too.
-+
- 2008-02-29  Roland McGrath  <roland@redhat.com>
- 
- 	* readelf.c (print_attributes): Add a cast.
-@@ -2197,6 +2212,8 @@
- 
- 	* readelf.c (hex_dump): Fix rounding error in whitespace calculation.
- 
-+	* Makefile.am (readelf_no_Werror): New variable.
-+
- 2007-10-15  Roland McGrath  <roland@redhat.com>
- 
- 	* make-debug-archive.in: New file.
-@@ -2636,6 +2653,10 @@
- 	* elflint.c (valid_e_machine): Add EM_ALPHA.
- 	Reported by Christian Aichinger <Greek0@gmx.net>.
- 
-+	* strings.c (map_file): Define POSIX_MADV_SEQUENTIAL to
-+	MADV_SEQUENTIAL if undefined.  	Don't call posix_madvise
-+	if neither is defined.
-+
- 2006-08-08  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* elflint.c (check_dynamic): Don't require DT_HASH for DT_SYMTAB.
-@@ -2712,6 +2733,10 @@
- 	* Makefile.am: Add hacks to create dependency files for non-generic
- 	linker.
- 
-+2006-04-05  Roland McGrath  <roland@redhat.com>
-+
-+	* strings.c (MAP_POPULATE): Define to 0 if undefined.
-+
- 2006-06-12  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* ldgeneric.c (ld_generic_generate_sections): Don't create .interp
-@@ -3060,6 +3085,11 @@
- 	* readelf.c (print_debug_loc_section): Fix indentation for larger
- 	address size.
- 
-+2005-05-31  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 2005-05-30  Roland McGrath  <roland@redhat.com>
- 
- 	* readelf.c (print_debug_line_section): Print section offset of each
-diff --git a/src/Makefile.am b/src/Makefile.am
-index dbac3eb..9028aa1 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -90,6 +90,11 @@ endif
- ldgeneric_no_Wunused = yes
- ldgeneric_no_Wstack_usage = yes
- 
-+# Buggy old compilers or libc headers.
-+readelf_no_Werror = yes
-+strings_no_Werror = yes
-+addr2line_no_Wformat = yes
-+
- # Bad, bad stack usage...
- readelf_no_Wstack_usage = yes
- nm_no_Wstack_usage = yes
-diff --git a/src/addr2line.c b/src/addr2line.c
-index 0ce854f..d2d0c8c 100644
---- a/src/addr2line.c
-+++ b/src/addr2line.c
-@@ -622,10 +622,10 @@ handle_address (const char *string, Dwfl *dwfl)
-       bool parsed = false;
-       int i, j;
-       char *name = NULL;
--      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
-+      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
- 	  && string[i] == '\0')
- 	parsed = adjust_to_section (name, &addr, dwfl);
--      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
-+      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
- 	{
- 	default:
- 	  break;
-diff --git a/src/findtextrel.c b/src/findtextrel.c
-index 264a06b..d7de202 100644
---- a/src/findtextrel.c
-+++ b/src/findtextrel.c
-@@ -502,7 +502,11 @@ ptrcompare (const void *p1, const void *p2)
- 
- 
- static void
--check_rel (size_t nsegments, struct segments segments[nsegments],
-+check_rel (size_t nsegments, struct segments segments[
-+#if __GNUC__ >= 4
-+						      nsegments
-+#endif
-+	   ],
- 	   GElf_Addr addr, Elf *elf, Elf_Scn *symscn, Dwarf *dw,
- 	   const char *fname, bool more_than_one, void **knownsrcs)
- {
-diff --git a/src/ld.h b/src/ld.h
-index 29f4031..8695c31 100644
---- a/src/ld.h
-+++ b/src/ld.h
-@@ -1114,6 +1114,7 @@ extern bool dynamically_linked_p (void);
- 
- /* Checked whether the symbol is undefined and referenced from a DSO.  */
- extern bool linked_from_dso_p (struct scninfo *scninfo, size_t symidx);
-+#if defined __OPTIMIZE__ && !(__GNUC__ == 4 && __GNUC_MINOR__ == 2)
- #ifdef __GNUC_STDC_INLINE__
- __attribute__ ((__gnu_inline__))
- #endif
-@@ -1131,5 +1132,6 @@ linked_from_dso_p (struct scninfo *scninfo, size_t symidx)
- 
-   return sym->defined && sym->in_dso;
- }
-+#endif	/* Optimizing and not GCC 4.2.  */
- 
- #endif	/* ld.h */
-diff --git a/src/readelf.c b/src/readelf.c
-index b4cb3a8..606d220 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -4364,10 +4364,12 @@ listptr_base (struct listptr *p)
-   return base;
- }
- 
-+static const char *listptr_name;
-+
- static int
--compare_listptr (const void *a, const void *b, void *arg)
-+compare_listptr (const void *a, const void *b)
- {
--  const char *name = arg;
-+  const char *const name = listptr_name;
-   struct listptr *p1 = (void *) a;
-   struct listptr *p2 = (void *) b;
- 
-@@ -4463,8 +4465,11 @@ static void
- sort_listptr (struct listptr_table *table, const char *name)
- {
-   if (table->n > 0)
--    qsort_r (table->table, table->n, sizeof table->table[0],
--	     &compare_listptr, (void *) name);
-+    {
-+      listptr_name = name;
-+      qsort (table->table, table->n, sizeof table->table[0],
-+	     &compare_listptr);
-+    }
- }
- 
- static bool
-@@ -9561,7 +9566,7 @@ dump_archive_index (Elf *elf, const char *fname)
- 	  if (unlikely (elf_rand (elf, as_off) == 0)
- 	      || unlikely ((subelf = elf_begin (-1, ELF_C_READ_MMAP, elf))
- 			   == NULL))
--#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7)
-+#if __GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ < 7) || __GNUC__ < 4
- 	    while (1)
- #endif
- 	      error (EXIT_FAILURE, 0,
-diff --git a/src/strings.c b/src/strings.c
-index b2bce7b..fe0ab6c 100644
---- a/src/strings.c
-+++ b/src/strings.c
-@@ -43,6 +43,10 @@
- 
- #include <system.h>
- 
-+#ifndef MAP_POPULATE
-+# define MAP_POPULATE 0
-+#endif
-+
- 
- /* Prototypes of local functions.  */
- static int read_fd (int fd, const char *fname, off64_t fdlen);
-@@ -489,8 +493,13 @@ map_file (int fd, off64_t start_off, off64_t fdlen, size_t *map_sizep)
- 		    fd, start_off);
-       if (mem != MAP_FAILED)
- 	{
-+#if !defined POSIX_MADV_SEQUENTIAL && defined MADV_SEQUENTIAL
-+# define POSIX_MADV_SEQUENTIAL MADV_SEQUENTIAL
-+#endif
-+#ifdef POSIX_MADV_SEQUENTIAL
- 	  /* We will go through the mapping sequentially.  */
- 	  (void) posix_madvise (mem, map_size, POSIX_MADV_SEQUENTIAL);
-+#endif
- 	  break;
- 	}
-       if (errno != EINVAL && errno != ENOMEM)
-@@ -581,9 +590,11 @@ read_block (int fd, const char *fname, off64_t fdlen, off64_t from, off64_t to)
-       elfmap_off = from & ~(ps - 1);
-       elfmap_base = elfmap = map_file (fd, elfmap_off, fdlen, &elfmap_size);
- 
-+#ifdef POSIX_FADV_SEQUENTIAL
-       if (unlikely (elfmap == MAP_FAILED))
- 	/* Let the kernel know we are going to read everything in sequence.  */
- 	(void) posix_fadvise (fd, 0, 0, POSIX_FADV_SEQUENTIAL);
-+#endif
-     }
- 
-   if (unlikely (elfmap == MAP_FAILED))
-diff --git a/src/strip.c b/src/strip.c
-index 5e69334..8bd1790 100644
---- a/src/strip.c
-+++ b/src/strip.c
-@@ -44,6 +44,12 @@
- #include <libebl.h>
- #include <system.h>
- 
-+#ifdef HAVE_FUTIMES
-+# define FUTIMES(fd, fname, tvp) futimes (fd, tvp)
-+#else
-+# define FUTIMES(fd, fname, tvp) utimes (fname, tvp)
-+#endif
-+
- typedef uint8_t GElf_Byte;
- 
- /* Name and version of program.  */
-diff --git a/tests/ChangeLog b/tests/ChangeLog
-index 19878ac..6815028 100644
---- a/tests/ChangeLog
-+++ b/tests/ChangeLog
-@@ -609,6 +609,13 @@
- 
- 2013-12-02  Jan Kratochvil  <jan.kratochvil@redhat.com>
- 
-+	Handle T-stopped detach for old kernels.
-+	* backtrace.c: Include sys/syscall.h.
-+	(linux_proc_pid_is_stopped): New function.
-+	(ptrace_detach_stopped): Handle old kernels.
-+
-+2013-12-02  Jan Kratochvil  <jan.kratochvil@redhat.com>
-+
- 	* Makefile.am (check_PROGRAMS): Add backtrace, backtrace-child,
- 	backtrace-data and backtrace-dwarf.
- 	(BUILT_SOURCES, clean-local, backtrace-child-biarch): New.
-@@ -1473,6 +1480,8 @@
- 
- 2008-01-21  Roland McGrath  <roland@redhat.com>
- 
-+	* line2addr.c (main): Revert last change.
-+
- 	* testfile45.S.bz2: Add tests for cltq, cqto.
- 	* testfile45.expect.bz2: Adjust.
- 
-@@ -2181,6 +2190,11 @@
- 	* Makefile.am (TESTS): Add run-elflint-test.sh.
- 	(EXTRA_DIST): Add run-elflint-test.sh and testfile18.bz2.
- 
-+2005-05-31  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 2005-05-24  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* get-files.c (main): Use correct format specifier.
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 425f8cd..69760a4 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -382,6 +382,7 @@ get_lines_LDADD = $(libdw) $(libelf)
- get_files_LDADD = $(libdw) $(libelf)
- get_aranges_LDADD = $(libdw) $(libelf)
- allfcts_LDADD = $(libdw) $(libelf)
-+line2addr_no_Wformat = yes
- line2addr_LDADD = $(libdw) $(argp_LDADD)
- addrscopes_LDADD = $(libdw) $(argp_LDADD)
- funcscopes_LDADD = $(libdw) $(argp_LDADD)
-diff --git a/tests/backtrace.c b/tests/backtrace.c
-index abd56ab..6a7c661 100644
---- a/tests/backtrace.c
-+++ b/tests/backtrace.c
-@@ -36,6 +36,7 @@
- #include <fcntl.h>
- #include <string.h>
- #include <argp.h>
-+#include <sys/syscall.h>
- #include ELFUTILS_HEADER(dwfl)
- 
- #ifndef __linux__
-diff --git a/tests/line2addr.c b/tests/line2addr.c
-index e0d65d3..7c171b9 100644
---- a/tests/line2addr.c
-+++ b/tests/line2addr.c
-@@ -124,7 +124,7 @@ main (int argc, char *argv[])
-     {
-       struct args a = { .arg = argv[cnt] };
- 
--      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
-+      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
- 	{
- 	default:
- 	case 0:
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
deleted file mode 100644
index c08519c..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From: Kurt Roeckx <kurt@roeckx.be>
-Subject: Use %m[ instead of %a[ in scanf()
-
-%a was a gnu extention, but C99 made this a float.  So it got
-changed to %m (supported by glibc 2.7), but %a[ and %as are
-still supported by glibc.  The portability branch changed this
-from %m to %a again since that's supported by more versions of
-glibc.  However gcc gives a warning about this using -Wformat
-and we have a new enough libc to use %m.
-
-Index: elfutils-0.153/src/addr2line.c
-===================================================================
---- elfutils-0.153.orig/src/addr2line.c	2012-02-24 22:29:50.000000000 +0000
-+++ elfutils-0.153/src/addr2line.c	2012-02-24 22:29:52.000000000 +0000
-@@ -455,10 +455,10 @@
-       bool parsed = false;
-       int i, j;
-       char *name = NULL;
--      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
-+      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
- 	  && string[i] == '\0')
- 	parsed = adjust_to_section (name, &addr, dwfl);
--      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
-+      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
- 	{
- 	default:
- 	  break;
-Index: elfutils-0.153/tests/line2addr.c
-===================================================================
---- elfutils-0.153.orig/tests/line2addr.c	2012-02-24 22:29:50.000000000 +0000
-+++ elfutils-0.153/tests/line2addr.c	2012-02-24 22:29:52.000000000 +0000
-@@ -132,7 +132,7 @@
-     {
-       struct args a = { .arg = argv[cnt] };
- 
--      switch (sscanf (a.arg, "%a[^:]:%d", &a.file, &a.line))
-+      switch (sscanf (a.arg, "%m[^:]:%d", &a.file, &a.line))
- 	{
- 	default:
- 	case 0:
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
deleted file mode 100644
index f1533bf..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 3daec2dd11a04955f95e8f65a48820103d84dbec Mon Sep 17 00:00:00 2001
-From: Junling Zheng <zhengjunling@huawei.com>
-Date: Thu, 9 Apr 2015 12:12:49 +0000
-Subject: [PATCH] uclibc support for elfutils 0.161
-
-on uclibc systems libintl and libuargp are separate from libc.
-so they need to be specified on commandline when we use proxy-libintl
-then libintl is a static archive so it should be listed last since
-elfutils does not respect disable-nls we need to link in libintl
-
-We add a new option --enable-uclibc which will be used to control
-the uclibc specific configurations during build.
-
-Upstream-Status: Inappropriate [uclibc specific]
-
-Signed-off-by: Khem Raj <raj.khem>
-Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
-[Junling Zheng:
- - adjust context
-]
----
- configure.ac       | 8 ++++++++
- libcpu/Makefile.am | 4 ++++
- libdw/Makefile.am  | 7 ++++++-
- libelf/Makefile.am | 5 +++++
- 4 files changed, 23 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a1ad6db..81fc33f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,6 +70,14 @@ AS_IF([test "$use_locks" = yes],
- 
- AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
- 
-+AC_ARG_ENABLE([uclibc],
-+AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
-+use_uclibc=yes, use_uclibc=no)
-+AM_CONDITIONAL(USE_UCLIBC, test "$use_uclibc" = yes)
-+AS_IF([test "$use_uclibc" = yes], [AC_DEFINE(USE_UCLIBC)])
-+
-+AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
-+
- AC_PROG_CC
- AC_PROG_RANLIB
- AC_PROG_YACC
-diff --git a/libcpu/Makefile.am b/libcpu/Makefile.am
-index 3beccf3..9ba6c04 100644
---- a/libcpu/Makefile.am
-+++ b/libcpu/Makefile.am
-@@ -80,6 +80,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i386.mnemonics`"
- i386_lex.o: i386_parse.h
- i386_gendis_LDADD = $(libeu) -lm
- 
-+if USE_UCLIBC
-+i386_gendis_LDADD += -luargp -lintl
-+endif
-+
- i386_parse.h: i386_parse.c ;
- 
- EXTRA_DIST = defs/i386
-diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index 887da6b..d31b428 100644
---- a/libdw/Makefile.am
-+++ b/libdw/Makefile.am
-@@ -102,6 +102,11 @@ endif
- libdw_pic_a_SOURCES =
- am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
- 
-+libdw_so_LDLIBS =
-+if USE_UCLIBC
-+libdw_so_LDLIBS += -lintl -luargp
-+endif
-+
- libdw_so_SOURCES =
- libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
- 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
-@@ -112,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
- 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
- 		-Wl,--version-script,$<,--no-undefined \
- 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl $(zip_LIBS)
-+		-ldl $(zip_LIBS) $(libdw_so_LDLIBS)
- 	@$(textrel_check)
- 	ln -fs $@ $@.$(VERSION)
- 
-diff --git a/libelf/Makefile.am b/libelf/Makefile.am
-index afcb2aa..02836a1 100644
---- a/libelf/Makefile.am
-+++ b/libelf/Makefile.am
-@@ -93,7 +93,12 @@ libelf_a_SOURCES = elf_version.c elf_hash.c elf_error.c elf_fill.c \
- libelf_pic_a_SOURCES =
- am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
- 
-+
- libelf_so_LDLIBS =
-+if USE_UCLIBC
-+libelf_so_LDLIBS += -lintl -luargp
-+endif
-+
- if USE_LOCKS
- libelf_so_LDLIBS += -lpthread
- endif
--- 
-1.8.3.4
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/0001-Ignore-differences-between-mips-machine-identifiers.patch
new file mode 100644
index 0000000..3f110f9
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/0001-Ignore-differences-between-mips-machine-identifiers.patch
@@ -0,0 +1,34 @@
+From 77cb4a53c270d5854d3af24f19547bc3de825233 Mon Sep 17 00:00:00 2001
+From: James Cowgill <james410@cowgill.org.uk>
+Date: Mon, 5 Jan 2015 15:16:58 +0000
+Subject: [PATCH 1/3] Ignore differences between mips machine identifiers
+
+Little endian binaries actually use EM_MIPS so you can't tell the endianness
+from the elf machine id. Also, the EM_MIPS_RS3_LE machine is dead anyway (the
+kernel will not load binaries containing it).
+
+Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+---
+ backends/mips_init.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/backends/mips_init.c b/backends/mips_init.c
+index 7429a89..d10e940 100644
+--- a/backends/mips_init.c
++++ b/backends/mips_init.c
+@@ -46,11 +46,7 @@ mips_init (elf, machine, eh, ehlen)
+     return NULL;
+ 
+   /* We handle it.  */
+-  if (machine == EM_MIPS)
+-    eh->name = "MIPS R3000 big-endian";
+-  else if (machine == EM_MIPS_RS3_LE)
+-    eh->name = "MIPS R3000 little-endian";
+-
++  eh->name = "MIPS";
+   mips_init_reloc (eh);
+   HOOK (eh, reloc_simple_type);
+   HOOK (eh, return_value_location);
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.164/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/0001-fix-a-stack-usage-warning.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.164/0001-fix-a-stack-usage-warning.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/0001-remove-the-unneed-checking.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.164/0001-remove-the-unneed-checking.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
new file mode 100644
index 0000000..72125c9
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
@@ -0,0 +1,168 @@
+From fdaab18a65ed2529656baa64cb6169f34d7e507b Mon Sep 17 00:00:00 2001
+From: James Cowgill <james410@cowgill.org.uk>
+Date: Mon, 5 Jan 2015 15:17:01 +0000
+Subject: [PATCH 2/3] Add support for mips64 abis in mips_retval.c
+
+Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+---
+ backends/mips_retval.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 94 insertions(+), 10 deletions(-)
+
+diff --git a/backends/mips_retval.c b/backends/mips_retval.c
+index 33f12a7..d5c6ef0 100644
+--- a/backends/mips_retval.c
++++ b/backends/mips_retval.c
+@@ -91,6 +91,8 @@ enum mips_abi find_mips_abi(Elf *elf)
+     default:
+       if ((elf_flags & EF_MIPS_ABI2))
+ 	return MIPS_ABI_N32;
++      else if ((ehdr->e_ident[EI_CLASS] == ELFCLASS64))
++	return MIPS_ABI_N64;
+     }
+ 
+   /* GCC creates a pseudo-section whose name describes the ABI.  */
+@@ -195,6 +197,57 @@ static const Dwarf_Op loc_aggregate[] =
+   };
+ #define nloc_aggregate 1
+ 
++/* Test if a struct member is a float */
++static int is_float_child(Dwarf_Die *childdie)
++{
++  /* Test if this is actually a struct member */
++  if (dwarf_tag(childdie) != DW_TAG_member)
++    return 0;
++
++  /* Get type of member */
++  Dwarf_Attribute attr_mem;
++  Dwarf_Die child_type_mem;
++  Dwarf_Die *child_typedie =
++    dwarf_formref_die(dwarf_attr_integrate(childdie,
++                                           DW_AT_type,
++                                           &attr_mem), &child_type_mem);
++
++  if (dwarf_tag(child_typedie) != DW_TAG_base_type)
++    return 0;
++
++  /* Get base subtype */
++  Dwarf_Word encoding;
++  if (dwarf_formudata (dwarf_attr_integrate (child_typedie,
++                                             DW_AT_encoding,
++                                             &attr_mem), &encoding) != 0)
++    return 0;
++
++  return encoding == DW_ATE_float;
++}
++
++/* Returns the number of fpregs which can be returned in the given struct */
++static int get_struct_fpregs(Dwarf_Die *structtypedie)
++{
++  Dwarf_Die child_mem;
++  int fpregs = 0;
++
++  /* Get first structure member */
++  if (dwarf_child(structtypedie, &child_mem) != 0)
++    return 0;
++
++  do
++    {
++      /* Ensure this register is a float */
++      if (!is_float_child(&child_mem))
++        return 0;
++
++      fpregs++;
++    }
++  while (dwarf_siblingof (&child_mem, &child_mem) == 0);
++
++  return fpregs;
++}
++
+ int
+ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ {
+@@ -240,6 +293,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+       tag = dwarf_tag (typedie);
+     }
+ 
++  Dwarf_Word size;
+   switch (tag)
+     {
+     case -1:
+@@ -258,8 +312,6 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+     case DW_TAG_enumeration_type:
+     case DW_TAG_pointer_type:
+     case DW_TAG_ptr_to_member_type:
+-      {
+-        Dwarf_Word size;
+ 	if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
+ 					 &attr_mem), &size) != 0)
+ 	  {
+@@ -289,7 +341,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 		if (size <= 4*regsize && abi == MIPS_ABI_O32)
+                   return nloc_fpregquad;
+ 
+-		goto aggregate;
++		goto large;
+ 	      }
+ 	  }
+ 	*locp = ABI_LOC(loc_intreg, regsize);
+@@ -298,18 +350,50 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 	if (size <= 2*regsize)
+ 	  return nloc_intregpair;
+ 
+-	/* Else fall through. Shouldn't happen though (at least with gcc) */
+-      }
++	/* Else pass in memory. Shouldn't happen though (at least with gcc) */
++	goto large;
+ 
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+     case DW_TAG_union_type:
+-    case DW_TAG_array_type:
+-    aggregate:
+-      /* XXX TODO: Can't handle structure return with other ABI's yet :-/ */
+-      if ((abi != MIPS_ABI_O32) && (abi != MIPS_ABI_O64))
+-        return -2;
++      /* Handle special cases for structures <= 128 bytes in newer ABIs */
++      if (abi == MIPS_ABI_EABI32 || abi == MIPS_ABI_EABI64 ||
++          abi == MIPS_ABI_N32 || abi == MIPS_ABI_N64)
++        {
++          if (dwarf_aggregate_size (typedie, &size) == 0 && size <= 16)
++            {
++              /*
++               * Special case in N64 / N32 -
++               * structures containing only floats are returned in fp regs.
++               * Everything else is returned in integer regs.
++               */
++              if (tag != DW_TAG_union_type &&
++                  (abi == MIPS_ABI_N32 || abi == MIPS_ABI_N64))
++                {
++                  int num_fpregs = get_struct_fpregs(typedie);
++                  if (num_fpregs == 1 || num_fpregs == 2)
++                    {
++                      *locp = loc_fpreg;
++                      if (num_fpregs == 1)
++                        return nloc_fpreg;
++                      else
++                        return nloc_fpregpair;
++                    }
++                }
++
++              *locp = loc_intreg;
++              if (size <= 8)
++                return nloc_intreg;
++              else
++                return nloc_intregpair;
++            }
++        }
++
++      /* Fallthrough to handle large types */
+ 
++    case DW_TAG_array_type:
++    large:
++      /* Return large structures in memory */
+       *locp = loc_aggregate;
+       return nloc_aggregate;
+     }
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/0003-Add-mips-n64-relocation-format-hack.patch
new file mode 100644
index 0000000..14b7985
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/0003-Add-mips-n64-relocation-format-hack.patch
@@ -0,0 +1,226 @@
+From 59d4b8c48e5040af7e02b34eb26ea602ec82a38e Mon Sep 17 00:00:00 2001
+From: James Cowgill <james410@cowgill.org.uk>
+Date: Mon, 5 Jan 2015 15:17:02 +0000
+Subject: [PATCH 3/3] Add mips n64 relocation format hack
+
+MIPSEL N64 ELF files use a slightly different format for storing relocation
+entries which is incompatible with the normal R_SYM / R_INFO macros.
+To workaround this, we rearrange the bytes in the relocation's r_info field
+when reading and writing the relocations.
+
+This patch also ensures that strip.c sets the correct value of e_machine
+before manipulating relocations so that these changes take effect.
+
+Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+---
+ libelf/gelf_getrel.c      | 25 +++++++++++++++++++++++--
+ libelf/gelf_getrela.c     | 25 +++++++++++++++++++++++--
+ libelf/gelf_update_rel.c  | 20 +++++++++++++++++++-
+ libelf/gelf_update_rela.c | 20 +++++++++++++++++++-
+ src/strip.c               | 17 +++++++++++++++++
+ 5 files changed, 101 insertions(+), 6 deletions(-)
+
+Index: elfutils-0.164/libelf/gelf_getrel.c
+===================================================================
+--- elfutils-0.164.orig/libelf/gelf_getrel.c
++++ elfutils-0.164/libelf/gelf_getrel.c
+@@ -36,6 +36,7 @@
+ 
+ #include "libelfP.h"
+ 
++#define EF_MIPS_ABI	0x0000F000
+ 
+ GElf_Rel *
+ gelf_getrel (Elf_Data *data, int ndx, GElf_Rel *dst)
+@@ -89,8 +90,28 @@ gelf_getrel (Elf_Data *data, int ndx, GE
+ 	  result = NULL;
+ 	}
+       else
+-	result = memcpy (dst, &((Elf64_Rel *) data_scn->d.d_buf)[ndx],
+-			 sizeof (Elf64_Rel));
++        {
++          GElf_Ehdr hdr;
++          result = memcpy (dst, &((Elf64_Rel *) data_scn->d.d_buf)[ndx],
++                           sizeof (Elf64_Rel));
++
++          if (gelf_getehdr(scn->elf, &hdr) != NULL &&
++              hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
++              hdr.e_machine == EM_MIPS &&
++              (hdr.e_flags & EF_MIPS_ABI) == 0)
++            {
++              /*
++               * The relocation format is mangled on MIPSEL N64
++               *  We'll adjust it so at least R_SYM will work on it
++               */
++              GElf_Xword r_info = dst->r_info;
++              dst->r_info = (r_info << 32) |
++                            ((r_info >> 8) & 0xFF000000) |
++                            ((r_info >> 24) & 0x00FF0000) |
++                            ((r_info >> 40) & 0x0000FF00) |
++                            ((r_info >> 56) & 0x000000FF);
++            }
++        }
+     }
+ 
+   rwlock_unlock (scn->elf->lock);
+Index: elfutils-0.164/libelf/gelf_getrela.c
+===================================================================
+--- elfutils-0.164.orig/libelf/gelf_getrela.c
++++ elfutils-0.164/libelf/gelf_getrela.c
+@@ -36,6 +36,7 @@
+ 
+ #include "libelfP.h"
+ 
++#define EF_MIPS_ABI	0x0000F000
+ 
+ GElf_Rela *
+ gelf_getrela (Elf_Data *data, int ndx, GElf_Rela *dst)
+@@ -90,8 +91,28 @@ gelf_getrela (Elf_Data *data, int ndx, G
+ 	  result = NULL;
+ 	}
+       else
+-	result = memcpy (dst, &((Elf64_Rela *) data_scn->d.d_buf)[ndx],
+-			 sizeof (Elf64_Rela));
++        {
++          GElf_Ehdr hdr;
++          result = memcpy (dst, &((Elf64_Rela *) data_scn->d.d_buf)[ndx],
++                           sizeof (Elf64_Rela));
++
++          if (gelf_getehdr(scn->elf, &hdr) != NULL &&
++              hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
++              hdr.e_machine == EM_MIPS &&
++              (hdr.e_flags & EF_MIPS_ABI) == 0)
++            {
++              /*
++               * The relocation format is mangled on MIPSEL N64
++               *  We'll adjust it so at least R_SYM will work on it
++               */
++              GElf_Xword r_info = dst->r_info;
++              dst->r_info = (r_info << 32) |
++                            ((r_info >> 8) & 0xFF000000) |
++                            ((r_info >> 24) & 0x00FF0000) |
++                            ((r_info >> 40) & 0x0000FF00) |
++                            ((r_info >> 56) & 0x000000FF);
++            }
++        }
+     }
+ 
+   rwlock_unlock (scn->elf->lock);
+Index: elfutils-0.164/libelf/gelf_update_rel.c
+===================================================================
+--- elfutils-0.164.orig/libelf/gelf_update_rel.c
++++ elfutils-0.164/libelf/gelf_update_rel.c
+@@ -36,6 +36,7 @@
+ 
+ #include "libelfP.h"
+ 
++#define EF_MIPS_ABI	0x0000F000
+ 
+ int
+ gelf_update_rel (Elf_Data *dst, int ndx, GElf_Rel *src)
+@@ -86,6 +87,9 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+     }
+   else
+     {
++      GElf_Ehdr hdr;
++      GElf_Rel value = *src;
++
+       /* Check whether we have to resize the data buffer.  */
+       if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
+ 	{
+@@ -93,7 +97,21 @@ gelf_update_rel (Elf_Data *dst, int ndx,
+ 	  goto out;
+ 	}
+ 
+-      ((Elf64_Rel *) data_scn->d.d_buf)[ndx] = *src;
++      if (gelf_getehdr(scn->elf, &hdr) != NULL &&
++          hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
++          hdr.e_machine == EM_MIPS &&
++          (hdr.e_flags & EF_MIPS_ABI) == 0)
++        {
++          /* Undo the MIPSEL N64 hack from gelf_getrel */
++          GElf_Xword r_info = value.r_info;
++          value.r_info = (r_info >> 32) |
++                         ((r_info << 8) &  0x000000FF00000000) |
++                         ((r_info << 24) & 0x0000FF0000000000) |
++                         ((r_info << 40) & 0x00FF000000000000) |
++                         ((r_info << 56) & 0xFF00000000000000);
++        }
++
++      ((Elf64_Rel *) data_scn->d.d_buf)[ndx] = value;
+     }
+ 
+   result = 1;
+Index: elfutils-0.164/libelf/gelf_update_rela.c
+===================================================================
+--- elfutils-0.164.orig/libelf/gelf_update_rela.c
++++ elfutils-0.164/libelf/gelf_update_rela.c
+@@ -36,6 +36,7 @@
+ 
+ #include "libelfP.h"
+ 
++#define EF_MIPS_ABI	0x0000F000
+ 
+ int
+ gelf_update_rela (Elf_Data *dst, int ndx, GElf_Rela *src)
+@@ -89,6 +90,9 @@ gelf_update_rela (Elf_Data *dst, int ndx
+     }
+   else
+     {
++      GElf_Ehdr hdr;
++      GElf_Rela value = *src;
++
+       /* Check whether we have to resize the data buffer.  */
+       if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
+ 	{
+@@ -96,7 +100,21 @@ gelf_update_rela (Elf_Data *dst, int ndx
+ 	  goto out;
+ 	}
+ 
+-      ((Elf64_Rela *) data_scn->d.d_buf)[ndx] = *src;
++      if (gelf_getehdr(scn->elf, &hdr) != NULL &&
++          hdr.e_ident[EI_DATA] == ELFDATA2LSB &&
++          hdr.e_machine == EM_MIPS &&
++          (hdr.e_flags & EF_MIPS_ABI) == 0)
++        {
++          /* Undo the MIPSEL N64 hack from gelf_getrel */
++          GElf_Xword r_info = value.r_info;
++          value.r_info = (r_info >> 32) |
++                         ((r_info << 8) &  0x000000FF00000000) |
++                         ((r_info << 24) & 0x0000FF0000000000) |
++                         ((r_info << 40) & 0x00FF000000000000) |
++                         ((r_info << 56) & 0xFF00000000000000);
++        }
++
++      ((Elf64_Rela *) data_scn->d.d_buf)[ndx] = value;
+     }
+ 
+   result = 1;
+Index: elfutils-0.164/src/strip.c
+===================================================================
+--- elfutils-0.164.orig/src/strip.c
++++ elfutils-0.164/src/strip.c
+@@ -546,6 +546,23 @@ handle_elf (int fd, Elf *elf, const char
+       goto fail;
+     }
+ 
++  /* Copy identity part of the ELF header now */
++  newehdr = gelf_getehdr (newelf, &newehdr_mem);
++  if (newehdr == NULL)
++    INTERNAL_ERROR (fname);
++
++  memcpy (newehdr->e_ident, ehdr->e_ident, EI_NIDENT);
++  newehdr->e_type = ehdr->e_type;
++  newehdr->e_machine = ehdr->e_machine;
++  newehdr->e_version = ehdr->e_version;
++
++  if (gelf_update_ehdr (newelf, newehdr) == 0)
++    {
++      error (0, 0, gettext ("%s: error while creating ELF header: %s"),
++	     fname, elf_errmsg (-1));
++      return 1;
++    }
++
+   /* Copy over the old program header if needed.  */
+   if (ehdr->e_type != ET_REL)
+     for (cnt = 0; cnt < phnum; ++cnt)
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.164/arm_backend.diff
similarity index 82%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.164/arm_backend.diff
index c97c4e4..9d47f95 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/arm_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/arm_backend.diff
@@ -1,26 +1,8 @@
-From 0db1687eee0b4d16ccbc40db5a06b574fca6614c Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 14 Nov 2014 15:25:42 +0800
-Subject: [PATCH] Rebase arm_backend.diff from 0.159 to 0.160
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/arm_init.c                 |  18 ++++-
- backends/arm_regs.c                 | 132 ++++++++++++++++++++++++++++++++++++
- backends/arm_retval.c               |  44 +++++++++++-
- backends/libebl_arm.h               |   9 +++
- libelf/elf.h                        |  11 +++
- tests/run-addrcfi.sh                |  93 ++++++++++++++++++++++++-
- tests/run-allregs.sh                |  95 +++++++++++++++++++++++++-
- tests/run-readelf-mixed-corenote.sh |  11 ++-
- 8 files changed, 401 insertions(+), 12 deletions(-)
- create mode 100644 backends/libebl_arm.h
-
-diff --git a/backends/arm_init.c b/backends/arm_init.c
-index 3283c97..8b57d3f 100644
---- a/backends/arm_init.c
-+++ b/backends/arm_init.c
-@@ -35,21 +35,32 @@
+Index: elfutils-0.164/backends/arm_init.c
+===================================================================
+--- elfutils-0.164.orig/backends/arm_init.c
++++ elfutils-0.164/backends/arm_init.c
+@@ -35,20 +35,31 @@
  #define RELOC_PREFIX	R_ARM_
  #include "libebl_CPU.h"
  
@@ -31,12 +13,11 @@ index 3283c97..8b57d3f 100644
  
  
  const char *
- arm_init (elf, machine, eh, ehlen)
--     Elf *elf __attribute__ ((unused));
-+     Elf *elf;
-      GElf_Half machine __attribute__ ((unused));
-      Ebl *eh;
-      size_t ehlen;
+-arm_init (Elf *elf __attribute__ ((unused)),
++arm_init (Elf *elf,
+ 	  GElf_Half machine __attribute__ ((unused)),
+ 	  Ebl *eh,
+ 	  size_t ehlen)
  {
 +  int soft_float = 0;
 +
@@ -54,7 +35,7 @@ index 3283c97..8b57d3f 100644
    /* We handle it.  */
    eh->name = "ARM";
    arm_init_reloc (eh);
-@@ -61,7 +72,10 @@ arm_init (elf, machine, eh, ehlen)
+@@ -60,7 +71,10 @@ arm_init (Elf *elf __attribute__ ((unuse
    HOOK (eh, core_note);
    HOOK (eh, auxv_info);
    HOOK (eh, check_object_attribute);
@@ -65,11 +46,11 @@ index 3283c97..8b57d3f 100644
 +    eh->return_value_location = arm_return_value_location_hard;
    HOOK (eh, abi_cfi);
    HOOK (eh, check_reloc_target_type);
- 
-diff --git a/backends/arm_regs.c b/backends/arm_regs.c
-index 21c5ad3..4ee1039 100644
---- a/backends/arm_regs.c
-+++ b/backends/arm_regs.c
+   HOOK (eh, symbol_type_name);
+Index: elfutils-0.164/backends/arm_regs.c
+===================================================================
+--- elfutils-0.164.orig/backends/arm_regs.c
++++ elfutils-0.164/backends/arm_regs.c
 @@ -31,6 +31,7 @@
  #endif
  
@@ -78,7 +59,7 @@ index 21c5ad3..4ee1039 100644
  #include <dwarf.h>
  
  #define BACKEND arm_
-@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
+@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute_
        break;
  
      case 16 + 0 ... 16 + 7:
@@ -88,7 +69,7 @@ index 21c5ad3..4ee1039 100644
        regno += 96 - 16;
        /* Fall through.  */
      case 96 + 0 ... 96 + 7:
-@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
+@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute_
        namelen = 2;
        break;
  
@@ -228,10 +209,10 @@ index 21c5ad3..4ee1039 100644
        *setname = "VFP";
        *type = DW_ATE_float;
        *bits = 64;
-diff --git a/backends/arm_retval.c b/backends/arm_retval.c
-index 7aced74..052132e 100644
---- a/backends/arm_retval.c
-+++ b/backends/arm_retval.c
+Index: elfutils-0.164/backends/arm_retval.c
+===================================================================
+--- elfutils-0.164.orig/backends/arm_retval.c
++++ elfutils-0.164/backends/arm_retval.c
 @@ -48,6 +48,13 @@ static const Dwarf_Op loc_intreg[] =
  #define nloc_intreg	1
  #define nloc_intregs(n)	(2 * (n))
@@ -258,39 +239,37 @@ index 7aced74..052132e 100644
  {
    /* Start with the function's type, and get the DW_AT_type attribute,
       which is the type of the return value.  */
-@@ -98,14 +106,31 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+@@ -98,6 +106,21 @@ arm_return_value_location (Dwarf_Die *fu
  	    else
  	      return -1;
  	  }
 +	if (tag == DW_TAG_base_type)
-+	{
-+	  Dwarf_Word encoding;
-+	  if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
-+	                       &attr_mem), &encoding) != 0)
-+	    return -1;
++	  {
++	    Dwarf_Word encoding;
++	    if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
++				 &attr_mem), &encoding) != 0)
++	      return -1;
 +
-+	  if ((encoding == DW_ATE_float) && !soft_float)
-+	    {
-+	      *locp = loc_fpreg;
-+	      if (size <= 8)
-+		return nloc_fpreg;
-+	      goto aggregate;
-+	    }
-+	}
++	    if ((encoding == DW_ATE_float) && !soft_float)
++	      {
++		*locp = loc_fpreg;
++		if (size <= 8)
++		  return nloc_fpreg;
++		goto aggregate;
++	      }
++	  }
  	if (size <= 16)
  	  {
  	  intreg:
- 	    *locp = loc_intreg;
- 	    return size <= 4 ? nloc_intreg : nloc_intregs ((size + 3) / 4);
+@@ -106,6 +129,7 @@ arm_return_value_location (Dwarf_Die *fu
  	  }
-+	  /* fall through. */
  
        aggregate:
 +	/* XXX TODO sometimes aggregates are returned in r0 (-mabi=aapcs) */
  	*locp = loc_aggregate;
  	return nloc_aggregate;
        }
-@@ -125,3 +150,18 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+@@ -125,3 +149,18 @@ arm_return_value_location (Dwarf_Die *fu
       DWARF and might be valid.  */
    return -2;
  }
@@ -309,26 +288,11 @@ index 7aced74..052132e 100644
 +   return arm_return_value_location_ (functypedie, locp, 0);
 +}
 +
-diff --git a/backends/libebl_arm.h b/backends/libebl_arm.h
-new file mode 100644
-index 0000000..c00770c
---- /dev/null
-+++ b/backends/libebl_arm.h
-@@ -0,0 +1,9 @@
-+#ifndef _LIBEBL_ARM_H
-+#define _LIBEBL_ARM_H 1
-+
-+#include <libdw.h>
-+
-+extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
-+extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
-+
-+#endif
-diff --git a/libelf/elf.h b/libelf/elf.h
-index a3cce3e..0891674 100644
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -2346,6 +2346,9 @@ typedef Elf32_Addr Elf32_Conflict;
+Index: elfutils-0.164/libelf/elf.h
+===================================================================
+--- elfutils-0.164.orig/libelf/elf.h
++++ elfutils-0.164/libelf/elf.h
+@@ -2450,6 +2450,9 @@ enum
  #define EF_ARM_EABI_VER4	0x04000000
  #define EF_ARM_EABI_VER5	0x05000000
  
@@ -338,7 +302,7 @@ index a3cce3e..0891674 100644
  /* Additional symbol types for Thumb.  */
  #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
  #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
-@@ -2363,12 +2366,19 @@ typedef Elf32_Addr Elf32_Conflict;
+@@ -2467,12 +2470,19 @@ enum
  
  /* Processor specific values for the Phdr p_type field.  */
  #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
@@ -358,7 +322,7 @@ index a3cce3e..0891674 100644
  
  /* AArch64 relocs.  */
  
-@@ -2647,6 +2657,7 @@ typedef Elf32_Addr Elf32_Conflict;
+@@ -2765,6 +2775,7 @@ enum
  					   TLS block (LDR, STR).  */
  #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
  					   to GOT origin (LDR).  */
@@ -366,122 +330,25 @@ index a3cce3e..0891674 100644
  #define R_ARM_ME_TOO		128	/* Obsolete.  */
  #define R_ARM_THM_TLS_DESCSEQ	129
  #define R_ARM_THM_TLS_DESCSEQ16	129
-diff --git a/tests/run-addrcfi.sh b/tests/run-addrcfi.sh
-index 5d33246..78464a8 100755
---- a/tests/run-addrcfi.sh
-+++ b/tests/run-addrcfi.sh
-@@ -2530,6 +2530,38 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
- 	FPA reg21 (f5): undefined
- 	FPA reg22 (f6): undefined
- 	FPA reg23 (f7): undefined
-+	VFP reg64 (s0): undefined
-+	VFP reg65 (s1): undefined
-+	VFP reg66 (s2): undefined
-+	VFP reg67 (s3): undefined
-+	VFP reg68 (s4): undefined
-+	VFP reg69 (s5): undefined
-+	VFP reg70 (s6): undefined
-+	VFP reg71 (s7): undefined
-+	VFP reg72 (s8): undefined
-+	VFP reg73 (s9): undefined
-+	VFP reg74 (s10): undefined
-+	VFP reg75 (s11): undefined
-+	VFP reg76 (s12): undefined
-+	VFP reg77 (s13): undefined
-+	VFP reg78 (s14): undefined
-+	VFP reg79 (s15): undefined
-+	VFP reg80 (s16): undefined
-+	VFP reg81 (s17): undefined
-+	VFP reg82 (s18): undefined
-+	VFP reg83 (s19): undefined
-+	VFP reg84 (s20): undefined
-+	VFP reg85 (s21): undefined
-+	VFP reg86 (s22): undefined
-+	VFP reg87 (s23): undefined
-+	VFP reg88 (s24): undefined
-+	VFP reg89 (s25): undefined
-+	VFP reg90 (s26): undefined
-+	VFP reg91 (s27): undefined
-+	VFP reg92 (s28): undefined
-+	VFP reg93 (s29): undefined
-+	VFP reg94 (s30): undefined
-+	VFP reg95 (s31): undefined
- 	FPA reg96 (f0): undefined
- 	FPA reg97 (f1): undefined
- 	FPA reg98 (f2): undefined
-@@ -2538,7 +2570,66 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
- 	FPA reg101 (f5): undefined
- 	FPA reg102 (f6): undefined
- 	FPA reg103 (f7): undefined
--	integer reg128 (spsr): undefined
-+	MMX reg104 (wcgr0): undefined
-+	MMX reg105 (wcgr1): undefined
-+	MMX reg106 (wcgr2): undefined
-+	MMX reg107 (wcgr3): undefined
-+	MMX reg108 (wcgr4): undefined
-+	MMX reg109 (wcgr5): undefined
-+	MMX reg110 (wcgr6): undefined
-+	MMX reg111 (wcgr7): undefined
-+	MMX reg112 (wr0): undefined
-+	MMX reg113 (wr1): undefined
-+	MMX reg114 (wr2): undefined
-+	MMX reg115 (wr3): undefined
-+	MMX reg116 (wr4): undefined
-+	MMX reg117 (wr5): undefined
-+	MMX reg118 (wr6): undefined
-+	MMX reg119 (wr7): undefined
-+	MMX reg120 (wr8): undefined
-+	MMX reg121 (wr9): undefined
-+	MMX reg122 (wr10): undefined
-+	MMX reg123 (wr11): undefined
-+	MMX reg124 (wr12): undefined
-+	MMX reg125 (wr13): undefined
-+	MMX reg126 (wr14): undefined
-+	MMX reg127 (wr15): undefined
-+	state reg128 (spsr): undefined
-+	state reg129 (spsr_fiq): undefined
-+	state reg130 (spsr_irq): undefined
-+	state reg131 (spsr_abt): undefined
-+	state reg132 (spsr_und): undefined
-+	state reg133 (spsr_svc): undefined
-+	integer reg144 (r8_usr): undefined
-+	integer reg145 (r9_usr): undefined
-+	integer reg146 (r10_usr): undefined
-+	integer reg147 (r11_usr): undefined
-+	integer reg148 (r12_usr): undefined
-+	integer reg149 (r13_usr): undefined
-+	integer reg150 (r14_usr): undefined
-+	integer reg151 (r8_fiq): undefined
-+	integer reg152 (r9_fiq): undefined
-+	integer reg153 (r10_fiq): undefined
-+	integer reg154 (r11_fiq): undefined
-+	integer reg155 (r12_fiq): undefined
-+	integer reg156 (r13_fiq): undefined
-+	integer reg157 (r14_fiq): undefined
-+	integer reg158 (r13_irq): undefined
-+	integer reg159 (r14_irq): undefined
-+	integer reg160 (r13_abt): undefined
-+	integer reg161 (r14_abt): undefined
-+	integer reg162 (r13_und): undefined
-+	integer reg163 (r14_und): undefined
-+	integer reg164 (r13_svc): undefined
-+	integer reg165 (r14_svc): undefined
-+	MMX reg192 (wc0): undefined
-+	MMX reg193 (wc1): undefined
-+	MMX reg194 (wc2): undefined
-+	MMX reg195 (wc3): undefined
-+	MMX reg196 (wc4): undefined
-+	MMX reg197 (wc5): undefined
-+	MMX reg198 (wc6): undefined
-+	MMX reg199 (wc7): undefined
- 	VFP reg256 (d0): undefined
- 	VFP reg257 (d1): undefined
- 	VFP reg258 (d2): undefined
-diff --git a/tests/run-allregs.sh b/tests/run-allregs.sh
-index 6f3862e..13557d5 100755
---- a/tests/run-allregs.sh
-+++ b/tests/run-allregs.sh
-@@ -2671,7 +2671,28 @@ integer registers:
+Index: elfutils-0.164/backends/libebl_arm.h
+===================================================================
+--- /dev/null
++++ elfutils-0.164/backends/libebl_arm.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_ARM_H
++#define _LIBEBL_ARM_H 1
++
++#include <libdw.h>
++
++extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
++extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+Index: elfutils-0.164/tests/run-allregs.sh
+===================================================================
+--- elfutils-0.164.orig/tests/run-allregs.sh
++++ elfutils-0.164/tests/run-allregs.sh
+@@ -2672,7 +2672,28 @@ integer registers:
  	 13: sp (sp), address 32 bits
  	 14: lr (lr), address 32 bits
  	 15: pc (pc), address 32 bits
@@ -511,7 +378,7 @@ index 6f3862e..13557d5 100755
  FPA registers:
  	 16: f0 (f0), float 96 bits
  	 17: f1 (f1), float 96 bits
-@@ -2689,7 +2710,72 @@ FPA registers:
+@@ -2690,7 +2711,72 @@ FPA registers:
  	101: f5 (f5), float 96 bits
  	102: f6 (f6), float 96 bits
  	103: f7 (f7), float 96 bits
@@ -584,7 +451,7 @@ index 6f3862e..13557d5 100755
  	256: d0 (d0), float 64 bits
  	257: d1 (d1), float 64 bits
  	258: d2 (d2), float 64 bits
-@@ -2722,6 +2808,13 @@ VFP registers:
+@@ -2723,6 +2809,13 @@ VFP registers:
  	285: d29 (d29), float 64 bits
  	286: d30 (d30), float 64 bits
  	287: d31 (d31), float 64 bits
@@ -598,11 +465,11 @@ index 6f3862e..13557d5 100755
  EOF
  
  # See run-readelf-mixed-corenote.sh for instructions to regenerate
-diff --git a/tests/run-readelf-mixed-corenote.sh b/tests/run-readelf-mixed-corenote.sh
-index 01e4594..9a8a380 100755
---- a/tests/run-readelf-mixed-corenote.sh
-+++ b/tests/run-readelf-mixed-corenote.sh
-@@ -30,12 +30,11 @@ Note segment of 892 bytes at offset 0x274:
+Index: elfutils-0.164/tests/run-readelf-mixed-corenote.sh
+===================================================================
+--- elfutils-0.164.orig/tests/run-readelf-mixed-corenote.sh
++++ elfutils-0.164/tests/run-readelf-mixed-corenote.sh
+@@ -31,12 +31,11 @@ Note segment of 892 bytes at offset 0x27
      pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
      utime: 0.000000, stime: 0.010000, cutime: 0.000000, cstime: 0.000000
      orig_r0: -1, fpvalid: 1
@@ -620,6 +487,114 @@ index 01e4594..9a8a380 100755
    CORE                 124  PRPSINFO
      state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
      uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
--- 
-1.9.1
-
+Index: elfutils-0.164/tests/run-addrcfi.sh
+===================================================================
+--- elfutils-0.164.orig/tests/run-addrcfi.sh
++++ elfutils-0.164/tests/run-addrcfi.sh
+@@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matc
+ 	FPA reg21 (f5): undefined
+ 	FPA reg22 (f6): undefined
+ 	FPA reg23 (f7): undefined
++	VFP reg64 (s0): undefined
++	VFP reg65 (s1): undefined
++	VFP reg66 (s2): undefined
++	VFP reg67 (s3): undefined
++	VFP reg68 (s4): undefined
++	VFP reg69 (s5): undefined
++	VFP reg70 (s6): undefined
++	VFP reg71 (s7): undefined
++	VFP reg72 (s8): undefined
++	VFP reg73 (s9): undefined
++	VFP reg74 (s10): undefined
++	VFP reg75 (s11): undefined
++	VFP reg76 (s12): undefined
++	VFP reg77 (s13): undefined
++	VFP reg78 (s14): undefined
++	VFP reg79 (s15): undefined
++	VFP reg80 (s16): undefined
++	VFP reg81 (s17): undefined
++	VFP reg82 (s18): undefined
++	VFP reg83 (s19): undefined
++	VFP reg84 (s20): undefined
++	VFP reg85 (s21): undefined
++	VFP reg86 (s22): undefined
++	VFP reg87 (s23): undefined
++	VFP reg88 (s24): undefined
++	VFP reg89 (s25): undefined
++	VFP reg90 (s26): undefined
++	VFP reg91 (s27): undefined
++	VFP reg92 (s28): undefined
++	VFP reg93 (s29): undefined
++	VFP reg94 (s30): undefined
++	VFP reg95 (s31): undefined
+ 	FPA reg96 (f0): undefined
+ 	FPA reg97 (f1): undefined
+ 	FPA reg98 (f2): undefined
+@@ -3562,7 +3594,66 @@ dwarf_cfi_addrframe (.eh_frame): no matc
+ 	FPA reg101 (f5): undefined
+ 	FPA reg102 (f6): undefined
+ 	FPA reg103 (f7): undefined
+-	integer reg128 (spsr): undefined
++	MMX reg104 (wcgr0): undefined
++	MMX reg105 (wcgr1): undefined
++	MMX reg106 (wcgr2): undefined
++	MMX reg107 (wcgr3): undefined
++	MMX reg108 (wcgr4): undefined
++	MMX reg109 (wcgr5): undefined
++	MMX reg110 (wcgr6): undefined
++	MMX reg111 (wcgr7): undefined
++	MMX reg112 (wr0): undefined
++	MMX reg113 (wr1): undefined
++	MMX reg114 (wr2): undefined
++	MMX reg115 (wr3): undefined
++	MMX reg116 (wr4): undefined
++	MMX reg117 (wr5): undefined
++	MMX reg118 (wr6): undefined
++	MMX reg119 (wr7): undefined
++	MMX reg120 (wr8): undefined
++	MMX reg121 (wr9): undefined
++	MMX reg122 (wr10): undefined
++	MMX reg123 (wr11): undefined
++	MMX reg124 (wr12): undefined
++	MMX reg125 (wr13): undefined
++	MMX reg126 (wr14): undefined
++	MMX reg127 (wr15): undefined
++	state reg128 (spsr): undefined
++	state reg129 (spsr_fiq): undefined
++	state reg130 (spsr_irq): undefined
++	state reg131 (spsr_abt): undefined
++	state reg132 (spsr_und): undefined
++	state reg133 (spsr_svc): undefined
++	integer reg144 (r8_usr): undefined
++	integer reg145 (r9_usr): undefined
++	integer reg146 (r10_usr): undefined
++	integer reg147 (r11_usr): undefined
++	integer reg148 (r12_usr): undefined
++	integer reg149 (r13_usr): undefined
++	integer reg150 (r14_usr): undefined
++	integer reg151 (r8_fiq): undefined
++	integer reg152 (r9_fiq): undefined
++	integer reg153 (r10_fiq): undefined
++	integer reg154 (r11_fiq): undefined
++	integer reg155 (r12_fiq): undefined
++	integer reg156 (r13_fiq): undefined
++	integer reg157 (r14_fiq): undefined
++	integer reg158 (r13_irq): undefined
++	integer reg159 (r14_irq): undefined
++	integer reg160 (r13_abt): undefined
++	integer reg161 (r14_abt): undefined
++	integer reg162 (r13_und): undefined
++	integer reg163 (r14_und): undefined
++	integer reg164 (r13_svc): undefined
++	integer reg165 (r14_svc): undefined
++	MMX reg192 (wc0): undefined
++	MMX reg193 (wc1): undefined
++	MMX reg194 (wc2): undefined
++	MMX reg195 (wc3): undefined
++	MMX reg196 (wc4): undefined
++	MMX reg197 (wc5): undefined
++	MMX reg198 (wc6): undefined
++	MMX reg199 (wc7): undefined
+ 	VFP reg256 (d0): undefined
+ 	VFP reg257 (d1): undefined
+ 	VFP reg258 (d2): undefined
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.164/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.164/hppa_backend.diff
similarity index 93%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.164/hppa_backend.diff
index d51a720..4545671 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/hppa_backend.diff
@@ -1,8 +1,8 @@
-Index: elfutils-0.158/backends/parisc_init.c
+Index: elfutils-0.164/backends/parisc_init.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/parisc_init.c	2014-04-21 11:12:12.228150280 +0000
-@@ -0,0 +1,74 @@
+--- /dev/null
++++ elfutils-0.164/backends/parisc_init.c
+@@ -0,0 +1,73 @@
 +/* Initialization of PA-RISC specific backend library.
 +   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
 +   This file is part of Red Hat elfutils.
@@ -43,11 +43,10 @@ Index: elfutils-0.158/backends/parisc_init.c
 +
 +
 +const char *
-+parisc_init (elf, machine, eh, ehlen)
-+     Elf *elf __attribute__ ((unused));
-+     GElf_Half machine __attribute__ ((unused));
-+     Ebl *eh;
-+     size_t ehlen;
++parisc_init (Elf *elf __attribute__ ((unused)),
++     GElf_Half machine __attribute__ ((unused)),
++     Ebl *eh,
++     size_t ehlen)
 +{
 +  int pa64 = 0;
 +
@@ -77,10 +76,10 @@ Index: elfutils-0.158/backends/parisc_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.158/backends/parisc_regs.c
+Index: elfutils-0.164/backends/parisc_regs.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/parisc_regs.c	2014-04-21 11:12:12.228150280 +0000
+--- /dev/null
++++ elfutils-0.164/backends/parisc_regs.c
 @@ -0,0 +1,159 @@
 +/* Register names and numbers for PA-RISC DWARF.
 +   Copyright (C) 2005, 2006 Red Hat, Inc.
@@ -241,10 +240,10 @@ Index: elfutils-0.158/backends/parisc_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: elfutils-0.158/backends/parisc_reloc.def
+Index: elfutils-0.164/backends/parisc_reloc.def
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/parisc_reloc.def	2014-04-21 11:12:12.228150280 +0000
+--- /dev/null
++++ elfutils-0.164/backends/parisc_reloc.def
 @@ -0,0 +1,128 @@
 +/* List the relocation types for PA-RISC.  -*- C -*-
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -374,10 +373,10 @@ Index: elfutils-0.158/backends/parisc_reloc.def
 +RELOC_TYPE (TLS_DTPMOD64,	DYN)
 +
 +#define NO_RELATIVE_RELOC       1
-Index: elfutils-0.158/backends/parisc_retval.c
+Index: elfutils-0.164/backends/parisc_retval.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/parisc_retval.c	2014-04-21 11:12:12.228150280 +0000
+--- /dev/null
++++ elfutils-0.164/backends/parisc_retval.c
 @@ -0,0 +1,213 @@
 +/* Function return value location for Linux/PA-RISC ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -592,10 +591,10 @@ Index: elfutils-0.158/backends/parisc_retval.c
 +  return parisc_return_value_location_ (functypedie, locp, 1);
 +}
 +
-Index: elfutils-0.158/backends/parisc_symbol.c
+Index: elfutils-0.164/backends/parisc_symbol.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/parisc_symbol.c	2014-04-21 11:12:12.228150280 +0000
+--- /dev/null
++++ elfutils-0.164/backends/parisc_symbol.c
 @@ -0,0 +1,112 @@
 +/* PA-RISC specific symbolic name handling.
 +   Copyright (C) 2002, 2005 Red Hat, Inc.
@@ -709,10 +708,10 @@ Index: elfutils-0.158/backends/parisc_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.158/backends/libebl_parisc.h
+Index: elfutils-0.164/backends/libebl_parisc.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/libebl_parisc.h	2014-04-21 11:12:12.228150280 +0000
+--- /dev/null
++++ elfutils-0.164/backends/libebl_parisc.h
 @@ -0,0 +1,9 @@
 +#ifndef _LIBEBL_HPPA_H
 +#define _LIBEBL_HPPA_H 1
@@ -723,11 +722,11 @@ Index: elfutils-0.158/backends/libebl_parisc.h
 +extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
 +
 +#endif
-Index: elfutils-0.158/backends/Makefile.am
+Index: elfutils-0.164/backends/Makefile.am
 ===================================================================
---- elfutils-0.158.orig/backends/Makefile.am	2014-04-21 11:12:12.252149737 +0000
-+++ elfutils-0.158/backends/Makefile.am	2014-04-21 11:13:11.910801105 +0000
-@@ -33,11 +33,12 @@
+--- elfutils-0.164.orig/backends/Makefile.am
++++ elfutils-0.164/backends/Makefile.am
+@@ -33,11 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
@@ -742,7 +741,7 @@ Index: elfutils-0.158/backends/Makefile.am
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -116,6 +117,9 @@
+@@ -111,6 +112,9 @@ tilegx_SRCS = tilegx_init.c tilegx_symbo
  libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
  am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
  
@@ -752,11 +751,11 @@ Index: elfutils-0.158/backends/Makefile.am
  
  libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
  	@rm -f $(@:.so=.map)
-Index: elfutils-0.158/libelf/elf.h
+Index: elfutils-0.164/libelf/elf.h
 ===================================================================
---- elfutils-0.158.orig/libelf/elf.h	2014-04-21 11:12:12.252149737 +0000
-+++ elfutils-0.158/libelf/elf.h	2014-04-21 11:12:12.228150280 +0000
-@@ -1814,16 +1814,24 @@
+--- elfutils-0.164.orig/libelf/elf.h
++++ elfutils-0.164/libelf/elf.h
+@@ -1912,16 +1912,24 @@ enum
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -781,7 +780,7 @@ Index: elfutils-0.158/libelf/elf.h
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -1832,6 +1840,7 @@
+@@ -1930,6 +1938,7 @@ enum
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -789,7 +788,7 @@ Index: elfutils-0.158/libelf/elf.h
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -1857,6 +1866,8 @@
+@@ -1955,6 +1964,8 @@ enum
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/kfreebsd_path.patch
new file mode 100644
index 0000000..ba454ee
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/kfreebsd_path.patch
@@ -0,0 +1,15 @@
+--- elfutils/tests/run-native-test.sh.orig
++++ elfutils/tests/run-native-test.sh
+@@ -78,6 +78,12 @@
+   test $native -eq 0 || testrun "$@" -p $native > /dev/null
+ }
+ 
++# On the Debian buildds, GNU/kFreeBSD linprocfs /proc/$PID/maps does
++# not give absolute paths due to sbuild's bind mounts (bug #570805)
++# therefore the next two test programs are expected to fail with
++# "cannot attach to process: Function not implemented".
++[ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
++
+ native_test ${abs_builddir}/allregs
+ native_test ${abs_builddir}/funcretval
+ 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.164/m68k_backend.diff
similarity index 89%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.164/m68k_backend.diff
index f5b566f..d73855b 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/m68k_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/m68k_backend.diff
@@ -6,11 +6,11 @@ Written by Kurt Roeckx, except for the retval support which was written
 by Thorsten Glaser
 
 
-Index: elfutils-0.158/backends/m68k_init.c
+Index: elfutils-0.164/backends/m68k_init.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/m68k_init.c	2014-04-21 11:14:23.813175704 +0000
-@@ -0,0 +1,50 @@
+--- /dev/null
++++ elfutils-0.164/backends/m68k_init.c
+@@ -0,0 +1,49 @@
 +/* Initialization of m68k specific backend library.
 +   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
 +
@@ -42,11 +42,10 @@ Index: elfutils-0.158/backends/m68k_init.c
 +
 +
 +const char *
-+m68k_init (elf, machine, eh, ehlen)
-+     Elf *elf __attribute__ ((unused));
-+     GElf_Half machine __attribute__ ((unused));
-+     Ebl *eh;
-+     size_t ehlen;
++m68k_init (Elf *elf __attribute__ ((unused)),
++     GElf_Half machine __attribute__ ((unused)),
++     Ebl *eh,
++     size_t ehlen)
 +{
 +  /* Check whether the Elf_BH object has a sufficent size.  */
 +  if (ehlen < sizeof (Ebl))
@@ -61,10 +60,10 @@ Index: elfutils-0.158/backends/m68k_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.158/backends/m68k_regs.c
+Index: elfutils-0.164/backends/m68k_regs.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/m68k_regs.c	2014-04-21 11:14:23.813175704 +0000
+--- /dev/null
++++ elfutils-0.164/backends/m68k_regs.c
 @@ -0,0 +1,106 @@
 +/* Register names and numbers for m68k DWARF.
 +   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
@@ -172,10 +171,10 @@ Index: elfutils-0.158/backends/m68k_regs.c
 +	return namelen;
 +}
 +
-Index: elfutils-0.158/backends/m68k_reloc.def
+Index: elfutils-0.164/backends/m68k_reloc.def
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/m68k_reloc.def	2014-04-21 11:14:23.813175704 +0000
+--- /dev/null
++++ elfutils-0.164/backends/m68k_reloc.def
 @@ -0,0 +1,45 @@
 +/* List the relocation types for m68k.  -*- C -*-
 +   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
@@ -222,11 +221,11 @@ Index: elfutils-0.158/backends/m68k_reloc.def
 +RELOC_TYPE (GNU_VTINHERIT,	REL)
 +RELOC_TYPE (GNU_VTENTRY,	REL)
 +
-Index: elfutils-0.158/libelf/elf.h
+Index: elfutils-0.164/libelf/elf.h
 ===================================================================
---- elfutils-0.158.orig/libelf/elf.h	2014-04-21 11:14:23.813175704 +0000
-+++ elfutils-0.158/libelf/elf.h	2014-04-21 11:14:23.813175704 +0000
-@@ -1157,6 +1157,9 @@
+--- elfutils-0.164.orig/libelf/elf.h
++++ elfutils-0.164/libelf/elf.h
+@@ -1158,6 +1158,9 @@ typedef struct
  #define R_68K_GLOB_DAT	20		/* Create GOT entry */
  #define R_68K_JMP_SLOT	21		/* Create PLT entry */
  #define R_68K_RELATIVE	22		/* Adjust by program base */
@@ -236,11 +235,11 @@ Index: elfutils-0.158/libelf/elf.h
  #define R_68K_TLS_GD32      25          /* 32 bit GOT offset for GD */
  #define R_68K_TLS_GD16      26          /* 16 bit GOT offset for GD */
  #define R_68K_TLS_GD8       27          /* 8 bit GOT offset for GD */
-Index: elfutils-0.158/backends/Makefile.am
+Index: elfutils-0.164/backends/Makefile.am
 ===================================================================
---- elfutils-0.158.orig/backends/Makefile.am	2014-04-21 11:14:23.813175704 +0000
-+++ elfutils-0.158/backends/Makefile.am	2014-04-21 11:14:48.344621167 +0000
-@@ -33,12 +33,12 @@
+--- elfutils-0.164.orig/backends/Makefile.am
++++ elfutils-0.164/backends/Makefile.am
+@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
@@ -255,7 +254,7 @@ Index: elfutils-0.158/backends/Makefile.am
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -125,6 +125,10 @@
+@@ -120,6 +120,10 @@ mips_SRCS = mips_init.c mips_symbol.c mi
  libebl_mips_pic_a_SOURCES = $(mips_SRCS)
  am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
  
@@ -265,11 +264,11 @@ Index: elfutils-0.158/backends/Makefile.am
 +
  libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
  	@rm -f $(@:.so=.map)
- 	echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
-Index: elfutils-0.158/backends/m68k_symbol.c
+ 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+Index: elfutils-0.164/backends/m68k_symbol.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/m68k_symbol.c	2014-04-21 11:14:23.813175704 +0000
+--- /dev/null
++++ elfutils-0.164/backends/m68k_symbol.c
 @@ -0,0 +1,43 @@
 +/* m68k specific symbolic name handling.
 +   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
@@ -314,10 +313,10 @@ Index: elfutils-0.158/backends/m68k_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.158/backends/m68k_retval.c
+Index: elfutils-0.164/backends/m68k_retval.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/m68k_retval.c	2014-04-21 11:14:23.813175704 +0000
+--- /dev/null
++++ elfutils-0.164/backends/m68k_retval.c
 @@ -0,0 +1,172 @@
 +/* Function return value location for Linux/m68k ABI.
 +   Copyright (C) 2005-2010 Red Hat, Inc.
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.164/mips_backend.diff
similarity index 92%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.164/mips_backend.diff
index d73a3f2..de1237b 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/mips_backend.diff
@@ -1,8 +1,8 @@
-Index: elfutils-0.158/backends/mips_init.c
+Index: elfutils-0.164/backends/mips_init.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/mips_init.c	2014-04-21 11:13:36.910235965 +0000
-@@ -0,0 +1,60 @@
+--- /dev/null
++++ elfutils-0.164/backends/mips_init.c
+@@ -0,0 +1,59 @@
 +/* Initialization of mips specific backend library.
 +   Copyright (C) 2006 Red Hat, Inc.
 +   This file is part of Red Hat elfutils.
@@ -40,11 +40,10 @@ Index: elfutils-0.158/backends/mips_init.c
 +#include "common-reloc.c"
 +
 +const char *
-+mips_init (elf, machine, eh, ehlen)
-+     Elf *elf __attribute__ ((unused));
-+     GElf_Half machine __attribute__ ((unused));
-+     Ebl *eh;
-+     size_t ehlen;
++mips_init (Elf *elf __attribute__ ((unused)),
++     GElf_Half machine __attribute__ ((unused)),
++     Ebl *eh,
++     size_t ehlen)
 +{
 +  /* Check whether the Elf_BH object has a sufficent size.  */
 +  if (ehlen < sizeof (Ebl))
@@ -63,10 +62,10 @@ Index: elfutils-0.158/backends/mips_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.158/backends/mips_regs.c
+Index: elfutils-0.164/backends/mips_regs.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/mips_regs.c	2014-04-21 11:13:36.910235965 +0000
+--- /dev/null
++++ elfutils-0.164/backends/mips_regs.c
 @@ -0,0 +1,104 @@
 +/* Register names and numbers for MIPS DWARF.
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -172,10 +171,10 @@ Index: elfutils-0.158/backends/mips_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: elfutils-0.158/backends/mips_reloc.def
+Index: elfutils-0.164/backends/mips_reloc.def
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/mips_reloc.def	2014-04-21 11:13:36.910235965 +0000
+--- /dev/null
++++ elfutils-0.164/backends/mips_reloc.def
 @@ -0,0 +1,79 @@
 +/* List the relocation types for mips.  -*- C -*-
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -256,10 +255,10 @@ Index: elfutils-0.158/backends/mips_reloc.def
 +
 +#define NO_COPY_RELOC 1
 +#define NO_RELATIVE_RELOC 1
-Index: elfutils-0.158/backends/mips_retval.c
+Index: elfutils-0.164/backends/mips_retval.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/mips_retval.c	2014-04-21 11:13:36.910235965 +0000
+--- /dev/null
++++ elfutils-0.164/backends/mips_retval.c
 @@ -0,0 +1,321 @@
 +/* Function return value location for Linux/mips ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -582,10 +581,10 @@ Index: elfutils-0.158/backends/mips_retval.c
 +     DWARF and might be valid.  */
 +  return -2;
 +}
-Index: elfutils-0.158/backends/mips_symbol.c
+Index: elfutils-0.164/backends/mips_symbol.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/mips_symbol.c	2014-04-21 11:13:36.910235965 +0000
+--- /dev/null
++++ elfutils-0.164/backends/mips_symbol.c
 @@ -0,0 +1,52 @@
 +/* MIPS specific symbolic name handling.
 +   Copyright (C) 2002, 2003, 2005 Red Hat, Inc.
@@ -639,11 +638,11 @@ Index: elfutils-0.158/backends/mips_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.158/libebl/eblopenbackend.c
+Index: elfutils-0.164/libebl/eblopenbackend.c
 ===================================================================
---- elfutils-0.158.orig/libebl/eblopenbackend.c	2014-04-21 11:13:36.914235875 +0000
-+++ elfutils-0.158/libebl/eblopenbackend.c	2014-04-21 11:13:36.910235965 +0000
-@@ -71,6 +71,8 @@
+--- elfutils-0.164.orig/libebl/eblopenbackend.c
++++ elfutils-0.164/libebl/eblopenbackend.c
+@@ -71,6 +71,8 @@ static const struct
    { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
    { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
    { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
@@ -652,11 +651,11 @@ Index: elfutils-0.158/libebl/eblopenbackend.c
  
    { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
    { "m68k", "elf_m68k", "m68k", 4, EM_68K, 0, 0 },
-Index: elfutils-0.158/backends/common-reloc.c
+Index: elfutils-0.164/backends/common-reloc.c
 ===================================================================
---- elfutils-0.158.orig/backends/common-reloc.c	2014-04-21 11:13:36.914235875 +0000
-+++ elfutils-0.158/backends/common-reloc.c	2014-04-21 11:13:36.910235965 +0000
-@@ -112,11 +112,13 @@
+--- elfutils-0.164.orig/backends/common-reloc.c
++++ elfutils-0.164/backends/common-reloc.c
+@@ -125,11 +125,13 @@ EBLHOOK(reloc_valid_use) (Elf *elf, int
  }
  
  
@@ -670,7 +669,7 @@ Index: elfutils-0.158/backends/common-reloc.c
  
  bool
  EBLHOOK(none_reloc_p) (int reloc)
-@@ -138,7 +140,9 @@
+@@ -151,7 +153,9 @@ EBLHOOK(init_reloc) (Ebl *ebl)
    ebl->reloc_type_name = EBLHOOK(reloc_type_name);
    ebl->reloc_type_check = EBLHOOK(reloc_type_check);
    ebl->reloc_valid_use = EBLHOOK(reloc_valid_use);
@@ -680,11 +679,11 @@ Index: elfutils-0.158/backends/common-reloc.c
    ebl->none_reloc_p = EBLHOOK(none_reloc_p);
  #ifndef NO_RELATIVE_RELOC
    ebl->relative_reloc_p = EBLHOOK(relative_reloc_p);
-Index: elfutils-0.158/backends/Makefile.am
+Index: elfutils-0.164/backends/Makefile.am
 ===================================================================
---- elfutils-0.158.orig/backends/Makefile.am	2014-04-21 11:13:36.914235875 +0000
-+++ elfutils-0.158/backends/Makefile.am	2014-04-21 11:14:10.841468934 +0000
-@@ -33,12 +33,12 @@
+--- elfutils-0.164.orig/backends/Makefile.am
++++ elfutils-0.164/backends/Makefile.am
+@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
@@ -699,7 +698,7 @@ Index: elfutils-0.158/backends/Makefile.am
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -121,6 +121,10 @@
+@@ -116,6 +116,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
  libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
  am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
  
@@ -709,4 +708,4 @@ Index: elfutils-0.158/backends/Makefile.am
 +
  libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
  	@rm -f $(@:.so=.map)
- 	echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+ 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.164/mips_readelf_w.patch
similarity index 75%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.164/mips_readelf_w.patch
index 8e669e7..930d6f6 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/mips_readelf_w.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.164/mips_readelf_w.patch
@@ -6,11 +6,11 @@ Forwarded: not-needed
 Upstreams wants a change where this is handled by a hook that needs
 to be filled in by the backend for the arch.
 
-Index: elfutils-0.153/src/readelf.c
+Index: elfutils-0.164/src/readelf.c
 ===================================================================
---- elfutils-0.153.orig/src/readelf.c	2012-08-10 22:01:55.000000000 +0200
-+++ elfutils-0.153/src/readelf.c	2012-09-18 21:46:27.000000000 +0200
-@@ -7364,7 +7364,8 @@
+--- elfutils-0.164.orig/src/readelf.c
++++ elfutils-0.164/src/readelf.c
+@@ -8218,7 +8218,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *
        GElf_Shdr shdr_mem;
        GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
  
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.164/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.163/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.164/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.163.bb b/meta/recipes-devtools/elfutils/elfutils_0.164.bb
similarity index 87%
rename from meta/recipes-devtools/elfutils/elfutils_0.163.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.164.bb
index e391813..c27635d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.163.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.164.bb
@@ -7,8 +7,8 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "77ce87f259987d2e54e4d87b86cbee41"
-SRC_URI[sha256sum] = "7c774f1eef329309f3b05e730bdac50013155d437518a2ec0e24871d312f2e23"
+SRC_URI[md5sum] = "2e4536c1c48034f188a80789a59114d8"
+SRC_URI[sha256sum] = "9683c025928a12d06b7fe812928aa6235249e22d197d086f7084606a48165900"
 
 SRC_URI += "\
         file://mempcpy.patch \
@@ -21,19 +21,18 @@ SRC_URI += "\
 "
 
 # pick the patch from debian
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.159-4.debian.tar.xz
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.164-1.debian.tar.xz
 SRC_URI += "\
-        file://redhat-portability.diff \
         file://hppa_backend.diff \
         file://arm_backend.diff \
         file://mips_backend.diff \
         file://m68k_backend.diff \
         file://testsuite-ignore-elflint.diff \
-        file://scanf-format.patch \
         file://mips_readelf_w.patch \
-        file://arm_func_value.patch \
-        file://arm_unwind_ret_mask.patch \
-        file://non_linux.patch \
+        file://kfreebsd_path.patch \
+        file://0001-Ignore-differences-between-mips-machine-identifiers.patch \
+        file://0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
+        file://0003-Add-mips-n64-relocation-format-hack.patch \
 "
 
 # Only apply when building uclibc based target recipe
-- 
1.9.1


