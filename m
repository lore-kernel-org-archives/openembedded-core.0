Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17BEC5DF66
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:55:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12927.1786600553904391521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aA8Fc+gE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XAw5kgcj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ff9b0fabf-8481d95c-aa48-4cd4-8091-10b9ba56fc78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786600553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LJYitGarkiPfroa1+qXr3TJlzFfJodQ8+rQ8zfwCZQ4=;
	b=aA8Fc+gElL1SRq0SPEcDHWxCDTDjvsz0Wc4ss2Xgf/fjQtQdxZlylHl7n4hBEJb4
	JrJCfXSzO3A+VoZN6uroUZ3088xS4x7R+qhvqIEDgEDzDxzQ/d7PoKSUChIK/7k7Sq/
	gSprtnA4NtJXt9UkF1FSatlGF8M9SEggpdi0lf0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786600553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LJYitGarkiPfroa1+qXr3TJlzFfJodQ8+rQ8zfwCZQ4=;
	b=XAw5kgcjtgCiXVwPTWDSqqRUUjgdexRuAe79a0hkLjp3hRhut25jRQiHfOF4q0pD
	RJpl8u686OzV227s7KFWJu6HlzritDozQtyYInDc2Xwk48cua0fknVuELcAKZuiDzzL
	TKpRlfzVpVDLtX7xdOCs3biOYf9fhPkRjF2y2o+M=
Content-Type: multipart/mixed; boundary="===============8049189896994314024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.8 SUCCEEDED
Message-ID: <0101019ff9b0fabf-8481d95c-aa48-4cd4-8091-10b9ba56fc78-000000@us-west-2.amazonses.com>
Date: Thu, 13 Aug 2026 05:55:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.13-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 05:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243327

--===============8049189896994314024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdk-pixbuf-upgrade-2.44.7-2.44.8.patch
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
From 5a12cd1855192f95f6af85516f32b982ca8e0538 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 13 Aug 2026 05:28:52 +0000
Subject: [PATCH] gdk-pixbuf: upgrade 2.44.7 -> 2.44.8

Source: NEWS

2.44.8
======

- glycin: Support x-/y-dpi options for png, tiff and jpeg
- Translation updates
---
 ...meson.build-allow-a-subset-of-tests-in-cross-compile.patch | 4 ++--
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch   | 2 +-
 .../gdk-pixbuf/{gdk-pixbuf_2.44.7.bb => gdk-pixbuf_2.44.8.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.7.bb => gdk-pixbuf_2.44.8.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 2b41d1cca9..bdd94b558f 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 38bc595a5c365074b924ed2706a402679b3f6df4 Mon Sep 17 00:00:00 2001
+From 29e3a3675d2d5e0d23d4d10c5126f80832ff336d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -22,7 +22,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index b88ef70..b181054 100644
+index 2bd6092..63a05bf 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -434,10 +434,10 @@ subdir('gdk-pixbuf')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 2dd790115d..7e7838624d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From dc1096f95914b7faf786e3c2682aa0b453605a3f Mon Sep 17 00:00:00 2001
+From 269cf3b1b42f24af59f1f0be4ee874aa986fd2e1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb
index 8efc14b59a..7174928076 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "172f80e3626ec31520a970400f1a3694e04718f6c2cd2885f75250fb5a6995a4"
+SRC_URI[archive.sha256sum] = "919f529512961a12e81cd4b4b466a48c3933469e7f9a310c6513cd4fb252ba3c"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 
-- 
2.47.1


--===============8049189896994314024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gdk-pixbuf-upgrade-2.44.7-2.44.8.patch"

RnJvbSA1YTEyY2QxODU1MTkyZjk1ZjZhZjg1NTE2ZjMyYjk4MmNhOGUwNTM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTMgQXVnIDIwMjYgMDU6Mjg6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
ZGstcGl4YnVmOiB1cGdyYWRlIDIuNDQuNyAtPiAyLjQ0LjgKClNvdXJjZTogTkVXUwoKMi40NC44
Cj09PT09PQoKLSBnbHljaW46IFN1cHBvcnQgeC0veS1kcGkgb3B0aW9ucyBmb3IgcG5nLCB0aWZm
IGFuZCBqcGVnCi0gVHJhbnNsYXRpb24gdXBkYXRlcwotLS0KIC4uLm1lc29uLmJ1aWxkLWFsbG93
LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3NzLWNvbXBpbGUucGF0Y2ggfCA0ICsrLS0KIG1ldGEv
cmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoICAg
fCAyICstCiAuLi4vZ2RrLXBpeGJ1Zi97Z2RrLXBpeGJ1Zl8yLjQ0LjcuYmIgPT4gZ2RrLXBpeGJ1
Zl8yLjQ0LjguYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYve2dkay1w
aXhidWZfMi40NC43LmJiID0+IGdkay1waXhidWZfMi40NC44LmJifSAoOTclKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvMDAwMS1tZXNvbi5i
dWlsZC1hbGxvdy1hLXN1YnNldC1vZi10ZXN0cy1pbi1jcm9zcy1jb21waWxlLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi8wMDAxLW1lc29uLmJ1aWxkLWFs
bG93LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3NzLWNvbXBpbGUucGF0Y2gKaW5kZXggMmI0MWQx
Y2NhOS4uYmRkOTRiNTU4ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhi
dWYvZ2RrLXBpeGJ1Zi8wMDAxLW1lc29uLmJ1aWxkLWFsbG93LWEtc3Vic2V0LW9mLXRlc3RzLWlu
LWNyb3NzLWNvbXBpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYv
Z2RrLXBpeGJ1Zi8wMDAxLW1lc29uLmJ1aWxkLWFsbG93LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNy
b3NzLWNvbXBpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM4YmM1OTVhNWMzNjUwNzRi
OTI0ZWQyNzA2YTQwMjY3OWIzZjZkZjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI5
ZTNhMzY3NWQyZDVlMGQyM2Q0ZDEwYzUxMjZmODA4MzJmZjMzNmQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0
ZTogVGh1LCAyNiBKYW4gMjAyMyAyMDoyOTo0NiArMDEwMAogU3ViamVjdDogW1BBVENIXSBtZXNv
bi5idWlsZDogYWxsb3cgKGEgc3Vic2V0IG9mKSB0ZXN0cyBpbiBjcm9zcyBjb21waWxlCkBAIC0y
Miw3ICsyMiw3IEBAIFNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdp
bmRyaXZlci5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBi
ODhlZjcwLi5iMTgxMDU0IDEwMDY0NAoraW5kZXggMmJkNjA5Mi4uNjNhMDViZiAxMDA2NDQKIC0t
LSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTQzNCwxMCArNDM0LDEwIEBA
IHN1YmRpcignZ2RrLXBpeGJ1ZicpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2Rr
LXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCmluZGV4IDJkZDc5MDEx
NWQuLjdlNzgzODYyNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVm
L2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9n
ZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBkYzEwOTZmOTU5MTRiN2ZhZjc4NmUzYzI2ODJhYTBiNDUzNjA1YTNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAyNjljZjNiMWI0MmYyNGFmNTlmMWYwYmU0ZWU4NzRhYTk4NmZk
MmUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMSBBcHIgMjAxNCAxNzoyMzozNiArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBnZGstcGl4YnVmOiBhZGQgYW4gb3B0aW9uIHNvIHRoYXQgbG9hZGVyIGVy
cm9ycyBhcmUgZmF0YWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVm
L2dkay1waXhidWZfMi40NC43LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2Rr
LXBpeGJ1Zl8yLjQ0LjguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQ0LjcuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWZfMi40NC44LmJiCmluZGV4IDhl
ZmMxNGI1OWEuLjcxNzQ5MjgwNzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGst
cGl4YnVmL2dkay1waXhidWZfMi40NC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nZGst
cGl4YnVmL2dkay1waXhidWZfMi40NC44LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNFQ1RJT04gPSAi
bGlicyIKIAogREVQRU5EUyA9ICJnbGliLTIuMCBzaGFyZWQtbWltZS1pbmZvIgogCi1TUkNfVVJJ
W2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIxNzJmODBlMzYyNmVjMzE1MjBhOTcwNDAwZjFhMzY5NGUw
NDcxOGY2YzJjZDI4ODVmNzUyNTBmYjVhNjk5NWE0IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1
bV0gPSAiOTE5ZjUyOTUxMjk2MWExMmU4MWNkNGI0YjQ2NmE0OGMzOTMzNDY5ZTdmOWEzMTBjNjUx
M2NkNGZiMjUyYmEzYyIKIAogaW5oZXJpdCBnZXR0ZXh0IGdub21lYmFzZSBwaXhidWZjYWNoZSBw
dGVzdC1nbm9tZSB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyb3NwZWN0aW9u
IGdpLWRvY2dlbiBsaWJfcGFja2FnZSBtYW5wYWdlcwogCi0tIAoyLjQ3LjEKCg==

--===============8049189896994314024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGSIZE changed from 2079456 to 2079528 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: FILELIST: removed "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.7", added "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PKGSIZE changed from 29688 to 28983 (-2%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lo: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lo: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGSIZE changed from 1109967 to 1109995 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: FILELIST: directory renamed /usr/src/debug/gdk-pixbuf/2.44.7/tests -> /usr/src/debug/gdk-pixbuf/2.44.8/tests, directory renamed /usr/src/debug/gdk-pixbuf/2.44.7/gdk-pixbuf/pixops -> /usr/src/debug/gdk-pixbuf/2.44.8/gdk-pixbuf/pixops, directory renamed /usr/src/debug/gdk-pixbuf/2.44.7/gdk-pixbuf -> /usr/src/debug/gdk-pixbuf/2.44.8/gdk-pixbuf
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.7", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf: PV changed from "2.44.7" to "2.44.8"
packages/x86-64-v3-poky-linux/gdk-pixbuf: SRC_URI changed from "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.7.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch" to "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.8.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch"
packages/x86-64-v3-poky-linux/gdk-pixbuf: PKGV changed from 2.44.7 [default] to 2.44.8 [default]
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.7 to libgdk_pixbuf-2.0.so.0.4400.8
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.8
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.7 to libgdk_pixbuf-2.0.so.0.4400.8
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.8

--===============8049189896994314024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.7", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.8"
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.7 to libgdk_pixbuf-2.0.so.0.4400.8
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.8
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.7 to libgdk_pixbuf-2.0.so.0.4400.8
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.7 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.8

--===============8049189896994314024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gdk-pixbuf-changelog.txt"

Changelog for gdk-pixbuf: 2.44.7 -> 2.44.8
Source: NEWS

2.44.8
======

- glycin: Support x-/y-dpi options for png, tiff and jpeg
- Translation updates

--===============8049189896994314024==--

