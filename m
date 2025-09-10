Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C18FCAC596
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13151.1757495822205357857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VJROTTD7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495823; x=1789031823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/dc2x+1ytgsqWSoVhM0ELKspq/iRRPFS9warGwTVvY=;
  b=VJROTTD70ekiHdO8C/Cn29xfyeV35vewOI8rX5KyeNtdlq/bBVM+2uzE
   MgRhK15KMgW/xPVPVkpI3m+df75JjrySitQHM+3J2juA+/FhFqWXTkEBh
   NfdZGWg/bLXARrB17z+H0Fg4O5l2UBftXgiXPYHC4q98yWVF0kNMRYHnj
   fvLbdeJEkKP/a35nwiqJZ4h4CRq9RoKtH67el5qpm816vaa6txrkXYuqC
   I/5by8uff/wLvZZOpruu+RmMxtZgla089vvHEIZRxbXIsfrScwXHufnOh
   94rL78FLXZwt5g2KD6sYzavqzYhtlobEtyoly3+ABnK9H2MOppUgCjBfl
   w==;
X-CSE-ConnectionGUID: pCjGjFPhToGoN8V8o2Igdw==
X-CSE-MsgGUID: fwke9puvRLi9rIXXy14poQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212404328"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212404328"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:03 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3960A82073D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E98D58D65D5
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 6A74C100036F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E637E1A008B;
	Wed, 10 Sep 2025 17:16:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/40] hwdata: upgrade 0.398 -> 0.399
Date: Wed, 10 Sep 2025 17:16:14 +0800
Message-ID: <20250910091646.998-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223158

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.398.bb => hwdata_0.399.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.398.bb => hwdata_0.399.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.398.bb b/meta/recipes-support/hwdata/hwdata_0.399.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.398.bb
rename to meta/recipes-support/hwdata/hwdata_0.399.bb
index a0abf4c03b..81dede96ea 100644
--- a/meta/recipes-support/hwdata/hwdata_0.398.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.399.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "4c97c196390e16a84d3394e7e6f0608046f7ba81"
+SRCREV = "7ba0e54565843faee300ca885699e4c42ed674b2"
 
 inherit allarch
 
-- 
2.43.0


