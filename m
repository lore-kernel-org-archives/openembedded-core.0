Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966C2C2BA1A
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13434.1713248038760375095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SM/KjgD7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JoSx67rB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a6cc4-c68d5346-18ac-4bb3-8a56-20fcfbcef5c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3p72iHVGvk/Lf5EiySKsAuvMe1HZWYd20C9/uAI+KBc=;
	b=SM/KjgD7FZImOaQfCIUM0m0pyyP7Gn0KvXEG//36r5gvk4VwoZyBd1mE+NuGhb5N
	cEaGJJrbNSv1i8LjTREM9rurocqoAnSpTKpas911HvLTqcRfvTQwmVNBQL++upzS/+t
	gfv1cnJIgKIq7KRtbIpe/ETrHTF2Sy+h7PptoaPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3p72iHVGvk/Lf5EiySKsAuvMe1HZWYd20C9/uAI+KBc=;
	b=JoSx67rBe1BoS7/Rjh1dzJ1i6FNQwXEuhHlz8t8XTHNwh6FwWeL3JlT/es6bglx+
	7pcZdBpp3rIE5tpgQYGlf/O0vROo/RCiuXMJaiehcyrw5QlLKObEdJaAfeTaACDX2sB
	JiCMPQU3DAglK9o8yuGFcdmiuLejw60wURCIZA+U=
Content-Type: multipart/mixed; boundary="===============2836169099041741192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.2.0 SUCCEEDED
Message-ID: <0101018ee58a6cc4-c68d5346-18ac-4bb3-8a56-20fcfbcef5c1-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198274

--===============2836169099041741192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.1.1-2.2.0.patch
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
From efdf18164e0f67af7a4c10c5e08e7ce831ae87e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:51:32 +0000
Subject: [PATCH] pkgconf: upgrade 2.1.1 -> 2.2.0

---
 .../pkgconf/{pkgconf_2.1.1.bb => pkgconf_2.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.1.1.bb => pkgconf_2.2.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
index 33d69451bb..e98458ea55 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "3a224f2accf091b77a5781316e27b9ee3ba82c083cc2e539e08940b68a44fec5"
+SRC_URI[sha256sum] = "b06ff63a83536aa8c2f6422fa80ad45e4833f590266feb14eaddfe1d4c853c69"
 
 inherit autotools
 
-- 
2.42.0


--===============2836169099041741192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.4 /usr/lib/libpkgconf.so.4.0.0", added "/usr/lib/libpkgconf.so.5 /usr/lib/libpkgconf.so.5.0.0"
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.4.0.0 to libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4.0.0 moved to /usr/lib/libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4 moved to /usr/lib/libpkgconf.so.5

--===============2836169099041741192==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.1.1-2.2.0.patch"

RnJvbSBlZmRmMTgxNjRlMGY2N2FmN2E0YzEwYzVlMDhlN2NlODMxYWU4N2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NTE6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuMS4xIC0+IDIuMi4wCgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzIuMS4xLmJiID0+IHBrZ2NvbmZfMi4yLjAuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzIuMS4xLmJiID0+IHBrZ2NvbmZfMi4yLjAu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8yLjEuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4y
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjIuMC5iYgppbmRleCAzM2Q2OTQ1MWJiLi5lOTg0NThlYTU1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIuMS4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4yLjAuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIzYTIyNGYyYWNjZjA5MWI3N2E1NzgxMzE2ZTI3YjllZTNiYTgyYzA4M2NjMmU1
MzllMDg5NDBiNjhhNDRmZWM1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIwNmZmNjNhODM1MzZh
YThjMmY2NDIyZmE4MGFkNDVlNDgzM2Y1OTAyNjZmZWIxNGVhZGRmZTFkNGM4NTNjNjkiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuNDIuMAoK

--===============2836169099041741192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.1.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.2.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 315272 to 315040 (-0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.4.0.0", added "/usr/lib/.debug/libpkgconf.so.5.0.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24495 to 24378 (-0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 274832 to 275510 (+0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.1.1" to "2.2.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.4.0.0 /usr/lib/libpkgconf.so.4", added "/usr/lib/libpkgconf.so.5.0.0 /usr/lib/libpkgconf.so.5"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.1.1 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.1.1" to "2.2.0"
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.4.0.0 to libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4.0.0 moved to /usr/lib/libpkgconf.so.5.0.0
  /usr/lib/libpkgconf.so.4 moved to /usr/lib/libpkgconf.so.5

--===============2836169099041741192==--

