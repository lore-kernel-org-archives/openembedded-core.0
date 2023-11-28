Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22546C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:41:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.14211.1701214857827699386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="141134402"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="141134402"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:40:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 536F5D618B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:40:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D664D9786
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:40:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 647EA86D02;
	Wed, 29 Nov 2023 08:40:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ofono: upgrade 2.1 -> 2.2
Date: Wed, 29 Nov 2023 07:39:53 +0800
Message-Id: <1701214793-1717-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10--0.102600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvPRFFhcWhYLU7
	kpP9jYYGhEcoajklxgzGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat0546MQi364g884cxZ
	+avxQRTyjsmtCRDeQqiSgJoJ5oVa78plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRa5J/tZdrNVMRnH5q5+pcpIkXP3ty+PeaXM0Qzf+N1OWbT+Ttm0zJQslI/B+RVcwsZFT
	t82ml/fvYox7kqaEZlNZhDLAWWgb2JbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191415

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix issue with udev tracking of devices.
-Fix issue with QMI WDA initialization.
-Fix issue with handling QMI premultiplexed contexts.
-Fix issue with additional context types in MBPI.
-Remove CDMA support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/ofono/{ofono_2.1.bb => ofono_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.1.bb => ofono_2.2.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.1.bb b/meta/recipes-connectivity/ofono/ofono_2.2.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.1.bb
rename to meta/recipes-connectivity/ofono/ofono_2.2.bb
index 0ecac9e11c..4e60f196ce 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.1.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "92913dcce9a15cac2174daca249457716a0ec036878d22035e83af0e19e79c52"
+SRC_URI[sha256sum] = "5e13121c0f885a81ad882db065549ea13477abbcc219f150b38a8d2ac92521de"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


