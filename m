Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEE9E7719A
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10575.1734945082569905880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nwba/lMX;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945083; x=1766481083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E73SznPuAQdlw626n21cWjwNzpQeRoQGN5j1oCscjv8=;
  b=nwba/lMXYC0OJzycEENU2M4SvqSnSFTE2hsuIIYGsU3kQ88W/NgYpx4f
   jUbeLo6lxEYcxQWeUykZW3+Cjnw4800MsRSb9bHLaxQrvhjrgznk5nUMD
   BCwqoszCeZXg7x+R9j9UeMFK5UvFf3gP+nAl/THq7mCNvUhsTe1Oa5yUl
   RRSpilZQijZYit981lWlV+exI62Jy0Tv61MOFqAV429c8IGMtauDb6ydP
   uuNyzzCVcV7aIsT7z0j+rEXz0DaYNZH1YLdUMbxbaLBvoRjm8su836NnH
   ervd7S5i3x0K2VD4eBm5HRixryosrCGJZPDp9+nVqbQStf4/agC5R6zJw
   Q==;
X-CSE-ConnectionGUID: 3VYQ5sHeR3iOvo6+L05KAw==
X-CSE-MsgGUID: 7xYaVau/RL2NDlOPrgcAew==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="163591231"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="163591231"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 679B7E8525
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3782FCF7C4
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99F2620076D2C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42C661A0071;
	Mon, 23 Dec 2024 17:11:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/22] python3-dbusmock: upgrade 0.32.2 -> 0.33.0
Date: Mon, 23 Dec 2024 17:10:50 +0800
Message-Id: <1734945065-4373-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-3.205200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mregIHHX2L4YwsAkOSASMZR76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIB5DOMAR5/aPeVs
	0skyEaS2BkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4gKW
	lpFzAgKsbPoIsHWsfybO4wDYElS4CenQeiniehd73S+tdV27rpgDKo9YbaY8X7qWsaupMr/iUbr
	q0IvttXV/Y4YTjZ90mCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- templates: Add gsd-rfkill
- Allow adding objects derived from DBusMockObject
- Drop Python <= 3.7 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.32.2.bb => python3-dbusmock_0.33.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.32.2.bb => python3-dbusmock_0.33.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb b/meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb
index 436b82d1a0..c0ea64b6b8 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "357c269d53a5bb3f87983bec7ff700a0c4d071481f7cf7221ec8376224fc4316"
+SRC_URI[sha256sum] = "04efd311dd1063ac2b8f7baa79a026b5c0aa3ed4ef18cd9226f52a273fa6193a"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.43.0


