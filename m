Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B939D32D71
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.82434.1731403537826698545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aQVnCwVk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403538; x=1762939538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XzpwM2Xs3c0+ksFOnq2NO7ACnXLQH8VyB0X/Tdv3WLE=;
  b=aQVnCwVkgOT3dACeKsxW1kVQRM3aoUhS+lJHcMMNXreJUFKXNmi8VhCF
   /Bv3RQOO6U24ezGoFDAwZ2Y/fmPipj/ZgaHfQM8eM4KHS7UWbLJ8IwA6s
   GihOLCpFMi0du4Ugy4jTSXQ0IpMBfZZiJMm9qLpjDRDAI8QOggoF8LMJH
   NtZ9u/bg2bv80IlRL8GXvuZpyRPoaqBNGhJUIBhfWvdPUuBj5PF5KOLm/
   Ii6UYwmVx5ZSPiYlN16uQh50hls93mWx2WRZnbEITbAwTrWvyWvzKgBs1
   Fuu2RnHx13be7j1XNh8a6Ge1w4ABhTeensYKBt8t2Bzq1ce47USBuAGFb
   w==;
X-CSE-ConnectionGUID: C02/nFHiR0Sl9SN/uJB+Pw==
X-CSE-MsgGUID: nWzcXGM2TzOS3+R+hC+mRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180109621"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180109621"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C33ABDBBC9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EA5FD5062
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D6AF220079545
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 84FD71A000A;
	Tue, 12 Nov 2024 17:25:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/47] python3-hypothesis: upgrade 6.115.3 -> 6.118.6
Date: Tue, 12 Nov 2024 17:24:27 +0800
Message-Id: <1731403483-21399-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BzNCdGumZsSZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SWBgJatqC9KxKH9fGxk0Z0qRqIJr8KEED0CXGq9NIWTvIAx
	WUTOcVSnYp+O9wFA+DvZ5kcEmRVstv5LI3/JjpsPECdGE/5jHZS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.115.3.bb => python3-hypothesis_6.118.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.115.3.bb => python3-hypothesis_6.118.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.118.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.118.6.bb
index c8dc1b08eb..f5f7642d67 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.118.6.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "d4efc8c7371bd4ec906d2777f1f18fee5539e47b3d7c7cdc93d1026ad35d9b33"
+SRC_URI[sha256sum] = "96e7d86034658100f50f3150917bc8a0cf7ea94af49d36efb167cb8e66f035db"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


