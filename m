Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563F9C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:32:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8829.1700037165998028994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="128070607"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="128070607"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:32:43 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A0100D4F5B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:32:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6F56CF7C8
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:32:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 183F320050199;
	Wed, 15 Nov 2023 17:32:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-mako: upgrade 1.2.4 -> 1.3.0
Date: Wed, 15 Nov 2023 16:31:40 +0800
Message-Id: <1700037100-1463-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.006
X-TMASE-Result: 10--2.483100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhFAA
	KnuHLT8xVLAa8KXwKt4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7ssb
	EkSX6c0lrLf3+bsA/g4hMTcdVKb+FeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFEDmFITtF/6TRbEZBeQwrLzWwK7YeHylCXfA9
	SxNhLEfsKMGBiVWHtgK3LrN/yW2mzdPMU0rZMTElb7tdrarzSRVCBCdg2DoW+x9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190569

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
-Mako 1.3.0 bumps the minimum Python version to 3.8, as 3.7 is EOL as of
 2023-06-27. Python 3.12 is now supported explicitly.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.2.4.bb => python3-mako_1.3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.4.bb => python3-mako_1.3.0.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.4.bb b/meta/recipes-devtools/python/python3-mako_1.3.0.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-mako_1.2.4.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.0.bb
index 9860058723..d180e05cea 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.4.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.0.bb
@@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ad08dd28df88e64b35bcac27c822ee34"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcc01df649aee6c59dcb254c894ea0d4"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d60a3903dc3bb01a18ad6a89cdbe2e4eadc69c0bc8ef1e3773ba53d44c3f7a34"
+SRC_URI[sha256sum] = "e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.34.1


