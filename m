Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F22C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:51:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.52740.1737042684868829663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GCK0V0023893
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:51:24 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt75jkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:51:24 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:51:23 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:51:22 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/8] rsync: Delete pedantic errors re-ordering patch
Date: Thu, 16 Jan 2025 15:51:13 +0000
Message-ID: <20250116155119.3867588-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250116155119.3867588-1-archana.polampalli@windriver.com>
References: <20250116155119.3867588-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fmmSggNBTBc10tPN4YTXOGKAZb-L13sk
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=67892afc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=hGzw-44bAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=XPFyc7n6Pc-lLjYrnlAA:9 a=EFAMUN6BmlsA:10 a=87bzWugj7ioA:10 a=HvKuF1_PTVFglORKqfwH:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fmmSggNBTBc10tPN4YTXOGKAZb-L13sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209960

From: Khem Raj <raj.khem@gmail.com>

It has been fixed by removing the check upstream see
https://github.com/WayneD/rsync/commit/9a3449a3980421f84ac55498ba565bc112b20d6c

(From OE-Core rev: c6228b8371ea5c3c452db7b536948ae96d83844b)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...antic-errors-at-the-end-of-configure.patch | 44 -------------------
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
deleted file mode 100644
index f11f13dd48..0000000000
--- a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e6321b0b456fca987b48d5ec7aba7e2826128e5f Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 18 Aug 2022 07:46:28 -0700
-Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
-
-Problem reported by Khem Raj in:
-https://lists.gnu.org/r/autoconf-patches/2022-08/msg00009.html
-Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032862.html]
-
----
- configure.ac | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index a2c9955..afabef0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1437,6 +1437,26 @@ case "$CC" in
-     ;;
- esac
- 
-+# Enable -pedantic-errors last, so that it doesn't mess up other
-+# 'configure' tests.  For example, Autoconf uses empty function
-+# prototypes like 'int main () {}' which Clang 15's -pedantic-errors
-+# would reject.  Generally it's not a good idea to try to run
-+# 'configure' itself with strict compiler checking.
-+if test x"$GCC" = x"yes"; then
-+    if test x"$with_included_popt" != x"yes"; then
-+	# Turn pedantic warnings into errors to ensure an array-init overflow is an error.
-+	CFLAGS="$CFLAGS -pedantic-errors"
-+    else
-+	# Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
-+	# turn off pedantic warnings (which will not lose the error for array-init overflow).
-+	# Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
-+	# -Wpedantic and use that as a flag.
-+	case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
-+	    *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
-+	esac
-+    fi
-+fi
-+
- AC_CONFIG_FILES([Makefile lib/dummy zlib/dummy popt/dummy shconfig])
- AC_OUTPUT
- 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 84052d0ff1..53c2136f4d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -15,7 +15,6 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.40.0


