Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620E1CED608
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9172.1728452976338985791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X/CPb/KY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452977; x=1759988977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cXoFJg+NqF5WPLaMkyuE5yVkPAspIXQSQxcmoMkvT+c=;
  b=X/CPb/KY4/a3A4z5pZdByvQoiaoqRcxV5jMmX82NXuMgKO0ymSmYmGoP
   skpc3sLp1GiEEL1o7++HywZdUwQll2uJd4f4cjC3sw6c+pBTlMCEal3i3
   uM+VAb1qmCjCMNi9qE4U6dayTJ7oItQ2eZw2X0mHmU+9AJYTzJfqsCLLg
   yr1E80RqFGsrK/p9hzmLGd6JCtqAqZQ6posciHQlr0k8YhZI95hCvankT
   Ene36zl/Vkkiqd7OGcfALk+IwyBXzphCsM+2TuSVSoNq1l5zlSL9hBDiR
   ZMmUTqVNAH6rD8c6D5JcLMY6+AQQokF8EERTjl4iMXkQa23zKRafq83c4
   Q==;
X-CSE-ConnectionGUID: sFbn6sZaRAm9QW7xucyDeA==
X-CSE-MsgGUID: AqL2VDyJSWGKhdy276uQFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="155225872"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="155225872"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 12822CA1E6
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B493D73B3
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8C0640B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9310B1A000A;
	Wed,  9 Oct 2024 13:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/26] harfbuzz: upgrade 9.0.0 -> 10.0.1
Date: Wed,  9 Oct 2024 13:48:56 +0800
Message-Id: <1728452955-25051-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--7.758900-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuAI7Mvq/sL57+I
	hmgj6NxWeYUpRWZq07pXB7E65xSW3DyDV8RhnfzbYCs5AYZvXC/5UnqVnIHSz/q2cXt37jRN7Mc
	1WxqLI0QjH86oKTknXRs02j/gxQpwiiMVQOiPaXwEClJgjzpjqJSr4ZD/PIl09kCABefJILw8u8
	8YnR4WKQh2XIJFzq9AELVkGSasaAws0w7LCKZc9grcxrzwsv5uqvEvVVl3y5PB1z1KvCXwaE7Jj
	ElmVLpr4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBoaR
	Mwn0B/c/jpOn/YFJRTKHYLsR4q0LHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwfYOnKbLgo0TzZQY
	oHk1KN4zCjtOWG4QLd6+gXjXR5SmGEumxc+aIAw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205317

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Relax sanitization checks for "morx"subtables to fix broken AAT shaping of
macOS 15.0 version of GeezaPro.
- Unicode 16.0.0 support.
- Various documentation fixes.
- Various build fixes.
- Add API to allow HarfBuzz client to set what glyph to use when a Unicode
  Variation Selector is not supported by the font, which would allow the client
  to customize what happens in this case, by using a different font for example.
- Add a callback to for "hb_face_t"for getting the list of table tags. This is
  now used to make calling "hb_face_get_table_tags()"work on a faces created by
  "hb_face_create_for_tables()"(e.g. faces returned by "hb_subset_or_fail()").
- CGJ and Mongolian Variation Selectors are now ignored during glyph
  positioning, previously they would block both glyph substitution and
  positioning across them.
- Support cairo script as an output format for "hb-view"command line tool.
- Drop an optimization that would cause HarfBuzz not apply pair positioning
  lookup subtables under certain circumstances, for compatibility with other
  implementations that do apply these subtables.
- Subsetting will now fail if source font has no glyphs, so feeding the subsetter
  invalid data will not silently return an empty face.
- If after partially instancing a font no variation data is left (the instance
  is fully static), don't consider this a failure.
- Workaround a Firefox bug in displaying SVGs generated be "hb-view"command
  line tool under certain circumstances.
- Fix bug in macroman mapping for "cmap"table.
- Fix difference shaping output when HarfBuzz is built with with
  "HB_NO_OT_RULESETS_FAST_PATH"enabled.
- Various subsetting and instancing fixes.
- Various fuzzing fixes.
- Add "with_libstdcxx"meson build option.
- New API:
  HB_SCRIPT_GARAY
  HB_SCRIPT_GURUNG_KHEMA
  HB_SCRIPT_KIRAT_RAI
  HB_SCRIPT_OL_ONAL
  HB_SCRIPT_SUNUWAR
  HB_SCRIPT_TODHRI
  HB_SCRIPT_TULU_TIGALARI
  hb_buffer_set_not_found_variation_selector_glyph()
  hb_buffer_get_not_found_variation_selector_glyph()
  hb_get_table_tags_func_t
  hb_face_set_get_table_tags_func()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_9.0.0.bb => harfbuzz_10.0.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_9.0.0.bb => harfbuzz_10.0.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
index 01ea6ca86d..3b211251af 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e"
+SRC_URI[sha256sum] = "b2cb13bd351904cb9038f907dc0dee0ae07127061242fe3556b2795c4e9748fc"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


