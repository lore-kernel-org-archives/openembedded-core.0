Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B06BC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:40:08 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.14198.1701214798879922174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="120715620"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="120715620"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:39:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EE99D6189
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:39:54 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 737BED3F26
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:39:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5161986D02;
	Wed, 29 Nov 2023 08:39:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-idna: upgrade 3.4 -> 3.6
Date: Wed, 29 Nov 2023 07:39:09 +0800
Message-Id: <1701214749-1680-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10--0.091500-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yaofqYgF6NV/uSbWC5QPOSv9wRnyxuPjhHw6
	H06bMgivraob308tFzeZOyx/QY77rNIUKEcXjyBBEhGH3CRdKUVm8qF4pBsxHwzvg1/q1MH29VJ
	ULu5hXwSWRUJejnRpWrMTUjboGcLoCGqH67UhpHvTfU1/F+PbM1QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaL5ovokMONXgJ1U1lojafr/EITY2UGMiNwpeqaZhManGJSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXIYE43gxeT5r7VWXCMZPFFITiim
	UxMcgsnQ0hcT/5KcQWtbo1ZNmYR7LbBafVKXkZ/fJAu+shyG2EVJI5wmN+kRWhkBYrprVZf+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191414

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
===============
Update copyright date; Prep for 3.5; Update maintainer email

Changelog:
==========
-Fix regression to include tests in source distribution.
-Update to Unicode 15.1.0
-String codec name is now "idna2008" as overriding the system codec "idna" was
 not working.
-Fix typing error for codec encoding
-"setup.cfg" has been added for this release due to some downstream lack of
 adherence to PEP 517. Should be removed in a future release so please prepare
 accordingly.
-Removed reliance on a symlink for the "idna-data" tool to comport with PEP 517
 and the Python Packaging User Guide for sdist archives.
-Added security reporting protocol for project

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-idna_3.4.bb => python3-idna_3.6.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.4.bb => python3-idna_3.6.bb} (63%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.4.bb b/meta/recipes-devtools/python/python3-idna_3.6.bb
similarity index 63%
rename from meta/recipes-devtools/python/python3-idna_3.4.bb
rename to meta/recipes-devtools/python/python3-idna_3.6.bb
index 41a666f3f4..228dce62d7 100644
--- a/meta/recipes-devtools/python/python3-idna_3.4.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.6.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dbec47b98e1469f6a104c82ff9698cee"
 
-SRC_URI[sha256sum] = "814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4"
+SRC_URI[sha256sum] = "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


