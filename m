Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697C4C4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:41:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.3841.1653460873332560143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x5p8cHW1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653460871; i=@fujitsu.com;
	bh=+6QVsZaUAN0bAk0geM+d+qiLvpg+zMZ8ay/Ptl+0CM0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=x5p8cHW1FR6IjNKzQY3pXdj+xKBSTP06C3ej2MF8/oHbM8p5RdIiJhh/ltT/2+TTY
	 I35dZ+1av0Ya9oNAy31XKh/E8GC9D4FaVJZpBys9nCbRVxk/dhubQBalnsqhER3Z1U
	 SuuIHSwQ8ALOAtYLkZehqehzikUhzw/Y39RRmO7T1Dq8mDcgbulFudEk7PIPY63D/y
	 lzEI7D/uJysrX+c9Bo5cB5rWugamyV7K7rKJnT0ChkjetEAjMhmPV/fdDkqqpdLDF/
	 MALjuKlbcnQ6qWbWMXzc/faP7ArwBYM+pmXTJnjdPqTrVZH9SAA1z5YfuV2hq59ylE
	 AAZ9DV/F+mezg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqNt+vjf
  J4MQVTos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPZyUb2gk2cFZPX7mdtYHzA0cXIxSEk8JhR
  omNHKxOEc55J4u/tl1DOHkaJJwf2M3YxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAv8T2P5fZQGwWAVWJpZtXMIPYvAJOEntmTQGLSwgoSEx5+B4szingLLH1x1EWEFsIqO
  bLuc2MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsCokZM7ZBzVSTuHpuE/MERsFZSNpnIWl
  fwMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU11TXyNhYL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIhTillf7mCc3vdT7xCjJAeTkijviQ29SUJ8SfkplRmJxRnxRaU5qcWHG
  GU4OJQkeFefBsoJFqWmp1akZeYAIwomLcHBoyTC63QGKM1bXJCYW5yZDpE6xajLcezr9/3MQi
  x5+XmpUuK8588CFQmAFGWU5sGNgEX3JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvKrngKb
  wZOaVwG16BXQEE9AR+bxgR5QkIqSkGpgif6nGNOxvmbHU0tzA4EPpz9Oyx0JiYmQ4wnws/d9v
  26P1VC6z4Fl8YC1PwMs/55bfYUk9uNzu9K7H3ZM/Zko59m2QrGvbnfa6NnJ1ugbbvNjoUjZ7j
  v9mt8K2XMtV3PDl68noKL4Fu8VFdJe8l0w7uGxp/MuvDxTl3mpNY50muP20VmrGTdbfMXVnnc
  54lYpm8oZIaPx2npvwXmneuwkpm3fcC5dlOvr/Obv4lyk/GdpmH9vhI6MnIffps6HQ+d41Udf
  mZBllcp3QDPx6IHLddYPzWS6vW/3mhfGs8Nmc8K5ifSnvL6OgySYsPmf9ZkXevdlzSWH1wztf
  U+RnK//8Mf/rop8BhyfK5jSJLH6nxFKckWioxVxUnAgA4S701GkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1653460870!81019!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5515 invoked from network); 25 May 2022 06:41:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:41:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 63C1F1001A3
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 372F810019E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:41:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.11.3 ->
 4.11.4
Date: Wed, 25 May 2022 14:40:37 +0800
Message-ID: <1653460837-12404-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653460837-12404-1-git-send-email-wangmy@fujitsu.com>
References: <1653460837-12404-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:41:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166097

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-metadata_4.11.3.bb => python3-importlib-metadata_4.11.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.11.3.bb => python3-importlib-metadata_4.11.4.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.4.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.11.4.bb
index d8e56ccb25..807a16d6db 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.4.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "ea4c597ebf37142f827b8f39299579e31685c31d3a438b59f469406afd0f2539"
+SRC_URI[sha256sum] = "5d26852efe48c0a32b0509ffbc583fda1a2266545a78d104a6f4aff3db17d700"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


