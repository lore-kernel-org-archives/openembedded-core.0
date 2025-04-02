Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B9CC3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:34:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4954.1743590040470663189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZJmYvNs0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743590042; x=1775126042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lSc/eTb4U3JO1nxRdW3zxXQ8o6gLqZUoy0yXO4hOzpA=;
  b=ZJmYvNs0hYEJ/1T30HlKL/d6lEUWKJ/sBeTwAMfcfdKaeMe3QYgJ08uW
   yaL+YB5uwDK7CAv/26s+jZcbukVBdtzFcaT3HVPvuOt0N0tP4UIoO8xPz
   CbdmGSZSsJaH17iC//yIKjE5aWsp58/7g13f763QtkFP0MRIucXSkgJt5
   RthDzqtwhc4puQg1ddaErX1SJbu/5Y4CpQK1w37yzErM6tqiNBftGjG/b
   0WCSEC0IIhf9ljcfEL14EWLwbtxsbcD6cENMYmtYIWOlHuArDtaabh8B9
   ubQhq6Ont6dPX7vbpb8XioqDjP1/PBbAxhJV7ca7sR/EAmd1hjiV5JCCy
   w==;
X-CSE-ConnectionGUID: wcChECfnTaGKWcj6fi1yBg==
X-CSE-MsgGUID: CVOwx9e+QKGhaoqIZYWK2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="174106152"
X-IronPort-AV: E=Sophos;i="6.14,182,1736780400"; 
   d="scan'208";a="174106152"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:34:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BCA0D5078
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E1BE7EA0EB
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:58 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3B02D1A0078;
	Wed,  2 Apr 2025 18:33:58 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v5 08/10] gstreamer1.0-plugins-ugly: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 18:33:45 +0800
Message-Id: <20250402103347.2133-8-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402103347.2133-1-leimaohui@fujitsu.com>
References: <20250402103347.2133-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214254

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...gins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.26.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
index 75f528216f..f0e42ad8fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
+SRC_URI[sha256sum] = "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


