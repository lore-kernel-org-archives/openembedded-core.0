Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F08DCD11BF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.7935.1711413453400438523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QtqSpPK/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413454; x=1742949454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=I/CdGOUBJ+oOv8/Q4NpsD/P0Ad9NqBM6GrYb4lVW8uQ=;
  b=QtqSpPK/xJfosH9MVmiyDiy5bvE10kmnhy0fYUrV87uFZeoItZ89uWwK
   jfR0bkTPtlEq5YZP5HjCH1nzF4pxPFB3Cj3GPMvQd/LVC17olNh3OaZjp
   nAiSDjxpVEr3RHrapkRYYOHpiO9wq+0yUcVJUCefZm00/OowOIHgMdcFO
   lu2P7iNvy/JjKQzjLG5G6lK/ujqbBlHA4ReWaHYlefbYDppsXexfMcnQA
   SzWVgmsAW/Odtpzl6lbPVQZkgpKt1gsUNYj3qcSwFhHzR8P1TsiHC/dFA
   +hN8vznLPcmDSoyC9NfQEd9NVdqGuI9styrMhbHhYgqPPzzsFFQDY54nT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132702204"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132702204"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EA60C6814
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56D46D5A14
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1D8F20097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6FAFE1A006A;
	Tue, 26 Mar 2024 08:37:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 14/34] libxkbcommon: upgrade 1.6.0 -> 1.7.0
Date: Tue, 26 Mar 2024 08:34:32 +0800
Message-Id: <1711413292-3025-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-1.365000-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrOwq9nJ6a6Gxf/JRqlbLSV7qB
	m8+P/h9No1HtkSBEPTqJfzqfv7bGuxs7n0Ur0F2Y9k0tWBWiOf/5UnqVnIHSz6aYkqKEtUB40AO
	s3P57WwvxtERWzypybl/1zzKoL5zmfrwh0VleVxxZNYSHk3Zr0ZP7qDm6WGWu92wasZo4p02yqF
	LMy/lZpjuPAcpiAeqFo6y0QccJ2UvspdAaLt+5FAPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEdn5vqTu9lLJ2HBbLQQJ2iq1i/8UCZ5uOngIgpj8eDcCbifj2/J/1cS8z+bJ2nm9UKrau
	Xd3MZDVb3ZaWJEiRZSfEgb4h6NDU53NcB4d2pEBQ1JMAniFwUkQDugcmNRhIlW56u4dY34Tzowr
	XOVmNhShOzdW55L09uNqrut3SZ+EN3Nev8Voz8VPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLW
	lXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197504

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added early detection of invalid encodings and BOM for keymaps, rules & Compose.
  Also added a hint that the expected encoding must be UTF-8 compatible.
- Updated keysyms using latest [xorgproto]
- Keysyms: Fixed inconsistent results in 'xkb_keysym_from_name' when used with
  the flag 'XKB_KEYSYM_CASE_INSENSITIVE'.
- Keysyms: Fixed case mapping for 3 Latin 1 keysyms:
  - 'XKB_KEY_ydiaeresis'
  - 'XKB_KEY_mu'
  - 'XKB_KEY_ssharp'
- Keysyms: Fixed 'xkb_keysym_is_modifier' to detect also the following keysyms:
  - 'XKB_KEY_ISO_Level5_Shift'
  - 'XKB_KEY_ISO_Level5_Latch'
  - 'XKB_KEY_ISO_Level5_Lock'
- Prevent recursive includes of keymap components.
- Fixed global default statements 'x.y = z;' in wrong scope not raising an error.
- Rules: Made newline required after '!include' line.
- Rules: Fixed a bug where variant indexes were ignored with the layout index
  used instead. They are practically always the same, but don't have to be.
- Compose: Fixed a segfault with 'xkb_compose_table_iterator_next' when used on an
  empty table.
- Compose: Added check to ensure to open only regular files, not e.g. directories.
- Registry: Updated the DTD and always parse the "popularity" attribute.
- Fixed a few memory leaks and keymap symbols parsing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.6.0.bb => libxkbcommon_1.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.6.0.bb => libxkbcommon_1.7.0.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
index 02045cc212..40cf616f0b 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0edc14eccdd391514458bc5f5a4b99863ed2d651e4dd761a90abf4f46ef99c2b"
+SRC_URI[sha256sum] = "65782f0a10a4b455af9c6baab7040e2f537520caa2ec2092805cdfd36863b247"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.34.1


