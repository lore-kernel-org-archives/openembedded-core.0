Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24FCC28B28
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.18102.1741079370276389066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CBDzxUqg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079370; x=1772615370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZmdmCp47a2YohnMxoBGF/MBYRRvYMivNixaMuygutG0=;
  b=CBDzxUqgMCmCaElJwn6crJeyWvsVKYNHY90O6tIWc4E9PzrGyNuzf20i
   O08D8W0w7p5HaUjWHoz//+lXQDAHeLq5L86YJBJ4ru4NWYQvHc5ibGgD4
   V8t0xrsnDrqgrPMJi9RnZ1cgJFU494Y8Ppl9aNRJJtIeSvHwb8qjw62yf
   +pqOXlIYpcrvyFTyEQTRKbTPp/I3NRAkVmJiaJlqp0pzaMnEtglVHbSrL
   l7eyff9yzZbe+g6oLnAmeOXCT6JCqaSU1rFkPidj+5s7quw+yCUcixalG
   VytopDMbNljUMv+6gBI39N5ttpC+YMTt6jvKZw0Y3SOZxJ4xyzOiV1Y6F
   w==;
X-CSE-ConnectionGUID: WDOInvV/RyyxjgAqmVuvEg==
X-CSE-MsgGUID: EnSulw2eSXGN/R0Jqy8Xdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="170766379"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="170766379"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:27 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B86FD4809
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5555D729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9383E1A009B;
	Tue,  4 Mar 2025 17:09:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/31] libpng: upgrade 1.6.45 -> 1.6.47
Date: Tue,  4 Mar 2025 17:08:54 +0800
Message-Id: <1741079356-13445-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212236

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.45.bb => libpng_1.6.47.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.45.bb => libpng_1.6.47.bb} (92%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.45.bb b/meta/recipes-multimedia/libpng/libpng_1.6.47.bb
similarity index 92%
rename from meta/recipes-multimedia/libpng/libpng_1.6.45.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.47.bb
index 11b56319ce..371ff1436f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.45.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.47.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "926485350139ffb51ef69760db35f78846c805fef3d59bfdcb2fba704663f370"
+SRC_URI[sha256sum] = "b213cb381fbb1175327bd708a77aab708a05adde7b471bc267bd15ac99893631"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.43.0


