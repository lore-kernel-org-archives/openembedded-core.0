Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC197C3ABD6
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.45928.1747040656478345628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OSLftViB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040657; x=1778576657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pmfSGqanfBW+c+scrNLiQkSJFRAyuJt82Fx0YeloPic=;
  b=OSLftViBiAHbULoZDtGnT5lXp6bemRPhSlg1EQd1DwvKek3EZlYDYkTE
   8o5P/s6P2icFe9afaG4r4HapSmDBj3Vjs66zx4OzN8Re1ppCytqSLc5wR
   wkVCVaJsp95AgWuYWrjQIDvwyPRzK5AnEH4zTDLnSZG8YFK9tOYclyEgs
   bfsJqvOwmC8Q2irbyjVGkBfKHVpE+YqpkcLnsINrPn24w+fZ/IxUx82Wg
   Vwz9mmxj+BSDwVwMSYXE/HhqU4rAaLquCFTjSmv2IMa+hmDtTgiI1jMk0
   LwJVdlYQ0RlouYSVOmVbsb8lg1t3HA+oPozb+6P54/SnEWXckd6jMVh3q
   Q==;
X-CSE-ConnectionGUID: TtspdchyQMaDzmFPLD5SLg==
X-CSE-MsgGUID: YKuYTZAQQo2ICZ1CMYxiMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125969"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125969"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:08 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6F80C68A0
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 786AFCFBA4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 344A51A009B;
	Mon, 12 May 2025 17:04:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 56/56] swig: upgrade 4.3.0 -> 4.3.1
Date: Mon, 12 May 2025 17:03:39 +0800
Message-Id: <1747040619-7566-56-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216353

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/swig/{swig_4.3.0.bb => swig_4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/swig/{swig_4.3.0.bb => swig_4.3.1.bb} (94%)

diff --git a/meta/recipes-devtools/swig/swig_4.3.0.bb b/meta/recipes-devtools/swig/swig_4.3.1.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.3.0.bb
rename to meta/recipes-devtools/swig/swig_4.3.1.bb
index a31ca68444..dd979580a1 100644
--- a/meta/recipes-devtools/swig/swig_4.3.0.bb
+++ b/meta/recipes-devtools/swig/swig_4.3.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libpcre2 bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e"
+SRC_URI[sha256sum] = "44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


