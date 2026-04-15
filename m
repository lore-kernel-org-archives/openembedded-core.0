Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF18F428D8
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19826.1776261883261738456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AhXsDEHK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xiRSy5RO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d917578ff-f2a8fec3-72c4-4e41-a099-22673e2fe60f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261889;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9VTzwraH/PVvXDBNEpH+z2ZOTXSvz9HzcP3C7mOzycI=;
	b=AhXsDEHKV5C04tMK75MkX9AC6MY8QiZrxiJnCKamJeCEZkgRJbLnkrt4JEdEvhV6
	fLE1B4JBR2+qLAOV30iSHbtwV28KVIBgrThwjYbcmbEOV5UB6Fdq9krAH+W9SepBd4J
	T/sZ2WwF49mnDqr4Hcindn3ZKa6DIv2q2F58JpF4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261889;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9VTzwraH/PVvXDBNEpH+z2ZOTXSvz9HzcP3C7mOzycI=;
	b=xiRSy5RO9KgTu+GSS3V8OY0aqiC8ZYxYTxMQW78TulFHWKR0SUQ0hyAzHxtNqpEf
	50xM1TZxdn2y0rvSP/gmbjQX1wyKjVKcYlzDWxk00NRRiCYFSkH2P0B/3EEb+DOZWYB
	V4d01Mo+vw7LBFa/bIUOwB4xh371nt8hn8dF1hMw=
Content-Type: multipart/mixed; boundary="===============5697903017906220478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.6 SUCCEEDED
Message-ID: <0101019d917578ff-f2a8fec3-72c4-4e41-a099-22673e2fe60f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235274

--===============5697903017906220478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdk-pixbuf-upgrade-2.44.5-2.44.6.patch
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
From 4fa8e1aace2742848ed78d162211089e2b25f3d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 11:23:37 +0000
Subject: [PATCH] gdk-pixbuf: upgrade 2.44.5 -> 2.44.6

---
 ....build-allow-a-subset-of-tests-in-cross-compile.patch | 9 +++------
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch             | 4 ++--
 .../{gdk-pixbuf_2.44.5.bb => gdk-pixbuf_2.44.6.bb}       | 2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.5.bb => gdk-pixbuf_2.44.6.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 45b9aa60c4..a93c7c5eea 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 3b6aab24f6844b7d5b3e166bc910bffbcee1f6f5 Mon Sep 17 00:00:00 2001
+From 6e60e30160262775a554cef16de02aacba7bbb1d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -22,10 +22,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index f478326..464ae1d 100644
+index b88ef70..b181054 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -428,10 +428,10 @@ subdir('gdk-pixbuf')
+@@ -434,10 +434,10 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -67,6 +67,3 @@ index 9b96fdc..9c3ed7d 100644
  
  foreach test_name, test_data: installed_tests
    test_sources = [ test_name + '.c', 'test-common.c' ]
--- 
-2.34.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 3b4bf62861..bf9a8fc44c 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From f78ab4edaee5f62663a9a4bcfa56e5c524da4474 Mon Sep 17 00:00:00 2001
+From d297fdf9341e8dded3ec8ee6ff53358c226bc768 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index baa9a5c..9b6fa89 100644
+index 5228c6f..46ffa35 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
 @@ -216,7 +216,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
index 9ed9a272e0..d9c0d0ab65 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "69b93e09139b80c0ee661503d60deb5a5874a31772b5184b9cd5462a4100ab68"
+SRC_URI[archive.sha256sum] = "140c2d0b899fcf853ee92b26373c9dc228dbcde0820a4246693f4328a27466fa"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 
-- 
2.47.1


--===============5697903017906220478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.5", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.6"
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6

--===============5697903017906220478==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gdk-pixbuf-upgrade-2.44.5-2.44.6.patch"

RnJvbSA0ZmE4ZTFhYWNlMjc0Mjg0OGVkNzhkMTYyMjExMDg5ZTJiMjVmM2QzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTE6MjM6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
ZGstcGl4YnVmOiB1cGdyYWRlIDIuNDQuNSAtPiAyLjQ0LjYKCi0tLQogLi4uLmJ1aWxkLWFsbG93
LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3NzLWNvbXBpbGUucGF0Y2ggfCA5ICsrKy0tLS0tLQog
Li4uL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi9mYXRhbC1sb2FkZXIucGF0Y2ggICAgICAgICAgICAg
fCA0ICsrLS0KIC4uLi97Z2RrLXBpeGJ1Zl8yLjQ0LjUuYmIgPT4gZ2RrLXBpeGJ1Zl8yLjQ0LjYu
YmJ9ICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYve2dkay1waXhi
dWZfMi40NC41LmJiID0+IGdkay1waXhidWZfMi40NC42LmJifSAoOTclKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvMDAwMS1tZXNvbi5idWls
ZC1hbGxvdy1hLXN1YnNldC1vZi10ZXN0cy1pbi1jcm9zcy1jb21waWxlLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi8wMDAxLW1lc29uLmJ1aWxkLWFsbG93
LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3NzLWNvbXBpbGUucGF0Y2gKaW5kZXggNDViOWFhNjBj
NC4uYTkzYzdjNWVlYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYv
Z2RrLXBpeGJ1Zi8wMDAxLW1lc29uLmJ1aWxkLWFsbG93LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNy
b3NzLWNvbXBpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2Rr
LXBpeGJ1Zi8wMDAxLW1lc29uLmJ1aWxkLWFsbG93LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3Nz
LWNvbXBpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNiNmFhYjI0ZjY4NDRiN2Q1YjNl
MTY2YmM5MTBiZmZiY2VlMWY2ZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZlNjBl
MzAxNjAyNjI3NzVhNTU0Y2VmMTZkZTAyYWFjYmE3YmJiMWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTog
VGh1LCAyNiBKYW4gMjAyMyAyMDoyOTo0NiArMDEwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbi5i
dWlsZDogYWxsb3cgKGEgc3Vic2V0IG9mKSB0ZXN0cyBpbiBjcm9zcyBjb21waWxlCkBAIC0yMiwx
MCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2lu
ZHJpdmVyLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IGY0
NzgzMjYuLjQ2NGFlMWQgMTAwNjQ0CitpbmRleCBiODhlZjcwLi5iMTgxMDU0IDEwMDY0NAogLS0t
IGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtNDI4LDEwICs0MjgsMTAgQEAg
c3ViZGlyKCdnZGstcGl4YnVmJykKK0BAIC00MzQsMTAgKzQzNCwxMCBAQCBzdWJkaXIoJ2dkay1w
aXhidWYnKQogICMgaTE4bgogIHN1YmRpcigncG8nKQogIApAQCAtNjcsNiArNjcsMyBAQCBpbmRl
eCA5Yjk2ZmRjLi45YzNlZDdkIDEwMDY0NAogIAogIGZvcmVhY2ggdGVzdF9uYW1lLCB0ZXN0X2Rh
dGE6IGluc3RhbGxlZF90ZXN0cwogICAgdGVzdF9zb3VyY2VzID0gWyB0ZXN0X25hbWUgKyAnLmMn
LCAndGVzdC1jb21tb24uYycgXQotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi9mYXRhbC1sb2FkZXIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaApp
bmRleCAzYjRiZjYyODYxLi5iZjlhOGZjNDRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25v
bWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gZjc4YWI0ZWRhZWU1ZjYyNjYzYTlhNGJjZmE1NmU1YzUyNGRhNDQ3
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDI5N2ZkZjkzNDFlOGRkZWQzZWM4ZWU2
ZmY1MzM1OGMyMjZiYzc2OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVy
dG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDEgQXByIDIwMTQgMTc6MjM6
MzYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2RrLXBpeGJ1ZjogYWRkIGFuIG9wdGlvbiBzbyB0
aGF0IGxvYWRlciBlcnJvcnMgYXJlIGZhdGFsCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYt
Ynk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9nZGstcGl4
YnVmL3F1ZXJ5bG9hZGVycy5jIGIvZ2RrLXBpeGJ1Zi9xdWVyeWxvYWRlcnMuYwotaW5kZXggYmFh
OWE1Yy4uOWI2ZmE4OSAxMDA2NDQKK2luZGV4IDUyMjhjNmYuLjQ2ZmZhMzUgMTAwNjQ0CiAtLS0g
YS9nZGstcGl4YnVmL3F1ZXJ5bG9hZGVycy5jCiArKysgYi9nZGstcGl4YnVmL3F1ZXJ5bG9hZGVy
cy5jCiBAQCAtMjE2LDcgKzIxNiw3IEBAIHdyaXRlX2xvYWRlcl9pbmZvIChHU3RyaW5nICpjb250
ZW50cywgY29uc3QgY2hhciAqcGF0aCwgR2RrUGl4YnVmRm9ybWF0ICppbmZvKQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjUuYmIgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDQuNi5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9n
ZGstcGl4YnVmXzIuNDQuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhi
dWYvZ2RrLXBpeGJ1Zl8yLjQ0LjYuYmIKaW5kZXggOWVkOWEyNzJlMC4uZDljMGQwYWI2NSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjYu
YmIKQEAgLTE0LDcgKzE0LDcgQEAgU0VDVElPTiA9ICJsaWJzIgogCiBERVBFTkRTID0gImdsaWIt
Mi4wIHNoYXJlZC1taW1lLWluZm8iCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjY5
YjkzZTA5MTM5YjgwYzBlZTY2MTUwM2Q2MGRlYjVhNTg3NGEzMTc3MmI1MTg0YjljZDU0NjJhNDEw
MGFiNjgiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIxNDBjMmQwYjg5OWZjZjg1M2Vl
OTJiMjYzNzNjOWRjMjI4ZGJjZGUwODIwYTQyNDY2OTNmNDMyOGEyNzQ2NmZhIgogCiBpbmhlcml0
IGdldHRleHQgZ25vbWViYXNlIHBpeGJ1ZmNhY2hlIHB0ZXN0LWdub21lIHVwc3RyZWFtLXZlcnNp
b24taXMtZXZlbiBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIGxpYl9wYWNrYWdlIG1h
bnBhZ2VzCiAKLS0gCjIuNDcuMQoK

--===============5697903017906220478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: FILELIST: removed "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.5", added "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGSIZE changed from 2033312 to 2033424 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PKGSIZE changed from 34832 to 34816 (-0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: FILELIST: directory renamed /usr/src/debug/gdk-pixbuf/2.44.5/tests -> /usr/src/debug/gdk-pixbuf/2.44.6/tests, directory renamed /usr/src/debug/gdk-pixbuf/2.44.5/gdk-pixbuf/pixops -> /usr/src/debug/gdk-pixbuf/2.44.6/gdk-pixbuf/pixops, directory renamed /usr/src/debug/gdk-pixbuf/2.44.5/gdk-pixbuf -> /usr/src/debug/gdk-pixbuf/2.44.6/gdk-pixbuf
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGSIZE changed from 1109399 to 1109953 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.5", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf: SRC_URI changed from "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.5.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch" to "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.6.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch"
packages/x86-64-v3-poky-linux/gdk-pixbuf: PV changed from "2.44.5" to "2.44.6"
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6

--===============5697903017906220478==--

