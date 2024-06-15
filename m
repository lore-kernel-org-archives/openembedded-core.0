Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C7EC2D0D1
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.18392.1718475800728671384
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ICcicahO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=20Nzl3Xr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101901d23beb0-b6ae5d54-7f84-4abe-ba14-0073a5861c6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KnPf9CeX9zo7ri9dqf4BRAfa4nyIIsBKm4wvvjcn4Vo=;
	b=ICcicahOZspIroUTeJJ+CtVFwpY2hQAHllzrK9uim6LfouYOjvlVEG4N8u3pxj2L
	rmXCxL7ZymJekup/vsLhV44VXcKlpnGsqndwkTDxMg+XcZDN8xyc3s8v56zUj2Xaqok
	+1tEq1CXa6ZDB/5ZL7O5tmFUz5XsOGrZnfLrZF1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KnPf9CeX9zo7ri9dqf4BRAfa4nyIIsBKm4wvvjcn4Vo=;
	b=20Nzl3XrqQ9MrMfGPC7tQbeDYP5I2TQWL0nyc6rLA7oteCNqnnmFpAKSBZWCHWNI
	FsfYFr2UoixVXje1tuHSUWEy6AQ4qRnrGQSehSxILYMFmsYk054qnz5V8GmKp0KdDv1
	PhulHtdZEmIS+iLOgEtZ21YqKHzXr+KhRp6NN7As=
Content-Type: multipart/mixed; boundary="===============4210728783088054165=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.12 SUCCEEDED
Message-ID: <010101901d23beb0-b6ae5d54-7f84-4abe-ba14-0073a5861c6e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200747

--===============4210728783088054165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-ucm-conf* to *1.2.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.11-1.2.12.patch
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
From a8bf5ae1230f52a16b7c5994246f9a4f26487a0f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 15:03:01 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.11 -> 1.2.12

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
2.44.0


--===============4210728783088054165==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.11-1.2.12.patch"

RnJvbSBhOGJmNWFlMTIzMGY1MmExNmI3YzU5OTQyNDZmOWE0ZjI2NDg3YTBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTU6MDM6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXVjbS1jb25mOiB1cGdyYWRlIDEuMi4xMSAtPiAxLjIuMTIKCi0tLQogLi4uL2Fsc2Eve2Fs
c2EtdWNtLWNvbmZfMS4yLjExLmJiID0+IGFsc2EtdWNtLWNvbmZfMS4yLjEyLmJifSAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11Y20tY29uZl8xLjIuMTEuYmIgPT4g
YWxzYS11Y20tY29uZl8xLjIuMTIuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4xMS5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA4
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25m
XzEuMi4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVj
bS1jb25mXzEuMi4xMi5iYgppbmRleCBjZTFhNDJjOWI4Li44OGI0M2MzNDViIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjExLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTIuYmIK
QEAgLTgsNyArOCw3IEBAIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjBkNzRkNzRkYjk3NDE2OTc5MDMzNzJhZDAwMWQzYjQi
CiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvbGli
LyR7QlB9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzg3YzAxY2YzMGUyYTE2NzZk
N2I4ZjcyYjI2ODFjZjIxOWFiY2E3MGRkMWVjMmE5ZTMzYWRkNWJmM2ZlYWU4MSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIxNjhlN2MwNTQ5YjdiZjg5OTEwOTJmYTJiZmI5MDM2MzFkZjc3OWRjNGM0
M2VlOGY0Mjc3ZmNiNzcyZDhjMDM1IgogIyBTb21ldGhpbmcgd2VudCB3cm9uZyBhdCB1cHN0cmVh
bSB0YXJiYWxsaW5nCiAKIGluaGVyaXQgYWxsYXJjaAotLSAKMi40NC4wCgo=

--===============4210728783088054165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/codecs/wcd937x/init.conf /usr/share/alsa/ucm2/codecs/rt722/init.conf /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/common/pcm/hdmi.conf /usr/share/alsa/ucm2/conf.d/SC7180/sc7180-adau7002-max98357a.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l43-spk.conf /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/sc7180-adau7002-max98357a.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/spe
 aker_default.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/README.md /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/README.md /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/README.md /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/README.md /usr/share/alsa/ucm2/conf.d/sof-m8195_r1019/sof-m8195_r1019_5682s.conf /usr/share/alsa/ucm2/sof-soundwire/rt722.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob /usr/share/alsa/ucm2/blobs/sof/product_configs/AAEON/UPX-TGL01.conf /usr/share/alsa/ucm2/Intel/sof-hda-dsp/HiFi-sof.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/README.md"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/blobs was added
  /usr/share/alsa/ucm2/blobs/sof was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3 was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4 was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/product_configs was added
  /usr/share/alsa/ucm2/blobs/sof/product_configs/AAEON was added
  /usr/share/alsa/ucm2/blobs/sof/product_configs/AAEON/UPX-TGL01.conf was added
  /usr/share/alsa/ucm2/codecs/rt722 was added
  /usr/share/alsa/ucm2/codecs/rt722/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/init.conf was added
  /usr/share/alsa/ucm2/common/pcm/hdmi.conf was added
  /usr/share/alsa/ucm2/conf.d/SC7180/sc7180-adau7002-max98357a.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-m8195_r1019 was added
  /usr/share/alsa/ucm2/conf.d/sof-m8195_r1019/sof-m8195_r1019_5682s.conf was added
  /usr/share/alsa/ucm2/Intel/sof-hda-dsp/HiFi-sof.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a was added
  /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/sc7180-adau7002-max98357a.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l43-spk.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt722.conf was added

--===============4210728783088054165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.11 [default] to 1.2.12 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.11" to "1.2.12"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 398584 to 415059 (+4%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.11 [default] to 1.2.12 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/blobs/sof/product_configs/AAEON/UPX-TGL01.conf /usr/share/alsa/ucm2/common/pcm/hdmi.conf /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob /usr/share/alsa/ucm2/sof-soundwire/rt722.conf /usr/share/alsa/ucm2/Intel/sof-hda-dsp/HiFi-sof.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l43-spk.conf /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/HiFi.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob /usr/share/alsa/ucm2/codecs/rt722/init.conf /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/sc7180-adau7002-max98357a.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/README.md /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/README.md /usr/share/alsa/ucm2/blobs/sof/ipc
 3/eq_iir/README.md /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/README.md /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob /usr/share/alsa/ucm2/conf.d/sof-m8195_r1019/sof-m8195_r1019_5682s.conf /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/README.md /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.blob /usr/share/alsa/ucm2/conf.d/SC7180/sc7180-adau7002-max98357a.conf /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd937x/init.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.11" to "1.2.12"
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.11.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.12.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.11 [default] to 1.2.12 [default]
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.11" to "1.2.12"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/blobs was added
  /usr/share/alsa/ucm2/blobs/sof was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3 was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_fir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_100hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_20hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/highpass_50hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc3/eq_iir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4 was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/passthrough.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/drc/speaker_default.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_fir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_20hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/highpass_50hz_0db_48khz.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/pass.blob was added
  /usr/share/alsa/ucm2/blobs/sof/ipc4/eq_iir/README.md was added
  /usr/share/alsa/ucm2/blobs/sof/product_configs was added
  /usr/share/alsa/ucm2/blobs/sof/product_configs/AAEON was added
  /usr/share/alsa/ucm2/blobs/sof/product_configs/AAEON/UPX-TGL01.conf was added
  /usr/share/alsa/ucm2/codecs/rt722 was added
  /usr/share/alsa/ucm2/codecs/rt722/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd937x/init.conf was added
  /usr/share/alsa/ucm2/common/pcm/hdmi.conf was added
  /usr/share/alsa/ucm2/conf.d/SC7180/sc7180-adau7002-max98357a.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-m8195_r1019 was added
  /usr/share/alsa/ucm2/conf.d/sof-m8195_r1019/sof-m8195_r1019_5682s.conf was added
  /usr/share/alsa/ucm2/Intel/sof-hda-dsp/HiFi-sof.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a was added
  /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sc7180/adau7002-max98357a/sc7180-adau7002-max98357a.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l43-spk.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt722.conf was added

--===============4210728783088054165==--

