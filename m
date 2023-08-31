Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED289C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:33:52 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8470.1693449228728285275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="108883994"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="108883994"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:33:45 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B3AADB4D1
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:33:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD74BD3F2C
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:33:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 03EA22FC2743;
	Thu, 31 Aug 2023 11:33:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libgit2: upgrade 1.7.0 -> 1.7.1
Date: Thu, 31 Aug 2023 10:33:18 +0800
Message-Id: <1693449198-27802-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--2.283600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOKlGc9JzXmoiia
	SqRpkfBtbFOJewIprzWcF5slMYPmktFMBnmJRh/JpzmJJw2f0KFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBGyiGq5aHxjtqoHmOTZNdeMUjL8
	WDWZGeou0B0MT8S0EkgDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLMUNRb0k8qvvJR0i
	VchZ7vbPxZYA9Yo5/bmwTkFdQ7nf/hSR8qfornZzw77J0VYtoHNj6mDQeSpsQXJegUiAXAi1Td0
	E+SpQ1eIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186938

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Bug fixes
-----------
    proxy: Return an error for invalid proxy URLs instead of crashing.
    ssh: fix known_hosts leak in _git_ssh_setup_conn
    repository: make cleanup safe for re-use with grafts
    fix: Add missing include for oidarray.
    Revert "CMake: Search for ssh2 instead of libssh2."

Compatibility improvements
--------------------------
    stransport: macOS: replace errSSLNetworkTimeout, with hard-coded value

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgit2/{libgit2_1.7.0.bb => libgit2_1.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.7.0.bb => libgit2_1.7.1.bb} (92%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.7.0.bb b/meta/recipes-support/libgit2/libgit2_1.7.1.bb
similarity index 92%
rename from meta/recipes-support/libgit2/libgit2_1.7.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.7.1.bb
index 15a91cfb27..92af0b8454 100644
--- a/meta/recipes-support/libgit2/libgit2_1.7.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.7;protocol=https"
-SRCREV = "3e2baa6d0bfb42f9016e24cba1733a6ae26a8ae6"
+SRCREV = "a2bde63741977ca0f4ef7db2f609df320be67a08"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


