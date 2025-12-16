Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB20BD5E36F
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17385.1765872131800834005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KDOwHh9w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TL1Wzzr7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ede14-0e579b80-e8d3-48a3-ad27-9dd220200c42-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9oL6YN/g/Jmlz0w4wC7prZKe9B27L255IcWxBJArsF0=;
	b=KDOwHh9wgxE0ZJFGfMau+7sHad9fna/GNqKAPR8y3lyeKD0+246oMH1zPCHhcCNE
	2P1IiHzH6W/IHsCF27HXcC8KOFn3RhCyaGk2SQxSxayV+RqghLDonzS2Pn+V2xezjef
	UrU96UAjxC40jnoZ2bRC/+XrznfsAhfq83hKx0gA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9oL6YN/g/Jmlz0w4wC7prZKe9B27L255IcWxBJArsF0=;
	b=TL1Wzzr7BqRLDgCX1vUdXK/K9E4Mobzvwsb8Yx1iCiUeD8rIscYakQZhG75xa5Kh
	XvsMrQQnL401FAoRyWjtapriatHhoR/hnvgnPeObXEvGLXa9LA344R9jLCxdHg23X2A
	+iZEPfKPB33eOS4855GNmUoT8V2u1AXfZBLtuhb8=
Content-Type: multipart/mixed; boundary="===============0696321288934289078=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.15 SUCCEEDED
Message-ID: <0101019b262ede14-0e579b80-e8d3-48a3-ad27-9dd220200c42-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227890

--===============0696321288934289078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-ucm-conf* to *1.2.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.14-1.2.15.patch
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
From b628d299252c25c16ca6f0f788ea76c8c70cb076 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:53:24 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.14 -> 1.2.15

---
 .../alsa/{alsa-ucm-conf_1.2.14.bb => alsa-ucm-conf_1.2.15.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.14.bb => alsa-ucm-conf_1.2.15.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
index d9ef831937..1eaec98e3b 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "32e9809f592d92b978aa1032e35293c33b8d0f1ec475f937022c3ee9a3069c21"
+SRC_URI[sha256sum] = "5510cb0947a3bb877b5ce218e3ecedd78bfa6643e372346c87d93d4844a45ffa"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.47.1


--===============0696321288934289078==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.14-1.2.15.patch"

RnJvbSBiNjI4ZDI5OTI1MmMyNWMxNmNhNmYwZjc4OGVhNzZjOGM3MGNiMDc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6NTM6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXVjbS1jb25mOiB1cGdyYWRlIDEuMi4xNCAtPiAxLjIuMTUKCi0tLQogLi4uL2Fsc2Eve2Fs
c2EtdWNtLWNvbmZfMS4yLjE0LmJiID0+IGFsc2EtdWNtLWNvbmZfMS4yLjE1LmJifSAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11Y20tY29uZl8xLjIuMTQuYmIgPT4g
YWxzYS11Y20tY29uZl8xLjIuMTUuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4xNC5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTUuYmIKc2ltaWxhcml0eSBpbmRleCA4
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25m
XzEuMi4xNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVj
bS1jb25mXzEuMi4xNS5iYgppbmRleCBkOWVmODMxOTM3Li4xZWFlYzk4ZTNiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjE0LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTUuYmIK
QEAgLTgsNyArOCw3IEBAIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjBkNzRkNzRkYjk3NDE2OTc5MDMzNzJhZDAwMWQzYjQi
CiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvbGli
LyR7QlB9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzJlOTgwOWY1OTJkOTJiOTc4
YWExMDMyZTM1MjkzYzMzYjhkMGYxZWM0NzVmOTM3MDIyYzNlZTlhMzA2OWMyMSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI1NTEwY2IwOTQ3YTNiYjg3N2I1Y2UyMThlM2VjZWRkNzhiZmE2NjQzZTM3
MjM0NmM4N2Q5M2Q0ODQ0YTQ1ZmZhIgogIyBTb21ldGhpbmcgd2VudCB3cm9uZyBhdCB1cHN0cmVh
bSB0YXJiYWxsaW5nCiAKIGluaGVyaXQgYWxsYXJjaAotLSAKMi40Ny4xCgo=

--===============0696321288934289078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: directory renamed /usr/share/alsa/ucm2/codecs/rt713-sdca -> /usr/share/alsa/ucm2/codecs/rt713, removed "/usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf /usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf", added "/usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-HiFi-0008.conf /usr/share/alsa/ucm2/codecs/cs42l45-dmic/init.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic.conf /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/Kaanapali-MTP.conf /usr/share/alsa/ucm2/Qualcomm/qcs615/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Latitude7455-HiFi.conf /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-Radxa-Dragon-Q6A.conf /usr/share/alsa/ucm2/conf.d/x1e80100/TUXEDO-TUXEDOElite14Gen1-2.0-TXEM14QX4NM.conf /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/HiFi.conf /usr/share/alsa/ucm2/MediaTek/
 sof-mt8395-evk/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/init.conf /usr/share/alsa/ucm2/MediaTek/mt8391-evk/init.conf /usr/share/alsa/ucm2/MediaTek/mt8196-sof/init.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/qcs615/TALOS-EVK.conf /usr/share/alsa/ucm2/codecs/da7213/init.conf /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/TUXEDO-Elite-14.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E001DE-DEVKIT.conf /usr/share/alsa/ucm2/USB-Audio/HP/Thunderbolt-Dock-Audio-Headset.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII-HiFi.conf /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-0008.conf /usr/share/alsa/ucm2/codecs/pm4125/LineoutEnableSeq.conf /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-EVK.conf /usr/shar
 e/alsa/ucm2/Qualcomm/x1e80100/X1E80100-EVK.conf /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/MONACO-EVK.conf /usr/share/alsa/ucm2/conf.d/qcm6490/qcm6490-idp-snd-card.conf /usr/share/alsa/ucm2/conf.d/qcs8300/MONACO-EVK.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l45.conf /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Sony/DualSense-PS5-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/QCS6490-Radxa-Dragon-Q6A.conf /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO-HiFi.conf /usr/share/alsa/ucm2/conf.d/sof-mt8365-evk/sof-mt8365-evk.conf /usr/share/alsa/ucm2/conf.d/sof-mt8395-evk/sof-mt8395-evk.conf /usr/share/alsa/ucm2/USB-Audio/Sony/DualSense-PS5.conf /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/qcm6490-idp-snd-card.conf /usr/share/alsa/uc
 m2/codecs/da7213/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/conf.d/qcs615/TALOS-EVK.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf /usr/share/alsa/ucm2/conf.d/simple-card/tdx-smarc-wm8904.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/sof-mt8365-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/SOF.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Dell-Latitude-7455.conf /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO.conf /usr/share/alsa/ucm2/MediaTek/mt8391-evk/HiFi.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLEnableSeq.conf /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk/sof-mt8395-evk.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev.conf /usr/share/alsa/ucm2/conf.d/sa8775p/LEMANS-EVK.conf /usr/share/alsa/ucm2/conf.d/mt8391-evk/mt8391-evk.conf /usr/share/alsa/ucm2/codecs/rt721/init.conf /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/co
 decs/pm4125/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/codecs/pm4125/LineoutDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt712+rt1320.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-HiFi.conf /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Channels.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l45-dmic.conf /usr/share/alsa/ucm2/codecs/da7213/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt713.conf /usr/share/alsa/ucm2/sof-soundwire/rt721.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLDisableSeq.conf /usr/share/alsa/ucm2/conf.d/x1e80100/X1E001DE-DEVKIT.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Elite-14-HiFi.conf /usr/share/alsa/ucm2/conf.d/simple-card/aquila-wm8904.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev-HiFi.conf /usr/share/alsa/ucm2/I
 O-Boards/Toradex/smarc/dev.conf /usr/share/alsa/ucm2/MediaTek/mt8391-evk/mt8391-evk.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Link-HiFi.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc/dev-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/HP/Thunderbolt-Dock-Audio-Headset-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/LEMANS-EVK.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/MICROSOFT-Surface-Pro-12in.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/DEVKIT-HiFi.conf /usr/share/alsa/ucm2/conf.d/kaanapali/Kaanapali-MTP.conf /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/sof-mt8196-nau8825-nau8318.conf /usr/share/alsa/ucm2/conf.d/sof-mt8196-nau8/sof-mt8196-nau8825.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 569864 to 640615 (+12%)
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/cs42l45-dmic was added
  /usr/share/alsa/ucm2/codecs/cs42l45-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/da7213 was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/init.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125 was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/LineoutDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/LineoutEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/rt713 was added
  /usr/share/alsa/ucm2/codecs/rt713/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt721 was added
  /usr/share/alsa/ucm2/codecs/rt721/init.conf was added
  /usr/share/alsa/ucm2/conf.d/kaanapali was added
  /usr/share/alsa/ucm2/conf.d/kaanapali/Kaanapali-MTP.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8391-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8391-evk/mt8391-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/qcm6490/qcm6490-idp-snd-card.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs615 was added
  /usr/share/alsa/ucm2/conf.d/qcs615/TALOS-EVK.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-Radxa-Dragon-Q6A.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs8300 was added
  /usr/share/alsa/ucm2/conf.d/qcs8300/MONACO-EVK.conf was added
  /usr/share/alsa/ucm2/conf.d/sa8775p was added
  /usr/share/alsa/ucm2/conf.d/sa8775p/LEMANS-EVK.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/aquila-wm8904.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/tdx-smarc-wm8904.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8196-nau8 was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8196-nau8/sof-mt8196-nau8825.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8365-evk was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8365-evk/sof-mt8365-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8395-evk was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8395-evk/sof-mt8395-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/TUXEDO-TUXEDOElite14Gen1-2.0-TXEM14QX4NM.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/X1E001DE-DEVKIT.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-EVK.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev-HiFi.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc/dev.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc/dev-HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318 was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/sof-mt8196-nau8825-nau8318.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/SOF.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/sof-mt8365-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk/mt8391-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk was added
  /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk/sof-mt8395-evk.conf was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/Kaanapali-MTP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/qcm6490-idp-snd-card.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs615 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs615/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs615/TALOS-EVK.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/QCS6490-Radxa-Dragon-Q6A.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/MONACO-EVK.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/LEMANS-EVK.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Dell-Latitude-7455.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/DEVKIT-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Elite-14-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Latitude7455-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/MICROSOFT-Surface-Pro-12in.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/TUXEDO-Elite-14.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E001DE-DEVKIT.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E80100-EVK.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l45.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l45-dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt712+rt1320.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt713.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt721.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-0008.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-HiFi-0008.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Channels.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Link-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HP was added
  /usr/share/alsa/ucm2/USB-Audio/HP/Thunderbolt-Dock-Audio-Headset.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HP/Thunderbolt-Dock-Audio-Headset-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/DualSense-PS5.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/DualSense-PS5-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Teufel was added
  /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO-HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/rt713-sdca was removed
  /usr/share/alsa/ucm2/codecs/rt713-sdca/init.conf was removed
  /usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf was removed
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf was removed

--===============0696321288934289078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.14 [default] to 1.2.15 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.14" to "1.2.15"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: directory renamed /usr/share/alsa/ucm2/codecs/rt713-sdca -> /usr/share/alsa/ucm2/codecs/rt721, removed "/usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf /usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf", added "/usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev.conf /usr/share/alsa/ucm2/Qualcomm/qcs615/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf /usr/share/alsa/ucm2/codecs/da7213/init.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX.conf /usr/share/alsa/ucm2/conf.d/sa8775p/LEMANS-EVK.conf /usr/share/alsa/ucm2/Qualcomm/qcs615/TALOS-EVK.conf /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/sof-mt8365-evk.conf /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-Radxa-Drag
 on-Q6A.conf /usr/share/alsa/ucm2/codecs/cs42l45-dmic/init.conf /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/MediaTek/mt8196-sof/init.conf /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/init.conf /usr/share/alsa/ucm2/MediaTek/mt8391-evk/init.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic.conf /usr/share/alsa/ucm2/codecs/pm4125/LineoutEnableSeq.conf /usr/share/alsa/ucm2/codecs/pm4125/LineoutDisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Link-HiFi.conf /usr/share/alsa/ucm2/conf.d/simple-card/aquila-wm8904.conf /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/sof-mt8196-nau8825-nau8318.conf /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk/sof-mt8395-evk.conf /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-EVK.conf /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/HP/Thu
 nderbolt-Dock-Audio-Headset-HiFi.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc/dev-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/LEMANS-EVK.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/qcm6490-idp-snd-card.conf /usr/share/alsa/ucm2/sof-soundwire/rt712+rt1320.conf /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc/dev.conf /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/HiFi.conf /usr/share/alsa/ucm2/conf.d/qcm6490/qcm6490-idp-snd-card.conf /usr/share/alsa/ucm2/conf.d/sof-mt8365-evk/sof-mt8365-evk.conf /usr/share/alsa/ucm2/conf.d/sof-mt8395-evk/sof-mt8395-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8391-evk/mt8391-evk.conf /usr/share/alsa/ucm2/conf.d/x1e80100/X1E001DE-DEVKIT.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio.conf /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/TUXEDO-Elite-14.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E80100-EVK.con
 f /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev-HiFi.conf /usr/share/alsa/ucm2/conf.d/x1e80100/TUXEDO-TUXEDOElite14Gen1-2.0-TXEM14QX4NM.conf /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/DEVKIT-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/Kaanapali-MTP.conf /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/SOF.conf /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/HiFi.conf /usr/share/alsa/ucm2/codecs/rt713/init.conf /usr/share/alsa/ucm2/codecs/da7213/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/conf.d/simple-card/tdx-smarc-wm8904.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Latitude7455-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-HiFi-0008.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/HP/Thunderbolt-Dock-Audio-Headset.conf /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l45-dmic.conf /usr/share/a
 lsa/ucm2/USB-Audio/Sony/DualSense-PS5-HiFi.conf /usr/share/alsa/ucm2/conf.d/sof-mt8196-nau8/sof-mt8196-nau8825.conf /usr/share/alsa/ucm2/MediaTek/mt8391-evk/HiFi.conf /usr/share/alsa/ucm2/conf.d/mt8391-evk/mt8391-evk.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB2-HiFi.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLEnableSeq.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII.conf /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/MONACO-EVK.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Dell-Latitude-7455.conf /usr/share/alsa/ucm2/conf.d/kaanapali/Kaanapali-MTP.conf /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E001DE-DEVKIT.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-0008.conf /usr/share/alsa/ucm2/codecs/da7213/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/codec
 s/pm4125/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/MICROSOFT-Surface-Pro-12in.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/Elite-14-HiFi.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLDisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Sony/DualSense-PS5.conf /usr/share/alsa/ucm2/sof-soundwire/rt713.conf /usr/share/alsa/ucm2/sof-soundwire/rt721.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l45.conf /usr/share/alsa/ucm2/conf.d/qcs8300/MONACO-EVK.conf /usr/share/alsa/ucm2/conf.d/qcs615/TALOS-EVK.conf /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Channels.conf /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/QCS6490-Radxa-Dragon-Q6A.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 569864 to 640615 (+12%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.14 [default] to 1.2.15 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.14" to "1.2.15"
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.14.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.15.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.14 [default] to 1.2.15 [default]
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.14" to "1.2.15"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/cs42l45-dmic was added
  /usr/share/alsa/ucm2/codecs/cs42l45-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/da7213 was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/da7213/init.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125 was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/LineoutDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/pm4125/LineoutEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/HeadphoneLEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/rt713 was added
  /usr/share/alsa/ucm2/codecs/rt713/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt721 was added
  /usr/share/alsa/ucm2/codecs/rt721/init.conf was added
  /usr/share/alsa/ucm2/conf.d/kaanapali was added
  /usr/share/alsa/ucm2/conf.d/kaanapali/Kaanapali-MTP.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8391-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8391-evk/mt8391-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/qcm6490/qcm6490-idp-snd-card.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs615 was added
  /usr/share/alsa/ucm2/conf.d/qcs615/TALOS-EVK.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs6490/QCS6490-Radxa-Dragon-Q6A.conf was added
  /usr/share/alsa/ucm2/conf.d/qcs8300 was added
  /usr/share/alsa/ucm2/conf.d/qcs8300/MONACO-EVK.conf was added
  /usr/share/alsa/ucm2/conf.d/sa8775p was added
  /usr/share/alsa/ucm2/conf.d/sa8775p/LEMANS-EVK.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/aquila-wm8904.conf was added
  /usr/share/alsa/ucm2/conf.d/simple-card/tdx-smarc-wm8904.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8196-nau8 was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8196-nau8/sof-mt8196-nau8825.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8365-evk was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8365-evk/sof-mt8365-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8395-evk was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8395-evk/sof-mt8395-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/TUXEDO-TUXEDOElite14Gen1-2.0-TXEM14QX4NM.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/X1E001DE-DEVKIT.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-EVK.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/aquila/dev-HiFi.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc/dev.conf was added
  /usr/share/alsa/ucm2/IO-Boards/Toradex/smarc/dev-HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318 was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8196-sof/nau8825-nau8318/sof-mt8196-nau8825-nau8318.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/SOF.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8365-evk/sof/sof-mt8365-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8391-evk/mt8391-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk was added
  /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/sof-mt8395-evk/sof-mt8395-evk.conf was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/kaanapali/MTP/Kaanapali-MTP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/qcm6490-idp-snd-card.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs615 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs615/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs615/TALOS-EVK.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs6490/QCS6490-Radxa-Dragon-Q6A/QCS6490-Radxa-Dragon-Q6A.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300 was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/qcs8300/monaco-evk/MONACO-EVK.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sa8775p/lemans-evk/LEMANS-EVK.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Dell-Latitude-7455.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/DEVKIT-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Elite-14-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Latitude7455-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/MICROSOFT-Surface-Pro-12in.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/TUXEDO-Elite-14.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E001DE-DEVKIT.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E80100-EVK.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l45.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l45-dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt712+rt1320.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt713.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt721.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-0008.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD14-HiFi-0008.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Mic-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Channels.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB1-Link-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Beacn/Beacn-Studio-USB2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HP was added
  /usr/share/alsa/ucm2/USB-Audio/HP/Thunderbolt-Dock-Audio-Headset.conf was added
  /usr/share/alsa/ucm2/USB-Audio/HP/Thunderbolt-Dock-Audio-Headset-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX.conf was added
  /usr/share/alsa/ucm2/USB-Audio/RME/Fireface-UCX-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/DualSense-PS5.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Sony/DualSense-PS5-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR22mkII-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Teufel was added
  /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Teufel/CAGE-PRO-HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/rt713-sdca was removed
  /usr/share/alsa/ucm2/codecs/rt713-sdca/init.conf was removed
  /usr/share/alsa/ucm2/conf.d/qcm6490/QCM6490-IDP.conf was removed
  /usr/share/alsa/ucm2/Qualcomm/qcm6490/QCM6490-IDP/QCM6490-IDP.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf was removed

--===============0696321288934289078==--

