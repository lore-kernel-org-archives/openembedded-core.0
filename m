Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DA9CDB491
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.102722.1697399115863804493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VIhM3qaP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lf/Tr2ii;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b34df0e54-f46e1512-60e3-4e98-a5d7-3084f1fb6931-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wa4hitefOm5oj31v2J4ii0+tFaVaAewfaKe/baJ4Ffg=;
	b=VIhM3qaPbi4HRwn0oN7vspE91F9jF6Kru+LRUa7PPjmtWGrfrIUCMPbRnjWdWQaj
	me8328Mkees2HF4nJkqN1/YVXvykKOTMl5GcbYmKonL+tByijXyJHPsPK2vYxtBtJZ1
	xWvMrJqySgPdEDe8fi+HzmXlIGxtqDlhc4iZQH48=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wa4hitefOm5oj31v2J4ii0+tFaVaAewfaKe/baJ4Ffg=;
	b=lf/Tr2ii/UTL/tFW8aqvA+rYccDc2zkmTcnf7j3YT7P8ZBJCXH461SZLROTDqyBl
	0mQBKFqa6JdxkeBOuA4LbgksqFCeeRLU9cZ9cF4IU4V76MnRO/quYVO5l19qHhoDPTC
	C19V3S4NtinctXQE0T20izhXOPQkpSqFR35tFmCw=
Content-Type: multipart/mixed; boundary="===============0024493465042249592=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.20.0 SUCCEEDED
Message-ID: <0101018b34df0e54-f46e1512-60e3-4e98-a5d7-3084f1fb6931-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189232

--===============0024493465042249592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.19.0-2.20.0.patch
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
From 6dcff186516d7bb1930bc75604320dd5914b39d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 16:27:40 +0000
Subject: [PATCH] libva: upgrade 2.19.0 -> 2.20.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.19.0.bb => libva_2.20.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.19.0.bb => libva_2.20.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 3388fea32b..486291bced 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "963be798d559df7feebda6fa81aa0dae6f9409c633a37909c44c6aa8af1e2174"
+SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.19.0.bb b/meta/recipes-graphics/libva/libva_2.20.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.19.0.bb
rename to meta/recipes-graphics/libva/libva_2.20.0.bb
-- 
2.39.2


--===============0024493465042249592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1900.0", added "/usr/lib/libva-glx.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1900.0", added "/usr/lib/libva-wayland.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGSIZE changed from 17921 to 13825 (-23%)
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1900.0", added "/usr/lib/libva-x11.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.1900.0 /usr/lib/libva-drm.so.2.1900.0", added "/usr/lib/libva.so.2.2000.0 /usr/lib/libva-drm.so.2.2000.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1900.0 to libva-drm.so.2.2000.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1900.0 to libva-glx.so.2.2000.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1900.0 to libva.so.2.2000.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1900.0 to libva-wayland.so.2.2000.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1900.0 to libva-x11.so.2.2000.0
  /usr/lib/libva-drm.so.2.1900.0 moved to /usr/lib/libva-drm.so.2.2000.0
  /usr/lib/libva-glx.so.2.1900.0 moved to /usr/lib/libva-glx.so.2.2000.0
  /usr/lib/libva.so.2.1900.0 moved to /usr/lib/libva.so.2.2000.0
  /usr/lib/libva-wayland.so.2.1900.0 moved to /usr/lib/libva-wayland.so.2.2000.0
  /usr/lib/libva-x11.so.2.1900.0 moved to /usr/lib/libva-x11.so.2.2000.0

--===============0024493465042249592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.19.0/libva-2.19.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.20.0/libva-2.20.0.tar.bz2"
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-wayland.so.2.1900.0 /usr/lib/.debug/libva-x11.so.2.1900.0 /usr/lib/.debug/libva-glx.so.2.1900.0 /usr/lib/.debug/libva.so.2.1900.0 /usr/lib/.debug/libva-drm.so.2.1900.0", added "/usr/lib/.debug/libva-wayland.so.2.2000.0 /usr/lib/.debug/libva-drm.so.2.2000.0 /usr/lib/.debug/libva.so.2.2000.0 /usr/lib/.debug/libva-glx.so.2.2000.0 /usr/lib/.debug/libva-x11.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 723052 to 728056 (+1%)
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 650353 to 652185 (+0%)
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1900.0", added "/usr/lib/libva-glx.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.19.0-r0/va/drm -> /usr/src/debug/libva/2.20.0-r0/va/drm, directory renamed /usr/src/debug/libva/2.19.0-r0/va/wayland -> /usr/src/debug/libva/2.20.0-r0/va/wayland, directory renamed /usr/src/debug/libva/2.19.0-r0/va/glx -> /usr/src/debug/libva/2.20.0-r0/va/glx, directory renamed /usr/src/debug/libva/2.19.0-r0/va -> /usr/src/debug/libva/2.20.0-r0/va, removed "/usr/src/debug/libva/2.19.0-r0/va/x11/dri2_util.c /usr/src/debug/libva/2.19.0-r0/va/x11/va_dricommon.c /usr/src/debug/libva/2.19.0-r0/va/x11/va_dri2str.h /usr/src/debug/libva/2.19.0-r0/va/x11/va_dri2.c /usr/src/debug/libva/2.19.0-r0/va/x11/va_dri3.h /usr/src/debug/libva/2.19.0-r0/va/x11/va_dri2.h /usr/src/debug/libva/2.19.0-r0/va/x11/va_dricommon.h /usr/src/debug/libva/2.19.0-r0/va/x11/va_dri3.c /usr/src/debug/libva/2.19.0-r0/va/x11/va_x11.c", added "/usr/src/debug/libva/2.20.0-r0/va/x11/va_dri3.h /usr/src/debug/libva/2.20.0-r0/va/x11/
 va_dricommon.h /usr/src/debug/libva/2.20.0-r0/va/x11/va_x11.c /usr/src/debug/libva/2.20.0-r0/va/x11/va_dri2_priv.h /usr/src/debug/libva/2.20.0-r0/va/x11/va_dricommon.c /usr/src/debug/libva/2.20.0-r0/va/x11/va_dri3.c /usr/src/debug/libva/2.20.0-r0/va/x11/va_dri2.c /usr/src/debug/libva/2.20.0-r0/va/x11/dri2_util.c /usr/src/debug/libva/2.20.0-r0/va/x11/va_dri2str.h /usr/src/debug/libva/2.20.0-r0/va/x11/va_dri2.h"
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 1106040 to 1106424 (+0%)
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1900.0", added "/usr/lib/libva-wayland.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGSIZE changed from 17921 to 13825 (-23%)
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1900.0", added "/usr/lib/libva-x11.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.1900.0 /usr/lib/libva.so.2.1900.0", added "/usr/lib/libva-drm.so.2.2000.0 /usr/lib/libva.so.2.2000.0"
packages/core2-32-poky-linux/libva/libva: PV changed from "2.19.0" to "2.20.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.19.0 [default] to 2.20.0 [default]
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1900.0 to libva-drm.so.2.2000.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1900.0 to libva-glx.so.2.2000.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1900.0 to libva.so.2.2000.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1900.0 to libva-wayland.so.2.2000.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1900.0 to libva-x11.so.2.2000.0
  /usr/lib/libva-drm.so.2.1900.0 moved to /usr/lib/libva-drm.so.2.2000.0
  /usr/lib/libva-glx.so.2.1900.0 moved to /usr/lib/libva-glx.so.2.2000.0
  /usr/lib/libva.so.2.1900.0 moved to /usr/lib/libva.so.2.2000.0
  /usr/lib/libva-wayland.so.2.1900.0 moved to /usr/lib/libva-wayland.so.2.2000.0
  /usr/lib/libva-x11.so.2.1900.0 moved to /usr/lib/libva-x11.so.2.2000.0

--===============0024493465042249592==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.19.0-2.20.0.patch"

RnJvbSA2ZGNmZjE4NjUxNmQ3YmIxOTMwYmM3NTYwNDMyMGRkNTkxNGIzOWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTY6Mjc6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YTogdXBncmFkZSAyLjE5LjAgLT4gMi4yMC4wCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjE5LjAuYmIgPT4gbGlidmFfMi4yMC4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTkuMC5iYiA9PiBsaWJ2
YV8yLjIwLjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmlu
ZGV4IDMzODhmZWEzMmIuLjQ4NjI5MWJjZWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xp
YnZhLmluYwpAQCAtMTgsNyArMTgsNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbGlidmEtJHtQVn0udGFyLmJ6MiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJl
NWVmMDM1Mzc4MDBmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk2M2JlNzk4ZDU1OWRmN2ZlZWJk
YTZmYTgxYWEwZGFlNmY5NDA5YzYzM2EzNzkwOWM0NGM2YWE4YWYxZTIxNzQiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjcyYmRiNGY0OGRmZTcxYWQwMWYxY2JlZmUwNjk2NzJhMmM5NDlhNmFiZDUx
Y2YzYzRkNDc4NDIxMGJhZGM0OSIKIAogUyA9ICIke1dPUktESVJ9L2xpYnZhLSR7UFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xOS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMjAuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIu
MTkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMjAu
MC5iYgotLSAKMi4zOS4yCgo=

--===============0024493465042249592==--

