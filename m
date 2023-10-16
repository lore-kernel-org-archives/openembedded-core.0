Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20952CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:49:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.113191.1697446178440865893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="136279118"
X-IronPort-AV: E=Sophos;i="6.03,229,1694703600"; 
   d="scan'208";a="136279118"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:49:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E4FE5D618B
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:49:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 39730D5E98
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74B406BC51;
	Mon, 16 Oct 2023 17:49:32 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.16.05 -> 0.17.00
Date: Mon, 16 Oct 2023 16:49:24 +0800
Message-Id: <1697446164-29993-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27938.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27938.006
X-TMASE-Result: 10--0.453800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+OGDxcvp6O0AC6
	qXrz88+QCqIlUwwPgewKpopNs3Wwt8a3bF0uxjdkA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRloMLOoNHsM9q4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcrbi39L5ZyNp0wQG1XD4HzNBVL6y4O44M7m2Y
	yL/1mmddWhpzhQKlojHAwXVyekVUw1CiZckEiFP+LZyEnt/kbjnG6ZlfjAAs/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189279

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
remove redundant assignment to variable handler_set
remove some empty lines
move child stressor invoking code into stress_run_child
use stressor array size as limit for stressor loops

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.16.05.bb => stress-ng_0.17.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.16.05.bb => stress-ng_0.17.00.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.16.05.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.00.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.16.05.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.00.bb
index 1a1e9e4057..4dc9c1713b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.16.05.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.00.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "aea6f3306f4676a7f7e8d8c507f811ef3d0244c5"
+SRCREV = "b5f33cfd1d9d5fccf6b34a9082d07e86c909b05e"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


