Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C427C636F8
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:29:32 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.5259.1670207364923062324
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SKh5MaC8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207363; i=@fujitsu.com;
	bh=dwUNTrbiNc1qehoME9s61HTp8UvE42aeL6hj2N3w/IA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SKh5MaC8UoI+SJ7eTHsM3l0Pv9zw8zMQ1TVezRDMTdKpcztV07JIEEz7HyCeIIZuG
	 KqdqrXKBU3vtCqKTLlLm472C5AaVGYXk4znTcw8sYErRdpOGPXWtG07Q3IZnPPKIbe
	 vd8mACRH0UjymvtiTKR32od1XrHNP7bHeI/0YRFJmhzxz240XqbMYTtSyhoR8TQ1gU
	 Gv+jrb0hxdaL3zDML/ds5omI/tkPZ1grsC6Ii+YClhTuVabidkm+jErsJsIlBVV6tu
	 hL23omIzyq0O2Tkw50rfu/VYNjUL+6qp1bpj0FjZyIxOahnMjyBn0yrSYCe22Ui1Cm
	 tz/mQOPc5NsIQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8MxSbcxvDf
  ZYMZrfYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePbn8WMBa84K/5fnsrcwPiTo4uRi0NI4DGj
  xKfOT2wQzjUmiQcfP7JCOLsZJeZ+3sDcxcjJwSYgJXHj/n+gKg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC5hKrVy1lArFZgOInvj4HK+cVcJRo7tUGCUsIKEhMefgebCKngJPEw8t7wVqFgErW9v
  0Aa+UVEJQ4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrqJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcApRJLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3JRidtYdjC+W/NE7xCjJwaQkyqv0qDtZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvd
  FhvspBgUWp6akVaZg4wimDSEhw8SiK8Qt5Aad7igsTc4sx0iNQpRnuOqbP/7WfmWA4mZ35tO8
  DMsWlf1wFmIZa8/LxUKXFeFZCpAiBtGaV5cENhUX+JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAe
  jkjCvmy/QFJ7MvBK43a+AzmICOmsjfxfIWSWJCCmpBqYVs4BhGKwQ9nii2uavaSJGnhMX+R8s
  2Vb9JUgvdUrQwxqNryvuyi/1a86PPrX+v9oiYa7TKwUVNtR+OJAVafvmB2//Dycpq2lVc5bes
  ZP1kK+cnnXHObuixC/nioDpRS926fSXosGFGnVenvLLjhb2zXlTbZ72bMZz3RNq5lP2/IpWlI
  vMKduwf/755F2uWxcZn8mK+BM1p/GfpcfJ+YtXpaQve+vGvFHV4M3ZnipV3l894oWW+suUbGx
  nZO0SmpVwT/Govb68lHrxAx6DxdcNv7tvV7i78dWp3zzOPmJt6s/V7PU1ZzHYvWLZqMlk231z
  ZtXx8vnNHtpfd//T/BSjIZTPoMDxfPvOTtX7SizFGYmGWsxFxYkAI/G0pnUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1670207361!128770!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17043 invoked from network); 5 Dec 2022 02:29:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:29:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 646121000D7
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 57ECC1000D5
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:29:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mpfr: upgrade 4.1.0 -> 4.1.1
Date: Mon, 5 Dec 2022 10:28:50 +0800
Message-ID: <1670207333-6986-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
References: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174263

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Bug fixes (see <https://www.mpfr.org/mpfr-4.1.0/#fixed> and/or the
  ChangeLog file), in particular for macros implementing functions.
- Improved manual formatting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} (91%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.1.0.bb b/meta/recipes-support/mpfr/mpfr_4.1.1.bb
similarity index 91%
rename from meta/recipes-support/mpfr/mpfr_4.1.0.bb
rename to meta/recipes-support/mpfr/mpfr_4.1.1.bb
index 2121dad57c..f531a88961 100644
--- a/meta/recipes-support/mpfr/mpfr_4.1.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.1.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f"
+SRC_URI[sha256sum] = "ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.25.1


