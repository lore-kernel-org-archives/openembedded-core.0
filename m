Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E8AC5DF65
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:55:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12999.1786600555000537347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AtxJY8NS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=thEyH18g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ff9b0fc1d-94e50be0-b4e1-4c06-a4fe-07e489e2bae8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786600554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tSlNrz5o6C2leC3cRMu1sjyGRFvqtztKGSYWX68EcRQ=;
	b=AtxJY8NSYIAj1D2RwqP4kCXqAJprffUYB+fgE0gAfU2tuJwUjk3KofcDeG4EIARX
	eeF8Kv9NZr+q4wsbs2BoGPICAMRWrycciaBbw1xOHCtZBbbDeolsjThIgNp0vouwlZc
	JkQVwUiFp4N4ilPTS1yKJVTcBxTwuBBvBCC2nIW4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786600554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tSlNrz5o6C2leC3cRMu1sjyGRFvqtztKGSYWX68EcRQ=;
	b=thEyH18gxLX93EmSdTMe51XPKnKRgQNyPbji8MgI+Z4VIgBUDgcaZ4bYEcQDz5qm
	PoBODv/ih+8BNlyOVcBRQrP64wEyW2wqLsKEAuuuPW1m2o5UYfW3sd+Y4ywrX493DVY
	f0o8i13C8UrJFSf0cIo8+FnKLiErSA8xiIe0WL6o=
Content-Type: multipart/mixed; boundary="===============8508817519824421856=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.6 SUCCEEDED
Message-ID: <0101019ff9b0fc1d-94e50be0-b4e1-4c06-a4fe-07e489e2bae8-000000@us-west-2.amazonses.com>
Date: Thu, 13 Aug 2026 05:55:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.13-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 05:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243330

--===============8508817519824421856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.1.5-1.1.6.patch
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
From f8a7fb1b24870f16c6688d57bec490c2d6d01400 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 13 Aug 2026 05:43:28 +0000
Subject: [PATCH] appstream: upgrade 1.1.5 -> 1.1.6

Source: NEWS

Version 1.1.6
~~~~~~~~~~~~~
Released: 2026-08-12

Features:
 * validator: Ensure description markup has no invalid attributes set
 * validator: Validate bundle/pkgname values for allowed characters

Bugfixes:
 * xml: Sanitize description markup when reading and writing it
 * yaml/json: Ensure description markup is sanitized when loading/saving it
 * meson: Work around wrong library linkage when linking Qt tests
 * Allow sealing of component-IDs to safely use them in hash tables and indices
 * Ensure we never emit or read an invalid data origin
 * Prevent crash when comparing bad version strings that have an epoch after rev
 * Fix potential out-of-bounds read in OARS mapping table
 * apt: yaml: Harden against potential corrupted YAML / YAML-headers
 * compose: Guess a filename even from invalid URLs instead of crashing
 * compose: Confine directory unit data reads to the unit's root directory
 * compose: Refactor directory unit to use openat2, if possible
 * news-convert: Don't crash in case we receive bad freeform YAML news input
 * ascli: Guard against bad bundle values when calling "install"

Contributors:
 Matthias Klumpp
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 6 +++---
 ...x-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 2 +-
 .../appstream/{appstream_1.1.5.bb => appstream_1.1.6.bb}    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.1.5.bb => appstream_1.1.6.bb} (95%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 56a5479099..9d1ff639c0 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From bf79c20cfee4a074ca752a1466dc96d0b9eb6175 Mon Sep 17 00:00:00 2001
+From 75c550f2f88d990fdb18b6118ca052af732a11b2 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 9af5f58..ad1483d 100644
+index 24d1069..14fffff 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -194,10 +194,10 @@ endif
+@@ -230,10 +230,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 3e666181eb..c9d544f3fc 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 1a1619dce3c3fa54fa5f47f7ed89447e0805de43 Mon Sep 17 00:00:00 2001
+From 6b50c15e350f80e805816f1c2ae2abe97cef6312 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,10 +23,10 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 407a57a..840c838 100644
+index 488fe60..83c2715 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -130,5 +130,3 @@ install_data (
+@@ -144,5 +144,3 @@ install_data (
      join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.cmake'),
      install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStreamQt')
  )
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 8ba4de95c9..185dd507b3 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From 4fdd29346b51eea577ee46c7166348dad19bbcb0 Mon Sep 17 00:00:00 2001
+From f7a125e90f99a997652fceb07263517df0f1ecc6 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.1.5.bb b/meta/recipes-support/appstream/appstream_1.1.6.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.1.5.bb
rename to meta/recipes-support/appstream/appstream_1.1.6.bb
index e33359e5a1..723c740006 100644
--- a/meta/recipes-support/appstream/appstream_1.1.5.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.6.bb
@@ -24,7 +24,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "fc57337e250b0d27e75ac4216cc69a76d03c54011a5da5c7a2c57711a3d0cdf9"
+SRC_URI[sha256sum] = "e298929f39729e84a70f6be6941f3e7f3fc2ee3c83cb3ea1b1b5b280a8fe3a24"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============8508817519824421856==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.1.5-1.1.6.patch"

RnJvbSBmOGE3ZmIxYjI0ODcwZjE2YzY2ODhkNTdiZWM0OTBjMmQ2ZDAxNDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTMgQXVnIDIwMjYgMDU6NDM6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4xLjUgLT4gMS4xLjYKClNvdXJjZTogTkVXUwoKVmVyc2lvbiAx
LjEuNgp+fn5+fn5+fn5+fn5+ClJlbGVhc2VkOiAyMDI2LTA4LTEyCgpGZWF0dXJlczoKICogdmFs
aWRhdG9yOiBFbnN1cmUgZGVzY3JpcHRpb24gbWFya3VwIGhhcyBubyBpbnZhbGlkIGF0dHJpYnV0
ZXMgc2V0CiAqIHZhbGlkYXRvcjogVmFsaWRhdGUgYnVuZGxlL3BrZ25hbWUgdmFsdWVzIGZvciBh
bGxvd2VkIGNoYXJhY3RlcnMKCkJ1Z2ZpeGVzOgogKiB4bWw6IFNhbml0aXplIGRlc2NyaXB0aW9u
IG1hcmt1cCB3aGVuIHJlYWRpbmcgYW5kIHdyaXRpbmcgaXQKICogeWFtbC9qc29uOiBFbnN1cmUg
ZGVzY3JpcHRpb24gbWFya3VwIGlzIHNhbml0aXplZCB3aGVuIGxvYWRpbmcvc2F2aW5nIGl0CiAq
IG1lc29uOiBXb3JrIGFyb3VuZCB3cm9uZyBsaWJyYXJ5IGxpbmthZ2Ugd2hlbiBsaW5raW5nIFF0
IHRlc3RzCiAqIEFsbG93IHNlYWxpbmcgb2YgY29tcG9uZW50LUlEcyB0byBzYWZlbHkgdXNlIHRo
ZW0gaW4gaGFzaCB0YWJsZXMgYW5kIGluZGljZXMKICogRW5zdXJlIHdlIG5ldmVyIGVtaXQgb3Ig
cmVhZCBhbiBpbnZhbGlkIGRhdGEgb3JpZ2luCiAqIFByZXZlbnQgY3Jhc2ggd2hlbiBjb21wYXJp
bmcgYmFkIHZlcnNpb24gc3RyaW5ncyB0aGF0IGhhdmUgYW4gZXBvY2ggYWZ0ZXIgcmV2CiAqIEZp
eCBwb3RlbnRpYWwgb3V0LW9mLWJvdW5kcyByZWFkIGluIE9BUlMgbWFwcGluZyB0YWJsZQogKiBh
cHQ6IHlhbWw6IEhhcmRlbiBhZ2FpbnN0IHBvdGVudGlhbCBjb3JydXB0ZWQgWUFNTCAvIFlBTUwt
aGVhZGVycwogKiBjb21wb3NlOiBHdWVzcyBhIGZpbGVuYW1lIGV2ZW4gZnJvbSBpbnZhbGlkIFVS
THMgaW5zdGVhZCBvZiBjcmFzaGluZwogKiBjb21wb3NlOiBDb25maW5lIGRpcmVjdG9yeSB1bml0
IGRhdGEgcmVhZHMgdG8gdGhlIHVuaXQncyByb290IGRpcmVjdG9yeQogKiBjb21wb3NlOiBSZWZh
Y3RvciBkaXJlY3RvcnkgdW5pdCB0byB1c2Ugb3BlbmF0MiwgaWYgcG9zc2libGUKICogbmV3cy1j
b252ZXJ0OiBEb24ndCBjcmFzaCBpbiBjYXNlIHdlIHJlY2VpdmUgYmFkIGZyZWVmb3JtIFlBTUwg
bmV3cyBpbnB1dAogKiBhc2NsaTogR3VhcmQgYWdhaW5zdCBiYWQgYnVuZGxlIHZhbHVlcyB3aGVu
IGNhbGxpbmcgImluc3RhbGwiCgpDb250cmlidXRvcnM6CiBNYXR0aGlhcyBLbHVtcHAKLS0tCiAu
Li4vYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaCAg
ICB8IDYgKysrLS0tCiAuLi4vYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1x
dC10ZXN0cy5wYXRjaCAgICB8IDYgKysrLS0tCiAuLi54LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1x
dC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaCB8IDIgKy0KIC4uLi9hcHBzdHJlYW0ve2Fw
cHN0cmVhbV8xLjEuNS5iYiA9PiBhcHBzdHJlYW1fMS4xLjYuYmJ9ICAgIHwgMiArLQogNCBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL3thcHBzdHJlYW1fMS4xLjUuYmIgPT4gYXBwc3RyZWFt
XzEuMS42LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0
cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1w
YXRoLnBhdGNoCmluZGV4IDU2YTU0NzkwOTkuLjlkMWZmNjM5YzAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVk
LXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVh
bS8wMDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YmY3OWMyMGNmZWU0YTA3NGNhNzUyYTE0NjZkYzk2ZDBiOWViNjE3NSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNzVjNTUwZjJmODhkOTkwZmRiMThiNjExOGNhMDUyYWY3MzJhMTFiMiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGlu
ZS5kZT4KIERhdGU6IE1vbiwgMTIgRGVjIDIwMjIgMTU6NDI6NDIgKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gcmVtb3ZlIGhhcmRjb2RlZCBwYXRoCkBAIC0xNCwxMCArMTQsMTAgQEAgVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1zcGVjaWZpY10KICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQg
Yi9tZXNvbi5idWlsZAotaW5kZXggOWFmNWY1OC4uYWQxNDgzZCAxMDA2NDQKK2luZGV4IDI0ZDEw
NjkuLjE0ZmZmZmYgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQK
LUBAIC0xOTQsMTAgKzE5NCwxMCBAQCBlbmRpZgorQEAgLTIzMCwxMCArMjMwLDEwIEBAIGVuZGlm
CiAgc3RlbW1lcl9pbmNfZGlycyA9IGluY2x1ZGVfZGlyZWN0b3JpZXMoKQogIGlmIGdldF9vcHRp
b24oJ3N0ZW1taW5nJykKICAgICAgc3RlbW1lcl9saWIgPSBjYy5maW5kX2xpYnJhcnkoJ3N0ZW1t
ZXInLCByZXF1aXJlZDogdHJ1ZSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fw
cHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0
LXRlc3RzLnBhdGNoCmluZGV4IDNlNjY2MTgxZWIuLmM5ZDU0NGYzZmMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQt
cXQtdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0
cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMWExNjE5ZGNlM2MzZmE1NGZhNWY0N2Y3ZWQ4OTQ0N2UwODA1ZGU0MyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNmI1MGMxNWUzNTBmODBlODA1ODE2ZjFjMmFlMmFiZTk3Y2VmNjMx
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJs
YW5kQHNvbmF0ZXN0LmNvbT4KIERhdGU6IEZyaSwgMjYgSnVsIDIwMjQgMTU6NDE6MDAgLTA0MDAK
IFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGJ1aWxkIHF0L3Rlc3RzCkBAIC0yMywxMCArMjMsMTAg
QEAgU2lnbmVkLW9mZi1ieTogTWFyYyBGZXJsYW5kIDxtYXJjLmZlcmxhbmRAc29uYXRlc3QuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvcXQvbWVz
b24uYnVpbGQgYi9xdC9tZXNvbi5idWlsZAotaW5kZXggNDA3YTU3YS4uODQwYzgzOCAxMDA2NDQK
K2luZGV4IDQ4OGZlNjAuLjgzYzI3MTUgMTAwNjQ0CiAtLS0gYS9xdC9tZXNvbi5idWlsZAogKysr
IGIvcXQvbWVzb24uYnVpbGQKLUBAIC0xMzAsNSArMTMwLDMgQEAgaW5zdGFsbF9kYXRhICgKK0BA
IC0xNDQsNSArMTQ0LDMgQEAgaW5zdGFsbF9kYXRhICgKICAgICAgam9pbl9wYXRocyhtZXNvbi5j
dXJyZW50X2J1aWxkX2RpcigpLCAnQXBwU3RyZWFtUXRDb25maWdWZXJzaW9uLmNtYWtlJyksCiAg
ICAgIGluc3RhbGxfZGlyOiBqb2luX3BhdGhzKGdldF9vcHRpb24oJ2xpYmRpcicpLCAnY21ha2Un
LCAnQXBwU3RyZWFtUXQnKQogICkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fw
cHN0cmVhbS9hcHBzdHJlYW0vMDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtl
LUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFt
L2FwcHN0cmVhbS8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3Ry
ZWFtUXRDb25maWcucGF0Y2gKaW5kZXggOGJhNGRlOTVjOS4uMTg1ZGQ1MDdiMyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAzLUZpeC1QQUNL
QUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAzLUZpeC1QQUNLQUdF
X1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDRmZGQyOTM0NmI1MWVlYTU3N2VlNDZjNzE2NjM0OGRhZDE5YmJjYjAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY3YTEyNWU5MGY5OWE5OTc2NTJmY2ViMDcyNjM1
MTdkZjBmMWVjYzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJjIEZlcmxhbmQg
PG1hcmMuZmVybGFuZEBzb25hdGVzdC5jb20+CiBEYXRlOiBNb24sIDI5IEp1bCAyMDI0IDA5OjM1
OjUxIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBQQUNLQUdFX1BSRUZJWF9ESVIgaW4gcXQv
Y21ha2UvQXBwU3RyZWFtUXRDb25maWcuY21ha2UuaW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4xLjUuYmIgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4xLjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4x
LjYuYmIKaW5kZXggZTMzMzU5ZTVhMS4uNzIzYzc0MDAwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjEuNS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMS42LmJiCkBAIC0yNCw3ICsyNCw3IEBA
IFNSQ19VUkkgPSAiIFwKIAlmaWxlOi8vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2gg
XAogCWZpbGU6Ly8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3Ry
ZWFtUXRDb25maWcucGF0Y2ggXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZjNTczMzdlMjUw
YjBkMjdlNzVhYzQyMTZjYzY5YTc2ZDAzYzU0MDExYTVkYTVjN2EyYzU3NzExYTNkMGNkZjkiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTI5ODkyOWYzOTcyOWU4NGE3MGY2YmU2OTQxZjNlN2YzZmMy
ZWUzYzgzY2IzZWExYjFiNWIyODBhOGZlM2EyNCIKIAogUyA9ICIke1VOUEFDS0RJUn0vQXBwU3Ry
ZWFtLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============8508817519824421856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2773384 to 2802392 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.1.5", added "/usr/lib/.debug/libappstream.so.1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGSIZE changed from 1356890 to 1356907 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGSIZE changed from 2719621 to 2721645 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PKGSIZE changed from 148035 to 153168 (+3%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGSIZE changed from 121565 to 123732 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGSIZE changed from 115838 to 117841 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGSIZE changed from 119135 to 121319 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGSIZE changed from 158843 to 161692 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGSIZE changed from 1991496 to 2017382 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-src: FILELIST: directory renamed /usr/src/debug/appstream/1.1.5/src -> /usr/src/debug/appstream/1.1.6/src, directory renamed /usr/src/debug/appstream/1.1.5/tools -> /usr/src/debug/appstream/1.1.6/tools
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-src: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGSIZE changed from 1116027 to 1127627 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.1.5", added "/usr/lib/libappstream.so.1.1.6"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream/appstream: PV changed from "1.1.5" to "1.1.6"
packages/x86-64-v3-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.1.5.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.1.6.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch"
packages/x86-64-v3-poky-linux/appstream: PKGV changed from 1.1.5 [default] to 1.1.6 [default]
packages/x86-64-v3-poky-linux/appstream: PV changed from "1.1.5" to "1.1.6"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.1.5 to libappstream.so.1.1.6
  /usr/lib/libappstream.so.1.1.5 moved to /usr/lib/libappstream.so.1.1.6

--===============8508817519824421856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="appstream-changelog.txt"

Changelog for appstream: 1.1.5 -> 1.1.6
Source: NEWS

Version 1.1.6
~~~~~~~~~~~~~
Released: 2026-08-12

Features:
 * validator: Ensure description markup has no invalid attributes set
 * validator: Validate bundle/pkgname values for allowed characters

Bugfixes:
 * xml: Sanitize description markup when reading and writing it
 * yaml/json: Ensure description markup is sanitized when loading/saving it
 * meson: Work around wrong library linkage when linking Qt tests
 * Allow sealing of component-IDs to safely use them in hash tables and indices
 * Ensure we never emit or read an invalid data origin
 * Prevent crash when comparing bad version strings that have an epoch after rev
 * Fix potential out-of-bounds read in OARS mapping table
 * apt: yaml: Harden against potential corrupted YAML / YAML-headers
 * compose: Guess a filename even from invalid URLs instead of crashing
 * compose: Confine directory unit data reads to the unit's root directory
 * compose: Refactor directory unit to use openat2, if possible
 * news-convert: Don't crash in case we receive bad freeform YAML news input
 * ascli: Guard against bad bundle values when calling "install"

Contributors:
 Matthias Klumpp

--===============8508817519824421856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.1.5", added "/usr/lib/libappstream.so.1.1.6"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.1.5 to libappstream.so.1.1.6
  /usr/lib/libappstream.so.1.1.5 moved to /usr/lib/libappstream.so.1.1.6

--===============8508817519824421856==--

