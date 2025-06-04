Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A0DC61DB8
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11719.1749026736796839147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iFrQSzjM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026738; x=1780562738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j589YulOv88pHEv18Kn/jaPAMrE+R/AVWpBQ51SwM4Y=;
  b=iFrQSzjM3ATkQoZ2Op5ZD5BnDmni4pvvnvHnL04tDy4MFBb6AJtqmaCI
   +Ipte3wwdjNkLcf7HJ4YmD1fQONOQQU9GkD35FLcjl1oILOW/hGhGC6w9
   J5T+domt80tFc0Fsp2NnhgbvM2AeTRQC4DgREXHjAyg8k7aXWVjOFzrF5
   SZNMwvr4axhQblQgiR6lW8+wQHFgGhsmsq79XN0E1Ddi909phBENepodr
   0qJE/xvQ/QxmcKq2so62htZVVjvxZgVdKOogY2qlINqDLdn5HlrBd6WLB
   qTVwYLYJ1fUovoCA2IElKVBnrqNsyHVQUvq7g/bQkc6ZqLqfA7oiToXXG
   g==;
X-CSE-ConnectionGUID: /he74+FHQu+BiKavnMTFjg==
X-CSE-MsgGUID: BeXxGZzlTtC3EneYI6PgeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201658002"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201658002"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD6EFE0ABD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 989E4D7527
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:31 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4EEE61A0078;
	Wed,  4 Jun 2025 16:45:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/45] gstreamer1.0-plugins-base: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:48 +0800
Message-ID: <20250604084524.864-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217859

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-base_1.26.1.bb => gstreamer1.0-plugins-base_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.1.bb => gstreamer1.0-plugins-base_1.26.2.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
index c872c3bcfb..dc70356940 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "659553636f84dcf388cad5cf6530e02b0b2d3dc450e76199287ba9db6a6c5226"
+SRC_URI[sha256sum] = "f4b9fc0be852fe5f65401d18ae6218e4aea3ff7a3c9f8d265939b9c4704915f7"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


