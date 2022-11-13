Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBA0C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:03:26 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.170.1668308602542125352
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dDfdL2rz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308599; i=@fujitsu.com;
	bh=tL3Td3vUGSV/b2u4Q0dDIUMRUXRAEEGXtlChmu8l64U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dDfdL2rzxV396+VYR/AloUVALW08i6IPjc+pGLpBp8kZaH/0KfUT2CkijohMIC0cz
	 CJ7n9Rg6SSG61erLKN95Lm33AsCoiXiefAxCt66e/b7DvL1fnFrM42pCL/oOvDoGGv
	 KGwVpzh5ygC0L8A69mj7q1FQlIYRkVKUph3W0y93C3moduxIFzwo0z96ZtRJ8J2E+i
	 tLifM2JrcJKJilFEIkPYJm8uslnkX6GLsEcHUTBRDs30kYtdJfCuFTHkq+s8ABPDkn
	 hT+SF51aTvb0LMkXLAHIGDX4vkskMswVfGoD63Bw6oEHhZ6IBnQY0BL+YkDVxsmQ2L
	 Ho1WRJnBzQ2kg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqFsWV5B
  s8PqUgsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFo7mfGgjscFV3PJjA3MLZydDFycQgJPGaU
  mHRpIxOEc41JYlPDNkYIZw+jxMHpk1m6GDk52ASkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwFHi99INTCA2i4CqxMzLl8BaeQWcJCacmsEIYksIKEhMefieGSIuKHFy5hMWiDkSEg
  dfvGCGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRrDi1qCy1SNdYL6k
  oMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBhTitPX72B8
  t/SP3iFGSQ4mJVHetOv5yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeH9HFiQLCRalpqdWpGXmA
  CMDJi3BwaMkwlthB5TmLS5IzC3OTIdInWJUlBLnlYgBSgiAJDJK8+DaYNF4iVFWSpiXkYGBQY
  inILUoN7MEVf4VozgHo5Iw79pooCk8mXklcNNfAS1mAlr8PTIPZHFJIkJKqoEpM1ZX+vnPF9v
  dZndaLDpv5OkiUvDg54JfX3IeCC3i0a9e3NN88vG60FB7/ieLgkvsb72ZEyHSLW97ZefO004r
  yzkvr61eK8yf1Pyk/E7BueUPE9nqK307vr0w+bd+5d359ROUaxxydkU572N1Ez5m94On+I/dD
  dmA3SzvLGW29Abmy7C0TW4pWCa4Wk/H86Ff+BKVoMtHmwSZXx6eUr7L+e1nkZC/NY4dnw6cFe
  TbXCK6J417pox4RN7329sclnA4mrqmZ51ecdHpwEGHeS9dlmxO1GQyj2kWid5/7KuQkuP0/6k
  pizVOf6xZJdmv9lND8YjE0q/awg/nvve9VxsZqF0QeaXAl3v+j5iS2cpKLMUZiYZazEXFiQAF
  etBkQQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1668308598!311168!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30643 invoked from network); 13 Nov 2022 03:03:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:03:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 04C0C10019A
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:03:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EC8A0100198
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:03:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:03:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-psutil: upgrade 5.9.3 -> 5.9.4
Date: Sun, 13 Nov 2022 11:02:58 +0800
Message-ID: <1668308578-14883-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173175

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_5.9.3.bb => python3-psutil_5.9.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.3.bb => python3-psutil_5.9.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.3.bb b/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-psutil_5.9.3.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.4.bb
index f099803150..54d5784a0d 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.3.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "7ccfcdfea4fc4b0a02ca2c31de7fcd186beb9cff8207800e14ab66f79c773af6"
+SRC_URI[sha256sum] = "3d7f9739eb435d4b1338944abe23f49584bde5395f27487d2ee25ad9a8774a62"
 
 inherit pypi setuptools3
 
-- 
2.25.1


