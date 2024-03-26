Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A678CD1280
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.7948.1711413466170371967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BQm+VDdy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413466; x=1742949466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PYlEehHbO8VIN/T+urwRW894b3MZrX9bh9qaSNHTweM=;
  b=BQm+VDdyaHVvu5Mkwjs6WZaKOVWR8N9xeo/3uw3y9y2idgjT4VT5rnFJ
   ZWp9yMQImWyaUkB/3gVVMq1Wn+MugJGFmAsu3S0DTcT1+zso8pWCldv+t
   znafpRSbX8OZuDQrJmu/PV3SbiUas9C1XqguC7pNY2XpxatyQ21b5vkHd
   dm6Q6MThbppqgo3xawkvPNsEWgiZjLUS9MMt7sjGLbjUrQaX1hdTbX+KB
   gmCjpoktFt9xdCmOA5Bz4bXQMDbMoNpRFlUHVp3IT/JfZCLMr2lvyxrWo
   +ksxRz5z/+wQLKh1h7H3us1Ml7vm9yUkkOKlXA097PN4Yx4YFjOixT59v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="152784629"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="152784629"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E8EBBD5A48
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 35AD1D5A14
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B0B17411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CCAE1A006A;
	Tue, 26 Mar 2024 08:37:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 33/34] wayland-protocols: upgrade 1.33 -> 1.34
Date: Tue, 26 Mar 2024 08:34:51 +0800
Message-Id: <1711413292-3025-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--4.483800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mregIHHX2L4Yyynk7TnYzMutv9
	Yxcv46SLdkyho0WkAXiMkrRACx129rBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFcfRJq1ctTfzqcdt4G7kueczvBt5KTZctPrhvTq+YBF+Ug5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlywjQy+gaYUtmHQZJAvdHJhMxOY
	xq+NuCJd3Bwc+XOYrWxLWH2HZIwOd9owH6cNlWykqY9RvevalWbyW9dwrYtt8mKYfb1TI4n/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197522

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-staging/dialog: Add "dialog" protocol
-Add xdg-toplevel-drag protocol
-build: Bump version to 1.34
-Fix typo in ext-foreign-toplevel-list-v1
-tablet-v2: clarify that name/id events are optional
-linux-drm-syncobj-v1: new protocol
-linux-explicit-synchronization-v1: add linux-drm-syncobj note

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.33.bb => wayland-protocols_1.34.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.33.bb => wayland-protocols_1.34.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
index 074ea3663a..8c12985714 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a"
+SRC_URI[sha256sum] = "c59b27cacd85f60baf4ee5f80df5c0d15760ead6a2432b00ab7e2e0574dcafeb"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 
-- 
2.34.1


