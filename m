Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21391C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:14:25 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.73672.1705310056193259469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146007820"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146007820"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:14:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BFD3AD6187
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:14:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E89DD5E90
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:14:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 805256B4F4
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:14:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0131E1A0070;
	Mon, 15 Jan 2024 17:14:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-subunit: upgrade 1.4.2 -> 1.4.4
Date: Mon, 15 Jan 2024 17:10:54 +0800
Message-Id: <1705309854-24258-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--2.251100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yZGA/MAGSrEgcDzcoONn/M5UjspoiX02F2Uz
	B7Xp5yOCOuzeNmOGKnPZwscUgE1qUWs0SgWtnXgnA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnx4LalWvXBv2qjKAYV8LUadVNZaI2n6/+TAXNPNyDOEFXXsIV9lgAGU1x
	ZnvXfsKJgvVfiqe2AOzD59ilFX7wQ7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtpmd/ehreR4Vl3cY9oKKZRjkbVuMMn4c7gyPjN+WEXVkgxUPuiVKol3Ka5Gmpp/tNPOwe
	+bM+/g7ALQb+ehkH3otg87d38Z+KoVmuI/haNPDyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193649

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Rely on external copy of iso8601

Changelog:
===========
* Removed use of deprecated "utc" and "utcfromtimestamp"
  methods of "datetime.datetime".
* Fix an issue with date parsing exception handling
* Add support for Python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-subunit_1.4.2.bb => python3-subunit_1.4.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.4.2.bb => python3-subunit_1.4.4.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-subunit_1.4.2.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.4.bb
index a018ef1dc8..ba30d349a6 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
@@ -2,11 +2,11 @@ SUMMARY = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.org/project/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=571e2d702e247b9d8a7745b3b54315ed"
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[sha256sum] = "2988d324d55ec35dd037e502e3f74ac38f4e457bd44ee0edf5e898f7ee1134d4"
+SRC_URI[sha256sum] = "1079363131aa1d3f45259237265bc2e61a77e35f20edfb6e3d1d2558a2cdea34"
 
 inherit pypi setuptools3
 
-- 
2.34.1


