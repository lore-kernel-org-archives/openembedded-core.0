Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F62C3ABDA
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.45981.1747040646361447708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cmvFimpS;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040646; x=1778576646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zWAUeiCb/wPRKATFC18N/7fPiKVGy3qIDw0ifaNg+tM=;
  b=cmvFimpSUKL3bJN5XQVIdN6MmKraqnI+F4vtWSVARdD9mnAMU1oifMdf
   XBdjW3dv8AboRiW5JTTWeKqPl2fERROtHWGFngD9vVxjAJUs5Pq5sB4R1
   EcJb2UYsG7o8PZlj2jppgxbB4IEePCXU5FueYOKaKuzU3G+PQZX5BW/uf
   HMLKj7nXVXDgbrBqrAz/DyhhgtpVnK6a+IjdXLWWXBhMHKFY6I4KADxvn
   Zo/HHcAe6ouhi+obt2wrGgz9GF59K6x76J31MKzgoEzCVbAvkB0AFHDDw
   ppyfhrUxRvqgY1boA4n9tC/UAiOOJP9yC9vhy9nZU52Wicx/8AylhJu+f
   Q==;
X-CSE-ConnectionGUID: HhiofIG6TFWQ9LnIFzy3zA==
X-CSE-MsgGUID: 85IT97z3Soa+lP8OE2GCrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="186489685"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="186489685"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 23B05D505D
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D8DD4CFBA4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 981EF1A009A;
	Mon, 12 May 2025 17:04:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 41/56] python3-mako: upgrade 1.3.9 -> 1.3.10
Date: Mon, 12 May 2025 17:03:24 +0800
Message-Id: <1747040619-7566-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216340

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix undefined variable errors when strict_undefined=True when using a
nested list comprehension. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.3.9.bb => python3-mako_1.3.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.9.bb => python3-mako_1.3.10.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.9.bb b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.9.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.10.bb
index 83b6149337..4facce9233 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.9.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 
 
-SRC_URI[sha256sum] = "b5d65ff3462870feec922dbccf38f6efb44e5714d7b593a656be86663d8600ac"
+SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.43.0


