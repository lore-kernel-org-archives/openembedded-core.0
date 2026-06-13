Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCD4CD98DF
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:34 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87194.1781337025623345509
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hm82jmfN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UHZ/tdTB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ebff5e9a6-0bdaa310-9f2f-4e1c-97b0-0b65eefa051e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337025;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZQNJfdDFyWiGY2gfs7Zvge5RUxM3TbAIroOZan4hXJc=;
	b=Hm82jmfNeUl6QS8UON6ysdRKTCvaBRtB2QERDQ51LORh0vwDb+q6rRlLFM+5Dg8I
	qdgj9zSPz+6lznZRkVvLal9KfOg9ekK5TMmyPugUh+xbIr/PDamws8YPY7aitp/69iq
	W8UESYdXd5dZw3F/m8CUdUGOLrtiHHnu5Yfu4SGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337025;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZQNJfdDFyWiGY2gfs7Zvge5RUxM3TbAIroOZan4hXJc=;
	b=UHZ/tdTBe+Cd84KKLqO0ydX/gzY9A8ilgETNDITNr0LryDXaczTYZ5dHapgLQHIm
	6ybPuZX5s9W1PRx6dW1r76A59888X4QdGVYq4ADlQ5AyuM/Y4beUMaNYoF1oGQZQyXM
	0PGDRYUWZ4zpwUva0YcOpO6lEkOZwwVChZG12AEk=
Content-Type: multipart/mixed; boundary="===============7690389769721067528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-devtools: upgrading to 1.28.4 SUCCEEDED
Message-ID: <0101019ebff5e9a6-0bdaa310-9f2f-4e1c-97b0-0b65eefa051e-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238658

--===============7690389769721067528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.28.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.28.2-1.28.4.patch
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
From aedda7ac24cafcca7e5056f4a5abd13c4472a9e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:32:09 +0000
Subject: [PATCH] gst-devtools: upgrade 1.28.2 -> 1.28.4

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.28.2.bb => gst-devtools_1.28.4.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.2.bb => gst-devtools_1.28.4.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a..a348624e49 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From bb36ab400ee8b84b8f604aa3314952b7df2aeda6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
index cbe488a049..9641e42d38 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8e012bdcb55503f466d53f1f05e13e8993c69811b9db77cd16a8f6467723bf91"
+SRC_URI[sha256sum] = "11d4f1188639d3a9762039065bbb7b2c309b7a8ecc6fa4aed12245568bf00db3"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.47.1


--===============7690389769721067528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2802.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2802.0", added "/usr/lib/.debug/libgstvalidate-1.0.so.0.2804.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2804.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 3113328 to 3114136 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: FILELIST: directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/plugins/gapplication -> /usr/src/debug/gst-devtools/1.28.4/validate/plugins/gapplication, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/gst/validate/flow -> /usr/src/debug/gst-devtools/1.28.4/validate/gst/validate/flow, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/tools -> /usr/src/debug/gst-devtools/1.28.4/validate/tools, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/plugins/fault_injection -> /usr/src/debug/gst-devtools/1.28.4/validate/plugins/fault_injection, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/gst/validate -> /usr/src/debug/gst-devtools/1.28.4/validate/gst/validate, directory renamed /usr/src/debug/gst-devtools/1.28.2/validate/gst/overrides -> /usr/src/debug/gst-devtools/1.28.4/validate/gst/overrides
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 1014249 to 1014244 (-0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 /usr/lib/libgstvalidate-1.0.so.0.2802.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2804.0 /usr/lib/libgstvalidate-1.0.so.0.2804.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGSIZE changed from 1527038 to 1527851 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.28.2.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.28.4.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/x86-64-v3-poky-linux/gst-devtools: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gst-devtools: PV changed from "1.28.2" to "1.28.4"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2802.0 to libgstvalidate-1.0.so.0.2804.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2802.0 to libgstvalidate-default-overrides-1.0.so.0.2804.0
  /usr/lib/libgstvalidate-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2804.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2804.0

--===============7690389769721067528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 /usr/lib/libgstvalidate-1.0.so.0.2802.0", added "/usr/lib/libgstvalidate-1.0.so.0.2804.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2804.0"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2802.0 to libgstvalidate-1.0.so.0.2804.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2802.0 to libgstvalidate-default-overrides-1.0.so.0.2804.0
  /usr/lib/libgstvalidate-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2804.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2802.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2804.0

--===============7690389769721067528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.28.2-1.28.4.patch"

RnJvbSBhZWRkYTdhYzI0Y2FmY2NhN2U1MDU2ZjRhNWFiZDEzYzQ0NzJhOWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6MzI6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yOC4yIC0+IDEuMjguNAoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI4LjIuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjguNC5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI4LjIuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjguNC5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggMzRmY2Y2YTMwYS4u
YTM0ODYyNGU0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTNiMGQ4ZTU1YWQ0OTBjOGU4NjdjNzQwZGEyYTAwZWI0
OTMxOWY4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmIzNmFiNDAwZWU4Yjg0Yjhm
NjA0YWEzMzE0OTUyYjdkZjJhZWRhNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yOC4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI4LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI4LjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yOC40LmJiCmluZGV4IGNiZTQ4OGEwNDkuLjk2NDFlNDJkMzggMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yOC4yLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yOC40
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGUwMTJiZGNiNTU1
MDNmNDY2ZDUzZjFmMDVlMTNlODk5M2M2OTgxMWI5ZGI3N2NkMTZhOGY2NDY3NzIzYmY5MSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIxMWQ0ZjExODg2MzlkM2E5NzYyMDM5MDY1YmJiN2IyYzMwOWI3
YThlY2M2ZmE0YWVkMTIyNDU1NjhiZjAwZGIzIgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ3LjEKCg==

--===============7690389769721067528==--

