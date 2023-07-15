Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9EEC19F4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.6032.1689456454968061103
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OtKiqAbb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101895b73afbf-562cd820-4f45-40bb-aa6c-f832cc4d6667-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f8ahqMgCZO6MWzfMW9vNioT8dIWOBUwM2Cq5NXIa8A0=;
	b=OtKiqAbbMHcxbHlAWCoUs2yo+cpCbfdZ33ATl80CSfHT1qMOzeCnMXS0yc0zVxHq
	5gNj7qmGeWpOr3ScF5V8oVxfSBSVBKPyrDemBEcBp/wuwEZex7f8jjmFShySo4+fzwC
	aiccC8olZpmunfcEkguPMgSm9CzM84PwcWI5lfjs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f8ahqMgCZO6MWzfMW9vNioT8dIWOBUwM2Cq5NXIa8A0=;
	b=BbmBj1H4uzT38TlS0aS2RRnnfbCUwg1O7lVb1IRxE/JtJ+O2GGKIkFBMcAnMrfuh
	9EOcwInbcC1o9SH8G/sZgo0FIAV/+DpDHCTDn8a4mFZ+RbleLRiIdL2pRZQB4tqJJdL
	1mwRT0PIBdlj5HX5HGHudPIu2CibRXcyzdlWFFAQ=
Content-Type: multipart/mixed; boundary="===============2775586256053322658=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.19.0 SUCCEEDED
Message-ID: <010101895b73afbf-562cd820-4f45-40bb-aa6c-f832cc4d6667-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184387

--===============2775586256053322658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.18.0-2.19.0.patch
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
From fff25f4e104c3f32212e3872b21e5d8ec06bb03f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 17:19:24 +0000
Subject: [PATCH] libva: upgrade 2.18.0 -> 2.19.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.18.0.bb => libva_2.19.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.18.0.bb => libva_2.19.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 7ed0c9ed89..3388fea32b 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "a3577eeba0c23924686c7e2f2030073736c8282a80f27b5473e33ea94ccd4982"
+SRC_URI[sha256sum] = "963be798d559df7feebda6fa81aa0dae6f9409c633a37909c44c6aa8af1e2174"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.18.0.bb b/meta/recipes-graphics/libva/libva_2.19.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.18.0.bb
rename to meta/recipes-graphics/libva/libva_2.19.0.bb
-- 
2.39.2


--===============2775586256053322658==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.18.0-2.19.0.patch"

RnJvbSBmZmYyNWY0ZTEwNGMzZjMyMjEyZTM4NzJiMjFlNWQ4ZWMwNmJiMDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTc6MTk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YTogdXBncmFkZSAyLjE4LjAgLT4gMi4xOS4wCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjE4LjAuYmIgPT4gbGlidmFfMi4xOS4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTguMC5iYiA9PiBsaWJ2
YV8yLjE5LjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmlu
ZGV4IDdlZDBjOWVkODkuLjMzODhmZWEzMmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xp
YnZhLmluYwpAQCAtMTgsNyArMTgsNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbGlidmEtJHtQVn0udGFyLmJ6MiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJl
NWVmMDM1Mzc4MDBmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEzNTc3ZWViYTBjMjM5MjQ2ODZj
N2UyZjIwMzAwNzM3MzZjODI4MmE4MGYyN2I1NDczZTMzZWE5NGNjZDQ5ODIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTYzYmU3OThkNTU5ZGY3ZmVlYmRhNmZhODFhYTBkYWU2Zjk0MDljNjMzYTM3
OTA5YzQ0YzZhYThhZjFlMjE3NCIKIAogUyA9ICIke1dPUktESVJ9L2xpYnZhLSR7UFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xOC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTkuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIu
MTguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTku
MC5iYgotLSAKMi4zOS4yCgo=

--===============2775586256053322658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.18.0/libva-2.18.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.19.0/libva-2.19.0.tar.bz2"
packages/core2-32-poky-linux/libva: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 719000 to 723012 (+1%)
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-glx.so.2.1800.0 /usr/lib/.debug/libva-drm.so.2.1800.0 /usr/lib/.debug/libva-x11.so.2.1800.0 /usr/lib/.debug/libva.so.2.1800.0 /usr/lib/.debug/libva-wayland.so.2.1800.0", added "/usr/lib/.debug/libva-x11.so.2.1900.0 /usr/lib/.debug/libva.so.2.1900.0 /usr/lib/.debug/libva-glx.so.2.1900.0 /usr/lib/.debug/libva-drm.so.2.1900.0 /usr/lib/.debug/libva-wayland.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 649621 to 650353 (+0%)
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1800.0", added "/usr/lib/libva-glx.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 1102368 to 1106040 (+0%)
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1800.0", added "/usr/lib/libva-wayland.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1800.0", added "/usr/lib/libva-x11.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
packages/core2-32-poky-linux/libva/libva: PKGSIZE changed from 236242 to 240338 (+2%)
packages/core2-32-poky-linux/libva/libva: PV changed from "2.18.0" to "2.19.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.1800.0 /usr/lib/libva-drm.so.2.1800.0", added "/usr/lib/libva-drm.so.2.1900.0 /usr/lib/libva.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.18.0 [default] to 2.19.0 [default]
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1800.0 to libva-drm.so.2.1900.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1800.0 to libva-glx.so.2.1900.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1800.0 to libva.so.2.1900.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1800.0 to libva-wayland.so.2.1900.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1800.0 to libva-x11.so.2.1900.0
  /usr/lib/libva-drm.so.2.1800.0 moved to /usr/lib/libva-drm.so.2.1900.0
  /usr/lib/libva-glx.so.2.1800.0 moved to /usr/lib/libva-glx.so.2.1900.0
  /usr/lib/libva.so.2.1800.0 moved to /usr/lib/libva.so.2.1900.0
  /usr/lib/libva-wayland.so.2.1800.0 moved to /usr/lib/libva-wayland.so.2.1900.0
  /usr/lib/libva-x11.so.2.1800.0 moved to /usr/lib/libva-x11.so.2.1900.0

--===============2775586256053322658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1800.0", added "/usr/lib/libva-glx.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1800.0", added "/usr/lib/libva-wayland.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1800.0", added "/usr/lib/libva-x11.so.2.1900.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.1800.0 /usr/lib/libva-drm.so.2.1800.0", added "/usr/lib/libva-drm.so.2.1900.0 /usr/lib/libva.so.2.1900.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1800.0 to libva-drm.so.2.1900.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1800.0 to libva-glx.so.2.1900.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1800.0 to libva.so.2.1900.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1800.0 to libva-wayland.so.2.1900.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1800.0 to libva-x11.so.2.1900.0
  /usr/lib/libva-drm.so.2.1800.0 moved to /usr/lib/libva-drm.so.2.1900.0
  /usr/lib/libva-glx.so.2.1800.0 moved to /usr/lib/libva-glx.so.2.1900.0
  /usr/lib/libva.so.2.1800.0 moved to /usr/lib/libva.so.2.1900.0
  /usr/lib/libva-wayland.so.2.1800.0 moved to /usr/lib/libva-wayland.so.2.1900.0
  /usr/lib/libva-x11.so.2.1800.0 moved to /usr/lib/libva-x11.so.2.1900.0

--===============2775586256053322658==--

