Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A33C44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 05:32:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13479.1782624743754414327
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 22:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a7uIahjK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ijRSYyL3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f0cb6ebe1-77db9591-3d5c-4180-a22f-73d8af1a8205-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782624742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B+VlqzrE9ggoisHjjR4cW0sh05ILjQsG4aq30eBmk2c=;
	b=a7uIahjKz/EzjlXMEfrehioLGfU6Bm7+KXwTFhzANj7w6In7MahhGQCBbelnH5OS
	dUYH14F2CaKl03pJQdfjvZoIixVElrMT8ZU8yy4tAtJmFGZ2D/urYLjA6CeipPUF6wW
	H9IdZr86ia4JlkcDgGuGMs+XlwqFT83f/wY91JKY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782624742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B+VlqzrE9ggoisHjjR4cW0sh05ILjQsG4aq30eBmk2c=;
	b=ijRSYyL3dQYXxKqbyf2Yey1P5NUsnD6TCMoYACdyE6QIRVSVgN/Z73i8xmPDsO/c
	X33p+gPgWQRjF7XL2vcCCIuffAWaqWBLUgpeF06cBbgYiiW9JImDFDs9REESp522mNa
	FY9avoCc8TMLcqTDIDQEVPTZt2JwNjt0gnTiVdgw=
Content-Type: multipart/mixed; boundary="===============4171732622729613594=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.7 SUCCEEDED
Message-ID: <0101019f0cb6ebe1-77db9591-3d5c-4180-a22f-73d8af1a8205-000000@us-west-2.amazonses.com>
Date: Sun, 28 Jun 2026 05:32:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.28-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239707

--===============4171732622729613594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdk-pixbuf-upgrade-2.44.6-2.44.7.patch
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
From 2929cb7f630da9219ce36662b2a19ca49532477b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 28 Jun 2026 05:26:00 +0000
Subject: [PATCH] gdk-pixbuf: upgrade 2.44.6 -> 2.44.7

---
 ...meson.build-allow-a-subset-of-tests-in-cross-compile.patch | 4 ++--
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch   | 2 +-
 .../gdk-pixbuf/{gdk-pixbuf_2.44.6.bb => gdk-pixbuf_2.44.7.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.6.bb => gdk-pixbuf_2.44.7.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 2b41d1cca9..2e8d414132 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 38bc595a5c365074b924ed2706a402679b3f6df4 Mon Sep 17 00:00:00 2001
+From f54bb27415493fe9d30b6a9103ba7e1497049a8e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -22,7 +22,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index b88ef70..b181054 100644
+index 27c8fe7..6c31bdd 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -434,10 +434,10 @@ subdir('gdk-pixbuf')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 2dd790115d..3c8011daea 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From dc1096f95914b7faf786e3c2682aa0b453605a3f Mon Sep 17 00:00:00 2001
+From fea4b14b45b5e8d0299dd0d0f9241ebaa0bdc690 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
index b2e348ea43..8efc14b59a 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "140c2d0b899fcf853ee92b26373c9dc228dbcde0820a4246693f4328a27466fa"
+SRC_URI[archive.sha256sum] = "172f80e3626ec31520a970400f1a3694e04718f6c2cd2885f75250fb5a6995a4"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 
-- 
2.47.1


--===============4171732622729613594==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gdk-pixbuf-upgrade-2.44.6-2.44.7.patch"

RnJvbSAyOTI5Y2I3ZjYzMGRhOTIxOWNlMzY2NjJiMmExOWNhNDk1MzI0NzdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjggSnVuIDIwMjYgMDU6MjY6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
ZGstcGl4YnVmOiB1cGdyYWRlIDIuNDQuNiAtPiAyLjQ0LjcKCi0tLQogLi4ubWVzb24uYnVpbGQt
YWxsb3ctYS1zdWJzZXQtb2YtdGVzdHMtaW4tY3Jvc3MtY29tcGlsZS5wYXRjaCB8IDQgKystLQog
bWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi9mYXRhbC1sb2FkZXIucGF0
Y2ggICB8IDIgKy0KIC4uLi9nZGstcGl4YnVmL3tnZGstcGl4YnVmXzIuNDQuNi5iYiA9PiBnZGst
cGl4YnVmXzIuNDQuNy5iYn0gfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi97
Z2RrLXBpeGJ1Zl8yLjQ0LjYuYmIgPT4gZ2RrLXBpeGJ1Zl8yLjQ0LjcuYmJ9ICg5NyUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi8wMDAxLW1l
c29uLmJ1aWxkLWFsbG93LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3NzLWNvbXBpbGUucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmLzAwMDEtbWVzb24uYnVp
bGQtYWxsb3ctYS1zdWJzZXQtb2YtdGVzdHMtaW4tY3Jvc3MtY29tcGlsZS5wYXRjaAppbmRleCAy
YjQxZDFjY2E5Li4yZThkNDE0MTMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2Rr
LXBpeGJ1Zi9nZGstcGl4YnVmLzAwMDEtbWVzb24uYnVpbGQtYWxsb3ctYS1zdWJzZXQtb2YtdGVz
dHMtaW4tY3Jvc3MtY29tcGlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBp
eGJ1Zi9nZGstcGl4YnVmLzAwMDEtbWVzb24uYnVpbGQtYWxsb3ctYS1zdWJzZXQtb2YtdGVzdHMt
aW4tY3Jvc3MtY29tcGlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzhiYzU5NWE1YzM2
NTA3NGI5MjRlZDI3MDZhNDAyNjc5YjNmNmRmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZjU0YmIyNzQxNTQ5M2ZlOWQzMGI2YTkxMDNiYTdlMTQ5NzA0OWE4ZSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+
CiBEYXRlOiBUaHUsIDI2IEphbiAyMDIzIDIwOjI5OjQ2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hd
IG1lc29uLmJ1aWxkOiBhbGxvdyAoYSBzdWJzZXQgb2YpIHRlc3RzIGluIGNyb3NzIGNvbXBpbGUK
QEAgLTIyLDcgKzIyLDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hhbmdxaW5nIExpIDxjaGFuZ3Fpbmcu
bGlAd2luZHJpdmVyLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWlu
ZGV4IGI4OGVmNzAuLmIxODEwNTQgMTAwNjQ0CitpbmRleCAyN2M4ZmU3Li42YzMxYmRkIDEwMDY0
NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNDM0LDEwICs0MzQs
MTAgQEAgc3ViZGlyKCdnZGstcGl4YnVmJykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9t
ZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi9mYXRhbC1sb2FkZXIucGF0Y2gKaW5kZXggMmRk
NzkwMTE1ZC4uM2M4MDExZGFlYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dkay1w
aXhidWYvZ2RrLXBpeGJ1Zi9mYXRhbC1sb2FkZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdu
b21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi9mYXRhbC1sb2FkZXIucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGRjMTA5NmY5NTkxNGI3ZmFmNzg2ZTNjMjY4MmFhMGI0NTM2MDVhM2YgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZlYTRiMTRiNDViNWU4ZDAyOTlkZDBkMGY5MjQxZWJh
YTBiZGM2OTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAxIEFwciAyMDE0IDE3OjIzOjM2ICswMTAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGdkay1waXhidWY6IGFkZCBhbiBvcHRpb24gc28gdGhhdCBsb2Fk
ZXIgZXJyb3JzIGFyZSBmYXRhbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dkay1w
aXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjYuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1
Zi9nZGstcGl4YnVmXzIuNDQuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDQuNi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjcuYmIKaW5k
ZXggYjJlMzQ4ZWE0My4uOGVmYzE0YjU5YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjcuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU0VDVElP
TiA9ICJsaWJzIgogCiBERVBFTkRTID0gImdsaWItMi4wIHNoYXJlZC1taW1lLWluZm8iCiAKLVNS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjE0MGMyZDBiODk5ZmNmODUzZWU5MmIyNjM3M2M5
ZGMyMjhkYmNkZTA4MjBhNDI0NjY5M2Y0MzI4YTI3NDY2ZmEiCitTUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICIxNzJmODBlMzYyNmVjMzE1MjBhOTcwNDAwZjFhMzY5NGUwNDcxOGY2YzJjZDI4
ODVmNzUyNTBmYjVhNjk5NWE0IgogCiBpbmhlcml0IGdldHRleHQgZ25vbWViYXNlIHBpeGJ1ZmNh
Y2hlIHB0ZXN0LWdub21lIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBnb2JqZWN0LWludHJvc3Bl
Y3Rpb24gZ2ktZG9jZ2VuIGxpYl9wYWNrYWdlIG1hbnBhZ2VzCiAKLS0gCjIuNDcuMQoK

--===============4171732622729613594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: FILELIST: removed "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.6", added "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PKGSIZE changed from 22259 to 22267 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: FILELIST: directory renamed /usr/src/debug/gdk-pixbuf/2.44.6/gdk-pixbuf/pixops -> /usr/src/debug/gdk-pixbuf/2.44.7/gdk-pixbuf/pixops, directory renamed /usr/src/debug/gdk-pixbuf/2.44.6/gdk-pixbuf -> /usr/src/debug/gdk-pixbuf/2.44.7/gdk-pixbuf, directory renamed /usr/src/debug/gdk-pixbuf/2.44.6/tests -> /usr/src/debug/gdk-pixbuf/2.44.7/tests
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGSIZE changed from 1109953 to 1109967 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.6", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PV changed from "2.44.6" to "2.44.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf: SRC_URI changed from "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.6.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch" to "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.7.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch"
packages/x86-64-v3-poky-linux/gdk-pixbuf: PKGV changed from 2.44.6 [default] to 2.44.7 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf: PACKAGES: added "gdk-pixbuf-locale-lo"
packages/x86-64-v3-poky-linux/gdk-pixbuf: PV changed from "2.44.6" to "2.44.7"
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.6 to libgdk_pixbuf-2.0.so.0.4400.7
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.6 to libgdk_pixbuf-2.0.so.0.4400.7
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7

--===============4171732622729613594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.6", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.7"
packages/x86-64-v3-poky-linux/gdk-pixbuf: PACKAGES: added "gdk-pixbuf-locale-lo"
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.6 to libgdk_pixbuf-2.0.so.0.4400.7
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.6 to libgdk_pixbuf-2.0.so.0.4400.7
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7

--===============4171732622729613594==--

