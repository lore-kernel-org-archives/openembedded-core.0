Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BD9C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.35172.1751274805760933524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eyxf7u2t;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274806; x=1782810806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wXEoXwBCZz0uVstaBuYnp9XcWVOSZSXREYjDCQPc9nM=;
  b=eyxf7u2tRN7Cpu7dEicVRoIg+sHNt0l6tAyNvaLPBE2OKmF9xcDsANob
   5h0VwFrCE8Rynx2aA88cqawiLxrDlPzR6DuYMYJwzjV3h4rEn/LVmgbTT
   66BAh5Lw02HJwN/4teNEaDwkt85IlDkC3cySfVK15TlIo5FVUFOm5eY4Y
   Zlo+2QCMMg+jlpoPzBMg+/6vsbHwMJiFdqF+I6NyntrYtt9KpgUkh1cCX
   sBeQUKokFrJJOH6+vqI8M4pUCgJwYTRFMth3Kq/t6fJXaJ54/DMHd4oAD
   QjWvYyLVl3KFXEUWD9Yv4sCQSKJRkjK33ZB5XDd3oHQyzeNBxyl4egG3s
   g==;
X-CSE-ConnectionGUID: iajpI7eSQZGtNWQNXzJrag==
X-CSE-MsgGUID: P8N1NO+/Rkq8IleVZaw2sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="192514698"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="192514698"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:25 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 523611C0008E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:25 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id C5EAE1800327
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:24 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 389053DCD7
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:24 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E73EA1A0074;
	Mon, 30 Jun 2025 17:13:23 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/37] gstreamer1.0-plugins-base: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:47 +0800
Message-ID: <20250630091315.1897-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219467

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-base_1.26.2.bb => gstreamer1.0-plugins-base_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.2.bb => gstreamer1.0-plugins-base_1.26.3.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
index c264a14ee6..74eb1360f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f4b9fc0be852fe5f65401d18ae6218e4aea3ff7a3c9f8d265939b9c4704915f7"
+SRC_URI[sha256sum] = "4ef9f9ef09025308ce220e2dd22a89e4c992d8ca71b968e3c70af0634ec27933"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


