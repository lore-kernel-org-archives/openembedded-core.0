Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD28C48BF5
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2109.1706810406372120697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ctx4YGrp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S3mC/NgD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d65d3f9f3-67297c62-e6d9-45d6-a172-a6420dbc73fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UvGd/3ArhVy29aLziRVQvocb7G1JW4mpYmBPsMU7cmc=;
	b=Ctx4YGrpEVYIEbCN1pShxscUlzDw4g9EkrL4cF2pNVo3pjkk3sVld2AdHZZI1/7G
	CmwJSirwwWtX3AF6ecjrfk5JgI6Pwqc2oONugZjwGiTUiEr3jIMP9HYErYdCTmQHSFS
	3t7MERmLJqqiFED7vln3INHlj2D6BKbQ7AVO0/aA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UvGd/3ArhVy29aLziRVQvocb7G1JW4mpYmBPsMU7cmc=;
	b=S3mC/NgD/A8IQuPxc+OxFCBoOLk9n9VBUq6txwSyr6dOgRXYdKEC3tUTQQ0j/Rrj
	R6jSYXx+dV1uupt5PioLB7Vy/5oE3uZ77w25YtDe9bDvEKgLZD+ohgaB+k8JT89BkYO
	sPAs/apAHNYcwgTYvFiubTkCUnFDWjmrmsfyYMTU=
Content-Type: multipart/mixed; boundary="===============6832966062760851263=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.11 SUCCEEDED
Message-ID: <0101018d65d3f9f3-67297c62-e6d9-45d6-a172-a6420dbc73fc-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194692

--===============6832966062760851263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-ucm-conf* to *1.2.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.10-1.2.11.patch
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
From 34f02889de114dbb85cc2b12e7fdbd668e88779f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 14:19:07 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.10 -> 1.2.11

---
 .../alsa/{alsa-ucm-conf_1.2.10.bb => alsa-ucm-conf_1.2.11.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.10.bb => alsa-ucm-conf_1.2.11.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
index f4fd284db8..ce1a42c9b8 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.11.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "9c21e3f01ff00baa758df17e867cd36e24ebb41a6bec49737e99105e16f2ae97"
+SRC_URI[sha256sum] = "387c01cf30e2a1676d7b8f72b2681cf219abca70dd1ec2a9e33add5bf3feae81"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.42.0


--===============6832966062760851263==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.10-1.2.11.patch"

RnJvbSAzNGYwMjg4OWRlMTE0ZGJiODVjYzJiMTJlN2ZkYmQ2NjhlODg3NzlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNDoxOTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdWNtLWNvbmY6IHVwZ3JhZGUgMS4yLjEwIC0+IDEuMi4xMQoKLS0tCiAuLi4vYWxzYS97YWxz
YS11Y20tY29uZl8xLjIuMTAuYmIgPT4gYWxzYS11Y20tY29uZl8xLjIuMTEuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNhLXVjbS1jb25mXzEuMi4xMC5iYiA9PiBh
bHNhLXVjbS1jb25mXzEuMi4xMS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjEwLmJiIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZf
MS4yLjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNt
LWNvbmZfMS4yLjExLmJiCmluZGV4IGY0ZmQyODRkYjguLmNlMWE0MmM5YjggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4xMS5iYgpA
QCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yMGQ3NGQ3NGRiOTc0MTY5NzkwMzM3MmFkMDAxZDNiNCIK
IAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi9saWIv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5YzIxZTNmMDFmZjAwYmFhNzU4
ZGYxN2U4NjdjZDM2ZTI0ZWJiNDFhNmJlYzQ5NzM3ZTk5MTA1ZTE2ZjJhZTk3IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjM4N2MwMWNmMzBlMmExNjc2ZDdiOGY3MmIyNjgxY2YyMTlhYmNhNzBkZDFl
YzJhOWUzM2FkZDViZjNmZWFlODEiCiAjIFNvbWV0aGluZyB3ZW50IHdyb25nIGF0IHVwc3RyZWFt
IHRhcmJhbGxpbmcKIAogaW5oZXJpdCBhbGxhcmNoCi0tIAoyLjQyLjAKCg==

--===============6832966062760851263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/codecs/wcd938x/DefaultEnableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt1308-1.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf /usr/share/alsa/ucm2/sof-soundwire/rt1308-2.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf", added "/usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/SM8650-QRD.conf /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath/Zedi10.conf /usr/share/alsa/ucm2/Amlogic/p241/p241-HiFi.conf /usr/share/alsa/ucm2/conf.d/sm8650/SM8650-MTP.conf /usr/share/alsa/ucm2/conf.d/sm8650/SM8650-QRD.conf /usr/share/alsa/ucm2/conf.d/gx-sound-card/GXL-P241.conf /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/AMD/acp3x-es83xx/acp3x-es83xx.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l43-dmic.conf /usr/share/
 alsa/ucm2/codecs/wcd939x/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/codecs/wsa883x/init.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD-HiFi.conf /usr/share/alsa/ucm2/conf.d/mt8370-evk/mt8370-evk.conf /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/HiFi.conf /usr/share/alsa/ucm2/codecs/wm5102/IN2-HeadsetMic.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2-HiFi.conf /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/SpeakerSeq.conf /usr/share/alsa/ucm2/codecs/rt713-dmic/init.conf /usr/share/alsa/ucm2/codecs/rt713-sdca/init.conf /usr/share/alsa/ucm2/conf.d/mt8395-evk/mt8395-evk.conf /usr/share/alsa/ucm2/sof-soundwire/rt
 1308.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/init.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318.conf /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly.conf /usr/share/alsa/ucm2/sof-soundwire/rt713-dmic.conf /usr/share/alsa/ucm2/codecs/cs42l43/init.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerDisableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerDisableSeq.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/HiFi.conf /usr/share/alsa/ucm2/AMD/acp3x-es83xx/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M6.conf /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/SpeakerSeq.conf /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/init.conf /usr/share/alsa/ucm2/conf.d/gx-sound-card/LIBRETECH-CC.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l43.conf /usr/share/alsa/ucm2/codecs/wm5102/IN1-InternalMic.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E80100-CRD.conf /usr/share/alsa/ucm2/USB-
 Audio/AllenAndHeath/Zedi10-Hifi.conf /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/init.conf /usr/share/alsa/ucm2/conf.d/acp3x-es83xx/acp3x-es83xx.conf /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-CRD.conf /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/DefaultEnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/four-speakers/init.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic1EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic3EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic4EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic5EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMicDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2.conf /usr/share/alsa/ucm2/MediaTek/mt8370-evk/mt8370-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/mt8390-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8395-evk/mt8395-evk.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/init.conf /usr/
 share/alsa/ucm2/Amlogic/p241/p241.conf /usr/share/alsa/ucm2/conf.d/acpd7219m98357/acpd7219m98357.conf /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/init.conf /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf /usr/share/alsa/ucm2/codecs/wcd939x/DefaultEnableSeq.conf /usr/share/alsa/ucm2/conf.d/mt8390-evk/mt8390-evk.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M6-HiFi.conf /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/DefaultEnableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/cs35l56.conf /usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf /usr/share/alsa/ucm2/MediaTek/mt8370-evk/HiFi.conf /usr/share/alsa/ucm2/codecs/wm5102/HPOut2-Speaker.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8395-evk/HiFi.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMic1EnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMicDisableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpa
 ss/tx-macro/SoundwireMic0EnableSeq.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/SM8650-MTP.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 346132 to 398584 (+15%)
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/wcd938x moved to /usr/share/alsa/ucm2/codecs/wcd939x
  /usr/share/alsa/ucm2/AMD/acp3x-es83xx was added
  /usr/share/alsa/ucm2/AMD/acp3x-es83xx/acp3x-es83xx.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-es83xx/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acpd7219m98357 was added
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf was added
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf was added
  /usr/share/alsa/ucm2/Amlogic was added
  /usr/share/alsa/ucm2/Amlogic/p241 was added
  /usr/share/alsa/ucm2/Amlogic/p241/p241.conf was added
  /usr/share/alsa/ucm2/Amlogic/p241/p241-HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/cs42l43 was added
  /usr/share/alsa/ucm2/codecs/cs42l43/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMic0EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMic1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/four-speakers was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/four-speakers/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/rt713-dmic was added
  /usr/share/alsa/ucm2/codecs/rt713-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt713-sdca was added
  /usr/share/alsa/ucm2/codecs/rt713-sdca/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic3EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic4EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic5EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/init.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/HPOut2-Speaker.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN1-InternalMic.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN2-HeadsetMic.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/SpeakerSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/SpeakerSeq.conf was added
  /usr/share/alsa/ucm2/conf.d/acp3x-es83xx was added
  /usr/share/alsa/ucm2/conf.d/acp3x-es83xx/acp3x-es83xx.conf was added
  /usr/share/alsa/ucm2/conf.d/acpd7219m98357 was added
  /usr/share/alsa/ucm2/conf.d/acpd7219m98357/acpd7219m98357.conf was added
  /usr/share/alsa/ucm2/conf.d/gx-sound-card was added
  /usr/share/alsa/ucm2/conf.d/gx-sound-card/GXL-P241.conf was added
  /usr/share/alsa/ucm2/conf.d/gx-sound-card/LIBRETECH-CC.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8370-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8370-evk/mt8370-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8390-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8390-evk/mt8390-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8395-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8395-evk/mt8395-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8650 was added
  /usr/share/alsa/ucm2/conf.d/sm8650/SM8650-MTP.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8650/SM8650-QRD.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100 was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-CRD.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8370-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8370-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8370-evk/mt8370-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/mt8390-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8395-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8395-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8395-evk/mt8395-evk.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/SM8650-MTP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/SM8650-QRD.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100 was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E80100-CRD.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs35l56.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l43.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l43-dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1308.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1316.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1318.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt713-dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf was added
  /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath was added
  /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath/Zedi10.conf was added
  /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath/Zedi10-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Common was added
  /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M6.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M6-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2-HiFi.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-1.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-2.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf was removed

--===============6832966062760851263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.10" to "1.2.11"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/sof-soundwire/rt1308-1.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf /usr/share/alsa/ucm2/codecs/wcd938x/DefaultEnableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf /usr/share/alsa/ucm2/sof-soundwire/rt1308-2.conf", added "/usr/share/alsa/ucm2/Qualcomm/x1e80100/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8370-evk/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8395-evk/mt8395-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8370-evk/mt8370-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8390-evk/mt8390-evk.conf /usr/share/alsa/ucm2/MediaTek/mt8395-evk/HiFi.conf /usr/share/alsa/ucm2/conf.d/acp3x-es83xx/acp3x-es83xx.conf /usr/share/alsa/ucm2/conf.d/gx-sound-card/GXL-P241.conf /usr/share/alsa/ucm2/sof-soundwire/rt1308.conf /usr/share/alsa/ucm2/sof-sound
 wire/rt1318.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M6-HiFi.conf /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/SpeakerSeq.conf /usr/share/alsa/ucm2/codecs/wm5102/IN1-InternalMic.conf /usr/share/alsa/ucm2/conf.d/mt8370-evk/mt8370-evk.conf /usr/share/alsa/ucm2/AMD/acp3x-es83xx/acp3x-es83xx.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerDisableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerDisableSeq.conf /usr/share/alsa/ucm2/conf.d/mt8395-evk/mt8395-evk.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/SM8650-MTP.conf /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast.conf /usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD-HiFi.conf /usr/share/alsa/ucm2/codecs/wsa883x/init.conf /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/init.conf /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf /u
 sr/share/alsa/ucm2/conf.d/sm8650/SM8650-QRD.conf /usr/share/alsa/ucm2/conf.d/sm8650/SM8650-MTP.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/four-speakers/init.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316.conf /usr/share/alsa/ucm2/codecs/wm5102/IN2-HeadsetMic.conf /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath/Zedi10.conf /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly.conf /usr/share/alsa/ucm2/codecs/wcd939x/DefaultEnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/init.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMicDisableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMic0EnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMic1EnableSeq.conf /usr/share/alsa/ucm2/codecs/cs42l43/init.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/init.conf /usr/share/alsa/ucm2/conf.d/gx-sound-card/LIBRETECH-CC.conf /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers
 /DefaultEnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneDisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2.conf /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-CRD.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M6.conf /usr/share/alsa/ucm2/AMD/acp3x-es83xx/HiFi.conf /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/DefaultEnableSeq.conf /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD.conf /usr/share/alsa/ucm2/conf.d/mt8390-evk/mt8390-evk.conf /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath/Zedi10-Hifi.conf /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/init.conf /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneMicEnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneEnableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt713-dmic.conf /usr/share/alsa/ucm2/codecs/wm5102/HPOut2-Speaker.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic1EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic3EnableSeq
 .conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic4EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic5EnableSeq.conf /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMicDisableSeq.conf /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly-HiFi.conf /usr/share/alsa/ucm2/conf.d/acpd7219m98357/acpd7219m98357.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l43.conf /usr/share/alsa/ucm2/Amlogic/p241/p241-HiFi.conf /usr/share/alsa/ucm2/sof-soundwire/cs35l56.conf /usr/share/alsa/ucm2/codecs/wcd939x/init.conf /usr/share/alsa/ucm2/Amlogic/p241/p241.conf /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/SpeakerSeq.conf /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/SM8650-QRD.conf /usr/share/alsa/ucm2/codecs/rt713-dmic/init.conf /usr/share/alsa/ucm2/codecs/rt713-sdca/init.conf /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E80100-CRD.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf /usr/share/alsa/ucm2
 /codecs/wcd939x/HeadphoneMicDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/cs42l43-dmic.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.10" to "1.2.11"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 346132 to 398584 (+15%)
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.10.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.11.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.10" to "1.2.11"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/wcd938x moved to /usr/share/alsa/ucm2/codecs/wcd939x
  /usr/share/alsa/ucm2/AMD/acp3x-es83xx was added
  /usr/share/alsa/ucm2/AMD/acp3x-es83xx/acp3x-es83xx.conf was added
  /usr/share/alsa/ucm2/AMD/acp3x-es83xx/HiFi.conf was added
  /usr/share/alsa/ucm2/AMD/acpd7219m98357 was added
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/acpd7219m98357.conf was added
  /usr/share/alsa/ucm2/AMD/acpd7219m98357/HiFi.conf was added
  /usr/share/alsa/ucm2/Amlogic was added
  /usr/share/alsa/ucm2/Amlogic/p241 was added
  /usr/share/alsa/ucm2/Amlogic/p241/p241.conf was added
  /usr/share/alsa/ucm2/Amlogic/p241/p241-HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/cs42l43 was added
  /usr/share/alsa/ucm2/codecs/cs42l43/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/rx-macro/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMic0EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMic1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/tx-macro/SoundwireMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/four-speakers was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/four-speakers/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/init.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa1SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/Wsa2SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/rt713-dmic was added
  /usr/share/alsa/ucm2/codecs/rt713-dmic/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt713-sdca was added
  /usr/share/alsa/ucm2/codecs/rt713-sdca/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic1EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic3EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic4EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMic5EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/AnalogMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneMicDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/HeadphoneMicEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wcd939x/init.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/HPOut2-Speaker.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN1-InternalMic.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN2-HeadsetMic.conf was added
  /usr/share/alsa/ucm2/codecs/wsa883x/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/four-speakers/SpeakerSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/DefaultEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/init.conf was added
  /usr/share/alsa/ucm2/codecs/wsa884x/two-speakers/SpeakerSeq.conf was added
  /usr/share/alsa/ucm2/conf.d/acp3x-es83xx was added
  /usr/share/alsa/ucm2/conf.d/acp3x-es83xx/acp3x-es83xx.conf was added
  /usr/share/alsa/ucm2/conf.d/acpd7219m98357 was added
  /usr/share/alsa/ucm2/conf.d/acpd7219m98357/acpd7219m98357.conf was added
  /usr/share/alsa/ucm2/conf.d/gx-sound-card was added
  /usr/share/alsa/ucm2/conf.d/gx-sound-card/GXL-P241.conf was added
  /usr/share/alsa/ucm2/conf.d/gx-sound-card/LIBRETECH-CC.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8370-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8370-evk/mt8370-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8390-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8390-evk/mt8390-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/mt8395-evk was added
  /usr/share/alsa/ucm2/conf.d/mt8395-evk/mt8395-evk.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8650 was added
  /usr/share/alsa/ucm2/conf.d/sm8650/SM8650-MTP.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8650/SM8650-QRD.conf was added
  /usr/share/alsa/ucm2/conf.d/x1e80100 was added
  /usr/share/alsa/ucm2/conf.d/x1e80100/X1E80100-CRD.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8370-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8370-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8370-evk/mt8370-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8390-evk/mt8390-evk.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8395-evk was added
  /usr/share/alsa/ucm2/MediaTek/mt8395-evk/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8395-evk/mt8395-evk.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/MTP/SM8650-MTP.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8650/QRD/SM8650-QRD.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100 was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/x1e80100/X1E80100-CRD.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs35l56.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l43.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/cs42l43-dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1308.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1316.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1318.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt713-dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt713-sdca.conf was added
  /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath was added
  /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath/Zedi10.conf was added
  /usr/share/alsa/ucm2/USB-Audio/AllenAndHeath/Zedi10-Hifi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC404HD-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Common was added
  /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Common/HeadphonesOnly-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M6.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M6-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Roland/BridgeCast.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/SolidStateLabs/SSL2-HiFi.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-1.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-2.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-1.conf was removed
  /usr/share/alsa/ucm2/sof-soundwire/rt1318-2.conf was removed

--===============6832966062760851263==--

