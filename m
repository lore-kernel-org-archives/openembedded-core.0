Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5122FC54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.10643.1710313766710061392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rrRNJKfO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313767; x=1741849767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L5TjQ6goHHDCPAKIzvamrmTcPHvTugR1UcVOYDnCamw=;
  b=rrRNJKfOdh0VepvrfkLCVTK1FKBw50XWzLCoNnjI68xQUlFTh9wLtz0W
   qgc4q3TflF8rIdSFlzdNrOm7sgojSKiMy48PtqYeaLKViWL20qu0skoIG
   3cM5013ACz8RSN6LH8L/LE22VVHEUpSJzkbQsVUWHwRvxG2MBZe+5tZnm
   Njih9feOZdWB5eqaS6ynw/VMGHzvvMyK2CDgBYy2O2FD5GN4s1K96ik/V
   7Mh4gtx4hUFtOmH8+2F/MHztdvKjIA2S5iAMhYgkPAqQUhOHn4uYVU3mY
   P6S8yy3jk6IkvxhZ+zyjiwefhnSrnBcDqgjMpy7Navz2meWVWx4kwjg3K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152102050"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152102050"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B5201232C9
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 046FAD2982
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EFFB20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3DD3B1A006B;
	Wed, 13 Mar 2024 15:09:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/36] python3-maturin: upgrade 1.4.0 -> 1.5.0
Date: Wed, 13 Mar 2024 15:08:21 +0800
Message-Id: <1710313714-12541-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--4.667600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvDQeGGV/t6Wzoj
	JH9oiMoV4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2ToUdFbHYUawmkh
	1mX1Vkyea7IVNHJKd7vO14swvI6zROwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtTcrjqQNIL8NDCjLWlA5xXEZJ9uDfZNKvK9xOCVS4N0Q5YjW5j9hkiJbEf
	YX2GTFNIvsbtkUeQYURK4cARCsz5/1i0szwR9kXHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix the format_name property and move it from the ArchiveEntry class to the ArchiveRead class

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-maturin_1.4.0.bb => python3-maturin_1.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.4.0.bb => python3-maturin_1.5.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb b/meta/recipes-devtools/python/python3-maturin_1.5.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.4.0.bb
rename to meta/recipes-devtools/python/python3-maturin_1.5.0.bb
index ed19ee647a..e80a45f0bc 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.5.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
 SRC_URI += "file://0001-Add-32-bit-RISC-V-support.patch"
-SRC_URI[sha256sum] = "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378bf93790"
+SRC_URI[sha256sum] = "e046ea2aed687991d58c42f6276dfcc0c037092934654f538b5877fd57dd3a9c"
 
 S = "${WORKDIR}/maturin-${PV}"
 
-- 
2.34.1


