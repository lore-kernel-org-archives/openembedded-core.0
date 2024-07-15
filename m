Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4300AC53212
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1307.1721071147004331545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Zh5tJ42g;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kotw+kdH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010190b7d59b33-7b43b19b-9ca1-4b96-a689-0e08cfd706c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AptF2MD6/IdfqVvurXqueqSZ6EqcLHSEE1a+jq7wE9I=;
	b=Zh5tJ42gYlKxcDHmPLTsFbQyHeHy8JiBt0Eq0c4fH3f3obEjkUIm0GiaIeXLYQ8J
	5eKIkxU3BjaTRqQAPUFfH5OsVVDEjr/0bqa1azZWg/6M7I99LVnuJZRnpub+evXHPVw
	Ti9HZPdVu/m+FEJlZTLnknhxbpNk5g4GRoNXFlYk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AptF2MD6/IdfqVvurXqueqSZ6EqcLHSEE1a+jq7wE9I=;
	b=kotw+kdHBMDj6MvXMzdpVlVXWC2UCRvTwpk6gn89QazFtWNftJYaW1w9myuMEBxX
	K1iGmXHubQUSuKxZGb+u+QvP2GnQgJQXq49p8xBoCar1Fs5aq99y2aUSn90qhC0eWo8
	9ahJLUaAtW2RfU07LHbfmlZgoK57GM+y6Qw7q/Yg=
Content-Type: multipart/mixed; boundary="===============0256379446303460671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.22.0 SUCCEEDED
Message-ID: <01010190b7d59b33-7b43b19b-9ca1-4b96-a689-0e08cfd706c4-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202012

--===============0256379446303460671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.20.0-2.22.0.patch
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
From a752cefaab8e99e17de3c22d0aab327d02db919d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 15:09:44 +0000
Subject: [PATCH] libva: upgrade 2.20.0 -> 2.22.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.20.0.bb => libva_2.22.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.20.0.bb => libva_2.22.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 486291bced..784ab8b79f 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
+SRC_URI[sha256sum] = "e3da2250654c8d52b3f59f8cb3f3d8e7fb1a2ee64378dbc400fbc5663de7edb8"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.20.0.bb b/meta/recipes-graphics/libva/libva_2.22.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.20.0.bb
rename to meta/recipes-graphics/libva/libva_2.22.0.bb
-- 
2.44.0


--===============0256379446303460671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libva/libva-dev: FILELIST: added "/usr/include/va/va_dri3.h /usr/include/va/va_dec_vvc.h /usr/include/va/va_trace.h"
packages/core2-64-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.2000.0", added "/usr/lib/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-src: PKGSIZE changed from 1106445 to 1254668 (+13%)
packages/core2-64-poky-linux/libva/libva-wayland: PKGSIZE changed from 18689 to 27033 (+45%)
packages/core2-64-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.2000.0", added "/usr/lib/libva-wayland.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-x11: PKGSIZE changed from 26741 to 30837 (+15%)
packages/core2-64-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.2000.0", added "/usr/lib/libva-x11.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva: PKGSIZE changed from 208966 to 233542 (+12%)
packages/core2-64-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.2000.0 /usr/lib/libva.so.2.2000.0", added "/usr/lib/libva-drm.so.2.2200.0 /usr/lib/libva.so.2.2200.0"
Changes to packages/core2-64-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.2000.0 to libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.2000.0 to libva-glx.so.2.2200.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.2000.0 to libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.2000.0 to libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.2000.0 to libva-x11.so.2.2200.0
  /usr/lib/libva-drm.so.2.2000.0 moved to /usr/lib/libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2.2000.0 moved to /usr/lib/libva-glx.so.2.2200.0
  /usr/lib/libva.so.2.2000.0 moved to /usr/lib/libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2.2000.0 moved to /usr/lib/libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2.2000.0 moved to /usr/lib/libva-x11.so.2.2200.0
  /usr/include/va/va_dec_vvc.h was added
  /usr/include/va/va_dri3.h was added
  /usr/include/va/va_trace.h was added

--===============0256379446303460671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.20.0-2.22.0.patch"

RnJvbSBhNzUyY2VmYWFiOGU5OWUxN2RlM2MyMmQwYWFiMzI3ZDAyZGI5MTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTU6MDk6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YTogdXBncmFkZSAyLjIwLjAgLT4gMi4yMi4wCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjIwLjAuYmIgPT4gbGlidmFfMi4yMi4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMjAuMC5iYiA9PiBsaWJ2
YV8yLjIyLjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmlu
ZGV4IDQ4NjI5MWJjZWQuLjc4NGFiOGI3OWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xp
YnZhLmluYwpAQCAtMTgsNyArMTgsNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbGlidmEtJHtQVn0udGFyLmJ6MiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJl
NWVmMDM1Mzc4MDBmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3MmJkYjRmNDhkZmU3MWFkMDFm
MWNiZWZlMDY5NjcyYTJjOTQ5YTZhYmQ1MWNmM2M0ZDQ3ODQyMTBiYWRjNDkiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZTNkYTIyNTA2NTRjOGQ1MmIzZjU5ZjhjYjNmM2Q4ZTdmYjFhMmVlNjQzNzhk
YmM0MDBmYmM1NjYzZGU3ZWRiOCIKIAogUyA9ICIke1dPUktESVJ9L2xpYnZhLSR7UFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4yMC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMjIuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIu
MjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMjIu
MC5iYgotLSAKMi40NC4wCgo=

--===============0256379446303460671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.20.0/libva-2.20.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.22.0/libva-2.22.0.tar.bz2"
packages/core2-64-poky-linux/libva: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-drm.so.2.2000.0 /usr/lib/.debug/libva-wayland.so.2.2000.0 /usr/lib/.debug/libva.so.2.2000.0 /usr/lib/.debug/libva-x11.so.2.2000.0 /usr/lib/.debug/libva-glx.so.2.2000.0", added "/usr/lib/.debug/libva-drm.so.2.2200.0 /usr/lib/.debug/libva-wayland.so.2.2200.0 /usr/lib/.debug/libva-x11.so.2.2200.0 /usr/lib/.debug/libva.so.2.2200.0 /usr/lib/.debug/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-dbg: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-dbg: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dbg: PKGSIZE changed from 850184 to 934936 (+10%)
packages/core2-64-poky-linux/libva/libva-dev: FILELIST: added "/usr/include/va/va_dri3.h /usr/include/va/va_trace.h /usr/include/va/va_dec_vvc.h"
packages/core2-64-poky-linux/libva/libva-dev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-dev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dev: PKGSIZE changed from 652185 to 713337 (+9%)
packages/core2-64-poky-linux/libva/libva-doc: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-doc: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.2000.0", added "/usr/lib/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-glx: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-glx: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-locale: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-locale: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.20.0/va/drm -> /usr/src/debug/libva/2.22.0/va/drm, directory renamed /usr/src/debug/libva/2.20.0/va/x11 -> /usr/src/debug/libva/2.22.0/va/x11, directory renamed /usr/src/debug/libva/2.20.0/va/glx -> /usr/src/debug/libva/2.22.0/va/glx, removed "/usr/src/debug/libva/2.20.0/va/wayland-drm-client-protocol.h /usr/src/debug/libva/2.20.0/va/va_drmcommon.h /usr/src/debug/libva/2.20.0/va/wayland-drm-client-protocol.c /usr/src/debug/libva/2.20.0/va/va_x11.h /usr/src/debug/libva/2.20.0/va/va_str.h /usr/src/debug/libva/2.20.0/va/va_dec_av1.h /usr/src/debug/libva/2.20.0/va/va_enc_av1.h /usr/src/debug/libva/2.20.0/va/va_str.c /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.20.0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.20.0/va/va_internal.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.20.0/va/va_dec_jpeg.h /usr/src/debug/
 libva/2.20.0/va/va_enc_jpeg.h /usr/src/debug/libva/2.20.0/va/va_prot.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.20.0/va/va_dec_hevc.h /usr/src/debug/libva/2.20.0/va/va_enc_hevc.h /usr/src/debug/libva/2.20.0/va/va_trace.h /usr/src/debug/libva/2.20.0/va/va_backend_vpp.h /usr/src/debug/libva/2.20.0/va/va_trace.c /usr/src/debug/libva/2.20.0/va/wayland/va_wayland.c /usr/src/debug/libva/2.20.0/va/va_backend_prot.h /usr/src/debug/libva/2.20.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.20.0/va/va_vpp.h /usr/src/debug/libva/2.20.0/va/va.c /usr/src/debug/libva/2.20.0/va/va_backend.h /usr/src/debug/libva/2.20.0/va/va_compat.c /usr/src/debug/libva/2.20.0/va/va_dec_vp8.h /usr/src/debug/libva/2.20.0/va/va.h /usr/src/debug/libva/2.20.0/va/va_dec_vp9.h /usr/src/debug/libva/2.20.0/va/va_enc_vp8.h /usr/src/debug/libva/2.20.0/va/va_enc_vp9.h /usr/src/debug/libva/2.20.0/va/va_enc_h264.h", added "/usr/src/debug/libva/2.22.0/va/va_backend.h /usr/src/debug/libva/2.22.0/
 va/va_internal.h /usr/src/debug/libva/2.22.0/va/va_backend_prot.h /usr/src/debug/libva/2.22.0/va/va_enc_vp8.h /usr/src/debug/libva/2.22.0/va/va_dec_vp8.h /usr/src/debug/libva/2.22.0/va/va_drmcommon.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.22.0/va/linux-dmabuf-v1-client-protocol.c /usr/src/debug/libva/2.22.0/va/va.c /usr/src/debug/libva/2.22.0/va/wayland-drm-client-protocol.c /usr/src/debug/libva/2.22.0/va/va_enc_h264.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.22.0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.22.0/va/wayland-drm-client-protocol.h /usr/src/debug/libva/2.22.0/va/va.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_linux_dmabuf.h /usr/src/debug/libva/2.22.0/va/linux-dmabuf-v1-client-protocol.h /usr/src/debug/libva/2.22.0/va/va_compat.c /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_linux_dmabuf.c /usr/src/debug/libva/2.
 22.0/va/va_x11.h /usr/src/debug/libva/2.22.0/va/va_backend_vpp.h /usr/src/debug/libva/2.22.0/va/va_vpp.h /usr/src/debug/libva/2.22.0/va/va_dec_vvc.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland.c /usr/src/debug/libva/2.22.0/va/va_enc_av1.h /usr/src/debug/libva/2.22.0/va/va_dec_av1.h /usr/src/debug/libva/2.22.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.22.0/va/va_dec_vp9.h /usr/src/debug/libva/2.22.0/va/va_enc_vp9.h /usr/src/debug/libva/2.22.0/va/va_trace.h /usr/src/debug/libva/2.22.0/va/va_trace.c /usr/src/debug/libva/2.22.0/va/va_enc_hevc.h /usr/src/debug/libva/2.22.0/va/va_dec_hevc.h /usr/src/debug/libva/2.22.0/va/va_prot.h /usr/src/debug/libva/2.22.0/va/va_str.c /usr/src/debug/libva/2.22.0/va/va_dec_jpeg.h /usr/src/debug/libva/2.22.0/va/va_enc_jpeg.h /usr/src/debug/libva/2.22.0/va/va_str.h"
packages/core2-64-poky-linux/libva/libva-src: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-src: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-src: PKGSIZE changed from 1106445 to 1254668 (+13%)
packages/core2-64-poky-linux/libva/libva-staticdev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-staticdev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.2000.0", added "/usr/lib/libva-wayland.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-wayland: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-wayland: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-wayland: PKGSIZE changed from 18689 to 27033 (+45%)
packages/core2-64-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.2000.0", added "/usr/lib/libva-x11.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-x11: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-x11: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-x11: PKGSIZE changed from 26741 to 30837 (+15%)
packages/core2-64-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.2000.0 /usr/lib/libva-drm.so.2.2000.0", added "/usr/lib/libva.so.2.2200.0 /usr/lib/libva-drm.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva: PKGSIZE changed from 208966 to 233542 (+12%)
Changes to packages/core2-64-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.2000.0 to libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.2000.0 to libva-glx.so.2.2200.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.2000.0 to libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.2000.0 to libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.2000.0 to libva-x11.so.2.2200.0
  /usr/lib/libva-drm.so.2.2000.0 moved to /usr/lib/libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2.2000.0 moved to /usr/lib/libva-glx.so.2.2200.0
  /usr/lib/libva.so.2.2000.0 moved to /usr/lib/libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2.2000.0 moved to /usr/lib/libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2.2000.0 moved to /usr/lib/libva-x11.so.2.2200.0
  /usr/include/va/va_dec_vvc.h was added
  /usr/include/va/va_dri3.h was added
  /usr/include/va/va_trace.h was added

--===============0256379446303460671==--

