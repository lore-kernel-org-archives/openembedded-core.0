Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3A3C2BA18
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.64029.1718936233782481070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pgNnH1Ay;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936234; x=1750472234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eoWgaz+TyxeUFh/yR9q/slOz/RwGGAZn0N7VMO8PUvk=;
  b=pgNnH1AyWzh7t7GAwUN+04+EaFSOY6DrTDUS9WVy0ekI7SgyjQXqK1gQ
   vwkW8G0IR2QVvsFSdG7usGzslM7rWJE0bmsqBj1Q87TVD8HWInaQspS4o
   45+8O7XGDCSt1Zx1hO/NNIUgPT1HPYSJd24VsmyLLWWfH97MqUOohCHhG
   YmfuxAkjxgca/VBbpc5PeSOmdcltkrOisTBmXhuBeOzf/3Uybc4tEkJE2
   2SA+Xm7hzrHZgEJNzXxX5Lw2hHrf3Jsi/6BdoHAr8eYzZAot3zK3FGBZE
   Ix9dH27Znk4HsVN1OeU8I/vyyBUhLpbgaUIhaEzYMWqAL53ilD2j9uugp
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="143508260"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="143508260"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:11 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CC07D9227
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E16D9BF4B0
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8075D20086E80
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3227A1A0002;
	Fri, 21 Jun 2024 10:17:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/22] alsa-ucm-conf: upgrade 1.2.11 -> 1.2.12
Date: Fri, 21 Jun 2024 10:16:27 +0800
Message-Id: <1718936206-8080-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--6.171300-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvozDhGeQC9En38
	DhskX88zjD2u30TwDiivxwKWKsr2SQ2FaYuMfXGoAD5jSg1rFtD1+9bO3CCbk2tOuxsdHBQ09nx
	EMDRyp9DjQ7OIHdXG8KEh/Pk+rxu47VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3iuFf+VRAZx7DsZfRzVSVqXNN9TX8X49sz2NFIRsHl1EqfxuDIQ4niqqPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrUqKVEvXNKAMay6BK042bcYEYrSIitsw9rT/M+vjGwz5Uo/x
	2L8At7o=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200970

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- sof-soundwire: fix missing MultiCodec1 initialization and Empty condition
- UCM2: Intel: sof-hda-dsp: Control SOF processing from UCM
- UCM2: SOF: Add example blobs customization for AAEON
- UCM2: Add sample SOF processing configuration blobs
- codecs: qcom-lpass/tx-macro: Move TX1 MODE ctrl to
- ucm2: codecs: wcd937x: add codec sequences
- ucm2: soundwire: add rt722 SDCA device
- ucm2: Qualcomm: x1e80100: add recording via DMIC01
- ucm2: sof-soundwire: Create ALSA config file for hdmi:
- ucm2: Intel/sof-hda-dsp: Create ALSA config file for
- ucm2: common: pcm: Add hdmi.conf to handle the creation
- sof-soundwire: Add basic support for cs42l43's speaker
- qcom: sdm845: MM1: enable jack detection
- qcom: sdm845: MM1: use analog volume controls instead of
- ucm2: Qualcomm: x1e80100: correct headphones
- ucm2: Qualcomm: x1e80100: add number of channels
- Add support for Coachz with HDMI disabled
- USB-Audio: ALC4080: Add support for MSI MEG Z790 Ace
- ucm2: MediaTek: mt8195-sof: Add support for Tomato RT5682s
- sof-soundwire: rt1316/rt1318 - fix channel selection for one amp
- sof-soundwire: rt1308: Fix single amp configuration
- sof-soundwire: fix rt1318 config copy-n-paste error in rt1318spk macro
- sof-soundwire: fix rt1318 config typo in rt1318spk macro
- USB-Audio: ALC4080: add 0b05:1af1 ASUS ROG Strix Z790-A Gaming Wifi II

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-ucm-conf_1.2.11.bb => alsa-ucm-conf_1.2.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.11.bb => alsa-ucm-conf_1.2.12.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb
index ce1a42c9b8..88b43c345b 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "387c01cf30e2a1676d7b8f72b2681cf219abca70dd1ec2a9e33add5bf3feae81"
+SRC_URI[sha256sum] = "168e7c0549b7bf8991092fa2bfb903631df779dc4c43ee8f4277fcb772d8c035"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.34.1


