Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D64EC54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7883.1711413461296775247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KbVYSu5g;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413462; x=1742949462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NpYVzLMqm42sTBWX0RIKuGVp9TOXiMtVvgdO77D/EMw=;
  b=KbVYSu5g+hXbo8crGmP0wW/PtxcC9mFGM7jX8CB9BigSjSh+7c3iZtl7
   lmzDrZCfg+0yp6AfwJ5lP/gzUpuuI201X9VgMyb/Bk8R8assslHI0G95t
   ErttzGCihyv8qJjFw4EkDGbz/Bz1rwX3+RtYmgMCq/3T2bh4sQVSZ8E4k
   MRz72c++Y0zZhmOqMVO2zr1/dvUNEJLJsW3BqGREEnwq1Q66Z6J4iDY6g
   YUFe726cBb8ASSHte/5sL2fYgaq7qg1JAzp0sLme74N/FFI0uYb7wTPhr
   KSOgjP3Q6xRrQxU+AQiXfSfLasLf7/c4g61q6dYL3zafl6xlrRw8adDfW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153313962"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153313962"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 27E1AD5A51
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 60F2956F7C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E86576B4C5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9301C1A006A;
	Tue, 26 Mar 2024 08:37:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 25/34] python3-referencing: upgrade 0.33.0 -> 0.34.0
Date: Tue, 26 Mar 2024 08:34:43 +0800
Message-Id: <1711413292-3025-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-3.973700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr70ZRT9HiWdoTKdPcZlIOb4pb
	wG9fIuITCC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz2XiPTNsBpms1rT
	Lexh+5acRszq1MNBqU9QIy6xiiCHmYJ8pDHfhxt7ieRbllZZOIBifaWReLvgwZMU/xnWc0IeXOM
	KuRw09biB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197514

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-Also look inside definitions keywords even on newer dialects. The specification
 recommends doing so regardless of the rename to $defs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-referencing_0.33.0.bb => python3-referencing_0.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.33.0.bb => python3-referencing_0.34.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb b/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.33.0.bb
rename to meta/recipes-devtools/python/python3-referencing_0.34.0.bb
index 5b50932264..9388fca376 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "c775fedf74bc0f9189c2a3be1c12fd03e8c23f4d371dce795df44e06c5b412f7"
+SRC_URI[sha256sum] = "5773bd84ef41799a5a8ca72dc34590c041eb01bf9aa02632b4a973fb0181a844"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


