Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A91CC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 23:24:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11132.1751412290011602249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 16:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GXuNZGpf;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751412290; x=1782948290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wOTWYwIe0T7SwZ/uIY3knvCfWK/pfBN8WgQfG8sztkg=;
  b=GXuNZGpf453BXOqsktZkNhCNNFHbD8QAo/owEgH56BlMnN05eyif0Nd/
   o34kv0tY6vYm7fcfSSAijRJsSvLox5qKyTpHOuCrNcGzeKOWjrknKo40C
   /kdsWbVv4JW2RAN30QqbFkghJCWPJ4BF9LVci3NBtrty+z9WAYI9HY4y1
   i+S/Jx0TCa9ntUmOK5ARNWOPYbugcASRQghD1eHYp75Yi7PYCjKrIVPQU
   1lTmV0YDYeu/xdUu+Cd6pZGdVQqHFWC9YBtZ54v8BwMdThcMXvy0BqJ0a
   l9cSpmh8P4OnJ22hMOD3JzHxjtW6LXOAvcJv3XNZfmllabPOGwuzjDz3J
   w==;
X-CSE-ConnectionGUID: jeER3vA4TVyO58P3LpsdsA==
X-CSE-MsgGUID: zDVyMd4VTniCMGZrUrqLVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="183813384"
X-IronPort-AV: E=Sophos;i="6.16,280,1744038000"; 
   d="scan'208";a="183813384"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:48 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 759BF8204CA
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:48 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id F188114003A9
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:47 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 65B64D5A18
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Jul 2025 08:24:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E447D1A0073;
	Wed,  2 Jul 2025 07:24:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 5/7] mobile-broadband-provider-info: upgrade 20240407 -> 20250613
Date: Wed,  2 Jul 2025 07:24:37 +0800
Message-ID: <20250701232440.474-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250701232440.474-1-wangmy@fujitsu.com>
References: <20250701232440.474-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219742

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...20240407.bb => mobile-broadband-provider-info_20250613.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20240407.bb => mobile-broadband-provider-info_20250613.bb} (84%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
similarity index 84%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
index 2e8702a045..72663c7e0a 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=${PV}"
+SRCREV = "2a1b409491a531aedcf3eb3ba907929d96bd181a"
 
 inherit meson
 
-- 
2.43.0


