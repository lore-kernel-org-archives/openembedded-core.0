Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E0CECAAD5
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:25:22 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.7753.1661833515566111965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WEdcQLAs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661833513; i=@fujitsu.com;
	bh=ZNk/Jbq4hNxl7ZlPouKHcrOvTyKFxpSY6UMe8O+sikk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WEdcQLAssIcR6b7vPSvf3W4pxOL2rHY6fO/7hUxex5eOEoks+ce3fvUz+RcqH0UZk
	 yKxWdcSdUdWNWxlIToyik7caGSeiWpDNC7++EKtC9oaWKuqiS2vmD1WtT1kaDMRyxi
	 q4xQijI02jxp680GjGXMm2+KJvzZF2I4LBHa/JRh75wXsDMc9rvwC36VQ13hmlaoMs
	 oGr9H2l8aaQACIQlTPPGjE4q1lIJgAtb1A+hONNRSfIZa6ZS6IzKM5nPXeIaVCxAmD
	 LzQlSKFtoFy+vALACi7XKsaZu/jlfYjn5sgytOK7WWXHpBGJvotK672FpfBh/TcQ4d
	 XsII4X0HQa2PQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWVdzIm+
  ywZsn7BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8biqTPYC2ZwVly/8oqlgXE/RxcjF4eQwH1G
  ie/f9rJDOFeYJHZM/M/UxcgJ5OxllPiwSBrEZhNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhATeJ8wt2g7WyCKhKLP1wmxXE5hVwkrh8fS0LiC0hoCAx5eF7ZhCbU8BZYtK1K+wQq5
  wkrq55C1UvKHFy5hMWiPkSEgdfvGCG6FWUmH25GWpOpcSeWf1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYyWSUWZ6RkluYmZObqGBga6hoamusa6FmZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBAZxSzBy2g/FP70+9Q4ySHExKorwLW3mThfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwXu4GygkWpaanVqRl5gCjCSYtwcGjJMLr3QWU5i0uSMwtzkyHSJ1iVJQS513XB5QQAE
  lklObBtcEi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4NPUBTeDLzSuCmvwJazAS0+OE
  SbpDFJYkIKakGJqGJN43vTnn0qrbH4dvxuPPV1yKvatT8XPjtehK/72T1ks9iXaFL10Q+i7cI
  6BB5+1zYd4dg5FSTsGKLL1qP6zoTetLP7Zr/JzfZ9ue9yNy7b2QO1qk/sV+909SYs5K50aFYa
  PspR1e7mcrx5+ZPeBN4U+uuiZn0Lt/a3tVTWkU4jvR7PKqdpfG7zT3z5PKcu6vvK/kp9Rz7r+
  ZSG7FD67y6h/yvsye3d828IyNb09MSuk463O7bU6MoZts/7H4chfwz3gp1cmxQmXOT2yYo8wT
  rsSV/Z276JS+k8K7K59MlIwGjA6eVmDQSovyWXOD/8eSXcMHSd1l+U8LTHjbpOji0+X5gKJDz
  0Fi3XLtPiaU4I9FQi7moOBEAsntFylsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1661833512!289639!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6376 invoked from network); 30 Aug 2022 04:25:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:25:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BD39D73
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:12 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id AED39142
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:25:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vulkan-loader: upgrade 1.3.216.0 -> 1.3.225
Date: Tue, 30 Aug 2022 12:24:52 +0800
Message-ID: <1661833494-12657-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
References: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170059

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-loader_1.3.216.0.bb => vulkan-loader_1.3.225.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.216.0.bb => vulkan-loader_1.3.225.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.225.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.225.bb
index 15a079879b..4816314e23 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.225.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.216;protocol=https"
-SRCREV = "322f7e3212b4fd9d70d7f48972963c83d24d06e4"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master;protocol=https"
+SRCREV = "40faec799ce6b17f46f4bf28ce81782a1bafbbb0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


