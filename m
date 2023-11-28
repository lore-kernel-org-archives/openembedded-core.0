Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A716C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:38:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.14444.1701214678938460355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="140767888"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="140767888"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:37:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AA49D64AA
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:37:42 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9232BD6454
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:37:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 346042FC7070;
	Wed, 29 Nov 2023 08:37:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gi-docgen: upgrade 2023.1 -> 2023.3
Date: Wed, 29 Nov 2023 07:36:37 +0800
Message-Id: <1701214597-1550-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.002
X-TMASE-Result: 10-2.280600-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjozDhGeQC9EppS
	PQ6Xy9pdtYdwot7bS63FwcJqMs3Up9mWkVk6JGUgEXjPIvKd74Bgg7HO8z2tNvlRTIgxjQatwZO
	IBeM2YP6Q8jX9l2qhLSkokUSx02GqO5k/PxBAvv7WX4GMszyWygmWvXEqQTm5GHWakJc1ULwjty
	fNKljEg/GLmewhTl+ZrOti5/GINPdn7kiaUY1uN7i7edL7cQQOWuFm7TqL4eHimKcLRvsB1YE3p
	fk7XdNxIZ1rJbbMBciTZapi3VdThdf/lX0LxVMCA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqfo
	MGP+CwTz3iJCCh5tuKHvyg1ZsxTfNrsgG44+2ETdCok3ibXlQU50qcJ5WOMhmyiLZetSf8nyb6H
	MFK1qe3YJEUfDojP/J0RPnyOnrZI1o9FD4ma2XjdMFpj6k91p5E1oQow1Pf/afHM1JfRIpbjY2b
	jxXU4CXCS+ndf2yAJYLPlUVf3I3AfIeHj1U4WWYjim89e9tLpLv5Eyr/YIrqsDhztRXZ9Cm+LY9
	A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191411

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fixed:
- Add missing dependency [#175]
- Add missing test data to the source archive
- Match dependencies list in the index and sidebar [!177]
- Use KeyboardEvent.key to focus search input [#151]
- Build fixes for subproject use [!185]
- Remove display:flex from headings [#147]
- Split transfer notes based on direction [#141]
- Clarify signal flags [!189]
- Hide build section if empty [#160]
- Always explicitely use utf-8 when reading/writing files [!193]
- use `color-scheme: dark` when in dark mode [!188]

Added:
- Use packaging module to properly compare versions
- Add "implements" in class definition pseudocode
- Ignore the first class instance struct field
- Parse default-value attribute [#103]
- Test the gtk-doc sigil parsing
- Support admonitions in docblocks [#170]
- Add link to the extra content files location in the source repository [#118]
- Search for GIR XML in `$GI_GIR_PATH` and `/usr/share/gir-1.0` [!196]
- Add fallback for missing "since" [!198]

Changed:
- Redesign the search results
- Redesign the index for enumeration types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gi-docgen/{gi-docgen_2023.1.bb => gi-docgen_2023.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2023.1.bb => gi-docgen_2023.3.bb} (94%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
similarity index 94%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
index 7722ebda8f..54d7ef7513 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-SRCREV = "63b4fad4181e793f34b7777a89e5cb58fe8ac7e6"
+SRCREV = "96f2e9b93e1d8a5338eb05b87fd879856ab7b3cc"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


