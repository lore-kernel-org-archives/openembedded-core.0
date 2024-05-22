Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7104CC27C55
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.5646.1716369339336930463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RKgVUCXr;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369343; x=1747905343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0A0lcEgM6GJiJaJrJpoYAUSLVwsOWqUhxloK+28QPOE=;
  b=RKgVUCXryGnNhNiKc71QeltMJ0MZZfT0jRdHPMykzfs74rgpXUxhC/9D
   qxkB/PfmbCEMl8HYnEDxt4A4OdvpW67k21AXh0p7PLu/5/VTN3uJE5+vq
   RaB+/ZIJjrqxhpJ2B11Vhs6QYEzUWUfA9dqi2U8mMN/VelJktWV+0zp0y
   HzedCGd+2LUVy8Y5XtkPPlFNsIX1H/a0zfApl1+zBR3R7ctcT6mSlG6zx
   OEmh/s/QQhJF1eAL8HPhIoZWuWfEFQnNeg1HW/DLDZPsV+myGq2XMr7wp
   XuEenW4fdU1TgkZrietgAtJ5SskUaiDNaD0DryRP4fwrxHAvfSryl0UQg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="138358195"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="138358195"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:42 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BA4CFDBD9F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E5FBD5075
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 938D921D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 407EA1A000B;
	Wed, 22 May 2024 17:15:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/42] python3-jsonschema: upgrade 4.21.1 -> 4.22.0
Date: Wed, 22 May 2024 17:14:40 +0800
Message-Id: <1716369289-22526-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.234600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrT5ysQDj6eFl0xHN1v1faZCxX
	wd9S2XGh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6Hmc
	XS742qD0VNqJMA3XJPKRzEZMVrGmOw7LLN2sAGHQvnCYGqoo+5Tgx20JoSqmDvBSHa97bwNoR/G
	HSblZ2znuDPLSa7EKiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199727

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Improve best_match (and thereby error messages from jsonschema.validate) in
  cases where there are multiple sibling errors from applying anyOf / allOf
- (Micro-)optimize equality checks when comparing for JSON Schema equality by
  first checking for object identity, as == would.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-jsonschema_4.21.1.bb => python3-jsonschema_4.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.21.1.bb => python3-jsonschema_4.22.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
index 381148f4bb..c3184396d2 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "85727c00279f5fa6bedbe6238d2aa6403bedd8b4864ab11207d07df3cc1b2ee5"
+SRC_URI[sha256sum] = "5b22d434a45935119af990552c862e5d6d564e8f6601206b305a61fdf661a2b7"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


