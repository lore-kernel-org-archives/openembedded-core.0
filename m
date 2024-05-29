Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17680C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:55:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10033.1716976546815625144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 02:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=687970fa9b=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T6sG4D014471
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 09:55:45 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5m0wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 09:55:45 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 02:55:41 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] libarchive: upgrade 3.7.2 -> 3.7.4
Date: Wed, 29 May 2024 09:55:22 +0000
Message-ID: <20240529095522.1671035-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 2qSxHcm0vwNP0aveBkXG8ZIq1KqpokTY
X-Proofpoint-GUID: 2qSxHcm0vwNP0aveBkXG8ZIq1KqpokTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 09:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199996

From: Yogita Urade <yogita.urade@windriver.com>

Changlog:
========
   rar: Fix OOB in rar e8 filter
   zip: Fix out of boundary access
   7zip: Limit amount of properties
   bsdtar: Fix error handling around strtol() usages
   passphrase: Improve newline handling on Windows
   passphrase: Never allow empty passwords
   rar: Fix "File CRC Error" when extracting specific rar4 archives
   xar: Avoid infinite link loop
   zip: Update AppleDouble support for directories
   zstd: Implement core detection
   PCRE2 support
   add trailing letter b to bsdtar(1) substitute pattern
   add support for long options "--group" and "--owner" to tar(1)
   Fix possible vulnerability in tar error reporting introduced in f27c173
   ISO9660: preserve the natural order of links
   rar5: fix decoding unicode filenames on Windows
   rar5: fix infinite loop if during rar5 decompression the last block produced no data
   xz filter: fix incorrect eof at the end of an lzip member
   zip: fix end-of-data marker processing when decompressing zip archives
   multiple bsdunzip(1) fixes
   filetime truncation fix on Windows

Adjusted configurehack.patch to align with upgraded version.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libarchive/libarchive/configurehack.patch | 19 ++++++++++++-------
 ...ibarchive_3.7.2.bb => libarchive_3.7.4.bb} |  2 +-
 2 files changed, 13 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.2.bb => libarchive_3.7.4.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.patch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
index f3989d99eb..44720fdd53 100644
--- a/meta/recipes-extended/libarchive/libarchive/configurehack.patch
+++ b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
@@ -2,12 +2,15 @@ To work with autoconf 2.73, tweak the macro ordering in configure.in.
 
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure.ac | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
 
-Index: libarchive-3.6.2/configure.ac
-===================================================================
---- libarchive-3.6.2.orig/configure.ac
-+++ libarchive-3.6.2/configure.ac
-@@ -357,6 +357,19 @@ if test "x$with_bz2lib" != "xno"; then
+diff --git a/configure.ac b/configure.ac
+index 5668d41..7e65e49 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -414,6 +414,19 @@ if test "x$with_bz2lib" != "xno"; then
    esac
  fi
  
@@ -27,9 +30,9 @@ Index: libarchive-3.6.2/configure.ac
  AC_ARG_WITH([libb2],
    AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 through libb2]))
  
-@@ -558,19 +571,6 @@ LDFLAGS=$save_LDFLAGS
+@@ -678,19 +691,6 @@ fi
  
- AC_SUBST(GC_SECTIONS)
+ AC_SUBST(DEAD_CODE_REMOVAL)
  
 -# Checks for typedefs, structures, and compiler characteristics.
 -AC_C_CONST
@@ -47,3 +50,5 @@ Index: libarchive-3.6.2/configure.ac
  # Check for tm_gmtoff in struct tm
  AC_CHECK_MEMBERS([struct tm.tm_gmtoff, struct tm.__tm_gmtoff],,,
  [
+--
+2.40.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index 91f521fa4d..da85764116 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "df404eb7222cf30b4f8f93828677890a2986b66ff8bf39dac32a804e96ddf104"
+SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.40.0


