Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C6DC3ABD2
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.45968.1747040637466043731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nCEkgUfM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040640; x=1778576640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QokNTG9zlREo8QIAtNZPsTpefe84jtnbQm3ezyreons=;
  b=nCEkgUfMZr1S3H1TqnDVmlZhOvJ7cQrPLicYd8G7RPE8EC40U/gRUupO
   ljjvCU2cw9pmxRSBPtPbl1AnZSN7khT3oiHOUHnvruX+TfqE1xBeA/cyw
   xWADXa0KK8E7Kgzhm0Cqdzu3RTXZkiD99PdMmP9qdPCzglXgcstaQc4Su
   Zmrk5ydyceXJacPCfHX1ROH/vh/5gatpu8VgxvhdbzfrOHadVCi30pUM1
   jSx4aFKzGr+PE80kqE5LzgyLlPRADLVuFR6dIVmYdYuo4SPnwthjW3N/u
   50diuiBTDGNHpKBstK28vwZyxexBU3qn6wvK2Q+Cb7Ur4Y+ZMcREUiOp6
   A==;
X-CSE-ConnectionGUID: B1uPMOWyREePN8UNZTSp+A==
X-CSE-MsgGUID: j9tPOJtHSfygS0eQBx9UGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187121894"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187121894"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF29BD5059
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 76E75D20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B73B1A009B;
	Mon, 12 May 2025 17:03:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/56] epiphany: upgrade 48.0 -> 48.3
Date: Mon, 12 May 2025 17:02:56 +0800
Message-Id: <1747040619-7566-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216313

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix crash when opening downloaded file
- Fix crash when opening incognito window
- Fix Crash when trying to select download location
- Fix Crash in escape_csv_field() when exporting passwords
- Fix Adding WhatsApp as a web app crashes
- Fix Pressing Escape key in addressbar resets the cursor to beginning of
  the widget
- Fix Epiphay shouldn't show the privacy dialog in incognito mode
- Fix (CVE-2025-3839) Require user interaction before opening URL in
  external application
- Fix Code cleanup
- Fix window: fix crash when force closing window without session
- Fix Several fixes for password export
- Fix Remove Granite support from Tech Preview and Canary
- Fix find-toolbar: fix crash on load-changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../epiphany/{epiphany_48.0.bb => epiphany_48.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.0.bb => epiphany_48.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.0.bb b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.3.bb
index 9eff56df3a..74a17be5a5 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "c9d1f6dffbad03b0916436901c770da302879ca60a636d2b72b25b142ec05f80"
+SRC_URI[archive.sha256sum] = "da2953e7e2b73bf7473c0a33979104d79362795295eaa0a2a38ea188537daf13"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.43.0


