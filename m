Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C61C71132
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.11656.1749026743546473093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cChG8Nt+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026744; x=1780562744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sHPiVbqPvurSKQ2/j/8MaD/GJzNDrsl6pDV7bN1b5s4=;
  b=cChG8Nt+1UhREA2VjuCz6/LxoH2LLNJWKULg3HQ58qBZ+EmTsMSi58vF
   YvF0CR5OYhaDmxWF8T/I0zi6gYy52c1SozemhvbBAgS1FmluPiZD9YxVb
   pVuotR27IFiN0f1GJfJefMx6xuPufQLF6La2tF8nwpmqdC6Zqo2h/JI3x
   VMFiue0M5oM34LqEcEcRAIylBP+mlKASe5E46Hgs090vJytqS9WTslc4x
   MExp7aQ54nYHb2S7lBtWl7vMpX0VUFDm0kKzOFct+wvZt4ZO2axvsud7h
   ejjyerCcQgE2eWA1UfLGI1/xBUm4+ZlGsOwAL5KyQQohAHwb12qLdgDeg
   g==;
X-CSE-ConnectionGUID: qWnokIHYRQq8myiBBxRhLQ==
X-CSE-MsgGUID: 3z8ZgWVxSmOqbmtUPA5K0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201724469"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201724469"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:41 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F03ACA26B
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 31725D746A
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:38 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D0C911A009B;
	Wed,  4 Jun 2025 16:45:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/45] libusb1: upgrade 1.0.28 -> 1.0.29
Date: Wed,  4 Jun 2025 16:45:06 +0800
Message-ID: <20250604084524.864-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217877

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libusb/{libusb1_1.0.28.bb => libusb1_1.0.29.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.28.bb => libusb1_1.0.29.bb} (93%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.28.bb b/meta/recipes-support/libusb/libusb1_1.0.29.bb
similarity index 93%
rename from meta/recipes-support/libusb/libusb1_1.0.28.bb
rename to meta/recipes-support/libusb/libusb1_1.0.29.bb
index 51287499b7..bae5e2c09f 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.28.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29"
+SRC_URI[sha256sum] = "5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.43.0


