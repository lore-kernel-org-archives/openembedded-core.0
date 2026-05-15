Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDACCD5BC5
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34833.1778851234760561502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vcc59c4F;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CBU8akyC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e2bcbd7d9-8be09318-d714-4a29-82cf-812fdb2df797-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=faCkgdEOzQ7LIX0uUNDVE5r84x1QuGL9VrD9c58/jIs=;
	b=Vcc59c4F9W2OHUBSaw5esL7Trp2Zcr2z1J3HO8nKToMEt6aKlRMMd5aaDzhtcLKQ
	d/ibOXTYSkWJrxp5367D2lBcuuie7fJNP6RquLqVaHpd9XNEl4Za/MKN1lo21k1q373
	xHfl0+qgoOKZR3dx28PzGd9R8d0NJYF575K9xKxI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=faCkgdEOzQ7LIX0uUNDVE5r84x1QuGL9VrD9c58/jIs=;
	b=CBU8akyC9fsDj+fcHlMDyuUJvWvRTPveasUDqZ894h+ErEJFY3K55qhB3t8JGb43
	Vqi10Y3Mw0+y8ZkhISAJWRg6lQ0STomXc19/PJwo8eJ7LjWCx8PV5/r9iduhuHDQ12I
	23MjyI7S8U8iaPHorb5KxA1oE+oJPv72wQNGABnU=
Content-Type: multipart/mixed; boundary="===============2612272958102041941=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-devtools: upgrading to 1.28.3 SUCCEEDED
Message-ID: <0101019e2bcbd7d9-8be09318-d714-4a29-82cf-812fdb2df797-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237150

--===============2612272958102041941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.28.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.28.2-1.28.3.patch
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
From 2f22f9ebcd4d45eefa158e13e77f87cce4b94362 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 11:01:47 +0000
Subject: [PATCH] gst-devtools: upgrade 1.28.2 -> 1.28.3

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.28.2.bb => gst-devtools_1.28.3.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.2.bb => gst-devtools_1.28.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a..b6dad456ab 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From 8798171c03f5dab53d73734632fa5eda5707ed44 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.3.bb
index cbe488a049..f1d666bcca 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8e012bdcb55503f466d53f1f05e13e8993c69811b9db77cd16a8f6467723bf91"
+SRC_URI[sha256sum] = "2b558e3fd9a8a2d4ebad65119753340842bc80ceefb7b7c145843853221fc731"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.47.1


--===============2612272958102041941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 3070120 to 3070912 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2802.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2802.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2803.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2803.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 1014249 to 1014244 (-0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: FILELIST: directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/plugins/gapplication -> /usr/src/debug/gst-devtools/1.28.3/validate/plugins/gapplication, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/plugins/fault_injection -> /usr/src/debug/gst-devtools/1.28.3/validate/plugins/fault_injection, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/gst/validate/flow -> /usr/src/debug/gst-devtools/1.28.3/validate/gst/validate/flow, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/tools -> /usr/src/debug/gst-devtools/1.28.3/validate/tools, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/gst/overrides -> /usr/src/debug/gst-devtools/1.28.3/validate/gst/overrides, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/gst/validate -> /usr/src/debug/gst-devtools/1.28.3/validate/gst/validate
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGSIZE changed from 1502462 to 1502635 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 /usr/lib/libgstvalidate-1.0.so.0.2802.0", added "/usr/lib/libgstvalidate-1.0.so.0.2803.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2803.0"
packages/x86-64-v3-poky-linux/gst-devtools: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gst-devtools: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.28.2.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.28.3.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2802.0 to libgstvalidate-1.0.so.0.2803.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2802.0 to libgstvalidate-default-overrides-1.0.so.0.2803.0
  /usr/lib/libgstvalidate-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2803.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2803.0

--===============2612272958102041941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 /usr/lib/libgstvalidate-1.0.so.0.2802.0", added "/usr/lib/libgstvalidate-1.0.so.0.2803.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2803.0"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2802.0 to libgstvalidate-1.0.so.0.2803.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2802.0 to libgstvalidate-default-overrides-1.0.so.0.2803.0
  /usr/lib/libgstvalidate-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2803.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2803.0

--===============2612272958102041941==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.28.2-1.28.3.patch"

RnJvbSAyZjIyZjllYmNkNGQ0NWVlZmExNThlMTNlNzdmODdjY2U0Yjk0MzYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTE6MDE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yOC4yIC0+IDEuMjguMwoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI4LjIuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjguMy5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI4LjIuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjguMy5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggMzRmY2Y2YTMwYS4u
YjZkYWQ0NTZhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTNiMGQ4ZTU1YWQ0OTBjOGU4NjdjNzQwZGEyYTAwZWI0
OTMxOWY4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODc5ODE3MWMwM2Y1ZGFiNTNk
NzM3MzQ2MzJmYTVlZGE1NzA3ZWQ0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yOC4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI4LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI4LjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yOC4zLmJiCmluZGV4IGNiZTQ4OGEwNDkuLmYxZDY2NmJjY2EgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yOC4yLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yOC4z
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGUwMTJiZGNiNTU1
MDNmNDY2ZDUzZjFmMDVlMTNlODk5M2M2OTgxMWI5ZGI3N2NkMTZhOGY2NDY3NzIzYmY5MSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIyYjU1OGUzZmQ5YThhMmQ0ZWJhZDY1MTE5NzUzMzQwODQyYmM4
MGNlZWZiN2I3YzE0NTg0Mzg1MzIyMWZjNzMxIgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ3LjEKCg==

--===============2612272958102041941==--

