Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AEEC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:36:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8874.1700037360467825711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="139717048"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="139717048"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:35:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 53BA0D7AD8
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:35:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 88C71D94A2
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:35:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B8D1670B02;
	Wed, 15 Nov 2023 17:35:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatch-vcs: upgrade 0.3.0 -> 0.4.0
Date: Wed, 15 Nov 2023 16:32:43 +0800
Message-Id: <1700037163-1518-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.006
X-TMASE-Result: 10-0.041200-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrJ4cwIYL6KueU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrSyiErhmmuHLrYUocp41Nran0ls09MRqUgljcgOIbUMNM8nDxNKw2A7n6D
	5is9Y+67lgAkY0gE5E17FzsChX8gvythFZcX8HFh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190570

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Drop support for Python 3.7
Officially support Python 3.12
Prevent UserWarning when a template is not defined explicitly

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hatch-vcs_0.3.0.bb => python3-hatch-vcs_0.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-vcs_0.3.0.bb => python3-hatch-vcs_0.4.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
rename to meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
index b4db10e767..2e49aba469 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_vcs"
 
-SRC_URI[sha256sum] = "cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14ad317bbee5a153fee"
+SRC_URI[sha256sum] = "093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


