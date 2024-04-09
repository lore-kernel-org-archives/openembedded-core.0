Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611D5CD12A9
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.130217.1712646651141076940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rbidbyYH;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646651; x=1744182651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g1qN5PCpc/sr9A0FbLbp//e5msSAQpsr3UoDkQa82do=;
  b=rbidbyYHgqbtFfptro4iJrNSR78o6SZ9O+929ZXMFHur++SbdN7aQ8iM
   CFqqovrbCn+brdB/cuNQM+43WzC+QIy7+XHOjLTuHWuUIqYrMhk3CwfdG
   RijZttU5PVHp/o8bKQL1rGjJXa5C6xa50/sArvZQdCIRa0pcOz3e+eE1Y
   NeGlPl/npjv4S7McMq0ui0NJSzf8J28E2GBNhsu/lK1TbNTethpbuou7Z
   dEKw8m9stNpDcUTkzwKWcMl+TC8LgHA1L11Wz3YWN9jv5YOPFAbsFqh+y
   17qRKnRU8UHHUmIPBK5+6ngYg0JfnbjdttyeTSvtAmzr/DXI2efI1Is6w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="142629117"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="142629117"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:48 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C900D9F08
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AE36EEA0A7
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 392951EA82C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB7E01A0002;
	Tue,  9 Apr 2024 15:10:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/33] mpg123: upgrade 1.32.5 -> 1.32.6
Date: Tue,  9 Apr 2024 15:10:08 +0800
Message-Id: <1712646620-16608-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--2.494400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrGiE93W9CeWu+f7ap9DJaDXeA
	HGnweZviLdrDpZmXds0486vsentZ7+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4rhX/lUQGcew7GX0c1Ulalwwo+sXt0rnsxzSjqs2IoGK1bSmSk9HUNoO6G
	HHxhgZD1slxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDn4a7
	qMfkMJ6+5zi6XMxQ+EBkVoW72JiDcbDhrXdhQtxiUkdABDIQGQcG76NiYvkkYh5NzBmb3wF0cGb
	lk8l9zte/R+kUUReEoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198038

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- build: Detect forced 64 bit offsets on a dual-mode system that used
  to default to 32 bits and drop ambiguous suffix-less symbols in that
  case.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.32.5.bb => mpg123_1.32.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.5.bb => mpg123_1.32.6.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
index 52526471ef..f7786e8588 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "af908cdf6cdb6544b97bc706a799f79894e69468af5881bf454a0ebb9171ed63"
+SRC_URI[sha256sum] = "ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


