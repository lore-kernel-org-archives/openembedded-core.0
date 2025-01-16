Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0DAC0218A
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:51:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52446.1737042684081639310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G7B714002222
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv15t9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:51:22 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:51:20 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/8] rsync: update 3.2.5 -> 3.2.7
Date: Thu, 16 Jan 2025 15:51:12 +0000
Message-ID: <20250116155119.3867588-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xmqofGKZNGTOsndc4IRldV5Jamf5G-db
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=67892afb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=hGzw-44bAAAA:8 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=JzAqNYcJZsL6WePdnhwA:9 a=F7mDGgsl5lMA:10 a=EFAMUN6BmlsA:10 a=87bzWugj7ioA:10 a=HvKuF1_PTVFglORKqfwH:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xmqofGKZNGTOsndc4IRldV5Jamf5G-db
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501160119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209959

From: Alexander Kanavin <alex.kanavin@gmail.com>

Rebase patches.

(From OE-Core rev: 827c787893caa973c509acf7cac9e17fec5692a4)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...-prototypes-to-function-declarations.patch | 28 +++++++--------
 ...antic-errors-at-the-end-of-configure.patch | 36 ++++---------------
 .../rsync/{rsync_3.2.5.bb => rsync_3.2.7.bb}  |  2 +-
 3 files changed, 20 insertions(+), 46 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.5.bb => rsync_3.2.7.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 474d82db22..8895adad74 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 785c0072c80c2f6e0839478453cf65fdeac15da0 Mon Sep 17 00:00:00 2001
+From 651425fced0691d9063fe417388ba6ca1c38c40b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -15,6 +15,7 @@ Fixes errors like
 
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  checksum.c       | 2 +-
  exclude.c        | 2 +-
@@ -29,23 +30,23 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  10 files changed, 12 insertions(+), 13 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index fb8c0a0..174c28c 100644
+index 60de365..67a9e16 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -629,7 +629,7 @@ int sum_end(char *sum)
- 	return csum_len_for_type(cursum_type, 0);
+@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
+ #endif
  
 -void init_checksum_choices()
 +void init_checksum_choices(void)
  {
- #ifdef SUPPORT_XXH3
- 	char buf[32816];
+ #if defined SUPPORT_XXH3 || defined USE_OPENSSL
+ 	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index adc82e2..79f5a82 100644
+index ffe55b1..a85ea76 100644
 --- a/exclude.c
 +++ b/exclude.c
-@@ -358,7 +358,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
+@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
  	memcpy(partial_string_buf, s_start, partial_string_len);
  }
  
@@ -53,9 +54,9 @@ index adc82e2..79f5a82 100644
 +void free_implied_include_partial_string(void)
  {
  	if (partial_string_buf) {
- 		free(partial_string_buf);
+ 		if (partial_string_len)
 diff --git a/hlink.c b/hlink.c
-index 66810a3..6511dfb 100644
+index 20291f2..5c26a6b 100644
 --- a/hlink.c
 +++ b/hlink.c
 @@ -117,8 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
@@ -82,7 +83,7 @@ index a1a7245..4eae062 100644
  
  	/* statistical data */
 diff --git a/log.c b/log.c
-index 44344e2..991e359 100644
+index e4ba1cc..8482b71 100644
 --- a/log.c
 +++ b/log.c
 @@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
@@ -95,7 +96,7 @@ index 44344e2..991e359 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 9ebfbea..affa244 100644
+index d2a7b9b..c50af45 100644
 --- a/main.c
 +++ b/main.c
 @@ -244,7 +244,7 @@ void read_del_stats(int f)
@@ -168,6 +169,3 @@ index bbba7b2..61f8dc9 100644
  {
      uLong flags;
  
--- 
-2.37.2
-
diff --git a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
index 1d9c4bfe48..f11f13dd48 100644
--- a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
@@ -1,4 +1,4 @@
-From e64a58387db46239902b610871a0eb81626e99ff Mon Sep 17 00:00:00 2001
+From e6321b0b456fca987b48d5ec7aba7e2826128e5f Mon Sep 17 00:00:00 2001
 From: Paul Eggert <eggert@cs.ucla.edu>
 Date: Thu, 18 Aug 2022 07:46:28 -0700
 Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
@@ -6,37 +6,16 @@ Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
 Problem reported by Khem Raj in:
 https://lists.gnu.org/r/autoconf-patches/2022-08/msg00009.html
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032862.html]
+
 ---
- configure.ac | 35 ++++++++++++++++++++---------------
- 1 file changed, 20 insertions(+), 15 deletions(-)
+ configure.ac | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index d185b2d3..7e9514f7 100644
+index a2c9955..afabef0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1071,21 +1071,6 @@ elif test x"$ac_cv_header_popt_h" != x"yes"; then
-     with_included_popt=yes
- fi
- 
--if test x"$GCC" = x"yes"; then
--    if test x"$with_included_popt" != x"yes"; then
--	# Turn pedantic warnings into errors to ensure an array-init overflow is an error.
--	CFLAGS="$CFLAGS -pedantic-errors"
--    else
--	# Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
--	# turn off pedantic warnings (which will not lose the error for array-init overflow).
--	# Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
--	# -Wpedantic and use that as a flag.
--	case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
--	    *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
--	esac
--    fi
--fi
--
- AC_MSG_CHECKING([whether to use included libpopt])
- if test x"$with_included_popt" = x"yes"; then
-     AC_MSG_RESULT($srcdir/popt)
-@@ -1444,6 +1429,26 @@ case "$CC" in
+@@ -1437,6 +1437,26 @@ case "$CC" in
      ;;
  esac
  
@@ -63,6 +42,3 @@ index d185b2d3..7e9514f7 100644
  AC_CONFIG_FILES([Makefile lib/dummy zlib/dummy popt/dummy shconfig])
  AC_OUTPUT
  
--- 
-2.37.1
-
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.5.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.2.5.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 983bdd5ab0..84052d0ff1 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.5.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
            "
 
-SRC_URI[sha256sum] = "2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba"
+SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_IGNORE += " CVE-2017-16548 "
-- 
2.40.0


