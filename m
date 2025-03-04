Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809E8C28B24
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.18199.1741079368646739157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O3t88qcF;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079371; x=1772615371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r8TLXEo30gw9A2WCK4M0ixfsKMxOrVgGEQ+m0EvGlDg=;
  b=O3t88qcF8viOrIh8xN3Ikg+thnrRvvYYe1fTvRUs1BG1V4Sx617QjvHP
   QCNw2SwIPH3u4LbbtjlDLjEthyzDOon3Ws5gra/uACZNMGV7swzYN2zM1
   Px43akCpzxxwSZgXoqPmlJ1T6loTmKvEpApCLayKwa1vBUvDOUt8bvhVI
   LiwigoqdHasvb6tY1HEbCLWxCNngW6ErtfjSbonnThHm1rbOnaKTeBZ7i
   P5nwDZDDEtmUSGEWSQz+6mAQpyq4xI/iQLmEm4WZPzn7wBgJdJBh+a/Qi
   ykp0OXrmvIKf5/gJ8jpaglWooxAlQuoR2rDnW+skqFzLZgTRFZIQfsUdx
   Q==;
X-CSE-ConnectionGUID: qVZUajAxQZCvCEs1Bs1UNw==
X-CSE-MsgGUID: GqDKsYZ2R4+VquA8awjfWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="180271628"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="180271628"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FA3AD480C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2284FD729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D63861A009A;
	Tue,  4 Mar 2025 17:09:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/31] python3-beartype: upgrade 0.19.0 -> 0.20.0
Date: Tue,  4 Mar 2025 17:09:04 +0800
Message-Id: <1741079356-13445-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212244

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-beartype_0.19.0.bb => python3-beartype_0.20.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.19.0.bb => python3-beartype_0.20.0.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.19.0.bb b/meta/recipes-devtools/python/python3-beartype_0.20.0.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-beartype_0.19.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.20.0.bb
index ee2c068e09..c047ed2026 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.20.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Unbearably fast runtime type checking in pure Python."
 HOMEPAGE = "https://beartype.readthedocs.io"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "de42dfc1ba5c3710fde6c3002e3bd2cad236ed4d2aabe876345ab0b4234a6573"
+SRC_URI[sha256sum] = "599ecc86b88549bcb6d1af626f44d85ffbb9151ace5d7f9f3b493dce2ffee529"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


