Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web08.7577.1615376933875376452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id C2/19-64503-322B8406; Wed, 10 Mar 2021 11:48:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MxRVdpk0e
  CwdN/JhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bRHveCG8IVWw69Ymxg3CrYxcjFISQwg0mi
  59I55i5GTiDnOKPE38PuIDabgKZE75YtjF2MHBwiAnoSV/+JgoSZBdQlLq1rYQGxhQUsJZ6d3
  MgGYrMIqEosbngLNoZXwEVi0ecp7CC2hICCxJSH76HighInZz5hgZgjIXHwxQtmiBpFidmXm1
  kg7EqJPZsfsk5g5J2FpGUWkpYFjEyrGM2TijLTM0pyEzNzdA0NDHQNDY10DS0tdI0N9BKrdJP
  0Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECAyul4JjcDsbeNx/0DjFKcjApifL2FXgkCPEl
  5adUZiQWZ8QXleakFh9ilOHgUJLgDVwClBMsSk1PrUjLzAEGOUxagoNHSYS3bwNQmre4IDG3O
  DMdInWKUVFKnNdpI1BCACSRUZoH1waLrEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlFQK
  bwZOaVwE1/BbSYCWixgoEbyOKSRISUVAPTWp/65d4liZ9FBJTk+KrCNN7xlIYfufJr080nBk5
  CG1itXHcluCxh1k/neb86ePPHtOwHrTrqwSt0rOMW7f6TKj4n2vjGnCNGV3riSnYskrH43dJ8
  sKxz7WmB0PNlpxw/XPzLEDf38Jv906btNs1pyflpVuAZu+nwhYz9yr6V/3c8fS14mt+PvdXh/
  8btQt9WHPzaxN974lFH3/wj0q80BJ7ebz38u7CNdXfgV8HAeLa8W++ZxDUMBbepn25r3bXt4m
  X/mIY1L6SefJbXzf2rH3RU32Lu1Qmex19y7QjdEK8VZyS09Fc+Lzf30sjMrxWxRc9nli+7NW+
  NZ8C+7pyg2Qlb9mcxO7UHx96vaPimxFKckWioxVxUnAgAgffFzycDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-31.tower-291.messagelabs.com!1615376930!206856!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18623 invoked from network); 10 Mar 2021 11:48:50 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-31.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:48:50 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABmoGq009649
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:48:50 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:48:48 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ovmf: upgrade 202011 -> 202102
Date: Wed, 10 Mar 2021 19:48:41 +0800
Message-ID: <1615376921-3214-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

0003-ovmf-enable-long-path-file.patch
removed since it is not available in 202102.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0003-ovmf-enable-long-path-file.patch     | 28 -------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch b/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
deleted file mode 100644
index df1d159011..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0003-ovmf-enable-long-path-file.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e19481e5a64f8915ac118899b10c40d12c0f9daa Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Mon, 11 Sep 2017 02:21:55 -0400
-Subject: [PATCH 3/4] ovmf: enable long path file
-
-Upstream-Status: Pending
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
----
- BaseTools/Source/C/Common/CommonLib.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/BaseTools/Source/C/Common/CommonLib.h b/BaseTools/Source/C/Common/CommonLib.h
-index e1cce985f7..d67d03c70c 100644
---- a/BaseTools/Source/C/Common/CommonLib.h
-+++ b/BaseTools/Source/C/Common/CommonLib.h
-@@ -14,7 +14,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
- #include <assert.h>
- #define PRINTED_GUID_BUFFER_SIZE  37  // including null-termination
- 
--#define MAX_LONG_FILE_PATH 500
-+#define MAX_LONG_FILE_PATH 1023
- 
- #define MAX_UINT64 ((UINT64)0xFFFFFFFFFFFFFFFFULL)
- #define MAX_UINT32 ((UINT32)0xFFFFFFFF)
--- 
-2.28.0
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index d785ff6700..95ebbcc683 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -15,12 +15,11 @@ PACKAGECONFIG[secureboot] = ",,,"
 SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
-           file://0003-ovmf-enable-long-path-file.patch \
            file://0004-ovmf-Update-to-latest.patch \
            "
 
-PV = "edk2-stable202011"
-SRCREV = "872f953262d68a11da7bc2fb3ded16df234b8700"
+PV = "edk2-stable202102"
+SRCREV = "ef91b07388e1c0a50c604e5350eeda98428ccea6"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.25.1

