Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267A9C77B7F
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.26253.1750065418149590378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jH6eXFO6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065418; x=1781601418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2vBXNDTCc52xRCbXLrHgL+yOUttTbUFWcKLvogQqSdo=;
  b=jH6eXFO6dsMe4imvklX/CT/NfBH60o50d9t20bExwlLZ3slRUSCxynm2
   bEiompIHcHrzez5rS93uJie6dNDB/TuHarv43dss2ECyEq+4j3BmOJRtS
   6lvcepjAUGj5IyahgjtVvXgPlY3l9bpv3oeEKnqCkxTRvOA9+rtUSE72+
   jtp56BrbHQILnG9bHUigPqzn70a0j5h2kgVFXJeaWWeK3KPIhGu4fhOBr
   X6ei7d+JDvDO8V8SEHDLcvbVQ1wkPsHHaG2crYsNyNbhvTARR+Ee++vZr
   fwPgW0yoWAhfVRMJ6+M6p8HiK8QBpB4YJXK3XSpYAh5UZ2s6481CjycAL
   w==;
X-CSE-ConnectionGUID: mE5dmB9KTIqdkR150FR0kQ==
X-CSE-MsgGUID: aOueYpQRS52sPRG5VG6RVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202902724"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202902724"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28257C68FB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7CDDCFB67
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 091711A0073;
	Mon, 16 Jun 2025 17:16:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/24] mpg123: upgrade 1.32.10 -> 1.33.0
Date: Mon, 16 Jun 2025 17:16:30 +0800
Message-ID: <20250616091643.918-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218786

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.32.10.bb => mpg123_1.33.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.10.bb => mpg123_1.33.0.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
index d559bc6417..2905bf0abc 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c"
+SRC_URI[sha256sum] = "2290e3aede6f4d163e1a17452165af33caad4b5f0948f99429cfa2d8385faa9d"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


