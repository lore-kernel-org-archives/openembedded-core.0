Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A85EC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:53:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.4118.1665391973866453412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LGQCgrwY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391972; i=@fujitsu.com;
	bh=627MEvDDg0CM4T5pP/8GoALwW1KR/z2y2dJGJ7dNBKE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LGQCgrwYHPi+Ig02xUWPvLfgEFvg2d7IxiPtH8hJg+MWvkI56hF905IVKjJR8+l09
	 iMRBzudljDDXiGgJL02ft7g52g1xXi6DRSpc5j2kVPnrdgpGjYhPJVfzOjmFJtKvfs
	 K0/X1tI17b5QoUDl8wDfxVhjOSm253AuBkS7b1f8qOyoHO64jtK/t2rIlYQpTCEwaf
	 jiwSAT20DEs1sNeC2fKDkUtOkWW3MF/xpki7uR8/KASf0w9w94hG2+MbqZbtYJFxn/
	 K5PWb1M9/zgh9odZ4UeKfkSdjHkcLmSobJK/TUeUoRTKjKqPQN/zKS0t6p8It41bxj
	 ENPgnmm+vtBcA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWTf5rnO
  ywfxl1hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ayG43sBe84K/q/TmRuYLzP0cXIxSEk8IBR
  4uD+eUwQzmUmiV1/T7NAOHsYJR5PbWPrYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAXuJObfes4DYLAKqEgdmXgaL8wo4SmzY/wnMlhBQkJjy8D0ziM0p4CQx59J7sPFCQD
  WXzjewQNQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0TirKTM8oyU3MzNE1NDDQNTQ01TW20DU0MtdLrNJN1Est1S1PLS7RNdJLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM45RitfodjC9W/tQ7xCjJwaQkymtwyDlZiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgTvkxtAOcGi1PTUirTMHGBMwaQlOHiURHgfXARK8xYXJOYWZ6ZDpE4x6nLM/Np2gF
  mIJS8/L1VKnPfRbaAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3/S2
  gKTyZeSVwm14BHcEEdMTJq04gR5QkIqSkGpgWp5qzSP/a26o99dDiI1c928TX30+r3LzqbVnD
  EpUpHE+8G/8qOvyNeRtyOy4o6ezmBY6e/6otDi6e7LbzZdzFNRPOB3VfdGr/eTHg1L8YoUuaL
  m9ktu7dNGllS4tP3GGPjZMnW0g1BV8UP5n+bsLF7Jc8vW4HfGv3zLi3NHhNKHPlY613fO9a9e
  b7didqOV2/bNqUIJ7zPcqgkWX2VqsD2v0BveFbF3w5bxR83+XzC2PW4MYIjWV33ufeffyJ2Xe
  N6YfrhlNnfl/34L+soYPQFoaII8obHc2TyhevuVojdZXJ3Of9nPlBDGc3rvuZ2HDLxuKR7X9N
  1fPsKR89LPf3nvvbOjH6eN6ml8IMp54vUmIpzkg01GIuKk4EADvmpa1qAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1665391971!81512!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21109 invoked from network); 10 Oct 2022 08:52:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:52:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ADB58155
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:52:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9FDEE152
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:52:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:52:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] systemd-boot: upgrade 251.4 -> 251.5
Date: Mon, 10 Oct 2022 16:52:29 +0800
Message-ID: <1665391949-8225-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391949-8225-1-git-send-email-wangmy@fujitsu.com>
References: <1665391949-8225-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:53:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171570

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../systemd/{systemd-boot_251.4.bb => systemd-boot_251.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.4.bb => systemd-boot_251.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.4.bb b/meta/recipes-core/systemd/systemd-boot_251.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.4.bb
rename to meta/recipes-core/systemd/systemd-boot_251.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 71eb93f23a..09353e14c7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2a674b4b66af1a050a0362b646d2fca90c90112e"
+SRCREV = "654ae8c1e4b6ba367ba09936462fe2eb1ad8ea2e"
 SRCBRANCH = "v251-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
-- 
2.25.1


