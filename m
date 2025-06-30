Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB150C83F0A
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35175.1751274807907310760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IFQVAzl4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274808; x=1782810808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YFWDNcibsiaUofAqTTi5+O2tPTubNZt+2ReDzdZLzmE=;
  b=IFQVAzl49B+3y3jRBS4e2vzsmfpCnEw1JSmlGwkD4lJXuHifA0zqelvl
   5dLIZX9FW5dCp4fRmFWtoIu21TkhdwOxOATQPEOVRhrPr9qcM1z9+//ki
   H6iv3ckNb3nlEFW7N46g4AEJW+nAu6U6NAYu5ZehPMIYUmJhQVVmUBUFV
   o7DJ4H7r9qbRutVb18Tf6k7CpJtWBKwN98zAoziEjn26zm8hHkgLn4XFW
   rZXOCYCG/TQAqDuKHrWW5bkV8KfbqRqdwNluOZHkeapb1F6q/ppEZIwBA
   XfoKqGZXpmCamuzsKGcg+fiaF0Psy3To7NRhBbykikbFU55hXkTR2gDgF
   A==;
X-CSE-ConnectionGUID: LgLYCcrYR6W9cixTVArmog==
X-CSE-MsgGUID: Phvx4yL4RKW1PsiUzCzbDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204573477"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204573477"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:26 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5662642A309
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:26 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id C8D2A1800337
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:25 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 30E76B4E2F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:25 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD7F71A0073;
	Mon, 30 Jun 2025 17:13:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/37] gstreamer1.0-python: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:50 +0800
Message-ID: <20250630091315.1897-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219471

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reamer1.0-python_1.26.2.bb => gstreamer1.0-python_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.2.bb => gstreamer1.0-python_1.26.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
index 3c60e09d85..1f80063a0b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "757ae964c16a542d60708bcb8a67c56c5be83785c0d1c534b9b9366bf676746e"
+SRC_URI[sha256sum] = "9343b9a7c45f472498c24ddb6fea9aba5f1a24395ddbc0b79da6e485e42d1b12"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


