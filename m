Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB4CC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:27:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.34513.1644848868161970664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s3914Zn1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848866; i=@fujitsu.com;
	bh=/X/Rrk8jf7AfCulEHC4jrDiO3Kj0K/KwAIJttDYOWiM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=s3914Zn1Srg1RZULCfLCO6ElsR71WOQRvCX015WTbuDxSZ6JXjUGkKp9TneAbcx5F
	 4Pioa4xcg4HegDRY6UgH+GLK0lJk9tsbdeF1GA70M2EBSSShrZrG1BflG6efFyVhow
	 U3hkXXMTrRT+YzGgf4O9jJ38yKrizP65hVa7OPNNjZTNXhqHha/8wpfmbGpWJUyHYn
	 pXW5D2K0QFuXge1IKvwswtzGNQxKFJ0srPtI4upG+D7BWinDPLyGJ1oePXVvi+Vj3e
	 rAkUkAu+bJr1Zx9efjfDwSzOS00UGiIYFxTzGy4hze7cy43q/632W5TrpDuIPFXpBz
	 iJ0zl9u0lht6A==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id BF/00-21232-2E66A026;
 Mon, 14 Feb 2022 14:27:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRovswjSv
  J4M46Y4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePJ8XOsBUe4Km43bWNpYHzC2cXIxSEkMINJ
  4taz7ewQzglGidc3b7N1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sILawgK/Et
  PsPwcpZBFQlds2ZxQhi8wo4Smw/+JwZxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eAFVoygx+3
  IzC4RdITFrVhvTBEbeWUhaZiFpWcDItIrRIqkoMz2jJDcxM0fX0MBA19DQVNdQ10gvsUo3US+
  1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwvFKKGZl2MC7r+6l3iFGSg0lJlLfbnitJ
  iC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvjhSgnGBRanpqRVpmDjDUYdISHDxKIrypoUBp3uKCx
  NzizHSI1ClGRSlx3vepQAkBkERGaR5cGyy+LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5v
  0OMoUnM68EbvoroMVMQIvTethAFpckIqSkGphmVvw0Mfyu+VZGVsbygsqCR0uWPzoRZR+wjLE
  1WsXAds00Wfs/Vb8vaO7d+Dh/k3XTAcbnPpNl/ApPzf6w7aJOt6a++/9J8WZcBorL6hdynJNh
  iH2cOnve4YTNbw1k66WWHRV8+iW1LSfT+a2I7Y2FlvtmLTHpc2GMN08J+bI0jG96jvc9p3fbt
  h95uoshd7bZ58/HYhaL/FJd1fWGfc2T4ANX7r5zEA7R49r3XnmbGaOA+LuTEx/u/bdG83tdba
  LWMtXTh3SmzVvxp8qrPanup8fKs9kHq7+e4rv1oM869VNvaZHlh6lvi/Tumni+OPOzeuvnsxv
  fheo2nQ6t6mj83vf2+vdzges8n2w03XPgqhJLcUaioRZzUXEiAEzn8O4qAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1644848865!38700!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8528 invoked from network); 14 Feb 2022 14:27:45 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:27:45 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21EERenS030148
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:27:45 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:27:38 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] autoconf-archive: upgrade 2021.02.19 -> 2022.02.11
Date: Mon, 14 Feb 2022 22:27:24 +0800
Message-ID: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:27:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161705

Changelog:
=========
AX_CC_FOR_BUILD was deprecated in favor of AX_PROG_CC_FOR_BUILD.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...onf-archive_2021.02.19.bb => autoconf-archive_2022.02.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2021.02.19.bb => autoconf-archive_2022.02.11.bb} (85%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb
similarity index 85%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb
index 2f86b50655..47bf2380f0 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd"
+SRC_URI[sha256sum] = "78a61b611e2eeb55a89e0398e0ce387bcaf57fe2dd53c6fe427130f777ad1e8c"
 
 inherit autotools allarch texinfo
 
-- 
2.25.1


