Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0BBE77199
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10577.1734945083843177392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UUA37KF8;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945084; x=1766481084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jk8QomWmpN18quhEco6/tOVAL7UFQbePz7dUKQ8RGCc=;
  b=UUA37KF8If6bWjsWp2nplOBK9NqlyEFJ8j6ftg63ivyZ7jbGLAi7kvUU
   /VFAEjOdKVu076R2eY6Gg4NpJaVvmdDpvn+cwZ/Z2E66KauFhmbJk5Qkn
   c0sLZZHR2iU2jO7+4FUY6pzg5ce2eS0/4PsjZ7kVvo18omluAF9J9c3X2
   AJ3TZQw180q3Xk4+XckAdo4fOiNQXWSOklR7VtmeFn07uBgNZFGwuaFKB
   Ke8puQRMcdlw9opCxXd3YBqy3dJpmQk0La5vC/PXa+UWXx/zzBaOl/WKw
   phLs3AaZjJQBH8OkmoAgFbhYj2UqhLrAd3CvoP+fZiSKLZydxtgqIhpuy
   g==;
X-CSE-ConnectionGUID: Zep5Bo7hToiR6V7dFclaEw==
X-CSE-MsgGUID: jbBltyCsTY24ZnUYZdsIIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="163591233"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="163591233"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FAC1E8520
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 15D5AD5086
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FC47200930C0
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 564CE1A0071;
	Mon, 23 Dec 2024 17:11:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/22] python3-mako: upgrade 1.3.6 -> 1.3.8
Date: Mon, 23 Dec 2024 17:10:54 +0800
Message-Id: <1734945065-4373-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--0.271800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysv82KK+I057hUl
	FfwzsqyWZ2koYqU3LA7ZvRLZPkAeRj+/PT1jKrOh6ws6Flw3FGLYUDvAr2Y/12U4oLUZhe8wvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgH0tCKdnhB589yM15V5aWpj6C0
	ePs7A07foJlcuVXWZJGaq7H8bCPV/Bn+zXzqGVbPKs4YztyKAzn4aX9A4hYi3DEWm+FtjGyGSmF
	LvDaJDt6zSL+2xz4NTzUs3I8FjxwZat6N4YvQ4P8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- [bug] [lexer] Reverted the fix for #140 released in Mako 1.3.7 as it produced
  regressions in existing user code.
- [bug] [codegen] [lexer] During the lexical analysis phase, add an additional prefix for undeclared
  identifiers that have the same name as built-in flags, and determine the
  final filter to be used during the code generation phase based on the
  context provided by the user.
- [bug] [lexer] Support the direct passing of dictionary literals when calling functions
  and fix the errors caused by nested braces. This revises the fix that was
  released in 1.3.4 and then reverted in 1.3.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.3.6.bb => python3-mako_1.3.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.6.bb => python3-mako_1.3.8.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.6.bb b/meta/recipes-devtools/python/python3-mako_1.3.8.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.8.bb
index c10cfa20c8..3cfe56e043 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.8.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 
 
-SRC_URI[sha256sum] = "9ec3a1583713479fae654f83ed9fa8c9a4c16b7bb0daba0e6bbebff50c0d983d"
+SRC_URI[sha256sum] = "577b97e414580d3e088d47c2dbbe9594aa7a5146ed2875d4dfa9075af2dd3cc8"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.43.0


