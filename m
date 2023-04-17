Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCB2C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:46:50 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.48357.1681714008971167611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z3mJi/kF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714007; i=@fujitsu.com;
	bh=V/WYhVNf89qR506yNnNZnPKcj4lmYhNTscADdvKzSBQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Z3mJi/kFGSArU7qBQq+BfDTTca+jpaNhs/KCFZ6iGY6d8W1BLuDeALH/5J71oIAUe
	 Ye2gC/c0tMGvsvYu54j2FogZGPlgsWXuFbO6Fpq61FiJ3yw+tM6xYJt8gvmuC5hoVs
	 uoQ7V220hQKXxeA17vx0qTb+KoH6a84H7HcrlXHTk/31GX8+w41o7N0H6edT/Cn5WO
	 UFEWaL2LPf/Fj5zvginDx/+O2+6BayXGInSz0EUUDVY6O7FGmJ8qVzRbx8k+j3qpbY
	 0Q0qpBl2Y79xVfqmQ8A65m+Wv0PhQoj5wNufxG2x7HB8F3XeU6IQZ5qJqXipLo+I64
	 g4TpRiI1UX4ZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORpBv22ib
  F4NZndYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP92zlMBY85K3q//2dsYPzB0cXIySEk8IBR
  YnuHdRcjF5B9mUmibfoLVghnL6PEnaaTjCBVbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0s4C2x/GUjG4jNIqAqsfn+XBYQm1fASeLX8dlgtoSAgsSUh++ZIeKCEidnPmGBmCMhcf
  DFC2aIGkWJ2ZeboeorJVo//IKy1SSuntvEPIGRfxaS9llI2hcwMq1iNC1OLSpLLdK11Esqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMSUYlanHYzH+/7q
  HWKU5GBSEuV9kWqdIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN+C5TYqQYFFqempFWmYOMCpg0
  hIcPEoivMbPgNK8xQWJucWZ6RCpU4yKUuK8Eq+AEgIgiYzSPLg2WCReYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTMe+0F0BSezLwSuOmvgBYzAS2WUwJbXJKIkJJqYNo0schi+oxja93VLlV
  L67x4IPLkxcH+3kN9X3VWPS//su/3858G1jGX1zrY8vDxvrC55BeSmzwpee2J38dXiaQaX62b
  mznhe/vdJkWNW6fXL2qzKktfNOcwl9aVLf+PX9cISDEzWDd/h89jrbRZGRGzfl7fLc9so/jBI
  7aiZoWgtMgO81/vttR9XcjytHZKi+3Wjbtm13iL3zA0mPz+0/ppKx8bJq9I3xOcl/z3qB136b
  62QpnAA6XOPlNeTrm4yeLMd+G15uGdETodZge8t2dvF+qZq+E+4UNp5EPnHBODrtW7PJ6W5kX
  euXFxS9brAt+dtso/Z7K7CKhFSBjnyMUyhN2rSDCp+KOxz3SiAZ8SS3FGoqEWc1FxIgBE8+DH
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1681714006!732675!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9839 invoked from network); 17 Apr 2023 06:46:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:46:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4261C1B5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:46:46 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 36AB57B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:46:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:46:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.26.1 -> 3.26.3
Date: Mon, 17 Apr 2023 14:46:29 +0800
Message-ID: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180126

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 update pre-commit hooks (#350, #353) 
 bump pypa/gh-action-pypi-publish from 1.8.3 to 1.8.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.26.1.bb => python3-cmake_3.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.26.1.bb => python3-cmake_3.26.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb b/meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
index f95e2eab0..8e924acd3 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.26.3.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "4e0eb3c03dcf2d459f78d96cc85f7482476aeb1ae5ada65150b1db35c0f70cc7"
+SRC_URI[sha256sum] = "b54cde1f1c0573321b22382bd2ffaf5d08f65188572d128cd4867fb9669723c5"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


