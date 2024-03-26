Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849D0C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:43 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7827.1711413335466148798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Udw2b3Kf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413335; x=1742949335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3+xbJNc1HWUEj/2uEzJ7pSrvXO4h9ZZGyD+jRjmi7w8=;
  b=Udw2b3KfUuIFB1JnRmU8rHh6FhdwnnJ2L++9jIunF3wuaRdCTcBwx62c
   92J7/2NEMADJHIfJR5/MGPWqjuM6V/QScFED5qXLV6W5e/jTQuaxZwO3Y
   f5vYKFtoNEAkfWusZVVLZ9B3JIngYx/LQuFh28D9tBOrRl2zG3+Zki9Al
   4hS6D2bjWUZqjbHKHePEucDMmWZbzO6lxQMu0zFkQK98U2D7/xQTpz/5w
   vx/gwhkgkmislGN7XRsH53tN9vuvKpojf/uNT3+S79b0/c50XpPnsYtbw
   D95uuTiS1h1qFBKO17qFSFTqI3oWvmpbcVxkIg95n3MzyBsPsSB66CCeQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132127408"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132127408"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CE648E0AA2
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E91A5FD849
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 894BC20097CE1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2C2B51A006A;
	Tue, 26 Mar 2024 08:35:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 09/34] harfbuzz: upgrade 8.3.0 -> 8.3.1
Date: Tue, 26 Mar 2024 08:34:27 +0800
Message-Id: <1711413292-3025-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--12.153400-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytL/3rQmWrTBiuH
	iwKjBdhngnSs61+s8+7hdE1YEBr2LcgLggM+entsOWUWxTQJdI/Y3c1mOfByWNWM2x6EZ/S9d4A
	cafB5m+LllX6nWbEzkCCu1GObjVSQN9WjMsARWaGC+Y2uxPjockXmpVQIaHBPlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDbnHu4BcYSmt853YiZBxTITXXxPxbB+61Z6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vCug4Q/lFeqaek7X3fLGffCbtxRHbfby4OyC0
	Bd2dHN2I/zgB97ZcCg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197499

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- hb_blob_create_from_file_or_fail() on Windows will now try to interpret the
  file name as UTF-8 first, and as system code page if it is not valid UTF-8.
- Fix hb_style_get_value() in fonts with "STAT" table.
- Properly handle negative offsets in CFF table.
- Update IANA Language Subtag Registry to 2024-03-07.
- Subsetter now supports subsetting "BASE" table.
- Subsetter will update "hhea" font metrics in sync with "OS/2" ones.
- "--variations" option of "hb-subset" now supports leaving out values that
  should be unchanged, e.g. "wght=:500:" will change the default and keep max
  and min unchanged. It also supports "*=drop" to to pin all axes to default
  location.
- Fix hb_ot_math_get_glyph_kerning() to match updated "MATH" table spec.
- Support legacy MacRoman encoding in "cmap" table.
- Various build fixes.
- Various subsetting and instancing fixes.
- New API:
  hb_subset_input_pin_all_axes_to_default()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_8.3.0.bb => harfbuzz_8.3.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.3.0.bb => harfbuzz_8.3.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.3.1.bb
index d733342682..fd4dcc2338 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847"
+SRC_URI[sha256sum] = "f73e1eacd7e2ffae687bc3f056bb0c705b7a05aee86337686e09da8fc1c2030c"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


