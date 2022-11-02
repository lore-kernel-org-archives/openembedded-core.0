Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41110C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.849.1667349633238799225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=npNOitG5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c862d5-ca538481-0ead-4eca-8232-1b3eb187aad1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C1QT0MRCEikP2M4UuneepwE6NWdYv1G5wFcK/pB7I5Y=;
	b=npNOitG5wfcXL8FGTY9/KIyg2APilyP6D3FGwhFoqt1H0x5C18Vzg6NJI5NuFCjG
	hcrht69ucVoGAqtNzeQqmRmanwGS8sZ7LmBlc2KrnG1UfQLgiqIeB+ZblOFXX4oB0qM
	IKXhV/FKbSqPCW3JTqM5JPchfhqXA6vSUWGANWU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C1QT0MRCEikP2M4UuneepwE6NWdYv1G5wFcK/pB7I5Y=;
	b=Uhg9KWTGi5dO2o55DaXC5nXhHMOU+DrS14NLViFpeR7GTZQbx/TM1XqcSKPuWbX+
	7CESHYkKj3AbgHm7Hljm8I/hLB3H+BUo92umJ0iqV0aZNFbSbI9BIuYrwSxkCWC5L8b
	sPWbOxsnaCnC5+mwtUYxi8+2BKhucDy+faF2fAOA=
Content-Type: multipart/mixed; boundary="===============6221099720403357872=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.8 SUCCEEDED
Message-ID: <0101018435c862d5-ca538481-0ead-4eca-8232-1b3eb187aad1-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172504

--===============6221099720403357872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-ucm-conf* to *1.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.7.2-1.2.8.patch
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
--===============6221099720403357872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.7.2" to "1.2.8"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.7.2 [default] to 1.2.8 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.7.2" to "1.2.8"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf", added "/usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/sof-mt8195-mt6359-rt1019-rt5682.conf /usr/share/alsa/ucm2/Intel/sof-glkda7219max/HiFi.conf /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.conf /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf /usr/share/alsa/ucm2/codecs/wcd934x/init.conf /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1.conf /usr/share/alsa/ucm2/DEBUG.md /usr/share/alsa/ucm2/conf.d/sof-glkda7219ma/sof-glkda7219ma.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12.conf /usr/share/alsa/ucm2/conf.d/sof-mt8195_r101/sof-mt8195_r1019_5682.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sdm845/Lenovo-YOGA-C630-13Q50.conf /usr/share/alsa/ucm2/Intel/sof-glkda7219max/
 Hdmi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M2.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf /usr/share/alsa/ucm2/codecs/da7219/init.conf /usr/share/alsa/ucm2/Qualcomm/sdm845/HiFi-MM1.conf /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1-HiFi.conf /usr/share/alsa/ucm2/conf.d/sdm845/LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/init.conf /usr/share/alsa/ucm2/Intel/sof-glkda7219max/sof-glkda7219max.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD-HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/HiFi.conf /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98/acp3xalc5682m98.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/init.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C-HiFi.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.7.2 [default] to 1.2.8 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 254123 to 285466 (+12%)
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.7.2" to "1.2.8"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.7.2 [default] to 1.2.8 [default]
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.7.2.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.8.tar.bz2"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/AMD was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98 was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.conf was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/da7219 was added
  /usr/share/alsa/ucm2/codecs/da7219/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd934x/init.conf was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98 was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98/acp3xalc5682m98.conf was added
  /usr/share/alsa/ucm2/conf.d/sdm845/LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-glkda7219ma was added
  /usr/share/alsa/ucm2/conf.d/sof-glkda7219ma/sof-glkda7219ma.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8195_r101 was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8195_r101/sof-mt8195_r1019_5682.conf was added
  /usr/share/alsa/ucm2/DEBUG.md was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max/Hdmi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max/HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max/sof-glkda7219max.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682 was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/sof-mt8195-mt6359-rt1019-rt5682.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sdm845/HiFi-MM1.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sdm845/Lenovo-YOGA-C630-13Q50.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Rane was added
  /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2.conf was removed
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf was removed

--===============6221099720403357872==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.7.2-1.2.8.patch"

RnJvbSA3ZWNhMWY0ZTViOGM0MGY1OGZmZGMxZGNmZDA4YmQ3OWQ1NDgyOWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxODoyODo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdWNtLWNvbmY6IHVwZ3JhZGUgMS4yLjcuMiAtPiAxLjIuOAoKLS0tCiAuLi4vYWxzYS97YWxz
YS11Y20tY29uZl8xLjIuNy4yLmJiID0+IGFsc2EtdWNtLWNvbmZfMS4yLjguYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNhLXVjbS1jb25mXzEuMi43LjIuYmIgPT4g
YWxzYS11Y20tY29uZl8xLjIuOC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjcuMi5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDg5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZf
MS4yLjcuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVj
bS1jb25mXzEuMi44LmJiCmluZGV4IDUxMzE0ZjMzYWEuLmQzMGIzMjNhMDQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuNy4yLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuOC5iYgpA
QCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yMGQ3NGQ3NGRiOTc0MTY5NzkwMzM3MmFkMDAxZDNiNCIK
IAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi9saWIv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1M2VmNTYzOWM0MDk3YjIyOGU4
ZjVjZmFhMmU3YjgyOWQwNGI1ZGUyZGM5YTM4ZDU0ZWZhOGFhMzUwZDNmNWZkIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImZlZTRhNzM3ODMwZmQyNWY5NjlkODNkYTQ2YTJiMjMxYmViMDg2ZWZkOTY2
ZmNjMDdkMjI1ZTc4MjMyNjBhZTgiCiAjIFNvbWV0aGluZyB3ZW50IHdyb25nIGF0IHVwc3RyZWFt
IHRhcmJhbGxpbmcKIAogaW5oZXJpdCBhbGxhcmNoCi0tIAoyLjMxLjEKCg==

--===============6221099720403357872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 254123 to 285466 (+12%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2.conf", added "/usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD.conf /usr/share/alsa/ucm2/conf.d/sof-mt8195_r101/sof-mt8195_r1019_5682.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/init.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf /usr/share/alsa/ucm2/Intel/sof-glkda7219max/sof-glkda7219max.conf /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf /usr/share/alsa/ucm2/Intel/sof-glkda7219max/HiFi.conf /usr/share/alsa/ucm2/conf.d/sdm845/LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216.conf /usr/share/alsa/ucm2/DEBUG.md /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M2.conf /usr/share/alsa/ucm2/codecs/da7219/init.conf /usr/share/alsa/ucm2/Qualcomm/sdm845/HiFi-MM1.conf /u
 sr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.conf /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98/acp3xalc5682m98.conf /usr/share/alsa/ucm2/Intel/sof-glkda7219max/Hdmi.conf /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C-HiFi.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12.conf /usr/share/alsa/ucm2/codecs/wcd934x/init.conf /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/MOTU/M2-HiFi.conf /usr/share/alsa/ucm2/Qualcomm/sdm845/Lenovo-YOGA-C630-13Q50.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/init.conf /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C.conf /usr/share/alsa/ucm2/conf.d/sof-glkda7219ma/sof-glkda7219ma.conf /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/sof-mt8195-mt6359-rt1019-rt5682.conf /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD-HiFi.conf"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/AMD was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98 was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/acp3xalc5682m98.conf was added
  /usr/share/alsa/ucm2/AMD/acp3xalc5682m98/HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/da7219 was added
  /usr/share/alsa/ucm2/codecs/da7219/init.conf was added
  /usr/share/alsa/ucm2/codecs/wcd934x/init.conf was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98 was added
  /usr/share/alsa/ucm2/conf.d/acp3xalc5682m98/acp3xalc5682m98.conf was added
  /usr/share/alsa/ucm2/conf.d/sdm845/LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-glkda7219ma was added
  /usr/share/alsa/ucm2/conf.d/sof-glkda7219ma/sof-glkda7219ma.conf was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8195_r101 was added
  /usr/share/alsa/ucm2/conf.d/sof-mt8195_r101/sof-mt8195_r1019_5682.conf was added
  /usr/share/alsa/ucm2/DEBUG.md was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max/Hdmi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max/HiFi.conf was added
  /usr/share/alsa/ucm2/Intel/sof-glkda7219max/sof-glkda7219max.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682 was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/HiFi.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/init.conf was added
  /usr/share/alsa/ucm2/MediaTek/mt8195-sof/mt6359-rt1019-rt5682/sof-mt8195-mt6359-rt1019-rt5682.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sdm845/HiFi-MM1.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sdm845/Lenovo-YOGA-C630-13Q50.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-12-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Behringer/UMC202HD-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Focusrite/Scarlett-2i4-gen2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M2.conf was added
  /usr/share/alsa/ucm2/USB-Audio/MOTU/M2-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Rane was added
  /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Rane/SL-1-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Steinberg/UR24C-HiFi.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2.conf was removed
  /usr/share/alsa/ucm2/USB-Audio/Arturia/Minifuse-2-HiFi.conf was removed

--===============6221099720403357872==--

