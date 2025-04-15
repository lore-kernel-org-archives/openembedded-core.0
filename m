Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D3FC369CB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20154.1744723976760592660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=V3ainDlH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oquw31V2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019639a75550-0e151c6b-e4bc-4f65-95cc-dd37db8e09db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NBvGWfSCoZjD+70YPpO+kaFsknf2WPnVBgdUjFxki0A=;
	b=V3ainDlHhpP9xrYAIdQSF1+UUoDz9orBe/W1I5J5BO210YDpduZbZKgEXSDrbay4
	hJTK3UIu0aNMdxAZb2E5QRv7XnV7yd2rOYmPznl54xZtwqAU4y1n/ZiTJc3zm/B0cE+
	m/jIxRvO8a+5uk+AtCZ9hjIV9IjAwrWXQ3q1nBig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NBvGWfSCoZjD+70YPpO+kaFsknf2WPnVBgdUjFxki0A=;
	b=oquw31V28/3U8rKrhzlrqJMQoJ/rNQH1lAj1lJ+Tgcjv8/ss/IWM0rvd5fwNA+63
	IeIqIPqPpYGtJ51KuFnsRf2Mm3VsrSAFHyhrH2S2AmtUwSbcVWWEZas96jM/AU70ulm
	lxuhgKHp+rjKljdyKbB5JGbR8ILrxX0RK7ftf/CY=
Content-Type: multipart/mixed; boundary="===============6013806578707338412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.14 SUCCEEDED
Message-ID: <0101019639a75550-0e151c6b-e4bc-4f65-95cc-dd37db8e09db-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214926

--===============6013806578707338412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-ucm-conf* to *1.2.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.13-1.2.14.patch
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
From e94f76d089dc00d1766b7df674b89ac6753fb18f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 10:41:51 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.13 -> 1.2.14

---
 .../alsa/{alsa-ucm-conf_1.2.13.bb => alsa-ucm-conf_1.2.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.13.bb => alsa-ucm-conf_1.2.14.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
index 1cba08b97a..d9ef831937 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "4483b6e3983cca08fd326a73fbae449b5036e444fb1a07c0dee74b504b7ab5af"
+SRC_URI[sha256sum] = "32e9809f592d92b978aa1032e35293c33b8d0f1ec475f937022c3ee9a3069c21"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.47.1


--===============6013806578707338412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.13" to "1.2.14"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.13" to "1.2.14"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 468651 to 569864 (+22%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.conf /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/HDA/HDA-Capture-value.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/
 blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob", added "/usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/HiFi.conf /usr/share/alsa/ucm2/conf.d/x1e80100/x1e80100.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval.conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357/HiFi.conf /usr/share/alsa/ucm2/codecs/cs42l43-dmic/init.conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/acp3x-alc5682-alc1015.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_50mm_pm5_15_30_90deg_48khz.bin /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx7.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20.
 conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/acp3x-alc5682-max98357.conf /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf /usr/share/alsa/ucm2/conf.d/sm8750/SM8750-MTP.conf /usr/share/alsa/ucm2/conf.d/simple-card/verdin-nau8822.conf /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/HiFi.conf /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/colibri-imx6.conf /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_68mm_pm5_15_30_90deg_48khz.bin /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast-HiFi.conf /usr/sh
 are/alsa/ucm2/USB-Audio/Presonus/Revelator-IO-44-HiFi.conf /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/HiFi.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev-HiFi.conf /usr/share/alsa/ucm2/Intel/sof-hda-dsp/dsp.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_generic_pm10deg_48khz.bin /usr/share/alsa/ucm2/Qualcomm/x1e80100/Slim7x-HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.bin /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/SM8750-MTP.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_74mm_pm5_15_30_90deg_48khz.bin /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture.conf /usr/share/alsa/ucm2/conf.d/acp3xalc5682101/acp3xalc5682101.conf /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/apalis-imx6.conf /usr/share/alsa/ucm2/conf.d/simple-card/apalis-imx8.conf /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/apalis-imx8.conf /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/HiFi.conf /usr/share/alsa/ucm2/US
 B-Audio/Focusrite/Scarlett-2i-gen4-HiFi.conf /usr/share/alsa/ucm2/conf.d/amd-soundwire/amd-soundwire.conf /usr/share/alsa/ucm2/codecs/cs35l56/init.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-Slim-7x.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev.conf /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2.conf /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia-HiFi.conf /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/apalis-imx6.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.bin /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.bin /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/mt8183_da7219_rt1015p.conf /usr/share/alsa/ucm2/common/ctl/led.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/init.conf /usr/share/alsa/ucm2/USB-Audio/Preson
 us/Revelator-IO-44.conf /usr/share/alsa/ucm2/conf.d/mt8183_mt6358_t/mt8183_mt6358_t.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II-HiFi.conf /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/colibri-imx8x.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2-Hifi.conf /usr/share/alsa/ucm2/codecs/rt1318/init.conf /usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/HiFi.conf /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/colibri-imx7.conf /usr/share/alsa/ucm2/conf.d/simple-card/verdin-wm8904.conf /usr/share/alsa/ucm2/Allwinner/sun4i-h616/HiFi.conf /usr/share/alsa/ucm2/HDA/HiFi-mic.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/QCS6490-RB3Gen2.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_pass.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line4_pass.bin /usr/share/alsa/ucm2/MediaTek/mt8183
 /mt8183_mt6358_ts3a227_max98357/mt8183_mt6358_ts3a227_max98357.conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/sof/sof-mt8390-evk.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/T14s-HiFi.conf /usr/share/alsa/ucm2/codecs/cs35l56-bridge/init.conf /usr/share/alsa/ucm2/conf.d/sun4i-codec/h616-audio-codec.conf /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-RB3Gen2.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/README.md /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-T14s.conf /usr/share/alsa/ucm2/conf.d/mt8183_da7219_r/mt8183_da7219_r.conf /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12-HiFi.conf /usr/share/alsa/ucm2/conf.d/simple-card/apalis-nau8822.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/x1e80100.conf /usr/share/alsa/ucm2/conf.d/sof-mt8390-evk/sof-mt8390-evk.conf /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/acp-da
 7219-rt5682-max98357.conf /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/colibri-imx6.conf /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx8x.conf /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/HiFi.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.13 [default] to 1.2.14 [default]
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.13" to "1.2.14"
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.13.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.14.tar.bz2"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98/acp3xalc5682m98.conf changed symlink target from ../../AMD/acp3xalc5682m98/acp3xalc5682m98.conf to ../../AMD/acp3x-alc5682-max98357/acp3x-alc5682-max98357.conf
  /usr/share/alsa/ucm2/conf.d/acpd7219m98357/acpd7219m98357.conf changed symlink target from ../../AMD/acpd7219m98357/acpd7219m98357.conf to ../../AMD/acp-da7219-rt5682-max98357/acp-da7219-rt5682-max98357.conf
  /usr/share/alsa/ucm2/Allwinner/sun4i-h616 was added
  /usr/share/alsa/ucm2/Allwinner/sun4i-h616/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015 was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/acp3x-alc5682-alc1015.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357 was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/acp3x-alc5682-max98357.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357 was added
  /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/acp-da7219-rt5682-max98357.conf was added
  /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/HiFi.conf was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_50mm_pm5_15_30_90deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_68mm_pm5_15_30_90deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_74mm_pm5_15_30_90deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_generic_pm10deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line4_pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/README.md was added
  /usr/share/alsa/ucm2/codecs/cs35l56 was added
  /usr/share/alsa/ucm2/codecs/cs35l56-bridge was added
  /usr/share/alsa/ucm2/codecs/cs35l56-bridge/init.conf was added
  /usr/share/alsa/ucm2/codecs/cs35l56/init.conf was added
  /usr/share/alsa/ucm2/codecs/cs42l43-dmic was added
  /usr/share/alsa/ucm2/codecs/cs42l43-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt1318 was added
  /usr/share/alsa/ucm2/codecs/rt1318/init.conf was added
  /usr/share/alsa/ucm2/common/ctl/led.conf was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682101 was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682101/acp3xalc5682101.conf was added
  /usr/share/alsa/ucm2/conf.d/amd-soundwire was added
  /usr/share/alsa/ucm2/conf.d/amd-soundwire/amd-soundwire.conf was added
  /usr/share/alsa/ucm2/conf.d/fsl-asoc-card was added
  /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/apalis-imx6.conf was added
  /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/colibri-imx6.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8183_da7219_r was added
  /usr/share/alsa/ucm2/conf.d/mt8183_da7219_r/mt8183_da7219_r.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8183_mt6358_t was added
  /usr/share/alsa/ucm2/conf.d/mt8183_mt6358_t/mt8183_mt6358_t.conf was added
  /usr/share/alsa/ucm2/conf.d/qcm6490 was added
  /usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs6490 was added
  /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-RB3Gen2.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/apalis-imx8.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/apalis-nau8822.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx7.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx8x.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/verdin-nau8822.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/verdin-wm8904.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8750 was added
  /usr/share/alsa/ucm2/conf.d/sm8750/SM8750-MTP.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8390-evk was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8390-evk/sof-mt8390-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sun4i-codec was added
  /usr/share/alsa/ucm2/conf.d/sun4i-codec/h616-audio-codec.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/x1e80100.conf was added
  /usr/share/alsa/ucm2/HDA/HiFi-mic.conf was added
  /usr/share/alsa/ucm2/Intel/sof-hda-dsp/dsp.conf was added
  /usr/share/alsa/ucm2/IO-Boards was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval-HiFi.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia-HiFi.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev-HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183 was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/mt8183_da7219_rt1015p.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357 was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357/mt8183_mt6358_ts3a227_max98357.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/sof/sof-mt8390-evk.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6 was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6 was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/apalis-imx6.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6 was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/colibri-imx6.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX7 was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7 was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/colibri-imx7.conf was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8 was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/apalis-imx8.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8X was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/colibri-imx8x.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490 was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/QCS6490-RB3Gen2.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/SM8750-MTP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-Slim-7x.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-T14s.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Slim7x-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/T14s-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/x1e80100.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i-gen4-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HyperX was added
  /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Presonus was added
  /usr/share/alsa/ucm2/USB-Audio/Presonus/Revelator-IO-44.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Presonus/Revelator-IO-44-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/TASCAM was added
  /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12.conf was added
  /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12-HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98 was removed
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.conf was removed
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf was removed
  /usr/share/alsa/ucm2/AMD/acpd7219m98357 was removed
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf was removed
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob was removed
  /usr/share/alsa/ucm2/HDA/HDA-Capture-value.conf was removed

--===============6013806578707338412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 468651 to 569864 (+22%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.blob /usr/share/alsa/ucm2/HDA/HDA-Capture-value.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.co
 nf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob", added "/usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.bin /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-RB3Gen2.conf /usr/share/alsa/ucm2/conf.d/simple-card/apalis-imx8.conf /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/init.conf /usr/share/alsa/ucm2/common/ctl/led.conf /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/colibri-imx6.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20.conf /usr/share/alsa/ucm2/conf.d/mt8183_mt6358_t/mt8183_mt6358_t.conf /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Slim7x-HiFi.conf /usr/share/alsa/ucm2/Intel/sof-hda-dsp/dsp.conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highp
 ass_50hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_generic_pm10deg_48khz.bin /usr/share/alsa/ucm2/codecs/cs42l43-dmic/init.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_74mm_pm5_15_30_90deg_48khz.bin /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval-HiFi.conf /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx7.conf /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/SM8750-MTP.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_50mm_pm5_15_30_90deg_48khz.bin /usr/share/alsa/ucm2/conf.d/x1e80100/x1e80100.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_68mm_pm5_15_30_90deg_48khz.bin /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/HiFi.conf
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/apalis-imx6.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_pass.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line4_pass.bin /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-T14s.conf /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/mt8183_da7219_rt1015p.conf /usr/share/alsa/ucm2/conf.d/simple-card/verdin-nau8822.conf /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx8x.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2-Hifi.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12.conf /usr/share/alsa/ucm2/conf.d/sm8750/SM8750-MTP.conf /usr/share/alsa/ucm2/conf.d/acp3xalc5682101/acp3xalc5682101.conf /usr/share/alsa/ucm2/conf.d/sof-mt8390-evk/sof-mt8390-evk.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/HiFi.conf /
 usr/share/alsa/ucm2/HDA/HiFi-mic.conf /usr/share/alsa/ucm2/Allwinner/sun4i-h616/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i-gen4-HiFi.conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/acp3x-alc5682-alc1015.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/sof/sof-mt8390-evk.conf /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast-HiFi.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast.conf /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/colibri-imx7.conf /usr/share/alsa/ucm2/conf.d/simple-card/verdin-wm8904.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-Slim-7x.conf /usr/share/alsa/ucm2/codecs/cs35l56/init.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/x1e80100.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev.conf /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture-HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.bin /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/colibri-imx6.conf /usr/s
 hare/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/apalis-imx8.conf /usr/share/alsa/ucm2/USB-Audio/Presonus/Revelator-IO-44.conf /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/HiFi.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval.conf /usr/share/alsa/ucm2/USB-Audio/Presonus/Revelator-IO-44-HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/README.md /usr/share/alsa/ucm2/conf.d/simple-card/apalis-nau8822.conf /usr/share/alsa/ucm2/codecs/cs35l56-bridge/init.conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/HiFi.conf /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/acp3x-alc5682-max98357.conf /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/apalis-imx6.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.bin /usr/share/alsa/ucm2/codecs/rt1318/init.conf /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.bin /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.bin /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.bin /usr/share/alsa/ucm2
 /blobs/sof/ipc4/eq_iir/pass.bin /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2.conf /usr/share/alsa/ucm2/conf.d/amd-soundwire/amd-soundwire.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/QCS6490-RB3Gen2.conf /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/HiFi.conf /usr/share/alsa/ucm2/conf.d/sun4i-codec/h616-audio-codec.conf /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12-HiFi.conf /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/colibri-imx8x.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20-HiFi.conf /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/acp-da7219-rt5682-max98357.conf /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357/mt8183_mt6358_ts3a227_max98357.conf /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II.conf /usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf /usr/share/alsa/ucm2/Qualcomm/x1e80
 100/T14s-HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.bin /usr/share/alsa/ucm2/conf.d/mt8183_da7219_r/mt8183_da7219_r.conf /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/HiFi.conf"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98/acp3xalc5682m98.conf changed symlink target from ../../AMD/acp3xalc5682m98/acp3xalc5682m98.conf to ../../AMD/acp3x-alc5682-max98357/acp3x-alc5682-max98357.conf
  /usr/share/alsa/ucm2/conf.d/acpd7219m98357/acpd7219m98357.conf changed symlink target from ../../AMD/acpd7219m98357/acpd7219m98357.conf to ../../AMD/acp-da7219-rt5682-max98357/acp-da7219-rt5682-max98357.conf
  /usr/share/alsa/ucm2/Allwinner/sun4i-h616 was added
  /usr/share/alsa/ucm2/Allwinner/sun4i-h616/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015 was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/acp3x-alc5682-alc1015.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-alc1015/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357 was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/acp3x-alc5682-max98357.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-alc5682-max98357/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357 was added
  /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/acp-da7219-rt5682-max98357.conf was added
  /usr/share/alsa/ucm2/AMD/acp-da7219-rt5682-max98357/HiFi.conf was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_50mm_pm5_15_30_90deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_68mm_pm5_15_30_90deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_74mm_pm5_15_30_90deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_generic_pm10deg_48khz.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line2_pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/line4_pass.bin was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/tdfb/README.md was added
  /usr/share/alsa/ucm2/codecs/cs35l56 was added
  /usr/share/alsa/ucm2/codecs/cs35l56-bridge was added
  /usr/share/alsa/ucm2/codecs/cs35l56-bridge/init.conf was added
  /usr/share/alsa/ucm2/codecs/cs35l56/init.conf was added
  /usr/share/alsa/ucm2/codecs/cs42l43-dmic was added
  /usr/share/alsa/ucm2/codecs/cs42l43-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt1318 was added
  /usr/share/alsa/ucm2/codecs/rt1318/init.conf was added
  /usr/share/alsa/ucm2/common/ctl/led.conf was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682101 was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682101/acp3xalc5682101.conf was added
  /usr/share/alsa/ucm2/conf.d/amd-soundwire was added
  /usr/share/alsa/ucm2/conf.d/amd-soundwire/amd-soundwire.conf was added
  /usr/share/alsa/ucm2/conf.d/fsl-asoc-card was added
  /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/apalis-imx6.conf was added
  /usr/share/alsa/ucm2/conf.d/fsl-asoc-card/colibri-imx6.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8183_da7219_r was added
  /usr/share/alsa/ucm2/conf.d/mt8183_da7219_r/mt8183_da7219_r.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8183_mt6358_t was added
  /usr/share/alsa/ucm2/conf.d/mt8183_mt6358_t/mt8183_mt6358_t.conf was added
  /usr/share/alsa/ucm2/conf.d/qcm6490 was added
  /usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs6490 was added
  /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-RB3Gen2.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/apalis-imx8.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/apalis-nau8822.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx7.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/colibri-imx8x.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/verdin-nau8822.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/verdin-wm8904.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8750 was added
  /usr/share/alsa/ucm2/conf.d/sm8750/SM8750-MTP.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8390-evk was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8390-evk/sof-mt8390-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sun4i-codec was added
  /usr/share/alsa/ucm2/conf.d/sun4i-codec/h616-audio-codec.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/x1e80100.conf was added
  /usr/share/alsa/ucm2/HDA/HiFi-mic.conf was added
  /usr/share/alsa/ucm2/Intel/sof-hda-dsp/dsp.conf was added
  /usr/share/alsa/ucm2/IO-Boards was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/apalis/eval-HiFi.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dahlia-HiFi.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/verdin/dev-HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183 was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_da7219_rt1015p/mt8183_da7219_rt1015p.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357 was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8183/mt8183_mt6358_ts3a227_max98357/mt8183_mt6358_ts3a227_max98357.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/sof/sof-mt8390-evk.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6 was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6 was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/apalis-imx6.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/apalis-imx6/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6 was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/colibri-imx6.conf was added
  /usr/share/alsa/ucm2/NXP/iMX6/Toradex/colibri-imx6/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX7 was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7 was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/colibri-imx7.conf was added
  /usr/share/alsa/ucm2/NXP/iMX7/Toradex/colibri-imx7/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8 was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/apalis-imx8.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8/Toradex/apalis-imx8/HiFi.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8X was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/colibri-imx8x.conf was added
  /usr/share/alsa/ucm2/NXP/iMX8X/Toradex/colibri-imx8x/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490 was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/QCS6490-RB3Gen2.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8750/MTP/SM8750-MTP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-Slim-7x.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/LENOVO-T14s.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Slim7x-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/T14s-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/x1e80100.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-18i20-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i-gen4-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HyperX was added
  /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HyperX/SoloCast-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Presonus was added
  /usr/share/alsa/ucm2/USB-Audio/Presonus/Revelator-IO-44.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Presonus/Revelator-IO-44-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-II-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCastXV2-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/Quad-Capture-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/TASCAM was added
  /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12.conf was added
  /usr/share/alsa/ucm2/USB-Audio/TASCAM/Model12-HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98 was removed
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.conf was removed
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf was removed
  /usr/share/alsa/ucm2/AMD/acpd7219m98357 was removed
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf was removed
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob was removed
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob was removed
  /usr/share/alsa/ucm2/HDA/HDA-Capture-value.conf was removed

--===============6013806578707338412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.13-1.2.14.patch"

RnJvbSBlOTRmNzZkMDg5ZGMwMGQxNzY2YjdkZjY3NGI4OWFjNjc1M2ZiMThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTA6NDE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXVjbS1jb25mOiB1cGdyYWRlIDEuMi4xMyAtPiAxLjIuMTQKCi0tLQogLi4uL2Fsc2Eve2Fs
c2EtdWNtLWNvbmZfMS4yLjEzLmJiID0+IGFsc2EtdWNtLWNvbmZfMS4yLjE0LmJifSAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11Y20tY29uZl8xLjIuMTMuYmIgPT4g
YWxzYS11Y20tY29uZl8xLjIuMTQuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4xMy5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTQuYmIKc2ltaWxhcml0eSBpbmRleCA4
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25m
XzEuMi4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVj
bS1jb25mXzEuMi4xNC5iYgppbmRleCAxY2JhMDhiOTdhLi5kOWVmODMxOTM3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjEzLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTQuYmIK
QEAgLTgsNyArOCw3IEBAIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjBkNzRkNzRkYjk3NDE2OTc5MDMzNzJhZDAwMWQzYjQi
CiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvbGli
LyR7QlB9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDQ4M2I2ZTM5ODNjY2EwOGZk
MzI2YTczZmJhZTQ0OWI1MDM2ZTQ0NGZiMWEwN2MwZGVlNzRiNTA0YjdhYjVhZiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIzMmU5ODA5ZjU5MmQ5MmI5NzhhYTEwMzJlMzUyOTNjMzNiOGQwZjFlYzQ3
NWY5MzcwMjJjM2VlOWEzMDY5YzIxIgogIyBTb21ldGhpbmcgd2VudCB3cm9uZyBhdCB1cHN0cmVh
bSB0YXJiYWxsaW5nCiAKIGluaGVyaXQgYWxsYXJjaAotLSAKMi40Ny4xCgo=

--===============6013806578707338412==--

