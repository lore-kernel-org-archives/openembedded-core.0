Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23EECF3968
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.9257.1727246992957617180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DM+ddvZ+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246993; x=1758782993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8S+3WiZbJUdClhybxFBpaFbEs8Rx7EjgmAYR6EoCE2k=;
  b=DM+ddvZ+rpLCyoLiEqSSiNZVkSzUGYm/k21f8BL3UQ/lzyQg1hseJHGr
   3kZLsGcwULUIvP1onloy+qU3675E31eGIZ07HXzcmoYT5LM/Ksq9kXTLK
   KN1eD+O/UcIlfjXdsO1nqVr6t9Gvrv29mPQDJmO9IpzWO+gZiQZw4XE9+
   /F3GOekOaA9HDPNWC7xboSlr3Uh49bvLR1rNKz0MvMToU2QHqM2SDrjYT
   moQifnDclZyRF9d6mLo3dI4Uw8chPjWqcb9Xm3cFAemiqfB3Sr/ZTCY4A
   veYK1cI7XxLX9qkso/hjMbvnD1d7hlj6irCHROMy31EdlP3QYh4aq36g2
   g==;
X-CSE-ConnectionGUID: spz5l2+AQg2WB5OkRs5zNA==
X-CSE-MsgGUID: gFYOOSZtQzmVAhD+MOnrfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="153620562"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="153620562"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:50 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A430C53D4
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CF4CD7465
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DA8820086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D145F1A000A;
	Wed, 25 Sep 2024 14:49:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/47] python3-zipp: upgrade 3.20.1 -> 3.20.2
Date: Wed, 25 Sep 2024 14:49:11 +0800
Message-Id: <1727246960-20665-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-5.373400-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrxVGe6vB6kBQ8cwBuO6HB3wuk
	FAxO1OlUZRUjkVFROF6hH3kE6Tg1fALVKd9+Sfpruy1sIsdu6VL2/fdRbxY1gH+JnVo2xgbuupC
	V1Tw0TOkPV8KMPNefu3QBgpbZ0EFeDnM1XTjDLu/F30Jee57vxkb8muwj9sqIGHkYiVcqaknXDo
	AODoFAb0phUiKZVN+1LUq/c/BBmyuqrWA3Rf6GPTyjd/AizytBVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRt9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO3UxgjQabZ2Lka260kufiDzV0alrVk/+AGqhJas2xahbBZWOynplwxyvHpH+/v1caY9jBd
	+tGSzxofjySfBVOsjPUEmpXigQQqwx1vlo1t1nQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204933

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make no assertions about the number. It could be negative.
- Make zipp.compat.overlay.zipfile hashable.
- Merge https://github.com/jaraco/skeleton
- Add Python 3.13 and 3.14 into the matrix. (jaraco/skeleton#146)
- Fix an incompatibility (and source of merge conflicts) with projects using Ruff/isort.
- Merge pull request #125 from saschanaz/patch-1
- Suppress F821
- Allow the workflow to be triggered manually.
- Remove workaround for sphinx-contrib/sphinx-lint#83
- Include the trailing slash in disable_error_code(overload-overlap), also required for clean diffs.
- Add support for linking usernames.
- Add a degenerate nitpick_ignore for downstream consumers. Add a 'local' comment to delineate where the skeleton ends and the downstream begins.
- Expand docs and tests for overlay.
- Remove unexpected character \ufeff

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.20.1.bb => python3-zipp_3.20.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.20.1.bb => python3-zipp_3.20.2.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.20.1.bb b/meta/recipes-devtools/python/python3-zipp_3.20.2.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-zipp_3.20.1.bb
rename to meta/recipes-devtools/python/python3-zipp_3.20.2.bb
index 960a0d69f4..4ab3464471 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.20.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.20.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "c22b14cc4763c5a5b04134207736c107db42e9d3ef2d9779d465f5f1bcba572b"
+SRC_URI[sha256sum] = "bc9eb26f4506fda01b81bcde0ca78103b6e62f991b381fec825435c836edbc29"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


