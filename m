Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56261E7D254
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:23:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.14303.1695716582533445919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="133662553"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="133662553"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:23:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06472CF1C9
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:22:58 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D3C1CFB9A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:22:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 68DDE885FA;
	Tue, 26 Sep 2023 17:22:56 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.5.0 -> 2.6.1
Date: Tue, 26 Sep 2023 16:22:45 +0800
Message-Id: <1695716565-8044-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--7.258400-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrC//1TMV5chP8DCHGEvzYB09P
	9ERudm7ORFiAJMLZCjnhIO0zf0j0ZmA2IAXETeuKEzEoOqAAVLNN8rmPQRlvK9RGf5c57+FF4dO
	sNKuqfazXM7E4d3fliaCfwPQUqdEyXXCpH9i6ZmoD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiKRu03i5/TTreTqYM1g96owN+CmNIOQU3feSCetNTjVeBbptjxI6rdaPFj
	JEFr+olKE0Je8DR/D6No+PRbWqfRDsAVzN+Ov/slBG3ZXiIpl6xdA/k3C5LExnybqLwHwJS0swV
	SSBRsuvTkhYsv4aNFQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188224

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-This version tweaks normalization of language tags so that only the part of
 the tag that specifies country and language is altered; any extra that is
 not removed is left alone.
-This version removes validation of language tags; dictionary names no longer
 have to be valid language tags.
-Debug output now uses GLib's debug system, and can be enabled at run-time by
 setting the environment variable G_MESSAGES_DEBUG to 'libenchant'.
-The Aspell back-end has a fix to let it work with language variants such as
 "en_GB-ize".
-There's more code clean-up, build system updates, and a couple of null
-pointer dereference fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.5.0.bb => enchant2_2.6.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.5.0.bb => enchant2_2.6.1.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.5.0.bb b/meta/recipes-support/enchant/enchant2_2.6.1.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.5.0.bb
rename to meta/recipes-support/enchant/enchant2_2.6.1.bb
index f5ec1ef522..a3510a8705 100644
--- a/meta/recipes-support/enchant/enchant2_2.5.0.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "149e224cdd2ca825d874639578b6246e07f37d5b8f3970658a377a1ef46f2e15"
+SRC_URI[sha256sum] = "f24e12469137ae1d03140bb9032a47a5947c36f4d1e2f12b929061005eb15279"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


