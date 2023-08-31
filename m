Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172C8C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:28:13 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8329.1693448891993302813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109447539"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109447539"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:28:10 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70C5DE8520
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:28:07 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5A7DCF7C7
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:28:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB6B22FC2743;
	Thu, 31 Aug 2023 11:28:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.17 -> 9.18.18
Date: Thu, 31 Aug 2023 10:28:00 +0800
Message-Id: <1693448880-27327-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-0.199700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mroZoUnnV928K+U1asDs8Y/IQd
	txqr6T5RaUuJ07rkUQy2jUHdNoHMz9YJDnt2UbVlA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYnH1+lINchTA6N/cDgNNi4QRryDXHx6oXlJBOf2Mfu5r+me
	xJA1eNdLF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLO0uoDyM6CwXMJMj
	bIwlvPTKJj+d01q9AAxgOj155Q4y7n5qfgKjx38t1/EvYOKDcIuhgaN+8TYvQ7JlphSmVlocR90
	rgx49h+IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186927

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Deprecate the 'dialup' and 'heartbeat-interval' options.
 Ignore 'max-zone-ttl' on 'dnssec-policy insecure'.
 Return REFUSED to GSS-API TKEY requests if GSS-API support is not configured.
 Mark a primary server as temporarily unreachable if the TCP connection attempt times out.
 Don't process detach and close netmgr events when the netmgr has been paused.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.18.17.bb => bind_9.18.18.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.17.bb => bind_9.18.18.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.17.bb b/meta/recipes-connectivity/bind/bind_9.18.18.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.17.bb
rename to meta/recipes-connectivity/bind/bind_9.18.18.bb
index 9e7973ecbf..e74e685fe8 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.17.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.18.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
+SRC_URI[sha256sum] = "d735cdc127a6c5709bde475b5bf16fa2133f36fdba202f7c3c37d134e5192160"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


