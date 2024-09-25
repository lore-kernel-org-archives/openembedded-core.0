Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FFCC369AA
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9328.1727246991269165170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RGeriZUO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246994; x=1758782994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Wzq+IIpfinyQk03fLsMeZgV92bO5ny0X20V+6ueBiVA=;
  b=RGeriZUOmEyoUQcuTOAoLigKh6toRfHluPnh13CIV3/sFKKb0iclHmdB
   Jj8Csd/NZtu6vFNak20KOso+FrZyiTGhOpqetdvwwnuq1TrlMRuWF64/i
   IFkzLFX+6WdlOupD/+PuNxjGKXM+Ej4m3yXz59Yfp9bhcy46iqHLaLNJy
   fLdiZLaud750/6eK2qcXYB53gz3DLJeRV1TEdH0rMJGFDMEx+yU2YWsv4
   aeAzhROVoFpu4mS1cQGsadu6hIj++nAgbHign1m87PkP1gcM83Tv8nW/Q
   QdUONaUJOZ2IfWKPVwp44YXzekRAq/SWScf/5Pk5JhCmu8Xy+2IY2WAOd
   g==;
X-CSE-ConnectionGUID: 03v8+LxnTI2aX4T20uaRjg==
X-CSE-MsgGUID: q7dYdq3NQEu1cy/7cWZd2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162724315"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162724315"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E71BC2142
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C752BF3DE
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BEF320086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DFBE01A000A;
	Wed, 25 Sep 2024 14:49:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 47/47] xcb-util-cursor: upgrade 0.1.4 -> 0.1.5
Date: Wed, 25 Sep 2024 14:49:20 +0800
Message-Id: <1727246960-20665-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-1.374200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrXef5t6q8Rcyr1gUu9f1F/876
	o0HyvgKNgPDDLP89VEZusJxXwmCOniGIqlqmIVBSA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYi1Kv3PwQZsrZy2a3a5HYGmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNe5+4KX96PVEqGWA2zivfsh/AJ04MGrhVWaB2yd3eKEhA8ufupF0kliOMbds1lalztGIA
	0tbcDb/sS4HF1bG0jWF+q7638kamTIuZWQlOWCUU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204940

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- cppcheck style-fixes in _XcursorThemeInherits
- Insufficient memory for terminating null of string in _XcursorThemeInherits
- Set close-on-exec when opening files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xcb-util-cursor_0.1.4.bb => xcb-util-cursor_0.1.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-cursor_0.1.4.bb => xcb-util-cursor_0.1.5.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
index 047697845c..cd442db210 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
@@ -7,4 +7,4 @@ DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
 
-SRC_URI[sha256sum] = "28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb"
+SRC_URI[sha256sum] = "0caf99b0d60970f81ce41c7ba694e5eaaf833227bb2cbcdb2f6dc9666a663c57"
-- 
2.34.1


