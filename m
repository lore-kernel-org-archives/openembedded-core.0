Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id B62C07864F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465155"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:01:52 +0200
Message-Id: <20180201180210.21652-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/20] rpm: update to 4.14.1
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:13 -0000

Drop two upstreamed patches.

License-Update: grammar fixes
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...code-lib-rpm-as-the-installation-path-for.patch |  16 +--
 ...ure-cope-with-multiple-users-groups-with-.patch |  43 ------
 .../0013-Add-a-new-option-alldeps-to-rpmdeps.patch | 153 ---------------------
 .../rpm/{rpm_4.14.0.bb => rpm_4.14.1.bb}           |   9 +-
 4 files changed, 12 insertions(+), 209 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
 rename meta/recipes-devtools/rpm/{rpm_4.14.0.bb => rpm_4.14.1.bb} (94%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index d7b1145bc5b..5604cb90373 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,7 +1,7 @@
-From 2b1a3f900f15034943fc41661eaab41bcc0d4d84 Mon Sep 17 00:00:00 2001
+From c82c19dc583843b1a975f2e3f2e151656a6f377c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
-Subject: [PATCH 06/15] Do not hardcode "lib/rpm" as the installation path for
+Subject: [PATCH 06/14] Do not hardcode "lib/rpm" as the installation path for
  default configuration and macros.
 
 Upstream-Status: Denied [https://github.com/rpm-software-management/rpm/pull/263]
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 373d69484..c04a2e8d1 100644
+index 7155d9f00..21b95ae5f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1038,7 +1038,7 @@ else
+@@ -1047,7 +1047,7 @@ else
      usrprefix=$prefix
  fi
  
@@ -27,7 +27,7 @@ index 373d69484..c04a2e8d1 100644
  
  AC_SUBST(OBJDUMP)
 diff --git a/macros.in b/macros.in
-index 3f8dbba61..da4812540 100644
+index d08624856..68a972f1e 100644
 --- a/macros.in
 +++ b/macros.in
 @@ -954,7 +954,7 @@ package or when debugging this package.\
@@ -40,7 +40,7 @@ index 3f8dbba61..da4812540 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index f0df0202f..37205a5eb 100644
+index 51225892d..e0c834d37 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,7 +55,7 @@ index f0df0202f..37205a5eb 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 8:0:0
+ rpm_version_info = 8:1:0
 -- 
-2.14.2
+2.15.1
 
diff --git a/meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch b/meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch
deleted file mode 100644
index 31024bd7e8b..00000000000
--- a/meta/recipes-devtools/rpm/files/0001-Make-configure-cope-with-multiple-users-groups-with-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/a3652af66fa2a1f272d771323fee019f23d350f5]
-
-From 68a7b60f89419e53a4bd3c412f816f0576ffd8c4 Mon Sep 17 00:00:00 2001
-From: Mike Crowe <mac@mcrowe.com>
-Date: Thu, 4 Jan 2018 14:39:51 +0000
-Subject: [PATCH] Make configure cope with multiple users/groups with ID 0
-
-If /etc/passwd contains multiple users with UID 0 then user_with_uid0 will
-contain a line feed which results in config.h containing:
-
- #define UID_0_USER "root
-
-(i.e. without a closing quote.)
-
-The same problem occurs with /etc/group.
-
-Let's only emit the first match in each case so that there is only ever a
-single result.
-
-Signed-off-by: Mike Crowe <mac@mcrowe.com>
-
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ab8ca4f54..5259ad243 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -996,8 +996,8 @@ if test "$with_dmalloc" = yes ; then
-   LIBS="$LIBS -ldmalloc"
- fi
- 
--user_with_uid0=$(awk -F: '$3==0 {print $1}' /etc/passwd)
--group_with_gid0=$(awk -F: '$3==0 {print $1}' /etc/group)
-+user_with_uid0=$(awk -F: '$3==0 {print $1;exit}' /etc/passwd)
-+group_with_gid0=$(awk -F: '$3==0 {print $1;exit}' /etc/group)
- AC_DEFINE_UNQUOTED([UID_0_USER],["$user_with_uid0"],[Get the user name having userid 0])
- AC_DEFINE_UNQUOTED([GID_0_GROUP],["$group_with_gid0"],[Get the group name having groupid 0])
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch b/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
deleted file mode 100644
index d84e8b54d8d..00000000000
--- a/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From ef9f8c17c3e5c35d3b55db9ca76b0fa0d6336421 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Mon, 15 May 2017 11:23:26 +0200
-Subject: [PATCH 10/15] Add a new option --alldeps to rpmdeps
-
-This will send the output from rpmfcPrint() to stdout. This is an
-alternative to using the --rpmfcdebug option, which will send the same
-output to stderr. The two options have totally different use cases
-though. While --alldeps is used when the output from rpmfcPrint() is
-what is wanted, --rpmfcdebug can be used together with the other
-output options, e.g., --requires, without affecting their output.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/220]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
----
- build/rpmfc.c   | 27 ++++++++++++++-------------
- build/rpmfc.h   |  1 -
- tools/rpmdeps.c | 44 +++++++++++++++++++++++++-------------------
- 3 files changed, 39 insertions(+), 33 deletions(-)
-
-diff --git a/build/rpmfc.c b/build/rpmfc.c
-index b8aea76d0..d04ffb297 100644
---- a/build/rpmfc.c
-+++ b/build/rpmfc.c
-@@ -692,7 +692,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)
- 
- void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
- {
--    rpm_color_t fcolor;
-     int ndx;
-     int dx;
-     int fx;
-@@ -704,21 +703,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
- 
-     if (fc)
-     for (fx = 0; fx < fc->nfiles; fx++) {
--	rpmsid cx = fc->fcdictx[fx] + 1; /* id's are one off */
--	fcolor = fc->fcolor[fx];
--	ARGV_t fattrs = fc->fattrs[fx];
--
- 	fprintf(fp, "%3d %s", fx, fc->fn[fx]);
--	if (fcolor != RPMFC_BLACK)
-+	if (_rpmfc_debug) {
-+	    rpmsid cx = fc->fcdictx[fx] + 1; /* id's are one off */
-+	    rpm_color_t fcolor = fc->fcolor[fx];
-+	    ARGV_t fattrs = fc->fattrs[fx];
-+
-+	    if (fcolor != RPMFC_BLACK)
- 		fprintf(fp, "\t0x%x", fc->fcolor[fx]);
--	else
-+	    else
- 		fprintf(fp, "\t%s", rpmstrPoolStr(fc->cdict, cx));
--	if (fattrs) {
--	    char *attrs = argvJoin(fattrs, ",");
--	    fprintf(fp, " [%s]", attrs);
--	    free(attrs);
--	} else {
--	    fprintf(fp, " [none]");
-+	    if (fattrs) {
-+		char *attrs = argvJoin(fattrs, ",");
-+		fprintf(fp, " [%s]", attrs);
-+		free(attrs);
-+	    } else {
-+		fprintf(fp, " [none]");
-+	    }
- 	}
- 	fprintf(fp, "\n");
- 
-diff --git a/build/rpmfc.h b/build/rpmfc.h
-index dae8ea5b1..3d87b31cf 100644
---- a/build/rpmfc.h
-+++ b/build/rpmfc.h
-@@ -45,7 +45,6 @@ typedef const struct rpmfcTokens_s * rpmfcToken;
- 
- /** \ingroup rpmfc
-  * Print results of file classification.
-- * @todo Remove debugging routine.
-  * @param msg		message prefix (NULL for none)
-  * @param fc		file classifier
-  * @param fp		output file handle (NULL for stderr)
-diff --git a/tools/rpmdeps.c b/tools/rpmdeps.c
-index 419befce1..f260a38c4 100644
---- a/tools/rpmdeps.c
-+++ b/tools/rpmdeps.c
-@@ -23,6 +23,8 @@ static int print_conflicts;
- 
- static int print_obsoletes;
- 
-+static int print_alldeps;
-+
- static void rpmdsPrint(const char * msg, rpmds ds, FILE * fp)
- {
-     if (fp == NULL) fp = stderr;
-@@ -57,6 +59,8 @@ static struct poptOption optionsTable[] = {
-         NULL, NULL },
-  { "obsoletes", '\0', POPT_ARG_VAL, &print_obsoletes, -1,
-         NULL, NULL },
-+ { "alldeps", '\0', POPT_ARG_VAL, &print_alldeps, -1,
-+        NULL, NULL },
- 
-    POPT_AUTOALIAS
-    POPT_AUTOHELP
-@@ -100,25 +104,27 @@ main(int argc, char *argv[])
-     if (rpmfcClassify(fc, av, NULL) || rpmfcApply(fc))
- 	goto exit;
- 
--    if (_rpmfc_debug)
--	rpmfcPrint(NULL, fc, NULL);
--
--    if (print_provides)
--	rpmdsPrint(NULL, rpmfcProvides(fc), stdout);
--    if (print_requires)
--	rpmdsPrint(NULL, rpmfcRequires(fc), stdout);
--    if (print_recommends)
--	rpmdsPrint(NULL, rpmfcRecommends(fc), stdout);
--    if (print_suggests)
--	rpmdsPrint(NULL, rpmfcSuggests(fc), stdout);
--    if (print_supplements)
--	rpmdsPrint(NULL, rpmfcSupplements(fc), stdout);
--    if (print_enhances)
--	rpmdsPrint(NULL, rpmfcEnhances(fc), stdout);
--    if (print_conflicts)
--	rpmdsPrint(NULL, rpmfcConflicts(fc), stdout);
--    if (print_obsoletes)
--	rpmdsPrint(NULL, rpmfcObsoletes(fc), stdout);
-+    if (print_alldeps || _rpmfc_debug)
-+	rpmfcPrint(NULL, fc, print_alldeps ? stdout : NULL);
-+
-+    if (!print_alldeps) {
-+	if (print_provides)
-+	    rpmdsPrint(NULL, rpmfcProvides(fc), stdout);
-+	if (print_requires)
-+	    rpmdsPrint(NULL, rpmfcRequires(fc), stdout);
-+	if (print_recommends)
-+	    rpmdsPrint(NULL, rpmfcRecommends(fc), stdout);
-+	if (print_suggests)
-+	    rpmdsPrint(NULL, rpmfcSuggests(fc), stdout);
-+	if (print_supplements)
-+	    rpmdsPrint(NULL, rpmfcSupplements(fc), stdout);
-+	if (print_enhances)
-+	    rpmdsPrint(NULL, rpmfcEnhances(fc), stdout);
-+	if (print_conflicts)
-+	    rpmdsPrint(NULL, rpmfcConflicts(fc), stdout);
-+	if (print_obsoletes)
-+	    rpmdsPrint(NULL, rpmfcObsoletes(fc), stdout);
-+    }
- 
-     ec = 0;
- 
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.0.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
similarity index 94%
rename from meta/recipes-devtools/rpm/rpm_4.14.0.bb
rename to meta/recipes-devtools/rpm/rpm_4.14.1.bb
index aa2579e3bfd..d75902788e4 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -22,7 +22,7 @@ HOMEPAGE = "http://www.rpm.org"
 
 # libraries are also LGPL - how to express this?
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f5259151d26ff18e78023450a5ac8d96"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
 
 SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
@@ -34,17 +34,15 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-Fix-build-with-musl-C-library.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
            file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
-           file://0013-Add-a-new-option-alldeps-to-rpmdeps.patch \
            file://0001-Split-binary-package-building-into-a-separate-functi.patch \
            file://0002-Run-binary-package-creation-via-thread-pools.patch \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
-           file://0001-Make-configure-cope-with-multiple-users-groups-with-.patch \
            "
 
 PE = "1"
-SRCREV = "da3720f62e57648fb1dc2a632744d38866139971"
+SRCREV = "bfee1410af51c1cc9724791fb8d985260a62102b"
 
 S = "${WORKDIR}/git"
 
@@ -107,7 +105,8 @@ do_install_append () {
 	    ${D}/${libdir}/rpm/macros
 
 	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
-	    ${D}${libdir}/rpm/pythondistdeps.py
+	    ${D}${libdir}/rpm/pythondistdeps.py \
+	    ${D}${libdir}/rpm/python-macro-helper
 }
 
 FILES_${PN} += "${libdir}/rpm-plugins/*.so \
-- 
2.15.1


