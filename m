Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63030C36002
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.115405.1726410841873129932
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cUVUFjKv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vFTbYW3G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61adcec-03857842-6f3f-43c1-b05b-8a9a4c4dfca0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gEUeeRLbRxgW3GegaLGGl+kn5n1LNM7iJ+MDeIqjBSs=;
	b=cUVUFjKvto3L6XScSARvyhs88dV6G1O4fgLV38qNOrv/TqcxqBXCxCQOirc85TfQ
	WS4zoBKZVr0jBOh0sNItv6RKS7M/quGfbPufV+aCxTsHtbKTcThb/vEzOJDO2mBGllU
	/w4GAWJs8iMBFkm41Uh5AJyjIYDL/sZrQxTgjog8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gEUeeRLbRxgW3GegaLGGl+kn5n1LNM7iJ+MDeIqjBSs=;
	b=vFTbYW3G++g2tW9UUyD6OzBftkkv1tTie03zlSgAyrAkSHAzaSQwAkvLMinIbOyC
	7ArbZJ4syX1mhNOhsKv9EBKiL3Vp6vQ1dR5o3egV7lxz4guqtRPFxqroLF/khdC/XBb
	9wVnzIlHy6mjpa77VULBhEcfgB+S5bjh/doosTkY=
Content-Type: multipart/mixed; boundary="===============6163752592774309940=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.24.7 SUCCEEDED
Message-ID: <01010191f61adcec-03857842-6f3f-43c1-b05b-8a9a4c4dfca0-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204571

--===============6163752592774309940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.24.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.24.6-1.24.7.patch
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
From a6fc7ccdfbc955fd8701a5fe54d27a6bfe605499 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 12:22:25 +0000
Subject: [PATCH] gst-devtools: upgrade 1.24.6 -> 1.24.7

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.6.bb => gst-devtools_1.24.7.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.6.bb => gst-devtools_1.24.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index f2bb664140..1326c4d3d8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From d0e3b04007d60755cf1c092c1cac29e832290b86 Mon Sep 17 00:00:00 2001
+From 40de015bfaee14a87c884e12f4dc989e8506139f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb
index 1b448f7c55..f59049828e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8beb9e98ed136c29f4ec10396dd6c8708a5645cdacda90af1b7196057de17672"
+SRC_URI[sha256sum] = "e7aa7a23fa587d58dc5a7bb51efb5ad79f6f2a4c5987564c66f633b5bbd38b17"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.44.0


--===============6163752592774309940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2406.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2407.0 /usr/lib/libgstvalidate-1.0.so.0.2407.0"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2406.0 to libgstvalidate-1.0.so.0.2407.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2406.0 to libgstvalidate-default-overrides-1.0.so.0.2407.0
  /usr/lib/libgstvalidate-1.0.so.0.2406.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2407.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2407.0

--===============6163752592774309940==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.24.6-1.24.7.patch"

RnJvbSBhNmZjN2NjZGZiYzk1NWZkODcwMWE1ZmU1NGQyN2E2YmZlNjA1NDk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTI6MjI6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNC42IC0+IDEuMjQuNwoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI0LjYuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjQuNy5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI0LjYuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjQuNy5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggZjJiYjY2NDE0MC4u
MTMyNmM0ZDNkOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDBlM2IwNDAwN2Q2MDc1NWNmMWMwOTJjMWNhYzI5ZTgz
MjI5MGI4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDBkZTAxNWJmYWVlMTRhODdj
ODg0ZTEyZjRkYzk4OWU4NTA2MTM5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yNC42LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI0LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0LjYu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yNC43LmJiCmluZGV4IDFiNDQ4ZjdjNTUuLmY1OTA0OTgyOGUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNC42LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNC43
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGJlYjllOThlZDEz
NmMyOWY0ZWMxMDM5NmRkNmM4NzA4YTU2NDVjZGFjZGE5MGFmMWI3MTk2MDU3ZGUxNzY3MiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJlN2FhN2EyM2ZhNTg3ZDU4ZGM1YTdiYjUxZWZiNWFkNzlmNmYy
YTRjNTk4NzU2NGM2NmY2MzNiNWJiZDM4YjE3IgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ0LjAKCg==

--===============6163752592774309940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2406.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2406.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2407.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2407.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 2673648 to 2673120 (-0%)
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 965990 to 966053 (+0%)
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2406.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2407.0 /usr/lib/libgstvalidate-1.0.so.0.2407.0"
packages/core2-64-poky-linux/gst-devtools: PV changed from "1.24.6" to "1.24.7"
packages/core2-64-poky-linux/gst-devtools: PKGV changed from 1.24.6 [default] to 1.24.7 [default]
packages/core2-64-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.6.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.7.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2406.0 to libgstvalidate-1.0.so.0.2407.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2406.0 to libgstvalidate-default-overrides-1.0.so.0.2407.0
  /usr/lib/libgstvalidate-1.0.so.0.2406.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2407.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2407.0

--===============6163752592774309940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 78 recipes from the core2-64 sysroot...done.
Removing 83 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-e12aeac194890e9ad9164c638d1d435c29e7210a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e12aeac194890e9ad9164c638d1d435c29e7210a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 654 Local 635 Mirrors 0 Missed 19 Current 290 (97% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 293 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 294 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 295 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb:do_populate_lic_setscene)
NOTE: Running setscene task 316 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe git-2.46.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.46.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.46.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gst-devtools-1.24.7-r0: task do_populate_lic_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gst-devtools-1.24.7-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 337 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 346 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 347 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 348 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.46.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 350 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 354 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 356 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 364 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 365 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/orc/0.4.39/temp/log.do_packagedata_setscene.3032021
NOTE: Running setscene task 368 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_create_spdx_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 369 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_package_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 370 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.46.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 371 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-2.46.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 377 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 383 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 392 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: recipe git-2.46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 395 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 396 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_packagedata_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 397 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe git-2.46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 424 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 447 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 449 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 452 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 453 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 457 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 461 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 474 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 478 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 482 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 484 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 488 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 489 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 498 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 506 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 508 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 516 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.39-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 523 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 524 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 525 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 528 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 533 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 536 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 540 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 547 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 552 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 563 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 569 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 574 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 582 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 592 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 594 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 596 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 643 of 944 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe orc-native-0.4.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 732 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-native-0.4.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 735 of 944 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-native-0.4.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 752 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-native-0.4.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 944 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 766 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-native-0.4.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-native-0.4.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 877 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: Running task 1035 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1154 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_fetch)
NOTE: Running task 1161 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: Running task 1190 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1198 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_write_config)
NOTE: Running task 1203 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb:do_write_config)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 796 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.24.7-r0: task do_recipe_qa: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.24.7-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 1239 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.24.7-r0: task do_write_config: Succeeded
NOTE: Running task 1245 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.24.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1246 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb:do_fetch)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: Running setscene task 800 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gst-devtools-1.24.7-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gst-devtools-1.24.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 813 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 816 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 822 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 834 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 856 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1268 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1269 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb:do_unpack)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-devtools-1.24.7-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Started
NOTE: Running setscene task 866 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 871 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe gst-devtools-1.24.7-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1635 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.24.7-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.24.7-r0: task do_patch: Succeeded
NOTE: Running task 1691 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.7.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe gst-devtools-1.24.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 907 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.24.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 943 of 944 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2190 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2409 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2459 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_packagedata)
NOTE: Running task 2555 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.39-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2569 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2570 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2571 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2572 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2573 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 2574 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2575 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2576 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: Running task 2577 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2578 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: Running task 2579 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 2580 of 2601 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2580 tasks of which 2550 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915122134.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915122134.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/json-glib/1.8.0/temp/log.do_packagedata.3042937
Summary: There were 80 ERROR messages, returning a non-zero exit code.
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc-src went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dbg went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc-examples went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc-staticdev went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dev went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc-doc went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc-locale went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package orc went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-0.4 went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-test-0.4 went backwards which would break package feeds (from 0:0.4.40-r0 to 0:0.4.39-r0) [version-going-backwards]
ERROR: orc-0.4.39-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-ptest went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ab went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-as went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-be went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bn-in went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bs went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-cs went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-da went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-de went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-el went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-en-gb went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eo went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-es went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-et went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eu went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fa went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fr went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fur went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-gl went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-he went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hi went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hr went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hu went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-id went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-it went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ja went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ka went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ko went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ky went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lt went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lv went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ml went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ms went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nb went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ne went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nl went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-oc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-or went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pa went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pl went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt-br went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ro went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ru went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sk went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sl went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sv went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-te went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tr went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ug went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-uk went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-vi went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib-bin went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: QA Issue: Package version for package json-glib went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: json-glib-1.8.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/json-glib/1.8.0/temp/log.do_packagedata.3042937
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata) failed with exit code '1'

--===============6163752592774309940==--

