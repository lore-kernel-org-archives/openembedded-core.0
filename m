Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD68CD12B3
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2019.1711994603019178899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HnV575wM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=R8e1SVQc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e9ad483e8-06ff39c5-958c-4d9d-a61d-397a4f911dc1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NocHC2Zj2OC0xEjZf4EkNdM/gxkx6dZvVERGU8W+Nsc=;
	b=HnV575wMUar6S8m/jRjKP8hcDxw2o5vqq1SLvSy4EUgtoEfINc8DGnWy1Ch5HlIO
	NnQn41IHBucM1+XMCspqCBLxGpCk1ckgD4vysRsSt3lifdzGEW4RKD7DqJCvl7TXuXA
	FZOdtExBngHPTIVRD+uS0P6n+QKbb2z5X5x9HJCI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NocHC2Zj2OC0xEjZf4EkNdM/gxkx6dZvVERGU8W+Nsc=;
	b=R8e1SVQciV7Sc9TZ6NJaalQVQHrHNFMEV+MSqWxkGRfEX3b0StVKNA2dSb6PyMyk
	pDiCxmbIBPbDiULTwwzyB8kYp4WpqH4Kh3S93C78Fyq8DRPw9SBfWKvA7HA/izlEJMX
	8azJ6vSqAwtk29LVnpN4gbMonwjnxMCfqsCoUeKo=
Content-Type: multipart/mixed; boundary="===============5927105067587012508=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-initial: upgrading to 2.21.0 FAILED
Message-ID: <0101018e9ad483e8-06ff39c5-958c-4d9d-a61d-397a4f911dc1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197788

--===============5927105067587012508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-initial* to *2.21.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libva-initial /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.

INFO: No patches or local source files needed updating
INFO: Cleaning sysroot for recipe libva-initial...
ERROR: Command 'bitbake -c clean libva-initial' failed, output:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.

If you wish, you may specify -n/--no-clean to skip running this command when resetting


Next steps:
    - apply the patch: git am 0001-libva-initial-upgrade-2.20.0-2.21.0.patch
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
From 06b36a10b0df31bdca19435e488bd30d82cd663a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 13:01:24 +0000
Subject: [PATCH] libva-initial: upgrade 2.20.0 -> 2.21.0

---
 .../libva/libva-initial_2.20.0.bb             |  8 ----
 meta/recipes-graphics/libva/libva.inc         | 37 -------------------
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/libva-initial_2.20.0.bb
 delete mode 100644 meta/recipes-graphics/libva/libva.inc

diff --git a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb b/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
deleted file mode 100644
index 453096822f..0000000000
--- a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libva.inc
-
-PACKAGECONFIG ?= ""
-
-do_install:append () {
-	rm -f ${D}${libdir}/*.so*
-}
-
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
deleted file mode 100644
index 486291bced..0000000000
--- a/meta/recipes-graphics/libva/libva.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Video Acceleration (VA) API for Linux"
-DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
-and API specification which enables and provides access to graphics \
-hardware (GPU) acceleration for video processing on Linux and UNIX \
-based operating systems. Accelerated processing includes video \
-decoding, video encoding, subpicture blending and rendering. The \
-specification was originally designed by Intel for its GMA (Graphics \
-Media Accelerator) series of GPU hardware, the API is however not \
-limited to GPUs or Intel specific hardware, as other hardware and \
-manufacturers can also freely use this API for hardware accelerated \
-video decoding."
-
-HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/intel/libva/issues"
-
-SECTION = "x11"
-LICENSE = "MIT"
-
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
-
-S = "${WORKDIR}/libva-${PV}"
-
-GITHUB_BASE_URI = "https://github.com/intel/libva/releases"
-
-DEPENDS = "libdrm"
-
-inherit meson pkgconfig github-releases
-
-PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxext libxfixes"
-PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
-
-PACKAGECONFIG[wayland] = "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
-
-BBCLASSEXTEND = "native nativesdk"
-
-- 
2.42.0


--===============5927105067587012508==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-initial-upgrade-2.20.0-2.21.0.patch"

RnJvbSAwNmIzNmExMGIwZGYzMWJkY2ExOTQzNWU0ODhiZDMwZDgyY2Q2NjNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMzowMToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnZhLWluaXRpYWw6IHVwZ3JhZGUgMi4yMC4wIC0+IDIuMjEuMAoKLS0tCiAuLi4vbGlidmEvbGli
dmEtaW5pdGlhbF8yLjIwLjAuYmIgICAgICAgICAgICAgfCAgOCAtLS0tCiBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbGlidmEvbGlidmEuaW5jICAgICAgICAgfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQ1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS1pbml0aWFsXzIuMjAuMC5iYgogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjIwLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjIwLjAuYmIK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDQ1MzA5NjgyMmYuLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4yMC4wLmJiCisr
KyAvZGV2L251bGwKQEAgLTEsOCArMCwwIEBACi1yZXF1aXJlIGxpYnZhLmluYwotCi1QQUNLQUdF
Q09ORklHID89ICIiCi0KLWRvX2luc3RhbGw6YXBwZW5kICgpIHsKLQlybSAtZiAke0R9JHtsaWJk
aXJ9Lyouc28qCi19Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9s
aWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0ODYyOTFiY2VkLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIC9kZXYvbnVsbApAQCAtMSwzNyAr
MCwwIEBACi1TVU1NQVJZID0gIlZpZGVvIEFjY2VsZXJhdGlvbiAoVkEpIEFQSSBmb3IgTGludXgi
Ci1ERVNDUklQVElPTiA9ICJWaWRlbyBBY2NlbGVyYXRpb24gQVBJIChWQSBBUEkpIGlzIGEgbGli
cmFyeSAobGliVkEpIFwKLWFuZCBBUEkgc3BlY2lmaWNhdGlvbiB3aGljaCBlbmFibGVzIGFuZCBw
cm92aWRlcyBhY2Nlc3MgdG8gZ3JhcGhpY3MgXAotaGFyZHdhcmUgKEdQVSkgYWNjZWxlcmF0aW9u
IGZvciB2aWRlbyBwcm9jZXNzaW5nIG9uIExpbnV4IGFuZCBVTklYIFwKLWJhc2VkIG9wZXJhdGlu
ZyBzeXN0ZW1zLiBBY2NlbGVyYXRlZCBwcm9jZXNzaW5nIGluY2x1ZGVzIHZpZGVvIFwKLWRlY29k
aW5nLCB2aWRlbyBlbmNvZGluZywgc3VicGljdHVyZSBibGVuZGluZyBhbmQgcmVuZGVyaW5nLiBU
aGUgXAotc3BlY2lmaWNhdGlvbiB3YXMgb3JpZ2luYWxseSBkZXNpZ25lZCBieSBJbnRlbCBmb3Ig
aXRzIEdNQSAoR3JhcGhpY3MgXAotTWVkaWEgQWNjZWxlcmF0b3IpIHNlcmllcyBvZiBHUFUgaGFy
ZHdhcmUsIHRoZSBBUEkgaXMgaG93ZXZlciBub3QgXAotbGltaXRlZCB0byBHUFVzIG9yIEludGVs
IHNwZWNpZmljIGhhcmR3YXJlLCBhcyBvdGhlciBoYXJkd2FyZSBhbmQgXAotbWFudWZhY3R1cmVy
cyBjYW4gYWxzbyBmcmVlbHkgdXNlIHRoaXMgQVBJIGZvciBoYXJkd2FyZSBhY2NlbGVyYXRlZCBc
Ci12aWRlbyBkZWNvZGluZy4iCi0KLUhPTUVQQUdFID0gImh0dHBzOi8vMDEub3JnL2xpbnV4bWVk
aWEvdmFhcGkiCi1CVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9saWJ2YS9p
c3N1ZXMiCi0KLVNFQ1RJT04gPSAieDExIgotTElDRU5TRSA9ICJNSVQiCi0KLVNSQ19VUkkgPSAi
JHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L2xpYnZhLSR7UFZ9LnRhci5iejIiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yZTQ4OTQwZjk0YWNiMGFmNTgy
ZTVlZjAzNTM3ODAwZiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzJiZGI0ZjQ4ZGZlNzFhZDAx
ZjFjYmVmZTA2OTY3MmEyYzk0OWE2YWJkNTFjZjNjNGQ0Nzg0MjEwYmFkYzQ5IgotCi1TID0gIiR7
V09SS0RJUn0vbGlidmEtJHtQVn0iCi0KLUdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwvbGlidmEvcmVsZWFzZXMiCi0KLURFUEVORFMgPSAibGliZHJtIgotCi1pbmhl
cml0IG1lc29uIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKLQotUEFDS0FHRUNPTkZJR1t4MTFd
ID0gIi1Ed2l0aF94MTE9eWVzLC1Ed2l0aF94MTE9bm8sdmlydHVhbC9saWJ4MTEgbGlieGV4dCBs
aWJ4Zml4ZXMiCi1QQUNLQUdFQ09ORklHW2dseF0gPSAiLUR3aXRoX2dseD15ZXMsLUR3aXRoX2ds
eD1ubyx2aXJ0dWFsL21lc2EiCi0KLVBBQ0tBR0VDT05GSUdbd2F5bGFuZF0gPSAiLUR3aXRoX3dh
eWxhbmQ9eWVzLC1Ed2l0aF93YXlsYW5kPW5vLHdheWxhbmQtbmF0aXZlIHdheWxhbmQiCi0KLUJC
Q0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLQotLSAKMi40Mi4wCgo=

--===============5927105067587012508==--

