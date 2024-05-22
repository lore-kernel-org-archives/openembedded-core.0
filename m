Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0969DC27C41
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.5680.1716369349253051661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ElEMUSre;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369349; x=1747905349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gA5hGhf2GYawNryRzSH6WEKvYQb8Rspz0d32cYrOnFc=;
  b=ElEMUSrePg7IzfIZbvfg8TIqvzuW8h/N+RcZz9/rchZz4hu7CEnnAcRi
   CFf9Uz18yoZanyPdbGmFXCe3kpwydHdsfEcbzUS+ZUqQGlSE0tayoyJRQ
   vDSRw3/tE+td9q3V+xN8a96Qdg7Y/oXwHyL79cZX5LsAlp0SlJvwjAPEE
   zFUnWP3gtWN2srL6JKKLl0vYnuAYjsvjv6Qq7bKLRshMKUnkSPNnVxxGd
   kF2gvRwYgTFtrhmWHq77s0KKQ4QAKiD5O2yBJFfK23gpFWC2RWu23yUg8
   0uJtKjo4bSuTJ03Z3yKIBWWa2GlcOulrfFIKzMZWryqaR+BigmOafAKs2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="146672585"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="146672585"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:47 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F2E82D8017
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32C30D7006
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C225E21D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6DF8B1A000B;
	Wed, 22 May 2024 17:15:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/42] ruby: upgrade 3.3.0 -> 3.3.1
Date: Wed, 22 May 2024 17:14:46 +0800
Message-Id: <1716369289-22526-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.967500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSB1x0KuswXklO79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gFV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SF3SkY5oupH5UVTJCVmjwcoxCjgi/s+C9DZIwtvtGgM3T0t
	RnmKAMMTT5OBytq7cUPn2q/0DLhbFM6UeCesfDfllFl9xczLdWS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199736

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/ruby/ruby/releases/tag/v3_3_1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/ruby/{ruby_3.3.0.bb => ruby_3.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.0.bb => ruby_3.3.1.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.3.0.bb b/meta/recipes-devtools/ruby/ruby_3.3.1.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.0.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.1.bb
index 657fc31b4d..fe9b12b87f 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.1.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "96518814d9832bece92a85415a819d4893b307db5921ae1f0f751a9a89a56b7d"
+SRC_URI[sha256sum] = "8dc2af2802cc700cd182d5430726388ccf885b3f0a14fcd6a0f21ff249c9aa99"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


