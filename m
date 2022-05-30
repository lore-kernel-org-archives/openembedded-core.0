Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97106C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:39:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.33651.1653892755517377763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MTJ9aI0N;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892753; i=@fujitsu.com;
	bh=nAd/tTG8dK44dqEkq0aMF5BSBQ8eWosFzo6+jEfNZCI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MTJ9aI0NqHgnM9U4+PPICHrt4QAybKyTWj5wDuagcdM1OHHJBovloOmjNcOszi40T
	 VX/mYEWev8WbxX/1oNWzEVRodSGuOWi2aJb8WSGjUQh6ijaVdwoZgacIndoYy5OLkF
	 UQWnGiD8Wig9HILu+gdoJab16wzjvBpbFxJuaUPwoTe0cxXr9n4AMdCwZGhv7l56T6
	 O59pN3ciwmFYAyJzcGx25nPdxuWiEY1xRok/IjpTyBpdp4FlSxbCaeWCFhzhLyX8nN
	 2S8nTgLOWMcWOUOE24eqIMwTYmPrUV2J4fHeJHY9BmuBO05iaDENRVQWZKhQ7lcH31
	 EX4cn5bKT8gYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqDsxbUq
  Swd8FshZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8btU23sBYvZK75cXcnewHiSrYuRi0NI4DGj
  RM/rOVDOeSaJGRueMUI4exglpv0/wdTFyMnBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICxhKPV0wHK2cRUJW4Pe0jmM0r4CRxqXU5I4gtIaAgMeXhe2YQm1PAWWLhl0VgcSGgml
  ltMxkh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVEjNmbGODsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrROKspMzyjJTczM0TU0MNA1NDTVNTbVNbQw0Uus0k3USy3VLU8tLtE10kssL9ZLLS7W
  K67MTc5J0ctLLdnECAzjlGLlHTsY21b91DvEKMnBpCTKe1Z1cpIQX1J+SmVGYnFGfFFpTmrxI
  UYZDg4lCd745ClJQoJFqempFWmZOcCYgklLcPAoifAuSQBK8xYXJOYWZ6ZDpE4xKkqJ855PBE
  oIgCQySvPg2mBxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG9KKtAUnsy8Erjpr4AWMwE
  t5maaCLK4JBEhJdXAlHb4bo7BnY3xhpNOXTyjkZe7zH/VIr/AVTYzf12bpWn685CK4Okp++Yu
  eiId/mXdsmMljZvd///oteVOjl9t0m4Wo55XlWGsxNDLcSP7QvDmfcGXjXW9JqTfOfVeMfbol
  Ednp3d/PyA5P0fs+4o/8ld+7JfIOF287+K3oLSjMXtTFLs32GiYTnzpsP0pC7/yFm7VuEc+Af
  v5mU/LcOol7j6Z2ZZV8vXEin/bZm7Z63pC5b1czNvrGeq3FDoZl29tjClYPklikWi4tMaLK5L
  Lbqj7iDx5YSg/u1juQfUV3ruhD7sZIxgWZ/9cbWt0f3rxn+8X1JxX8bgbyHTdX3CUuV/8y/HV
  TKekpxS1JtguqlRiKc5INNRiLipOBADWnSXUXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1653892753!112709!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11843 invoked from network); 30 May 2022 06:39:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:39:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 05B41100197
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C72CE100193
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:38:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iw: upgrade 5.16 -> 5.19
Date: Mon, 30 May 2022 14:38:42 +0800
Message-ID: <1653892722-23407-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653892722-23407-1-git-send-email-wangmy@fujitsu.com>
References: <1653892722-23407-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166263

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/iw/{iw_5.16.bb => iw_5.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iw/{iw_5.16.bb => iw_5.19.bb} (90%)

diff --git a/meta/recipes-connectivity/iw/iw_5.16.bb b/meta/recipes-connectivity/iw/iw_5.19.bb
similarity index 90%
rename from meta/recipes-connectivity/iw/iw_5.16.bb
rename to meta/recipes-connectivity/iw/iw_5.19.bb
index cf176a349f..a19ae304d5 100644
--- a/meta/recipes-connectivity/iw/iw_5.16.bb
+++ b/meta/recipes-connectivity/iw/iw_5.19.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[sha256sum] = "9c91f2560b258d9660e656ad37fa5bd100ac255865dcfb26076a576b10d8f3a7"
+SRC_URI[sha256sum] = "2a44676d28a87bbc232903d5d573e7618e4fae0cea3a1aff067a26fa66652b75"
 
 inherit pkgconfig
 
-- 
2.25.1


