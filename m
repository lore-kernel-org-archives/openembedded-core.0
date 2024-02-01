Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCE0C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:18:19 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.9036.1706764689213067242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MSPC66eZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706764691; x=1738300691;
  h=from:to:cc:subject:date:message-id;
  bh=gupTcH8UB+tDecoKRUffrl3JtiFMC7LTEWr1IzmCrnc=;
  b=MSPC66eZ2J2lCG/MNXbXtl/prcY5BGfFVx0e6PGcNXsIzScUmQBX869Z
   JNEKjs1o94emfRDDzDiCydvUAiaqVBeJ+q8ImXTvQ+0gSbASDn55PyK58
   Og/E+lyBhVPYZPn8mJd0+BqBI4UfWC82Y5Kiy4jM9eO9Y1ho8Fcj33vst
   xJ/BXxSu1crjtkakVupQ4ViATkIBeXnp3T/kkRD0tfTBtQwZOxMsOZ9yR
   qfeCy0n9EIjsTp9LKNZdAoic+cu+NthmnBViuK/8FTFYmhtkk+u5ite7h
   Z2CwVqRuejTSGtN38ZWhDGUrdcMR8MgEkEnYJ5IEAxhlf3qpipc/yNZR2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="127396343"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="127396343"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:18:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 94445D4807
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:18:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D2EBD4BD1
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:18:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BC69200501BB
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:18:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CAF931A006A;
	Thu,  1 Feb 2024 13:18:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libidn2: upgrade 2.3.4 -> 2.3.7
Date: Thu,  1 Feb 2024 13:11:06 +0800
Message-Id: <1706764266-12513-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--5.204600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvMZSz1vvG+0mtv9
	Yxcv46SL9JDgPIfVMVVxLAyM+BP7txLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07b4iOwQQ4jNi1TS+Qb/MG7lIlk1y2AVFCTu1w+cMzfgbCKyi0WHbrWw=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Really include tests/standalone.sh in tarball.
-Bump libtool version numbers to reflect API/ABI addition.
-Include tests/standalone.sh in tarball.

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libidn/{libidn2_2.3.4.bb => libidn2_2.3.7.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libidn/{libidn2_2.3.4.bb => libidn2_2.3.7.bb} (83%)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.4.bb b/meta/recipes-extended/libidn/libidn2_2.3.7.bb
similarity index 83%
rename from meta/recipes-extended/libidn/libidn2_2.3.4.bb
rename to meta/recipes-extended/libidn/libidn2_2.3.7.bb
index b48de39fa0..7ae933e047 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.4.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.7.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.unicode;md5=684cf5f7e3fded3546679424528261a9 \
-                    file://src/idn2.c;endline=16;md5=0f347a5b17acf44440bf53e406f1df70 \
-                    file://lib/idn2.h.in;endline=27;md5=4d7b3771faa9c60067ed1da914508bc5 \
+                    file://src/idn2.c;endline=16;md5=afc1531bda991ba6338e33a7eff758a0 \
+                    file://lib/idn2.h.in;endline=27;md5=f88d218005a5c45b68a83cecb5bd7f26 \
                     "
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f"
+SRC_URI[sha256sum] = "4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64"
 
 DEPENDS = "virtual/libiconv libunistring"
 
-- 
2.34.1


