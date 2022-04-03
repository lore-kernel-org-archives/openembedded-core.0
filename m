Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1090C47087
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.7460.1649245610156301974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YdCIGpqU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245608; i=@fujitsu.com;
	bh=sdjPG4gRleGrxY+8FilraXgnjxV02ZPmU0Nux46T7gs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YdCIGpqUNB8fS5puXKPLC1cX4QEyKbAnynxjJgaS7v1NmeTtd9rS+uDUjaEU+c/vV
	 Dy07ayAQCFrQ0UWehq2Kdg5Hkla/0W/7k8/HjjUlHAnov/ORucouYp/KNEVR9wbbB5
	 27RuP3mAu8b1i6HIe/uVmdht2kOs8Ln71w/5uR39gue6lOveP9C7Ht5kXzoLvUdnOv
	 KmKfwK2jvzPlWIsXJ5/dhtPOpTtXgNIukWo3w/KiTmptaV/6pttGN4hQxsWbWLdGL2
	 YfTH6cD0RQ+Z9LzxBH4Ejo0T5tshLUzkjvq/oNChHJJXd6+Z/TM7kp2DCYDIapw88F
	 gY+DtXPtBr1Ew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqLu81jf
  J4Px/JYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPitJUsBdc4KnY/XcbawHiKvYuRi0NI4DGj
  xOaec1DOeSaJhScusnQxcgI5uxklZs9XA7HZBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAQaLl41NGEJsFKP731AJWEJtXwEni98M7TCC2hICCxJSH75lBxnAKOEv86UyC2OQksb
  vhLxtEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtCYtasNqiRahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6BoamuoaG+kaGpnpJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEhnBKsULdDsZrK3/qHWKU5GBSEuXdX+6bJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCd0sVUE6wKDU9tSItMwcYTzBpCQ4eJRFerRqgNG9xQWJucWY6ROoUo6KUOO+HaqCEAE
  giozQPrg0Ww5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPyg4znycwrgZv+CmgxE9Did2c
  8QRaXJCKkpBqYEv22RzhtTjhxauMabZ7Z/rr3fLOKP0yPXBw5dc7djRdVZ/z7z/HwxNGHW8oN
  L/Zt4rrUuifiUNpLc5uvVix3Si6aLe2w+6Y3LfukisBkCQ2zOq/XzgvDVs6KLtOYffG7mgmn/
  MN7BQkTT/mYHEqV38K2b61Xqc+rc3yNL0yFyqM5Di6vvaKmbvK5VHyr6qyjjKtfr5JZw/XatO
  hAye2I42+jX13bfFHCgE09rfE0d4Xq94tpzpscF/6Ib37wXOLDA6+lbQp75u0vSnLU9Ju58lr
  JEj2RhQfOBU8UmFp3zWc6b3WHuPH/Taq3N1yOn56W47c6J7vkAqOuijLfDqcu8dw7V2Id1t65
  yn2xx/TxBSWW4oxEQy3mouJEAL+hYAtcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1649245607!112142!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27243 invoked from network); 6 Apr 2022 11:46:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:46:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DE3521001B2
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:46:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 786171001A3
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:46:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:46:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ghostscript: upgrade 9.55.0 -> 9.56.1
Date: Mon, 4 Apr 2022 02:43:09 +0800
Message-ID: <1649011392-28818-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164065

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ghostscript_9.55.0.bb => ghostscript_9.56.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.55.0.bb => ghostscript_9.56.1.bb} (98%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
similarity index 98%
rename from meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
index c28e62f089..b2e741b44f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
@@ -45,7 +45,7 @@ SRC_URI:class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[sha256sum] = "31e2064be67e15b478a8da007d96d6cd4d2bee253e5be220703a225f7f79a70b"
+SRC_URI[sha256sum] = "1598b9a38659cce8448d42a73054b2f9cbfcc40a9b97eeec5f22d4d6cd1de8e6"
 
 # Put something like
 #
-- 
2.25.1


