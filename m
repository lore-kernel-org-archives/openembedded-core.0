Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE33AC83F18
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:35:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8503.1693449333481231687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129921590"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129921590"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:35:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4621CDB4C3
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:35:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B43CD3F2D
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:35:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 044696BEF6;
	Thu, 31 Aug 2023 11:35:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsndfile1: upgrade 1.2.0 -> 1.2.2
Date: Thu, 31 Aug 2023 10:34:50 +0800
Message-Id: <1693449290-27932-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--3.180300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwi7N2IdiDgmM+ik
	wR/RlN8a4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2euLH9BII+4qr/H
	OvRCc3N7J7QyCkL9GiLFrSjd+bNMCeBzEkCCpnRndCok3ibXlQU50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLFJ3bHcY/xoo0gp4NECOSI+1wMAissJ3RTHC9nndEpgB/hX
	4sGFshSm3z7a2TJZ+W4kCo4o3zgktc0EKI8PMyghdKNeQyBFo1Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186941

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Fixed invalid regex in src/create_symbols_file.py
* Fixed passing null pointer to printf %s in tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsndfile/{libsndfile1_1.2.0.bb => libsndfile1_1.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.2.0.bb => libsndfile1_1.2.2.bb} (92%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
similarity index 92%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 58eea0baf9..9c1f601aab 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-SRC_URI[sha256sum] = "0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a"
+SRC_URI[sha256sum] = "3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
2.34.1


