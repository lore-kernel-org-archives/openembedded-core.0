Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026BBE77190
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:16 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.116738.1733788627421061498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nFS8orsl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788628; x=1765324628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E4PyDRA0ISL9pxZbD4F+7R8yDwTat8tYpoTSlwLoV7c=;
  b=nFS8orslUivZpr3WhwccpAgTM9XCvKKrYNaZorwPLdAHtj0CPbs5iSIH
   ZAEpSeVT2ndeEWI2wDVD4UMgFGifweFa9NsR+2+13UbdwcNm/9P1F7Noc
   ybGtbY0bpYL/G7gSA9JYUc+EGljHtGDZINEb3pMRndPniZTOarLViQlJ/
   GhUstCpLZnHcW4SoArYBbKzkLkkpQDxbmMtVIvXmTCz1CaUy00lJZwze8
   SCsyoa9WBxzUKXyd8rwd+OjOn5alBkMDVohaYoeTzaHxQwru1j/6aruXw
   ZCukBxTbxwwK/W+XJHuFnY1yst0xrjMTnGG53/pcjSghybMuikKFDimlV
   A==;
X-CSE-ConnectionGUID: zULY0nwaTJ6ZSfo2UkLXCw==
X-CSE-MsgGUID: 4wRs1yYGQ8Sibgbpy1LzpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="162594283"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="162594283"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0F61D500C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8621D21AC
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55A5820076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F30411A000B;
	Tue, 10 Dec 2024 07:57:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 05/20] git: upgrade 2.47.0 -> 2.47.1
Date: Tue, 10 Dec 2024 07:56:37 +0800
Message-Id: <1733788612-20933-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-1.290600-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uZSVZPP+dKGhthg+SZ4LtAngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDWY/hOrDXmU/njNMSj5Ec9JUPYBXO25sfYxBVX3BwTrOuUSlnpAiW7F5l6R7lAiXJdf7k
	wR0eciwcqijLoyxI2rKyiutjjAS+L87Nf3vaFHKFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208501

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.47.0.bb => git_2.47.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.47.0.bb => git_2.47.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.47.0.bb b/meta/recipes-devtools/git/git_2.47.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.47.0.bb
rename to meta/recipes-devtools/git/git_2.47.1.bb
index 67356874b5..8b5bfecd6a 100644
--- a/meta/recipes-devtools/git/git_2.47.0.bb
+++ b/meta/recipes-devtools/git/git_2.47.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "a84a7917e0ab608312834413f01fc01edc7844f9f9002ba69f3b4f4bcb8d937a"
+SRC_URI[tarball.sha256sum] = "f4c4e98667800585d218dfdf415eb72f73baa7abcac4569e2ce497970f8d6665"
-- 
2.34.1


