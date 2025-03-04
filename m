Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F75C282D9
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.18210.1741079375376208310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YnlfN4h5;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079375; x=1772615375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GhKvF56T6DEuXZ2ldLyk/fpQ2NFbFflHy7/fiTICyRk=;
  b=YnlfN4h5Up2OcmjHD6y/CY3fz3+wcbMLYipJTy/4/G6iq+BLwnQPVnXJ
   a5OsqXqgKrREx4XxBI/5dwKnjqXXAtic3iVtyMvHBAkkplvb2iWxlKmhc
   v8F2IJ+MotkZOekTsdo0b1nvNVkJYhw2jC6NMk32zykRfREz4TfJY14sy
   ZRRPVcryEYdY9gHtozGStpcLZnBG58K4NItpwSwmVINJoODGwUHol68Xq
   2L9/7gxk+Ahl78ZHQCcnEmOnuxSDONlOkba7zjyttyEpuDXiqQ35eI9NO
   5z3u054moJfHxHD1+XGpR4X93SJZCWBXFrcwnWteNctExXSSX+ePLgZKe
   A==;
X-CSE-ConnectionGUID: IBZ+ZFqOTXiPZwpUEGNe9g==
X-CSE-MsgGUID: tVtCpyT1QmWS4o/DUkbtAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="170800548"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="170800548"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8ABAE9F18
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CD74D729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3BCD51A009A;
	Tue,  4 Mar 2025 17:09:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/31] python3-websockets: upgrade 14.2 -> 15.0
Date: Tue,  4 Mar 2025 17:09:10 +0800
Message-Id: <1741079356-13445-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212257

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-websockets_14.2.bb => python3-websockets_15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_14.2.bb => python3-websockets_15.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_14.2.bb b/meta/recipes-devtools/python/python3-websockets_15.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_14.2.bb
rename to meta/recipes-devtools/python/python3-websockets_15.0.bb
index 0c7b7d2470..9a7456dee4 100644
--- a/meta/recipes-devtools/python/python3-websockets_14.2.bb
+++ b/meta/recipes-devtools/python/python3-websockets_15.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5"
+SRC_URI[sha256sum] = "ca36151289a15b39d8d683fd8b7abbe26fc50be311066c5f8dcf3cb8cee107ab"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


