Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF02C71140
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11726.1749026744437654212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fb0O6NNQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026745; x=1780562745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=onA+ay+pjyxJCf0s5FXQcUOoXgWqpQltkl+Xed8D8JE=;
  b=fb0O6NNQmv4f5fmA0pmYbTZECIZ+TmlS/sAGQ+0iIc/9sqyvy+kdvZFx
   DYEaq06jKPvVnur+2bzbsijX5R+G0+D/fRhLGW9NGwFLgpkBBRjE09g7v
   z7yw6NXamf4QiAnh5tinCAQnnrmoFYHbL9TwQ23U/+7lbvEURRUTHieeL
   iTdrctZD1RyiLuYHrpfvoc7Wh8r8l2cTF3fYTQ2uCyItdljRAv8ujpZ2b
   Db0aR6TKzcsSmcNfsPI+MyP9en8OVWZXWy3nGEVqeERHQ7rP6ALQ3zzvE
   438KBbI8pDcmW+D2oQNf6o0tjdRQaDNZ1AX8IQNbndSFja5wQ0jlBS47e
   A==;
X-CSE-ConnectionGUID: XA9pkZK5RqqPBb/7dWZAmw==
X-CSE-MsgGUID: TpzGSx5jTMWYR6O8O/ucOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="190102941"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="190102941"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:43 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BDD4D5051
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04CA9C8BF5
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:41 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7812D1A009A;
	Wed,  4 Jun 2025 16:45:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/45] python3-cython: upgrade 3.1.0 -> 3.1.1
Date: Wed,  4 Jun 2025 16:45:13 +0800
Message-ID: <20250604084524.864-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217882

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cython_3.1.0.bb => python3-cython_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.0.bb => python3-cython_3.1.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.1.0.bb b/meta/recipes-devtools/python/python3-cython_3.1.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.0.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.1.bb
index f93135b94b..1bc6eda4ac 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.1.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "1097dd60d43ad0fff614a57524bfd531b35c13a907d13bee2cc2ec152e6bf4a1"
+SRC_URI[sha256sum] = "505ccd413669d5132a53834d792c707974248088c4f60c497deb1b416e366397"
 
 inherit pypi setuptools3 cython
 
-- 
2.43.0


