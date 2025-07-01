Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AB4C83F04
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 23:24:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11132.1751412290011602249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 16:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lmpk1hmh;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751412291; x=1782948291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lg35iaLrw59XRHCMG2vvLBgcRe9R4M0J2Qif8QpSexY=;
  b=Lmpk1hmh0QLQQoVJPqCBCCxgOxa9w7p7qBM3w2RjSNW6pPudTTP2mAmh
   njUmHDT1vCYhpy3Q0S+zHOc7OzKe0vclzPmWGjv5qAOYIlmEm6B3gHHEH
   RLdUrJGvwbdiceV8ADlj6wlDWm71FtTQ1rvvkhqrXYKuJERtq8ul6QjPa
   Q4g9W89Im/fMFXi5q1jS3W6ZXoN4CNG1fWAaHZYoVOpoUIqfJFJ3Z8Foq
   SmCulRttoQZ8xoxKOk4qVl/gUjtH6P0HDVMEXTI0q/Hr0E/DJgQZhXJh+
   uk46KOKrNeLGSBdRGvhZKy7Ud1hNRjFD27IVbB+pxbXqJrNCV37zxtvFT
   w==;
X-CSE-ConnectionGUID: eCIWUNggR36wn/0dHiUCpg==
X-CSE-MsgGUID: yI4Jgs1CQeycA+ygjyhVyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="183813385"
X-IronPort-AV: E=Sophos;i="6.16,280,1744038000"; 
   d="scan'208";a="183813385"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:49 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id DF77B144C
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:48 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id 5A54D1800BC6
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:48 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AE0D4BF3C1
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Jul 2025 08:24:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33EAB1A006C;
	Wed,  2 Jul 2025 07:24:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 6/7] ttyrun: upgrade 2.37.0 -> 2.38.0
Date: Wed,  2 Jul 2025 07:24:38 +0800
Message-ID: <20250701232440.474-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250701232440.474-1-wangmy@fujitsu.com>
References: <20250701232440.474-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219743

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ttyrun/{ttyrun_2.37.0.bb => ttyrun_2.38.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.37.0.bb => ttyrun_2.38.0.bb} (90%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
similarity index 90%
rename from meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
index 507ad1b09e..90380e51ea 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/ibm-s390-linux/s390-tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
-SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
+SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "660bab6e68fded26b2117e1dcec0844549a22fed"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.43.0


