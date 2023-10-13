Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6A8CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:07:08 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.34498.1697188019444849782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="136129888"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="136129888"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:06:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15E05FDB5
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:06:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 55059CF7E0
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:06:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66CD5200501A4;
	Fri, 13 Oct 2023 18:06:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-iso8601: upgrade 2.0.0 -> 2.1.0
Date: Fri, 13 Oct 2023 17:06:24 +0800
Message-Id: <1697187984-4642-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10-0.025200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj7fZJfDdCIXAQF
	TLnXm7yY4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054zP3WYNhkszl1vZ
	7s3YIVDKbepuhA18xJM5462iIVZCxrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SeDiD0og1D/uJ1eg91pcMR6dU5et4M4A0bcxbTjHqQBziOPzTuxJRwixqw
	+SsuFLxj2ROkp8AwZ852GfnM14Jb5zDomhCUutbS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189050

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fixed
------
Use ruff for linting
Fixed CHANGELOG version links

Added
------
Add readthedocs configuration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-iso8601_2.0.0.bb => python3-iso8601_2.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iso8601_2.0.0.bb => python3-iso8601_2.1.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
rename to meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
index a8dccb90c7..40ca5177be 100644
--- a/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367"
 
-SRC_URI[sha256sum] = "739960d37c74c77bd9bd546a76562ccb581fe3d4820ff5c3141eb49c839fda8f"
+SRC_URI[sha256sum] = "6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


