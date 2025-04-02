Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C43C3601E
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:08 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.3865.1743584884471929132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TxyzMZLA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584886; x=1775120886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7OXCIPOwGsF9wwCG0u84EI+VOv4Du0srCReFXRssG10=;
  b=TxyzMZLAfrHgj7l/LEqT91LjB95751sxI6KCfttZYSX3Uo9g4cHKOvWX
   buOR72I4I4UhgQQcZUQZ/2ouz4qQuE3VtgqtHOlkcjS8XRluSoxejfocB
   63S+yg22bGo+irLSVXQtoPRttLwhBnzJyCHM2KRCEv2z67gBTsKbSjdJl
   6XYBYYF7PmORZAJRpbJkiHRP1S50OSOCl1qSSyw0zf3pJH/248VzwpuXE
   xH2LVcPoRuQjlp5nciUtvPIF/QBkO/EpOYyzlizPu/ly4NiV0gV7CQbPY
   0+mjv0PbMsL4LzVpwHceT91r8A3md+CzHKniZvHNK/MnETC6q82hwrqez
   w==;
X-CSE-ConnectionGUID: SyrFcAD2S5uXgvmTaXM7Vg==
X-CSE-MsgGUID: z4lcpIJKRZi/xzXPrOJULg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="195532898"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="195532898"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:05 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 58019D4807
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D9FAD52BA
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:03 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 763B11A009A;
	Wed,  2 Apr 2025 17:08:02 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4 07/10] gstreamer1.0-plugins-good: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 17:07:46 +0800
Message-Id: <20250402090749.2119-8-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402090749.2119-1-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214239

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...gins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.26.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
index 9cc2d462f6..a2c6426c34 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
+SRC_URI[sha256sum] = "9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83f60e8d3adb1e2eaf03b"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


