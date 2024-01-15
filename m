Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEA5C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 06:33:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.70568.1705300404829844329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 22:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YrSMcsVO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1744171146=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40F5QTpQ008454
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:33:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=MLxTOV9eIiTTQWvwZCSYkksXPr23okR0vGLy3+OCwSE=; b=
	YrSMcsVOWNm+ZNYzfqVpxw0NSZHb/TXdx3QywybrxcP5dVESO3Zm0CiKO5PTobaa
	sgBH8+kcOqvun00KiixKh6QAMZciN21IQh8w/VvQsfdCVOAizwHKsZHwffY8xvUH
	gUYMjHAqqJhwVLWIgw5DNMzmJAd+yUawidQmhhE7qeVFLszJvh5EIG3CvOagaDE1
	O/DJLiey9s53fNXyZNH081WuZw+JSjLxZ6PqTl9FEAuFhccpw6Glb2WwdugvKThc
	HU7ykHf+1sWs73dBNRfOLfWMv9rl3n1zq6Du0i53oAwaHXjVPem3jRWPNfa3Lqpq
	wigabkzvjJAE2Oqx1KF3WQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp41g4m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:33:24 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Jan 2024 22:33:40 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 14 Jan 2024 22:33:40 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] autoconf: 2.72d -> 2.72e
Date: Sun, 14 Jan 2024 22:33:23 -0800
Message-ID: <4d46710667cf0447780fd82e565fd064ca76c6bd.1705300374.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705300374.git.liezhi.yang@windriver.com>
References: <cover.1705300374.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CzKKOV4dK-YPHoNZ_320Jox0YTo_o4wd
X-Proofpoint-ORIG-GUID: CzKKOV4dK-YPHoNZ_320Jox0YTo_o4wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401150046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193633

From: Robert Yang <liezhi.yang@windriver.com>

Refresh patches with devtool to fix do_patch errors.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../autoconf/autoreconf-exclude.patch         | 26 +++++++++----------
 .../autotest-automake-result-format.patch     | 22 +++++++---------
 .../autoconf/autoconf/man-host-perl.patch     | 13 +++++++---
 .../autoconf/autoconf/no-man.patch            | 19 ++++++++++++--
 .../autoconf/autoconf/preferbash.patch        | 12 ++++-----
 .../autoconf/autoconf/program_prefix.patch    | 12 ++++-----
 .../remove-usr-local-lib-from-m4.patch        | 12 ++++-----
 .../{autoconf_2.72d.bb => autoconf_2.72e.bb}  |  2 +-
 8 files changed, 65 insertions(+), 53 deletions(-)
 rename meta/recipes-devtools/autoconf/{autoconf_2.72d.bb => autoconf_2.72e.bb} (96%)

diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
index c73aca41ee8..28141962008 100644
--- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
@@ -1,25 +1,26 @@
-From 0071d28e304745a16871561f23117fdb00dd2559 Mon Sep 17 00:00:00 2001
+From 1a50157aa11da48921200a0d8d4308863716eab0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:25:23 +0000
-Subject: [PATCH 4/7] autoreconf-exclude.patch
+Subject: [PATCH] autoreconf-exclude.patch
 
 Upstream-Status: Inappropriate [oe specific]
+
 ---
  bin/autoreconf.in | 26 ++++++++++++++++++++++++++
  1 file changed, 26 insertions(+)
 
 diff --git a/bin/autoreconf.in b/bin/autoreconf.in
-index bb9f316d..7da3005b 100644
+index 98ebab6..937f758 100644
 --- a/bin/autoreconf.in
 +++ b/bin/autoreconf.in
-@@ -82,6 +82,7 @@ Operation modes:
+@@ -83,6 +83,7 @@ Operation modes:
    -i, --install            copy missing standard auxiliary files
        --no-recursive       don't rebuild sub-packages
    -s, --symlink            with -i, install symbolic links instead of copies
 +  -x, --exclude=STEPS      steps we should not run
    -m, --make               when applicable, re-run ./configure && make
-   -W, --warnings=CATEGORY  report the warnings falling in CATEGORY [syntax]
- 
+   -W, --warnings=CATEGORY  report the warnings falling in CATEGORY
+                            (comma-separated list accepted)
 @@ -141,6 +142,10 @@ my $run_make = 0;
  # Recurse into subpackages
  my $recursive = 1;
@@ -60,7 +61,7 @@ index bb9f316d..7da3005b 100644
      }
  
  
-@@ -687,9 +698,12 @@ sub autoreconf_current_directory ($)
+@@ -691,9 +702,12 @@ sub autoreconf_current_directory ($)
  	{
  	  $libtoolize .= " --ltdl";
  	}
@@ -73,7 +74,7 @@ index bb9f316d..7da3005b 100644
      }
    else
      {
-@@ -726,8 +740,11 @@ sub autoreconf_current_directory ($)
+@@ -730,8 +744,11 @@ sub autoreconf_current_directory ($)
      }
    elsif ($install)
      {
@@ -85,7 +86,7 @@ index bb9f316d..7da3005b 100644
      }
    else
      {
-@@ -765,7 +782,10 @@ sub autoreconf_current_directory ($)
+@@ -769,7 +786,10 @@ sub autoreconf_current_directory ($)
    # latter runs the former, and (ii) autoconf is stricter than
    # autoheader.  So all in all, autoconf should give better error
    # messages.
@@ -96,7 +97,7 @@ index bb9f316d..7da3005b 100644
  
  
    # -------------------- #
-@@ -786,7 +806,10 @@ sub autoreconf_current_directory ($)
+@@ -790,7 +810,10 @@ sub autoreconf_current_directory ($)
      }
    else
      {
@@ -107,7 +108,7 @@ index bb9f316d..7da3005b 100644
      }
  
  
-@@ -803,7 +826,10 @@ sub autoreconf_current_directory ($)
+@@ -807,7 +830,10 @@ sub autoreconf_current_directory ($)
        # We should always run automake, and let it decide whether it shall
        # update the file or not.  In fact, the effect of '$force' is already
        # included in '$automake' via '--no-force'.
@@ -118,6 +119,3 @@ index bb9f316d..7da3005b 100644
      }
  
    # ---------------------------------------------------- #
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
index 23329f79279..38725574bac 100644
--- a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
@@ -1,18 +1,19 @@
-From 8c0f24404bebffdaf3132d81e2b9560d34ff1677 Mon Sep 17 00:00:00 2001
+From b28bd61e4716e744617bd681a5b0d5472f62bd67 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:25:45 +0000
-Subject: [PATCH 6/7] autotest-automake-result-format.patch
+Subject: [PATCH] autotest-automake-result-format.patch
 
 Upstream-Status: Inappropriate [oe specific]
+
 ---
  lib/autotest/general.m4 | 39 +++++++++++++++++++++++++++++----------
  1 file changed, 29 insertions(+), 10 deletions(-)
 
 diff --git a/lib/autotest/general.m4 b/lib/autotest/general.m4
-index 0c0e3c5b..17590e96 100644
+index bf18866..8097523 100644
 --- a/lib/autotest/general.m4
 +++ b/lib/autotest/general.m4
-@@ -412,6 +412,9 @@ at_recheck=
+@@ -427,6 +427,9 @@ at_recheck=
  # Whether a write failure occurred
  at_write_fail=0
  
@@ -22,7 +23,7 @@ index 0c0e3c5b..17590e96 100644
  # The directory we run the suite in.  Default to . if no -C option.
  at_dir=`pwd`
  # An absolute reference to this testsuite script.
-@@ -525,6 +528,10 @@ do
+@@ -540,6 +543,10 @@ do
  	at_check_filter_trace=at_fn_filter_trace
  	;;
  
@@ -33,7 +34,7 @@ index 0c0e3c5b..17590e96 100644
      [[0-9] | [0-9][0-9] | [0-9][0-9][0-9] | [0-9][0-9][0-9][0-9]])
  	at_fn_validate_ranges at_option
  	AS_VAR_APPEND([at_groups], ["$at_option$as_nl"])
-@@ -713,10 +720,10 @@ m4_divert_push([HELP_MODES])dnl
+@@ -728,10 +735,10 @@ m4_divert_push([HELP_MODES])dnl
  cat <<_ATEOF || at_write_fail=1
  
  Operation modes:
@@ -48,7 +49,7 @@ index 0c0e3c5b..17590e96 100644
  _ATEOF
  m4_divert_pop([HELP_MODES])dnl
  m4_wrap([m4_divert_push([HELP_TUNING_BEGIN])dnl
-@@ -742,6 +749,7 @@ Execution tuning:
+@@ -757,6 +764,7 @@ Execution tuning:
    -d, --debug    inhibit clean up and top-level logging
  [                 default for debugging scripts]
    -x, --trace    enable tests shell tracing
@@ -56,7 +57,7 @@ index 0c0e3c5b..17590e96 100644
  _ATEOF
  m4_divert_pop([HELP_TUNING_BEGIN])])dnl
  m4_divert_push([HELP_END])dnl
-@@ -1129,7 +1137,9 @@ at_fn_group_banner ()
+@@ -1139,7 +1147,9 @@ at_fn_group_banner ()
      [*])          at_desc_line="$[1]: "  ;;
    esac
    AS_VAR_APPEND([at_desc_line], ["$[3]$[4]"])
@@ -67,7 +68,7 @@ index 0c0e3c5b..17590e96 100644
    echo "#                             -*- compilation -*-" >> "$at_group_log"
  }
  
-@@ -1155,42 +1165,51 @@ _ATEOF
+@@ -1165,42 +1175,51 @@ _ATEOF
    case $at_xfail:$at_status in
      yes:0)
  	at_msg="UNEXPECTED PASS"
@@ -124,6 +125,3 @@ index 0c0e3c5b..17590e96 100644
    fi
    at_log_msg="$at_group. $at_desc ($at_setup_line): $at_msg"
    case $at_status in
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch b/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
index c6c135625db..0f49583a641 100644
--- a/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch
@@ -1,13 +1,20 @@
-Don't use the target perl when regenerating the man pages.
+From 1c033f2a23941c46d88b9ac279f87bf2c6e99499 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 15 Jul 2020 16:03:21 +0100
+Subject: [PATCH] Don't use the target perl when regenerating the man pages.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
+---
+ man/local.mk | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
 diff --git a/man/local.mk b/man/local.mk
-index e69858b1..78c68ab5 100644
+index 775c131..ba94753 100644
 --- a/man/local.mk
 +++ b/man/local.mk
-@@ -67,13 +67,12 @@ SUFFIXES += .w .1
+@@ -77,13 +77,12 @@ SUFFIXES += .w .1
  	@echo "Updating man page $@"
  	$(MKDIR_P) $(@D)
  	PATH="$(top_srcdir)/man$(PATH_SEPARATOR)$$PATH"; \
diff --git a/meta/recipes-devtools/autoconf/autoconf/no-man.patch b/meta/recipes-devtools/autoconf/autoconf/no-man.patch
index 2c44375f43e..3e741edfb2e 100644
--- a/meta/recipes-devtools/autoconf/autoconf/no-man.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/no-man.patch
@@ -1,14 +1,26 @@
+From 8bcaf677e41f1f5d3fa0a746e35958e7b303ac71 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 15 Jul 2020 16:03:21 +0100
+Subject: [PATCH] autoconf: upgrade to 2.71
+
 For native builds we don't care about the documentation, and this would
 otherwise pull in a dependency on help2man.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
+---
+ Makefile.in | 10 ----------
+ 1 file changed, 10 deletions(-)
+
 diff --git a/Makefile.in b/Makefile.in
-index 146e8e3..a1827c1 100644
+index c8d6425..72d6d05 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -763,10 +762,0 @@ dist_buildaux_SCRIPTS = \
+@@ -771,16 +771,6 @@ buildauxdir = $(pkgdatadir)/build-aux
+ dist_buildaux_DATA = \
+   $(AUXSCRIPTS)
+ 
 -dist_man_MANS = \
 -  man/autoconf.1 \
 -  man/autoheader.1 \
@@ -19,3 +31,6 @@ index 146e8e3..a1827c1 100644
 -  man/ifnames.1
 -
 -
+ # Each manpage depends on:
+ # - its .w and .x files and its source script in bin/
+ # - common.x for the SEE ALSO list
diff --git a/meta/recipes-devtools/autoconf/autoconf/preferbash.patch b/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
index cfb145a279a..64fed1fd827 100644
--- a/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
@@ -1,7 +1,7 @@
-From 0aac3047cd7681d610b22d79501c297fa3433148 Mon Sep 17 00:00:00 2001
+From a877ff979349d3bf6f5f0d92fe4e741be0ad98b4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:25:41 +0000
-Subject: [PATCH 2/7] m4sh: prefer bash over sh
+Subject: [PATCH] m4sh: prefer bash over sh
 
 _AS_DETECT_BETTER_SHELL looks for a good shell to use, and tries to look for
 'sh' before 'bash'.  Whilst for many systems sh is a symlink to bash,
@@ -16,15 +16,16 @@ Change the search order to bash then sh, so that a known-good shell (bash)
 is used if available over something which is merely POSIX compliant.
 
 Upstream-Status: Inappropriate [oe specific]
+
 ---
  lib/m4sugar/m4sh.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/m4sugar/m4sh.m4 b/lib/m4sugar/m4sh.m4
-index 9d543952..84ef84a9 100644
+index 368487f..cc70f51 100644
 --- a/lib/m4sugar/m4sh.m4
 +++ b/lib/m4sugar/m4sh.m4
-@@ -230,7 +230,7 @@ dnl Remove any tests from suggested that are also required
+@@ -233,7 +233,7 @@ dnl Remove any tests from suggested that are also required
      [_AS_PATH_WALK([/bin$PATH_SEPARATOR/usr/bin$PATH_SEPARATOR$PATH],
        [case $as_dir in @%:@(
  	 /*)
@@ -33,6 +34,3 @@ index 9d543952..84ef84a9 100644
  	     # Try only shells that exist, to save several forks.
  	     as_shell=$as_dir$as_base
  	     AS_IF([{ test -f "$as_shell" || test -f "$as_shell.exe"; } &&
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch b/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
index 657cbb351b3..f647f2a8c00 100644
--- a/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
@@ -1,19 +1,20 @@
-From f4f19a5c03e8ae3b9cc93d24b76694f4b7b2eb76 Mon Sep 17 00:00:00 2001
+From 7949496ff3834dcd98407cc3f3ea022ee2471d52 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:28:38 +0000
-Subject: [PATCH 3/7] program_prefix.patch
+Subject: [PATCH] program_prefix.patch
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 ---
  lib/autoconf/general.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/autoconf/general.m4 b/lib/autoconf/general.m4
-index 16f0d074..4c5e0b36 100644
+index 47d896d..3deaa46 100644
 --- a/lib/autoconf/general.m4
 +++ b/lib/autoconf/general.m4
-@@ -2070,7 +2070,7 @@ _AC_CANONICAL_SPLIT([target])
+@@ -2071,7 +2071,7 @@ _AC_CANONICAL_SPLIT([target])
  
  # The aliases save the names the user supplied, while $host etc.
  # will get canonicalized.
@@ -22,6 +23,3 @@ index 16f0d074..4c5e0b36 100644
    test "$program_prefix$program_suffix$program_transform_name" = \
      NONENONEs,x,x, &&
    program_prefix=${target_alias}-[]dnl
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
index f38780130a9..ca1534b8f05 100644
--- a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
@@ -1,19 +1,20 @@
-From a08643ac3fef884900d6cfa161f0acec3ef104d1 Mon Sep 17 00:00:00 2001
+From 294a8d47a70db077691624615c5cb6d331a3299b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:25:37 +0000
-Subject: [PATCH 1/7] remove-usr-local-lib-from-m4.patch
+Subject: [PATCH] remove-usr-local-lib-from-m4.patch
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 ---
  lib/autoconf/functions.m4 | 9 ---------
  1 file changed, 9 deletions(-)
 
 diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
-index 12f60b99..07da7941 100644
+index 9b3f3c0..1faa99b 100644
 --- a/lib/autoconf/functions.m4
 +++ b/lib/autoconf/functions.m4
-@@ -801,15 +801,6 @@ if test $ac_have_func = no; then
+@@ -825,15 +825,6 @@ if test $ac_have_func = no; then
      [LIBS="-lutil $LIBS" ac_have_func=yes ac_cv_func_getloadavg_setgid=yes])
  fi
  
@@ -29,6 +30,3 @@ index 12f60b99..07da7941 100644
  # Make sure it is really in the library, if we think we found it,
  # otherwise set up the replacement function.
  AC_CHECK_FUNCS(getloadavg, [],
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72d.bb b/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
similarity index 96%
rename from meta/recipes-devtools/autoconf/autoconf_2.72d.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.72e.bb
index 67417461844..db374373cff 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72d.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
@@ -22,7 +22,7 @@ SRC_URI = " \
 "
 SRC_URI:append:class-native = " file://no-man.patch"
 
-SRC_URI[sha256sum] = "c09dcba3d051507459df2fcd58d6f19e5b342568fa910e3bb3a74b4402cde3a6"
+SRC_URI[sha256sum] = "f3478d3b597d51f5d61596fb2f6f6aba49cdd974b4b05ff0bac57f56b5cfdb39"
 
 RDEPENDS:${PN} = "m4 gnu-config \
 		  perl \
-- 
2.43.0


