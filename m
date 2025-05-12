Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61F7C54ECC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.45915.1747040638714823342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hyidw/IR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040645; x=1778576645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r6tevCf7ZUmm7e8zBwwxGLslJgq2fa8pxP5mkj4ns2I=;
  b=Hyidw/IREZG1lzjdbptvqBC/qUggoDMeomSO2ynzBRxTeaLyTyP742Bs
   6qebTl5E0KUUEWmeaRZh/NYk+fw6PvTFkDdwtRIwbo5eNY0OL1tJXkChe
   g9Qk3foIUtL4kHHnQ4UWGOCLE8IktspBupCQauKfIBcWMlSSOQXoJjBkK
   JodWNFyQukf/Y+eazN5a5E8TngO0udWGwH/aVcFvbnzpzMkuY0wTkJyCF
   hMV1VcyByR7qNJ6EBEDGMe2TA5A6x43jVgPdOtxRyARK7xqnC2LSBqNHX
   Z7+LwwqRypTeb1sDIqJGIB3WQPt9JNiHKK7+6DMS84ZB9tbHwYuCde42s
   g==;
X-CSE-ConnectionGUID: 6Mh/Bef0QDOSRNqNcGlzsQ==
X-CSE-MsgGUID: MDj1LiSJR/aRzZaY6X3Xiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187549319"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187549319"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F1F3D505A
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED885CFBA4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE1EE1A009A;
	Mon, 12 May 2025 17:04:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/56] python3-hatch-fancy-pypi-readme: upgrade 24.1.0 -> 25.1.0
Date: Mon, 12 May 2025 17:03:20 +0800
Message-Id: <1747040619-7566-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216335

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- $HFPR_PACKAGE_NAME is now replaced by the package name in the PyPI readme. 
- Support for Python 3.7.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...adme_24.1.0.bb => python3-hatch-fancy-pypi-readme_25.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-fancy-pypi-readme_24.1.0.bb => python3-hatch-fancy-pypi-readme_25.1.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
rename to meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb
index b32527f949..5d8d82edd8 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0.bb
@@ -8,6 +8,6 @@ inherit pypi python_hatchling
 PYPI_PACKAGE = "hatch_fancy_pypi_readme"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8"
+SRC_URI[sha256sum] = "9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc216998a06380f01c0045"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


