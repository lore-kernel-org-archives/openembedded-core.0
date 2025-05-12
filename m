Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1116C54E92
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.45918.1747040642037410105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y3jrQrhj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040643; x=1778576643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VXJyN/9PxuOWz/xQh4Zyl0dBNm3k4Ez5IvZ3SkfF7g8=;
  b=Y3jrQrhjdOnfsBq1yJFsCxTcHBNzv3ZhK4+Ic3CZN66/Sjdo+hzZpnoE
   ce5vtIOyUHe2ArM///w7mQYc4TryrGcPQ8vv09rOKRm58B6RbLh20wxhL
   cn/x3CgF0GzgKjAdP9+auKJ9Iuw13wgYqCH1ZLNA/GmHECAKHNH1uUrY/
   Ga9T3BiKFW5sUSB5/hJ9QugX6DggFuW5TJQ8SxiiOpXfHs5NFcMro4bG6
   /7INY47xeITyBw44ZJydNQG7/J24LWrFq/G8q0WyXEXDmoWLbAzySLwrX
   5FqsN9iBY98SWV55qvuRVV2XMiJI9nT01Cf4mNrzlcm82LwoVJtfA0aJ5
   g==;
X-CSE-ConnectionGUID: J+EIb/6zT4Skl+3+CQNEiQ==
X-CSE-MsgGUID: na55NPxARwO9w5RZACZT3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343072"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343072"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 26522D500B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC870D5045
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 965B21A00A2;
	Mon, 12 May 2025 17:03:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/56] libjitterentropy: upgrade 3.6.2 -> 3.6.3
Date: Mon, 12 May 2025 17:03:07 +0800
Message-Id: <1747040619-7566-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216325

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
================
- Correct time stamp processing on AIX
- Use high-resolution time stamp on Apple Silicon
- GCD power-up test: consider OSR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libjitterentropy_3.6.2.bb => libjitterentropy_3.6.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.2.bb => libjitterentropy_3.6.3.bb} (91%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
similarity index 91%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
index 54a866c432..e2df844202 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "ddcf1124801b74bcf39285b070093ab674d8ea97"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "c90ff465dcdb6a6949542c72a26a8ab496daa8cb"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.43.0


