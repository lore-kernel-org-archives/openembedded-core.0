Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE4FC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:15:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.37050.1698995731909629029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126798505"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126798505"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:15:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 902ADE753D
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:15:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C6953D5D15
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:15:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1329200501A9;
	Fri,  3 Nov 2023 16:15:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libnsl2: upgrade 2.0.0 -> 2.0.1
Date: Fri,  3 Nov 2023 15:14:15 +0800
Message-Id: <1698995655-30322-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10-1.645700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrGEfoClqBl84kt9BigJAcVu79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoh2P280ZiGmRuce7gFxhKa3zndiJkHFMhEgxSQxzSLAbIY6
	e+Xi1ah/tAdDE/EtBJIAy6p60ZV62/VQH0DqlMoLdB/CxWTRRu+rAZ8KTspSzcK2pq+2p/4Lf4+
	2DFQUwAOMDuCLMQDuPmYLMyR1tTHLYGshKtsDDmeaF33s4weU+W6WFbLQGj4X7afab4lddimFRk
	AVdhJ1yiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190115

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Remove unused internal symbols from libnsl.map
* Remove NIS+ from documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 7919ef9b24..8cc1f7cec3 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
 
-PV = "2.0.0"
+PV = "2.0.1"
 
-SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
+SRCREV = "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
 
 SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
-- 
2.34.1


