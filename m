Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EFEC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:21:06 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.1739.1668396058961061310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DsFEnp40;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396056; i=@fujitsu.com;
	bh=V6Hi91hxWU5hjsVj/U7TcwcPUTsIH3kX74g4gd628No=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DsFEnp40HoVRs4rJNQ+GfQE1z/HSf77yjFOAFNauWclmZq72JdafIaTLX53aY3phL
	 Tdvy/v+7Tv70WlwIXexIqDVS3sgl/asJh/87ZhKB3mcXlnNrGl4v39BOPspjGMi8Bu
	 BbE3KjKcZYZGSfz4Ux1rTaLgLMrJKVncSi7/cAAGIJcAuUlACX2JZvTRCyNDDGB9Ck
	 QMHh10vzPIJhnQKPuiv9YjzioxboRQhQ6eGZi5jC2cswyiZCTlGuMN+uaamb4qdmJI
	 z1Ip1I1AUaokhPn5YT0CRo6gl/Sa4ZANtDuvs1bLzfY27slZqwHuBvm+1KRy0/iW1w
	 YHO+rM2zGp2NA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpCu+pTD
  Z4O5+VYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNz13rmgs1cFYcvPWdrYFzB2cXIxSEk8IBR
  Ys7spUwQzmUmifZvP1kgnD2MEl+WzmfvYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFrCS29z5mA7FZBFQlnl16xQJi8wo4Sfw5vooRxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA
  6+eMEMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6lXlJ
  RZnpGSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYDCmFKfn7mC8
  tOyP3iFGSQ4mJVFe/vWFyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeIU2AOUEi1LTUyvSMnOAk
  QGTluDgURLhLd0ElOYtLkjMLc5Mh0idYrTkmDr7335mjuVgcubXtgPMQix5+XmpUuK8a0EaBE
  AaMkrz4MbBovcSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFes41AU3gy80rgtr4COogJ6KD
  vkXkgB5UkIqSkGpgc7Z/cvdjXdsi0rjOYIzim6H6luugBcVUlwx0nxOY+f9FYl1P2s5Z5+Tdz
  tszyjEzv+19PJgl3/pnTsGej7z7zVV08S34LKF5qv2x2q/W5h7fw6cXWlc6/VLp6u79FSBg+q
  35U/i/F8b/Hs70sVout/nyUK1um/2lhjsHp1YI86p+fLi/6ekKW9eKth2/l9ad9Svdrt99xbG
  nJy61uTl85XPb/DFddnn3VvCXZIkjz1X4Wi83znzNbKcw93iH/WU9YbIYEQ17pHoc/E3ZMfZO
  ulXx1nVXBtO55e6P/n9yTf+XBlP/e3bMkReu1FxwrmzYrYu2OhKtORjI33F/k8/KYp0zdvrW5
  KHBHkGee6x8lluKMREMt5qLiRABD1dYzWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1668396055!808151!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16239 invoked from network); 14 Nov 2022 03:20:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:20:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2008E1AE
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:20:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1531C1AD
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:20:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:20:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsoup: upgrade 3.2.1 -> 3.2.2
Date: Mon, 14 Nov 2022 11:20:38 +0800
Message-ID: <1668396038-24033-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173220

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Various HTTP/2 Fixes:
    * Fix `content-sniffed` not being emitted for resources without content
    * Fix leak of SoupServerConnection when stolen

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup_3.2.1.bb => libsoup_3.2.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.2.1.bb => libsoup_3.2.2.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.2.1.bb b/meta/recipes-support/libsoup/libsoup_3.2.2.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.2.1.bb
rename to meta/recipes-support/libsoup/libsoup_3.2.2.bb
index d14667ea8e..e16cd17705 100644
--- a/meta/recipes-support/libsoup/libsoup_3.2.1.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.2.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b1eb3d2c3be49fbbd051a71f6532c9626bcecea69783190690cd7e4dfdf28f29"
+SRC_URI[sha256sum] = "83673c685b910fb7d39f1f28eee5afbefb71c05798fc350ac3bf1b885e1efaa1"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.25.1


