Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44025C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10793.1710313754204451074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lZPtcyz5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313759; x=1741849759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DjttFq8gDv41lHO+xD2gu4tgnIJoZVtygU21XsvKKKQ=;
  b=lZPtcyz5BDmTSWRfuoRNR2UNbGU2Cu+/vmbq148YFTNuKpzm4MtcZ6QQ
   8iDFQ8aKXLnBDokg1JdAahKBbh4l2xSCUFMJUlh+pashfhxeIRs/7r7Pi
   4rF8uCGVz6lOEomM2FuTKmRa8YQTm+oTOOlDon1V/JEcpAs6cU5Sf34Rk
   dkfTyCck3FOPm/C757YR00DGEi5H79CTqbMooSMNQjbXhcmtXwV2fFRim
   HbTPoGWnejytghfb4NJVZnhSOEj4zaGcl2PV86d8/P+ujFo4suXNm14W6
   V11MSbrRDxQX/QKfCgQrntWbLXPY3dLtCUn/VXNNp03hT1Z1K5XtjhSvK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152393614"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152393614"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A8010E9648
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E98BBD548D
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8224B21BD41
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2D1FA1A006B;
	Wed, 13 Mar 2024 15:09:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/36] libxcursor: upgrade 1.2.1 -> 1.2.2
Date: Wed, 13 Mar 2024 15:08:11 +0800
Message-Id: <1710313714-12541-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-0.872200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrMVx/3ZYby79fwudzT4nmGYnO
	/I/i7S2A4K9FmervsqUFRXrSzCXQeNn4coLx5MxqHPYwOJi6PLkhFjPtWsXnp5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtgIaoZvHvzjNCKMu+nzWQLqj05EdWHQ5di7UyOEYfwMo2tiu8DOGl7z0ku
	GWOe4nRVu4vSLbjvRtMZwhZcaZfd3GW8tVPrB9nHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197014

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Remove superfluous and unguarded config.h include
-XcursorXcFileLoad: plug memory leak in error paths
-Add comment about keeping libxcb-cursor copy of code in sync
-If O_CLOEXEC is defined, add "e" to fopen modes
-configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
-gitlab CI: stop requiring Signed-off-by in commits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxcursor_1.2.1.bb => libxcursor_1.2.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.2.1.bb => libxcursor_1.2.2.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
index 4fd7e949c4..159ac4f7fa 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
@@ -18,6 +18,6 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[sha256sum] = "46c143731610bafd2070159a844571b287ac26192537d047a39df06155492104"
+SRC_URI[sha256sum] = "53d071bd2cc56e517a30998d5e685c8a74556ddada43c6985d14da9a023a88ee"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


