Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1121CC54E92
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 08:09:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6024.1747814976251893053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 01:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236463a26=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6voNS008810;
	Wed, 21 May 2025 01:09:32 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs90xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 May 2025 01:09:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 01:09:13 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 01:09:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Peter.Marko@siemens.com>, <mathieu.dubois-briand@bootlin.com>,
        <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/5] patch: upgrade 2.7.6 -> 2.8
Date: Wed, 21 May 2025 16:09:22 +0800
Message-ID: <20250521080925.815334-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521080925.815334-1-hongxu.jia@windriver.com>
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aGCVbugd4loZgnCe6T8GvII40c2PDNhA
X-Proofpoint-ORIG-GUID: aGCVbugd4loZgnCe6T8GvII40c2PDNhA
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682d8a3b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=mRyU3MEP5rKVZtIlR2QA:9 a=PfxFQXKW5NZQLPm0:21 a=xbPn9E6qFyUA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA3OSBTYWx0ZWRfX5pgkun/zFahf pSW3HgMwWZXHfRZWd3pZCjsFZA21BEVyghb/urmjNeftYQ3UpKTmZhuEo6DyHsWlYxE9xrguuqc hRIn22N0msaN11Zrrk6BzUDXDEnv9ozwaQ/Ac6zF04SqULJuVWMl8RPZkRLMDlR9WJkRgYCakca
 FLyoJqQcyKt+DDstas4sbr2dZjOB0CX0GJ1JcJFv54iTvlEKKP3m0SUw4dmye5ZXkzgkjZrj6el 008FE6upp4E5Z7GhxMx9LZX50vxWg4BeRHXvHzI4djc9+KY5B5m5mEinoU23GgubuXQ2YforGzs xZszUdqBrRkmPlJqDgrfHUzdHEv2SdbDgQ7DPC4Wgz/7WQTAVs6N3nwXBh5Cn5bfYqkzJ4uvH6G
 BdyzWObR5s9aRtggxvWx5vQpxZ7eBjxg4sVHF9ypCJuPSF/+jCp3gbUwbc0J0ATwpReUzHX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217001

Drop obsolete patch, the lib/gnulib.mk has been removed by upstream
- 0001-Unset-need_charset_alias-when-building-for-musl.patch

Drop backport patches:
- 0002-Fix-segfault-with-mangled-rename-patch.patch
- 0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
- 0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
- 0001-Fix-swapping-fake-lines-in-pch_swap.patch
- CVE-2019-13636.patch
- 0001-Invoke-ed-directly-instead-of-using-the-shell.patch
- 0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
- 0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
- CVE-2019-20633.patch

GNU patch 2.8 released: http://savannah.gnu.org/news/?id=10741

NEWS since v2.7.6 (2018-02-03):

    The --follow-symlinks option now applies to output files as well as input.
    'patch' now supports file timestamps after 2038 even on traditional

  GNU/Linux platforms where time_t defaults to 32 bits.

    'patch' no longer creates files with names containing newlines,

  as encouraged by POSIX.1-2024.

    Patches can no longer contain NUL ('\0') bytes in diff directive lines.

  These bytes would otherwise cause unpredictable behavior.

    Patches can now contain sequences of spaces and tabs around line numbers

  and in other places where POSIX requires support for these sequences.

    --enable-gcc-warnings no longer uses expensive static checking.

  Use --enable-gcc-warnings=expensive if you still want it.

    Fix undefined or ill-defined behavior in unusual cases, such as very

  large sizes, possible stack overflow, I/O errors, memory exhaustion,
  races with other processes, and signals arriving at inopportune moments.

    Remove old "Plan B" code, designed for machines with 16-bit pointers.
    Assume C99 or later; previously it assumed C89 or later.
    Port to current GCC, Autoconf, Gnulib, etc.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...porary-file-on-failed-ed-style-patch.patch |  94 --------
 ...mporary-file-on-failed-multi-file-ed.patch |  81 -------
 ...-Fix-swapping-fake-lines-in-pch_swap.patch |  36 ---
 ...-directly-instead-of-using-the-shell.patch |  44 ----
 ...charset_alias-when-building-for-musl.patch |  33 ---
 ...x-segfault-with-mangled-rename-patch.patch |  35 ---
 ...s-to-be-missing-for-ed-style-patches.patch |  38 ----
 ...mmand-execution-in-ed-style-patches-.patch | 215 ------------------
 .../patch/patch/CVE-2019-13636.patch          | 113 ---------
 .../patch/patch/CVE-2019-20633.patch          |  31 ---
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  25 --
 meta/recipes-devtools/patch/patch_2.8.bb      |  13 ++
 12 files changed, 13 insertions(+), 745 deletions(-)
 delete mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
 delete mode 100644 meta/recipes-devtools/patch/patch_2.7.6.bb
 create mode 100644 meta/recipes-devtools/patch/patch_2.8.bb

diff --git a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
deleted file mode 100644
index 78345e925e4..00000000000
--- a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 7f770b9c20da1a192dad8cb572a6391f2773285a Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Thu, 3 May 2018 14:31:55 +0200
-Subject: [PATCH 1/2] Don't leak temporary file on failed ed-style patch
-
-Now that we write ed-style patches to a temporary file before we
-apply them, we need to ensure that the temporary file is removed
-before we leave, even on fatal error.
-
-* src/pch.c (do_ed_script): Use global TMPEDNAME instead of local
-  tmpname. Don't unlink the file directly, instead tag it for removal
-  at exit time.
-* src/patch.c (cleanup): Unlink TMPEDNAME at exit.
-
-This closes bug #53820:
-https://savannah.gnu.org/bugs/index.php?53820
-
-Fixes: 123eaff0d5d1 ("Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)")
-
-CVE: CVE-2018-1000156
-Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=19599883ffb6a450d2884f081f8ecf68edbed7ee]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- src/common.h |  2 ++
- src/pch.c    | 12 +++++-------
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/common.h b/src/common.h
-index ec50b40..22238b5 100644
---- a/src/common.h
-+++ b/src/common.h
-@@ -94,10 +94,12 @@ XTERN char const *origsuff;
- XTERN char const * TMPINNAME;
- XTERN char const * TMPOUTNAME;
- XTERN char const * TMPPATNAME;
-+XTERN char const * TMPEDNAME;
- 
- XTERN bool TMPINNAME_needs_removal;
- XTERN bool TMPOUTNAME_needs_removal;
- XTERN bool TMPPATNAME_needs_removal;
-+XTERN bool TMPEDNAME_needs_removal;
- 
- #ifdef DEBUGGING
- XTERN int debug;
-diff --git a/src/pch.c b/src/pch.c
-index 16e001a..c1a62cf 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -2392,7 +2392,6 @@ do_ed_script (char const *inname, char const *outname,
-     file_offset beginning_of_this_line;
-     size_t chars_read;
-     FILE *tmpfp = 0;
--    char const *tmpname;
-     int tmpfd;
-     pid_t pid;
- 
-@@ -2404,12 +2403,13 @@ do_ed_script (char const *inname, char const *outname,
- 	   invalid commands and treats the next line as a new command, which
- 	   can lead to arbitrary command execution.  */
- 
--	tmpfd = make_tempfile (&tmpname, 'e', NULL, O_RDWR | O_BINARY, 0);
-+	tmpfd = make_tempfile (&TMPEDNAME, 'e', NULL, O_RDWR | O_BINARY, 0);
- 	if (tmpfd == -1)
--	  pfatal ("Can't create temporary file %s", quotearg (tmpname));
-+        pfatal ("Can't create temporary file %s", quotearg (TMPEDNAME));
-+        TMPEDNAME_needs_removal = true;
- 	tmpfp = fdopen (tmpfd, "w+b");
- 	if (! tmpfp)
--	  pfatal ("Can't open stream for file %s", quotearg (tmpname));
-+        pfatal ("Can't open stream for file %s", quotearg (TMPEDNAME));
-       }
- 
-     for (;;) {
-@@ -2449,8 +2449,7 @@ do_ed_script (char const *inname, char const *outname,
-       write_fatal ();
- 
-     if (lseek (tmpfd, 0, SEEK_SET) == -1)
--      pfatal ("Can't rewind to the beginning of file %s", quotearg (tmpname));
--
-+        pfatal ("Can't rewind to the beginning of file %s", quotearg (TMPEDNAME));
-     if (! dry_run && ! skip_rest_of_patch) {
- 	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
- 	*outname_needs_removal = true;
-@@ -2482,7 +2481,6 @@ do_ed_script (char const *inname, char const *outname,
-     }
- 
-     fclose (tmpfp);
--    safe_unlink (tmpname);
- 
-     if (ofp)
-       {
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
deleted file mode 100644
index 8ffffef47ef..00000000000
--- a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 369dcccdfa6336e5a873d6d63705cfbe04c55727 Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Mon, 7 May 2018 15:14:45 +0200
-Subject: Don't leak temporary file on failed multi-file ed-style patch
-
-The previous fix worked fine with single-file ed-style patches, but
-would still leak temporary files in the case of multi-file ed-style
-patch. Fix that case as well, and extend the test case to check for
-it.
-
-* src/patch.c (main): Unlink TMPEDNAME if needed before moving to
-  the next file in a patch.
-
-This closes bug #53820:
-https://savannah.gnu.org/bugs/index.php?53820
-
-Fixes: 123eaff0d5d1 ("Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)")
-Fixes: 19599883ffb6 ("Don't leak temporary file on failed ed-style patch")
-
-CVE: CVE-2018-1000156
-Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=369dcccdfa6336e5a873d6d63705cfbe04c55727]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- src/patch.c    |  1 +
- tests/ed-style | 31 +++++++++++++++++++++++++++++++
- 2 files changed, 32 insertions(+)
-
-diff --git a/src/patch.c b/src/patch.c
-index 9146597..81c7a02 100644
---- a/src/patch.c
-+++ b/src/patch.c
-@@ -236,6 +236,7 @@ main (int argc, char **argv)
- 	    }
- 	  remove_if_needed (TMPOUTNAME, &TMPOUTNAME_needs_removal);
- 	}
-+      remove_if_needed (TMPEDNAME, &TMPEDNAME_needs_removal);
- 
-       if (! skip_rest_of_patch && ! file_type)
- 	{
-diff --git a/tests/ed-style b/tests/ed-style
-index 6b6ef9d..504e6e5 100644
---- a/tests/ed-style
-+++ b/tests/ed-style
-@@ -38,3 +38,34 @@ EOF
- check 'cat foo' <<EOF
- foo
- EOF
-+
-+# Test the case where one ed-style patch modifies several files
-+
-+cat > ed3.diff <<EOF
-+--- foo
-++++ foo
-+1c
-+bar
-+.
-+--- baz
-++++ baz
-+0a
-+baz
-+.
-+EOF
-+
-+# Apparently we can't create a file with such a patch, while it works fine
-+# when the file name is provided on the command line
-+cat > baz <<EOF
-+EOF
-+
-+check 'patch -e -i ed3.diff' <<EOF
-+EOF
-+
-+check 'cat foo' <<EOF
-+bar
-+EOF
-+
-+check 'cat baz' <<EOF
-+baz
-+EOF
--- 
-cgit v1.0-41-gc330
-
diff --git a/meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch b/meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch
deleted file mode 100644
index 049149eb9e5..00000000000
--- a/meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9c986353e420ead6e706262bf204d6e03322c300 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 17 Aug 2018 13:35:40 +0200
-Subject: [PATCH] Fix swapping fake lines in pch_swap
-
-* src/pch.c (pch_swap): Fix swapping p_bfake and p_efake when there is a
-blank line in the middle of a context-diff hunk: that empty line stays
-in the middle of the hunk and isn't swapped.
-
-Fixes: https://savannah.gnu.org/bugs/index.php?53133
-Signed-off-by: Andreas Gruenbacher <agruen@gnu.org>
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/git/patch.git]
-CVE: CVE-2018-6952
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/pch.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index e92bc64..a500ad9 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -2122,7 +2122,7 @@ pch_swap (void)
-     }
-     if (p_efake >= 0) {			/* fix non-freeable ptr range */
- 	if (p_efake <= i)
--	    n = p_end - i + 1;
-+	    n = p_end - p_ptrn_lines;
- 	else
- 	    n = -i;
- 	p_efake += n;
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
deleted file mode 100644
index d13d419f51c..00000000000
--- a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 6 Apr 2018 19:36:15 +0200
-Subject: [PATCH] Invoke ed directly instead of using the shell
-
-* src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
-command to avoid quoting vulnerabilities.
-
-CVE: CVE-2019-13638 CVE-2018-20969
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
----
- src/pch.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-
-diff --git a/src/pch.c b/src/pch.c
-index 4fd5a05..16e001a 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char const *outname,
- 	    *outname_needs_removal = true;
- 	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
- 	  }
--	sprintf (buf, "%s %s%s", editor_program,
--		 verbosity == VERBOSE ? "" : "- ",
--		 outname);
- 	fflush (stdout);
- 
- 	pid = fork();
-@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char const *outname,
- 	else if (pid == 0)
- 	  {
- 	    dup2 (tmpfd, 0);
--	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
-+	    assert (outname[0] != '!' && outname[0] != '-');
-+	    execlp (editor_program, editor_program, "-", outname, (char  *) NULL);
- 	    _exit (2);
- 	  }
- 	else
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4bab4c1..00000000000
--- a/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch b/meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch
deleted file mode 100644
index b0bd6fa83ad..00000000000
--- a/meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f290f48a621867084884bfff87f8093c15195e6a Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Mon, 12 Feb 2018 16:48:24 +0100
-Subject: [PATCH] Fix segfault with mangled rename patch
-
-http://savannah.gnu.org/bugs/?53132
-* src/pch.c (intuit_diff_type): Ensure that two filenames are specified
-for renames and copies (fix the existing check).
-
-Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a]
-CVE: CVE-2018-6951
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
----
- src/pch.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index ff9ed2c..bc6278c 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -974,7 +974,8 @@ intuit_diff_type (bool need_header, mode_t *p_file_type)
-     if ((pch_rename () || pch_copy ())
- 	&& ! inname
- 	&& ! ((i == OLD || i == NEW) &&
--	      p_name[! reverse] &&
-+	      p_name[reverse] && p_name[! reverse] &&
-+	      name_is_valid (p_name[reverse]) &&
- 	      name_is_valid (p_name[! reverse])))
-       {
- 	say ("Cannot %s file without two valid file names\n", pch_rename () ? "rename" : "copy");
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch b/meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
deleted file mode 100644
index 2a09d0c03b5..00000000000
--- a/meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b5a91a01e5d0897facdd0f49d64b76b0f02b43e1 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 6 Apr 2018 11:34:51 +0200
-Subject: [PATCH] Allow input files to be missing for ed-style patches
-
-* src/pch.c (do_ed_script): Allow input files to be missing so that new
-files will be created as with non-ed-style patches.
-
-Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=b5a91a01e5d0897facdd0f49d64b76b0f02b43e1]
-CVE: CVE-2018-1000156
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- src/pch.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index bc6278c..0c5cc26 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -2394,9 +2394,11 @@ do_ed_script (char const *inname, char const *outname,
- 
-     if (! dry_run && ! skip_rest_of_patch) {
- 	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
--	assert (! inerrno);
--	*outname_needs_removal = true;
--	copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
-+	if (inerrno != ENOENT)
-+	  {
-+	    *outname_needs_removal = true;
-+	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
-+	  }
- 	sprintf (buf, "%s %s%s", editor_program,
- 		 verbosity == VERBOSE ? "" : "- ",
- 		 outname);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch b/meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
deleted file mode 100644
index d74c2f182e5..00000000000
--- a/meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 123eaff0d5d1aebe128295959435b9ca5909c26d Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 6 Apr 2018 12:14:49 +0200
-Subject: [PATCH] Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)
-
-* src/pch.c (do_ed_script): Write ed script to a temporary file instead
-of piping it to ed: this will cause ed to abort on invalid commands
-instead of rejecting them and carrying on.
-* tests/ed-style: New test case.
-* tests/Makefile.am (TESTS): Add test case.
-
-Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d]
-CVE: CVE-2018-1000156
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- src/pch.c         | 91 ++++++++++++++++++++++++++++++++++++++++---------------
- tests/Makefile.am |  1 +
- tests/ed-style    | 41 +++++++++++++++++++++++++
- 3 files changed, 108 insertions(+), 25 deletions(-)
- create mode 100644 tests/ed-style
-
-diff --git a/src/pch.c b/src/pch.c
-index 0c5cc26..4fd5a05 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -33,6 +33,7 @@
- # include <io.h>
- #endif
- #include <safe.h>
-+#include <sys/wait.h>
- 
- #define INITHUNKMAX 125			/* initial dynamic allocation size */
- 
-@@ -2389,24 +2390,28 @@ do_ed_script (char const *inname, char const *outname,
-     static char const editor_program[] = EDITOR_PROGRAM;
- 
-     file_offset beginning_of_this_line;
--    FILE *pipefp = 0;
-     size_t chars_read;
-+    FILE *tmpfp = 0;
-+    char const *tmpname;
-+    int tmpfd;
-+    pid_t pid;
-+
-+    if (! dry_run && ! skip_rest_of_patch)
-+      {
-+	/* Write ed script to a temporary file.  This causes ed to abort on
-+	   invalid commands such as when line numbers or ranges exceed the
-+	   number of available lines.  When ed reads from a pipe, it rejects
-+	   invalid commands and treats the next line as a new command, which
-+	   can lead to arbitrary command execution.  */
-+
-+	tmpfd = make_tempfile (&tmpname, 'e', NULL, O_RDWR | O_BINARY, 0);
-+	if (tmpfd == -1)
-+	  pfatal ("Can't create temporary file %s", quotearg (tmpname));
-+	tmpfp = fdopen (tmpfd, "w+b");
-+	if (! tmpfp)
-+	  pfatal ("Can't open stream for file %s", quotearg (tmpname));
-+      }
- 
--    if (! dry_run && ! skip_rest_of_patch) {
--	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
--	if (inerrno != ENOENT)
--	  {
--	    *outname_needs_removal = true;
--	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
--	  }
--	sprintf (buf, "%s %s%s", editor_program,
--		 verbosity == VERBOSE ? "" : "- ",
--		 outname);
--	fflush (stdout);
--	pipefp = popen(buf, binary_transput ? "wb" : "w");
--	if (!pipefp)
--	  pfatal ("Can't open pipe to %s", quotearg (buf));
--    }
-     for (;;) {
- 	char ed_command_letter;
- 	beginning_of_this_line = file_tell (pfp);
-@@ -2417,14 +2422,14 @@ do_ed_script (char const *inname, char const *outname,
- 	}
- 	ed_command_letter = get_ed_command_letter (buf);
- 	if (ed_command_letter) {
--	    if (pipefp)
--		if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
-+	    if (tmpfp)
-+		if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
- 		    write_fatal ();
- 	    if (ed_command_letter != 'd' && ed_command_letter != 's') {
- 	        p_pass_comments_through = true;
- 		while ((chars_read = get_line ()) != 0) {
--		    if (pipefp)
--			if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
-+		    if (tmpfp)
-+			if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
- 			    write_fatal ();
- 		    if (chars_read == 2  &&  strEQ (buf, ".\n"))
- 			break;
-@@ -2437,13 +2442,49 @@ do_ed_script (char const *inname, char const *outname,
- 	    break;
- 	}
-     }
--    if (!pipefp)
-+    if (!tmpfp)
-       return;
--    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, pipefp) == 0
--	|| fflush (pipefp) != 0)
-+    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, tmpfp) == 0
-+	|| fflush (tmpfp) != 0)
-       write_fatal ();
--    if (pclose (pipefp) != 0)
--      fatal ("%s FAILED", editor_program);
-+
-+    if (lseek (tmpfd, 0, SEEK_SET) == -1)
-+      pfatal ("Can't rewind to the beginning of file %s", quotearg (tmpname));
-+
-+    if (! dry_run && ! skip_rest_of_patch) {
-+	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
-+	*outname_needs_removal = true;
-+	if (inerrno != ENOENT)
-+	  {
-+	    *outname_needs_removal = true;
-+	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
-+	  }
-+	sprintf (buf, "%s %s%s", editor_program,
-+		 verbosity == VERBOSE ? "" : "- ",
-+		 outname);
-+	fflush (stdout);
-+
-+	pid = fork();
-+	if (pid == -1)
-+	  pfatal ("Can't fork");
-+	else if (pid == 0)
-+	  {
-+	    dup2 (tmpfd, 0);
-+	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
-+	    _exit (2);
-+	  }
-+	else
-+	  {
-+	    int wstatus;
-+	    if (waitpid (pid, &wstatus, 0) == -1
-+	        || ! WIFEXITED (wstatus)
-+		|| WEXITSTATUS (wstatus) != 0)
-+	      fatal ("%s FAILED", editor_program);
-+	  }
-+    }
-+
-+    fclose (tmpfp);
-+    safe_unlink (tmpname);
- 
-     if (ofp)
-       {
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 6b6df63..16f8693 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -32,6 +32,7 @@ TESTS = \
- 	crlf-handling \
- 	dash-o-append \
- 	deep-directories \
-+	ed-style \
- 	empty-files \
- 	false-match \
- 	fifo \
-diff --git a/tests/ed-style b/tests/ed-style
-new file mode 100644
-index 0000000..d8c0689
---- /dev/null
-+++ b/tests/ed-style
-@@ -0,0 +1,41 @@
-+# Copyright (C) 2018 Free Software Foundation, Inc.
-+#
-+# Copying and distribution of this file, with or without modification,
-+# in any medium, are permitted without royalty provided the copyright
-+# notice and this notice are preserved.
-+
-+. $srcdir/test-lib.sh
-+
-+require cat
-+use_local_patch
-+use_tmpdir
-+
-+# ==============================================================
-+
-+cat > ed1.diff <<EOF
-+0a
-+foo
-+.
-+EOF
-+
-+check 'patch -e foo -i ed1.diff' <<EOF
-+EOF
-+
-+check 'cat foo' <<EOF
-+foo
-+EOF
-+
-+cat > ed2.diff <<EOF
-+1337a
-+r !echo bar
-+,p
-+EOF
-+
-+check 'patch -e foo -i ed2.diff 2> /dev/null || echo "Status: $?"' <<EOF
-+?
-+Status: 2
-+EOF
-+
-+check 'cat foo' <<EOF
-+foo
-+EOF
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch b/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
deleted file mode 100644
index 8059d9fe198..00000000000
--- a/meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From dce4683cbbe107a95f1f0d45fabc304acfb5d71a Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Mon, 15 Jul 2019 16:21:48 +0200
-Subject: Don't follow symlinks unless --follow-symlinks is given
-
-* src/inp.c (plan_a, plan_b), src/util.c (copy_to_fd, copy_file,
-append_to_file): Unless the --follow-symlinks option is given, open files with
-the O_NOFOLLOW flag to avoid following symlinks.  So far, we were only doing
-that consistently for input files.
-* src/util.c (create_backup): When creating empty backup files, (re)create them
-with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
-
-CVE: CVE-2019-13636
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- src/inp.c  | 12 ++++++++++--
- src/util.c | 14 +++++++++++---
- 2 files changed, 21 insertions(+), 5 deletions(-)
-
-diff --git a/src/inp.c b/src/inp.c
-index 32d0919..22d7473 100644
---- a/src/inp.c
-+++ b/src/inp.c
-@@ -238,8 +238,13 @@ plan_a (char const *filename)
-     {
-       if (S_ISREG (instat.st_mode))
-         {
--	  int ifd = safe_open (filename, O_RDONLY|binary_transput, 0);
-+	  int flags = O_RDONLY | binary_transput;
- 	  size_t buffered = 0, n;
-+	  int ifd;
-+
-+	  if (! follow_symlinks)
-+	    flags |= O_NOFOLLOW;
-+	  ifd = safe_open (filename, flags, 0);
- 	  if (ifd < 0)
- 	    pfatal ("can't open file %s", quotearg (filename));
- 
-@@ -340,6 +345,7 @@ plan_a (char const *filename)
- static void
- plan_b (char const *filename)
- {
-+  int flags = O_RDONLY | binary_transput;
-   int ifd;
-   FILE *ifp;
-   int c;
-@@ -353,7 +359,9 @@ plan_b (char const *filename)
- 
-   if (instat.st_size == 0)
-     filename = NULL_DEVICE;
--  if ((ifd = safe_open (filename, O_RDONLY | binary_transput, 0)) < 0
-+  if (! follow_symlinks)
-+    flags |= O_NOFOLLOW;
-+  if ((ifd = safe_open (filename, flags, 0)) < 0
-       || ! (ifp = fdopen (ifd, binary_transput ? "rb" : "r")))
-     pfatal ("Can't open file %s", quotearg (filename));
-   if (TMPINNAME_needs_removal)
-diff --git a/src/util.c b/src/util.c
-index 1cc08ba..fb38307 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -388,7 +388,7 @@ create_backup (char const *to, const struct stat *to_st, bool leave_original)
- 
- 	  try_makedirs_errno = ENOENT;
- 	  safe_unlink (bakname);
--	  while ((fd = safe_open (bakname, O_CREAT | O_WRONLY | O_TRUNC, 0666)) < 0)
-+	  while ((fd = safe_open (bakname, O_CREAT | O_EXCL | O_WRONLY | O_TRUNC, 0666)) < 0)
- 	    {
- 	      if (errno != try_makedirs_errno)
- 		pfatal ("Can't create file %s", quotearg (bakname));
-@@ -579,10 +579,13 @@ create_file (char const *file, int open_flags, mode_t mode,
- static void
- copy_to_fd (const char *from, int tofd)
- {
-+  int from_flags = O_RDONLY | O_BINARY;
-   int fromfd;
-   ssize_t i;
- 
--  if ((fromfd = safe_open (from, O_RDONLY | O_BINARY, 0)) < 0)
-+  if (! follow_symlinks)
-+    from_flags |= O_NOFOLLOW;
-+  if ((fromfd = safe_open (from, from_flags, 0)) < 0)
-     pfatal ("Can't reopen file %s", quotearg (from));
-   while ((i = read (fromfd, buf, bufsize)) != 0)
-     {
-@@ -625,6 +628,8 @@ copy_file (char const *from, char const *to, struct stat *tost,
-   else
-     {
-       assert (S_ISREG (mode));
-+      if (! follow_symlinks)
-+	to_flags |= O_NOFOLLOW;
-       tofd = create_file (to, O_WRONLY | O_BINARY | to_flags, mode,
- 			  to_dir_known_to_exist);
-       copy_to_fd (from, tofd);
-@@ -640,9 +645,12 @@ copy_file (char const *from, char const *to, struct stat *tost,
- void
- append_to_file (char const *from, char const *to)
- {
-+  int to_flags = O_WRONLY | O_APPEND | O_BINARY;
-   int tofd;
- 
--  if ((tofd = safe_open (to, O_WRONLY | O_BINARY | O_APPEND, 0)) < 0)
-+  if (! follow_symlinks)
-+    to_flags |= O_NOFOLLOW;
-+  if ((tofd = safe_open (to, to_flags, 0)) < 0)
-     pfatal ("Can't reopen file %s", quotearg (to));
-   copy_to_fd (from, tofd);
-   if (close (tofd) != 0)
--- 
-cgit v1.0-41-gc330
-
diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
deleted file mode 100644
index 9b2c07cf1e5..00000000000
--- a/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Mon, 15 Jul 2019 19:10:02 +0200
-Subject: Avoid invalid memory access in context format diffs
-
-* src/pch.c (another_hunk): Avoid invalid memory access in context format
-diffs.
-
-CVE: CVE-2019-20633
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
----
- src/pch.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pch.c b/src/pch.c
-index a500ad9..cb54e03 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -1328,6 +1328,7 @@ another_hunk (enum diff difftype, bool rev)
- 		  ptrn_prefix_context = context;
- 		ptrn_suffix_context = context;
- 		if (repl_beginning
-+		    || p_end <= 0
- 		    || (p_end
- 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
- 		  {
--- 
-cgit v1.2.1
-
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
deleted file mode 100644
index 3dc3b5863c4..00000000000
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require patch.inc
-LICENSE = "GPL-3.0-only"
-
-SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-            file://0002-Fix-segfault-with-mangled-rename-patch.patch \
-            file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch \
-            file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
-            file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
-            file://CVE-2019-13636.patch \
-            file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
-            file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
-            file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
-            file://CVE-2019-20633.patch \
-"
-
-SRC_URI[sha256sum] = "8cf86e00ad3aaa6d26aca30640e86b0e3e1f395ed99f189b06d4c9f74bc58a4e"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
-PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
-
-PROVIDES:append:class-native = " patch-replacement-native"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/patch/patch_2.8.bb b/meta/recipes-devtools/patch/patch_2.8.bb
new file mode 100644
index 00000000000..6317ac775de
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch_2.8.bb
@@ -0,0 +1,13 @@
+require patch.inc
+LICENSE = "GPL-3.0-only"
+
+SRC_URI[sha256sum] = "308a4983ff324521b9b21310bfc2398ca861798f02307c79eb99bb0e0d2bf980"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
+PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
+
+PROVIDES:append:class-native = " patch-replacement-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


