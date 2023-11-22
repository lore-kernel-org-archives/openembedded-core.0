Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A31C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:02:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15263.1700643720056051363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140729263"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140729263"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:01:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DBE67E753D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:01:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C63BD9460
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:01:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E4CE6B820;
	Wed, 22 Nov 2023 18:01:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxslt: upgrade 1.1.38 -> 1.1.39
Date: Wed, 22 Nov 2023 17:01:09 +0800
Message-Id: <1700643669-9540-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.006
X-TMASE-Result: 10--1.660100-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrcYDVYBnAZVpRiRl337i3b2sW
	ZV9YMDBbJjdZvprOsDy0NAtQOunSyGzFfXEzaNt8Nmg1ckxsf6ehHrZE2+S863hh5KUdlgWiZ/S
	mwZqazWwIgOw0zefWcnwiQAfu/ujSa26OX4ADKvMD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whiEq0wTb4J7yXV7tdtvoibaVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDVHRtCHjL3yHzqmWHpBgHQww+1hmZhe2kBbQPtqM06lexNlOUZk9vV8/Z5x
	9KUvJQckpTIdOcaR/7C8dBh9GM+eZNIVx1Kiv4IN3Nev8Voz8VPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191031

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- extensions: Don't search imports for extension prefixes
- transform: Check maximum depth when processing default templates
- build: Add more missing includes
- python: Don't set deprecated global
- build: Add missing includes
- imports: Limit nesting depth
- extensions: Report top-level elements in xsltDebugDumpExtensions
- Add extern "C" { } block to xsltlocale.h
- python: Make it compatible with python3.12
- date: Fix check for localtime_s
- date: Fix check for gmtime_s
- pkg-config files include cflags for static builds
- Handle NOCONFIG case when setting locations from CMake target properties
- autotools: Make xslt-config executable
- tests: Structured error handler now passes a const xmlError
- python: Fix tests on MinGW
- fuzz: Fix xmlFuzzEntityLoader after recent libxml2 changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxslt/{libxslt_1.1.38.bb => libxslt_1.1.39.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.38.bb => libxslt_1.1.39.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.38.bb b/meta/recipes-support/libxslt/libxslt_1.1.39.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.38.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.39.bb
index ed5b15badd..2cc0c84bec 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.38.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.39.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1f32450425819a09acaff2ab7a5a7f8a2ec7956e505d7beeb45e843d0e1ecab1"
+SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


