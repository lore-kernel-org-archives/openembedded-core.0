Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AC9C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:53:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.9084.1648461212356747668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ixwAOFmI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461210; i=@fujitsu.com;
	bh=/UQ7ipOTYz28kJ9E21Xwf839T4rqz+DexklsRhQSGS0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ixwAOFmI90UMV8G8sgPezcHU9W9z+E3ZFALP68ojvGXUMDb9s7q+0/ZGIGjlBctKi
	 x70BDu8zplfPdbohqCjCmj7UnC1G1ca+1wn8bziQ2ZZ/JadDQWCYug0xfLxMXWvBc1
	 xAkUiWklepLg4KrqNpBGgMhrdFr35LS4Yj6jrUx3wzDcRZDVmnioow8uFk0ppjDuUZ
	 AZ3hXD8CMduGZxTLMuknxT7kZKRop3EmuB6yYoxXkUSJZObUM8uwzBKq+jJvofGsbB
	 XvLO2cBWqbbaM1EL6enYCgCYhVTCIXaFqBvnP8bD3jdaqIvPNQ/P3N4gUuo64tE8oP
	 6aZjDDTk7LEpg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSXdWq2O
  SwZ33PBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bXpZPYC9ZxVDTMN29gPMjexcjFISTwmFHi
  0ckDTBDOeSaJr88OA2U4gZw9jBIT9luB2GwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPW
  LmwgK3E+7U9bCA2i4CqxPzml4wgNq+Ak8TF81fAbAkBBYkpD98zg9icAs4Shz+dYoJY5SQx+/
  o1Joh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGpromQJahXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuc
  k6KXl1qyiREYwCnFLKk7GPv6fuodYpTkYFIS5TXKdEwS4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MF7qxkoJ1iUmp5akZaZA4wmmLQEB4+SCK9pE1Cat7ggMbc4Mx0idYpRUUqcN7gFKCEAksgozY
  Nrg0XwJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvC4gU3gy80rgpr8CWswEtHjtO1uQxSW
  JCCmpBqaJt3vnznPnqihSDf/w1yz3QvHPgK2KiiI6n3/Wv+Lz+h14xDfv3JZb8TMWJj8M2ruT
  gYl3c46CaWlbk8494fj/TuZ/Hpx+4p53StxgXY/5dsOV/Ut47n59PM+WPejQqoSPh6+eLL6ar
  iRjser6XOfZ1Q3qYZZclRdNP4ps3/rNdEZi88qPX+ujFlo9nF37vGCOg4+Gou3ZJ1OCmTXSA8
  69dpvHKz1Lum6q8bRfM9Yla3R3GihdeLuacfkeTv+0y+W6vFadq9P3zV27+fXL7VrZAg1fDLW
  /LtdnN9NsELj55Rfrfp92t4kKe4oq1J4rcG2WSePsesSXcq/ZRPj82bwzz/fu+/sgxHfl6R1R
  Ui1KLMUZiYZazEXFiQBc1FGPWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-27.tower-587.messagelabs.com!1648461209!26516!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 613 invoked from network); 28 Mar 2022 09:53:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-27.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:53:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B20DC10033B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A4B0B1000FB
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:53:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libevdev: upgrade 1.12.0 -> 1.12.1
Date: Mon, 28 Mar 2022 17:52:51 +0800
Message-ID: <1648461173-15770-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
References: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:53:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163698

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libevdev/{libevdev_1.12.0.bb => libevdev_1.12.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.12.0.bb => libevdev_1.12.1.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.12.0.bb b/meta/recipes-support/libevdev/libevdev_1.12.1.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.12.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.12.1.bb
index 38f2bad606..bdca64f357 100644
--- a/meta/recipes-support/libevdev/libevdev_1.12.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.12.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2f729e3480695791f9482e8388bd723402b89f0eaf118057bbdea3cecee9b237"
+SRC_URI[sha256sum] = "1dbba41bc516d3ca7abc0da5b862efe3ea8a7018fa6e9b97ce9d39401b22426c"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


