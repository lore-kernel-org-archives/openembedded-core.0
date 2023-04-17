Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDC5C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:08:21 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.48767.1681718899247812330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RonYLQzT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718897; i=@fujitsu.com;
	bh=6sA3dVXDYfPVeasixgSjB/345IXbhoS9bws+OOd6C24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RonYLQzT/abKWEfn591QlZYYTAK77SWeYpC7ZlP5kAjkz8LfryGuCWhqrngB4fRf9
	 uyHaQlTVqA5Maf4Q/V+pcs2Ug7zk24s+OzFI6Vsx8lwFIN2b0OmdkD0gnlDuiSzWRn
	 L6Il9nQwNfN4QIIo3gSr/oXlaAPLkPX7ccOiekIRnp0GM8G4MeRVwxU6XLRWgnenrF
	 jdcfJUxP3OACeRKj5obavnIglq0wE7NTwkJ3r8YKmyqQ7ku0/fEsovCfODgT498oUw
	 w1ZGYplzypNjtpj4e4bkI3qJ1m5ceAeYGQO+D0H1b7tkf0HPdyg11QbrpapLUwZviJ
	 ZTvMHdnqw8FXw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWbfwn02
  Kwb1dPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aMf6tYC76xVxw4Po2tgbGDvYuRi0NI4AGj
  xJLWqSwQzhUmiYYfsxkhnL2MEr+WzwXKcHKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAqcS048sYQWwWAVWJzh1nWUFsXgEniRdLn7OB2BICChJTHr5nhogLSpyc+YQFYo6ExM
  EXL5ghahQlZl9uZoGwKyVaP/yCstUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNTTQSyr
  KTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxpRixuQdjFf7
  /uodYpTkYFIS5X2Rap0ixJeUn1KZkVicEV9UmpNafIhRhoNDSYL35U+bFCHBotT01Iq0zBxgZ
  MCkJTh4lER4jZ8BpXmLCxJzizPTIVKnGBWlxHlf/wFKCIAkMkrz4Npg0XiJUVZKmJeRgYFBiK
  cgtSg3swRV/hWjOAejkjAv+1+gKTyZeSVw018BLWYCWiynBLa4JBEhJdXAlHokaV3yn3uHVe3
  PNvGFXGn/nZGm8jZQv8696MrZ8OTS6DTRTSE72Kd+nCaycIHeq7pjEdOz9c8evtCZaXHL1sU9
  ZO7u5oOXzBylc3RyY1bPn6FblXNHVunjfMPO7jZ3ZVdXpp6g8KWS5Q7OGeseHqrafWNWYMJaM
  1v5GM8Nj98cPcc95evDwzu+yJexs15auaT27QXRR3mfQiz7Cg/Hf5Y9tWvanxdTJyXpOM8z87
  xXcmSTQqqjfu+9ae124bcVzx097uA1tVvw871ZO/ZxKeSIiP4wOCyqZNr6YVrroZQqs/wOqw+
  HdJt/PpojJ8r/fNNOhlPuycX7pCzqepbEmUfI5YtffB37XUpHepmaEktxRqKhFnNRcSIAgLqt
  kUEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1681718896!741176!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21227 invoked from network); 17 Apr 2023 08:08:17 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:08:17 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CA6A4151
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:08:16 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BE870142
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:08:16 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:08:15 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] parted: upgrade 3.5 -> 3.6
Date: Mon, 17 Apr 2023 16:07:53 +0800
Message-ID: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180152

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/parted/{parted_3.5.bb => parted_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/parted/{parted_3.5.bb => parted_3.6.bb} (96%)

diff --git a/meta/recipes-extended/parted/parted_3.5.bb b/meta/recipes-extended/parted/parted_3.6.bb
similarity index 96%
rename from meta/recipes-extended/parted/parted_3.5.bb
rename to meta/recipes-extended/parted/parted_3.6.bb
index ea2b68bbd8..05d57507fb 100644
--- a/meta/recipes-extended/parted/parted_3.5.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2"
+SRC_URI[sha256sum] = "3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.34.1


