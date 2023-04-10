Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1332AC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:34:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.40195.1681119278107769902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W0cBGxYO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119284; i=@fujitsu.com;
	bh=h4RtGyFk5ewwyITRWhpeE8bsCtMR0LJ0cptuZiRev38=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W0cBGxYOmsBzzMY0Md61Zysn6Hb3NHViEBwhr8PJ3bbIE++JXcXBZX91djQzovNY0
	 ZXdUho7Zxw3Eli02kYbrp2xylwNjIt+t8wBYLKU1blqx0ToMJBy7dHNshS0TMP46QS
	 JGq3WUF+d4Rcv7cN5dMZhLyf0JoSn+sa5Db4WIpQDtCUUfx6czdgjdRxrNvzVGF21D
	 HBaQZuA6UrOOf8zNr2OMHwPo6tWGZheL9xK463x6MuXTolhgzp3X9agJBQ/Ejv9PV3
	 h82IICWOArgCtbo+5ddF+4kRBcwZFusTAuOAoByG67SB50wzWjQ1TUu4/27ws32htp
	 JwYHniKL2rXPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpGt8wzj
  F4NN1eYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPtrtNMBR2cFQeXPmJpYFzJ0cXIxSEk8IBR
  4n77I2YI5zKTxPz+XyxdjJxAzh5GiT9X3EFsNgEpiRv3/7N1MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJX4eWE/mM0ioCrR9vYn2BheASeJ+d8b2UBsCQEFiSkP3zOD2JwCzhL33h9jhVjlJL
  Fzygt2iHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuoYGeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBoZtSrMi6g/FS31+9Q4ySHExKorxdXMYpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4GS4D5QSLUtNTK9Iyc4BxBJOW4OBREuGVuAaU5i0uSMwtzkyHSJ1i1OVY23BgL7MQS15+Xq
  qUOC/HeaAiAZCijNI8uBGwmL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3zEWgKTyZeSV
  wm14BHcEEdASXiwHIESWJCCmpBqY0zWgNQ7ctda9btr12WniA/aEaU1h/NcfM5jKdy7aaAT/j
  7+j+eMuo8nqRQfJUdv5+5a0tIRoekiW2pQxf5mndnemvZ3ZtrW/hog2He+f/5fqZMq9v1ZHHw
  oZ/yxp4//SxFxQd2Kwx9e5/Ny//xLfMsTvyzy8pOj/l1PvvL3dpvbCoEFlVf3fyvZsHEm4Fnm
  awX3KKq1bx46y4E03msb4rV8nM0b/T5ZykPteoyuHAnknLry3OfBj+JW/74w0LZXZN3Hml7vV
  +DtMtDVpX+MK+LM3dwjOnNHD+vfPRByf3BD2c+nuTQor9xd8yiZLCi33CpNZ/Wyy5X6Boyqyo
  69w3GJVObCzIKObJKBVznHpFiaU4I9FQi7moOBEACeWhAmQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1681119283!355216!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12467 invoked from network); 10 Apr 2023 09:34:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:34:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3B4F51C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:43 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 303F41B8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:34:41 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xwayland: upgrade 22.1.8 -> 23.1.1
Date: Mon, 10 Apr 2023 17:34:15 +0800
Message-ID: <1681119256-25106-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
References: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179871

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_22.1.8.bb => xwayland_23.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.8.bb => xwayland_23.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
index 6919ba421b..a065e92f01 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
+SRC_URI[sha256sum] = "fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


