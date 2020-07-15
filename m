Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.128.1594831458215046351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14BBCE01E94; Wed, 15 Jul 2020 09:44:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48A84E01ED3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:02 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 4.3.1 SUCCEEDED
Message-Id: <20200715164418.14BBCE01E94@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:18 -0700 (PDT)
X-Groupsio-MsgNum: 140678
Content-Type: multipart/mixed; boundary="===============6964796546817578099=="

--===============6964796546817578099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *4.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-4.3-4.3.1.patch
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

--===============6964796546817578099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 82604784 to 82611244 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGSIZE changed from 1129363 to 1129366 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 42449118 to 42453699 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libavcodec: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavcodec: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libavdevice: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavdevice: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libavfilter: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavfilter: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libavformat: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavformat: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libavresample: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavresample: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libavutil: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavutil: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libpostproc: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libpostproc: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libswresample: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswresample: PV changed from "4.3" to "4.3.1"
packages/core2-32-poky-linux/ffmpeg/libswscale: PKGV changed from 4.3 [default] to 4.3.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswscale: PV changed from "4.3" to "4.3.1"

--===============6964796546817578099==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-4.3-4.3.1.patch"

From 00b37fd21fd6836dbaa1bcf2896bdd678c9e9fa4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 12:29:10 +0000
Subject: [PATCH] ffmpeg: upgrade 4.3 -> 4.3.1

---
 .../ffmpeg/{ffmpeg_4.3.bb => ffmpeg_4.3.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.3.bb => ffmpeg_4.3.1.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index b4cf278cb2..517dac7f05 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[sha256sum] = "1d0ad06484f44bcb97eba5e93c40bcb893890f9f64aeb43e46cd9bb4cbd6795d"
+SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


--===============6964796546817578099==--
