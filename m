Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C85BC4707E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3393.1649312353070127731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qgV1H0f2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649312351; i=@fujitsu.com;
	bh=h7/Zh5EXDVfjHJR3amrSEK9LjN/1BVW6oyna04qH95Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qgV1H0f2EY6Tmz2cAd5Pm8XGxOAXe67gZ/0HTQN9+KNItKRq+fn3PdkKksoH3EczY
	 V+RmMP5+Hvy3HBsGkACm8h9T98DRNVl8QyMvIbJTEJTJrKkpGDQXzdwN1lYzOnNrYm
	 YHOQzs4ytBq0wTqM2EFGw2BzRHpxgPuQ+CCf9761QK9sssRl6R3IcV7yyrCNZdHioW
	 Vap997GFif7CGVZGjVOdkmFqofZAovW0ClSb6o9n+1IkVR82Nd+BVp1JPk7JjhKUDh
	 BkWJSfY8AoTzGI8nvbkPO8XWI3oXJSnLwXWVEoCjwVwka/cZCUPxjIrhY2sKAyZ+nJ
	 CpYrZy5pvGIrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSTe6yS/
  J4EErn8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjH9906Wgj9cFd+3nWdrYHzF2cXIxSEk8JhR
  orHpBjOEc55J4t/DH0wQzglGiWsrT7B1MXJysAmoSzy++Zqxi5GDQ0RAT+LqP1GQMLOAqkT3x
  TXsILawgLvE5HfnWUFsFgEViRUX9jKB2LxA8U+XJ7KA2BICChJTHr5nBrE5BTwkZvxuAusVAq
  pZc7+HDaJeUOLkzCcsEPMlJA6+eMEM0askcWLFRyYIu0Li9eFLUHE1iavnNjFPYBSchaR9FpL
  2BYxMqxitkooy0zNKchMzc3QNDQx0DQ1NdY2NdA1N9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1
  iitzk3NS9PJSSzYxAoM4pViBbwdj86qfeocYJTmYlER5Wev8koT4kvJTKjMSizPii0pzUosPM
  cpwcChJ8B5qAMoJFqWmp1akZeYAIwomLcHBoyTCqwyS5i0uSMwtzkyHSJ1iVJQS5/0GkhAASW
  SU5sG1waL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3j0gU3gy80rgpr8CWswEtLjuoC/
  I4pJEhJRUA1MUMOj+r1mSrv2hxHrvv8l8/p2X2fqyb8QErWuYM2H2o6KZ97+cW2gof76o+vOV
  HbNf8HV1nhNv3z9P1mDJT82eiqui+yfoacotsnhwe6nG877/+7vaEkLSVq5IijEymHzPPeH96
  e5lerudolumGG3ZX3B3bueJDy3H7I5s+LzogA/7xIJD5Ra815Y94le2WHHwn6mymcwBe/m6A8
  t91k+fO22VDPPnk3VF37hTvzQ39Ez2P6e6dJKK1OWrp5ON7Faffzehk03x1Y+aCYG+btYba18
  fd1/1QWPptsnJliWRLhMOZZa9zjnDqWtl7nP8M7+j+cwEX77flzl+fM+/9nKzauZOR+P3uzu+
  bBP+pbxeiaU4I9FQi7moOBEA/w/8qF0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1649312347!71597!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25206 invoked from network); 7 Apr 2022 06:19:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2022 06:19:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CB79D100468
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B9562100464
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Apr 2022 07:18:47 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.39.5 -> 6.41.0
Date: Thu, 7 Apr 2022 14:19:13 +0800
Message-ID: <1649312356-25963-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164102

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
This release changes the implementation of "infer" to be an alias for
"Ellipsis". E.g. "@given(a=infer)" is now equivalent to
"@given(a=...)". Furthermore, "@given(...)" can now be specified so
that "@given" will infer the strategies for all arguments of the
decorated function based on its annotations.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-hypothesis_6.39.5.bb => python3-hypothesis_6.41.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.39.5.bb => python3-hypothesis_6.41.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.41.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.41.0.bb
index 03ec94c1c1..9174b606bf 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.41.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2972edc54c90c70049facfc31db19f1997f9c5e89d2a05f6eeea1107600350f0"
+SRC_URI[sha256sum] = "de48abb676fc76e4397cd002926e5747cef518570d132221244d27e1075c0bec"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


