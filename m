Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C54C28B27
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.18102.1741079370276389066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UBUZ2NZP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079372; x=1772615372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OCmJkcSG2OEa0WQZ9ysIgVh/8UXbK8JshkKLoRfeGkE=;
  b=UBUZ2NZPvv7o8w8cRPyX7WrEdEYjjgbEh/v0fywCtH4OmVUzgrca7epU
   A13xbV97FGEpf3Z+w+FoGv2K8Qu+wSYA/eFY1fbRwGJgP3kLoUsNtZ6z9
   qO7ZFuP0NnNK+8Ti8l4jLY5jJe2zx2B8UJsrxpjf5u0fnVIfS5i4RzOTm
   EjQOU6MVwtBrnHg63eEiWffpmoc188qhU6H8aP/KelbY4uY4BTX5dofT5
   cbyxmWIee6EJ7QzDvpG3tO2Eu+jxeSxcUEO/dFo2w71OMnDOH8XFRcTXw
   dZAOfxzX0DspZr4UujFWnhyz6f8rcDjjG2Qos6iuME6dPCwVUQmyz6Cov
   w==;
X-CSE-ConnectionGUID: x1IuEhVYR1a0j1nwTLE2cQ==
X-CSE-MsgGUID: 2LKyUt/eT1WEKx6neYY79w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="170766385"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="170766385"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 03324E6141
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B49B3D8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7449C1A0071;
	Tue,  4 Mar 2025 17:09:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/31] re2c: upgrade 4.0.2 -> 4.1
Date: Tue,  4 Mar 2025 17:09:11 +0800
Message-Id: <1741079356-13445-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212250

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/re2c/{re2c_4.0.2.bb => re2c_4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.0.2.bb => re2c_4.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.0.2.bb b/meta/recipes-support/re2c/re2c_4.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.0.2.bb
rename to meta/recipes-support/re2c/re2c_4.1.bb
index 2a0fb197ff..238f95f745 100644
--- a/meta/recipes-support/re2c/re2c_4.0.2.bb
+++ b/meta/recipes-support/re2c/re2c_4.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5e52ce0e26326115e41bc45d34dc2d5e10f2e44ed3a413fa2a826aa3500c8d56"
+SRC_URI[sha256sum] = "cd7d9bbadb3f04f20da25e20e155655de57beef48e0807266938069f0e322e8b"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


