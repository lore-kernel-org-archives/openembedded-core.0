Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149A0C54722
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.12715.1724136737091045194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H24aXCYN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136739; x=1755672739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dRslH1LvcCGpARj435jL6wtX1vga24+Xd9B3gQd/8MQ=;
  b=H24aXCYN+xFdkS7dqFrBpNMZhzgCAHcok66Cwr5v4PV/LKpFBO1DQC/O
   W8YkMZBlpAyKLALWl/RHtCajM7QZAAXiKcmgeB2rTWfL35Wi5bAQDAI5F
   u36b8KnJlxF9fdWUfWZ/ILWbdQk2nYXYei4TT5lx7gjEOOB5qNMgKWXw3
   WVPqeIzRfZv/Ur1J6hb/9fSnfLtrRyGjJoWFazRyvYvAqelwNBF87I9yF
   m9GRzdLQyLWCwU9gVEir8O0iwN8WPbAcWSdMNRUvw55GW4pkXIco2IrIq
   ceOBBe3N7MZDEU2Je5/+wKYzoY6wmR3KfaXKCjnYhpk9L86+iUKV2CfRc
   A==;
X-CSE-ConnectionGUID: +mb5ZNyGS/Ck4dFSkfo1xQ==
X-CSE-MsgGUID: r+Zv8EBqTq+JWmxTbUMPjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="159075234"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="159075234"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BC91E8521
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DE24D50B9
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F261520086134
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB0BD1A000D;
	Tue, 20 Aug 2024 14:52:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/24] python3-setuptools: upgrade 72.1.0 -> 72.2.0
Date: Tue, 20 Aug 2024 14:51:38 +0800
Message-Id: <1724136703-20023-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10-0.498400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrEITY2UGMiNxeGZa58oEXZP44
	pYPD16CL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2alOQjQcrzOlZx2
	5js+HUUPi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFIo+eVNBE/LvP35+rnZr5UPe8y
	lmpS8iobwgvxoZ+US47h/cfLk41vxrUEISVQMxOyx1dgHPoX5HV8nr8pHD87vx8bp25eYBSex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203537

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Support for Pathlike objects in data files and extensions
- native support for C++ compilers
- removed unused get_msvcr()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_72.1.0.bb => python3-setuptools_72.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb => python3-setuptools_72.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
index 945d443aff..63ea999960 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
+SRC_URI[sha256sum] = "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e4042c13d3bcef91ac2ef9"
 
 DEPENDS += "python3"
 
-- 
2.34.1


