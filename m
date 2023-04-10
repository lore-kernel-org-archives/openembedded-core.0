Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C036AC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:57:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.39783.1681117027812877848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HpTPnMLu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117026; i=@fujitsu.com;
	bh=5d4uYBJKiYSd9/vIDNzJ03+vbkig42A4j3+UNevUUB4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HpTPnMLuHFiI8RtGfRVVuVFvRMXaPKFmfT3YbmPPg3yorCT52/Noa8GLwzjKAHVK1
	 GtSe3XBNdEO3xHLq+VErT0jwTyJlZUEJBZJsvUEVFTsdxmoEvs3TnMzNZy1bfptlAr
	 9VCNWgS8AtAUJCkGYIWePoe2oFpDdR2K5qsfDFeCRcDuLj0O6l9/YI35RHe9saA8Hu
	 BnpPmLBCbK7sXsRgK5SXfHKd4UeQXpglyB94ssjc/OLtiinTnTkWM6VKu4brQ4uLrU
	 RVYAZKTFMI4l1mseVeJAQhblQqRMFUcI39WA2aPzFkFiXNot+nMPyObMyKbiuWil5P
	 LjB0L7eaqtDpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWTfxvHG
  KQf9hNos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePpgXPMBXO4K7Yv28TWwPiNs4uRk0NI4AGj
  RN/s4C5GLiD7MpPE5FlPGSGcPUCJy29YQKrYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAQeLRzndsIDaLgKrE7ZZeVhCbV8BJ4srkB2A1EgIKElMevmcGsTkFnCXau7oYIY5wkm
  g/38EMUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itG8OLWoLLVI19BQL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHhTitOO72B82fdX7xCjJAeTkihvF5dxihBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJXoOzQDnBotT01Iq0zBxgJMGkJTh4lER4K44BpXmLCxJzizPTIVKnGBWlxHklzwElBEASGa
  V5cG2w6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh322GgKTyZeSVw018BLWYCWszlYgC
  yuCQRISXVwLT2SNDG5fyyvzr+SR9zPrzLcNo5rgdXcjdLLdusPOF8QF/oXHl3XoaPQm9mmM43
  U73WpRn/+7xy0p7mOcK6x6qOWzHrGx1uO3Qs5brVIo6PMdLqwgtYVpqoWIWnN22OP3jTiLFHY
  c4T9yXLE9VLGvPM4voDdGtfS65/MVP15tbjM6R2yxQFp2QaXEj2aNtXVXVq9mP9I31K2pftS0
  0cmW2/qSnl3la7pWMrqyZ09b5ehlqY5AHuaVI/XU0N9l6YOiFy88aEBfwVKz9f/NUdJr/NMnZ
  fwTHdWxKOOnrpXsfcs3qzz0zie5t7t2LBp9kp2vbKNypYPmsEJT3t36EhLx981mv6XLVFej9V
  Tr1SV2Ipzkg01GIuKk4EAL+bjk9ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-745.messagelabs.com!1681117024!190632!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16446 invoked from network); 10 Apr 2023 08:57:05 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:57:05 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8939015F
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:57:04 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7CDA9159
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:57:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:57:03 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cryptodev-linux: upgrade 1.12 -> 1.13
Date: Mon, 10 Apr 2023 16:56:36 +0800
Message-ID: <1681116997-24685-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179846

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix compilation issues against Linux kernel 6.3
* Add support for xts, cfb, ofb and ccm aes algorithms
* Fix for a potential issue with CIOCCPHASH
* clean-up and maintenance

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{cryptodev-linux_1.12.bb => cryptodev-linux_1.13.bb}        | 0
 meta/recipes-kernel/cryptodev/cryptodev.inc                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.12.bb => cryptodev-linux_1.13.bb} (100%)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index ef342a157c..61c688f1d0 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
+SRCREV = "795f5fda1485d447cdbad342e8304be317d4f7e8"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


