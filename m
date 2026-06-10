Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295D1CD98CD
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16547.1781084979652743159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s4eAbzJk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084980; x=1812620980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wyz9Fq1r9pfXrX220sK75+tQOP0HaiwkHwHih86MqRA=;
  b=s4eAbzJksx/oj4SH9K7sPtc2HuOPNOxTheHIHHyFXEK6JvazDKKDY52j
   bNCQSqp2EYswXnbFtS0ovX0kEFqKcwwS2qj0K1e/pNkHAHB1xEyejvY04
   YLn/Ih276P0X5yZiLjJXXbhs2vkbXd9dm+r+06NNzvT++DR7XA8514s4s
   iAxETaceG8n8AG9tB84pNWOlf5iXMk9gPwXE3pJDlAXnMPzJZ7BP2L8xF
   jZhLYz/Kf9vM4eIi3PFCBB1n7SRPHHtOIdfg/AZFniEdCR6LPEzSCZIS8
   tGefu9kaRzj2/gWO4AnDT5ILlevjljBEhoyosZ9Zgikx/+hpZLQMJ/AM2
   Q==;
X-CSE-ConnectionGUID: pzs9OHoiSQGhu4rfWEfU1w==
X-CSE-MsgGUID: DVI52vlGQy+3m1U9NMB9FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="243678303"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="243678303"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:38 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C1783C000B9
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:37 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 79AB2C041E6
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9E0C414000A3;
	Wed, 10 Jun 2026 09:49:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/16] alsa-lib: upgrade 1.2.15.3 -> 1.2.16
Date: Wed, 10 Jun 2026 17:49:16 +0800
Message-ID: <20260610094932.2264-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238326

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2026-25068.patch
removed since it's included in 1.2.16

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 -------------------
 ...lsa-lib_1.2.15.3.bb => alsa-lib_1.2.16.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.3.bb => alsa-lib_1.2.16.bb} (91%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
deleted file mode 100644
index 9bb24c24e2..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40 Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Thu, 29 Jan 2026 16:51:09 +0100
-Subject: [PATCH] topology: decoder - add boundary check for channel mixer
- count
-
-Malicious binary topology file may cause heap corruption.
-
-CVE: CVE-2026-25068
-
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/topology/ctl.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/topology/ctl.c b/src/topology/ctl.c
-index a0c24518..322c461c 100644
---- a/src/topology/ctl.c
-+++ b/src/topology/ctl.c
-@@ -1250,6 +1250,11 @@ int tplg_decode_control_mixer1(snd_tplg_t *tplg,
- 	if (mc->num_channels > 0) {
- 		map = tplg_calloc(heap, sizeof(*map));
- 		map->num_channels = mc->num_channels;
-+		if (map->num_channels > SND_TPLG_MAX_CHAN ||
-+		    map->num_channels > SND_SOC_TPLG_MAX_CHAN) {
-+			snd_error(TOPOLOGY, "mixer: unexpected channel count %d", map->num_channels);
-+			return -EINVAL;
-+		}
- 		for (i = 0; i < map->num_channels; i++) {
- 			map->channel[i].reg = mc->channel[i].reg;
- 			map->channel[i].shift = mc->channel[i].shift;
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.16.bb
index 1ebb356925..25b2dcde17 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI += "file://CVE-2026-25068.patch"
-SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
+SRC_URI[sha256sum] = "122b1e3166d55fe19bcde656535d7a36f2ab10e66c72c6ad2f43f20ffded0a96"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


