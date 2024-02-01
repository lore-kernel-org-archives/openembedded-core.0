Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1744FC48292
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 04:20:29 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8410.1706761227546816708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 20:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ds5XI8rA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706761228; x=1738297228;
  h=from:to:cc:subject:date:message-id;
  bh=zyRMywdo0Ru/AgIdzhIsWUbk64ldXpeLjJsGGR5dsqg=;
  b=Ds5XI8rAItUh/dNH/dZ3DlVen9aqypAbf4vRKjG4hhQJn7GWPC4+nqTe
   vlRJrbyfiaPFvTn+mrXxKIR554jjstCYElw3XX8Uf1aTCxcdxdBu7+nKM
   cbS3iWjMn/cRDtUMZPP1Xf8rykfa2UtTKhzdpa1Btor/iScefYX/t/PCJ
   TivSC3R+gEC70I8cetsV6I7TD+DJZawD0rGlZU1nkpHFq+FV3rSLX6Y9T
   FSwfKPCUxxUz/QTp4fmXPYL2B3m03OPneJ1dirT6tUWv4oSi3237liQ4H
   YS/AUdDaS2T/d/MGvzG4TunJTO0cNW5e9KIjoh5taeGunqCQApWdS9V2f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="149699040"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="149699040"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 13:20:25 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AD4AB39594
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:20:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1DC6D562E
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:20:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DE381EA368
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:20:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D04E21A006A;
	Thu,  1 Feb 2024 12:20:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libtest-warnings-perl: upgrade 0.032 -> 0.033
Date: Thu,  1 Feb 2024 12:20:01 +0800
Message-Id: <1706761201-11906-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--0.034600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxM+b8yxBqvA1nR
	Kz8wZ8FMD8ATtev9xHAwTt6550abUf4hvJOjXo7HXMo/Oicf1k5ezmeoa8MJ8xPHC/N9HlDK2d8
	mtRIRsUOOeRpnY8p8HAXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq5Bb1
	8AokbsU4HyoKWo0zp/Lmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07Rf2u
	kFm4ENtXlBd3TuYMWLcmNOHmUG2jVsbr8z0jYWwa6o/oW4iGSHDkX+MEKRNnOWbG2iLkzNoA2yu
	QJu8TYSHg0pZzYrQRdf2LeCl9MAH8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 04:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194557

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- add Test2 compatibility in the test triggered by done_testing();
- new long-awaited feature (!!!) "allow_patterns", to either
  temporarily or globally exempt particular warning patterns

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...st-warnings-perl_0.032.bb => libtest-warnings-perl_0.033.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtest-warnings-perl_0.032.bb => libtest-warnings-perl_0.033.bb} (93%)

diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
similarity index 93%
rename from meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
rename to meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
index 5876e8a63c..17b4cc3c9e 100644
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4727dae2416e9f07e41e2dc3a9143ba6affc1ec57652117c99d50038e313e9d9"
+SRC_URI[sha256sum] = "b9c375719f2c61c5f97aa5ee6cf4c901a972347c415969379b0b51f67c48bbcb"
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-- 
2.34.1


