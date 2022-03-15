Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC51EC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 12:12:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.9848.1647346375485993312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 05:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mtcdkwtU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647346373; i=@fujitsu.com;
	bh=gaeTsxP+/8IRi96FN0EHOMB4kq2PaXX0D4ZZMncLboE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mtcdkwtUxT+xEZxb7uUkZFDBjvqeHmAp3dkKL50rNoRHGDtLMZiqIYoFK54DWHY+C
	 7lpqxBdLhDIeWISmuNUjMMeVJ3WzZCVyzJgKkYzJjAn5Y3JHG7JYk6PWgl7xLRrz0T
	 8j5/OF4ydIhr7sW4reeRrJyo9pYAwGISPJ5Fj3ZHZb8rTn2af77qeEiZIfAizqTivo
	 QaESDtDu6DrKvrnEEWMTdDI07yRqbqQeTQMpLiab5ZZCyFFsoWL/0ExKa6Ngt2my0O
	 U+djWZjSeSD8oUwuTI1RXc8BEraOvdVOa9P1n0qCjf+2XAwEASStz3PwhYHd4WWobX
	 BHQJW/c8eGiMQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRfdok0G
  SwZnvPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aBuSwFnzgrlv74x9LAOJmzi5GLQ0hgBpPE
  xw3TWLoYOYGcE4wSS1dag9hsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgL/H07
  w8wm0VAVaLrxQawMbwCThLdj5awgdgSAgoSUx6+ZwaxOQWcJRqn9LFDrHKSOH7wBiNEvaDEyZ
  lPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNqYJjPyzkLTMQtKygJFpFaN1UlFmekZJbmJmjq6
  hgYGuoaGprrEFkGmpl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGJApxWq5
  OxinrPypd4hRkoNJSZS3sNwgSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb0o9UE6wKDU9tSItM
  wcYHTBpCQ4eJRHel6VAad7igsTc4sx0iNQpRkUpcV41YEwJCYAkMkrz4NpgEXmJUVZKmJeRgY
  FBiKcgtSg3swRV/hWjOAejkjCvO8gUnsy8Erjpr4AWMwEtnietB7K4JBEhJdXAxKsQfnZB2SW
  f+DmZHZ8WVRyqvNMS+0fj/HWLLZWTF/c3TLy4ii/8yNSG7cek7rOfDFyvqyg01bAi0MNnsr7n
  suB3s3QufDnY8yIo+/TRakcm5cln5fK4+t9vcj9/OeXtP+9Nbc++ioe+s2Cq3n1VMYTHc4vSP
  i8GjbDMqes491Sklhl+LpLyWH6nQFHvgsWyRC7xOc2WN3RCzjR/mb0yl8dQykCp+cjd0zc4BI
  qPsey48bxgkke9XzjjD6bTP2yzztxIDInRyZM1TK7hPGhz/swu3s4ZL2uNJpvdzE1OeB6seHE
  WU15frvzdpJ2bn26Urii8Oi1q96FE+6lCTxg3VDHve+YTnT/xlp92LMM+JZbijERDLeai4kQA
  IZEv60MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1647346372!12213!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20334 invoked from network); 15 Mar 2022 12:12:53 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 12:12:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22FCClF6010308
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 12:12:52 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 12:12:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.11.2 ->
 4.11.3
Date: Tue, 15 Mar 2022 20:12:30 +0800
Message-ID: <1647346351-79061-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647346351-79061-1-git-send-email-wangmy@fujitsu.com>
References: <1647346351-79061-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 12:12:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163237

Changelog:
 #372: Removed cast of path items in FastPath, not needed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-metadata_4.11.2.bb => python3-importlib-metadata_4.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.11.2.bb => python3-importlib-metadata_4.11.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
index 25be7e7fb6..b2da69b055 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "b36ffa925fe3139b2f6ff11d6925ffd4fa7bc47870165e3ac260ac7b4f91e6ac"
+SRC_URI[sha256sum] = "ea4c597ebf37142f827b8f39299579e31685c31d3a438b59f469406afd0f2539"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


