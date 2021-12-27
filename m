Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2D3C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 09:09:24 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.24706.1640596155830306275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 01:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TpRu254d;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640596153; i=@fujitsu.com;
	bh=AOhUNKqa+qvuqEbDD+77f84+8oXCszFmJ+M3teSNvQU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TpRu254dvTwpruQ7eW1Nj818G+vn2yfEPNAyKuqngubzH6fT6otlkdglx50po3kuH
	 P6bXrMoZ8NRmwvzOBNFRbxZaNeCTwU7RkIfCQU9rLQSmiiNmHQaFPq9D2YePCIp4cF
	 Ftmzcf6TfMy8ra2UY1LjZRCgH6YBvtpJ3NpZTAuE8HMfsL0aJ7c5egLfohJbeRNnfI
	 G+3/ZaAebUcXCmp+azjKl8sCLn+eCHiKxF3q8Rlv52CFlVb8i3z5ukNZgl0Tn3/Sib
	 SftFSpXh7XS/0YysIYTfS5ngiEo0vgvHW+xEdUV5+QiF0naioL3PiRoBW+FgRa/DHr
	 tcYHUxVJcve5g==
Received: from [100.115.69.8] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 1C/7C-24146-9B289C16; Mon, 27 Dec 2021 09:09:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSXdn08l
  Egzvv2S3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyGNXuYC27yV3R0fWZvYGzk62Lk4hASeMwo
  ceTDMlYI5zyTxLcjDxghnBOMEkvb7wFlODnYBNQkpt+6AWRzcIgI6Elc/ScKEmYWUJF48buHH
  cQWFnCSmLh3CxtICYuAqsSZFe4gYV6g8Iv7V8FKJAQUJKY8fM8MYnMKOEvc3fuUDcQWAqq5uO
  cHK0S9oMTJmU9YIMZLSBx88YIZoldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG26SizPSMktzEzBxdQwMDXUNDU10zCyCll1ilm6iXWqqbnJpXUpQIlNVLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM5JRiF+4djHf6fuodYpTkYFIS5Y1OPZkoxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYLXvB4oJ1iUmp5akZaZA4wqmLQEB4+SCO+OOqA0b3FBYm5xZjpE6hSjLsfrlp87mIVY8v
  LzUqXEeUUagYoEQIoySvPgRsAi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5ZkCk8mXk
  lcJteAR3BBHTETIfjIEeUJCKkpBqYSs5Jr9mZ+keq3lFO4EppqkeRgI5lXYDl0oaVvgFrNh/Y
  bRSoFern9TCqb8/FTpbzq/S/CX12O5EqJqMQ0WgmGs3J6Zd5clueXKFxOb9YE0Pnt9OfCzMlJ
  HoDcoznJ7lu1Rd7zSvcNiPoTlW9rsY5j8Mbj5s/iZ7OJ3Dk6aI9qbPLnDwKtq060Sz5wzX/x+
  0pC9i/3Hp74Eu6iKglv7Xdt69vZftv7M1Zf/iC+wT21/MEA3aYRG3x8+8InHZfcmJZ9JKPes+
  2rVdVNsnyqa09a2Yyob5mWfbmb/MUjx9NbEg/9I+/8kfO45lbPK9++Nsftc/T/lepwK/wucEN
  Ez8azTymVBmWfuOA2B3uQGYlluKMREMt5qLiRAARlSMFawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-528.messagelabs.com!1640596152!189200!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12760 invoked from network); 27 Dec 2021 09:09:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 09:09:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9648B100352
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 09:09:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 89D891000F9
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 09:09:12 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 09:09:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.21.4 -> 1.21.5
Date: Mon, 27 Dec 2021 17:08:48 +0800
Message-ID: <1640596128-22182-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640596128-22182-1-git-send-email-wangmy@fujitsu.com>
References: <1640596128-22182-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 09:09:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160018

Changelog:
==========

Bugs fixed for this release <https://github.com/numpy/numpy/pull/#####>
#20357: MAINT: Do not forward __(deep)copy__ calls of _GenericAlias...
#20462: BUG: Fix float16 einsum fastpaths using wrong tempvar
#20463: BUG, DIST: Print os error message when the executable not exist
#20464: BLD: Verify the ability to compile C++ sources before initiating...
#20465: BUG: Force npymath to respect npy_longdouble
#20466: BUG: Fix failure to create aligned, empty structured dtype
#20467: ENH: provide a convenience function to replace npy_load_module
#20495: MAINT: update wheel to version that supports python3.10
#20497: BUG: Clear errors correctly in F2PY conversions
#20613: DEV: add a warningfilter to fix pytest workflow.
#20618: MAINT: Help boost::python libraries at least not crash

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_1.21.4.bb => python3-numpy_1.21.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.21.4.bb => python3-numpy_1.21.5.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.21.4.bb b/meta/recipes-devtools/python/python3-numpy_1.21.5.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.21.4.bb
rename to meta/recipes-devtools/python/python3-numpy_1.21.5.bb
index a3ea4ab5aa..bdf99b492b 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.21.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "5d412381aa489b8be82ac5c6a9e99c3eb3f754245ad3f90ab5c339d92f25fb47"
+SRC_URI[sha256sum] = "1a7ee0ffb35dc7489aebe5185a483f4c43b0d2cf784c3c9940f975a7dde56506"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


