Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82885C7EE29
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:03:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.26240.1685610236565670845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119096876"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119096876"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F495D3EA9
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:52 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A583CD3F3B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C7E5D88857;
	Thu,  1 Jun 2023 18:03:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.3.4 -> 2.5.0
Date: Thu,  1 Jun 2023 17:03:10 +0800
Message-Id: <1685610221-29015-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--7.858100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrRealVAhocE9k55TPiguhpfqA
	DeqinEVfr/8sDK1kxPbMs7SN43CFomJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6SXrn3FnM/Eh51j14ZiBqCs11Uem18eXqdVNZaI2n6/1XgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1il/Tr8kJxaUfVgR3vy4HBFo6ykXW79evkiKbFbRXqrFe8S3+27DypA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182060

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  * A new dictionary method remove_from_session() allows providers to stay
    in sync with Enchant's personal wordlist, by removing as well as adding
    words in the spelling session.
  * The public API enchant_dict_store_replacement() is deprecated, and no
    longer does anything. It only previously had an effect with the Aspell
    provider.
  * The APIs enchant_dict_add() and enchant_dict_remove() also respectively
    add the word to the session or remove it.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.3.4.bb => enchant2_2.5.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.3.4.bb => enchant2_2.5.0.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.3.4.bb b/meta/recipes-support/enchant/enchant2_2.5.0.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.3.4.bb
rename to meta/recipes-support/enchant/enchant2_2.5.0.bb
index 5a6a3157a6..f5ec1ef522 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.4.bb
+++ b/meta/recipes-support/enchant/enchant2_2.5.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "1f7e26744db1c9a0fea61d2169f4e5c1ce435cf8c2731c37e3e4054119e994a0"
+SRC_URI[sha256sum] = "149e224cdd2ca825d874639578b6246e07f37d5b8f3970658a377a1ef46f2e15"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


