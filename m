Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630A5C5321E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.12774.1724136737202915919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YECVkks2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136737; x=1755672737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MS0nnoBJk1Mx/q9zJHB4Ke9QlkxH8t+DmLq01svp74M=;
  b=YECVkks2CIB5tcy+cBfHxqa8YENK3B9o33cYry+NyvaoTwRFWJdrkiZp
   xvA+1AHhKKg06Pkmzocl8KLxAgG3KU6a7RYgx6YxmmHIx9rKsGZMuajJa
   /dQ6/6duZr3+WYs9+rNFRVGZrPmMhVg3H/Z+rPumlYCZ0DAVT5HYyCfEA
   BceCNZZ6H/4I0p49v4dShjtnEvtw2t8m4uj87zC0lGykFXfITwNSKFkHw
   gqwXQ26Fn46EHaOm76oL8kZL0viA7RNCqMwrXceWXgrrRyVVAoiXmvmHY
   7dNcNn8ww4S9ia+UoJvJ71zJcN5wVe9/fOXe3o9s5smWqsmjjT157lTdh
   A==;
X-CSE-ConnectionGUID: vSZJWC28RfKIJ71PDXX9pg==
X-CSE-MsgGUID: vY0yeUtST96UUTY6+YJ3ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="159363380"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="159363380"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:14 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 99BFDD800A
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D7C45D5013
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70E3220086115
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B2FA1A0002;
	Tue, 20 Aug 2024 14:52:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/24] freetype: upgrade 2.13.2 -> 2.13.3
Date: Tue, 20 Aug 2024 14:51:28 +0800
Message-Id: <1724136703-20023-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10-9.332300-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrTSz0JdEAJbSvY1zctlJ9TO/y
	RkWfD4AnJEd6YBWwTIDYz0WhdKPoEEjM+iMeZmeqN70wXhI0DX6BiLDUCsch22vYsJLBjWhIvjN
	9OkaN1tqrWg6bNYOWXl58MrAm4km9MEJasnGHD5YSEYfcJF0pRZi7ngo5v+d0lPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDbnHu4BcYSmtmJAMgmwOylfVtKZKT0dQ2uJz0
	/I2b9TR4vM1YF6AJbbCCfuIMF6xLXnN0DN7HnFmyFND0HUxVP1tgUBjh2fLMUWZX17VYN77BJp4
	ZVJdJlCZOBSrmXN0H91OmVpLVgWwKtAe4oK8Dg0kotxbt7Xi5Vd2eP3vFkFj
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203531

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Some  fields  in  the  'FT_Outline' structure  have been   changed
  from signed  to unsigned type,  which  better reflects  the actual
  usage.
- Rare double-free crashes in the cache subsystem have been fixed.
- Excessive stack allocation in the autohinter has been fixed.
- The B/W  rasterizer has  received a major  upkeep that  results in
  large performance improvements.
- If the new configuration option 'TT_CONFIG_OPTION_GPOS_KERNING' is
  defined,  'FT_Get_Kerning'  understands rudimentary  GPOS  kerning
  (for TrueType fonts  only).
- The internal structures  'PS_DesignMap' and 'PS_Blend' related  to
  parsing of old Multiple Masters fonts  have been removed  from the
  public header file 't1tables.h'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freetype/{freetype_2.13.2.bb => freetype_2.13.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.13.2.bb => freetype_2.13.3.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.2.bb b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.13.2.bb
rename to meta/recipes-graphics/freetype/freetype_2.13.3.bb
index 4e7a0ad160..30f50cc289 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d"
+SRC_URI[sha256sum] = "0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


