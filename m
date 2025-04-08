Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B59C369A9
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.64296.1744073524785885673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CEA/0IYz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073527; x=1775609527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aWvYGhCDgamG3+c/epGE/wBN524DEkLsQ1U9UYvEzZI=;
  b=CEA/0IYzS+DFl27QBRCX0QpF++/4hZDKVrqJqobVUMNq6u23AnrXiUaA
   panM1gBcLifG0aiVkEKGwIDmEqblRn3A7qmo2hfoL6FQI4LeZyIhSPyO2
   Kvp2exHA8W+O5ZsMoVLYKOC7UXcFVgdjrDmhw8O9k/Es/hjJYBxnaFSmj
   MdOcQkk/CRVsgLfQ0JdxnBuyHtdBkme+zxYAal1i3fcGEknp/1LybdHtR
   Re88qdtX85ECHEYCNyOMWKOi6fRwb7rO7eOEL6CwTyNB9kW0J+BTJ6MXY
   vq+ioAFXDJfBU+MeF3QvRn+C52SBSIaGhyE7qOLiLaFExAKWkUHEC/9gM
   w==;
X-CSE-ConnectionGUID: pQLQagRnRWqHjSoFZjU6gQ==
X-CSE-MsgGUID: oQBnV+fuTDuzdUVEyfdM8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="195727217"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="195727217"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8E04D4F41
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB763CF7C9
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 320E11A009B;
	Tue,  8 Apr 2025 08:51:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/15] python3-typing-extensions: upgrade 4.13.0 -> 4.13.1
Date: Tue,  8 Apr 2025 08:51:40 +0800
Message-Id: <1744073502-27695-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214486

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix regression in 4.13.0 on Python 3.10.2 causing a TypeError when using Concatenate.
- Fix TypeError when using evaluate_forward_ref on Python 3.10.1-2 and 3.9.8-10.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...extensions_4.13.0.bb => python3-typing-extensions_4.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.13.0.bb => python3-typing-extensions_4.13.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.13.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.13.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb
index ea946849a7..c3d3dbc275 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.13.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 PYPI_PACKAGE = "typing_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "0a4ac55a5820789d87e297727d229866c9650f6521b64206413c4fbada24d95b"
+SRC_URI[sha256sum] = "98795af00fb9640edec5b8e31fc647597b4691f099ad75f469a2616be1a76dff"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


