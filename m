Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6C0A65DAF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:01:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s61K1H8F009709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 13:01:17 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Jul 2014 13:01:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:01:10 -0500
Message-ID: <830a2b7d3ec4e8560591f4804034b0fd13abb6fd.1404244287.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1404244287.git.mark.hatle@windriver.com>
References: <cover.1404244287.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] rpm: Upgrade to 5.4.14
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
X-List-Received-Date: Tue, 01 Jul 2014 20:01:23 -0000
Content-Type: text/plain

Update various patches.  A few corrections to the patch descriptions,
otherwise simple quilt refresh or conflict resolution.

Remove rpm-solvedb.patch and rpm-respect-arch.patch.  These are both related
to the old solvedb package dependency solver.  This is no longer used since
we moved to smartpm.

rpm-stub-out-git_strerror was a backport and is no longer needed.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/dbconvert.patch      | 24 ++++----
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch | 19 +++---
 ...debugedit-valid-file-to-fix-segment-fault.patch | 14 ++---
 .../rpm/rpm/fstack-protector-configure-check.patch |  8 +--
 .../rpm/rpm/header-include-fix.patch               | 16 +++---
 .../rpm/rpm/makefile-am-exec-hook.patch            |  8 ++-
 .../rpm/rpm/python-rpm-rpmsense.patch              |  6 +-
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |  8 +--
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  | 14 ++---
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch  |  6 +-
 .../rpm/rpm/rpm-db_buffer_small.patch              | 18 +++---
 .../rpm/rpm/rpm-debug-platform.patch               | 14 ++---
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch  | 12 ++--
 .../rpm/rpm/rpm-hardlink-segfault-fix.patch        | 10 ++--
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch | 12 ++--
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch | 10 ++--
 .../rpm/rpm/rpm-lsb-compatibility.patch            |  8 +--
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        | 18 +++---
 meta/recipes-devtools/rpm/rpm/rpm-macros.patch     | 19 +++---
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |  9 +--
 .../rpm/rpm/rpm-no-perl-urpm.patch                 |  8 ++-
 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |  9 +--
 .../rpm/rpm/rpm-packageorigin.patch                |  8 +--
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     | 30 +++++-----
 .../rpm/rpm/rpm-pkgconfigdeps.patch                | 11 ++--
 .../rpm/rpm/rpm-platform-file-fix.patch            | 12 ++--
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   | 39 +++++++------
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  | 22 +++----
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |  8 +--
 .../rpm/rpm/rpm-reloc-macros.patch                 |  6 +-
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |  8 +--
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch | 10 ++--
 .../rpm/rpm/rpm-respect-arch.patch                 | 67 ----------------------
 .../rpm/rpm/rpm-scriptletexechelper.patch          | 20 +++----
 meta/recipes-devtools/rpm/rpm/rpm-showrc.patch     |  9 +--
 meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch    | 31 ----------
 .../rpm/rpm/rpm-stub-out-git_strerror.patch        | 60 -------------------
 .../rpm-tag-generate-endian-conversion-fix.patch   |  7 ++-
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          | 10 ++--
 .../rpm/rpm/rpm-uuid-include.patch                 | 15 +++--
 .../rpm/rpm/rpm-verify-files.patch                 |  8 +--
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        | 26 ++++-----
 meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch | 14 ++---
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch | 36 ++++++------
 .../rpm/{rpm_5.4.9.bb => rpm_5.4.14.bb}            | 19 +++---
 45 files changed, 304 insertions(+), 442 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.9.bb => rpm_5.4.14.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
index 27dba8c..78de7d9 100644
--- a/meta/recipes-devtools/rpm/rpm/dbconvert.patch
+++ b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
@@ -3,20 +3,20 @@ Upstream-Status: Not applicable
 Hack to prevent unneeded demo app from building on older libc
 where it will break the build
 
-Index: rpm-5.4.9/tools/Makefile.am
+Index: rpm-5.4.14/tools/Makefile.am
 ===================================================================
---- rpm-5.4.9.orig/tools/Makefile.am
-+++ rpm-5.4.9/tools/Makefile.am
-@@ -24,7 +24,7 @@ AM_CFLAGS = $(OPENMP_CFLAGS)
+--- rpm-5.4.14.orig/tools/Makefile.am
++++ rpm-5.4.14/tools/Makefile.am
+@@ -29,7 +29,7 @@ EXTRA_PROGRAMS = nix-copy-closure nix-en
+ 	xiu-instantiate xiu-store
+ noinst_PROGRAMS =
  
- EXTRA_DIST =	hashtab.h bsdiff.1 bspatch.1 dotgraph.hh
- 
--EXTRA_PROGRAMS = augtool cudftool dbconvert debugedit \
-+EXTRA_PROGRAMS = augtool cudftool debugedit \
- 	nix-build nix-channel nix-collect-garbage nix-copy-closure \
- 	nix-env nix-hash nix-install-package nix-instantiate \
- 	nix-log2xml nix-prefetch-url nix-pull nix-push nix-store nix-worker \
-@@ -60,7 +60,7 @@ pkgbin_PROGRAMS =	\
+-EXTRA_PROGRAMS += augtool cudftool dbconvert debugedit \
++EXTRA_PROGRAMS += augtool cudftool debugedit \
+ 	nix-build nix-channel nix-collect-garbage \
+ 	nix-log2xml nix-prefetch-url nix-pull nix-push \
+ 	xiu-echo xiu-hash \
+@@ -64,7 +64,7 @@ pkgbin_PROGRAMS =	\
  	rpmcache rpmdigest rpmrepo rpmspecdump \
  	rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
  if WITH_DB
diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
index 74efe65..beef5ed 100644
--- a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
@@ -15,11 +15,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/tools/debugedit.c
+Index: rpm-5.4.14/tools/debugedit.c
 ===================================================================
---- rpm-5.4.9.orig/tools/debugedit.c
-+++ rpm-5.4.9/tools/debugedit.c
-@@ -1432,21 +1432,24 @@ handle_build_id (DSO *dso, Elf_Data *bui
+--- rpm-5.4.14.orig/tools/debugedit.c
++++ rpm-5.4.14/tools/debugedit.c
+@@ -1445,21 +1445,24 @@ handle_build_id (DSO *dso, Elf_Data *bui
      auto inline void process (const void *data, size_t size)
      {
        memchunk chunk = { .data = (void *) data, .size = size };
@@ -34,16 +34,15 @@ Index: rpm-5.4.9/tools/debugedit.c
        GElf_Shdr shdr;
 -    } u;
 -    Elf_Data x = { .d_version = EV_CURRENT, .d_buf = &u };
--
++    } u1, u2;
++    Elf_Data src  = { .d_version = EV_CURRENT, .d_buf = &u1 };
++    Elf_Data dest = { .d_version = EV_CURRENT, .d_buf = &u2 };
+ 
 -    x.d_type = ELF_T_EHDR;
 -    x.d_size = sizeof u.ehdr;
 -    u.ehdr = dso->ehdr;
 -    u.ehdr.e_phoff = u.ehdr.e_shoff = 0;
 -    if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
-+    } u1, u2;
-+    Elf_Data src  = { .d_version = EV_CURRENT, .d_buf = &u1 };
-+    Elf_Data dest = { .d_version = EV_CURRENT, .d_buf = &u2 };
-+
 +    src.d_type = ELF_T_EHDR;
 +    src.d_size = sizeof u1.ehdr;
 +    dest.d_size = sizeof u2.ehdr;
@@ -53,7 +52,7 @@ Index: rpm-5.4.9/tools/debugedit.c
        {
        bad:
  	fprintf (stderr, "Failed to compute header checksum: %s\n",
-@@ -1454,29 +1457,31 @@ handle_build_id (DSO *dso, Elf_Data *bui
+@@ -1467,29 +1470,31 @@ handle_build_id (DSO *dso, Elf_Data *bui
  	exit (1);
        }
  
diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch b/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
index 2696cd3..f7c3100 100644
--- a/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
@@ -20,10 +20,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  tools/debugedit.c | 25 +++++++++++++++++++++++++
  1 file changed, 25 insertions(+)
 
-diff --git a/tools/debugedit.c b/tools/debugedit.c
---- a/tools/debugedit.c
-+++ b/tools/debugedit.c
-@@ -1512,6 +1512,28 @@ handle_build_id (DSO *dso, Elf_Data *build_id,
+Index: rpm-5.4.14/tools/debugedit.c
+===================================================================
+--- rpm-5.4.14.orig/tools/debugedit.c
++++ rpm-5.4.14/tools/debugedit.c
+@@ -1525,6 +1525,28 @@ handle_build_id (DSO *dso, Elf_Data *bui
    }
  }
  
@@ -52,7 +53,7 @@ diff --git a/tools/debugedit.c b/tools/debugedit.c
  int
  main (int argc, char *argv[])
  {
-@@ -1608,6 +1630,9 @@ main (int argc, char *argv[])
+@@ -1621,6 +1643,9 @@ main (int argc, char *argv[])
        exit (1);
      }
  
@@ -62,6 +63,3 @@ diff --git a/tools/debugedit.c b/tools/debugedit.c
    dso = fdopen_dso (fd, file);
    if (dso == NULL)
      exit (1);
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
index 0474c65..976af48 100644
--- a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
+++ b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
@@ -6,11 +6,11 @@ Therefore we change the compile only check to compile and link check
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: rpm-5.4.0/configure.ac
+Index: rpm-5.4.14/configure.ac
 ===================================================================
---- rpm-5.4.0.orig/configure.ac	2012-06-01 11:41:19.741480143 -0700
-+++ rpm-5.4.0/configure.ac	2012-06-01 11:41:51.773481676 -0700
-@@ -193,7 +193,7 @@
+--- rpm-5.4.14.orig/configure.ac
++++ rpm-5.4.14/configure.ac
+@@ -201,7 +201,7 @@ dnl # GNU GCC (usually "gcc")
   my_save_cflags="$CFLAGS"
   CFLAGS=$c
   AC_MSG_CHECKING([whether GCC supports $c])
diff --git a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
index 6aa072d..5ffb187 100644
--- a/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/header-include-fix.patch
@@ -1,9 +1,9 @@
 Upstream-Status: Pending
 
-diff --git a/rpmdb/rpmdb.h b/rpmdb/rpmdb.h
-index 0e1bdd7..8b522bb 100644
---- a/rpmdb/rpmdb.h
-+++ b/rpmdb/rpmdb.h
+Index: rpm-5.4.14/rpmdb/rpmdb.h
+===================================================================
+--- rpm-5.4.14.orig/rpmdb/rpmdb.h
++++ rpm-5.4.14/rpmdb/rpmdb.h
 @@ -9,6 +9,7 @@
  
  #include <assert.h>
@@ -12,10 +12,10 @@ index 0e1bdd7..8b522bb 100644
  
  #include <rpmtypes.h>
  #include <rpmtag.h>	/* XXX Header typedef */
-diff --git a/rpmdb/rpmtag.h b/rpmdb/rpmtag.h
-index 8af6480..2166b4c 100644
---- a/rpmdb/rpmtag.h
-+++ b/rpmdb/rpmtag.h
+Index: rpm-5.4.14/rpmdb/rpmtag.h
+===================================================================
+--- rpm-5.4.14.orig/rpmdb/rpmtag.h
++++ rpm-5.4.14/rpmdb/rpmtag.h
 @@ -7,6 +7,7 @@
  
  #include <rpmiotypes.h>
diff --git a/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch b/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
index 12f85b7..8fab9eb 100644
--- a/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
+++ b/meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
@@ -18,9 +18,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Morgan Little <morgan.little@windriver.com>
 
---- a/lua/Makefile.am.orig
-+++ b/lua/Makefile.am
-@@ -320,7 +320,7 @@
+Index: rpm-5.4.14/lua/Makefile.am
+===================================================================
+--- rpm-5.4.14.orig/lua/Makefile.am
++++ rpm-5.4.14/lua/Makefile.am
+@@ -326,7 +326,7 @@ clean-local:
  # XXX Build & install as rpmlua/rpmluac with hardlinks to lua/luac post install.
  # XXX CVS has lua/luac sub-directories in the Attic that collide with the
  # XXX lua/luac executable names when using cvs update.
diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
index c1fab3e..a538a60 100644
--- a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
+++ b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
@@ -8,10 +8,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/python/rpmmodule.c
+Index: rpm-5.4.14/python/rpmmodule.c
 ===================================================================
---- rpm-5.4.9.orig/python/rpmmodule.c
-+++ rpm-5.4.9/python/rpmmodule.c
+--- rpm-5.4.14.orig/python/rpmmodule.c
++++ rpm-5.4.14/python/rpmmodule.c
 @@ -494,12 +494,16 @@ void init_rpm(void)
      REGISTER_ENUM(RPMSENSE_EQUAL);
      REGISTER_ENUM(RPMSENSE_NOTEQUAL);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch b/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
index 5129833..8771235 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
@@ -2,14 +2,14 @@ Remove the sanity checking from the rpm autogen.sh.  This is required because
 we may have slightly different, but yet compatible versions.  If we do end
 up breaking things, we'll deal with it at that time.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.8/syck/autogen.sh
+Index: rpm-5.4.14/syck/autogen.sh
 ===================================================================
---- rpm-5.4.8.orig/syck/autogen.sh
-+++ rpm-5.4.8/syck/autogen.sh
+--- rpm-5.4.14.orig/syck/autogen.sh
++++ rpm-5.4.14/syck/autogen.sh
 @@ -34,12 +34,6 @@ libtoolize () {
      eval $_libtoolize $_libtoolize_args
  }
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
index 3aac116..41ab498 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
@@ -18,11 +18,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.0/lib/rpmrc.c
+Index: rpm-5.4.14/lib/rpmrc.c
 ===================================================================
---- rpm-5.4.0.orig/lib/rpmrc.c	2011-08-10 17:04:35.798814821 -0500
-+++ rpm-5.4.0/lib/rpmrc.c	2011-08-10 17:33:51.505871895 -0500
-@@ -916,8 +916,8 @@
+--- rpm-5.4.14.orig/lib/rpmrc.c
++++ rpm-5.4.14/lib/rpmrc.c
+@@ -925,8 +925,8 @@ static void getMachineInfo(int type, /*@
  
  static void rpmRebuildTargetVars(const char ** target, const char ** canontarget)
  {
@@ -33,7 +33,7 @@ Index: rpm-5.4.0/lib/rpmrc.c
      int x;
  
      /* Rebuild the compat table to recalculate the current target arch.  */
-@@ -927,23 +927,60 @@
+@@ -936,23 +936,60 @@ static void rpmRebuildTargetVars(const c
      rpmSetTables(RPM_MACHTABLE_BUILDARCH, RPM_MACHTABLE_BUILDOS);
  
      if (target && *target) {
@@ -104,7 +104,7 @@ Index: rpm-5.4.0/lib/rpmrc.c
  	}
      } else {
  	const char *a = NULL;
-@@ -988,8 +1025,16 @@
+@@ -995,8 +1032,16 @@ static void rpmRebuildTargetVars(const c
      addMacro(NULL, "_target", NULL, ct, RMIL_RPMRC);
      delMacro(NULL, "_target_cpu");
      addMacro(NULL, "_target_cpu", NULL, ca, RMIL_RPMRC);
@@ -121,7 +121,7 @@ Index: rpm-5.4.0/lib/rpmrc.c
  
      if (canontarget)
  	*canontarget = ct;
-@@ -997,8 +1041,12 @@
+@@ -1004,8 +1049,12 @@ static void rpmRebuildTargetVars(const c
  	ct = _free(ct);
      ca = _free(ca);
      /*@-usereleased@*/
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch b/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
index d9b4e33..c869376 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
@@ -4,10 +4,10 @@ Change cache size to reduce the usage of disk space from 62MB to 26MB.
 
 Signed-off-by: Mei Lei <lei.mei@intel.com>
 
-Index: rpm-5.4.8/rpmdb/DB_CONFIG.in
+Index: rpm-5.4.14/rpmdb/DB_CONFIG.in
 ===================================================================
---- rpm-5.4.8.orig/rpmdb/DB_CONFIG.in
-+++ rpm-5.4.8/rpmdb/DB_CONFIG.in
+--- rpm-5.4.14.orig/rpmdb/DB_CONFIG.in
++++ rpm-5.4.14/rpmdb/DB_CONFIG.in
 @@ -29,7 +29,7 @@ set_thread_count 64
  
  # ================ Memory Pool
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch b/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
index 59022f4..16b8e30 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
@@ -18,11 +18,11 @@ Upstream-Status: Inappropriate (workaround)
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/rpmdb/rpmdb.c
+Index: rpm-5.4.14/rpmdb/rpmdb.c
 ===================================================================
---- rpm-5.4.9.orig/rpmdb/rpmdb.c
-+++ rpm-5.4.9/rpmdb/rpmdb.c
-@@ -2212,8 +2212,12 @@ static int rpmmiGet(dbiIndex dbi, DBC * 
+--- rpm-5.4.14.orig/rpmdb/rpmdb.c
++++ rpm-5.4.14/rpmdb/rpmdb.c
+@@ -2212,8 +2212,12 @@ static int rpmmiGet(dbiIndex dbi, DBC *
  	vp->flags |= DB_DBT_USERMEM;
  	rc = dbiGet(dbi, dbcursor, kp, vp, flags);
  	if (rc == DB_BUFFER_SMALL) {
@@ -36,7 +36,7 @@ Index: rpm-5.4.9/rpmdb/rpmdb.c
  	    if (uh == NULL || uh == (void *)-1)
  		fprintf(stderr,
  		    "==> mmap(%p[%u], 0x%x, 0x%x, %d, 0x%x) error(%d): %s\n",
-@@ -2235,6 +2239,25 @@ static int rpmmiGet(dbiIndex dbi, DBC * 
+@@ -2235,6 +2239,25 @@ static int rpmmiGet(dbiIndex dbi, DBC *
  		if (munmap(uh, uhlen) != 0)
  		    fprintf(stderr, "==> munmap(%p[%u]) error(%d): %s\n",
                  	uh, (unsigned)uhlen, errno, strerror(errno));
@@ -62,11 +62,11 @@ Index: rpm-5.4.9/rpmdb/rpmdb.c
  	    }
  	}
      } else
-Index: rpm-5.4.9/rpmdb/db3.c
+Index: rpm-5.4.14/rpmdb/db3.c
 ===================================================================
---- rpm-5.4.9.orig/rpmdb/db3.c
-+++ rpm-5.4.9/rpmdb/db3.c
-@@ -1452,7 +1452,7 @@ assert(db != NULL);
+--- rpm-5.4.14.orig/rpmdb/db3.c
++++ rpm-5.4.14/rpmdb/db3.c
+@@ -1509,7 +1509,7 @@ assert(db != NULL);
  #endif
      }
  
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
index 25ebbdc..2eb6e0f 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
@@ -1,9 +1,9 @@
 Debug the platform score generation...
 
-Index: rpm-5.4.9/lib/rpmrc.c
+Index: rpm-5.4.14/lib/rpmrc.c
 ===================================================================
---- rpm-5.4.9.orig/lib/rpmrc.c
-+++ rpm-5.4.9/lib/rpmrc.c
+--- rpm-5.4.14.orig/lib/rpmrc.c
++++ rpm-5.4.14/lib/rpmrc.c
 @@ -465,6 +465,8 @@ static rpmRC rpmPlatform(const char * pl
  
      rc = (rpmRC) rpmiobSlurp(platform, &iob);
@@ -38,18 +38,18 @@ Index: rpm-5.4.9/lib/rpmrc.c
  	}
  
 +	fprintf(stderr, "D: rpmPlatform mireAppend STRCMP %s -- ", p);
+ #if !defined(RPM_VENDOR_OE) /* Skip the explicit-platform */
  #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
  	/* do not use vendor and GNU attribution */
- 	p = rpmExpand("%{_host_cpu}-%{_host_os}", NULL);
-@@ -518,6 +527,7 @@ static rpmRC rpmPlatform(const char * pl
+@@ -519,6 +528,7 @@ static rpmRC rpmPlatform(const char * pl
  		(cvog && *cvog->gnu ? "-" : NULL),
  		(cvog ? cvog->gnu : NULL), NULL);
  #endif
 +	fprintf(stderr, "%s\n", p);
  	xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
  	p = _free(p);
- 	
-@@ -686,9 +696,12 @@ int rpmPlatformScore(const char * platfo
+ #endif
+@@ -688,9 +698,12 @@ int rpmPlatformScore(const char * platfo
  
      if ((mire = (miRE) mi_re) != NULL)
      for (i = 0; i < mi_nre; i++) {
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch b/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
index 1f948cd..b1db6ff 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
@@ -11,11 +11,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff --git a/lib/rpmfc.c b/lib/rpmfc.c
-index 0c3befd..9306999 100644
---- a/lib/rpmfc.c
-+++ b/lib/rpmfc.c
-@@ -1692,7 +1692,6 @@ rpmRC rpmfcGenerateDepends(void * specp, void * pkgp)
+Index: rpm-5.4.14/lib/rpmfc.c
+===================================================================
+--- rpm-5.4.14.orig/lib/rpmfc.c
++++ rpm-5.4.14/lib/rpmfc.c
+@@ -1734,7 +1734,6 @@ rpmRC rpmfcGenerateDepends(void * _spec,
  	/* ... then generate dependencies using %{__find_requires} et al. */
  	rc = rpmfcGenerateDependsHelper(spec, pkg, fi);
  	printDeps(pkg->header);
@@ -23,7 +23,7 @@ index 0c3befd..9306999 100644
      }
  
      /* Generate scriptlet Dependencies. */
-@@ -1720,8 +1719,8 @@ rpmRC rpmfcGenerateDepends(void * specp, void * pkgp)
+@@ -1762,8 +1761,8 @@ rpmRC rpmfcGenerateDepends(void * _spec,
      av[ac] = NULL;
  
      fc = rpmfcNew();
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
index 8c2a04a..5deb232 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
@@ -10,11 +10,11 @@ RP 2014/6/10
 
 Upstream-Status: Pending
 
-Index: rpm-5.4.9/lib/fsm.c
+Index: rpm-5.4.14/lib/fsm.c
 ===================================================================
---- rpm-5.4.9.orig/lib/fsm.c	2014-06-10 10:54:08.601049402 +0000
-+++ rpm-5.4.9/lib/fsm.c	2014-06-10 10:55:45.633046077 +0000
-@@ -495,6 +495,11 @@
+--- rpm-5.4.14.orig/lib/fsm.c
++++ rpm-5.4.14/lib/fsm.c
+@@ -495,6 +495,11 @@ static int saveHardLink(/*@special@*/ /*
      }
  
      if (fsm->goal == IOSM_PKGBUILD) --fsm->li->linksLeft;
@@ -26,7 +26,7 @@ Index: rpm-5.4.9/lib/fsm.c
      fsm->li->filex[fsm->li->linksLeft] = fsm->ix;
      /*@-observertrans -dependenttrans@*/
      fsm->li->nsuffix[fsm->li->linksLeft] = fsm->nsuffix;
-@@ -1876,8 +1881,13 @@
+@@ -1878,8 +1883,13 @@ if (!(fsmGetFi(fsm)->mapflags & IOSM_PAY
  	fsm->postpone = iosmFileActionSkipped(fsm->action);
  	if (fsm->goal == IOSM_PKGINSTALL || fsm->goal == IOSM_PKGBUILD) {
  	    /*@-evalorder@*/ /* FIX: saveHardLink can modify fsm */
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
index b5ff263..042e412 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
@@ -6,11 +6,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
---- rpm-5.4.0/lib/Makefile.am.orig
-+++ rpm-5.4.0/lib/Makefile.am
-@@ -90,6 +90,9 @@
- libsql_la_SOURCES	= libsql.c
- libsql_la_LIBADD	= librpm.la $(RPMDB_LDADD_COMMON)
+Index: rpm-5.4.14/lib/Makefile.am
+===================================================================
+--- rpm-5.4.14.orig/lib/Makefile.am
++++ rpm-5.4.14/lib/Makefile.am
+@@ -120,6 +120,9 @@ librpm.la: $(librpm_la_OBJECTS) $(librpm
+ #libsql_la_SOURCES	= libsql.c
+ #libsql_la_LIBADD	= librpm.la $(RPMDB_LDADD_COMMON)
  
 +# pkglib libraries needs to have usrlib libraries already installed!
 +install-pkglibLTLIBRARIES: install-usrlibLTLIBRARIES
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
index 4f484c4..3153f7a 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
@@ -1,11 +1,11 @@
 
 Upstream-Status: Inappropriate [configuration]
 
-diff --git a/rpmdb/DB_CONFIG.in b/rpmdb/DB_CONFIG.in
-index 8b94c94..e0b4689 100644
---- a/rpmdb/DB_CONFIG.in
-+++ b/rpmdb/DB_CONFIG.in
-@@ -4,6 +4,7 @@
+Index: rpm-5.4.14/rpmdb/DB_CONFIG.in
+===================================================================
+--- rpm-5.4.14.orig/rpmdb/DB_CONFIG.in
++++ rpm-5.4.14/rpmdb/DB_CONFIG.in
+@@ -4,6 +4,7 @@ set_data_dir .
  set_create_dir .
  set_lg_dir ./log
  set_tmp_dir ./tmp
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch b/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
index 7101e5c..790a662 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
@@ -9,11 +9,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/lib/depends.c
+Index: rpm-5.4.14/lib/depends.c
 ===================================================================
---- rpm-5.4.9.orig/lib/depends.c
-+++ rpm-5.4.9/lib/depends.c
-@@ -594,7 +594,7 @@ int rpmtsAddInstallElement(rpmts ts, Hea
+--- rpm-5.4.14.orig/lib/depends.c
++++ rpm-5.4.14/lib/depends.c
+@@ -595,7 +595,7 @@ int rpmtsAddInstallElement(rpmts ts, Hea
  	    platform = rpmExpand(arch, "-unknown-", os, NULL);
  
  	rc = rpmPlatformScore(platform, platpat, nplatpat);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lua.patch b/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
index 348a919..a9930d6 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
@@ -4,10 +4,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.9.orig/configure.ac rpm-5.4.9/configure.ac
---- rpm-5.4.9.orig/configure.ac	2012-05-16 12:16:36.589813548 -0500
-+++ rpm-5.4.9/configure.ac	2012-05-16 12:26:01.070813518 -0500
-@@ -120,6 +120,9 @@
+Index: rpm-5.4.14/configure.ac
+===================================================================
+--- rpm-5.4.14.orig/configure.ac
++++ rpm-5.4.14/configure.ac
+@@ -121,6 +121,9 @@ AC_PROG_YACC
  
  AC_PATH_PROG(AS, as, as)
  
@@ -17,10 +18,11 @@ diff -ur rpm-5.4.9.orig/configure.ac rpm-5.4.9/configure.ac
  dnl # GCC specifics
  AC_PROG_GCC_TRADITIONAL
  AC_ARG_ENABLE(build-pic,
-diff -ur rpm-5.4.9.orig/lua/Makefile.am rpm-5.4.9/lua/Makefile.am
---- rpm-5.4.9.orig/lua/Makefile.am	2012-04-07 19:15:25.000000000 -0500
-+++ rpm-5.4.9/lua/Makefile.am	2012-05-16 12:26:19.556856688 -0500
-@@ -40,7 +40,7 @@
+Index: rpm-5.4.14/lua/Makefile.am
+===================================================================
+--- rpm-5.4.14.orig/lua/Makefile.am
++++ rpm-5.4.14/lua/Makefile.am
+@@ -41,7 +41,7 @@ rpmluac_LDADD = liblua.la
  
  # --- bin2c doesn't need anything but a compiler
  bin2c$(EXEEXT):  bin2c.c
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-macros.patch b/meta/recipes-devtools/rpm/rpm/rpm-macros.patch
index c1516a4..c7ab2d2 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-macros.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-macros.patch
@@ -7,10 +7,11 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.8.orig/macros/macros.in rpm-5.4.8/macros/macros.in
---- rpm-5.4.8.orig/macros/macros.in	2012-03-21 19:04:06.000000000 -0500
-+++ rpm-5.4.8/macros/macros.in	2012-06-07 17:02:53.903046624 -0500
-@@ -985,7 +985,7 @@
+Index: rpm-5.4.14/macros/macros.in
+===================================================================
+--- rpm-5.4.14.orig/macros/macros.in
++++ rpm-5.4.14/macros/macros.in
+@@ -1022,7 +1022,7 @@ $_arbitrary_tags_tests	Foo:Bar
  
  #==============================================================================
  # ---- rpmbuild macros.
@@ -19,7 +20,7 @@ diff -ur rpm-5.4.8.orig/macros/macros.in rpm-5.4.8/macros/macros.in
  
  #------------------------------------------------------------------------
  # cmake(...) configuration
-@@ -997,15 +997,15 @@
+@@ -1038,15 +1038,15 @@ $_arbitrary_tags_tests	Foo:Bar
  
  #------------------------------------------------------------------------
  # perl(...) configuration
@@ -38,7 +39,7 @@ diff -ur rpm-5.4.8.orig/macros/macros.in rpm-5.4.8/macros/macros.in
  
  #------------------------------------------------------------------------
  # java(...) configuration.
-@@ -1013,11 +1013,11 @@
+@@ -1054,11 +1054,11 @@ $_arbitrary_tags_tests	Foo:Bar
  
  #------------------------------------------------------------------------
  # libtool(...) configuration.
@@ -52,12 +53,12 @@ diff -ur rpm-5.4.8.orig/macros/macros.in rpm-5.4.8/macros/macros.in
  
  #------------------------------------------------------------------------
  # mono(...) configuration.
-@@ -1029,7 +1029,7 @@
+@@ -1070,7 +1070,7 @@ $_arbitrary_tags_tests	Foo:Bar
  
  #------------------------------------------------------------------------
  # tcl(...) configuration.
 -#%%{load:%{_usrlibrpm}/macros.d/tcl}
 +%{load:%{_usrlibrpm}/macros.d/tcl}
  
- # \endverbatim
- #*/
+ #------------------------------------------------------------------------
+ # typelib(...) configuration.
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
index c4b4c03..ab6ed2c 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
@@ -4,10 +4,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -urN rpm-5.4.0.orig/lib/order.c rpm-5.4.0/lib/order.c
---- rpm-5.4.0.orig/lib/order.c	2010-12-13 17:36:39.000000000 -0600
-+++ rpm-5.4.0/lib/order.c	2011-08-10 11:11:43.194686332 -0500
-@@ -2170,7 +2170,7 @@
+Index: rpm-5.4.14/lib/order.c
+===================================================================
+--- rpm-5.4.14.orig/lib/order.c
++++ rpm-5.4.14/lib/order.c
+@@ -2175,7 +2175,7 @@ rescan:
  		const char * dp;
  		rpmlogLvl msglvl = (anaconda || (rpmtsDFlags(ts) & RPMDEPS_FLAG_DEPLOOPS))
  			? RPMLOG_WARNING : RPMLOG_ERR;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
index 442afbc..5818229 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
@@ -9,9 +9,11 @@ Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
---- rpm-5.4.8/configure.ac.orig	2012-04-24 09:10:01.856749153 -0500
-+++ rpm-5.4.8/configure.ac	2012-04-24 09:10:35.198731504 -0500
-@@ -1149,30 +1149,10 @@
+Index: rpm-5.4.14/configure.ac
+===================================================================
+--- rpm-5.4.14.orig/configure.ac
++++ rpm-5.4.14/configure.ac
+@@ -1186,30 +1186,10 @@ AC_SUBST(WITH_PERL_SUBDIR)
  AC_SUBST(WITH_PERL_SUBPACKAGE)
  AC_SUBST(WITH_PERL_LIBS)
  
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch b/meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
index db424b8..691aba9 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
@@ -8,10 +8,11 @@ Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.9.orig/configure.ac rpm-5.4.9/configure.ac
---- rpm-5.4.9.orig/configure.ac	2012-05-17 16:37:20.594790192 -0500
-+++ rpm-5.4.9/configure.ac	2012-05-17 16:39:23.126933596 -0500
-@@ -1909,7 +1909,7 @@
+Index: rpm-5.4.14/configure.ac
+===================================================================
+--- rpm-5.4.14.orig/configure.ac
++++ rpm-5.4.14/configure.ac
+@@ -1951,7 +1951,7 @@ grep -v 'define HAVE_UNISTD_H' confdefs.
  esac
  RPM_CHECK_LIB(
      [OSSP uuid], [uuid],
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
index 7e090a3..c15e124 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
@@ -6,11 +6,11 @@ Upstream-Status: Inappropriate [not author]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.8/rpmdb/hdrfmt.c
+Index: rpm-5.4.14/rpmdb/hdrfmt.c
 ===================================================================
---- rpm-5.4.8.orig/rpmdb/hdrfmt.c
-+++ rpm-5.4.8/rpmdb/hdrfmt.c
-@@ -2403,8 +2403,10 @@ static int pkgoriginTag(Header h, HE_t 
+--- rpm-5.4.14.orig/rpmdb/hdrfmt.c
++++ rpm-5.4.14/rpmdb/hdrfmt.c
+@@ -2409,8 +2409,10 @@ static int pkgoriginTag(Header h, HE_t h
      int rc = 1;
  
      he->tag = RPMTAG_PACKAGEORIGIN;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
index fc6b218..9cd02a0 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
@@ -19,10 +19,11 @@ RP 2014/6/10
 
 Upstream-Status: Pending
 
-diff -ur rpm-5.4.10/build/files.c rpm-5.4.10-collision/build/files.c
---- rpm-5.4.10/build/files.c	2013-03-17 13:17:38.233358389 +0100
-+++ rpm-5.4.10-collision/build/files.c	2013-03-17 13:07:37.468483625 +0100
-@@ -1323,6 +1323,26 @@
+Index: rpm-5.4.14/build/files.c
+===================================================================
+--- rpm-5.4.14.orig/build/files.c
++++ rpm-5.4.14/build/files.c
+@@ -1328,6 +1328,26 @@ static rpmuint32_t getDigestAlgo(Header
      return dalgo;
  }
  
@@ -49,7 +50,7 @@ diff -ur rpm-5.4.10/build/files.c rpm-5.4.10-collision/build/files.c
  /**
   * Add file entries to header.
   * @todo Should directories have %doc/%config attributes? (#14531)
-@@ -1370,6 +1390,7 @@
+@@ -1374,6 +1394,7 @@ memset(buf, 0, sizeof(buf));	/* XXX valg
  
      for (i = 0, flp = fl->fileList; i < fl->fileListRecsUsed; i++, flp++) {
  	const char *s;
@@ -57,7 +58,7 @@ diff -ur rpm-5.4.10/build/files.c rpm-5.4.10-collision/build/files.c
  
   	/* Merge duplicate entries. */
  	while (i < (fl->fileListRecsUsed - 1) &&
-@@ -1437,6 +1458,13 @@
+@@ -1436,6 +1457,13 @@ memset(buf, 0, sizeof(buf));	/* XXX valg
  	/* Leave room for both dirname and basename NUL's */
  	dpathlen += (strlen(flp->diskURL) + 2);
  
@@ -71,20 +72,19 @@ diff -ur rpm-5.4.10/build/files.c rpm-5.4.10-collision/build/files.c
  	/*
  	 * Make the header, the OLDFILENAMES will get converted to a 
  	 * compressed file list write before we write the actual package to
-@@ -1519,7 +1547,11 @@
+@@ -1518,7 +1546,11 @@ memset(buf, 0, sizeof(buf));	/* XXX valg
  
  	/* XXX Hash instead of 64b->32b truncate to prevent aliasing. */
  	{   ino_t _ino = flp->fl_ino;
--	    ui32 = hashFunctionString(0, &_ino, sizeof(_ino));
 +	/* don't use hash here, as hash collisions which happen on large packages
 +	   cause bus errors in rpmbuild
-+	    ui32 = hashFunctionString(0, &_ino, sizeof(_ino));
+ 	    ui32 = hashFunctionString(0, &_ino, sizeof(_ino));
 +	*/
 +	    ui32 = fileid + 1;
  	}
  	he->tag = RPMTAG_FILEINODES;
  	he->t = RPM_UINT32_TYPE;
-@@ -1752,39 +1780,6 @@
+@@ -1751,39 +1783,6 @@ if (_rpmbuildFlags & 4) {
  		IOSM_MAP_TYPE | IOSM_MAP_MODE | IOSM_MAP_UID | IOSM_MAP_GID;
  	if (isSrc)
  	    fi->fmapflags[i] |= IOSM_FOLLOW_SYMLINKS;
@@ -124,9 +124,11 @@ diff -ur rpm-5.4.10/build/files.c rpm-5.4.10-collision/build/files.c
      }
  
      ui32 = fl->totalFileSize;
---- rpm-5.4.10/lib/fsm.c~
-+++ rpm-5.4.10/lib/fsm.c
-@@ -898,6 +898,7 @@ int fsmMapAttrs(IOSM_t fsm)
+Index: rpm-5.4.14/lib/fsm.c
+===================================================================
+--- rpm-5.4.14.orig/lib/fsm.c
++++ rpm-5.4.14/lib/fsm.c
+@@ -904,6 +904,7 @@ int fsmMapAttrs(IOSM_t fsm)
  
      if (fi && i >= 0 && i < (int) fi->fc) {
  	mode_t perms = (S_ISDIR(st->st_mode) ? fi->dperms : fi->fperms);
@@ -134,7 +136,7 @@ diff -ur rpm-5.4.10/build/files.c rpm-5.4.10-collision/build/files.c
  	mode_t finalMode = (fi->fmodes ? (mode_t)fi->fmodes[i] : perms);
  	dev_t finalRdev = (dev_t)(fi->frdevs ? fi->frdevs[i] : 0);
  	rpmuint32_t finalMtime = (fi->fmtimes ? fi->fmtimes[i] : 0);
-@@ -937,6 +938,7 @@ int fsmMapAttrs(IOSM_t fsm)
+@@ -943,6 +944,7 @@ int fsmMapAttrs(IOSM_t fsm)
  	    if ((S_ISCHR(st->st_mode) || S_ISBLK(st->st_mode))
  	    && st->st_nlink == 0)
  		st->st_nlink = 1;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch b/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
index f192545..5d182ad 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
@@ -9,10 +9,11 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.9.orig/scripts/pkgconfigdeps.sh rpm-5.4.9/scripts/pkgconfigdeps.sh
---- rpm-5.4.9.orig/scripts/pkgconfigdeps.sh	2009-02-13 08:13:37.000000000 -0600
-+++ rpm-5.4.9/scripts/pkgconfigdeps.sh	2012-06-07 17:35:42.730003847 -0500
-@@ -18,8 +18,8 @@
+Index: rpm-5.4.14/scripts/pkgconfigdeps.sh
+===================================================================
+--- rpm-5.4.14.orig/scripts/pkgconfigdeps.sh
++++ rpm-5.4.14/scripts/pkgconfigdeps.sh
+@@ -18,8 +18,8 @@ case $1 in
      *.pc)
  	# Query the dependencies of the package.
  	DIR=`dirname ${filename}`
@@ -23,7 +24,7 @@ diff -ur rpm-5.4.9.orig/scripts/pkgconfigdeps.sh rpm-5.4.9/scripts/pkgconfigdeps
  	$pkgconfig --print-provides "$filename" 2> /dev/null | while read n r v ; do
  	    [ -n "$n" ] || continue
  	    # We have a dependency.  Make a note that we need the pkgconfig
-@@ -42,8 +42,8 @@
+@@ -42,8 +42,8 @@ case $1 in
  	[ -n "$oneshot" ] && echo "$oneshot"; oneshot=""
  	# Query the dependencies of the package.
  	DIR=`dirname ${filename}`
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
index 1432b16..f26a6e7 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
@@ -4,11 +4,11 @@ information about the platform (cpu/vendor/os). Fixes #3864.
 
 Upstream-Status: Inappropriate [embedded specific]
 
-diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index e676601..9140bbe 100644
---- a/lib/rpmrc.c
-+++ b/lib/rpmrc.c
-@@ -510,6 +510,7 @@ static rpmRC rpmPlatform(const char * platform)
+Index: rpm-5.4.14/lib/rpmrc.c
+===================================================================
+--- rpm-5.4.14.orig/lib/rpmrc.c
++++ rpm-5.4.14/lib/rpmrc.c
+@@ -510,6 +510,7 @@ static rpmRC rpmPlatform(const char * pl
  #endif
  	}
  
@@ -16,7 +16,7 @@ index e676601..9140bbe 100644
  #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
  	/* do not use vendor and GNU attribution */
  	p = rpmExpand("%{_host_cpu}-%{_host_os}", NULL);
-@@ -520,7 +521,8 @@ static rpmRC rpmPlatform(const char * platform)
+@@ -520,7 +521,8 @@ static rpmRC rpmPlatform(const char * pl
  #endif
  	xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
  	p = _free(p);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
index 172510c..11fd039 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
@@ -6,10 +6,11 @@ This ensures that RPM knows the compatible set of package types at all times.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
---- rpm-5.4.0.orig/lib/depends.c	2011-02-15 20:40:13.002849708 -0600
-+++ rpm-5.4.0/lib/depends.c	2011-02-15 20:47:05.838981632 -0600
-@@ -248,7 +248,7 @@
+Index: rpm-5.4.14/lib/depends.c
+===================================================================
+--- rpm-5.4.14.orig/lib/depends.c
++++ rpm-5.4.14/lib/depends.c
+@@ -250,7 +250,7 @@ static int rpmtsAddUpgrades(rpmts ts, rp
  	    he->p.ptr = _free(he->p.ptr);
  	}
  
@@ -18,7 +19,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  	/*
  	 * If we're capable of installing multiple colors
  	 * but at least one of the packages are white (0), we
-@@ -505,7 +505,7 @@
+@@ -507,7 +507,7 @@ assert(lastx >= 0 && lastx < ts->orderCo
      return 0;
  }
  
@@ -27,7 +28,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  /* Is "compat" compatible w/ arch? */
  int _isCompatibleArch(const char * arch, const char * compat)
  {
-@@ -649,7 +649,7 @@
+@@ -663,7 +663,7 @@ assert(he->p.str != NULL);
  
  	    if (arch == NULL || (parch = rpmteA(p)) == NULL)
  		continue;
@@ -36,7 +37,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  	    /* XXX hackery for alias matching. */
  	    if (!_isCompatibleArch(arch, parch))
  		continue;
-@@ -815,6 +815,12 @@
+@@ -829,6 +829,12 @@ int rpmtsAddEraseElement(rpmts ts, Heade
      return rc;
  }
  
@@ -49,7 +50,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  /*@only@*/ /*@null@*/ /*@unchecked@*/
  static char *sysinfo_path = NULL;
  
-@@ -1296,7 +1302,7 @@
+@@ -1311,7 +1317,7 @@ retry:
  	sysinfo_path = rpmExpand("%{?_rpmds_sysinfo_path}", NULL);
  	if (!(sysinfo_path != NULL && *sysinfo_path == '/')) {
  	    sysinfo_path = _free(sysinfo_path);
@@ -58,10 +59,11 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  	}
      }
  
-diff -ur rpm-5.4.0.orig/lib/rpmds.c rpm-5.4.0/lib/rpmds.c
---- rpm-5.4.0.orig/lib/rpmds.c	2011-02-15 20:40:13.004855352 -0600
-+++ rpm-5.4.0/lib/rpmds.c	2011-02-15 20:41:55.598846670 -0600
-@@ -1737,7 +1737,7 @@
+Index: rpm-5.4.14/lib/rpmds.c
+===================================================================
+--- rpm-5.4.14.orig/lib/rpmds.c
++++ rpm-5.4.14/lib/rpmds.c
+@@ -1759,7 +1759,7 @@ int rpmdsSysinfo(rpmPRCO PRCO, const cha
  /*@-observertrans @*/
  	    _sysinfo_path = _free(_sysinfo_path);
  /*@=observertrans @*/
@@ -70,9 +72,10 @@ diff -ur rpm-5.4.0.orig/lib/rpmds.c rpm-5.4.0/lib/rpmds.c
  	}
      }
  /*@=modobserver@*/
-diff -ur rpm-5.4.0.orig/lib/rpmrc.c rpm-5.4.0/lib/rpmrc.c
---- rpm-5.4.0.orig/lib/rpmrc.c	2011-02-15 20:40:13.006853913 -0600
-+++ rpm-5.4.0/lib/rpmrc.c	2011-02-15 20:44:39.708972391 -0600
+Index: rpm-5.4.14/lib/rpmrc.c
+===================================================================
+--- rpm-5.4.14.orig/lib/rpmrc.c
++++ rpm-5.4.14/lib/rpmrc.c
 @@ -38,7 +38,13 @@
  static const char * configTarget = NULL;
  
@@ -88,7 +91,7 @@ diff -ur rpm-5.4.0.orig/lib/rpmrc.c rpm-5.4.0/lib/rpmrc.c
  
  /*@only@*/ /*@relnull@*/ /*@unchecked@*/
  void * platpat = NULL;
-@@ -685,16 +691,17 @@
+@@ -694,16 +700,17 @@ static void defaultMachine(/*@out@*/ con
      int rc;
  
      while (!gotDefaults) {
@@ -113,7 +116,7 @@ diff -ur rpm-5.4.0.orig/lib/rpmrc.c rpm-5.4.0/lib/rpmrc.c
  	/* utsname fields on some platforms (like HP-UX) are very small
  	   (just about 8 characters). This is too small for OpenPKG, so cheat! */
  	rc = uname(&un_real);
-@@ -771,9 +778,7 @@
+@@ -780,9 +787,7 @@ static void defaultMachine(/*@out@*/ con
  	if (cp != NULL && cp != _platform)
  	    cp = _free(cp);
  #endif
@@ -123,7 +126,7 @@ diff -ur rpm-5.4.0.orig/lib/rpmrc.c rpm-5.4.0/lib/rpmrc.c
  
  	if (configTarget && !parseCVOG(configTarget, &cvog) && cvog != NULL) {
  	    gotDefaults = 1;
-@@ -1096,6 +1101,8 @@
+@@ -1101,6 +1106,8 @@ int rpmReadConfigFiles(/*@unused@*/ cons
  
  #ifdef PREMACROFILES
      if (rpmReadRC(PREMACROFILES)) return -1;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
index 79124bb6..fed54e5 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
@@ -13,10 +13,10 @@ ensures reasonable defaults are always available.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/lib/rpmrc.c
+Index: rpm-5.4.14/lib/rpmrc.c
 ===================================================================
---- rpm-5.4.9.orig/lib/rpmrc.c
-+++ rpm-5.4.9/lib/rpmrc.c
+--- rpm-5.4.14.orig/lib/rpmrc.c
++++ rpm-5.4.14/lib/rpmrc.c
 @@ -328,10 +328,15 @@ static void setDefaults(void)
  	/*@modifies rpmGlobalMacroContext, internalState @*/
  {
@@ -57,11 +57,11 @@ Index: rpm-5.4.9/lib/rpmrc.c
  	}
  
  #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
-Index: rpm-5.4.9/macros/macros.in
+Index: rpm-5.4.14/macros/macros.in
 ===================================================================
---- rpm-5.4.9.orig/macros/macros.in
-+++ rpm-5.4.9/macros/macros.in
-@@ -875,9 +875,9 @@ $_arbitrary_tags_tests	Foo:Bar
+--- rpm-5.4.14.orig/macros/macros.in
++++ rpm-5.4.14/macros/macros.in
+@@ -900,9 +900,9 @@ $_arbitrary_tags_tests	Foo:Bar
  %_os			@RPMCANONOS@
  %_gnu			@RPMCANONGNU@
  
@@ -74,7 +74,7 @@ Index: rpm-5.4.9/macros/macros.in
  
  #==============================================================================
  # ---- configure macros.
-@@ -920,9 +920,10 @@ $_arbitrary_tags_tests	Foo:Bar
+@@ -945,9 +945,10 @@ $_arbitrary_tags_tests	Foo:Bar
  %_build_os		%{_host_os}
  %_host			@host@
  %_host_alias		@host_alias@%{nil}
@@ -88,10 +88,10 @@ Index: rpm-5.4.9/macros/macros.in
  %_target		%{_host}
  %_target_alias		%{_host_alias}
  %_target_cpu		%{_host_cpu}
-Index: rpm-5.4.9/python/rpmmodule.c
+Index: rpm-5.4.14/python/rpmmodule.c
 ===================================================================
---- rpm-5.4.9.orig/python/rpmmodule.c
-+++ rpm-5.4.9/python/rpmmodule.c
+--- rpm-5.4.14.orig/python/rpmmodule.c
++++ rpm-5.4.14/python/rpmmodule.c
 @@ -65,8 +65,8 @@ static PyObject * archScore(PyObject * s
      if (!PyArg_ParseTupleAndKeywords(args, kwds, "s", kwlist, &arch))
  	return NULL;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
index b65abc2..07d407d 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
@@ -11,10 +11,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff --git a/python/rpmmodule.c b/python/rpmmodule.c
-index f7282bc..dde68ca 100644
---- a/python/rpmmodule.c
-+++ b/python/rpmmodule.c
+Index: rpm-5.4.14/python/rpmmodule.c
+===================================================================
+--- rpm-5.4.14.orig/python/rpmmodule.c
++++ rpm-5.4.14/python/rpmmodule.c
 @@ -392,7 +392,8 @@ void init_rpm(void)
      if (Py_AtExit(rpm_exithook) == -1)
  	return;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch b/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
index 33ec8e2..0a5f5a4 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
@@ -8,10 +8,10 @@ Upstream-Status: Inapproriate (OpenEmbedded specific)
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/macros/macros.in
+Index: rpm-5.4.14/macros/macros.in
 ===================================================================
---- rpm-5.4.9.orig/macros/macros.in
-+++ rpm-5.4.9/macros/macros.in
+--- rpm-5.4.14.orig/macros/macros.in
++++ rpm-5.4.14/macros/macros.in
 @@ -27,11 +27,12 @@
  #==============================================================================
  # ---- filesystem macros.
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch b/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
index 89ee410..769016b 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
@@ -1,7 +1,7 @@
-diff --git a/syck/lib/syck.h b/syck/lib/syck.h
-index 04be1d9..73830a6 100644
---- a/syck/lib/syck.h
-+++ b/syck/lib/syck.h
+Index: rpm-5.4.14/syck/lib/syck.h
+===================================================================
+--- rpm-5.4.14.orig/syck/lib/syck.h
++++ rpm-5.4.14/syck/lib/syck.h
 @@ -621,9 +621,6 @@ long syck_seq_count( SyckNode *seq )
   */
  void syckerror( char *msg )
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch b/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
index d272fe9..56a243d 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
@@ -7,9 +7,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
---- rpm-5.4.0.orig/lib/rpmts.c	2010-12-27 16:08:25.000000000 -0600
-+++ rpm-5.4.0/lib/rpmts.c	2012-04-12 15:01:12.990184067 -0500
-@@ -403,8 +403,8 @@
+Index: rpm-5.4.14/lib/rpmts.c
+===================================================================
+--- rpm-5.4.14.orig/lib/rpmts.c
++++ rpm-5.4.14/lib/rpmts.c
+@@ -410,8 +410,8 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __
  	if (sdb == NULL)
  	    continue;
  
@@ -20,7 +22,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  	mi = rpmmiInit(sdb, rpmtag, keyp, keylen);
  	while ((h = rpmmiNext(mi)) != NULL) {
  	    size_t hnamelen;
-@@ -439,6 +439,15 @@
+@@ -446,6 +446,15 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __
  	    bhnamelen = hnamelen;
  	}
  	mi = rpmmiFree(mi);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch b/meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
deleted file mode 100644
index 9b63b37..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-rpmts.c: respect to the arch priorities
-
-Let rpm respect to the priorities when choose alternatives rpm, the arch
-which comes first is preferred.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- lib/rpmts.c |   14 ++++++++++++++
- 1 files changed, 14 insertions(+), 0 deletions(-)
-
-diff --git a/lib/rpmts.c b/lib/rpmts.c
-index 3fbbc9e..40ec08e 100644
---- a/lib/rpmts.c
-+++ b/lib/rpmts.c
-@@ -353,6 +353,7 @@ int rpmtsSolve(rpmts ts, rpmds ds, /*@unused@*/ const void * data)
-     Header h = NULL;
-     size_t bhnamelen = 0;
-     time_t bhtime = 0;
-+    const char *bharch = NULL;
-     rpmTag rpmtag;
-     const char * keyp;
-     size_t keylen = 0;
-@@ -409,6 +410,7 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, ds, data);
- 	while ((h = rpmmiNext(mi)) != NULL) {
- 	    size_t hnamelen;
- 	    time_t htime;
-+	    const char *harch = NULL;
- 
- 	    if (rpmtag == RPMTAG_PROVIDENAME && !rpmdsAnyMatchesDep(h, ds, 1))
- 		continue;
-@@ -431,12 +433,23 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, ds, data);
- 	    if (htime <= bhtime)
- 		continue;
- 
-+	    /* XXX Respect to the arch priorities */
-+	    he->tag = RPMTAG_ARCH;
-+	    xx = headerGet(h, he, 0);
-+	    harch = ((xx && he->p.str) ? xstrdup(he->p.str) : NULL);
-+	    he->p.ptr = _free(he->p.ptr);
-+	    if (bharch && (strcmp(bharch, harch) != 0))
-+		continue;
-+
- 	    /* Save new "best" candidate. */
- 	    (void)headerFree(bh);
- 	    bh = NULL;
- 	    bh = headerLink(h);
- 	    bhtime = htime;
- 	    bhnamelen = hnamelen;
-+	    bharch = _free(bharch);
-+	    bharch = xstrdup(harch);
-+	    harch = _free(harch);
- 	}
- 	mi = rpmmiFree(mi);
- 
-@@ -449,6 +462,7 @@ fprintf(stderr, "--> %s(%p,%p,%p)\n", __FUNCTION__, ts, ds, data);
-       } while (1);
- 
-     }
-+    bharch = _free(bharch);
- 
-     /* Is there a suggested resolution? */
-     if (bh == NULL)
--- 
-1.7.1
-
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
index f4e4228..f825372 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
@@ -12,11 +12,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/lib/psm.c
+Index: rpm-5.4.14/lib/psm.c
 ===================================================================
---- rpm-5.4.9.orig/lib/psm.c
-+++ rpm-5.4.9/lib/psm.c
-@@ -801,6 +801,10 @@ static rpmRC runScript(rpmpsm psm, Heade
+--- rpm-5.4.14.orig/lib/psm.c
++++ rpm-5.4.14/lib/psm.c
+@@ -806,6 +806,10 @@ static rpmRC runScript(rpmpsm psm, Heade
      int xx;
      int i;
  
@@ -27,7 +27,7 @@ Index: rpm-5.4.9/lib/psm.c
      if (psm->sstates != NULL && ix >= 0 && ix < RPMSCRIPT_MAX)
  	ssp = psm->sstates + ix;
      if (ssp != NULL)
-@@ -867,14 +871,29 @@ assert(he->p.str != NULL);
+@@ -872,14 +876,29 @@ assert(he->p.str != NULL);
  		(F_ISSET(psm, UNORDERED) ? "a" : ""));
  
      if (Phe->p.argv == NULL) {
@@ -63,7 +63,7 @@ Index: rpm-5.4.9/lib/psm.c
  	ldconfig_done = (ldconfig_path && !strcmp(argv[0], ldconfig_path)
  		? 1 : 0);
      }
-@@ -925,7 +944,12 @@ assert(he->p.str != NULL);
+@@ -930,7 +949,12 @@ assert(he->p.str != NULL);
  	    goto exit;
  
  	if (rpmIsDebug() &&
@@ -77,7 +77,7 @@ Index: rpm-5.4.9/lib/psm.c
  	{
  	    static const char set_x[] = "set -x\n";
  	    nw = Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
-@@ -1060,12 +1084,22 @@ assert(he->p.str != NULL);
+@@ -1065,12 +1089,22 @@ assert(he->p.str != NULL);
  
  	{   const char * rootDir = rpmtsRootDir(ts);
  	    if (!rpmtsChrootDone(ts) && rootDir != NULL &&
@@ -100,7 +100,7 @@ Index: rpm-5.4.9/lib/psm.c
  	    xx = Chdir("/");
  	    rpmlog(RPMLOG_DEBUG, D_("%s: %s(%s)\texecv(%s) pid %d\n"),
  			psm->stepName, sln, NVRA,
-@@ -2977,6 +3011,13 @@ assert(psm->te != NULL);
+@@ -2985,6 +3019,13 @@ assert(psm->te != NULL);
      case PSM_SCRIPT:	/* Run current package scriptlets. */
  	/* XXX running %verifyscript/%sanitycheck doesn't have psm->te */
      {	rpmtxn _parent = (psm && psm->te ? psm->te->txn : NULL);
@@ -114,7 +114,7 @@ Index: rpm-5.4.9/lib/psm.c
  	xx = rpmtxnBegin(rpmtsGetRdb(ts), _parent, NULL);
  	rc = runInstScript(psm);
  	if (rc)
-@@ -2984,11 +3025,24 @@ assert(psm->te != NULL);
+@@ -2992,11 +3033,24 @@ assert(psm->te != NULL);
  	else
  	     xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
  	rpmtsGetRdb(ts)->db_txn = NULL;
@@ -139,7 +139,7 @@ Index: rpm-5.4.9/lib/psm.c
  	break;
      case PSM_IMMED_TRIGGERS:
  	/* Run triggers in this package other package(s) set off. */
-@@ -2998,7 +3052,18 @@ assert(psm->te != NULL);
+@@ -3006,7 +3060,18 @@ assert(psm->te != NULL);
  	    F_SET(psm, GOTTRIGGERS);
  	}
  	if (psm->triggers != NULL)
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch b/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch
index b38b34d..ec38b95 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-showrc.patch
@@ -4,10 +4,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur rpm-5.4.0.orig/lib/rpmrc.c rpm-5.4.0/lib/rpmrc.c
---- rpm-5.4.0.orig/lib/rpmrc.c	2011-02-15 20:40:13.006853913 -0600
-+++ rpm-5.4.0/lib/rpmrc.c	2011-02-15 20:44:39.708972391 -0600
-@@ -1216,11 +1223,15 @@
+Index: rpm-5.4.14/lib/rpmrc.c
+===================================================================
+--- rpm-5.4.14.orig/lib/rpmrc.c
++++ rpm-5.4.14/lib/rpmrc.c
+@@ -1228,11 +1228,15 @@ int rpmShowRC(FILE * fp)
  		if (DNEVR != NULL)
  		    fprintf(fp, "    %s\n", DNEVR+2);
  	    }
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch b/meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch
deleted file mode 100644
index d6f43a2..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Increase the maximum number of solver databases!
-
-Previously the max was set to 5, up this to 20... this should be more
-then enough for now.. also add an RPM_ERROR message in case we exceed the
-new maximum.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -urN rpm-5.4.0.orig/rpmio/rpmbag.c rpm-5.4.0/rpmio/rpmbag.c
---- rpm-5.4.0.orig/rpmio/rpmbag.c	2010-10-17 21:43:55.000000000 -0500
-+++ rpm-5.4.0/rpmio/rpmbag.c	2011-02-18 18:46:00.246892502 -0600
-@@ -16,7 +16,7 @@
- /*@unchecked@*/
- int _rpmbag_debug = 0;
- 
--static size_t _maxnsdbp = 5;
-+static size_t _maxnsdbp = 20;
- 
- static void rpmbagFini(void * _bag)
- 	/*@globals fileSystem @*/
-@@ -70,6 +70,8 @@
- 	sdbp[i] = xcalloc(1, sizeof(*sdbp[i]));
- 	sdbp[i]->dbmode = dbmode;
- 	sdbp[i]->_db = _db;
-+    } else if (bag && bag->sdbp && bag->nsdbp >= _maxnsdbp) {
-+	rpmlog(RPMLOG_ERR, _("Attempted to open more then %d solver databases.  Increase _maxnsdbp in rpmio/rpmbag.c\n"), _maxnsdbp);
-     }
- 
-     return 0;
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch b/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
deleted file mode 100644
index cbeeb29..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-git: fix: stud-out git_strerror when --without-git
-
-Patch taken from the cvs repo,http://www.mail-archive.com/rpm-cvs@rpm5.org/msg08907.html. 
-
-Upstream-Status: Backport
-
-Signed-off-by: Morgan Little <morgan.little@windriver.com>
-
-Server: rpm5.org                         Name:   Jeff Johnson
-Root:   /v/rpm/cvs                       Email:  j...@rpm5.org
-Module: rpm                              Date:   07-Jun-2012 16:17:02
-Branch: rpm-5_4                          Handle: 2012060714165803
-
-Modified files:           (Branch: rpm-5_4)
-  rpm                     CHANGES
-  rpm/rpmio               rpmgit.c tgit.c
-
-Log:
-  - git: fix: stub-out git_strerror when --without-git.
-
-Summary:
-  Revision    Changes     Path
-  2.1.2.11    +3  -1      rpm/rpmio/rpmgit.c
-  1.1.2.7     +0  -1      rpm/rpmio/tgit.c
-____________________________________________________________________________
-Index: rpm/rpmio/rpmgit.c
-============================================================================
---- rpm/rpmio/rpmgit.c
-+++ rpm/rpmio/rpmgit.c
-@@ -145,6 +145,9 @@
- #endif       /* defined(WITH_LIBGT2) */
- 
- /*==============================================================*/
-+#if !defined(WITH_LIBGIT2)
-+#define      git_strerror(_rc) ""
-+#endif
- 
- static int Xchkgit(/*@unused@*/ rpmgit git, const char * msg,
-                 int error, int printit,
-@@ -157,7 +157,6 @@
-     int rc = error;
- 
-     if (printit && rc) {
--	/* XXX git_strerror? */
-         rpmlog(RPMLOG_ERR, "%s:%s:%u: %s(%d): %s\n",
-                 func, fn, ln, msg, rc, git_strerror(rc));
-     }
-Index: rpm/rpmio/tgit.c
-============================================================================
---- rpm/rpmio/tgit.c
-+++ rpm/rpmio/tgit.c
-@@ -34,7 +34,6 @@
-     int rc = error;
- 
-     if (printit && rc) {
--	/* XXX git_strerror? */
-         rpmlog(RPMLOG_ERR, "%s:%s:%u: %s(%d): %s\n",
-                 func, fn, ln, msg, rc, git_strerror(rc));
-     }
-
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
index e487b82..683275c 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
@@ -13,9 +13,10 @@ Signed-off-by: Ming Liu <ming.liu@windriver.com>
  tagname.c |   16 ++++++++++++++++
  1 file changed, 16 insertions(+)
 
-diff -urpN a/rpmdb/tagname.c b/rpmdb/tagname.c
---- a/rpmdb/tagname.c
-+++ b/rpmdb/tagname.c
+Index: rpm-5.4.14/rpmdb/tagname.c
+===================================================================
+--- rpm-5.4.14.orig/rpmdb/tagname.c
++++ rpm-5.4.14/rpmdb/tagname.c
 @@ -3,6 +3,19 @@
   */
  
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
index dd8d8bd..cb85beb 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
@@ -3,17 +3,17 @@ Upstream-Status: Pending
 Author: Khem Raj <raj.khem@gmail.com>
 Date: 2011-03-03
 Description:
-This patch fixes build issue found when compiling rpm-natibe on ubuntu
+This patch fixes build issue found when compiling rpm-native on ubuntu
 11.04-alpha. Problem is that linker does not get correct set of dependent
 libraries when linking mtree binary which results in undefined symbols
 in librpmio.so. This patch adds correct flags to mtree_LDADD to account
 for rpmio deps
 
-Index: rpm-5.4.0/tools/Makefile.am
+Index: rpm-5.4.14/tools/Makefile.am
 ===================================================================
---- rpm-5.4.0.orig/tools/Makefile.am
-+++ rpm-5.4.0/tools/Makefile.am
-@@ -169,7 +169,7 @@ grep_LDADD =		$(RPMIO_LDADD_COMMON)
+--- rpm-5.4.14.orig/tools/Makefile.am
++++ rpm-5.4.14/tools/Makefile.am
+@@ -186,7 +186,7 @@ grep_LDADD =		$(RPMIO_LDADD_COMMON)
  
  mtree_SOURCES =		rpmmtree.c
  mtree_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch b/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
index 600e2c2..713f84e 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
@@ -12,8 +12,10 @@ Upstream-Status: Pending
 Signed-off-by: Morgan Little <morgan.little@windriver.com>
 
 
---- a/lua/local/luuid.c.orig
-+++ b/lua/local/luuid.c
+Index: rpm-5.4.14/lua/local/luuid.c
+===================================================================
+--- rpm-5.4.14.orig/lua/local/luuid.c
++++ rpm-5.4.14/lua/local/luuid.c
 @@ -21,7 +21,7 @@
  
  #ifdef LUA_USE_UUID
@@ -23,9 +25,10 @@ Signed-off-by: Morgan Little <morgan.little@windriver.com>
  
  /*  Lua method: <uuid> = uuid.generate(<version>[, <uuid-namespace>, <data>])  */
  static int luuid_generate(lua_State *L)
-
---- a/rpmio/rpmuuid.c.orig
-+++ b/rpmio/rpmuuid.c
+Index: rpm-5.4.14/rpmio/rpmuuid.c
+===================================================================
+--- rpm-5.4.14.orig/rpmio/rpmuuid.c
++++ rpm-5.4.14/rpmio/rpmuuid.c
 @@ -16,7 +16,7 @@
  #include "rpmlog.h"
  #include "rpmuuid.h"
@@ -34,4 +37,4 @@ Signed-off-by: Morgan Little <morgan.little@windriver.com>
 +#include <ossp/uuid.h>
  #endif
  #include "debug.h"
-
+ 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch b/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
index fddac7a..3492da5 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
@@ -7,11 +7,11 @@ A logic error in the query for GHOST files prevented this from working.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: rpm-5.4.9/lib/verify.c
+Index: rpm-5.4.14/lib/verify.c
 ===================================================================
---- rpm-5.4.9.orig/lib/verify.c
-+++ rpm-5.4.9/lib/verify.c
-@@ -587,7 +587,7 @@ uint32_t fc = rpmfiFC(fi);
+--- rpm-5.4.14.orig/lib/verify.c
++++ rpm-5.4.14/lib/verify.c
+@@ -589,7 +589,7 @@ uint32_t fc = rpmfiFC(fi);
  
  	/* If not verifying %ghost, skip ghost files. */
  	/* XXX the broken!!! logic disables %ghost queries always. */
diff --git a/meta/recipes-devtools/rpm/rpm/rpmatch.patch b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
index 8ea3490..20d13aa 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmatch.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
@@ -8,26 +8,26 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: rpm-5.4.0/configure.ac
+Index: rpm-5.4.14/configure.ac
 ===================================================================
---- rpm-5.4.0.orig/configure.ac	2012-05-31 15:40:05.985990822 -0700
-+++ rpm-5.4.0/configure.ac	2012-05-31 15:41:15.601995311 -0700
-@@ -800,7 +800,7 @@
+--- rpm-5.4.14.orig/configure.ac
++++ rpm-5.4.14/configure.ac
+@@ -943,7 +943,7 @@ AC_CHECK_FUNCS([dnl
      ftok getaddrinfo getattrlist getcwd getdelim getline getmode getnameinfo dnl
      getpassphrase getxattr getwd iconv inet_aton lchflags lchmod lchown dnl
      lgetxattr lsetxattr lutimes madvise mempcpy mkdtemp mkstemp mtrace dnl
--    posix_fadvise posix_fallocate putenv realpath regcomp __secure_getenv dnl
-+    posix_fadvise posix_fallocate putenv realpath regcomp rpmatch __secure_getenv dnl
+-    posix_fadvise posix_fallocate putenv realpath regcomp secure_getenv __secure_getenv dnl
++    posix_fadvise posix_fallocate putenv realpath regcomp rpmatch secure_getenv __secure_getenv dnl
      setattrlist setenv setlocale setmode setxattr dnl
      sigaddset sigdelset sigemptyset sighold sigrelse sigpause dnl
      sigprocmask sigsuspend sigaction dnl
-Index: rpm-5.4.0/system.h
+Index: rpm-5.4.14/system.h
 ===================================================================
---- rpm-5.4.0.orig/system.h	2012-05-31 15:40:05.997991504 -0700
-+++ rpm-5.4.0/system.h	2012-05-31 15:42:04.941997731 -0700
-@@ -410,6 +410,14 @@
- #endif /* defined(__GNUC__) */
- #endif	/* HAVE_MCHECK_H */
+--- rpm-5.4.14.orig/system.h
++++ rpm-5.4.14/system.h
+@@ -353,6 +353,14 @@ extern int _tolower(int) __THROW	/*@*/;
+ #include <libgen.h>
+ #endif
  
 +#ifndef HAVE_RPMATCH
 +#define rpmatch(line) \
@@ -37,6 +37,6 @@ Index: rpm-5.4.0/system.h
 +	  -1 )
 +#endif
 +
- /* Retrofit glibc __progname */
+ /* -- Retrofit glibc __progname */
  #if defined __GLIBC__ && __GLIBC__ >= 2
  #if __GLIBC_MINOR__ >= 1
diff --git a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
index f29866b..9bdd1d4 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
@@ -16,11 +16,11 @@ RP 2012/2/7
  2 files changed, 152 insertions(+), 1 deletions(-)
  create mode 100644 tools/rpmdeps-oecore.c
 
-Index: rpm-5.4.9/tools/Makefile.am
+Index: rpm-5.4.14/tools/Makefile.am
 ===================================================================
---- rpm-5.4.9.orig/tools/Makefile.am
-+++ rpm-5.4.9/tools/Makefile.am
-@@ -58,7 +58,7 @@ pkgbin_PROGRAMS =	\
+--- rpm-5.4.14.orig/tools/Makefile.am
++++ rpm-5.4.14/tools/Makefile.am
+@@ -62,7 +62,7 @@ pkgbin_PROGRAMS =	\
  	@WITH_AUGEAS_AUGTOOL@ chroot cp @WITH_CUDF_CUDFTOOL@ find mtree \
  	@WITH_SEMANAGE_SEMODULE@ wget \
  	rpmcache rpmdigest rpmrepo rpmspecdump \
@@ -29,7 +29,7 @@ Index: rpm-5.4.9/tools/Makefile.am
  if WITH_DB
  pkgbin_PROGRAMS +=	dbconvert
  endif
-@@ -168,6 +168,10 @@ rpmdeps_SOURCES =	rpmdeps.c
+@@ -172,6 +172,10 @@ rpmdeps_SOURCES =	rpmdeps.c
  rpmdeps_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
  rpmdeps_LDADD =		$(RPM_LDADD_COMMON)
  
@@ -40,10 +40,10 @@ Index: rpm-5.4.9/tools/Makefile.am
  rpmdigest_SOURCES =	rpmdigest.c
  rpmdigest_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
  rpmdigest_LDADD =	$(RPMIO_LDADD_COMMON)
-Index: rpm-5.4.9/tools/rpmdeps-oecore.c
+Index: rpm-5.4.14/tools/rpmdeps-oecore.c
 ===================================================================
 --- /dev/null
-+++ rpm-5.4.9/tools/rpmdeps-oecore.c
++++ rpm-5.4.14/tools/rpmdeps-oecore.c
 @@ -0,0 +1,147 @@
 +#include "system.h"
 +const char *__progname;
diff --git a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
index 64746ce..8870adb 100644
--- a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
+++ b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
@@ -4,10 +4,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: rpm-5.4.9/rpmio/rpmio.h
+Index: rpm-5.4.14/rpmio/rpmio.h
 ===================================================================
---- rpm-5.4.9.orig/rpmio/rpmio.h	2010-09-29 07:54:30.000000000 -0700
-+++ rpm-5.4.9/rpmio/rpmio.h	2012-06-12 07:29:19.610745014 -0700
+--- rpm-5.4.14.orig/rpmio/rpmio.h
++++ rpm-5.4.14/rpmio/rpmio.h
 @@ -23,7 +23,8 @@
   */
  /*@{*/
@@ -18,11 +18,11 @@ Index: rpm-5.4.9/rpmio/rpmio.h
  #define USE_COOKIE_SEEK_POINTER 1
  typedef _IO_off64_t 	_libio_off_t;
  typedef _libio_off_t *	_libio_pos_t;
-Index: rpm-5.4.9/system.h
+Index: rpm-5.4.14/system.h
 ===================================================================
---- rpm-5.4.9.orig/system.h	2012-04-26 10:46:49.000000000 -0700
-+++ rpm-5.4.9/system.h	2012-06-12 07:30:08.242747422 -0700
-@@ -410,7 +410,7 @@
+--- rpm-5.4.14.orig/system.h
++++ rpm-5.4.14/system.h
+@@ -481,7 +481,7 @@ extern void muntrace (void)
  #endif /* defined(__LCLINT__) */
  
  /* Memory allocation via macro defs to get meaningful locations from mtrace() */
@@ -31,11 +31,11 @@ Index: rpm-5.4.9/system.h
  #define	xmalloc(_size) 		(malloc(_size) ? : vmefail(_size))
  #define	xcalloc(_nmemb, _size)	(calloc((_nmemb), (_size)) ? : vmefail(_size))
  #define	xrealloc(_ptr, _size)	(realloc((_ptr), (_size)) ? : vmefail(_size))
-Index: rpm-5.4.9/lib/librpm.vers
+Index: rpm-5.4.14/lib/librpm.vers
 ===================================================================
---- rpm-5.4.9.orig/lib/librpm.vers	2011-04-10 15:55:23.000000000 -0700
-+++ rpm-5.4.9/lib/librpm.vers	2012-06-12 07:29:19.610745014 -0700
-@@ -405,6 +405,10 @@
+--- rpm-5.4.14.orig/lib/librpm.vers
++++ rpm-5.4.14/lib/librpm.vers
+@@ -405,6 +405,10 @@ LIBRPM_0
      specedit;
      strict_erasures;
      XrpmtsiInit;
@@ -46,14 +46,14 @@ Index: rpm-5.4.9/lib/librpm.vers
    local:
      *;
  };
-Index: rpm-5.4.9/rpmio/librpmio.vers
+Index: rpm-5.4.14/rpmio/librpmio.vers
 ===================================================================
---- rpm-5.4.9.orig/rpmio/librpmio.vers	2012-05-07 07:38:23.000000000 -0700
-+++ rpm-5.4.9/rpmio/librpmio.vers	2012-06-12 07:29:19.626745024 -0700
-@@ -994,6 +994,10 @@
-     mongo_simple_int_command;
-     mongo_simple_str_command;
-     mongo_update;
+--- rpm-5.4.14.orig/rpmio/librpmio.vers
++++ rpm-5.4.14/rpmio/librpmio.vers
+@@ -1056,6 +1056,10 @@ LIBRPMIO_0
+     mongo_write_concern_set_mode;
+     mongo_write_concern_set_w;
+     mongo_write_concern_set_wtimeout;
 +    xmalloc;
 +    xrealloc;
 +    xcalloc;
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_5.4.9.bb
rename to meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 690d8b4..0d561ff 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -42,12 +42,11 @@ HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r63"
+DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
-SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;extract=rpm-5.4.9.tar.gz \
+SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;extract=rpm-5.4.14.tar.gz \
 	   file://rpm-log-auto-rm.patch \
 	   file://rpm-db-reduce.patch \
 	   file://perfile_rpmdeps.sh \
@@ -56,7 +55,6 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://header-include-fix.patch \
 	   file://rpm-platform.patch \
 	   file://rpm-showrc.patch \
-	   file://rpm-solvedb.patch \
 	   file://rpm-tools-mtree-LDFLAGS.patch \
 	   file://rpm-fileclass.patch \
 	   file://rpm-canonarch.patch \
@@ -65,7 +63,6 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://pythondeps.sh \
 	   file://rpmdeps-oecore.patch \
 	   file://rpm-resolvedep.patch \
-	   file://rpm-respect-arch.patch \
 	   file://rpm-no-perl-urpm.patch \
 	   file://rpm-macros.patch \
 	   file://rpm-lua.patch \
@@ -78,7 +75,6 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://dbconvert.patch \
 	   file://rpm-uuid-include.patch \
 	   file://makefile-am-exec-hook.patch \
-	   file://rpm-stub-out-git_strerror.patch \
 	   file://rpm-db_buffer_small.patch \
 	   file://rpm-py-init.patch \
 	   file://python-rpm-rpmsense.patch \
@@ -100,8 +96,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 # to process certain package feeds.
 #SRC_URI += "file://rpm-debug-platform.patch"
 
-SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-SRC_URI[sha256sum] = "bac7cc5bd9d0e8262fdc0099349924608da8f680f5cb243751f696552239dde8"
+SRC_URI[md5sum] = "25093d399a0b5d1342d24900a91b347d"
+SRC_URI[sha256sum] = "676e3ab41f72e3b504e04109cfb565a300742f56a7da084f202013b30eeae467"
 
 inherit autotools gettext
 
@@ -143,7 +139,7 @@ PACKAGECONFIG[db] = "${WITH_DB},--without-db,db,"
 
 PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3,"
 
-PACKAGECONFIG[beecrypt] = "--with-beecrypt,--without-beecrypt,beecrypt,"
+PACKAGECONFIG[beecrypt] = "--with-beecrypt=external,--without-beecrypt,beecrypt,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,gcrypt,"
@@ -201,7 +197,8 @@ EXTRA_OECONF += "--verbose \
 		--with-path-macros=${rpm_macros} \
 		--with-path-lib=${libdir}/rpm \
 		--with-bugreport=http://bugzilla.yoctoproject.org \
-		--program-prefix="
+		--program-prefix= \
+		YACC=byacc"
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
@@ -391,6 +388,8 @@ do_configure() {
 	sed -e 's/pkg-config --exists uuid/pkg-config --exists ossp-uuid/g' \
 	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i ${S}/configure
 
+	( cd ${S}/syck ; set +e ; rm -- -l* ; make distclean ) || :
+
 	export varprefix=${localstatedir}
 	oe_runconf
 }
-- 
1.9.3


