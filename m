Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79970CED60C
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9232.1728452985985030710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LDOY70N8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452987; x=1759988987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pXsSYqePnc69lrjObDBiYV9s+uOr7xsDmE9Hi9uSHnE=;
  b=LDOY70N84fuu1IAkrKqW/6eezYYBja6XDWrJDfJ3Fs0rSlNc2DRb8Uuq
   i9i7owvCgCshgjgmSvtkLB9EDwXquWsKwriBTfBj2xy/H5WVeOb2+g8U6
   rMwqP6SdoHpPS1Pdf3Z+o5BYxNaF4zWF2Ohv/HIyqhXaEkCJsnmBt7CRt
   vPHwioiqIeM2Jhms3ODbyv7RpTt7RleyWFp2jBevRlv3ytEYYIKHAukH/
   puGGea/3xjWlyWPkjEnVF8YKwBibPyFCyAmJ0LZuT/7R/AQGrX8GvguRO
   ++rfs5iinwVaigPBDy7snQZ/SfCBpStTf4G7ye2sRziYKwUZLl1OgOxkB
   A==;
X-CSE-ConnectionGUID: kdNyIPCHTtStcZ4WNGj27Q==
X-CSE-MsgGUID: iE6hfZ5DQ0azfmGhXnTiiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="175456387"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="175456387"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B23AC9440
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A68A2D3F37
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A13320081311
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE4A41A000A;
	Wed,  9 Oct 2024 13:49:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/26] xwayland: upgrade 24.1.2 -> 24.1.3
Date: Wed,  9 Oct 2024 13:49:14 +0800
Message-Id: <1728452955-25051-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--0.342000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/Exmr5hqNL1nN03BZlA7M8A6J
	UWkXudIk6hUOcTonr9IAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzTAzoYcfJdKXs+8
	CjZtxAtyto9LRsn4o4ReGZWmJXW9qGgpfwyovI3vqWKZ+be0smdM9SjXjSelWX52wWIa3a7las5
	bIFV24KiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205336

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_24.1.2.bb => xwayland_24.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.2.bb => xwayland_24.1.3.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
index a3ece64348..7e817a7241 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "141eb76e7e422a3661c08782c70be40931084755042c04506e0d97dd463ef7d2"
+SRC_URI[sha256sum] = "dcdb57a66cc9b124c8f936760592628ac4e744a7d7b3179aa86189ad7ea4cb10"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


