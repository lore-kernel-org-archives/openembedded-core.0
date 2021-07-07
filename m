Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web12.22916.1625672760685818367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=imEnKzhr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625672758; i=@fujitsu.com;
	bh=3HMcw5N2I1XPkBLRYd93tNkfprcfo/6VxWvgAuPRZbs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=imEnKzhrrdVLZdXvEfAKdsjvBNeAv/puXB6QMpErFxcHeYn7eA3r8/7BHDsbNLw1M
	 dt8excbx/oV3nyO/sAuxNE2PHjgyUM1JG6k7yc+2s2tpl9KHzIG9DkwBr/GXpX0PHS
	 KFA8yaCBvnLNsiAvMROd6H7hgHtoxclX0q/eFfPM8h5O77fyEn1PgCXg06JaJ/5szL
	 TYda//5KPtwuLKDUHwumc77ww/1h/fRoG31qINh/e5Uh7N73/0IsTEnofpBdtHmfi/
	 y0EbEiXLzFijB/kkOrw7g/cYF9yYc2K8Xn8G+wlTvj7k1MOrg6HXXb5H+tL5lbTbzT
	 mqhTxmgDT05XA==
Received: from [100.112.199.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 6B/25-07821-63CC5E06; Wed, 07 Jul 2021 15:45:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRomt25mm
  Cwd9vIhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8arTYsYC15yVPx6YNnA2MPRxcjFISQwk0li
  6d1DzBDOcUaJV317mboYOTnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnYQW1jAU+Ldq
  RYWkBIWoPi/v5ogYV4BR4l5t2YxgtgSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy+YIWoUJWZfbm
  aBsCskXh++xDyBkXcWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQ00zUyNNFLrNJ
  N0kst1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAytlIIj13YwHnj9Qe8QoyQHk5Io78wVTxOE
  +JLyUyozEosz4otKc1KLDzHKcHAoSfC6nQLKCRalpqdWpGXmAMMcJi3BwaMkwjsbJM1bXJCYW
  5yZDpE6xagoJc4bDpIQAElklObBtcFi6xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4UkC
  k8mXklcNNfAS1mAlrMcBhscUkiQkqqgckmsdc5cs8daV/749snbFjI/+b5rdS+Vy+2WWmYJ3p
  N5r/e9FboSfzZwCf/quXu/PofEvLtoMr6N2kTJx7UPP/vWX7bix+bPepqXJ8G/Z/VtsJOWTHx
  es+N1XNSKmYddWzqNNDI31MhXrlQ4fueNz13Zxy7sy0qpE71f9uDizEnnjAf61u8hj0s9ewsy
  65yk6JDKrPqd4p08djfCg6S1nmornCky6df8XzHpgMKHtKzlxZe25e5+5KDBVuwy4GTtz9lnS
  pauvPRqWNrrmTGaSooBYmGqaoL/KoSu1Xi82f6Gz2td7xWE9Pu5Ch+3saqnmbPzfhEaMXubr1
  NNXFK1vmze/epXlE01ouZ8ni1Oq8SS3FGoqEWc1FxIgBjLgvGKAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-291.messagelabs.com!1625672758!60457!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32289 invoked from network); 7 Jul 2021 15:45:58 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 15:45:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 167Fjv9o024855
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 16:45:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 16:45:56 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/3] vulkan-headers: upgrade 1.2.176 -> 1.2.182
Date: Wed, 7 Jul 2021 23:45:46 +0800
Message-ID: <1625672748-3956-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add reference to multiple Hpp headers added to this repository

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{vulkan-headers_1.2.176.0.bb => vulkan-headers_1.2.182.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.176.0.bb => vulkan-headers_1.2.182.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
index cff654a06c..736af7b9e7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "074fa3055cfee530992bcbfa0fcb23106a82c1ab"
+SRCREV = "37164a5726f7e6113810f9557903a117498421cf"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

