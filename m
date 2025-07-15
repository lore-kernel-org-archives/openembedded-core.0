Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61B9C83F2F
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2989.1752566909382267487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eyMY/mMz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566911; x=1784102911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nr40MMlA5NOZjc+hPS+51PKn0Aareeo6hMlI0YGlTGQ=;
  b=eyMY/mMzdzZl45r6wKqhZaFCYGWlUI1twBpIKmGjRlRb73naSQ3k7p+i
   0l59KhREiQnZtq0HYOboFLAWPQBE3XCNBl0p4RFTRgZYSNM+fl8Sunzuy
   0W1gknSJGcExkItlm2I37Jy3IYBtTLWTnm/LKkKbJAz0g7FIuRzGNZVq5
   RhEs96xLxOG/nBujOJBUCNYrUiHfd8IgR5j80ly5E1XHJ5skErluXLCRa
   lgMmNxGQ3K2fdynZ1VJu6slmnZMauMrGgVVIuR85I8yHpOybX/lfxNQ5x
   PWCRkDLGpzMaX21qFQr5e0roxsjKzTTfEL1j6JLDQNvySnrkc3S+0wiqW
   Q==;
X-CSE-ConnectionGUID: WJUx29gTR0K3kxBsM20f1g==
X-CSE-MsgGUID: DGopzfvfTf+5ZAA+71iQxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="194341510"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="194341510"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id CA0A942A304
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 273BF18009C1
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9576B1A008F;
	Tue, 15 Jul 2025 16:08:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/19] libinput: upgrade 1.28.1 -> 1.28.901
Date: Tue, 15 Jul 2025 16:08:07 +0800
Message-ID: <20250715080819.622-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220275

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.28.1.bb => libinput_1.28.901.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.28.1.bb => libinput_1.28.901.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.28.1.bb b/meta/recipes-graphics/wayland/libinput_1.28.901.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.28.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.28.901.bb
index 521a7f9a09..ec2eccd26d 100644
--- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.28.901.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
+SRCREV = "7716954365a3fa2cc2b3948f21548a98085f16e4"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.43.0


