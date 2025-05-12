Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD84C54753
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.45913.1747040637212932732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LIDUbjoC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040642; x=1778576642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qqd1jGtrhU92cxXfR72dFTif6SRX6WXlUZqOWDE7AwA=;
  b=LIDUbjoCxFuATEcSoQBFcQFd1VmAh2LJdLUZt9INBDQnSod4KJ08OjR0
   GevwXnEoxQRIkctWJbJGZkEXClCLwDM2ZTA+nw6XFjFSkPMtCLHfrGwIx
   OSC6kVFo13tkH7PnB1C+J1O8MKbberxLTdLNj6Q+oPzWk0M3GPl8Y14SQ
   G0RqAm+TEq1PrVxbAcVoK8dK+uFBzcwbLXwpAZgJAV0X8odFgUy16xuDi
   DCd7/Q3bf8RY8XToUYHGqv/4oYQshoZImbasG1FXQDjZUmIBIimbu03Vj
   UiRNzprPOJOf/NG8z5kMFn1NLbt0F/iSLSatrdMtvdmLbUzTLWOhNR+YK
   A==;
X-CSE-ConnectionGUID: hMOUegkhTfSSd6cbmjl65g==
X-CSE-MsgGUID: 2koNCsZ/QAaVItt0ac6DEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199193693"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199193693"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E5BD5054
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 21B57CFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D29931A00AF;
	Mon, 12 May 2025 17:03:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/56] libjpeg-turbo: upgrade 3.0.1 -> 3.1.0
Date: Mon, 12 May 2025 17:03:08 +0800
Message-Id: <1747040619-7566-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216318

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: zlib License clarifications

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_3.0.1.bb => libjpeg-turbo_3.1.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.0.1.bb => libjpeg-turbo_3.1.0.bb} (94%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
similarity index 94%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
index a1d7d57fb5..8533bd8525 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "IJG & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2a8e0d8226a102f07ab63ed7fd6ce155"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=023c2e8942020502d6ea709e2a5453f7"
 
 DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "22429507714ae147b3acacd299e82099fce5d9f456882fc28e252e4579ba2a75"
+SRC_URI[sha256sum] = "9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93"
 
 PE = "1"
 
-- 
2.43.0


