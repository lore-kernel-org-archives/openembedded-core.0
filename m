Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E37BCF045E
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9172.1728452976338985791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pAn9HbD2;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452982; x=1759988982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HI2gMAZ1WvLpDKu3G67/CdY0CWiZKBy2baWPXk+1wYM=;
  b=pAn9HbD2gOCM0aQi4bn9EOw8U+ZrvOx9fExDFn1g1SYRzTa1jcC7yWl3
   TRvXP7BX16hA6ZMnf1MCK8gSpVaYzQ7lk1nL3W7U6ElKxs8JRKz7WJEnE
   bxoxSaJzslTTwZi0sL2kODRd/KSXr/znzH95YdhxZsOBYU8xdT6+QKUvZ
   aqVyuDU8GNNkHYI8kuM5OjNNiIxP3K1TWMfkiita94Lf6qN5CnGcXB2do
   Rf3XhpTWr/DJA0n1BsP2EyszFkpsQE5ABJGllfTn7wKl121ijX/wDTjLj
   XH51uzM+BQ1YMnkfCWM7XmGMON5XCRyZ6THlJNFPVdCVBqWNpjHfjEGY0
   g==;
X-CSE-ConnectionGUID: 6xCc5FNGT6u/CYuPR6MO/A==
X-CSE-MsgGUID: g4E5we8rT0qlhajrznPClQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="155225885"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="155225885"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A1F53C68E7
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E39B2D50E2
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F2B520081311
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F7541A000A;
	Wed,  9 Oct 2024 13:49:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/26] python3-spdx-tools: upgrade 0.8.2 -> 0.8.3
Date: Wed,  9 Oct 2024 13:49:08 +0800
Message-Id: <1728452955-25051-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-1.144200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNS78r7LsbgMIQjJ
	lierVE/n481Ltjc53yVDc4lSgrowpaqkg+o+yGWuuIDp7iOpqTNezmeoa8MJ8zMM67DQIVkSCKY
	y3pNJdaVE+Pe5CSdVUQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3tT1r
	rN8sUDVuyz2v/93Du3BhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07QdNP
	5JHgU8AxFNNmDq4zOv40eZ7F9cn7rdDTZNpyHA4zW8vO6M/L/9EJM6YuZ7vlJ+1uL9wRRBJahd5
	RysJYRbaO1Eaisb8NqxHcVzkX0gU8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205327

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- fix license expression error handling in tag-value parser
- spdx3: software_purpose: add REQUIREMENT type
- fix tag-value parser: parse Tool or Organization as annotator
- shorten output of FileNotFoundError when called via the CLI
- fix tag-value output when related_spdx_element_id is "NONE" or "NOASSERTION"
- catch decoding errors while parsing using the cli tool
- replace Licensing() with spdx_licensing
- spdx3: element_writer: switch from tab characters to two spaces
- fix tag-value parser to allow NONE and NOASSERTION for package source info as they are valid strings
- update changelog for 0.8.3 release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-spdx-tools_0.8.2.bb => python3-spdx-tools_0.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-spdx-tools_0.8.2.bb => python3-spdx-tools_0.8.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb b/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
rename to meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
index 6573ae9eee..0f05679322 100644
--- a/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
+++ b/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/spdx/tools-python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc7f21ccff0f672f2a7cd6f412ae627d"
 
-SRC_URI[sha256sum] = "aea4ac9c2c375e7f439b1cef5ff32ef34914c083de0f61e08ed67cd3d9deb2a9"
+SRC_URI[sha256sum] = "68b8f9ce2893b5216bd90b2e63f1c821c2884e4ebc4fd295ebbf1fa8b8a94b93"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


