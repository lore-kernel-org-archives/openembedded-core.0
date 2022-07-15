Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829DACCA486
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.988.1657900669929767100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JrlBawG5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182029497ae-0d2f1f0c-7d14-4ab0-ab07-1fa4fa47f2ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aGrc6/1cbhSpkaA1fwI4dShgx1n6090/qgI7+D7qoJ0=;
	b=JrlBawG5TWBH605K+gOYCXJi6Tx8HmZhL18+d3YCi7SEjqT1k+VLkEq0hhyKM4gX
	UQj8Lu54VGoU2OKKITXB5cY7pjfzGVNUUJlXQQth4vTpsGKdj1v1K5ifOS1Sfl42nSP
	yDMdrkMDr6z31CBQnFuK7R9uHkOqS9eJaI66uiFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aGrc6/1cbhSpkaA1fwI4dShgx1n6090/qgI7+D7qoJ0=;
	b=Qp2HziU3vwvsly2KY0bLolaM6Qx5moyivhkhP4xlqrh83Tw9K6MvflxnlAaT8Vou
	SWV4HjwE08QS2sxRY8Qs29VNzCXEE981KjhwLSTSjN0BsQTUkcZ6g53qRYuGNA+6WSL
	83n4ZlZE8Rni7OfIk9POUSxSahxQho52OCW6W1fg=
Content-Type: multipart/mixed; boundary="===============2129727972405228020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.7.2 SUCCEEDED
Message-ID: 
 <01010182029497ae-0d2f1f0c-7d14-4ab0-ab07-1fa4fa47f2ee-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168113

--===============2129727972405228020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-ucm-conf* to *1.2.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.7.1-1.2.7.2.patch
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
--===============2129727972405228020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.7.1" to "1.2.7.2"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.7.1 [default] to 1.2.7.2 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 250268 to 254123 (+2%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.7.1" to "1.2.7.2"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.7.1 [default] to 1.2.7.2 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf", added "/usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0009.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0003.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0009.conf /usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1-Mixer.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0003.conf"
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.7.1" to "1.2.7.2"
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.7.1.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.7.2.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.7.1 [default] to 1.2.7.2 [default]
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0003.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0009.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0003.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0009.conf was added
  /usr/share/alsa/ucm2/USB-Audio/NativeInstruments was added
  /usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1.conf was added
  /usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1-Mixer.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf was removed
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf was removed

--===============2129727972405228020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf", added "/usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0003.conf /usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1-Mixer.conf /usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0009.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0009.conf /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0003.conf"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0003.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-0009.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0003.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi-0009.conf was added
  /usr/share/alsa/ucm2/USB-Audio/NativeInstruments was added
  /usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1.conf was added
  /usr/share/alsa/ucm2/USB-Audio/NativeInstruments/Traktor-Kontrol-Z1-Mixer.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4.conf was removed
  /usr/share/alsa/ucm2/USB-Audio/Audient/Audient-iD4-HiFi.conf was removed

--===============2129727972405228020==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.7.1-1.2.7.2.patch"

From 20cdf037c14eb4a3af14cbe718932f9ceb2c805b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 13:49:55 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.7.1 -> 1.2.7.2

---
 .../alsa/{alsa-ucm-conf_1.2.7.1.bb => alsa-ucm-conf_1.2.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.7.1.bb => alsa-ucm-conf_1.2.7.2.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
index 79b8206592..51314f33aa 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ac5b2a1275783eff07e1cb34c36c6c5987742679a340037507c04a9dc1d22cac"
+SRC_URI[sha256sum] = "53ef5639c4097b228e8f5cfaa2e7b829d04b5de2dc9a38d54efa8aa350d3f5fd"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.31.1


--===============2129727972405228020==--

