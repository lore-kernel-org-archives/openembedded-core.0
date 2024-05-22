Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFEFC27C44
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.5679.1716369348457261283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HcBhyiFu;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369348; x=1747905348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AGChf/+dF6+EtVo9xF73YSf5m8GWRvdqBls2ibrSmLo=;
  b=HcBhyiFulA/v0CL5cunDc2gXt2w4hEfKirBSDhXyzZ/yDTJU8tr3LRpr
   /pq0zQf5/F5TzeFhpkLODEnL2sGI76/EVqrhn62pVc3ue93kT3W7wPobB
   VKURBU+B+Omeeg6KuPtwddk+nYKJng9pNnSwi5x+amcjY1lUCS9N389KV
   x5J8HzbXj5kXt+1gkIsdenHtst+Gm69MVI/ErGfhQdwdbKDBQHZCdwsuy
   mfdJAWShD1VCPU3PTUYDkqTdIFw9SQyljWawgfIQ7CtW1iwEzG4VAI7P/
   Nllw4PjVG3IrpaQ/rMxXLCxcFy29EHmOsI92cMixqcK7eQqW9v35jA9tH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147064718"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147064718"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E8825DBDA4
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 34CE33CD90
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AEF8021CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 596281A000B;
	Wed, 22 May 2024 17:15:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/42] python3-referencing: upgrade 0.34.0 -> 0.35.1
Date: Wed, 22 May 2024 17:14:44 +0800
Message-Id: <1716369289-22526-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-1.037700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvT+1Zj+w66+uRi
	u1LMjht74CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLNLqc
	VrWVxuGCpBVHBEkpl0LiE965T9BuL7/vSE48Yd2lHvMTi77qM8xjcj9/mRP3aEHlzjfmqBLLWcg
	4Nhw6REfqEIbWMYfWGIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199733

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make Resource.pointer also properly handle empty pointers (which refer to the
  root document). This fix likely only affects you if you were using that
  function directly, as Resource.lookup already handles empty fragments.
- Ensure that Registry.contents() also raises NoSuchResource exceptions for
  nonexistent resources, not KeyError (which is an implementation detail).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-referencing_0.34.0.bb => python3-referencing_0.35.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.34.0.bb => python3-referencing_0.35.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.34.0.bb b/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.34.0.bb
rename to meta/recipes-devtools/python/python3-referencing_0.35.1.bb
index 6fbd10d9cf..3e2a380607 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "5773bd84ef41799a5a8ca72dc34590c041eb01bf9aa02632b4a973fb0181a844"
+SRC_URI[sha256sum] = "25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


