Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426DAC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:09:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.48789.1681718958626872107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sfjERNv3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718956; i=@fujitsu.com;
	bh=cBKzO06/bQdlrlR4bApXlHq21xzo36ZX8ohQnqbW41M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sfjERNv3m8YZBkvwvqmgI7SOXG0v/hGJkzc+W0yEPjsEJsOUQknAZ1clNG9aJQp8h
	 uC0QNfJKld2x/lRnlCvZKEV6nOaUcjSlssFbmvNBiZziBlYKvGH42owjqZaAQjOj9p
	 Q5BMxQaMBQz4Bzx1SB8T7cUqm8V7ONkNu1nRJ5H15zsXhLeX5AgbHuMCmlEtYzYPXW
	 RaVvxH8p0Sawr2FNQmrMGIGWoLfu3TfjmSyokEOSIP7CiPxFZxdy+EIuX3l5b3+P7D
	 8dNWRxGPMVLPEbumCgj98XHKGtMfbnSjmpF5n4l37kyWr5be0GcJBZZjaogOc3/STY
	 KLPspf75TD4sA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLvmn02
  Kwds9QhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBUc5K3o+vWNsYHzA0cXIxSEk8IBR
  4svmGSwQzhUmiS3LnjNBOHsZJV4f+sraxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAo4SV263M4KUsAioSuw9WwYS5hVwknhw6wVYiYSAgsSUh++ZQWxOAWeJB2/aWEBsIa
  CauYuuMEPUC0qcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0L04tKkst0jW00EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzelOLEuh2MK/r+6h1ilORgUhLlfZFqnSLEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgvflT5sUIcGi1PTUirTMHGAkwaQlOHiURHiNnwGleYsLEnOLM9MhUqcYFaXEeb/9BUoIgC
  QySvPg2mDRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC87yBSezLwSuOmvgBYzAS2WUwJ
  bXJKIkJJqYPLX/WW1O9rqvGdEn7UJk6PMG0ane2/52QPaj4lMVFx4/m/Z8yOqj7bL5Sqddkw3
  EG/b88m2c2bt+6eRv5NuL5z+sbzl5aLGS+ULU7iMDV4tb3WufP486oRagdw1kZsP2aW+Re5Y5
  Rh1Xe3Q3NKymaeUHU3mKSxuFN7AW85u5Ln1uv2ObVXhxs8S/kfc6c8Uef1+5XvTiwqc/cUpDn
  UuZ1lOq7erzRQp3hDrp7vuS/4ps6sZXF+6O6aeCk768faE3VqGu/qX7p/ayVC9tV0m872XT79
  CfQv7GssF+eH74p1TNm1cv80ybcHrM8Upm9WYA3ZsT1D335Pbk/YhKCM47az1m8C9v0zPf15h
  wBenrcRSnJFoqMVcVJwIAP0MrghZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1681718955!221031!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 375 invoked from network); 17 Apr 2023 08:09:16 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:09:16 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A8A881B3
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:09:15 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9D1261AC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:09:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:09:14 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.2.2 -> 7.3.1
Date: Mon, 17 Apr 2023 16:07:56 +0800
Message-ID: <1681718877-19480-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
References: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.pytest.org/en/stable/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.2.2.bb => python3-pytest_7.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.2.2.bb => python3-pytest_7.3.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.2.bb b/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_7.2.2.bb
rename to meta/recipes-devtools/python/python3-pytest_7.3.1.bb
index 4e2c86f641..9965844d1a 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "c99ab0c73aceb050f68929bc93af19ab6db0558791c6a0715723abe9d0ade9d4"
+SRC_URI[sha256sum] = "434afafd78b1d78ed0addf160ad2b77a30d35d4bdf8af234fe621919d9ed15e3"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


