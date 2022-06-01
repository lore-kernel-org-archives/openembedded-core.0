Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB1ACCA479
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.622.1654100324929926854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IdM4V7M1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181200fef07-33a8c3fe-dfda-4ff4-b88b-c86752ded7e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5mvESThG5zWnyxyl2DoSgRgrDe80jm912C3RyvIahJI=;
	b=IdM4V7M1B2LBsgb6IpW0anBkUsDXHxo94osbJ39NksIJHkg2MdB4UYF4qPyEp0oj
	XA3UeYKqgsNzB1rz+O007tXy2iTvWcVqdXYQP9vfmreYwm5X0/kGf13zJ7Bive9Na0f
	QiQSZrhw75DP7hwV9TM7H2zlt9EwSzI+h+1R7nec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5mvESThG5zWnyxyl2DoSgRgrDe80jm912C3RyvIahJI=;
	b=IR81netkOffnwT/+sRMVrQ/Qo1yJJWP2l9kwaWMyHi/jdspEko9pdAt/viTfYqow
	zrOrLHxzpf39+r46FkiCXMWrqithrMCr/rp5j4vEiQaO8/7eY0TaBWl7k++kWMMLrKd
	HKY+bfghCw7MYm6HQlKBNuG74yL2iRdxClOM4OQQ=
Content-Type: multipart/mixed; boundary="===============2347489079224542071=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.7 SUCCEEDED
Message-ID: 
 <01010181200fef07-33a8c3fe-dfda-4ff4-b88b-c86752ded7e4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166427

--===============2347489079224542071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-ucm-conf* to *1.2.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.6.3-1.2.7.patch
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
--===============2347489079224542071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.6.3 [default] to 1.2.7 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.6.3" to "1.2.7"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/conf.d/sof-essx8336/sof-essx8336.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf /usr/share/alsa/ucm2/conf.d/acp6x/acp6x.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44.conf /usr/share/alsa/ucm2/common/ctl/remap.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD.conf /usr/share/alsa/ucm2/common/pcm/split.conf /usr/share/alsa/ucm2/Intel/sof-essx8336/sof-essx8336.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080.conf /usr/share/alsa/ucm2/Intel/sof-essx8336/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf /usr/share/alsa/ucm2/Intel/sof-essx8336/Hdmi.conf /usr/share/alsa/ucm2/common/direct.conf /usr/share/alsa/ucm2/conf.d/simple-card/rockchip,es8316-codec.conf /usr/share/alsa/ucm2/U
 SB-Audio/Arturia/Minifuse-2.conf /usr/share/alsa/ucm2/common/direct-verb.conf /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.6.3 [default] to 1.2.7 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 210719 to 237379 (+13%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.6.3" to "1.2.7"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.6.3 [default] to 1.2.7 [default]
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.6.3.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.7.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.6.3" to "1.2.7"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/common/ctl was added
  /usr/share/alsa/ucm2/common/ctl/remap.conf was added
  /usr/share/alsa/ucm2/common/direct.conf was added
  /usr/share/alsa/ucm2/common/direct-verb.conf was added
  /usr/share/alsa/ucm2/common/pcm was added
  /usr/share/alsa/ucm2/common/pcm/split.conf was added
  /usr/share/alsa/ucm2/conf.d/acp6x was added
  /usr/share/alsa/ucm2/conf.d/acp6x/acp6x.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/rockchip,es8316-codec.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-essx8336 was added
  /usr/share/alsa/ucm2/conf.d/sof-essx8336/sof-essx8336.conf was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336 was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336/Hdmi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336/HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336/sof-essx8336.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44-HiFi.conf was added

--===============2347489079224542071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 210719 to 237379 (+13%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/Intel/sof-essx8336/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf /usr/share/alsa/ucm2/conf.d/sof-essx8336/sof-essx8336.conf /usr/share/alsa/ucm2/common/pcm/split.conf /usr/share/alsa/ucm2/conf.d/acp6x/acp6x.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf /usr/share/alsa/ucm2/conf.d/simple-card/rockchip,es8316-codec.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2.conf /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD-HiFi.conf /usr/share/alsa/ucm2/common/direct-verb.conf /usr/share/alsa/ucm2/common/direct.conf /usr/share/alsa/ucm2/common/ctl/remap.conf /usr/share/alsa/ucm2/Intel/sof-essx8336/Hdmi.conf /usr/share/alsa/ucm2/USB-Audio
 /Steinberg/UR44.conf /usr/share/alsa/ucm2/Intel/sof-essx8336/sof-essx8336.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44-HiFi.conf"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/common/ctl was added
  /usr/share/alsa/ucm2/common/ctl/remap.conf was added
  /usr/share/alsa/ucm2/common/direct.conf was added
  /usr/share/alsa/ucm2/common/direct-verb.conf was added
  /usr/share/alsa/ucm2/common/pcm was added
  /usr/share/alsa/ucm2/common/pcm/split.conf was added
  /usr/share/alsa/ucm2/conf.d/acp6x was added
  /usr/share/alsa/ucm2/conf.d/acp6x/acp6x.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/rockchip,es8316-codec.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-essx8336 was added
  /usr/share/alsa/ucm2/conf.d/sof-essx8336/sof-essx8336.conf was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336 was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336/Hdmi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336/HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-essx8336/sof-essx8336.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC204HD-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44-HiFi.conf was added

--===============2347489079224542071==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.6.3-1.2.7.patch"

From b1753137db889e8d465c79d172ee6cd4a1475a95 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 14:27:33 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.6.3 -> 1.2.7

---
 .../alsa/{alsa-ucm-conf_1.2.6.3.bb => alsa-ucm-conf_1.2.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.6.3.bb => alsa-ucm-conf_1.2.7.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
index a493269063..d60f22e7c7 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b8a03aa387a624a2f65edc201bf777421190b60529a92087646823afbd96c5cd"
+SRC_URI[sha256sum] = "b97f2395ca2c1fd9bfab7627f0178f9069868e2a42a35894dacd280e7e40680e"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.31.1


--===============2347489079224542071==--

