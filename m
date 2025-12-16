Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4636AD5C0D6
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17414.1765872163941707034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bPHmzftS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e0usFOwN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ef052-b14b8970-4daf-4525-9c8c-f96fa24364fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QbBj5fcLJs5qcsYxxgb0aiLVJVlyIDRPriiBykCKWWI=;
	b=bPHmzftSQm1XkQpjxGTV311hHufLscic7PnsUPA1wqjtuzbtnitQ3wkuhOLjlvE3
	JawPaTCAubnUqdzCWv7XLWfjamCiJxjXI+Gf1ZZDuAv29C5967so8liyJ/KBwhhAsoS
	bTLe8RguYwVZe5pBqhLROac49Qv34uX96HZXOJjk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QbBj5fcLJs5qcsYxxgb0aiLVJVlyIDRPriiBykCKWWI=;
	b=e0usFOwNrNwzaXVj+VE8szR7Vmptq+kVE8yDa4iAtQLVoi8lGGJq1hdqH9w5t/nV
	YeXvmfIM6N/kt/avMoLCPKychapHRZcNJQ/GNYqa8LFIUsdndaLwBsAJPFEIvYvMHKo
	gIg9T7VbKtx7QM2Ak7/j7hrHcAH/KVRgfMOZ607I=
Content-Type: multipart/mixed; boundary="===============8707899540449516052=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdisplay-info: upgrading to 0.3.0 SUCCEEDED
Message-ID: <0101019b262ef052-b14b8970-4daf-4525-9c8c-f96fa24364fd-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227913

--===============8707899540449516052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdisplay-info* to *0.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdisplay-info-upgrade-0.2.0-0.3.0.patch
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
From bc1f32e53be8281839fe4af6d6703ad8a6d5543f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:10:51 +0000
Subject: [PATCH] libdisplay-info: upgrade 0.2.0 -> 0.3.0

---
 .../{libdisplay-info_0.2.0.bb => libdisplay-info_0.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libdisplay-info/{libdisplay-info_0.2.0.bb => libdisplay-info_0.3.0.bb} (92%)

diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
similarity index 92%
rename from meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
rename to meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
index 812a30495e..3dc02261dd 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
 DEPENDS = "hwdata-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
-SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
+SRCREV = "47a5590e9c4eb35d67651b8c05a55f1a48259329"
 
 inherit meson pkgconfig lib_package
-- 
2.47.1


--===============8707899540449516052==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdisplay-info-upgrade-0.2.0-0.3.0.patch"

RnJvbSBiYzFmMzJlNTNiZTgyODE4MzlmZTRhZjZkNjcwM2FkOGE2ZDU1NDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6MTA6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkaXNwbGF5LWluZm86IHVwZ3JhZGUgMC4yLjAgLT4gMC4zLjAKCi0tLQogLi4uL3tsaWJkaXNw
bGF5LWluZm9fMC4yLjAuYmIgPT4gbGliZGlzcGxheS1pbmZvXzAuMy4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL3tsaWJkaXNwbGF5LWluZm9fMC4y
LjAuYmIgPT4gbGliZGlzcGxheS1pbmZvXzAuMy4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9fMC4yLjAu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZv
XzAuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9fMC4yLjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm9fMC4z
LjAuYmIKaW5kZXggODEyYTMwNDk1ZS4uM2RjMDIyNjFkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mb18wLjIuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZvXzAu
My4wLmJiCkBAIC05LDYgKzksNiBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1lNDQyNjQwOTk1NzA4MGVlMDM1MjEyODM1NGNlYTJkZSIKIERFUEVORFMgPSAiaHdkYXRh
LW5hdGl2ZSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2VtZXJz
aW9uL2xpYmRpc3BsYXktaW5mby5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCi1TUkNS
RVYgPSAiNjZiODAyZDA1YjM3NGNkOGYzODhkYzZhZDFlN2FlNGYwOGNiMzMwMCIKK1NSQ1JFViA9
ICI0N2E1NTkwZTljNGViMzVkNjc2NTFiOGMwNWE1NWYxYTQ4MjU5MzI5IgogCiBpbmhlcml0IG1l
c29uIHBrZ2NvbmZpZyBsaWJfcGFja2FnZQotLSAKMi40Ny4xCgo=

--===============8707899540449516052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGSIZE changed from 63616 to 75904 (+19%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGSIZE changed from 565776 to 662504 (+17%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/displayid2.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGSIZE changed from 87045 to 104854 (+20%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PKGSIZE changed from 563860 to 633321 (+12%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.0.2.0 /usr/lib/libdisplay-info.so.2", added "/usr/lib/libdisplay-info.so.0.3.0 /usr/lib/libdisplay-info.so.3"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info2 to libdisplay-info3
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.2 to libdisplay-info.so.3
  /usr/lib/libdisplay-info.so.0.2.0 moved to /usr/lib/libdisplay-info.so.0.3.0
  /usr/lib/libdisplay-info.so.2 moved to /usr/lib/libdisplay-info.so.3
  /usr/include/libdisplay-info/displayid2.h was added

--===============8707899540449516052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdisplay-info: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-bin: PKGSIZE changed from 63616 to 75904 (+19%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: FILELIST: removed "/usr/lib/.debug/libdisplay-info.so.0.2.0", added "/usr/lib/.debug/libdisplay-info.so.0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dbg: PKGSIZE changed from 565776 to 662504 (+17%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: FILELIST: added "/usr/include/libdisplay-info/displayid2.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-dev: PKGSIZE changed from 87045 to 104854 (+20%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-doc: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-locale: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: FILELIST: removed "/usr/src/debug/libdisplay-info/0.2.0/include/log.h /usr/src/debug/libdisplay-info/0.2.0/include/cta.h /usr/src/debug/libdisplay-info/0.2.0/include/dmt.h /usr/src/debug/libdisplay-info/0.2.0/info.c /usr/src/debug/libdisplay-info/0.2.0/displayid.c /usr/src/debug/libdisplay-info/0.2.0/include/bits.h /usr/src/debug/libdisplay-info/0.2.0/include/displayid.h /usr/src/debug/libdisplay-info/0.2.0/include/memory-stream.h /usr/src/debug/libdisplay-info/0.2.0/edid.c /usr/src/debug/libdisplay-info/0.2.0/cvt.c /usr/src/debug/libdisplay-info/0.2.0/cta.c /usr/src/debug/libdisplay-info/0.2.0/gtf.c /usr/src/debug/libdisplay-info/0.2.0/log.c /usr/src/debug/libdisplay-info/0.2.0/di-edid-decode/displayid.c /usr/src/debug/libdisplay-info/0.2.0/di-edid-decode/cta.c /usr/src/debug/libdisplay-info/0.2.0/include/info.h /usr/src/debug/libdisplay-info/0.2.0/include/di-edid-decode.h /usr/src/debug/libdisplay-info/0.2.0/di-edid
 -decode/edid.c /usr/src/debug/libdisplay-info/0.2.0/di-edid-decode/main.c /usr/src/debug/libdisplay-info/0.2.0/include/libdisplay-info/displayid.h /usr/src/debug/libdisplay-info/0.2.0/memory-stream.c /usr/src/debug/libdisplay-info/0.2.0/include/libdisplay-info/info.h /usr/src/debug/libdisplay-info/0.2.0/include/libdisplay-info/cta.h /usr/src/debug/libdisplay-info/0.2.0/include/libdisplay-info/cvt.h /usr/src/debug/libdisplay-info/0.2.0/include/libdisplay-info/dmt.h /usr/src/debug/libdisplay-info/0.2.0/dmt-table.c /usr/src/debug/libdisplay-info/0.2.0/include/edid.h /usr/src/debug/libdisplay-info/0.2.0/include/libdisplay-info/gtf.h /usr/src/debug/libdisplay-info/0.2.0/pnp-id-table.c /usr/src/debug/libdisplay-info/0.2.0/cta-vic-table.c /usr/src/debug/libdisplay-info/0.2.0/include/libdisplay-info/edid.h", added "/usr/src/debug/libdisplay-info/0.3.0/include/cta.h /usr/src/debug/libdisplay-info/0.3.0/include/dmt.h /usr/src/debug/libdisplay-info/0.3.0/include/log.h /usr/src/debug/libdisplay
 -info/0.3.0/info.c /usr/src/debug/libdisplay-info/0.3.0/displayid.c /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/displayid2.h /usr/src/debug/libdisplay-info/0.3.0/include/bits.h /usr/src/debug/libdisplay-info/0.3.0/include/displayid.h /usr/src/debug/libdisplay-info/0.3.0/include/displayid2.h /usr/src/debug/libdisplay-info/0.3.0/include/memory-stream.h /usr/src/debug/libdisplay-info/0.3.0/edid.c /usr/src/debug/libdisplay-info/0.3.0/cvt.c /usr/src/debug/libdisplay-info/0.3.0/cta.c /usr/src/debug/libdisplay-info/0.3.0/gtf.c /usr/src/debug/libdisplay-info/0.3.0/log.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/displayid.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/cta.c /usr/src/debug/libdisplay-info/0.3.0/include/info.h /usr/src/debug/libdisplay-info/0.3.0/include/di-edid-decode.h /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/main.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/util.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/edid.
 c /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/displayid.h /usr/src/debug/libdisplay-info/0.3.0/memory-stream.c /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/info.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/cta.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/cvt.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/dmt.h /usr/src/debug/libdisplay-info/0.3.0/dmt-table.c /usr/src/debug/libdisplay-info/0.3.0/include/edid.h /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/gtf.h /usr/src/debug/libdisplay-info/0.3.0/hdmi-vic-table.c /usr/src/debug/libdisplay-info/0.3.0/di-edid-decode/displayid2.c /usr/src/debug/libdisplay-info/0.3.0/pnp-id-table.c /usr/src/debug/libdisplay-info/0.3.0/displayid2.c /usr/src/debug/libdisplay-info/0.3.0/cta-vic-table.c /usr/src/debug/libdisplay-info/0.3.0/include/libdisplay-info/edid.h"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-src: PKGSIZE changed from 563860 to 633321 (+12%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info-staticdev: PV changed from "0.2.0" to "0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: FILELIST: removed "/usr/lib/libdisplay-info.so.2 /usr/lib/libdisplay-info.so.0.2.0", added "/usr/lib/libdisplay-info.so.3 /usr/lib/libdisplay-info.so.0.3.0"
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGV changed from 0.2.0 [default] to 0.3.0 [default]
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKG changed from libdisplay-info2 to libdisplay-info3
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PKGSIZE changed from 227256 to 239544 (+5%)
packages/x86-64-v3-poky-linux/libdisplay-info/libdisplay-info: PV changed from "0.2.0" to "0.3.0"
Changes to packages/x86-64-v3-poky-linux/libdisplay-info (sysroot):
  /usr/lib/libdisplay-info.so changed symlink target from libdisplay-info.so.2 to libdisplay-info.so.3
  /usr/lib/libdisplay-info.so.0.2.0 moved to /usr/lib/libdisplay-info.so.0.3.0
  /usr/lib/libdisplay-info.so.2 moved to /usr/lib/libdisplay-info.so.3
  /usr/include/libdisplay-info/displayid2.h was added

--===============8707899540449516052==--

