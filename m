Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FDDC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 23:54:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.986.1705362870342973741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 15:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="146197649"
X-IronPort-AV: E=Sophos;i="6.04,197,1695654000"; 
   d="scan'208";a="146197649"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 08:54:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 707E5D9D90
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:54:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 67A1ED4C3D
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:54:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E582EE5A3E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:54:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 639ED1A015E;
	Tue, 16 Jan 2024 07:54:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-subunit: upgrade 1.4.2 -> 1.4.4
Date: Tue, 16 Jan 2024 07:54:11 +0800
Message-Id: <1705362852-30067-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28122.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28122.003
X-TMASE-Result: 10--4.179100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yTiEPRj9j9rvVr5aZRoV9oQaHE9HUMbAkNAY
	WUo4HSIkf1fUWcPP1ENCNEei2kg1tL3YTtutwsdUA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnx4LalWvXBv2qjKAYV8LUadVNZaI2n6/+TAXNPNyDOEFXXsIV9lgAGU1x
	ZnvXfsKJgvVfiqe2AOzD59ilFX7wQ7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtvG0VHndRxgKCiwdngFXY56yY4JuWUjBR3w92rnneV8C/hmCZUH3CLicZlecWV95yBDO1
	gnns5On4Yiv9b81poxMwr802kJ2blq3o3hi9Dg/yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 23:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193805

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 change License file to COPYING.
 add BSD-3-Clause to LICENSE

Changelog:
===========
* Removed use of deprecated "utc" and "utcfromtimestamp"
  methods of "datetime.datetime".
* Fix an issue with date parsing exception handling
* Add support for Python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-subunit_1.4.2.bb => python3-subunit_1.4.4.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.4.2.bb => python3-subunit_1.4.4.bb} (55%)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
similarity index 55%
rename from meta/recipes-devtools/python/python3-subunit_1.4.2.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.4.bb
index a018ef1dc8..db5fecf921 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.org/project/python-subunit/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=20;md5=b1121e68d06c8d9ea544fcd895df0d39"
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[sha256sum] = "2988d324d55ec35dd037e502e3f74ac38f4e457bd44ee0edf5e898f7ee1134d4"
+SRC_URI[sha256sum] = "1079363131aa1d3f45259237265bc2e61a77e35f20edfb6e3d1d2558a2cdea34"
 
 inherit pypi setuptools3
 
-- 
2.34.1


