Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61669C10F16
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.11790.1713948189281173293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eHjjsu1e;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948192; x=1745484192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=n8diWMd7AdeFCY+muzqjneLN9pCHELwHCePtr3n1yyc=;
  b=eHjjsu1e4OAOpMfnwfO7Ejbyupcj1Fr9WxkJY5IkHNmdMKh34KUIT/kR
   KIM7/ZRLS31vr5p3dUJD+gEGCZsuaBWSPrDsL0cVONHLBXVeVbIYdZkU2
   K46K/NE7NdtZ4EHVXTBMaWpRQcKn78EYOKHvAY4DcOdtIkSKnu0DNfCE8
   q8FN+xT0BQggpX3XcXQ6N9CfrPcY1MaBNwjetIuJHPjF1L2TXX6y7NqWp
   cpN5O4ECYK71gq+91tPznogkgNa1fNOVxTttlVPSvmreXAy6LIEOzZsdR
   zz25hKiumpaPJaxkGE9DIhwKw2A8q/uoxYoJlJZGyKzfT+veW/hKR3hp+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="145017041"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="145017041"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE728C690F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34896D7B90
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BF062B1CC7
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 48D741A000A;
	Wed, 24 Apr 2024 16:43:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/38] util-macros: upgrade 1.20.0 -> 1.20.1
Date: Wed, 24 Apr 2024 16:42:29 +0800
Message-Id: <1713948152-13501-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--4.214600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNEzEoOqAAVLPSde/CNbaZJVcZNuxCoduS/sv
	dVly7w9nLSrmLIdgBuj8Ga8ARMqXN5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2FR9
	Hau8GO7qfDnZdVcKQkDqHcWkMkzCef93fJ/TFOQTkTCmNXQItImsJui+h9Z0UM2CFP4w1fHAhqe
	UL8qiC96ll7hmgIiUJ6GJym8rdYd5mYyEIzrmguHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198678

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Remove unnecessary escape

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-util/{util-macros_1.20.0.bb => util-macros_1.20.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.20.0.bb => util-macros_1.20.1.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb
index cd4bc387a2..8a0e7bec41 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb
@@ -11,7 +11,7 @@ PE = "1"
 
 SRC_URI += "file://0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch"
 
-SRC_URI[sha256sum] = "8daf36913d551a90fd1013cb078401375dabae021cb4713b9b256a70f00eeb74"
+SRC_URI[sha256sum] = "b373f72887b1394ce2193180a60cb0d1fb8b17bc96ddd770cfd7a808cb489a15"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 DEV_PKG_DEPENDENCY = ""
-- 
2.34.1


