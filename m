Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AA6ECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:28:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.7783.1661833707761416918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fVACkVmB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661833705; i=@fujitsu.com;
	bh=+on79sDp8l1LIggLqvwxGMhZymtwdvwvlJ0+eCjG+6c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fVACkVmB6VKkd5kww6a67yLPMx2mhFOyGURCoiVIsB2O3LBvpqjnBznTdRJlRxpxT
	 boFiz4TP1g4514oLqFxqwct8fKGxhZAjDjohg4iGm6tRK/gDO1+88T/d0YkGgCVACV
	 ODEPmuYQCEtjdT+ZrKoNa/yx0nGh2NvrtFY/hjajWUQAYGW0VowDf9ZhAMY2Tj69AW
	 DEKWcWyhst3fQ0JwlxalhzdE9vXYm42br+4PooYsdWm8gYe0AiRSp68gmSyFW3R4sV
	 rmwtkT/3s233h/mke7tCVFKRpOsyEvF9yhWthqkFz0y04glHn2VDewFQjEh2b1eQz1
	 DlNJaSPnUhXzA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORpPtyIm+
  ywe1VAhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0ZP73/GghMcFQ9aTzM1MH5l72Lk5BASeMAo
  sXlFRBcjF5B9hUniZ8MnNghnL6NE+/7nzCBVbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w/YIGEBN4kb3/vZQGwWAVWJd1+vsoCU8wo4SUw5nw0SlhBQkJjy8D3YRF4BQYmTM5+wQIyRkD
  j44gUzRI2ixOzLzSwQdqXEnln9TBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMtklFmekZJbmJmTm
  6hgYGuoaGpkDaWNfI0EwvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCxT
  itNv7GDcte+X3iFGSQ4mJVFet37eZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvGYgOcGi1PTUi
  rTMHGCMwKQlOHiURHi9u4DSvMUFibnFmekQqVOMilLivLNA+gRAEhmleXBtsLi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmY9wfIFJ7MvBK46a+AFjMBLX64hBtkcUkiQkqqgSnDKum22a0
  ns8P//vJZlR2+cbuGfIL/3ZgrR2RU2PWXLswrabpR8UrWuoy7I0NDILU/PWEJtxbPk0ct6w3f
  VZ5mnvqxcrlQptjEB3OSC1d9aVsnsIT3Z+sDv+JQq4sKtZrvY01dLv7/wDCj3KdHuGtzc7fhx
  GP8nGktddtn1j+alJL0pHSZd7eHyoVTCx/xiZ2/xRn+zSqHIfdYpJDGvt3TlCvzn99oubg3zF
  BDzV+V1+23Q9OqntmuyXULkgOTDhxy0JwlknQ5zD6uTDD4KaOzum5u+ufA4vgUfb7UOTkzv4o
  u17i6XsL8sLLJxu8cyxpOOJl8nhx68VfUKt++yrDuda9Xzln7ecGqhlm5SizFGYmGWsxFxYkA
  4nJxMkYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1661833704!232567!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 901 invoked from network); 30 Aug 2022 04:28:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:28:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9D25A1AD
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:28:24 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 91AD01AB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:28:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:28:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-urllib3: upgrade 1.26.11 -> 1.26.12
Date: Tue, 30 Aug 2022 12:28:09 +0800
Message-ID: <1661833690-12718-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:28:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170062

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_1.26.11.bb => python3-urllib3_1.26.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.11.bb => python3-urllib3_1.26.12.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
index a8d47de0f4..1cd69bcb10 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "ea6e8fb210b19d950fab93b60c9009226c63a28808bc8386e05301e25883ac0a"
+SRC_URI[sha256sum] = "3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


