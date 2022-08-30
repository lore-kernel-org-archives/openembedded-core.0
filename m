Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F82C3DA6B
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:25:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.7846.1661833511616498241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PRfTaA2D;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661833511; i=@fujitsu.com;
	bh=sLC3pLRS46Uivxh8LcjRWKpoRQMFZSG5uSpvr+rUt6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PRfTaA2Desvhd+l0JNiTiQ1IlZKfKgfoQXJjFZqqnZRvz/6neU3FLA2nmwV841Esm
	 u0EH7JpWotwMTlb/6WYcdCSDn0TkTkXBto4ycLKPixI+rSMRZMLZhm5D+mARNECPjH
	 lnTa5Zy3j+KdFZkAguIO8W6pNhlEH32iVpcDwrqJRHlQC/MD3/KY0nAcz9DWYabNFZ
	 OlN7e0onh/8ULZeLYJalKjXz4XiVm9q0YWoME6JUNlrfi9jzPjfSQC03goOdX07j9f
	 MDW8CJWY15DQhPNRBGLgaQbAn6zKpAYWrFKS329vQaUZm3HFzhgwlV+oCp9fWfWocC
	 UdRb1Rcnqvvdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqKs+kTf
  Z4OA3IYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePYizssBes4Km4f/MHSwHibvYuRi0NI4DGj
  xIMV/9kgnOtMEh/mL4LK7GWUOPj6DmMXIycHm4CaxPRbN1i7GDk4RAT0JK7+EwUJMwuoSLz43
  cMOYgsLuEs8XLyMCcRmEVCV2LmgAyzOK+AkcfPYJxYQW0JAQWLKw/fMIDangLPEpGtXwGqEgG
  qurnnLClEvKHFy5hMWiPkSEgdfvGCG6FWUmH25GWpOpcSeWf1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusYWukaGRnqJVbqJeqmluuWpxSW6QG55sV5qcbFe
  cWVuck6KXl5qySZGYBinFKtd2cG4Z9VPvUOMkhxMSqK8C1t5k4X4kvJTKjMSizPii0pzUosPM
  cpwcChJ8F7uBsoJFqWmp1akZeYAYwomLcHBoyTC690FlOYtLkjMLc5Mh0idYlSUEudd1weUEA
  BJZJTmwbXB4vgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeDT1AU3gy80rgpr8CWswEtPj
  hEm6QxSWJCCmpBiYTFt4nzb+N8/f6/p+jeGbDXEW1lTfvXFw5kfeO2rHP2/oncZaYlUUHzvE7
  Yhr86Qizpq5tl3r+h8P29i7Z/32Z5r7zPebzb7Y+5/U5Te+Zim8KaiX87bZI9be/dq/XxUtTu
  OBCNusz7WViVm9WTwy5d3zS4v60Kfsn+3Uez3NaeEB/T1xtsWKpwrEVxV/P3mK4wrLWLlNHed
  p0+RWfbW/lV2z8KNhyNPZK3iPv+csaUznv/dIXLd+eHv5U4//NT67JXzqDtn1j0C1nNPZy/hU
  67WPEkZXijQlx/Ue1JassQs3YAlQ3x/sYLrw3KfrJ4TyG3B8KhdPuGMzb/m/LTqEVtb2fdJeK
  sjS8uvMt6JISS3FGoqEWc1FxIgC9U/bLXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1661833511!28985!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32125 invoked from network); 30 Aug 2022 04:25:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:25:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0794E10018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:11 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EF288100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:25:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vulkan-headers: upgrade 1.3.216.0 -> 1.3.225
Date: Tue, 30 Aug 2022 12:24:51 +0800
Message-ID: <1661833494-12657-2-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170058

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-headers_1.3.216.0.bb => vulkan-headers_1.3.225.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.216.0.bb => vulkan-headers_1.3.225.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.225.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.225.bb
index 5f7917ae82..64b9ad22c8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.225.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "3ef4c97fd6ea001d75a8e9da408ee473c180e456"
+SRCREV = "715673702f5b18ffb8e5832e67cf731468d32ac6"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


