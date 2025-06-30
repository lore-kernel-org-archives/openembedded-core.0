Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D18C83F09
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35170.1751274803700367122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J6IW4tm7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274808; x=1782810808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T/qwZ8I3JD1gj5B3wmYiLUo6P3tf0z0fxJYPrXbSSgc=;
  b=J6IW4tm7Affc7yyRbOjfQbqpisw4tr0b+35gOAh3ZG+luDBWk+4xjP8X
   QRyLuE0rCQeWruYXeoJNd0W7Hnu/Ghqk8Es/DiNfM8myd85MQNOdRyIIV
   9s6GePKrOrUT3+t9qoU9cQTOruupdRjoMUvUBpzhVvudXYbFuu+hcqIOy
   lBt18O1qXD3TfH0EXBiM2gN3vKbV8udNqxLPuo7b3rZ0oJV16dVoCswQR
   VuQgbyJrETqVozeeQv4uPI1nf3DD7OKFo+/FXtvnVnjOTb8Xlcf6Mv2KO
   9bAj7OalhE0GHm87JXxk4Hq0zlCqQalz79NfmBppfk6zqCjb7LOFFWkFc
   A==;
X-CSE-ConnectionGUID: +Aw7NUS4RxWP1a9JblXx9Q==
X-CSE-MsgGUID: zq6Edu9STJSXIIqtgutlfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="205056016"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="205056016"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:28 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1817642A31E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:28 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 8CE60C00D4E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EEF3BBF3C1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:25 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8931B1A000B;
	Mon, 30 Jun 2025 17:13:25 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/37] gstreamer1.0: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:52 +0800
Message-ID: <20250630091315.1897-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219473

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0_1.26.2.bb => gstreamer1.0_1.26.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.2.bb => gstreamer1.0_1.26.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb
index a921e39144..9de76944fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "f75334a3dff497c240844304a60015145792ecc3b6b213ac19841ccbd6fdf0ad"
+SRC_URI[sha256sum] = "dc661603221293dccc740862425eb54fbbed60fb29d08c801d440a6a3ff82680"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


