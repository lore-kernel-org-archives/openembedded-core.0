Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0922C52D74
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1315.1721071148688272010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d/qUg/4L;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ti0uJvU3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010190b7d59c7a-8f44e18e-4d9c-4547-9a1d-8c25b30e4d02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/VIadUPS9uI4yF9oLQaq7NVK6W4MV3VM2uCun8d2Hsw=;
	b=d/qUg/4LpjFEIi8+cR3dnYZjGQnO5MTX+UjgsxEnI1FqvH1w+UTyumK5HqAqVolc
	UCDxAmaZZtV0+KYGeM0Ov1g6X2aIDPm2UaGsM+cvysVrGLYFF0oi75UWCmcBkj2rpHy
	Zch2LIkvcmgixcF4EWwoONsIrMrmzAyaY7yj8438=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/VIadUPS9uI4yF9oLQaq7NVK6W4MV3VM2uCun8d2Hsw=;
	b=ti0uJvU3BdCaDvX80z/07z78F+lrhaSkkaMebvrAsEa18f87saRPe9lGjJsgfIzl
	dMajVpP7KMsYu0uiybAOQJT2TwnJ03kAazM+WMZTKuNukjpS1cBaqzz+7qfcR9kCno8
	THZCMXUKm/hi4N9kTzywS0QSx0X4USo2MdKJU0h4=
Content-Type: multipart/mixed; boundary="===============7717068277153302109=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.24.5 SUCCEEDED
Message-ID: <01010190b7d59c7a-8f44e18e-4d9c-4547-9a1d-8c25b30e4d02-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202034

--===============7717068277153302109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.24.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.24.4-1.24.5.patch
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
From 04962aa14af4e911445e828e5d582cac56b04fa9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 16:03:53 +0000
Subject: [PATCH] gst-devtools: upgrade 1.24.4 -> 1.24.5

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.4.bb => gst-devtools_1.24.5.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.4.bb => gst-devtools_1.24.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 8520567f17..00c0926c33 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From c20894a5e6f52aa9fe3437e733a228b1a0eb6428 Mon Sep 17 00:00:00 2001
+From 60377e0b7bf2ae083ec79115cacc50b1ce79648e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
index eca0753cf2..d4a81b69a1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8bff1b388522e03d761786e61fe9aff1f9867b8f7cc230043cbb2622dcf6f0fe"
+SRC_URI[sha256sum] = "a96675898129a480d05bbf91071ec4e40154dcad6d62f3944154a6cb326045a4"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.44.0


--===============7717068277153302109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0 /usr/lib/libgstvalidate-1.0.so.0.2404.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0 /usr/lib/libgstvalidate-1.0.so.0.2405.0"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2404.0 to libgstvalidate-1.0.so.0.2405.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2404.0 to libgstvalidate-default-overrides-1.0.so.0.2405.0
  /usr/lib/libgstvalidate-1.0.so.0.2404.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2405.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0

--===============7717068277153302109==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.24.4-1.24.5.patch"

RnJvbSAwNDk2MmFhMTRhZjRlOTExNDQ1ZTgyOGU1ZDU4MmNhYzU2YjA0ZmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTY6MDM6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNC40IC0+IDEuMjQuNQoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI0LjQuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjQuNS5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI0LjQuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjQuNS5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggODUyMDU2N2YxNy4u
MDBjMDkyNmMzMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzIwODk0YTVlNmY1MmFhOWZlMzQzN2U3MzNhMjI4YjFh
MGViNjQyOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjAzNzdlMGI3YmYyYWUwODNl
Yzc5MTE1Y2FjYzUwYjFjZTc5NjQ4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yNC40LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI0LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0LjQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yNC41LmJiCmluZGV4IGVjYTA3NTNjZjIuLmQ0YTgxYjY5YTEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNC40LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNC41
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGJmZjFiMzg4NTIy
ZTAzZDc2MTc4NmU2MWZlOWFmZjFmOTg2N2I4ZjdjYzIzMDA0M2NiYjI2MjJkY2Y2ZjBmZSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJhOTY2NzU4OTgxMjlhNDgwZDA1YmJmOTEwNzFlYzRlNDAxNTRk
Y2FkNmQ2MmYzOTQ0MTU0YTZjYjMyNjA0NWE0IgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ0LjAKCg==

--===============7717068277153302109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2404.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2404.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2405.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2405.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2404.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0", added "/usr/lib/libgstvalidate-1.0.so.0.2405.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gst-devtools: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.4.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.5.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-64-poky-linux/gst-devtools: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2404.0 to libgstvalidate-1.0.so.0.2405.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2404.0 to libgstvalidate-default-overrides-1.0.so.0.2405.0
  /usr/lib/libgstvalidate-1.0.so.0.2404.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2405.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0

--===============7717068277153302109==--

