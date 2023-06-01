Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10A8C7EE33
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.26619.1685610256333135883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="118987849"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="118987849"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:14 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 547C3C68E4
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:11 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93BB7D3F3B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id CAF7B88864;
	Thu,  1 Jun 2023 18:04:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xdpyinfo: upgrade 1.3.3 -> 1.3.4
Date: Thu,  1 Jun 2023 17:03:41 +0800
Message-Id: <1685610221-29015-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-5.279900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr9fvWztwgm5O8B7vl7G5M0XbQ
	PUnkRPhfK6Y65q1qYVyv/4dBJ2SwTsWRCkcsKTihA9lly13c/gGdv37IsEhFdwfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiazqRtKfoOX46N/cDgNNi4f6cXHvw4lNqgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0SyO81X3yak82kTU8fA1ic07QzhdgOXu3yeJNxl7WlwCNIG8
	jGDLj1aRMtIUQvkpBIsAvPfqw73ngrKznUyY87t1FxQKLTiHvCK73c4FvTITg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182087

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
configure: Make xf86misc support disabled by default
Variable scope reduction
Remove unnecessary downcast of double to float
Call memset() instead of hand-coding our own equivalent

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
index e75a840b7d..aaa8aa8903 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
@@ -15,6 +15,6 @@ PE = "1"
 SRC_URI += "file://disable-xkb.patch"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206"
+SRC_URI[sha256sum] = "a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
2.34.1


