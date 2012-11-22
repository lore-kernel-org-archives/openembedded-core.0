Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbdK6-0007wz-Ms
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 21:24:34 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4695709eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 12:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vVY4pgoS97zL65aY9JzhlHI1vGKTg6xKAP8uifGGhYY=;
	b=nDTbTY827K9DL+eHfM/3RHNl/c/a5wnkD8oWxwYBmqGVn79uY7AoB0jqkSGadYWtkr
	LxsgwcJOEYiygETRb3h6BPq4MbhYj+3SoHNQm4tUqFMeGURndlp+WPbr9snA0+FMn3LC
	/TgXAMSY4Ek5oRf11DvpApVmCZcWX3245BSnH39aihrPZL3iLj3gNkbxWfxGJcs/9Z8R
	5UTEhF7DFoNec9vwcbI52vP5PdZjEfJ2dZVjTjgAebtWWHI2RqOwl6hYWEqUX/6JCnUt
	gCn+zgH3p8mtpx9IR9L+YHPFHUhAkIKJykqTbs4lk9tMAzlZn+7VOS7ccf6+/xltHGM6
	qKoQ==
Received: by 10.14.0.3 with SMTP id 3mr4880102eea.16.1353615028121;
	Thu, 22 Nov 2012 12:10:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e7sm9025507eep.1.2012.11.22.12.10.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 12:10:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2012 21:10:23 +0100
Message-Id: <1353615023-5433-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] opkg: bump SRCREV and drop applied patches
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
X-List-Received-Date: Thu, 22 Nov 2012 20:24:34 -0000

* only change upstream which wasn't in oe-core is
  http://code.google.com/p/opkg/source/detail?r=635
  and added testcase for that

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-add-opkg_compare_versions-function.patch  |  54 ------
 ...se-the-uname-gname-fields-when-extracting.patch | 101 -----------
 ...Fix-dependency-issues-for-preinst-scripts.patch | 188 ---------------------
 ...inst-script-is-not-fatal-with-conf-offlin.patch |  71 --------
 ...not-read-etc-opkg-.conf-if-f-is-specified.patch |  93 ----------
 .../opkg/0006-detect-circular-dependencies.patch   | 117 -------------
 ...g-provides-even-when-oldpkg-provides-exis.patch |  49 ------
 .../opkg/opkg/0008-select_higher_version.patch     |  99 -----------
 .../0009-pkg_depends-fix-version-constraints.patch | 188 ---------------------
 ...depends-fix-version_constraints_satisfied.patch |  37 ----
 .../opkg/opkg/alternatives-ln.patch                |  56 ------
 ...t-add-recommends-pkgs-to-depended-upon-by.patch |  26 ---
 ...n-t-print-provides-if-nothing-is-provided.patch |  24 ---
 .../opkg/opkg/opkg-no-sync-offline.patch           |  18 --
 meta/recipes-devtools/opkg/opkg_svn.bb             |  18 +-
 15 files changed, 2 insertions(+), 1137 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0003-Fix-dependency-issues-for-preinst-scripts.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0006-detect-circular-dependencies.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/alternatives-ln.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch b/meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
deleted file mode 100644
index 5dc76d4..0000000
--- a/meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 029cf99fd44645b5fe1b6491355c631da3096e09 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 17 Dec 2011 12:51:07 +0100
-Subject: [PATCH 1/7] add opkg_compare_versions function
-
-* not used in opkg but can be usefull, e.g. instead of
-  opkg-utils/opkg-compare-versions.c
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=93
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/opkg.c | 15 +++++++++++++++
- libopkg/opkg.h |  2 ++
- 2 files changed, 17 insertions(+)
-
-diff --git a/libopkg/opkg.c b/libopkg/opkg.c
-index 92f61f4..eaea529 100644
---- a/libopkg/opkg.c
-+++ b/libopkg/opkg.c
-@@ -870,3 +870,18 @@ opkg_repository_accessibility_check(void)
- 
- 	return ret;
- }
-+
-+int
-+opkg_compare_versions (const char *ver1, const char *ver2)
-+{
-+  pkg_t *pkg1, *pkg2;
-+
-+  pkg1 = pkg_new();
-+  pkg2 = pkg_new();
-+
-+  parse_version(pkg1, ver1);
-+  parse_version(pkg2, ver2);
-+
-+  return pkg_compare_versions(pkg1, pkg2);
-+}
-+
-diff --git a/libopkg/opkg.h b/libopkg/opkg.h
-index 4fbd404..7aa86eb 100644
---- a/libopkg/opkg.h
-+++ b/libopkg/opkg.h
-@@ -58,4 +58,6 @@ pkg_t* opkg_find_package (const char *name, const char *version, const char *arc
- 
- int opkg_repository_accessibility_check(void);
- 
-+int opkg_compare_versions (const char *ver1, const char *ver2);
-+
- #endif /* OPKG_H */
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch b/meta/recipes-devtools/opkg/opkg/0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch
deleted file mode 100644
index f51cf58..0000000
--- a/meta/recipes-devtools/opkg/opkg/0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 254780ab3b0db398447150251332916598d3b9f4 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 11 Nov 2011 17:17:01 +0000
-Subject: [PATCH 2/7] Ensure we use the uname/gname fields when extracting
- tarballs
-
-When updating packages on the target device we ideally want to match
-user and group numbers from the existing file system. This patch encourages
-opkg to lookup the uname/gname fields first and only use the hardcoded
-numerical values if that fails.
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=93
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libbb/unarchive.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 47 insertions(+), 2 deletions(-)
-
-diff --git a/libbb/unarchive.c b/libbb/unarchive.c
-index 5d4464f..d583767 100644
---- a/libbb/unarchive.c
-+++ b/libbb/unarchive.c
-@@ -22,10 +22,13 @@
- #include <stdio.h>
- #include <errno.h>
- #include <stdlib.h>
-+#include <stdbool.h>
- #include <string.h>
- #include <unistd.h>
- #include <utime.h>
- #include <libgen.h>
-+#include <grp.h>
-+#include <pwd.h>
- 
- #include "libbb.h"
- 
-@@ -436,6 +439,42 @@ free_header_ar(file_header_t *ar_entry)
- 	free(ar_entry);
- }
- 
-+static char uname_cache[32] = "";
-+static uid_t uid_cache;
-+
-+static bool update_unamecache(char *uname) {
-+	struct passwd *passwd;
-+	if (!uname)
-+		return FALSE;
-+	if (!uname_cache[0] && strcmp(uname_cache, uname) == 0)
-+		return TRUE;
-+	passwd = getpwnam(uname);
-+	if (passwd) {
-+		uid_cache = passwd->pw_uid;
-+		strncpy(uname, uname_cache, 32);
-+		return TRUE;
-+	}
-+	return FALSE;
-+}
-+
-+static char gname_cache[32] = "";
-+static gid_t gid_cache;
-+
-+static bool update_gnamecache(char *gname) {
-+	struct group *group;
-+	if (!gname)
-+		return FALSE;
-+	if (!gname_cache[0] && strcmp(gname_cache, gname) == 0)
-+		return TRUE;
-+	group = getgrnam(gname);
-+	if (group) {
-+		gid_cache = group->gr_gid;
-+		strncpy(gname, gname_cache, 32);
-+		return TRUE;
-+	}
-+	return FALSE;
-+}
-+
- 
- static file_header_t *
- get_header_tar(FILE *tar_stream)
-@@ -515,8 +554,14 @@ get_header_tar(FILE *tar_stream)
- */
-         tar_entry->mode = 07777 & strtol(tar.formated.mode, NULL, 8);
- 
--	tar_entry->uid   = strtol(tar.formated.uid, NULL, 8);
--	tar_entry->gid   = strtol(tar.formated.gid, NULL, 8);
-+	if (update_unamecache(tar.formated.uname))
-+		tar_entry->uid = uid_cache;
-+	else
-+		tar_entry->uid = strtol(tar.formated.uid, NULL, 8);
-+	if (update_gnamecache(tar.formated.gname))
-+		tar_entry->gid = gid_cache;
-+	else
-+		tar_entry->gid = strtol(tar.formated.gid, NULL, 8);
- 	tar_entry->size  = strtol(tar.formated.size, NULL, 8);
- 	tar_entry->mtime = strtol(tar.formated.mtime, NULL, 8);
- 
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0003-Fix-dependency-issues-for-preinst-scripts.patch b/meta/recipes-devtools/opkg/opkg/0003-Fix-dependency-issues-for-preinst-scripts.patch
deleted file mode 100644
index 195598f..0000000
--- a/meta/recipes-devtools/opkg/opkg/0003-Fix-dependency-issues-for-preinst-scripts.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 6a294b6dad681b0e95aa061bc368d801d2ddc781 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 15 Dec 2011 21:08:49 +0000
-Subject: [PATCH 3/7] Fix dependency issues for preinst scripts
-
-There is a problem with dependency order when installing packages. The key
-problem revolves around the satisfy_dependencies_for() function which is
-called from opkg_install_pkg just before the installation (and preinst)
-happens.
-
-The satisfy_dependencies_for() function calls pkg_hash_fetch_unsatisfied_dependencies()
-which will only return packages which were previously not marked as
-*going* to be installed at some point. For the purposes of
-opkg_install_pkg() we really need to know which dependencies haven't been
-installed yet.
-
-This patch adds pkg_hash_fetch_satisfied_dependencies() which returns a
-list of package dependencies. We can then directly check the status of
-these and ensure any hard dependencies (not suggestions or recommendations)
-are installed before returning.
-
-Consider the situation (where -> means 'depends on'):
-
-X -> A,E
-A -> B,E
-E -> B
-B -> C
-
-Currently X would install A and E. When installing A the packages B, E
-and C would be marked as "to install". When the package B is considered
-the second time (as a dependency of E rather than A), it would install
-straight away even though C was not currently installed, just marked
-as needing to be installed.
-
-The patch changes the behaviour so B can't install until C really is installed.
-
-This change is required to run the postinst scripts in the correct order.
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=93
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/opkg_install.c | 21 +++++++++++++
- libopkg/pkg_depends.c  | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
- libopkg/pkg_depends.h  |  1 +
- 3 files changed, 104 insertions(+)
-
-diff --git a/libopkg/opkg_install.c b/libopkg/opkg_install.c
-index 3925f58..1632066 100644
---- a/libopkg/opkg_install.c
-+++ b/libopkg/opkg_install.c
-@@ -76,6 +76,27 @@ satisfy_dependencies_for(pkg_t *pkg)
-      }
- 
-      if (ndepends <= 0) {
-+	  pkg_vec_free(depends);      
-+	  depends = pkg_hash_fetch_satisfied_dependencies(pkg);
-+
-+	  for (i = 0; i < depends->len; i++) {
-+	       dep = depends->pkgs[i];
-+	       /* The package was uninstalled when we started, but another
-+	          dep earlier in this loop may have depended on it and pulled
-+	          it in, so check first. */
-+	       if ((dep->state_status != SS_INSTALLED) && (dep->state_status != SS_UNPACKED)) {
-+		    opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
-+		    err = opkg_install_pkg(dep, 0);
-+		    /* mark this package as having been automatically installed to
-+		     * satisfy a dependency */
-+		    dep->auto_installed = 1;
-+		    if (err) {
-+			 pkg_vec_free(depends);
-+			 return err;
-+		    }
-+	       }
-+	  }
-+
- 	  pkg_vec_free(depends);
- 	  return 0;
-      }
-diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index 1e14d1f..36c76aa 100644
---- a/libopkg/pkg_depends.c
-+++ b/libopkg/pkg_depends.c
-@@ -259,6 +259,88 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
-      return unsatisfied->len;
- }
- 
-+
-+pkg_vec_t *
-+pkg_hash_fetch_satisfied_dependencies(pkg_t * pkg)
-+{
-+     pkg_vec_t *satisfiers;
-+     int i, j, k;
-+     int count;
-+     abstract_pkg_t * ab_pkg;
-+
-+     satisfiers = pkg_vec_alloc();
-+
-+     /*
-+      * this is a setup to check for redundant/cyclic dependency checks,
-+      * which are marked at the abstract_pkg level
-+      */
-+     if (!(ab_pkg = pkg->parent)) {
-+	  opkg_msg(ERROR, "Internal error, with pkg %s.\n", pkg->name);
-+	  return satisfiers;
-+     }
-+
-+     count = pkg->pre_depends_count + pkg->depends_count + pkg->recommends_count + pkg->suggests_count;
-+     if (!count)
-+	  return satisfiers;
-+
-+     /* foreach dependency */
-+     for (i = 0; i < count; i++) {
-+	  compound_depend_t * compound_depend = &pkg->depends[i];
-+	  depend_t ** possible_satisfiers = compound_depend->possibilities;;
-+
-+          if (compound_depend->type == RECOMMEND || compound_depend->type == SUGGEST)
-+              continue;
-+
-+	  if (compound_depend->type == GREEDY_DEPEND) {
-+	       /* foreach possible satisfier */
-+	       for (j = 0; j < compound_depend->possibility_count; j++) {
-+		    /* foreach provided_by, which includes the abstract_pkg itself */
-+		    abstract_pkg_t *abpkg = possible_satisfiers[j]->pkg;
-+		    abstract_pkg_vec_t *ab_provider_vec = abpkg->provided_by;
-+		    int nposs = ab_provider_vec->len;
-+		    abstract_pkg_t **ab_providers = ab_provider_vec->pkgs;
-+		    int l;
-+		    for (l = 0; l < nposs; l++) {
-+			 pkg_vec_t *test_vec = ab_providers[l]->pkgs;
-+			 /* if no depends on this one, try the first package that Provides this one */
-+			 if (!test_vec){   /* no pkg_vec hooked up to the abstract_pkg!  (need another feed?) */
-+			      continue;
-+			 }
-+
-+			 /* cruise this possiblity's pkg_vec looking for an installed version */
-+			 for (k = 0; k < test_vec->len; k++) {
-+			      pkg_t *pkg_scout = test_vec->pkgs[k];
-+			      /* not installed, and not already known about? */
-+			      if (pkg_scout->state_want == SW_INSTALL && pkg_scout != pkg)
-+      			          pkg_vec_insert(satisfiers, pkg_scout);
-+			 }
-+		    }
-+	       }
-+
-+	       continue;
-+	  }
-+
-+	  /* foreach possible satisfier, look for installed package  */
-+	  for (j = 0; j < compound_depend->possibility_count; j++) {
-+	       /* foreach provided_by, which includes the abstract_pkg itself */
-+	       depend_t *dependence_to_satisfy = possible_satisfiers[j];
-+	       abstract_pkg_t *satisfying_apkg = possible_satisfiers[j]->pkg;
-+	       pkg_t *satisfying_pkg =
-+		    pkg_hash_fetch_best_installation_candidate(satisfying_apkg,
-+							       pkg_installed_and_constraint_satisfied,
-+							       dependence_to_satisfy, 0);
-+               /* Being that I can't test constraing in pkg_hash, I will test it here */
-+	       if (satisfying_pkg != NULL && satisfying_pkg != pkg) {
-+                  if (pkg_constraint_satisfied(satisfying_pkg, dependence_to_satisfy) && (satisfying_pkg->state_want == SW_INSTALL || satisfying_pkg->state_want == SW_UNKNOWN))
-+	              pkg_vec_insert(satisfiers, satisfying_pkg);
-+               }
-+
-+	  }
-+     }
-+     return satisfiers;
-+}
-+
-+
- /*checking for conflicts !in replaces
-   If a packages conflicts with another but is also replacing it, I should not consider it a
-   really conflicts
-diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
-index 5d1f074..b8072e2 100644
---- a/libopkg/pkg_depends.h
-+++ b/libopkg/pkg_depends.h
-@@ -82,6 +82,7 @@ char *pkg_depend_str(pkg_t *pkg, int index);
- void buildDependedUponBy(pkg_t * pkg, abstract_pkg_t * ab_pkg);
- int version_constraints_satisfied(depend_t * depends, pkg_t * pkg);
- int pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *depends, char *** unresolved);
-+pkg_vec_t * pkg_hash_fetch_satisfied_dependencies(pkg_t * pkg);
- pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
- int pkg_dependence_satisfiable(depend_t *depend);
- int pkg_dependence_satisfied(depend_t *depend);
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch b/meta/recipes-devtools/opkg/opkg/0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch
deleted file mode 100644
index 900c150..0000000
--- a/meta/recipes-devtools/opkg/opkg/0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 1f709b4540e12cf7e08592aae0ad7e3e35322cab Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 15 Dec 2011 21:08:49 +0000
-Subject: [PATCH 4/7] Failed postinst script is not fatal with
- conf->offline_root
-
-When we have an offline root and have specified force-postinstall,
-attempt to run the postinstall but if it fails, just leave it in the
-status file as needing to run. We can issue a NOTICE this is happened
-but supress errors. This means the OE class doesn't have to do any
-further post processing of the postinstalls itself.
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=93
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/opkg_cmd.c       | 3 ++-
- libopkg/opkg_configure.c | 5 ++++-
- libopkg/pkg.c            | 5 +++--
- 3 files changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/libopkg/opkg_cmd.c b/libopkg/opkg_cmd.c
-index 11e7867..36ff8eb 100644
---- a/libopkg/opkg_cmd.c
-+++ b/libopkg/opkg_cmd.c
-@@ -453,7 +453,8 @@ opkg_configure_packages(char *pkg_name)
- 		    pkg->state_flag &= ~SF_PREFER;
- 		    opkg_state_changed++;
- 	       } else {
--		    err = -1;
-+                    if (!conf->offline_root)
-+		         err = -1;
- 	       }
- 	  }
-      }
-diff --git a/libopkg/opkg_configure.c b/libopkg/opkg_configure.c
-index 719da5a..169828d 100644
---- a/libopkg/opkg_configure.c
-+++ b/libopkg/opkg_configure.c
-@@ -35,7 +35,10 @@ opkg_configure(pkg_t *pkg)
- 
-     err = pkg_run_script(pkg, "postinst", "configure");
-     if (err) {
--	opkg_msg(ERROR, "%s.postinst returned %d.\n", pkg->name, err);
-+        if (!conf->offline_root)
-+	     opkg_msg(ERROR, "%s.postinst returned %d.\n", pkg->name, err);
-+        else
-+	     opkg_msg(NOTICE, "%s.postinst returned %d, marking as unpacked only, configuration required on target.\n", pkg->name, err);
- 	return err;
-     }
- 
-diff --git a/libopkg/pkg.c b/libopkg/pkg.c
-index d8c3984..6ccbde2 100644
---- a/libopkg/pkg.c
-+++ b/libopkg/pkg.c
-@@ -1297,8 +1297,9 @@ pkg_run_script(pkg_t *pkg, const char *script, const char *args)
-      free(cmd);
- 
-      if (err) {
--	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
--               pkg->name, script, err);
-+          if (!conf->offline_root)
-+	       opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
-+                    pkg->name, script, err);
- 	  return err;
-      }
- 
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch b/meta/recipes-devtools/opkg/opkg/0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch
deleted file mode 100644
index 3313bf7..0000000
--- a/meta/recipes-devtools/opkg/opkg/0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 541b6b7bd80dc321493e42955d93b277af0c9221 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Mon, 9 Jul 2012 11:01:15 +0100
-Subject: [PATCH 5/7] Do not read /etc/opkg/*.conf if -f is specified
-
-If a configuration file is specified on the command line, we should
-assume it contains all of the configuration and not try to read the
-configuration in /etc/opkg.
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=93
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/opkg_conf.c | 55 +++++++++++++++++++++++++++--------------------------
- 1 file changed, 28 insertions(+), 27 deletions(-)
-
-diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
-index 4711ce7..1e65bad 100644
---- a/libopkg/opkg_conf.c
-+++ b/libopkg/opkg_conf.c
-@@ -473,39 +473,40 @@ opkg_conf_load(void)
- 				&conf->pkg_src_list, &conf->dist_src_list))
- 			goto err1;
- 	}
--
--	if (conf->offline_root)
--		sprintf_alloc(&etc_opkg_conf_pattern, "%s/etc/opkg/*.conf", conf->offline_root);
- 	else {
--		const char *conf_file_dir = getenv("OPKG_CONF_DIR");
--		if (conf_file_dir == NULL)
--			conf_file_dir = OPKG_CONF_DEFAULT_CONF_FILE_DIR;
--			sprintf_alloc(&etc_opkg_conf_pattern, "%s/*.conf", conf_file_dir);
--	}
--
--	memset(&globbuf, 0, sizeof(globbuf));
--	glob_ret = glob(etc_opkg_conf_pattern, 0, glob_errfunc, &globbuf);
--	if (glob_ret && glob_ret != GLOB_NOMATCH) {
--		free(etc_opkg_conf_pattern);
--		globfree(&globbuf);
--		goto err1;
--	}
--
--	free(etc_opkg_conf_pattern);
-+		if (conf->offline_root)
-+			sprintf_alloc(&etc_opkg_conf_pattern, "%s/etc/opkg/*.conf", conf->offline_root);
-+		else {
-+			const char *conf_file_dir = getenv("OPKG_CONF_DIR");
-+			if (conf_file_dir == NULL)
-+				conf_file_dir = OPKG_CONF_DEFAULT_CONF_FILE_DIR;
-+				sprintf_alloc(&etc_opkg_conf_pattern, "%s/*.conf", conf_file_dir);
-+		}
- 
--	for (i = 0; i < globbuf.gl_pathc; i++) {
--		if (globbuf.gl_pathv[i])
--			if (conf->conf_file &&
--					!strcmp(conf->conf_file, globbuf.gl_pathv[i]))
--				continue;
--		if ( opkg_conf_parse_file(globbuf.gl_pathv[i],
--			&conf->pkg_src_list, &conf->dist_src_list)<0) {
-+		memset(&globbuf, 0, sizeof(globbuf));
-+		glob_ret = glob(etc_opkg_conf_pattern, 0, glob_errfunc, &globbuf);
-+		if (glob_ret && glob_ret != GLOB_NOMATCH) {
-+			free(etc_opkg_conf_pattern);
- 			globfree(&globbuf);
- 			goto err1;
- 		}
--	}
- 
--	globfree(&globbuf);
-+		free(etc_opkg_conf_pattern);
-+
-+		for (i = 0; i < globbuf.gl_pathc; i++) {
-+			if (globbuf.gl_pathv[i])
-+				if (conf->conf_file &&
-+						!strcmp(conf->conf_file, globbuf.gl_pathv[i]))
-+					continue;
-+			if ( opkg_conf_parse_file(globbuf.gl_pathv[i],
-+				&conf->pkg_src_list, &conf->dist_src_list)<0) {
-+				globfree(&globbuf);
-+				goto err1;
-+			}
-+		}
-+
-+		globfree(&globbuf);
-+	}
- 
- 	if (conf->offline_root)
- 		sprintf_alloc (&lock_file, "%s/%s", conf->offline_root, OPKGLOCKFILE);
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0006-detect-circular-dependencies.patch b/meta/recipes-devtools/opkg/opkg/0006-detect-circular-dependencies.patch
deleted file mode 100644
index 5cf8618..0000000
--- a/meta/recipes-devtools/opkg/opkg/0006-detect-circular-dependencies.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From f434078a342435ae8a666b599d989c30d4c6a7f5 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sun, 18 Dec 2011 23:54:30 +0000
-Subject: [PATCH 6/7] detect circular dependencies
-
-Add logic to detect circular dependencies. If we see any dependency from
-any given parent twice, ignore it the second time and print a notice message
-that we did so.
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=93
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/opkg_install.c | 8 ++++++++
- libopkg/pkg.c          | 2 ++
- libopkg/pkg.h          | 1 +
- libopkg/pkg_depends.c  | 3 +--
- libopkg/pkg_depends.h  | 1 +
- 5 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/libopkg/opkg_install.c b/libopkg/opkg_install.c
-index 1632066..0216914 100644
---- a/libopkg/opkg_install.c
-+++ b/libopkg/opkg_install.c
-@@ -84,8 +84,14 @@ satisfy_dependencies_for(pkg_t *pkg)
- 	       /* The package was uninstalled when we started, but another
- 	          dep earlier in this loop may have depended on it and pulled
- 	          it in, so check first. */
-+               if (is_pkg_in_pkg_vec(dep->wanted_by, pkg)) {
-+		    opkg_msg(NOTICE,"Breaking cicular dependency on %s for %s.\n", pkg->name, dep->name);
-+	            continue;
-+               }
- 	       if ((dep->state_status != SS_INSTALLED) && (dep->state_status != SS_UNPACKED)) {
- 		    opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
-+                    if (!is_pkg_in_pkg_vec(dep->wanted_by, pkg))
-+     	                 pkg_vec_insert(dep->wanted_by, pkg);
- 		    err = opkg_install_pkg(dep, 0);
- 		    /* mark this package as having been automatically installed to
- 		     * satisfy a dependency */
-@@ -115,6 +121,8 @@ satisfy_dependencies_for(pkg_t *pkg)
- 	  /* The package was uninstalled when we started, but another
- 	     dep earlier in this loop may have depended on it and pulled
- 	     it in, so check first. */
-+          if (!is_pkg_in_pkg_vec(dep->wanted_by, pkg))
-+	       pkg_vec_insert(dep->wanted_by, pkg);
- 	  if ((dep->state_status != SS_INSTALLED)
- 	      && (dep->state_status != SS_UNPACKED)) {
-                opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
-diff --git a/libopkg/pkg.c b/libopkg/pkg.c
-index 6ccbde2..be486ee 100644
---- a/libopkg/pkg.c
-+++ b/libopkg/pkg.c
-@@ -86,6 +86,7 @@ pkg_init(pkg_t *pkg)
-      pkg->section = NULL;
-      pkg->description = NULL;
-      pkg->state_want = SW_UNKNOWN;
-+     pkg->wanted_by = pkg_vec_alloc();
-      pkg->state_flag = SF_OK;
-      pkg->state_status = SS_NOT_INSTALLED;
-      pkg->depends_str = NULL;
-@@ -191,6 +192,7 @@ pkg_deinit(pkg_t *pkg)
- 	pkg->description = NULL;
- 
- 	pkg->state_want = SW_UNKNOWN;
-+	pkg_vec_free(pkg->wanted_by);
- 	pkg->state_flag = SF_OK;
- 	pkg->state_status = SS_NOT_INSTALLED;
- 
-diff --git a/libopkg/pkg.h b/libopkg/pkg.h
-index 775b656..5d468cb 100644
---- a/libopkg/pkg.h
-+++ b/libopkg/pkg.h
-@@ -129,6 +129,7 @@ struct pkg
-      char *description;
-      char *tags;
-      pkg_state_want_t state_want;
-+     pkg_vec_t *wanted_by;
-      pkg_state_flag_t state_flag;
-      pkg_state_status_t state_status;
-      char **depends_str;
-diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index 36c76aa..a72eed7 100644
---- a/libopkg/pkg_depends.c
-+++ b/libopkg/pkg_depends.c
-@@ -30,7 +30,6 @@ static int parseDepends(compound_depend_t *compound_depend, char * depend_str);
- static depend_t * depend_init(void);
- static char ** add_unresolved_dep(pkg_t * pkg, char ** the_lost, int ref_ndx);
- static char ** merge_unresolved(char ** oldstuff, char ** newstuff);
--static int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
- 
- static int pkg_installed_and_constraint_satisfied(pkg_t *pkg, void *cdata)
- {
-@@ -531,7 +530,7 @@ int pkg_dependence_satisfied(depend_t *depend)
-      return 0;
- }
- 
--static int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg)
-+int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg)
- {
-     int i;
-     pkg_t ** pkgs = vec->pkgs;
-diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
-index b8072e2..ca0801f 100644
---- a/libopkg/pkg_depends.h
-+++ b/libopkg/pkg_depends.h
-@@ -87,5 +87,6 @@ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
- int pkg_dependence_satisfiable(depend_t *depend);
- int pkg_dependence_satisfied(depend_t *depend);
- const char* constraint_to_str(enum version_constraint c);
-+int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
- 
- #endif
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch b/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
deleted file mode 100644
index f1be7b8..0000000
--- a/meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3340b120909ea353440cfffe01fed43c55387a00 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 19 Sep 2012 17:31:45 +0200
-Subject: [PATCH 7/7] merge newpkg->provides even when oldpkg->provides
- existed
-
-* introduced in http://code.google.com/p/opkg/source/diff?spec=svn277&r=277&format=side&path=/trunk/libopkg/pkg.c
-* the problem happens when oldpkg provide 1 and newpkg provide 2
-  provides_count is merged to 2, but oldpkg->provides has only 1 entry
-  causing SIGSEGV:
-  pkg_formatted_field (fp=fp@entry=0x1444ce0, pkg=pkg@entry=0x120c620, field=<optimized out>, field@entry=0x7ffff7bd2abe "Provides") at pkg.c:739
-  739                           fprintf(fp, "%s %s", i == 1 ? "" : ",",
-  (gdb) bt
-  #0  pkg_formatted_field (fp=fp@entry=0x1444ce0, pkg=pkg@entry=0x120c620, field=<optimized out>, field@entry=0x7ffff7bd2abe "Provides") at pkg.c:739
-  #1  0x00007ffff7bc32fc in pkg_print_status (pkg=0x120c620, file=0x1444ce0) at pkg.c:887
-  #2  0x00007ffff7bbff59 in opkg_conf_write_status_files () at opkg_conf.c:400
-  #3  0x00007ffff7bbad8a in write_status_files_if_changed () at opkg_cmd.c:65
-  #4  0x00007ffff7bbb73e in opkg_upgrade_cmd (argc=<optimized out>, argv=<optimized out>) at opkg_cmd.c:577
-  #5  0x00007ffff7bbbcc2 in opkg_cmd_exec (cmd=cmd@entry=0x7ffff7dda080, argc=argc@entry=1, argv=argv@entry=0x7fffffffe768) at opkg_cmd.c:1319
-  #6  0x000000000040165f in main (argc=3, argv=0x7fffffffe758) at opkg-cl.c:377
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=93
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/pkg.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/libopkg/pkg.c b/libopkg/pkg.c
-index be486ee..255c673 100644
---- a/libopkg/pkg.c
-+++ b/libopkg/pkg.c
-@@ -377,10 +377,8 @@ pkg_merge(pkg_t *oldpkg, pkg_t *newpkg)
- 	  oldpkg->provides_count = newpkg->provides_count;
- 	  newpkg->provides_count = 0;
- 
--	  if (!oldpkg->provides) {
--		oldpkg->provides = newpkg->provides;
--		newpkg->provides = NULL;
--	  }
-+	  oldpkg->provides = newpkg->provides;
-+	  newpkg->provides = NULL;
-      }
- 
-      if (!oldpkg->conflicts_count) {
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch b/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
deleted file mode 100644
index a9b039c..0000000
--- a/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Add the --prefer-arch-to-version option
-
-If there were more than one candidate which had the same pkg name in the
-candidate list, for example, the same pkg with different versions, then
-it would use the last one which was the highest version one in the past,
-but it will use the higher arch priority when this option is specified.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libopkg/opkg_conf.h |    1 +
- libopkg/pkg_hash.c  |   18 +++++++++++++++---
- src/opkg-cl.c       |    9 +++++++++
- 3 files changed, 25 insertions(+), 3 deletions(-)
-
-diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
---- a/libopkg/opkg_conf.h
-+++ b/libopkg/opkg_conf.h
-@@ -77,6 +77,7 @@ struct opkg_conf
-      int force_removal_of_essential_packages;
-      int force_postinstall;
-      int force_remove;
-+     int prefer_arch_to_version;
-      int check_signature;
-      int nodeps; /* do not follow dependencies */
-      char *offline_root;
-diff --git a/libopkg/pkg_hash.c b/libopkg/pkg_hash.c
---- a/libopkg/pkg_hash.c
-+++ b/libopkg/pkg_hash.c
-@@ -376,10 +376,22 @@ pkg_hash_fetch_best_installation_candidate(abstract_pkg_t *apkg,
-           if (constraint_fcn(matching, cdata)) {
-              opkg_msg(DEBUG, "Candidate: %s %s.\n",
- 			     matching->name, matching->version) ;
--             good_pkg_by_name = matching;
- 	     /* It has been provided by hand, so it is what user want */
--             if (matching->provided_by_hand == 1)
--                break;
-+             if (matching->provided_by_hand == 1) {
-+                 good_pkg_by_name = matching;
-+                 break;
-+             }
-+             /* Respect to the arch priorities when given alternatives */
-+             if (good_pkg_by_name && conf->prefer_arch_to_version) {
-+                 if (matching->arch_priority >= good_pkg_by_name->arch_priority) {
-+                     good_pkg_by_name = matching;
-+                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
-+                         matching->name, matching->version) ;
-+                 } else
-+                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
-+                         good_pkg_by_name->name, good_pkg_by_name->version) ;
-+             } else
-+                 good_pkg_by_name = matching;
-           }
-      }
- 
-diff --git a/src/opkg-cl.c b/src/opkg-cl.c
---- a/src/opkg-cl.c
-+++ b/src/opkg-cl.c
-@@ -42,6 +42,7 @@ enum {
- 	ARGS_OPT_FORCE_SPACE,
- 	ARGS_OPT_FORCE_POSTINSTALL,
- 	ARGS_OPT_FORCE_REMOVE,
-+	ARGS_OPT_PREFER_ARCH_TO_VERSION,
- 	ARGS_OPT_ADD_ARCH,
- 	ARGS_OPT_ADD_DEST,
- 	ARGS_OPT_NOACTION,
-@@ -83,6 +84,8 @@ static struct option long_options[] = {
- 	{"force_postinstall", 0, 0, ARGS_OPT_FORCE_POSTINSTALL},
- 	{"force-remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
- 	{"force_remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
-+	{"prefer-arch-to-version", 0, 0, ARGS_OPT_PREFER_ARCH_TO_VERSION},
-+	{"prefer-arch-to-version", 0, 0, ARGS_OPT_PREFER_ARCH_TO_VERSION},
- 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
- 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
- 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
-@@ -173,6 +176,9 @@ args_parse(int argc, char *argv[])
- 		case ARGS_OPT_FORCE_REMOVE:
- 			conf->force_remove = 1;
- 			break;
-+		case ARGS_OPT_PREFER_ARCH_TO_VERSION:
-+			conf->prefer_arch_to_version = 1;
-+			break;
- 		case ARGS_OPT_NODEPS:
- 			conf->nodeps = 1;
- 			break;
-@@ -271,6 +277,9 @@ usage()
- 	printf("\t--offline-root <dir>	offline installation of packages.\n");
- 	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
- 	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
-+	printf("\t--prefer-arch-to-version\t 	Use the architecture priority package rather\n");
-+	printf("\t				than the higher version one if more\n");
-+	printf("\t				than one candidate is found.\n");
- 
- 	printf("\nForce Options:\n");
- 	printf("\t--force-depends		Install/remove despite failed dependencies\n");
--- 
-1.7.1
-
diff --git a/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
deleted file mode 100644
index f7aa4ea..0000000
--- a/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From b93ce2249751e0d90dab38e91691a6e9f33c3512 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 29 Sep 2012 11:38:03 +0200
-Subject: [PATCH 09/10] pkg_depends: fix version constraints
-
-* factor parsing version constraint to str_to_constraint and use that
-  from pkg (pkg_version_satisfied) and also pkg_depends (parseDepends)
-* fix constraint_to_str(), for EARLIER and LATER it was using '<' and
-  '>' which is parsed later as EARLIER_EQUAL and LATER_EQUAL
-* show notice when deprecated '<' or '>' is used
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=94
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/pkg.c         | 36 +++++++++++--------------
- libopkg/pkg_depends.c | 73 +++++++++++++++++++++++++++++----------------------
- libopkg/pkg_depends.h |  1 +
- 3 files changed, 59 insertions(+), 51 deletions(-)
-
-diff --git a/libopkg/pkg.c b/libopkg/pkg.c
-index 255c673..1e98b9c 100644
---- a/libopkg/pkg.c
-+++ b/libopkg/pkg.c
-@@ -968,28 +968,24 @@ pkg_version_satisfied(pkg_t *it, pkg_t *ref, const char *op)
-      int r;
- 
-      r = pkg_compare_versions(it, ref);
-+     char *op2 = op;
-+     enum version_constraint constraint = str_to_constraint(&op2);
- 
--     if (strcmp(op, "<=") == 0 || strcmp(op, "<") == 0) {
--	  return r <= 0;
--     }
--
--     if (strcmp(op, ">=") == 0 || strcmp(op, ">") == 0) {
--	  return r >= 0;
--     }
--
--     if (strcmp(op, "<<") == 0) {
--	  return r < 0;
--     }
--
--     if (strcmp(op, ">>") == 0) {
--	  return r > 0;
--     }
--
--     if (strcmp(op, "=") == 0) {
--	  return r == 0;
-+     switch (constraint) 
-+     {
-+     case EARLIER_EQUAL:
-+          return r <= 0;
-+     case LATER_EQUAL:
-+          return r >= 0;
-+     case EARLIER:
-+          return r < 0;
-+     case LATER:
-+          return r > 0;
-+     case EQUAL:
-+          return r == 0;
-+     case NONE:
-+          opkg_msg(ERROR, "Unknown operator: %s.\n", op);
-      }
--
--     opkg_msg(ERROR, "Unknown operator: %s.\n", op);
-      return 0;
- }
- 
-diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index a72eed7..3dd8240 100644
---- a/libopkg/pkg_depends.c
-+++ b/libopkg/pkg_depends.c
-@@ -781,7 +781,7 @@ constraint_to_str(enum version_constraint c)
- 	case NONE:
- 		return "";
- 	case EARLIER:
--		return "< ";
-+		return "<< ";
- 	case EARLIER_EQUAL:
- 	       return "<= ";
- 	case EQUAL:
-@@ -789,12 +789,51 @@ constraint_to_str(enum version_constraint c)
- 	case LATER_EQUAL:
- 	      return ">= ";
- 	case LATER:
--	     return "> ";
-+	     return ">> ";
- 	}
- 
- 	return "";
- }
- 
-+enum version_constraint
-+str_to_constraint(char **str)
-+{
-+	if(!strncmp(*str, "<<", 2)){
-+		*str += 2;
-+		return EARLIER;
-+	}
-+	else if(!strncmp(*str, "<=", 2)){
-+		*str += 2;
-+		return EARLIER_EQUAL;
-+	}
-+	else if(!strncmp(*str, ">=", 2)){
-+		*str += 2;
-+		return LATER_EQUAL;
-+	}
-+	else if(!strncmp(*str, ">>", 2)){
-+		*str += 2;
-+		return LATER;
-+	}
-+	else if(!strncmp(*str, "=", 1)){
-+		*str += 1;
-+		return EQUAL;
-+	}
-+	/* should these be here to support deprecated designations; dpkg does */
-+	else if(!strncmp(*str, "<", 1)){
-+		*str += 1;
-+		opkg_msg(NOTICE, "Deprecated version constraint '<' was used with the same meaning as '<='. Use '<<' for EARLIER constraint.\n");
-+		return EARLIER_EQUAL;
-+	}
-+	else if(!strncmp(*str, ">", 1)){
-+		*str += 1;
-+		opkg_msg(NOTICE, "Deprecated version constraint '>' was used with the same meaning as '>='. Use '>>' for LATER constraint.\n");
-+		return LATER_EQUAL;
-+	}
-+	else {
-+		return NONE;
-+	}
-+}
-+
- /*
-  * Returns a printable string for pkg's dependency at the specified idx. The
-  * resultant string must be passed to free() by the caller.
-@@ -949,35 +988,7 @@ static int parseDepends(compound_depend_t *compound_depend,
- 	  /* extract constraint and version */
- 	  if(*src == '('){
- 	       src++;
--	       if(!strncmp(src, "<<", 2)){
--		    possibilities[i]->constraint = EARLIER;
--		    src += 2;
--	       }
--	       else if(!strncmp(src, "<=", 2)){
--		    possibilities[i]->constraint = EARLIER_EQUAL;
--		    src += 2;
--	       }
--	       else if(!strncmp(src, ">=", 2)){
--		    possibilities[i]->constraint = LATER_EQUAL;
--		    src += 2;
--	       }
--	       else if(!strncmp(src, ">>", 2)){
--		    possibilities[i]->constraint = LATER;
--		    src += 2;
--	       }
--	       else if(!strncmp(src, "=", 1)){
--		    possibilities[i]->constraint = EQUAL;
--		    src++;
--	       }
--	       /* should these be here to support deprecated designations; dpkg does */
--	       else if(!strncmp(src, "<", 1)){
--		    possibilities[i]->constraint = EARLIER_EQUAL;
--		    src++;
--	       }
--	       else if(!strncmp(src, ">", 1)){
--		    possibilities[i]->constraint = LATER_EQUAL;
--		    src++;
--	       }
-+	       possibilities[i]->constraint = str_to_constraint(&src);
- 
- 	       /* now we have any constraint, pass space to version string */
- 	       while(isspace(*src)) src++;
-diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
-index ca0801f..685a722 100644
---- a/libopkg/pkg_depends.h
-+++ b/libopkg/pkg_depends.h
-@@ -87,6 +87,7 @@ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
- int pkg_dependence_satisfiable(depend_t *depend);
- int pkg_dependence_satisfied(depend_t *depend);
- const char* constraint_to_str(enum version_constraint c);
-+enum version_constraint str_to_constraint(char **str);
- int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
- 
- #endif
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch b/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
deleted file mode 100644
index a13d658..0000000
--- a/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e9add8fe4a63ef14aba8bd238ddde84d5470b611 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 29 Sep 2012 18:56:01 +0200
-Subject: [PATCH 10/10] pkg_depends: fix version_constraints_satisfied
-
-* with
-  Package: a
-  Version: 1
-  and
-  Conflicts: a (<< 1)
-  we have comparison == 0, but constraint EARLIER is not satisfied!
-
-Upstream-Status: Submitted
-http://code.google.com/p/opkg/issues/detail?id=94
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- libopkg/pkg_depends.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index 3dd8240..be81b7f 100644
---- a/libopkg/pkg_depends.c
-+++ b/libopkg/pkg_depends.c
-@@ -464,7 +464,8 @@ int version_constraints_satisfied(depend_t * depends, pkg_t * pkg)
-     else if((depends->constraint == LATER) &&
- 	    (comparison > 0))
- 	return 1;
--    else if(comparison == 0)
-+    else if((depends->constraint == EQUAL) && 
-+	    (comparison == 0))
- 	return 1;
-     else if((depends->constraint == LATER_EQUAL) &&
- 	    (comparison >= 0))
--- 
-1.7.12
-
diff --git a/meta/recipes-devtools/opkg/opkg/alternatives-ln.patch b/meta/recipes-devtools/opkg/opkg/alternatives-ln.patch
deleted file mode 100644
index f257eb0..0000000
--- a/meta/recipes-devtools/opkg/opkg/alternatives-ln.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-update-alternatives: use 'ln -n'
-
-Using the '-n' option (--no-dereference) is a better way to solve the
-do-not-link-into-directory issue.  Using only 'ln -sf' can cause problems
-on SELinux enabled hosts when target is inaccessible; e.g. when preparing
-an offline rootsystem:
-
- | $ cd <offline root>
- | $ ln -sf /lib/systemd/systemd sbin/init     # alternative #1
- | $ ln -sf /bin/busybox sbin/init             # alternative #2
- | ln: accessing `sbin/init': Permission denied
- | 
- |  --> strace:
- | brk(0)                                  = 0x102b000
- | stat("sbin/init", 0x7fffaa91c900)       = -1 EACCES (Permission denied)
- | ...
- | exit_group(1)                           = ?
-
-Now with '-n':
-
- | $ ln -snf /bin/busybox sbin/init
- | lstat("sbin/init", {st_mode=S_IFLNK|0777, st_size=20, ...}) = 0
- | lstat("sbin/init", {st_mode=S_IFLNK|0777, st_size=20, ...}) = 0
- | stat("/bin/busybox", 0x7fff8c1a3bd0)    = -1 ENOENT (No such file or directory)
- | symlink("/bin/busybox", "sbin/init")    = -1 EEXIST (File exists)
- | unlink("sbin/init")                     = 0
- | symlink("/bin/busybox", "sbin/init")    = 0
-
-
-The '-n' flag is well supported (coreutils have it at least since
-1999, busybox at least since 0.60.3 (2002)) and it obsoletes the
-explicit check whether target is a directory.
-
-Upstream-Status: pending [http://code.google.com/p/opkg/issues/detail?id=95]
-Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-
-Index: trunk/utils/update-alternatives.in
-===================================================================
---- trunk.orig/utils/update-alternatives.in
-+++ trunk/utils/update-alternatives.in
-@@ -113,14 +113,7 @@ find_best_alt() {
- 		if [ ! -d $link_dir ]; then
- 			mkdir -p $link_dir
- 		fi
--		if [ -h $link -a -d $link ]; then
--			# If $link exists and the target is a directory,
--			# 'ln -sf $path $link' doesn't replace the link to
--			# that directory, it creates new link inside.
--			echo "update-alternatives: Removing $link".
--			rm -f $link
--		fi
--		ln -sf $path $link
-+		ln -snf $path $link
- 		echo "update-alternatives: Linking $link to $path"
- 	else
- 		echo "update-alternatives: Error: not linking $link to $path since $link exists and is not a link"
diff --git a/meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch b/meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
deleted file mode 100644
index e581dc0..0000000
--- a/meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-While removing a package with opkg, the process shouldn't be blocked if
-another package RECOMMENDS the package wanted to be removed. This is
-because, while generating the dependencies, opkg adds dependencies to
-depended_upon_by even if dependency's type is RECOMMEND. The fix is to
-skip dependencies of type RECOMMEND while constructing depended_upon_by.
-
-Bug info:
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=2431
-
-Upstream-Status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: trunk/libopkg/pkg_depends.c
-===================================================================
---- trunk.orig/libopkg/pkg_depends.c	2011-09-03 05:54:56.000000000 +0300
-+++ trunk/libopkg/pkg_depends.c	2012-10-20 22:23:03.783573202 +0300
-@@ -785,8 +785,7 @@
- 	for (i = 0; i < count; i++) {
- 		depends = &pkg->depends[i];
- 		if (depends->type != PREDEPEND
--		    && depends->type != DEPEND
--		    && depends->type != RECOMMEND)
-+		    && depends->type != DEPEND)
- 			continue;
- 		for (j = 0; j < depends->possibility_count; j++) {
- 			ab_depend = depends->possibilities[j]->pkg;
diff --git a/meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch b/meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch
deleted file mode 100644
index 669faef..0000000
--- a/meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Every package provides itself. While printing package information all
-fields are printed only if there is any relevant info for them. For
-example: a package with no "Replaces" won't get this printed at all.
-Packages which provide only themselves, were printing this field but with
-no values. This patch skips this field if the package provides only
-itself.
-
-Upstream-Status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: trunk/libopkg/pkg.c
-===================================================================
---- trunk.orig/libopkg/pkg.c	2011-12-18 02:11:34.000000000 +0200
-+++ trunk/libopkg/pkg.c	2012-10-20 22:20:04.109201287 +0300
-@@ -731,7 +731,8 @@
- 	  } else if (strcasecmp(field, "Priority") == 0) {
-                fprintf(fp, "Priority: %s\n", pkg->priority);
- 	  } else if (strcasecmp(field, "Provides") == 0) {
--	       if (pkg->provides_count) {
-+	       /* Don't print provides if this package provides only itself */
-+	       if (pkg->provides_count > 1) {
-                   fprintf(fp, "Provides:");
- 		  for(i = 1; i < pkg->provides_count; i++) {
-                       fprintf(fp, "%s %s", i == 1 ? "" : ",",
diff --git a/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch b/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch
deleted file mode 100644
index b1b3453..0000000
--- a/meta/recipes-devtools/opkg/opkg/opkg-no-sync-offline.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-When installing into an offline root, calling sync() is pointless and just 
-hurts performance.  Don't let's do that.
-
-Signed-off-by: Phil Blundell <philb@gnu.org>
-Upstream-Status: Pending
-
---- a/libopkg/opkg_cmd.c	2011-09-08 10:53:07.000000000 +0100
-+++ b/libopkg/opkg_cmd.c	2011-10-04 10:45:22.278615584 +0100
-@@ -64,7 +64,8 @@ write_status_files_if_changed(void)
- 	  opkg_msg(INFO, "Writing status file.\n");
- 	  opkg_conf_write_status_files();
- 	  pkg_write_changed_filelists();
--	  sync();
-+	  if (!conf->offline_root)
-+	      sync();
-      } else {
- 	  opkg_msg(DEBUG, "Nothing to be done.\n");
-      }
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 064cf43..ee78488 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -1,25 +1,11 @@
 require opkg.inc
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
-  file://0001-add-opkg_compare_versions-function.patch \
-  file://0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch \
-  file://0003-Fix-dependency-issues-for-preinst-scripts.patch \
-  file://0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch \
-  file://0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch \
-  file://0006-detect-circular-dependencies.patch \
-  file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch \
-  file://0008-select_higher_version.patch \
-  file://0009-pkg_depends-fix-version-constraints.patch \
-  file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
-  file://opkg-no-sync-offline.patch \
-  file://alternatives-ln.patch \
-  file://don-t-add-recommends-pkgs-to-depended-upon-by.patch \
-  file://don-t-print-provides-if-nothing-is-provided.patch \
 "
 
 S = "${WORKDIR}/trunk"
 
-SRCREV = "633"
+SRCREV = "649"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.0"
-- 
1.8.0



