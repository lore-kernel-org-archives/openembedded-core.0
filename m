Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F13C27C77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.5669.1716369336014468913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iHepR/TX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369336; x=1747905336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aIjR+nuZz17AvuQkJLjMiQHaIS9sV6z06vYJjWcNOVE=;
  b=iHepR/TXGsFLUx26dNfORn4cPKb4JTIkUjgubXIcXaqOS6BWLfI6Aw3c
   51LIqH/dlBQXl7cKfCmHDE70joU+4T1YrrUqXgtjW8T/TNeVW16Tn9eZ9
   ZnesDOdSzLNMLdEyFTEYskr4/18ENb0s/8XY9J//6+zGng3yyIchsCWBN
   dPdMUnLgElyRi5B8VaSpeDEQFlJ6+O5r1RTCNaCbdQxv1oczxSW4qN63Z
   Aaku+plBYSDTmozI+DcRkf4d4qQgK9CiLAeBvA8/ujGYXBwa+rFWynLQv
   f5MzLokB8Gp8cl4qjV0kabKsGRw0JWKt1D7t5lLoIDR1n6ycVdBPqv/gX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="159133788"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="159133788"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B4E2D29EA
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D04F1D6FF0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FBC92022B83F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF9A01A000B;
	Wed, 22 May 2024 17:15:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/42] mesa: upgrade 24.0.5 -> 24.0.7
Date: Wed, 22 May 2024 17:14:32 +0800
Message-Id: <1716369289-22526-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.466600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBgA+oehWZhHfUZT83lbkEO79
	DJRUi35pWwhqFGcExMuK8WnR386CVqtQiwhvr7wUTuctSpiuWyU2ZWOmuJUS2fuzwJAEkzruHqx
	sBjV0bTaESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLMx5T
	lxUCqeL7IPyhuXvy5/VXvWXd6sJ2h6OFaujRLudXcpBzbYgeFjSMi++fqaIn7pBU2lA/NJw251V
	Hnh7lcekx7ail3Q0aaIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199719

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.mesa3d.org/relnotes/24.0.7.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 77e9c80fcb..48ef7c47f1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
+SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.5.bb b/meta/recipes-graphics/mesa/mesa_24.0.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.5.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.7.bb
-- 
2.34.1


