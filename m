Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ABBC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 01:27:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.1435.1648517230139751522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 18:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dzvv/Sbg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648517228; i=@fujitsu.com;
	bh=56jr9UUkDHEIJebd+eJU/yy3eHzhGJk8binIpWG/eLU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dzvv/SbglT2/dYM0VdibD3uZfVepRYE1Ujv8OiywddNLxXZBspe4pNIC8Tt1400tQ
	 vLugLGm16bGFPWjoUpDzWGuE7WuSBsls7Ne/DFzeC2sF3M4yQwYWOWFvGBQ0cKrx60
	 BNr6Z91j+IFhj1jfqZPKqOEd7SxIuvZe0M4sDyoFkVNuM65E2uPaqKtobcCmoP0zXM
	 dOsnB2oq/+0mQCH2/gdOYGF5B85TdnQAj1mITdIseJk0SXFTKHAzj8R1S5pcjS+lX9
	 x4l3700zHcSr2y5ZDO6DJoXAt1F8nap5zUc+Vh5uw/u2MIoQKEQl8zaE2zC6xT06NJ
	 Cd6HtflfqUHuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRopud4JR
  ksG6qjMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHx6XzmgnucFZemnGdtYPzP0cXIySEkMItJ
  Ys4T3y5GLiB7D6PE30cPmUASbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0s4CXR8
  PcpWDmLgKrEpJ//2UBsXgEnieZ1v1hBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8wQNYoSsy
  83s0DYFRKzZrUxTWDknYWkZRaSlgWMTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWNjXXNTfQSq3Q
  T9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQIDLKVY0WsH46sVP/UOMUpyMCmJ8l7Q
  dEoS4kvKT6nMSCzOiC8qzUktPsQow8GhJMHLBAxZIcGi1PTUirTMHGCww6QlOHiURHi144HSv
  MUFibnFmekQqVOMilLivJ/igBICIImM0jy4NliEXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwa
  gkzGsPMp4nM68EbvoroMVMQIvrHjuCLC5JREhJNTAZhbj9nKmT9uPOG9WjTZvMKn7HK/6SsnP
  lqt+6yS70+ZsI0e0Mqic9tf41f5o+KStH5IPv0WWK17p3v5o061Ryya97nwJqlJZ5Gt9oOVti
  4WDs8/Df0k+eFeyH69b9PjVZ6kL//6l+E3JslJ9deNsmEFS/NJO310koSdNMaZJ6tem3nSnrY
  +Sz6ht3119wfP1hysyKB5++Wk61cjv0qcVb96KW5JXZ1++ndzx/eGBv0V7Wjwe9BaT1K0v6P1
  1sOXNWfg7vzRda22OtLj6X+9z2sE0ye5+e3Fyp9CvyW7YYPgn1Ntjafo2nPOjErDu/ZsYF35+
  3k5HFqzhOS/7SjE3mYQW3Z+60Cp2d/3nlqQMtSizFGYmGWsxFxYkAv0pCFysDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1648517227!14123!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18830 invoked from network); 29 Mar 2022 01:27:07 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 01:27:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22T1R7rC007887
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:27:07 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 02:27:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest-subtests: upgrade 0.6.0 -> 0.7.0
Date: Tue, 29 Mar 2022 09:26:55 +0800
Message-ID: <1648517215-21272-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 01:27:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163729

Changelog:
=========
Fixed support for pytest 7.0, and pytest>=7.0 is now required.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-subtests_0.6.0.bb => python3-pytest-subtests_0.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.6.0.bb => python3-pytest-subtests_0.7.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb
index 5e4847b8d9..060a6ff6cf 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "3ebd306a8dcf75133f1742f288c82f36426ebcf8a132d4ee89782d20e84fc13a"
+SRC_URI[sha256sum] = "95c44c77e3fbede9848bb88ca90b384815fcba8090ef9a9f55659ab163b1681c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


