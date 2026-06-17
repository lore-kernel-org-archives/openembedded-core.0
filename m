Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A524CD98F2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 05:31:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9057.1781674308848071053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lmJlmROh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3+WEBQCd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ed410714e-b01b493f-2b5c-42b8-9b08-8146b74f18e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zFzJWQkxCDIuKdG8ddfwwz2Q1st275CWyOu0UoSXs1Y=;
	b=lmJlmROhjdtsolQGOqvneHsBl+bUldXkD5DfL5j41MjfzhgNFE2VJ7zxOAsVEBHc
	04gBdcJOhQFNnpREZ9sWDJ0svKGVUao7sYxyDsF3Ijscf475lqfzJxEhkfc5dVRKDq5
	tk/dIt8SoEjgjviOrVMO4Y6ovTQOPqf4KoFrP+vo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zFzJWQkxCDIuKdG8ddfwwz2Q1st275CWyOu0UoSXs1Y=;
	b=3+WEBQCdFj1Ku4ljKLFEsGEI2kaMvwVve/YAaSGxf+CwT8IMScKJJs84STwDg8bG
	cDh2Vs0LioI7J2dFDcCNRVcWT+R5KkBoKEcGVKmtuu5OtklQoA43VRx9cw1z5YZArSE
	2j/zSos2FQs4ta/x85emnurtNQTem3HZ3I+82hAY=
Content-Type: multipart/mixed; boundary="===============2304553351871288316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ffmpeg: upgrading to 8.1.2 SUCCEEDED
Message-ID: <0101019ed410714e-b01b493f-2b5c-42b8-9b08-8146b74f18e9-000000@us-west-2.amazonses.com>
Date: Wed, 17 Jun 2026 05:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.17-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 05:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238973

--===============2304553351871288316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ffmpeg* to *8.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-8.1.1-8.1.2.patch
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
From 141fb7f363d7dd747f6b7bc9d979aa8da8c80029 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 17 Jun 2026 05:31:40 +0000
Subject: [PATCH] ffmpeg: upgrade 8.1.1 -> 8.1.2

---
 ...ffbuild-common.mak-ensure-target-directories-are-cre.patch | 4 ++--
 .../ffmpeg/{ffmpeg_8.1.1.bb => ffmpeg_8.1.2.bb}               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_8.1.1.bb => ffmpeg_8.1.2.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
index 2e26078f0f..438fbbabf1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
@@ -1,4 +1,4 @@
-From 6cd4855ea3dd62e6eb36c0796f8cd7bd4aaae05c Mon Sep 17 00:00:00 2001
+From 894c92ca133c5f1532a4ae155ae8f4d2c6da3c9a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 11 Dec 2025 19:55:46 +0100
 Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
@@ -27,7 +27,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ffbuild/common.mak b/ffbuild/common.mak
-index 0a60d01..346bb0a 100644
+index 06d6f39..52a9a20 100644
 --- a/ffbuild/common.mak
 +++ b/ffbuild/common.mak
 @@ -126,8 +126,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
index 0aa8c6e8e1..38eccbf2ad 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
-SRC_URI[sha256sum] = "b6863adde98898f42602017462871b5f6333e65aec803fdd7a6308639c52edf3"
+SRC_URI[sha256sum] = "464beb5e7bf0c311e68b45ae2f04e9cc2af88851abb4082231742a74d97b524c"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.47.1


--===============2304553351871288316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: FILELIST: removed "/usr/lib/.debug/libswresample.so.6.3.101 /usr/lib/.debug/libavfilter.so.11.14.101 /usr/lib/.debug/libavutil.so.60.26.101 /usr/lib/.debug/libswscale.so.9.5.101 /usr/lib/.debug/libavdevice.so.62.3.101 /usr/lib/.debug/libavformat.so.62.12.101 /usr/lib/.debug/libavcodec.so.62.28.101", added "/usr/lib/.debug/libswresample.so.6.3.102 /usr/lib/.debug/libavfilter.so.11.14.102 /usr/lib/.debug/libavutil.so.60.26.102 /usr/lib/.debug/libswscale.so.9.5.102 /usr/lib/.debug/libavformat.so.62.12.102 /usr/lib/.debug/libavdevice.so.62.3.102 /usr/lib/.debug/libavcodec.so.62.28.102"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 109239424 to 109629096 (+0%)
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-examples: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-examples: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: FILELIST: directory renamed /usr/src/debug/ffmpeg/8.1.1/libswscale -> /usr/src/debug/ffmpeg/8.1.2/libswscale, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavformat -> /usr/src/debug/ffmpeg/8.1.2/libavformat, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavutil -> /usr/src/debug/ffmpeg/8.1.2/libavutil, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/bsf -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/bsf, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavdevice -> /usr/src/debug/ffmpeg/8.1.2/libavdevice, directory renamed /usr/src/debug/ffmpeg/8.1.1/libswscale/x86 -> /usr/src/debug/ffmpeg/8.1.2/libswscale/x86, directory renamed /usr/src/debug/ffmpeg/8.1.1/fftools/textformat -> /usr/src/debug/ffmpeg/8.1.2/fftools/textformat, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/hevc -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/hevc, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavutil/x86 -> /usr/src/debug/ffmpeg/8.1.2/liba
 vutil/x86, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavfilter/x86 -> /usr/src/debug/ffmpeg/8.1.2/libavfilter/x86, directory renamed /usr/src/debug/ffmpeg/8.1.1/libswresample -> /usr/src/debug/ffmpeg/8.1.2/libswresample, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/x86/h26x -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/x86/h26x, directory renamed /usr/src/debug/ffmpeg/8.1.1/libswresample/x86 -> /usr/src/debug/ffmpeg/8.1.2/libswresample/x86, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/opus -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/opus, directory renamed /usr/src/debug/ffmpeg/8.1.1/fftools/resources -> /usr/src/debug/ffmpeg/8.1.2/fftools/resources, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/x86 -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/x86, directory renamed /usr/src/debug/ffmpeg/8.1.1/fftools -> /usr/src/debug/ffmpeg/8.1.2/fftools, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/vvc -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/vvc, dire
 ctory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/h26x -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/h26x, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec -> /usr/src/debug/ffmpeg/8.1.2/libavcodec, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/x86/hevc -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/x86/hevc, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/x86/vvc -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/x86/vvc, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavcodec/aac -> /usr/src/debug/ffmpeg/8.1.2/libavcodec/aac, directory renamed /usr/src/debug/ffmpeg/8.1.1/libavfilter -> /usr/src/debug/ffmpeg/8.1.2/libavfilter, directory renamed /usr/src/debug/ffmpeg/8.1.1/fftools/graph -> /usr/src/debug/ffmpeg/8.1.2/fftools/graph
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 49394595 to 49412415 (+0%)
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-src: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/ffmpeg: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-8.1.1.tar.xz file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch" to "https://www.ffmpeg.org/releases/ffmpeg-8.1.2.tar.xz file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch"
packages/x86-64-v3-poky-linux/ffmpeg: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: FILELIST: removed "/usr/lib/libavcodec.so.62.28.101", added "/usr/lib/libavcodec.so.62.28.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: PKGSIZE changed from 20269199 to 20277391 (+0%)
packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: FILELIST: removed "/usr/lib/libavdevice.so.62.3.101", added "/usr/lib/libavdevice.so.62.3.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: FILELIST: removed "/usr/lib/libavfilter.so.11.14.101", added "/usr/lib/libavfilter.so.11.14.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: PKGSIZE changed from 6314248 to 6322440 (+0%)
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: FILELIST: removed "/usr/lib/libavformat.so.62.12.101", added "/usr/lib/libavformat.so.62.12.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: FILELIST: removed "/usr/lib/libavutil.so.60.26.101", added "/usr/lib/libavutil.so.60.26.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: FILELIST: removed "/usr/lib/libswresample.so.6.3.101", added "/usr/lib/libswresample.so.6.3.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: PV changed from "8.1.1" to "8.1.2"
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: FILELIST: removed "/usr/lib/libswscale.so.9.5.101", added "/usr/lib/libswscale.so.9.5.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: PKGV changed from 8.1.1 [default] to 8.1.2 [default]
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: PV changed from "8.1.1" to "8.1.2"
Changes to packages/x86-64-v3-poky-linux/ffmpeg (sysroot):
  /usr/lib/libavcodec.so.62 changed symlink target from libavcodec.so.62.28.101 to libavcodec.so.62.28.102
  /usr/lib/libavcodec.so changed symlink target from libavcodec.so.62.28.101 to libavcodec.so.62.28.102
  /usr/lib/libavdevice.so.62 changed symlink target from libavdevice.so.62.3.101 to libavdevice.so.62.3.102
  /usr/lib/libavdevice.so changed symlink target from libavdevice.so.62.3.101 to libavdevice.so.62.3.102
  /usr/lib/libavfilter.so.11 changed symlink target from libavfilter.so.11.14.101 to libavfilter.so.11.14.102
  /usr/lib/libavfilter.so changed symlink target from libavfilter.so.11.14.101 to libavfilter.so.11.14.102
  /usr/lib/libavformat.so.62 changed symlink target from libavformat.so.62.12.101 to libavformat.so.62.12.102
  /usr/lib/libavformat.so changed symlink target from libavformat.so.62.12.101 to libavformat.so.62.12.102
  /usr/lib/libavutil.so.60 changed symlink target from libavutil.so.60.26.101 to libavutil.so.60.26.102
  /usr/lib/libavutil.so changed symlink target from libavutil.so.60.26.101 to libavutil.so.60.26.102
  /usr/lib/libswresample.so.6 changed symlink target from libswresample.so.6.3.101 to libswresample.so.6.3.102
  /usr/lib/libswresample.so changed symlink target from libswresample.so.6.3.101 to libswresample.so.6.3.102
  /usr/lib/libswscale.so.9 changed symlink target from libswscale.so.9.5.101 to libswscale.so.9.5.102
  /usr/lib/libswscale.so changed symlink target from libswscale.so.9.5.101 to libswscale.so.9.5.102
  /usr/lib/libavcodec.so.62.28.101 moved to /usr/lib/libavcodec.so.62.28.102
  /usr/lib/libavdevice.so.62.3.101 moved to /usr/lib/libavdevice.so.62.3.102
  /usr/lib/libavfilter.so.11.14.101 moved to /usr/lib/libavfilter.so.11.14.102
  /usr/lib/libavformat.so.62.12.101 moved to /usr/lib/libavformat.so.62.12.102
  /usr/lib/libavutil.so.60.26.101 moved to /usr/lib/libavutil.so.60.26.102
  /usr/lib/libswresample.so.6.3.101 moved to /usr/lib/libswresample.so.6.3.102
  /usr/lib/libswscale.so.9.5.101 moved to /usr/lib/libswscale.so.9.5.102

--===============2304553351871288316==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-8.1.1-8.1.2.patch"

RnJvbSAxNDFmYjdmMzYzZDdkZDc0N2Y2YjdiYzlkOTc5YWE4ZGE4YzgwMDI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTcgSnVuIDIwMjYgMDU6MzE6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
Zm1wZWc6IHVwZ3JhZGUgOC4xLjEgLT4gOC4xLjIKCi0tLQogLi4uZmZidWlsZC1jb21tb24ubWFr
LWVuc3VyZS10YXJnZXQtZGlyZWN0b3JpZXMtYXJlLWNyZS5wYXRjaCB8IDQgKystLQogLi4uL2Zm
bXBlZy97ZmZtcGVnXzguMS4xLmJiID0+IGZmbXBlZ184LjEuMi5iYn0gICAgICAgICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy97ZmZtcGVnXzguMS4xLmJiID0+
IGZmbXBlZ184LjEuMi5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9mZm1wZWcvZmZtcGVnLzAwMDItZmZidWlsZC1jb21tb24ubWFrLWVuc3VyZS10YXJnZXQt
ZGlyZWN0b3JpZXMtYXJlLWNyZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBl
Zy9mZm1wZWcvMDAwMi1mZmJ1aWxkLWNvbW1vbi5tYWstZW5zdXJlLXRhcmdldC1kaXJlY3Rvcmll
cy1hcmUtY3JlLnBhdGNoCmluZGV4IDJlMjYwNzhmMGYuLjQzOGZiYmFiZjEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWcvMDAwMi1mZmJ1aWxkLWNvbW1v
bi5tYWstZW5zdXJlLXRhcmdldC1kaXJlY3Rvcmllcy1hcmUtY3JlLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWcvMDAwMi1mZmJ1aWxkLWNvbW1vbi5tYWst
ZW5zdXJlLXRhcmdldC1kaXJlY3Rvcmllcy1hcmUtY3JlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA2Y2Q0ODU1ZWEzZGQ2MmU2ZWIzNmMwNzk2ZjhjZDdiZDRhYWFlMDVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA4OTRjOTJjYTEzM2M1ZjE1MzJhNGFlMTU1YWU4ZjRkMmM2ZGEz
YzlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXhAbGludXRyb25peC5kZT4KIERhdGU6IFRodSwgMTEgRGVjIDIwMjUgMTk6NTU6NDYgKzAxMDAK
IFN1YmplY3Q6IFtQQVRDSF0gZmZidWlsZC9jb21tb24ubWFrOiBlbnN1cmUgdGFyZ2V0IGRpcmVj
dG9yaWVzIGFyZSBjcmVhdGVkCkBAIC0yNyw3ICsyNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2ZmYnVpbGQvY29tbW9u
Lm1hayBiL2ZmYnVpbGQvY29tbW9uLm1hawotaW5kZXggMGE2MGQwMS4uMzQ2YmIwYSAxMDA2NDQK
K2luZGV4IDA2ZDZmMzkuLjUyYTlhMjAgMTAwNjQ0CiAtLS0gYS9mZmJ1aWxkL2NvbW1vbi5tYWsK
ICsrKyBiL2ZmYnVpbGQvY29tbW9uLm1hawogQEAgLTEyNiw4ICsxMjYsOCBAQCAkKEJJTjJDRVhF
KTogZmZidWlsZC9iaW4yY19ob3N0Lm8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2ZmbXBlZy9mZm1wZWdfOC4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1w
ZWcvZmZtcGVnXzguMS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfOC4xLjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfOC4xLjIuYmIKaW5kZXggMGFhOGM2ZThl
MS4uMzhlY2NiZjJhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVn
L2ZmbXBlZ184LjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZt
cGVnXzguMS4yLmJiCkBAIC0yNiw3ICsyNiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuZmZt
cGVnLm9yZy9yZWxlYXNlcy8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1m
ZmJ1aWxkLWNvbW1vbi5tYWstZW5zdXJlLXRhcmdldC1kaXJlY3Rvcmllcy1hcmUtY3JlLnBhdGNo
IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjY4NjNhZGRlOTg4OThm
NDI2MDIwMTc0NjI4NzFiNWY2MzMzZTY1YWVjODAzZmRkN2E2MzA4NjM5YzUyZWRmMyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI0NjRiZWI1ZTdiZjBjMzExZTY4YjQ1YWUyZjA0ZTljYzJhZjg4ODUx
YWJiNDA4MjIzMTc0MmE3NGQ5N2I1MjRjIgogCiAjIEJ1aWxkIGZhaWxzIHdoZW4gdGh1bWIgaXMg
ZW5hYmxlZDogaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9p
ZD03NzE3CiBBUk1fSU5TVFJVQ1RJT05fU0VUOmFybXY0ID0gImFybSIKLS0gCjIuNDcuMQoK

--===============2304553351871288316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ffmpeg/libavcodec: FILELIST: removed "/usr/lib/libavcodec.so.62.28.101", added "/usr/lib/libavcodec.so.62.28.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavdevice: FILELIST: removed "/usr/lib/libavdevice.so.62.3.101", added "/usr/lib/libavdevice.so.62.3.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavfilter: FILELIST: removed "/usr/lib/libavfilter.so.11.14.101", added "/usr/lib/libavfilter.so.11.14.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavformat: FILELIST: removed "/usr/lib/libavformat.so.62.12.101", added "/usr/lib/libavformat.so.62.12.102"
packages/x86-64-v3-poky-linux/ffmpeg/libavutil: FILELIST: removed "/usr/lib/libavutil.so.60.26.101", added "/usr/lib/libavutil.so.60.26.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswresample: FILELIST: removed "/usr/lib/libswresample.so.6.3.101", added "/usr/lib/libswresample.so.6.3.102"
packages/x86-64-v3-poky-linux/ffmpeg/libswscale: FILELIST: removed "/usr/lib/libswscale.so.9.5.101", added "/usr/lib/libswscale.so.9.5.102"
Changes to packages/x86-64-v3-poky-linux/ffmpeg (sysroot):
  /usr/lib/libavcodec.so.62 changed symlink target from libavcodec.so.62.28.101 to libavcodec.so.62.28.102
  /usr/lib/libavcodec.so changed symlink target from libavcodec.so.62.28.101 to libavcodec.so.62.28.102
  /usr/lib/libavdevice.so.62 changed symlink target from libavdevice.so.62.3.101 to libavdevice.so.62.3.102
  /usr/lib/libavdevice.so changed symlink target from libavdevice.so.62.3.101 to libavdevice.so.62.3.102
  /usr/lib/libavfilter.so.11 changed symlink target from libavfilter.so.11.14.101 to libavfilter.so.11.14.102
  /usr/lib/libavfilter.so changed symlink target from libavfilter.so.11.14.101 to libavfilter.so.11.14.102
  /usr/lib/libavformat.so.62 changed symlink target from libavformat.so.62.12.101 to libavformat.so.62.12.102
  /usr/lib/libavformat.so changed symlink target from libavformat.so.62.12.101 to libavformat.so.62.12.102
  /usr/lib/libavutil.so.60 changed symlink target from libavutil.so.60.26.101 to libavutil.so.60.26.102
  /usr/lib/libavutil.so changed symlink target from libavutil.so.60.26.101 to libavutil.so.60.26.102
  /usr/lib/libswresample.so.6 changed symlink target from libswresample.so.6.3.101 to libswresample.so.6.3.102
  /usr/lib/libswresample.so changed symlink target from libswresample.so.6.3.101 to libswresample.so.6.3.102
  /usr/lib/libswscale.so.9 changed symlink target from libswscale.so.9.5.101 to libswscale.so.9.5.102
  /usr/lib/libswscale.so changed symlink target from libswscale.so.9.5.101 to libswscale.so.9.5.102
  /usr/lib/libavcodec.so.62.28.101 moved to /usr/lib/libavcodec.so.62.28.102
  /usr/lib/libavdevice.so.62.3.101 moved to /usr/lib/libavdevice.so.62.3.102
  /usr/lib/libavfilter.so.11.14.101 moved to /usr/lib/libavfilter.so.11.14.102
  /usr/lib/libavformat.so.62.12.101 moved to /usr/lib/libavformat.so.62.12.102
  /usr/lib/libavutil.so.60.26.101 moved to /usr/lib/libavutil.so.60.26.102
  /usr/lib/libswresample.so.6.3.101 moved to /usr/lib/libswresample.so.6.3.102
  /usr/lib/libswscale.so.9.5.101 moved to /usr/lib/libswscale.so.9.5.102

--===============2304553351871288316==--

