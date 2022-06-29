Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E595CCA479
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 03:24:51 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.7174.1656473088779927704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 20:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ohYKYpRM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656473087; i=@fujitsu.com;
	bh=HfF/hSnVmikAzDpIm3DIoV1kLH5RVxJVYYr7gwPKoxg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ohYKYpRMZtZ+OjcFowjzHiWrOBSoGUHV2pZJuHDN/WbLPCVtkYvwLkZv4cihl2X/D
	 DnwkG2P+4bWV+7gbmT7Rhgo1/CMbbGfPAPtcH7u4QxRKDkCZpqaRP8lKMDCOEpLLSF
	 TDkmveA1y37jpgDcQDLqG3h4dZqjthZxARRVjaz4g7ceOEYgsrN6rZThO6+Q4/yvzb
	 J9jO1IIgDkNTs7b1tKu5AYszp4gn0rSnFCFZXNs4ycXkgi/Ft/5wzWtqEOdVx6TORm
	 tv5P8X1/+Dk43ckEr9jJMGcRE7exM6486nHNd7dNwCpcXYfZ7vZyzpPWPVDDohJTxT
	 CZ3HWy5ZxnrNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpPvv6O4
  kgwu/RSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oz/06wKJnNXvD4i28A4iauLkYtDSOABo8SK
  RT1MEM5lJolHHc/ZIJw9jBK3+t6ydjFycrAJqElMv3UDyObgEBHQk7j6TxQkzCygIvHidw87i
  C0s4CSxcfFyMJtFQFWi691PJhCbV8BRYv+za8wgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC6
  gaRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVolFWWmZ5TkJmbm6BoaGOg
  aGprqAkkjY73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMCATClmqN7B+L/3
  p94hRkkOJiVRXsdpu5OE+JLyUyozEosz4otKc1KLDzHKcHAoSfBGHgHKCRalpqdWpGXmAKMDJ
  i3BwaMkwlsEkuYtLkjMLc5Mh0idYrTkmDr7335mjuVgcubXtgPMQix5+XmpUuK8E0AaBEAaMk
  rz4MbBIvgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe3sNAU3gy80rgtr4COogJ6CC/iTt
  ADipJREhJNTA5TNujft3y5YYi9q+3tgu7JBu9OfpYkeXOymdRZxZ4PjHeZ5e+kv9GyYQC0YM7
  71w+77id0zXZmOmP5N/j1bv3Jx9cXrtD1F9tbYCS6vpts/c/cj0wx/JLwI1JDUn7P6W212/Lm
  vPhr2P5gW/mtZPUcnh+FX9ZmZe3gpFBbvHZ+O0p4buKeTZePnlmCluy1s9bcR5Xku3LdVXML5
  x607Zm+dXDvvfXGD35NnNJyk+nKNHMHv3WU54G0fNUlb1z3vGWPS013DmPJ4vxGvfZWOmtHnc
  vT7j+1lSp1vL8co5Vmud44mbf5i14XOR31KlpgtWB0/daVhj2+8SceW927cFWTibe5jf9j7Y+
  nrdhvmJOjBJLcUaioRZzUXEiADdPwy1bAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1656473086!4468!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19447 invoked from network); 29 Jun 2022 03:24:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2022 03:24:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E3A8A1A3
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:24:45 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D886E1AC
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:24:45 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 29 Jun 2022 04:24:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-chardet: upgrade 4.0.0 -> 5.0.0
Date: Wed, 29 Jun 2022 11:24:02 +0800
Message-ID: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 03:24:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167359

This release is the first release of chardet that no longer supports Python < 3.6.

License-Update: Adjust document format, change "St" to "Street"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-chardet_4.0.0.bb => python3-chardet_5.0.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-chardet_4.0.0.bb => python3-chardet_5.0.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-chardet_4.0.0.bb b/meta/recipes-devtools/python/python3-chardet_5.0.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-chardet_4.0.0.bb
rename to meta/recipes-devtools/python/python3-chardet_5.0.0.bb
index f53bdc974a..80baed7986 100644
--- a/meta/recipes-devtools/python/python3-chardet_4.0.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_5.0.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Universal encoding detector for Python 2 and 3"
 HOMEPAGE = "https://pypi.org/project/chardet/"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
+SRC_URI[sha256sum] = "0368df2bfd78b5fc20572bb4e9bb7fb53e2c094f60ae9993339e8671d0afb8aa"
 
 # setup.py of chardet needs this.
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-- 
2.25.1


