Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFC9C83005
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3720.1684186750066759856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dtnEi1+C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a61b7-6c00101f-02c8-4a73-8a19-83edc8d1f161-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jiSFya5/BT4P3Gnf7tFtmZrjn4+R/77x02jXoBaVS4Y=;
	b=dtnEi1+CPfxHCVwJ+WN6lOMlo9JfRcjRr5+YEroMI/E629Z4KR4it8p9JrOixvyx
	W7WLRaYWHJYRC0oFckGJMd/NzEUtwGGkXTKsBWF2pXN+wP9DgEDv98nmMqUvpDSaz3b
	jU9xxMZkP9g/B8wz/bQPkf0C4bPw12ZgIUyvbK3c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jiSFya5/BT4P3Gnf7tFtmZrjn4+R/77x02jXoBaVS4Y=;
	b=AZs3T0eY6NJhGWtk4BmsUjCjTByBQ6Ls+k38uypSCf+CxmBfDwCXcwRFt0ws9q9b
	fuPlPtIERLEEzJQg6ikNaWibbOgiEZTP2TnjRJR+7+thgglL8Usaa4bysx22CdhStZI
	DrC+m3cbuEkDH+bzQEo0ltE3gU3IOFUmmEY79BgM=
Content-Type: multipart/mixed; boundary="===============9019103610808404166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.9 SUCCEEDED
Message-ID: <01010188215a61b7-6c00101f-02c8-4a73-8a19-83edc8d1f161-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181374

--===============9019103610808404166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-ucm-conf* to *1.2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.8-1.2.9.patch
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
--===============9019103610808404166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.8" to "1.2.9"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf", added "/usr/share/alsa/ucm2/Rockchip/rk817-sound/HiFi.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/mt8192_mt6359_rt1015p_rt5682.conf /usr/share/alsa/ucm2/conf.d/acp5x/Valve-Jupiter-1.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0EnableSeq.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/mt8365-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/HiFi.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/conf.d/mt8365-evk/mt8365-evk.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1DisableSeq.conf /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/HiFi.conf /usr/share/alsa/ucm2/Qualc
 omm/sc8280xp/sc8280xp.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast-Hifi.conf /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/init.conf /usr/share/alsa/ucm2/AMD/acp5x/HiFi.conf /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerDisableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1EnableSeq.conf /usr/share/alsa/ucm2/conf.d/simple-card/Librem 5.conf /usr/share/alsa/ucm2/conf.d/simple-card/PinePhone.conf /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/VoiceCall.conf /usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7.conf /usr/share/alsa/ucm2/codecs/wcd938x/init.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/conf.d/simple-card/rk817_ext.conf /usr/share/alsa/ucm2/conf.d/simple-card/rk817_int.conf /usr/share/alsa/ucm2/Rockchip/rk817-sound/rk817-sound.conf /usr/share/alsa/ucm2/Qualcomm/sc8280xp/HiFi.conf /usr/share/alsa/ucm2/conf.d/mt8192_mt6359/mt81
 92_mt6359_rt1015p_rt5682.conf /usr/share/alsa/ucm2/conf.d/sc8280xp/sc8280xp.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf /usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sc8280xp/LENOVO-X13s.conf /usr/share/alsa/ucm2/AMD/acp5x/acp5x.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3.conf /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/PinePhone.conf /usr/share/alsa/ucm2/codecs/wcd938x/DefaultEnableSeq.conf /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/Librem 5.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i-HiFi.conf /usr/share/alsa/ucm2/codecs/wsa883x/DefaultE
 nableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0DisableSeq.conf /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i.conf /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3-HiFi.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 285466 to 327400 (+15%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.8" to "1.2.9"
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.8.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.9.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.8 [default] to 1.2.9 [default]
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.8" to "1.2.9"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/Allwinner was added
  /usr/share/alsa/ucm2/Allwinner/A64 was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/HiFi.conf was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/PinePhone.conf was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/VoiceCall.conf was added
  /usr/share/alsa/ucm2/AMD/acp5x was added
  /usr/share/alsa/ucm2/AMD/acp5x/acp5x.conf was added
  /usr/share/alsa/ucm2/AMD/acp5x/HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x was added
  /usr/share/alsa/ucm2/codecs/wcd938x/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x was added
  /usr/share/alsa/ucm2/codecs/wsa883x/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/conf.d/acp5x was added
  /usr/share/alsa/ucm2/conf.d/acp5x/Valve-Jupiter-1.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8192_mt6359 was added
  /usr/share/alsa/ucm2/conf.d/mt8192_mt6359/mt8192_mt6359_rt1015p_rt5682.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8365-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8365-evk/mt8365-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sc8280xp was added
  /usr/share/alsa/ucm2/conf.d/sc8280xp/sc8280xp.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/Librem 5.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/PinePhone.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/rk817_ext.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/rk817_int.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8192 was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682 was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/mt8192_mt6359_rt1015p_rt5682.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/mt8365-evk.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Librem_5 was added
  /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/Librem 5.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp/LENOVO-X13s.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp/sc8280xp.conf was added
  /usr/share/alsa/ucm2/Rockchip/rk817-sound was added
  /usr/share/alsa/ucm2/Rockchip/rk817-sound/HiFi.conf was added
  /usr/share/alsa/ucm2/Rockchip/rk817-sound/rk817-sound.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Digidesign was added
  /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf was removed
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf was removed

--===============9019103610808404166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 285466 to 327400 (+15%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf", added "/usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7-HiFi.conf /usr/share/alsa/ucm2/conf.d/sc8280xp/sc8280xp.conf /usr/share/alsa/ucm2/codecs/wsa883x/DefaultEnableSeq.conf /usr/share/alsa/ucm2/conf.d/simple-card/Librem 5.conf /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/PinePhone.conf /usr/share/alsa/ucm2/codecs/wcd938x/DefaultEnableSeq.conf /usr/share/alsa/ucm2/Qualcomm/sc8280xp/HiFi.conf /usr/share/alsa/ucm2/conf.d/simple-card/rk817_ext.conf /usr/share/alsa/ucm2/AMD/acp5x/acp5x.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf /usr/share/alsa/ucm2/conf.d/simple-card/rk817_int.conf /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3.conf /usr/share
 /alsa/ucm2/codecs/wcd938x/init.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/HiFi.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1DisableSeq.conf /usr/share/alsa/ucm2/conf.d/acp5x/Valve-Jupiter-1.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast-Hifi.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/HiFi.conf /usr/share/alsa/ucm2/Rockchip/rk817-sound/rk817-sound.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4-HiFi.conf /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/VoiceCall.conf /usr/share/alsa/ucm2/conf.d/mt8365-evk/mt8365-evk.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/conf.d/simple-card/PinePhone.conf /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/Librem 5.conf /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/HiFi.conf /usr/share/alsa/
 ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/init.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0DisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i-HiFi.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/conf.d/mt8192_mt6359/mt8192_mt6359_rt1015p_rt5682.conf /usr/share/alsa/ucm2/Rockchip/rk817-sound/HiFi.conf /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerDisableSeq.conf /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sc8280xp/sc8280xp.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i.conf /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7.conf /
 usr/share/alsa/ucm2/AMD/acp5x/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/mt8192_mt6359_rt1015p_rt5682.conf /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3-HiFi.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1EnableSeq.conf /usr/share/alsa/ucm2/Qualcomm/sc8280xp/LENOVO-X13s.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/mt8365-evk.conf"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/Allwinner was added
  /usr/share/alsa/ucm2/Allwinner/A64 was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/HiFi.conf was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/PinePhone.conf was added
  /usr/share/alsa/ucm2/Allwinner/A64/PinePhone/VoiceCall.conf was added
  /usr/share/alsa/ucm2/AMD/acp5x was added
  /usr/share/alsa/ucm2/AMD/acp5x/acp5x.conf was added
  /usr/share/alsa/ucm2/AMD/acp5x/HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/DMIC0EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x was added
  /usr/share/alsa/ucm2/codecs/wcd938x/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd938x/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x was added
  /usr/share/alsa/ucm2/codecs/wsa883x/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x/SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/conf.d/acp5x was added
  /usr/share/alsa/ucm2/conf.d/acp5x/Valve-Jupiter-1.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8192_mt6359 was added
  /usr/share/alsa/ucm2/conf.d/mt8192_mt6359/mt8192_mt6359_rt1015p_rt5682.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8365-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8365-evk/mt8365-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sc8280xp was added
  /usr/share/alsa/ucm2/conf.d/sc8280xp/sc8280xp.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/Librem 5.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/PinePhone.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/rk817_ext.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/rk817_int.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8192 was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682 was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8192/mt6359-rt1015p-rt5682/mt8192_mt6359_rt1015p_rt5682.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/mt8365-evk.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Librem_5 was added
  /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Librem_5/Librem 5.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp/LENOVO-X13s.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc8280xp/sc8280xp.conf was added
  /usr/share/alsa/ucm2/Rockchip/rk817-sound was added
  /usr/share/alsa/ucm2/Rockchip/rk817-sound/HiFi.conf was added
  /usr/share/alsa/ucm2/Rockchip/rk817-sound/rk817-sound.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-4-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Digidesign was added
  /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Digidesign/Digidesign-Mbox-3-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/Inzone-H9-H7-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf was removed
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf was removed

--===============9019103610808404166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.8-1.2.9.patch"

RnJvbSAyYjhjYTYzYWVhZjNkMGY1MDg2MTEwZGFmMjVhOTZhYTU5YWY4MzcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6MTA6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXVjbS1jb25mOiB1cGdyYWRlIDEuMi44IC0+IDEuMi45CgotLS0KIC4uLi9hbHNhL3thbHNh
LXVjbS1jb25mXzEuMi44LmJiID0+IGFsc2EtdWNtLWNvbmZfMS4yLjkuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Eve2Fsc2EtdWNtLWNvbmZfMS4yLjguYmIgPT4gYWxz
YS11Y20tY29uZl8xLjIuOS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjguYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjkuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi44
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZf
MS4yLjkuYmIKaW5kZXggZDMwYjMyM2EwNC4uMDczZTNiMDkwMCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi44LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuOS5iYgpAQCAtOCw3ICs4
LDcgQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT0yMGQ3NGQ3NGRiOTc0MTY5NzkwMzM3MmFkMDAxZDNiNCIKIAogU1JDX1VS
SSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi9saWIvJHtCUH0udGFy
LmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZWU0YTczNzgzMGZkMjVmOTY5ZDgzZGE0NmEy
YjIzMWJlYjA4NmVmZDk2NmZjYzA3ZDIyNWU3ODIzMjYwYWU4IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjM3NGY2ODMzYmZkNzdkMGE0Njc1ZTRhYTJiZmI3OWRlZmU4NTBlNWE0NmE1ZDQ1NDJhNDU5
NjJmNGI5ZTI3MmEiCiAjIFNvbWV0aGluZyB3ZW50IHdyb25nIGF0IHVwc3RyZWFtIHRhcmJhbGxp
bmcKIAogaW5oZXJpdCBhbGxhcmNoCi0tIAoyLjM5LjIKCg==

--===============9019103610808404166==--

