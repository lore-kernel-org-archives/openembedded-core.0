Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF4CC8300C
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.26243.1685610239733103081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98556118"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98556118"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:04 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1E9BCA1E8
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:02 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0456DD88BE
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1335E88857;
	Thu,  1 Jun 2023 18:04:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] orc: upgrade 0.4.33 -> 0.4.34
Date: Thu,  1 Jun 2023 17:03:26 +0800
Message-Id: <1685610221-29015-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-0.959600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrsBSA1tuZVSbozDhGeQC9EiQG
	h5qJzqDb9GF0M6TbxPzI4S4ILRPF5mK95kYn0LfK/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW5/XjpbSJS7axK4lG1JTzijeBzEkCCpnRnvVbHa5Rs8t64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7BLPx9cDMrKbdB/CxWTRRu+rAZ8KTspSzXdGSHtyOy3xGX4A5f2lxoGUPI
	eXz0Vwheo6jaI5VgN2Zgl9PYHv4ia+Tqqa0di9Ev4fEsms0iwjeir73eYgC4+inplDfAJm8iB6m
	lDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182075

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Thread-safety improvements around orc codemem allocation/freeing
    Add orc_parse_code() with more detailed error reporting
    Implement Orc function lazy initialization correctly via atomic operations
    orc program parser fixes and improvements
    build fixes and compiler warning fixes
    coverity and clang scan-build static code analysis fixes
    meson: Do not always generate static library for test library
    ci improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/orc/{orc_0.4.33.bb => orc_0.4.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.33.bb => orc_0.4.34.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.33.bb b/meta/recipes-devtools/orc/orc_0.4.34.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.33.bb
rename to meta/recipes-devtools/orc/orc_0.4.34.bb
index 873fe3920b..801d604bdc 100644
--- a/meta/recipes-devtools/orc/orc_0.4.33.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.34.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "844e6d7db8086f793f57618d3d4b68d29d99b16034e71430df3c21cfd3c3542a"
+SRC_URI[sha256sum] = "8f47abb3f097171e44eb807adcdabd860fba2effd37d8d3c4fbd5f341cadd41f"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.34.1


