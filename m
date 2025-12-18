Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA59D6ACD9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37735.1766048771483523959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lbsXqpwE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048772; x=1797584772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WsMBumEZcsb8TF1gYdTMI3n8+5Dfr9u6H9mjInD1QjY=;
  b=lbsXqpwEggYvIZLU42AbxJ1lWqm3aoXVp2ewNgmsAv7rtEGvpXGA2IPa
   mIRlka+GVyGBqTI2yoBW5Y8wbbGk+2SJUeYW0KNDcV9TBNolrBmrVTHyG
   pHxiDw7+CRLTQ/DNivGpD3ZkVSshI+pen4EEV6J51EhjY68P1ixFheDGO
   g8jzh4sR557G2AZkvyOtsxMa+voYo5usjQOtazXnE7+EuUZ7pwaYJIWZw
   bAxJMUs8BS8bCUlQLEu3dQvHyY7aLCLBqe1PycTWe7jEoKWm0qDOIPNDz
   dzF1FkztLBeewdkKIq56qoRxoidlpCy3g/gyLlfcJr1+8GoREZaIfhwp8
   Q==;
X-CSE-ConnectionGUID: Da60OCYfTvGr0TwNSBfxCw==
X-CSE-MsgGUID: BXxm+14LRtKjvlA1d6H1cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223082086"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223082086"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:06:10 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E0730674D
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:09 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 95C481C100A3
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2DC924046B4;
	Thu, 18 Dec 2025 09:06:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/11] gstreamer1.0: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:46 +0800
Message-ID: <20251218090547.828-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228103

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0_1.26.7.bb => gstreamer1.0_1.26.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.7.bb => gstreamer1.0_1.26.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
index 444165a869..c66f614629 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
+SRC_URI[sha256sum] = "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff23aecde80670c8"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


