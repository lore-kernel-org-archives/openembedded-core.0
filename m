Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D388C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:12:01 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.100738.1703682715067415411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="144766518"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="144766518"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:11:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 80458D6186
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:11:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB3FDD5E87
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:11:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33F4221D01C
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:11:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE6D31A006F;
	Wed, 27 Dec 2023 21:11:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-lxml: upgrade 4.9.3 -> 4.9.4
Date: Wed, 27 Dec 2023 21:11:43 +0800
Message-Id: <1703682703-24274-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10--2.713900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrwuIWIvQEbW59MesWtSDfsriR
	FJnWDxkl250kQgXrNpoNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUKkBwrSbHEWVeDt
	iR5GGbO4j95rgWAEHGNun5+3iFMvt5Tos0P0HnGQENBYsuFsuJuNOsO17V7gY0sppPfFIDjGlI9
	kDL+4Mp7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192952

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* LP#2046398: Inserting/replacing an ancestor into a node's children could loop indefinitely.
* LP#1980767, GH#379: "TreeBuilder.close()" could fail with a "TypeError" after
  parsing incorrect input.
* LP#1522052: A file-system specific test is now optional and should no longer fail
  on systems that don't support it.
* Wheels include zlib 1.3, libxml2 2.10.3 and libxslt 1.1.39
  (zlib 1.2.12, libxml2 2.10.3 and libxslt 1.1.37 on Windows).
* Built with Cython 0.29.37.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_4.9.3.bb => python3-lxml_4.9.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_4.9.3.bb => python3-lxml_4.9.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.3.bb b/meta/recipes-devtools/python/python3-lxml_4.9.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_4.9.3.bb
rename to meta/recipes-devtools/python/python3-lxml_4.9.4.bb
index b911f7b2ad..ed8bce0735 100644
--- a/meta/recipes-devtools/python/python3-lxml_4.9.3.bb
+++ b/meta/recipes-devtools/python/python3-lxml_4.9.4.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "48628bd53a426c9eb9bc066a923acaa0878d1e86129fd5359aee99285f4eed9c"
+SRC_URI[sha256sum] = "b1541e50b78e15fa06a2670157a1962ef06591d4c998b998047fff5e3236880e"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.34.1


