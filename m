Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAF0CD1297
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.130223.1712646656112303851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FY0Oa5BL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646657; x=1744182657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BYm2As3AD+StS0L2u/6wTKJe7Ob0l56gZ4wzWDynNgk=;
  b=FY0Oa5BLEQURTuoQWPVatBPdrBvomyuj8uBa9+Mhx7GGXbpnlx+4x4CF
   lPze45YiWg+rYK1WwPs6zFwencLVDupsnCCqmY9/w17YZT/RxgUMRoVeN
   AkWVjpCEnJBX4v16SUT6VSp95b0ERbZxX3hoZFhhZPCTyubww3hqugYET
   H/zykhG8fDhGP8ob4S+kvEHqjTcKSw6g9SoVVzdvWjKbP/wNYgHNaa86u
   LSF7K1jsbS+Xkx0QUMeMi0LF2UQhT/OJvJ+ZVnSj/imbNE88uHazOi8Za
   267sBIc9CQICyQtaLFqKB2onO0IdbayRF9/5AiYIX85eOXy0CRVSivdI9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="155056951"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="155056951"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D625D4803
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E016D3E1A
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FCE420093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B129A1A0002;
	Tue,  9 Apr 2024 15:10:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/33] xorgproto: upgrade 2023.2 -> 2024.1
Date: Tue,  9 Apr 2024 15:10:20 +0800
Message-Id: <1712646620-16608-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zb056mCmF00ZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SSNLGw0PW4SKB1wA6GhIRADNEn5dXEgMKFQeyYSDLPGvoyZ
	YUH7l9bkQD9s+TVngU+7A2T+5GeAEyZhuhG9xsZl0EzMFVYcw6S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198053

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-proto/{xorgproto_2023.2.bb => xorgproto_2024.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2023.2.bb => xorgproto_2024.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
index 94d37c56bc..3f56e21a55 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=0b9fe3db4015bcbe920e7c67a39ee3f1"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c"
+SRC_URI[sha256sum] = "372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59"
 
 inherit meson
 
-- 
2.34.1


