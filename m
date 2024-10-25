Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE6FD116F4
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5565.1729834796885812494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZNZXy52Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834797; x=1761370797;
  h=from:to:cc:subject:date:message-id;
  bh=DmjGHfBrWHf38VY3uW4K4HGxaya3MzUlAomvv9wReS8=;
  b=ZNZXy52Z4hjiT64nP/153ukZDVEN1wZuZuq1XKkwMKdrL0frV6z0w/oB
   4qrOgDWEMtBTWDUm0rrKkuOKeK1WTobISbXs7viPJBcO8V2qoz1vObsXy
   d+y7f5WlcXxmWkYxkMK7hxLXBRQdWWuvFTFJbv2dPxJ9bkuZ3xumb90r7
   b+eojenOzpL1WDu1E/uF7gXo7JBMh+N/T+JubO2C4sQAyeXM7AkesAnUm
   EqqejRPWpQKgyKTrmDckaRtKcPQPqbWn4GTfllVOHR1Y+GcEK+ABZs0a4
   yVc9p7v2s4e14H/1s4TVYwcjBu1blSBnAJRjsfWmHSBFseO8cJG+C4L4X
   A==;
X-CSE-ConnectionGUID: fi53YvZGTOOm9r7FrFqy5w==
X-CSE-MsgGUID: tRVmziCdTQqv0aAz65MdLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="166312864"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="166312864"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35BC616B902
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BD73D3F19
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DACF241050
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5DF7F1A000B;
	Fri, 25 Oct 2024 13:39:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/22] autoconf-archive: upgrade 2023.02.20 -> 2024.10.16
Date: Fri, 25 Oct 2024 13:39:08 +0800
Message-Id: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--1.498200-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4BXUrfZMcSEJ4H8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrZWNeuiA/l8X2AU/pWKev4zVNgI8GMJ9q3gI69no3Vi5CS/DiN0JAxm+Om
	C4ERNwjjVrsUV7fiO8KN1AtQQ1OZ9DbiT91DvECx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206313

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...onf-archive_2023.02.20.bb => autoconf-archive_2024.10.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2023.02.20.bb => autoconf-archive_2024.10.16.bb} (85%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
similarity index 85%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
index 6ba7cdf3fe..11708de1c8 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33"
+SRC_URI[sha256sum] = "7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219c592d62502a57363"
 
 inherit autotools allarch texinfo
 
-- 
2.34.1


