Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CC3D6205D
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4856.1731964660621852309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=e9uIuA6z;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=W9jSfhp/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934123a9e4-e242314c-e54b-4688-8663-f722003a1987-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964676;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I2zMjmb0Re9SM62KcL0qI+xq3YtPRCLyQp0D1rliBzA=;
	b=e9uIuA6zWSFMechYjNWFxuoiBHcRWln9/W6GZCZFbnIiyOTPKXFN2SktZAtWBbNO
	I8f0xvnWz2i5yCNrBoPWVgr0h/6dK2Zgdz3ynctDMeXKrUiO22peizMK7tBqErWQhhW
	d7eUYkTPUqclRiJql2D49qcJ9V0MTtAAe3j2M3nM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964676;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I2zMjmb0Re9SM62KcL0qI+xq3YtPRCLyQp0D1rliBzA=;
	b=W9jSfhp/j5SSIAYZx5FZ1zQO81Iug9st8hk6cNBSH4UKRVreU++9CiEbDgG4oR3t
	d2keib48sSYqF2XWpgprtxxYZYc0JxXSeONQHdFJ8ht9PL5lxEu9U8A25jFwtzeGzFx
	R/YDGNEplutruUDBKHA21oSrxY2dtiYb3/IbstcQ=
Content-Type: multipart/mixed; boundary="===============6078833375088901434=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.13 SUCCEEDED
Message-ID: <010101934123a9e4-e242314c-e54b-4688-8663-f722003a1987-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207345

--===============6078833375088901434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-ucm-conf* to *1.2.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.12-1.2.13.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 527f32162e6a90218c1006cb48d7a6eb51d7a0d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 05:03:09 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.12 -> 1.2.13

---
 .../alsa/{alsa-ucm-conf_1.2.12.bb => alsa-ucm-conf_1.2.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.12.bb => alsa-ucm-conf_1.2.13.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
index 88b43c345b..1cba08b97a 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "168e7c0549b7bf8991092fa2bfb903631df779dc4c43ee8f4277fcb772d8c035"
+SRC_URI[sha256sum] = "4483b6e3983cca08fd326a73fbae449b5036e444fb1a07c0dee74b504b7ab5af"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.44.1


--===============6078833375088901434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/conf.d/acp-pdm-mach/acp-pdm-mach.conf /usr/share/alsa/ucm2/conf.d/avs_nau8825/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/sof-soundwire/rt1320.conf /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/avs_nau8825-HiFi.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5EnableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/cs35l56-bridge.conf /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2.conf /usr/share/alsa/ucm2/conf.d/avs_max98357a/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus.conf /usr/share/alsa/ucm2/sof-soundwire/rt712-dmic.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/In
 tel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/SM8550-HDK.conf /usr/share/alsa/ucm2/conf.d/avs_nau8825/Google-Cave-1.0.conf /usr/share/alsa/ucm2/codecs/rt712/init.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_nau8825/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0-HiFi.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1DisableSeq.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5DisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/D828.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_max98927/Google-Eve-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_max98927/HP-Soraka-1.0.conf /usr/
 share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_max98357a/Google-Coral-rev2.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_max98373/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana.conf /usr/share/alsa/ucm2/conf.d/apq8096/DB820c.conf /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/HiFi.conf /usr/share/alsa/ucm2/conf.d/sm8550/SM8550-HDK.conf /usr/share/alsa/ucm2/codecs/rt712-dmic/init.conf /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0.conf /usr/share/alsa/ucm2/conf
 .d/avs_dmic/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/sof-soundwire/rt712.conf /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Coral-rev2.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/conf.d/hdaudioB0D2/hdaudioB0D2.conf /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Cave-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_rt5663/Google-Eve-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_rt5514/Google-Eve-1.0.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_rt5663/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/con
 f.d/avs_max98357a/Google-Cave-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/D828-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2-Hifi.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Google-Cave-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Coral-rev2.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 415059 to 468651 (+13%)
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/rt712 was added
  /usr/share/alsa/ucm2/codecs/rt712-dmic was added
  /usr/share/alsa/ucm2/codecs/rt712-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt712/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5EnableSeq.conf was added
  /usr/share/alsa/ucm2/conf.d/acp-pdm-mach was added
  /usr/share/alsa/ucm2/conf.d/acp-pdm-mach/acp-pdm-mach.conf was added
  /usr/share/alsa/ucm2/conf.d/apq8096 was added
  /usr/share/alsa/ucm2/conf.d/apq8096/DB820c.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_da7219 was added
  /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Coral-rev2.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Coral-rev2.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a/Google-Coral-rev2.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98373 was added
  /usr/share/alsa/ucm2/conf.d/avs_max98373/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98927 was added
  /usr/share/alsa/ucm2/conf.d/avs_max98927/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98927/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825 was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5514 was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5514/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5663 was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5663/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5663/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_ssm4567 was added
  /usr/share/alsa/ucm2/conf.d/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/hdaudioB0D2 was added
  /usr/share/alsa/ucm2/conf.d/hdaudioB0D2/hdaudioB0D2.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8550 was added
  /usr/share/alsa/ucm2/conf.d/sm8550/SM8550-HDK.conf was added
  /usr/share/alsa/ucm2/Intel/avs was added
  /usr/share/alsa/ucm2/Intel/avs/avs_da7219 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98357a was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98373 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/avs_nau8825-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5514 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2 was added
  /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2.conf was added
  /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/SM8550-HDK.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs35l56-bridge.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1320.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt712.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt712-dmic.conf was added
  /usr/share/alsa/ucm2/USB-Audio/BOSS was added
  /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana.conf was added
  /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/D828.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/D828-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C-HiFi.conf was added

--===============6078833375088901434==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.12-1.2.13.patch"

RnJvbSA1MjdmMzIxNjJlNmE5MDIxOGMxMDA2Y2I0OGQ3YTZlYjUxZDdhMGQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMDU6MDM6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXVjbS1jb25mOiB1cGdyYWRlIDEuMi4xMiAtPiAxLjIuMTMKCi0tLQogLi4uL2Fsc2Eve2Fs
c2EtdWNtLWNvbmZfMS4yLjEyLmJiID0+IGFsc2EtdWNtLWNvbmZfMS4yLjEzLmJifSAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11Y20tY29uZl8xLjIuMTIuYmIgPT4g
YWxzYS11Y20tY29uZl8xLjIuMTMuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4xMi5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTMuYmIKc2ltaWxhcml0eSBpbmRleCA4
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25m
XzEuMi4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVj
bS1jb25mXzEuMi4xMy5iYgppbmRleCA4OGI0M2MzNDViLi4xY2JhMDhiOTdhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjEyLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTMuYmIK
QEAgLTgsNyArOCw3IEBAIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjBkNzRkNzRkYjk3NDE2OTc5MDMzNzJhZDAwMWQzYjQi
CiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvbGli
LyR7QlB9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTY4ZTdjMDU0OWI3YmY4OTkx
MDkyZmEyYmZiOTAzNjMxZGY3NzlkYzRjNDNlZThmNDI3N2ZjYjc3MmQ4YzAzNSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI0NDgzYjZlMzk4M2NjYTA4ZmQzMjZhNzNmYmFlNDQ5YjUwMzZlNDQ0ZmIx
YTA3YzBkZWU3NGI1MDRiN2FiNWFmIgogIyBTb21ldGhpbmcgd2VudCB3cm9uZyBhdCB1cHN0cmVh
bSB0YXJiYWxsaW5nCiAKIGluaGVyaXQgYWxsYXJjaAotLSAKMi40NC4xCgo=

--===============6078833375088901434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.12" to "1.2.13"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.12 [default] to 1.2.13 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/D828.conf /usr/share/alsa/ucm2/sof-soundwire/cs35l56-bridge.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Coral-rev2.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2-Hifi.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/SM8550-HDK.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2.conf /usr/share/alsa/ucm2/conf.d/avs_max98357a/Google-Coral-rev2.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_max
 98927/Google-Eve-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/avs_nau8825-HiFi.conf /usr/share/alsa/ucm2/conf.d/apq8096/DB820c.conf /usr/share/alsa/ucm2/conf.d/avs_max98927/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/D828-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_nau8825/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/sof-soundwire/rt712-dmic.conf /usr/share/alsa/ucm2/conf.d/acp-pdm-mach/acp-pdm-mach.conf /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2.conf /usr/share/alsa/ucm2/conf.d/avs_max98357a/Google-Cave-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Cave-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/sof-soundwire/rt712.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Google-Cave-1.0.conf /usr/sh
 are/alsa/ucm2/conf.d/avs_dmic/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch.conf /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5.conf /usr/share/alsa/ucm2/conf.d/sm8550/SM8550-HDK.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C.conf /usr/share/alsa/ucm2/conf.d/avs_max98373/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0.conf /usr/share/alsa/ucm2/codecs/rt712/init.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Atlas-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0
 -HiFi.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5EnableSeq.conf /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219.conf /usr/share/alsa/ucm2/conf.d/hdaudioB0D2/hdaudioB0D2.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_rt5514/Google-Eve-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_rt5663/Google-Eve-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_rt5663/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_nau8825/Google-Cave-1.0.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0.conf /usr/share/alsa/ucm2/conf.d/avs_nau8825/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana.conf /usr/share/alsa/ucm2/conf.
 d/avs_max98357a/Acer-Lars-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana-HiFi.conf /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219-HiFi.conf /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Coral-rev2.conf /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0-HiFi.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1DisableSeq.conf /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5DisableSeq.conf /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0-HiFi.conf /usr/share/alsa/ucm2/codecs/rt712-dmic/init.conf /usr/share/alsa/ucm2/sof-soundwire/rt1320.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 415059 to 468651 (+13%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.12" to "1.2.13"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.12 [default] to 1.2.13 [default]
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.12.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.13.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.12" to "1.2.13"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.12 [default] to 1.2.13 [default]
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/rt712 was added
  /usr/share/alsa/ucm2/codecs/rt712-dmic was added
  /usr/share/alsa/ucm2/codecs/rt712-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt712/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/AnalogMic5EnableSeq.conf was added
  /usr/share/alsa/ucm2/conf.d/acp-pdm-mach was added
  /usr/share/alsa/ucm2/conf.d/acp-pdm-mach/acp-pdm-mach.conf was added
  /usr/share/alsa/ucm2/conf.d/apq8096 was added
  /usr/share/alsa/ucm2/conf.d/apq8096/DB820c.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_da7219 was added
  /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_da7219/Google-Coral-rev2.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Google-Coral-rev2.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_dmic/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98357a/Google-Coral-rev2.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98373 was added
  /usr/share/alsa/ucm2/conf.d/avs_max98373/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98927 was added
  /usr/share/alsa/ucm2/conf.d/avs_max98927/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_max98927/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825 was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_nau8825/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5514 was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5514/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5663 was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5663/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_rt5663/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/avs_ssm4567 was added
  /usr/share/alsa/ucm2/conf.d/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/conf.d/hdaudioB0D2 was added
  /usr/share/alsa/ucm2/conf.d/hdaudioB0D2/hdaudioB0D2.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8550 was added
  /usr/share/alsa/ucm2/conf.d/sm8550/SM8550-HDK.conf was added
  /usr/share/alsa/ucm2/Intel/avs was added
  /usr/share/alsa/ucm2/Intel/avs/avs_da7219 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_da7219/avs_da7219-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-2ch-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_dmic/DMIC-4ch-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98357a was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98357a/avs_max98357a-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98373 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98373/Google-Atlas-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/Google-Eve-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_max98927/HP-Soraka-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Acer-Lars-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/avs_nau8825-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Google-Cave-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_nau8825/Hewlett_Packard-Chell-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5514 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5514/Google-Eve-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/Google-Eve-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_rt5663/HP-Soraka-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567 was added
  /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0.conf was added
  /usr/share/alsa/ucm2/Intel/avs/avs_ssm4567/Hewlett_Packard-Chell-1.0-HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2 was added
  /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2.conf was added
  /usr/share/alsa/ucm2/Intel/avs/hdaudioB0D2/hdaudioB0D2-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8550/HDK/SM8550-HDK.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs35l56-bridge.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1320.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt712.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt712-dmic.conf was added
  /usr/share/alsa/ucm2/USB-Audio/BOSS was added
  /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana.conf was added
  /usr/share/alsa/ucm2/USB-Audio/BOSS/Katana-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/D828.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/D828-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/UltraLite-mk5-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastV2-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2Plus-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22C-HiFi.conf was added

--===============6078833375088901434==--

