Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44CEC3DA40
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7541.1687850378362138888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122378701"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122378701"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FDDED4F59
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6E12D5EA7
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A6366C833;
	Tue, 27 Jun 2023 16:19:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markupsafe: upgrade 2.1.2 -> 2.1.3
Date: Tue, 27 Jun 2023 15:17:21 +0800
Message-Id: <1687850250-20040-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10-0.144900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr4y6x6rwIkst4YeSlHZYFoheW
	SllMUEbI4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054zP3WYNhkszl1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDVA9C
	G3qTv2CY/jTB+GDUJjeuqgxqXzW8h+W0ltPK7otiq2ChjlyFexnKuwFDAoOa9MNipeuhx/Oc24A
	igNdsb8EPA8GbQsg3uOIN/Y0IxYTVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183466

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Implement format_map, casefold, removeprefix, and removesuffix methods. #370
 Fix static typing for basic str methods on Markup. #358
 Use Self for annotating return types. #379

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-markupsafe_2.1.2.bb => python3-markupsafe_2.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.2.bb => python3-markupsafe_2.1.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
index d150403f8c..b346cc85d9 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "abcabc8c2b26036d62d4c746381a6f7cf60aafcc653198ad678306986b09450d"
+SRC_URI[sha256sum] = "af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3 ptest
-- 
2.34.1


