Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA3DCD342C
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.18518.1725352404463433938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FqAaE3fD;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352405; x=1756888405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4vI+ZWFSd4dePhUe0e02aIPOhkyh5DmkPYH5zJOHg1c=;
  b=FqAaE3fDKSdoCbmZSpjX1g5wjfUIW+8UOF0ro2VRiRzEK9+Frov435MJ
   wqZaPt8M/xH+OSYg034TFqQI+bhyj+TxtVeDfe0emR3LRAjSbVEAWRiHg
   uMzkbjeMtRm57qH9uj4GW0sPN/U5YAPUa86ouQhtXOLWh81hD5UOSb4Pk
   0ypHj8TDJtqAz42w/jU5sIzfBq2DNPAbscp7OM2SFceFxI1mLJJMHswfR
   LxO4Nd8PlOIvYb3tF3EJJnuvEF3QJ0zuYPTw7q8rHpQWCRDQUHB3MogCh
   E0Zzxq7hWbNc0F+J8dpsNijp3snmGwluc2k8wAUpBM7Uw0wrtLuUzjWAm
   Q==;
X-CSE-ConnectionGUID: MAiadQMQTESAoyvF+zeUDQ==
X-CSE-MsgGUID: 2XGYqDdgSZSqYtO9dKmPJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="159919377"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="159919377"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88C03D8008
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF8CCD73A8
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DCB020076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 130CC1A000C;
	Tue,  3 Sep 2024 16:33:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/22] wayland: upgrade 1.23.0 -> 1.23.1
Date: Tue,  3 Sep 2024 16:32:59 +0800
Message-Id: <1725352379-20334-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--5.360200-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu/UKSk38cGDCQG
	h5qJzqDbdNTZT4zOq3nZe+wUej5wh9FMBnmJRh/Jqoeab9Xgz8/jFqeCRpiwKJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/yBfZe3im9iRtDgmvV2H8Pm8Ii
	xcEOKIU6TEm5WTmjEytz9kIuTkBq6vvxILmKK/HBRFJJyf5BJep8rFvqI5S/cXvQkGi3tjz46HM
	5rqDwqtSGn40r/zut4h2sfNbe8Ouzfv9bbmfZwgmeRjmIAe0O1cVOTC8H+5cw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204148

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- meson: Fix use of install_data() without specifying install_dir
- Put WL_DEPRECATED in front of the function declarations
- client: Handle proxies with no queue
- tests: add enum bitfield test
- scanner: fix validator for bitfields
- scanner: extract validator function emission to helper function

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{wayland_1.23.0.bb => wayland_1.23.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland_1.23.0.bb => wayland_1.23.1.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.23.0.bb b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/wayland_1.23.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.23.1.bb
index 8ff47ac171..3a5d91be04 100644
--- a/meta/recipes-graphics/wayland/wayland_1.23.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downl
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2"
+SRC_URI[sha256sum] = "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


