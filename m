Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B99C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:29:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.74090.1705310979332244784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146154569"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146154569"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:29:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 200C5DF06F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:29:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 46816D4BC7
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:29:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB3C1411A9
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:29:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7D7771A0161;
	Mon, 15 Jan 2024 17:29:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xz: upgrade 5.4.4 -> 5.4.5
Date: Mon, 15 Jan 2024 17:29:23 +0800
Message-Id: <1705310963-24933-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-6.286600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOMJxigKCCiS0S3
	N7Ud/ZNyJwo5I9PHX7rGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat05499RlPzeVuQQ1vZ
	7s3YIVDIcfwGQIbwrkOLnuPsjYgioYwDOL7t3RyHMujzyu+W9gVXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibec3QM3secWZxgpmaMRbw+jhGfmRfi/N3CrMQwo24BHeRZGcF6GrJlv/+F
	c+1NHla6KgmWzARzE+naICb1Tum2VOfspH4DoH9RO3b62y49u4=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193666

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Small fixes and improvements to the tests.
* Updated translations: Chinese (simplified) and Esperanto.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.4.4.bb => xz_5.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.4.bb => xz_5.4.5.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.4.bb b/meta/recipes-extended/xz/xz_5.4.5.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.4.bb
rename to meta/recipes-extended/xz/xz_5.4.5.bb
index 90f4c3d82c..09eade8be0 100644
--- a/meta/recipes-extended/xz/xz_5.4.4.bb
+++ b/meta/recipes-extended/xz/xz_5.4.5.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "aae39544e254cfd27e942d35a048d592959bd7a79f9a624afb0498bb5613bdf8"
+SRC_URI[sha256sum] = "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d6"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.34.1


