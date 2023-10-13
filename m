Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB95BCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:06:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.34407.1697187973220698586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="135846174"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="135846174"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:06:09 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BBDBCA1F8
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:06:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55D7FD9A84
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:06:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D4FE6BA77;
	Fri, 13 Oct 2023 18:06:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.86.2 -> 6.87.4
Date: Fri, 13 Oct 2023 17:05:34 +0800
Message-Id: <1697187934-4606-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--1.726400-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9eMltxkB8Rw0yqY
	vVxU5zXAP+qexs79Up8vvJ5VGvZfAF5Saok1/fZCuce7gFxhKa3KrKWVfpQkixzlIYo2TUIbINg
	IpAA8LuPNEUXV/7/1zyrUXPf8SBGJNZWpacylMQ08o3fwIs8rQUEe5VjFzwNb/OSxh+l4teS+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+Awh6Xgdknbb6BbptjxI6rdaPFj
	JEFr+olSXhbxZVQ5H+OhzOa6g8KraF4IPqqTcRZvSAiBihWsg5WeB6zJhTDmng5gv9UvPfc+Lnw
	6DdEYhRS9vldVdqRlYWrVZrU3sgQby3uHlk5mbq4OLRcQhKOB/VBJVeUjAgqy7demFrcc3hfTaW
	W3XR7+94hkGFD2Znuzudb6tcYU7I=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189049

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-When randoms() was called with use_true_randoms=False, calling sample on it
 with an empty sequence and 0 elements would result in an error, when it
 should have returned an empty sequence to agree with the normal behaviour of
 random.Random. This fixes that discrepancy.
-This patch ensures that the hypothesis codemod CLI will print a warning
 instead of stopping with an internal error if one of your files contains
 invalid syntax (issue #3759).
-This patch makes some small changes to our NumPy integration to ensure forward
 compatibility. Thanks to Mateusz Sokół for pull request #3761.
-Fixes issue #3755, where an internal condition turns out to be reachable after
 all.
-This release deprecates use of assume() and reject() outside of property-based
 tests, because these functions work by raising a special exceptioni.
 It also fixes some type annotations (issue #3753).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.86.2.bb => python3-hypothesis_6.87.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.86.2.bb => python3-hypothesis_6.87.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
index 6ec1457e46..4f41e2ab1a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "e5d75d70f5a4fc372cddf03ec6141237a0a270ed106aeb2156a4984f06d37b0f"
+SRC_URI[sha256sum] = "c508779be66e266c45dbf9c1b2713e560dfd89abb044d92eafe91e8b2728af01"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


