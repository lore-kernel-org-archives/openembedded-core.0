Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0658EC6FA86
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:06:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.22896.1662368808782955410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BlZyqfFx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368807; i=@fujitsu.com;
	bh=Lx7nALCj5ZoBB2n6tkTaLbiiuD0pHA4GMx8XMf27Z8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BlZyqfFx4p5RyREmBQf02+CWtKnMSJwS3Sj63aFd/Yn+JYmZD2rQ6dPfxca8a506X
	 w2I/ABk2TdrpzmIxslbRcnE/QuGbuDdPJ6cqSGEJkFyWeYmNfA4QRlbt67dmENrxkX
	 EXinRA4dlA6EgqSz9Rrc9diV82qAsL8I6N6yEa/ibhY/uC4GEw2ByBXgj8GGutIUxW
	 HNdOhvgiSlr9t2jJka3d8jVWy+XbrFru65K2NZMufVKn2qUHROGwrsMGTuz3nIjqk3
	 goPYwUdaAvCKwNTIDIZ39Ts38EstHJhu+VIGNXwj+19L8BjZHmndU6rx11YmHi0hga
	 j1O+l65F3Ktqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqKu2RzT
  Z4PB8Y4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePOxauMBae4KvYtr29gXMfZxcjFISTwmFFi
  xb8ZzBDONSaJbU1NTBDObkaJJzcPAjmcHGwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGApcb1jL1g5C1D8wvVfbCA2r4CTxNSNUxlBbAkBBYkpD98zg9icAs4Sdx7MAqsXAqpZuX
  8dK0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0KicfohJghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG66SizPSMktzEzBxdQwMDXUNDU11jc11DMyO9xCrdRL3UUt3y1OISXSC3vFgvtbhYr7gy
  NzknRS8vtWQTIzCIU4pVF+1g3L/qp94hRkkOJiVR3vdzRJOF+JLyUyozEosz4otKc1KLDzHKc
  HAoSfCu3AGUEyxKTU+tSMvMAUYUTFqCg0dJhNd/HVCat7ggMbc4Mx0idYpRl2Pm17YDzEIsef
  l5qVLivJtAZgiAFGWU5sGNgEX3JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFwgU3gy80r
  gNr0COoIJ6Ai7PmGQI0oSEVJSDUwVx/ucKqQWlt5zePJKp2a23pqgGpPNRUeyaoTbXBin7pf2
  CVi/aKvQgWMTVyZos/4rzo/7ZquUvvXqWnbhh3E5te01632kbLp6fuZnLzqze4bV1Om97n4xv
  +NOB3hud5VU3bHqWvhbBZ6bSxMLW8Li5yzeWZpRvoiJlUHiBgfzvdRpiyOZF/7c9/iSS7Pi7Y
  Y/B6Zv0/7G3DJ9y4pk/TU7dq5u72ePPeO46tLRO/bPOV9t3HJ2RULe9DSO1M+X2rz3eK9uWe3
  xw9w/yM1F4WFmxXH3/Hy5Zc6BweXSzSe+rTgwYX6xg8WClBlZCrk7k9f1vJ5XcnNRA7Mxv/LU
  z+Z9Ny/v6cuLM5A5ZOrQkaTEUpyRaKjFXFScCABSjerkaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1662368806!360434!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5292 invoked from network); 5 Sep 2022 09:06:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:06:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 88F3410019F
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7CD2A10019A
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:06:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vala: upgrade 0.56.2 -> 0.56.3
Date: Mon, 5 Sep 2022 17:06:22 +0800
Message-ID: <1662368782-32326-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368782-32326-1-git-send-email-wangmy@fujitsu.com>
References: <1662368782-32326-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170309

Changelog:
==========
 * Various improvements and bug fixes:
  - vala: Don't unconditionally expect ObjectType of Class [#1341]
  - vala: Make try-statement parsing more resilient [#1304]
  - vala: Avoid problems with '\' in #line directives on Windows [#1353]
  - gidlparser: Set source reference of parameters

 * Bindings:
  - atspi-2: Fix a few binding errors
  - glib-2.0: Use g_abort for GLib.Process.abort() beginning with 2.50 [#1350]
  - gtk+-3.0: Correctly unhide BindingSet.by_class to avoid Version attribute

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/{vala_0.56.2.bb => vala_0.56.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.2.bb => vala_0.56.3.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.2.bb b/meta/recipes-devtools/vala/vala_0.56.3.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.2.bb
rename to meta/recipes-devtools/vala/vala_0.56.3.bb
index 08c8ccca1d..83f61e5b2f 100644
--- a/meta/recipes-devtools/vala/vala_0.56.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.3.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "66c9619bb17859fd1ac3aba0a57970613e38fd2a1ee30541174260c9fb90124c"
+SRC_URI[sha256sum] = "e1066221bf7b89cb1fa7327a3888645cb33b604de3bf45aa81132fd040b699bf"
-- 
2.25.1


