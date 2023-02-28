Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D0C7EE23
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 01:36:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13123.1677548181919491061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 17:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q2cRO5Jx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14238a8117=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31S0vETZ000761
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=10bicuFz/AM/l33MuUP7hF/7+s63qsSOSuVqk96/WHs=;
 b=Q2cRO5JxUPpy5QUyvoDWGjlRHRQ9Jph9K2D4VnjDVC6n4qBdtwxUbHeGqtQ04mwWQbWS
 9YeQ+MhAOfwsVyDeQjdcSTcJOY1883PNLewZF/I8hEfun1l4qVZiKOkA3VIwdoEDUhRM
 OHiYlySCwtYkl5/+SSeDu4OgYk84LAkurs4aXngsi0j+qcuJLgP7i/jrP7dlgpGRAr2e
 sm+JGFrHbh3oCm5kW6k6RgNgtwJJLuO9Yi5zJSbB67nEY5UD5S6SL8Ziz3YlaVivT4rR
 bZJ+Bf/QvG85slXsXFMzEpxuCWWFcK8QXfoLcfJ1aWatQhnH4+ZQCMjcNNHZz7w7PGhD Sg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwjg6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:36:20 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 27 Feb 2023 17:36:19 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 27 Feb 2023 17:36:19 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] make: update from 4.4 to 4.4.1
Date: Mon, 27 Feb 2023 17:36:19 -0800
Message-ID: <20230228013619.2211278-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6Qid32ieU87UzwabMKPUIXuJ2QZn6IPF
X-Proofpoint-GUID: 6Qid32ieU87UzwabMKPUIXuJ2QZn6IPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_19,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177812

Drop the backported sigpipe.patch

NEWS:
Version 4.4.1 (26 Feb 2023)

This release is primarily a bug-fix release.
A complete list of bugs fixed in this version is available here:

https://sv.gnu.org/bugs/index.php?group=make&report_id=111&fix_release_id=110&set=custom

* WARNING: Backward-incompatibility!
  In previous releases it was not well-defined when updates to MAKEFLAGS made
  inside a makefile would be visible.  This release ensures they are visible
  immediately, even when invoking $(shell ...) functions.  Also, command line
  variable assignments are now always present in MAKEFLAGS, even when parsing
  makefiles.
  Implementation provided by Dmitry Goncharov <dgoncharov@users.sf.net>

* New feature: Parallel builds of archives
  Previously it was not possible to use parallel builds with archives.  It is
  still not possible using the built-in rules, however you can now override
  the built-in rules with a slightly different set of rules and use parallel
  builds with archive creation.  See the "Dangers When Using Archives" section
  of the GNU Make manual, and https://savannah.gnu.org/bugs/index.php?14927

* Previously target-specific variables would inherit their "export" capability
  from parent target-specific variables even if they were marked private.  Now
  private parent target-specific variables have no affect.  For more details
  see https://savannah.gnu.org/bugs/index.php?61463

* Disable FIFO jobserver on GNU/Hurd and Cygwin
  Experimentation shows that the new FIFO-based jobserver doesn't work well on
  GNU/Hurd or Cygwin: revert these systems to use the pipe-based jobserver.

* Updates to allow building on OS/2
  Provided by KO Myung-Hun <komh78@gmail.com>

* New platform: GNU Make is supported on z/OS
  Thanks to Igor Todorovski <itodorov@ca.ibm.com> for the patches and testing
  assistance.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/make/make/sigpipe.patch | 42 -------------------
 .../make/{make_4.4.bb => make_4.4.1.bb}       |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make/sigpipe.patch
 rename meta/recipes-devtools/make/{make_4.4.bb => make_4.4.1.bb} (70%)

diff --git a/meta/recipes-devtools/make/make/sigpipe.patch b/meta/recipes-devtools/make/make/sigpipe.patch
deleted file mode 100644
index a7270fdbda..0000000000
--- a/meta/recipes-devtools/make/make/sigpipe.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 92ab2e642d2c04b3dcb5a736ae6193680bfd5f74 Mon Sep 17 00:00:00 2001
-From: Paul Smith <psmith@gnu.org>
-Date: Sun, 6 Nov 2022 15:22:02 -0500
-Subject: * src/main.c (main): [SV 63307] Handle SIGPIPE as a fatal signal
-
-Always ignoring SIGPIPE is visible to child processes.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/make.git/commit/?id=92ab2e642d2c04b3dcb5a736ae6193680bfd5f74]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/main.c | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/src/main.c b/src/main.c
-index eec9365..f2caf7a 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -1182,11 +1182,6 @@ main (int argc, char **argv, char **envp)
-   /* Useful for attaching debuggers, etc.  */
-   SPIN ("main-entry");
- 
--  /* Don't die if our stdout sends us SIGPIPE.  */
--#ifdef SIGPIPE
--  bsd_signal (SIGPIPE, SIG_IGN);
--#endif
--
- #ifdef HAVE_ATEXIT
-   if (ANY_SET (check_io_state (), IO_STDOUT_OK))
-     atexit (close_stdout);
-@@ -1265,6 +1260,9 @@ main (int argc, char **argv, char **envp)
- #ifdef SIGQUIT
-   FATAL_SIG (SIGQUIT);
- #endif
-+#ifdef SIGPIPE
-+  FATAL_SIG (SIGPIPE);
-+#endif
-   FATAL_SIG (SIGINT);
-   FATAL_SIG (SIGTERM);
- 
--- 
-cgit v1.1
-
diff --git a/meta/recipes-devtools/make/make_4.4.bb b/meta/recipes-devtools/make/make_4.4.1.bb
similarity index 70%
rename from meta/recipes-devtools/make/make_4.4.bb
rename to meta/recipes-devtools/make/make_4.4.1.bb
index 6642c708d8..c73751ddcb 100644
--- a/meta/recipes-devtools/make/make_4.4.bb
+++ b/meta/recipes-devtools/make/make_4.4.1.bb
@@ -4,11 +4,10 @@ require make.inc
 
 SRC_URI += " \
            file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch \
-           file://sigpipe.patch \
            "
 
 EXTRA_OECONF += "--without-guile"
 
-SRC_URI[sha256sum] = "581f4d4e872da74b3941c874215898a7d35802f03732bdccee1d4a7979105d18"
+SRC_URI[sha256sum] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.0


