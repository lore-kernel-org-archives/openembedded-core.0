Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC08C04A6A
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7541.1687850378362138888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122378700"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122378700"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:37 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7FA1DAE0B
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AAC1CFBB1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E8616C833;
	Tue, 27 Jun 2023 16:19:32 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-iso8601: upgrade 1.1.0 -> 2.0.0
Date: Tue, 27 Jun 2023 15:17:20 +0800
Message-Id: <1687850250-20040-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10-0.197400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yaoXHZz/dXlxpxAd6mi1Ga2K6YeLVLZH4DnG
	P45Axioi1jypNY0wtaZCxlHZBDt8DbBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsGzTRkAEe/aoeBzEkCCpnRkHwHAtR9BitK4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7BLPx9cDMrKbdB/CxWTRRu+rAZ8KTspSzaExY80KdHsLhBjtyc4kOKWBw8
	15zO5Cmr4hJV6PP6OE3189gRe3Ts6tGIbjbKs0IwfeuGZmozi/UqSbqA+omG2WTX/ZChkTiiB6m
	lDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183464

From: Wang Mingyu <wangmy@fujitsu.com>

added
------
    Add just for development commands
    Add Python 3.12 support

changed
---------
    Move changelog into CHANGELOG.md
    Freshen up README

fixed
------
    Fix test_fixedoffset_eq by adding an actual assertion

removed
--------
    Drop Python 3.6 support (3.6 is end of life)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-iso8601_1.1.0.bb => python3-iso8601_2.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iso8601_1.1.0.bb => python3-iso8601_2.0.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb b/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-iso8601_1.1.0.bb
rename to meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
index 797607f81e..a8dccb90c7 100644
--- a/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367"
 
-SRC_URI[sha256sum] = "32811e7b81deee2063ea6d2e94f8819a86d1f3811e49d23623a41fa832bef03f"
+SRC_URI[sha256sum] = "739960d37c74c77bd9bd546a76562ccb581fe3d4820ff5c3141eb49c839fda8f"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


