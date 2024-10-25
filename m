Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6073D11702
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.5577.1729834800084248981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SJY8rC+B;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834801; x=1761370801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=03qNi4PvOB445fpViADrJ2zUCiwjWe/mtrbeYlhchj8=;
  b=SJY8rC+B9d7utvAxnsBotuP9NufEQdhoXvQpcrjODus19+gDZ4rFlsmI
   ASUXfXDiniAGTuH61sui2ppoqbmbTw0Y4qQqujnf++GouMF+zMN3TUMN+
   TIB4ik7gPJfJBdDOSJGH7qupXl5/Giu0EYfrPtWw+beev6Ii64ek59G4j
   8J802db3WnVxdpr3OQLTi0Vyh6uNoIKLyDilvot5pSMJncJ06Ya+QxoL7
   WSobl/3zSlFBgM8DPsPp40Kb75o96j+UfBldtP8Xt4tA7O5WLAQQFn+77
   4ueHnBtBv2Go6K9xQowbJXd07SWc8QoEy+ZeKWDOSCXC9wYrV9pcaWZor
   A==;
X-CSE-ConnectionGUID: wZzowmIcQqazhr+8mwK5CQ==
X-CSE-MsgGUID: knv4jPi6T7ajxzjctPNN/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="177944734"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="177944734"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AA93D4F54
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3987DD3F1C
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF8DF20071A1D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 965261A01EC;
	Fri, 25 Oct 2024 13:39:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/22] python3-poetry-core: upgrade 1.9.0 -> 1.9.1
Date: Fri, 25 Oct 2024 13:39:23 +0800
Message-Id: <1729834769-4717-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-1.175200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mregIHHX2L4YxGMe+tDjQ3FmeI
	Nzdk9e3Ek9A2liiwusAKjAdWf7T1SW0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIIBdglOtTT6kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5Im2
	AREHHsbBCgPHOYiem4gyJq4XFBAlBo6rmNCfldKUYccH7ld/ErcpyRw+7wAw76TqrLxyc8xSKcS
	cBOFclxCALH9hxty/+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206327

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Add 3.13 to the list of available Python versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
index a073f8b069..173c3bdb68 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2"
+SRC_URI[sha256sum] = "7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b67217f61b8"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


