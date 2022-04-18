Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179EDC64ECB
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.38470.1650284994047590228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fJ/fNFbf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284992; i=@fujitsu.com;
	bh=avjbsIWiSb4s95wHBP9kkyS23HY26ssY/lEKoMojHJQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fJ/fNFbfO285c1PQPHsg9+PAgTO914ECvX4t13GB7wBJb13M5tZ+a3Sql22cDKzpA
	 8yx1kt7smIfa+UYH1HxwrrHCkxrO6iU/DLtPKR2rR1jG2Rf08B0dBI68YxiDDa1732
	 W2F/A80yoU2mshLNFlfi3qPLbuOUk1wGa9ey/T7X25lU7kLWwwewONrLnJ+2wS5ebs
	 sKlUBUqb9APf16iyPtiBQTuJxu8jyPtJnRBR9i6EJISltOaxlXQjMVgginfaVSKy2F
	 WTtaevj4AF5m94x9gg3WUo0iK3cVTs5tcKK+1r/hh0NOFVEqBcr6Mo/buPgo54YYZ+
	 2mWxnp53JKUQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORqLs/Mjb
  JoPs6n8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjG9pYOx4Ad7xfQz5xgbGPvYuxi5OIQEHjNK
  7Fu1kKWLkRPIOc8k8X1CNkTiAKPEpkNtzCAJNgFdiRc/FgMVcXCICOhJXP0nChIWFjCX6P1yD
  6yXRUBV4kfzRTYQm1fAXWJX/ywwW0JAQWLKw/fMEHFBiZMzn4DVMwtISBx88YIZZKSEgKLE7O
  nyEOUVEq8PX2KGsNUkrp7bxDyBkW8Wku5ZSLoXMDKtYrRNKspMzyjJTczM0TU0MNA1NDTVNbM
  AUnqJVbqJeqmlusmpeSVFiUBZvcTyYr3U4mK94src5JwUvbzUkk2MwPBLKXbh3sF4p++n3iFG
  SQ4mJVHe/76xSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkePMjgHKCRanpqRVpmTnAWIBJS3DwK
  Inw9ocApXmLCxJzizPTIVKnGBWlxHlng/QJgCQySvPg2mDxd4lRVkqYl5GBgUGIpyC1KDezBF
  X+FaM4B6OSMG8nyBSezLwSuOmvgBYzAS3ePj8SZHFJIkJKqoFJ92dHAY/Xj1OT9wbs6BRmrnX
  YvJAt2VZys2xQQ+S+nVwTraKko3MiFK/yqeVXrpDT8Eye4XMmxpp34rMZ7e9vzGBwqZIxahDt
  eNOoqbZUY5KY1gQenYvO6kuONfs1K3I679jQfmNqzG7Ho6cvfp2iUXV+Wdsuhqn6igKrgj7Mq
  w+Imq2VJtA4j8Wto1Yj9uejxadP83euPhcTPG9r3I5bVnfOvJlnIXKg6LTb6jOnl89L3KUsEf
  38rU7MnUpZvrAvZbv3t0xPvWJe7iTBHeexN+eEXhPP/NBPeu5neYtPrwsrffZe983qs7pG102
  Ctz2T+uhv23PpFvMeuzNTul6k710nYTNxeu+GXMNUM3YlluKMREMt5qLiRAAICp7aOgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-545.messagelabs.com!1650284990!199404!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14682 invoked from network); 18 Apr 2022 12:29:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:29:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AC09C100195
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:29:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 89E41100180
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:29:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:29:28 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ruby: upgrade 3.1.1 -> 3.1.2
Date: Mon, 18 Apr 2022 20:29:16 +0800
Message-ID: <1650284956-2572-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164602

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.1.1.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.1.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.1.2.bb
index d8fddfa520..38ba46731b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            "
 
-SRC_URI[sha256sum] = "fe6e4782de97443978ddba8ba4be38d222aa24dc3e3f02a6a8e7701c0eeb619d"
+SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1


