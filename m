Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E425C61DDF
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2091.1787982254538563102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Uo8zRI1z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=N4/oK9VS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a04c0c0e88-fb8de598-2bc3-48e6-9fcc-2e8481291998-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TGNl2Our7rXjxMOM28QmpbV7kBU8B0da+cH4I5NzczE=;
	b=Uo8zRI1zC9QpddmFkFUhP2fri93sYuD7X07uYZovT6f0SNn4BK5g8pkP6nNk3byW
	/vhflCc+sNn4/HAucwDSb8W/uMYfmVnvxv1ZrmIkKMPnc4AiE4vyJBGc//7SsaZMTP4
	1jswcDEt4Ip77ONCow07y4af6qtQJ4/lOTfdZwJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TGNl2Our7rXjxMOM28QmpbV7kBU8B0da+cH4I5NzczE=;
	b=N4/oK9VSiqFYaRorZZR0pO8E4ZVp7WbjObCn6OcHB054ilajx0pZYMxYon+QBLC/
	ZOnu70CKsFXLGVgTRaULJfN3XOP+WgY/VVZX0FlGZpjLoJNm2GQ/7qnH8O7MtDp74aW
	/DMriFzY7uJ7wzRucYZWWqAeEsPuUUVMmqbsezKA=
Content-Type: multipart/mixed; boundary="===============1336722111172367893=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.2.0 SUCCEEDED
Message-ID: <010101a04c0c0e88-fb8de598-2bc3-48e6-9fcc-2e8481291998-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244628

--===============1336722111172367893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.1.6-1.2.0.patch
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
From 0651b6a7b7963cc88a6da21e998bb3f4f91af685 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 29 Aug 2026 05:30:22 +0000
Subject: [PATCH] appstream: upgrade 1.1.6 -> 1.2.0

Source: NEWS

Version 1.2.0
~~~~~~~~~~~~~
Released: 2026-08-28

Notes:
 * This release marks the libappstream-compose API as stable.

 * This release introduces a new, lightly sandboxed (on Linux) media worker for appstream-compose
   and switches to VIPS for image processing. Please report any issues you may find! The sandbox
   can be disabled by setting `ASC_NO_SANDBOX=1` in the environment.
   The image formats XPM, TIFF and BMP will no longer be read by Compose, and will be rejected
   unconditionally.

 * This release introduces <heading>My headline!</heading> markup for AppStream descriptions.
   Older versions will remove this markup, so only use it if your target clients have a recent
   version of AppStream.

Features:
 * compose: Create AscMedia for isolated out-of-process media handling using asc-mediaworker
 * compose: Process images, fonts & videos via the media worker
 * Generalize path segment validation, use it in the compose media worker
 * compose: Switch from using GdkPixbuf to VIPS for image processing
 * compose: Harmonize supported formats, don't read XPM/TIFF/BMP
 * compose: Make JPEG-XL the default image output format
 * compose: Implement basic support for FreeBSD
 * compose: Rely on VIPS for SVG support, drop our dedicated librsvg path
 * compose: Make image-targets and image batch-processing public API
 * compose: Expose the source-icon convention and a hint-tag lookup as public API
 * compose: Drop unstable-API marker
 * compose: Don't create image thumbnails that aren't a substantially smaller
 * compose: Only transfer pre-opened fds and no more directory fd to the worker
 * compose: Implement a basic sandbox for the mediaworker using Landlock
 * compose: Use RESTRICT_SELF_TSYNC and block UDP access on newer Landlock
 * compose: Mix the output image format type into the GCID
 * compose: Make AscUnit a proper abstract class
 * compose: Improve API documentation
 * Always sanitize whitespaces in keywords and drop empty ones
 * Assume a language element without percentage means full translation
 * news-to-metainfo: Support a details URL in the YAML variant
 * news-convert: Support inline Markdown in news text
 * news-convert: Support headers in XML<->YAML/NEWS/Markdown conversions
 * ascli: news-convert: Support standalone release XML as source/target
 * Whitespace-sanitize all description markup we read
 * Output descriptions as literals in YAML and wrap markup ourselves

Specification:
 * docs: Document the appstreamcli news file conversion helper
 * Implement support for headings in description markup

Bugfixes:
 * meson: Set _POSIX_C_SOURCE on Linux only
 * compose: Fix a race where units were deleting each other's icon directories
 * compose: Fix documentation and introspection annotation issues
 * compose: Drop dead public API, make some API private
 * compose: Sharpen with libvips instead of a hand-rolled unsharp mask
 * compose: Only read AVIF from HEIF containers, never HEIC
 * compose: Fix double-free crash wh

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 2 +-
 ...x-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 2 +-
 .../appstream/{appstream_1.1.6.bb => appstream_1.2.0.bb}    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.1.6.bb => appstream_1.2.0.bb} (95%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 9d1ff639c0..d0cb5cf6f4 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 75c550f2f88d990fdb18b6118ca052af732a11b2 Mon Sep 17 00:00:00 2001
+From 0a532ef29855599e4761923bb38069e98d78e25f Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 24d1069..14fffff 100644
+index 004dce3..cefb852 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -230,10 +230,10 @@ endif
+@@ -229,10 +229,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index c9d544f3fc..861d9552a5 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 6b50c15e350f80e805816f1c2ae2abe97cef6312 Mon Sep 17 00:00:00 2001
+From 0d387b6cb8907dd377212de187fbe749b40eedb4 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 185dd507b3..9f06f78916 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From f7a125e90f99a997652fceb07263517df0f1ecc6 Mon Sep 17 00:00:00 2001
+From 2c0758a84741e6e91cfd1ba70e9017ba4e76143a Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.1.6.bb b/meta/recipes-support/appstream/appstream_1.2.0.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.1.6.bb
rename to meta/recipes-support/appstream/appstream_1.2.0.bb
index 723c740006..4a1c23e760 100644
--- a/meta/recipes-support/appstream/appstream_1.1.6.bb
+++ b/meta/recipes-support/appstream/appstream_1.2.0.bb
@@ -24,7 +24,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "e298929f39729e84a70f6be6941f3e7f3fc2ee3c83cb3ea1b1b5b280a8fe3a24"
+SRC_URI[sha256sum] = "901919378910550271feb2d826034c9af6522f3ad218de04d3d6d35ddba5cb45"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============1336722111172367893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-doc: FILELIST: added "/usr/share/doc/appstream/html/sect-Quickstart-Releases.html"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PKGSIZE changed from 31101 to 39115 (+26%)
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.1.6", added "/usr/lib/libappstream.so.1.2.0"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.1.6 to libappstream.so.1.2.0
  /usr/lib/libappstream.so.1.1.6 moved to /usr/lib/libappstream.so.1.2.0
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.1.6 to libappstream.so.1.2.0
  /usr/lib/libappstream.so.1.1.6 moved to /usr/lib/libappstream.so.1.2.0

--===============1336722111172367893==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.1.6-1.2.0.patch"

RnJvbSAwNjUxYjZhN2I3OTYzY2M4OGE2ZGEyMWU5OThiYjNmNGY5MWFmNjg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjkgQXVnIDIwMjYgMDU6MzA6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4xLjYgLT4gMS4yLjAKClNvdXJjZTogTkVXUwoKVmVyc2lvbiAx
LjIuMAp+fn5+fn5+fn5+fn5+ClJlbGVhc2VkOiAyMDI2LTA4LTI4CgpOb3RlczoKICogVGhpcyBy
ZWxlYXNlIG1hcmtzIHRoZSBsaWJhcHBzdHJlYW0tY29tcG9zZSBBUEkgYXMgc3RhYmxlLgoKICog
VGhpcyByZWxlYXNlIGludHJvZHVjZXMgYSBuZXcsIGxpZ2h0bHkgc2FuZGJveGVkIChvbiBMaW51
eCkgbWVkaWEgd29ya2VyIGZvciBhcHBzdHJlYW0tY29tcG9zZQogICBhbmQgc3dpdGNoZXMgdG8g
VklQUyBmb3IgaW1hZ2UgcHJvY2Vzc2luZy4gUGxlYXNlIHJlcG9ydCBhbnkgaXNzdWVzIHlvdSBt
YXkgZmluZCEgVGhlIHNhbmRib3gKICAgY2FuIGJlIGRpc2FibGVkIGJ5IHNldHRpbmcgYEFTQ19O
T19TQU5EQk9YPTFgIGluIHRoZSBlbnZpcm9ubWVudC4KICAgVGhlIGltYWdlIGZvcm1hdHMgWFBN
LCBUSUZGIGFuZCBCTVAgd2lsbCBubyBsb25nZXIgYmUgcmVhZCBieSBDb21wb3NlLCBhbmQgd2ls
bCBiZSByZWplY3RlZAogICB1bmNvbmRpdGlvbmFsbHkuCgogKiBUaGlzIHJlbGVhc2UgaW50cm9k
dWNlcyA8aGVhZGluZz5NeSBoZWFkbGluZSE8L2hlYWRpbmc+IG1hcmt1cCBmb3IgQXBwU3RyZWFt
IGRlc2NyaXB0aW9ucy4KICAgT2xkZXIgdmVyc2lvbnMgd2lsbCByZW1vdmUgdGhpcyBtYXJrdXAs
IHNvIG9ubHkgdXNlIGl0IGlmIHlvdXIgdGFyZ2V0IGNsaWVudHMgaGF2ZSBhIHJlY2VudAogICB2
ZXJzaW9uIG9mIEFwcFN0cmVhbS4KCkZlYXR1cmVzOgogKiBjb21wb3NlOiBDcmVhdGUgQXNjTWVk
aWEgZm9yIGlzb2xhdGVkIG91dC1vZi1wcm9jZXNzIG1lZGlhIGhhbmRsaW5nIHVzaW5nIGFzYy1t
ZWRpYXdvcmtlcgogKiBjb21wb3NlOiBQcm9jZXNzIGltYWdlcywgZm9udHMgJiB2aWRlb3Mgdmlh
IHRoZSBtZWRpYSB3b3JrZXIKICogR2VuZXJhbGl6ZSBwYXRoIHNlZ21lbnQgdmFsaWRhdGlvbiwg
dXNlIGl0IGluIHRoZSBjb21wb3NlIG1lZGlhIHdvcmtlcgogKiBjb21wb3NlOiBTd2l0Y2ggZnJv
bSB1c2luZyBHZGtQaXhidWYgdG8gVklQUyBmb3IgaW1hZ2UgcHJvY2Vzc2luZwogKiBjb21wb3Nl
OiBIYXJtb25pemUgc3VwcG9ydGVkIGZvcm1hdHMsIGRvbid0IHJlYWQgWFBNL1RJRkYvQk1QCiAq
IGNvbXBvc2U6IE1ha2UgSlBFRy1YTCB0aGUgZGVmYXVsdCBpbWFnZSBvdXRwdXQgZm9ybWF0CiAq
IGNvbXBvc2U6IEltcGxlbWVudCBiYXNpYyBzdXBwb3J0IGZvciBGcmVlQlNECiAqIGNvbXBvc2U6
IFJlbHkgb24gVklQUyBmb3IgU1ZHIHN1cHBvcnQsIGRyb3Agb3VyIGRlZGljYXRlZCBsaWJyc3Zn
IHBhdGgKICogY29tcG9zZTogTWFrZSBpbWFnZS10YXJnZXRzIGFuZCBpbWFnZSBiYXRjaC1wcm9j
ZXNzaW5nIHB1YmxpYyBBUEkKICogY29tcG9zZTogRXhwb3NlIHRoZSBzb3VyY2UtaWNvbiBjb252
ZW50aW9uIGFuZCBhIGhpbnQtdGFnIGxvb2t1cCBhcyBwdWJsaWMgQVBJCiAqIGNvbXBvc2U6IERy
b3AgdW5zdGFibGUtQVBJIG1hcmtlcgogKiBjb21wb3NlOiBEb24ndCBjcmVhdGUgaW1hZ2UgdGh1
bWJuYWlscyB0aGF0IGFyZW4ndCBhIHN1YnN0YW50aWFsbHkgc21hbGxlcgogKiBjb21wb3NlOiBP
bmx5IHRyYW5zZmVyIHByZS1vcGVuZWQgZmRzIGFuZCBubyBtb3JlIGRpcmVjdG9yeSBmZCB0byB0
aGUgd29ya2VyCiAqIGNvbXBvc2U6IEltcGxlbWVudCBhIGJhc2ljIHNhbmRib3ggZm9yIHRoZSBt
ZWRpYXdvcmtlciB1c2luZyBMYW5kbG9jawogKiBjb21wb3NlOiBVc2UgUkVTVFJJQ1RfU0VMRl9U
U1lOQyBhbmQgYmxvY2sgVURQIGFjY2VzcyBvbiBuZXdlciBMYW5kbG9jawogKiBjb21wb3NlOiBN
aXggdGhlIG91dHB1dCBpbWFnZSBmb3JtYXQgdHlwZSBpbnRvIHRoZSBHQ0lECiAqIGNvbXBvc2U6
IE1ha2UgQXNjVW5pdCBhIHByb3BlciBhYnN0cmFjdCBjbGFzcwogKiBjb21wb3NlOiBJbXByb3Zl
IEFQSSBkb2N1bWVudGF0aW9uCiAqIEFsd2F5cyBzYW5pdGl6ZSB3aGl0ZXNwYWNlcyBpbiBrZXl3
b3JkcyBhbmQgZHJvcCBlbXB0eSBvbmVzCiAqIEFzc3VtZSBhIGxhbmd1YWdlIGVsZW1lbnQgd2l0
aG91dCBwZXJjZW50YWdlIG1lYW5zIGZ1bGwgdHJhbnNsYXRpb24KICogbmV3cy10by1tZXRhaW5m
bzogU3VwcG9ydCBhIGRldGFpbHMgVVJMIGluIHRoZSBZQU1MIHZhcmlhbnQKICogbmV3cy1jb252
ZXJ0OiBTdXBwb3J0IGlubGluZSBNYXJrZG93biBpbiBuZXdzIHRleHQKICogbmV3cy1jb252ZXJ0
OiBTdXBwb3J0IGhlYWRlcnMgaW4gWE1MPC0+WUFNTC9ORVdTL01hcmtkb3duIGNvbnZlcnNpb25z
CiAqIGFzY2xpOiBuZXdzLWNvbnZlcnQ6IFN1cHBvcnQgc3RhbmRhbG9uZSByZWxlYXNlIFhNTCBh
cyBzb3VyY2UvdGFyZ2V0CiAqIFdoaXRlc3BhY2Utc2FuaXRpemUgYWxsIGRlc2NyaXB0aW9uIG1h
cmt1cCB3ZSByZWFkCiAqIE91dHB1dCBkZXNjcmlwdGlvbnMgYXMgbGl0ZXJhbHMgaW4gWUFNTCBh
bmQgd3JhcCBtYXJrdXAgb3Vyc2VsdmVzCgpTcGVjaWZpY2F0aW9uOgogKiBkb2NzOiBEb2N1bWVu
dCB0aGUgYXBwc3RyZWFtY2xpIG5ld3MgZmlsZSBjb252ZXJzaW9uIGhlbHBlcgogKiBJbXBsZW1l
bnQgc3VwcG9ydCBmb3IgaGVhZGluZ3MgaW4gZGVzY3JpcHRpb24gbWFya3VwCgpCdWdmaXhlczoK
ICogbWVzb246IFNldCBfUE9TSVhfQ19TT1VSQ0Ugb24gTGludXggb25seQogKiBjb21wb3NlOiBG
aXggYSByYWNlIHdoZXJlIHVuaXRzIHdlcmUgZGVsZXRpbmcgZWFjaCBvdGhlcidzIGljb24gZGly
ZWN0b3JpZXMKICogY29tcG9zZTogRml4IGRvY3VtZW50YXRpb24gYW5kIGludHJvc3BlY3Rpb24g
YW5ub3RhdGlvbiBpc3N1ZXMKICogY29tcG9zZTogRHJvcCBkZWFkIHB1YmxpYyBBUEksIG1ha2Ug
c29tZSBBUEkgcHJpdmF0ZQogKiBjb21wb3NlOiBTaGFycGVuIHdpdGggbGlidmlwcyBpbnN0ZWFk
IG9mIGEgaGFuZC1yb2xsZWQgdW5zaGFycCBtYXNrCiAqIGNvbXBvc2U6IE9ubHkgcmVhZCBBVklG
IGZyb20gSEVJRiBjb250YWluZXJzLCBuZXZlciBIRUlDCiAqIGNvbXBvc2U6IEZpeCBkb3VibGUt
ZnJlZSBjcmFzaCB3aAoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNo
YXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVu
dCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVt
b3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoICAgIHwgNiArKystLS0KIC4uLi9hcHBzdHJlYW0vYXBw
c3RyZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoICAgIHwgMiArLQogLi4ueC1Q
QUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2ggfCAy
ICstCiAuLi4vYXBwc3RyZWFtL3thcHBzdHJlYW1fMS4xLjYuYmIgPT4gYXBwc3RyZWFtXzEuMi4w
LmJifSAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS97YXBwc3RyZWFt
XzEuMS42LmJiID0+IGFwcHN0cmVhbV8xLjIuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2Rl
ZC1wYXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8w
MDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaAppbmRleCA5ZDFmZjYzOWMwLi5kMGNiNWNm
NmY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFt
LzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDc1YzU1MGYyZjg4ZDk5MGZkYjE4YjYxMThjYTA1MmFmNzMy
YTExYjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBhNTMyZWYyOTg1NTU5OWU0NzYx
OTIzYmIzODA2OWU5OGQ3OGUyNWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJr
dXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBNb24sIDEyIERlYyAyMDIyIDE1OjQy
OjQyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBoYXJkY29kZWQgcGF0aApAQCAtMTQs
MTAgKzE0LDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Utc3BlY2lmaWNd
CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDI0ZDEwNjkuLjE0ZmZm
ZmYgMTAwNjQ0CitpbmRleCAwMDRkY2UzLi5jZWZiODUyIDEwMDY0NAogLS0tIGEvbWVzb24uYnVp
bGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtMjMwLDEwICsyMzAsMTAgQEAgZW5kaWYKK0BAIC0y
MjksMTAgKzIyOSwxMCBAQCBlbmRpZgogIHN0ZW1tZXJfaW5jX2RpcnMgPSBpbmNsdWRlX2RpcmVj
dG9yaWVzKCkKICBpZiBnZXRfb3B0aW9uKCdzdGVtbWluZycpCiAgICAgIHN0ZW1tZXJfbGliID0g
Y2MuZmluZF9saWJyYXJ5KCdzdGVtbWVyJywgcmVxdWlyZWQ6IHRydWUpCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxk
LXF0LXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVh
bS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaAppbmRleCBjOWQ1NDRmM2ZjLi44NjFk
OTU1MmE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3Ry
ZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZiNTBjMTVlMzUwZjgwZTgwNTgxNmYxYzJhZTJhYmU5
N2NlZjYzMTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBkMzg3YjZjYjg5MDdkZDM3
NzIxMmRlMTg3ZmJlNzQ5YjQwZWVkYjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBN
YXJjIEZlcmxhbmQgPG1hcmMuZmVybGFuZEBzb25hdGVzdC5jb20+CiBEYXRlOiBGcmksIDI2IEp1
bCAyMDI0IDE1OjQxOjAwIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBidWlsZCBxdC90
ZXN0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVh
bS8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25m
aWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMt
Rml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRj
aAppbmRleCAxODVkZDUwN2IzLi45ZjA2Zjc4OTE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1p
bi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1x
dC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjdh
MTI1ZTkwZjk5YTk5NzY1MmZjZWIwNzI2MzUxN2RmMGYxZWNjNiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMmMwNzU4YTg0NzQxZTZlOTFjZmQxYmE3MGU5MDE3YmE0ZTc2MTQzYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJsYW5kQHNv
bmF0ZXN0LmNvbT4KIERhdGU6IE1vbiwgMjkgSnVsIDIwMjQgMDk6MzU6NTEgLTA0MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRml4IFBBQ0tBR0VfUFJFRklYX0RJUiBpbiBxdC9jbWFrZS9BcHBTdHJlYW1R
dENvbmZpZy5jbWFrZS5pbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3Ry
ZWFtL2FwcHN0cmVhbV8xLjEuNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9h
cHBzdHJlYW1fMS4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjEuNi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjIuMC5iYgppbmRleCA3MjNj
NzQwMDA2Li40YTFjMjNlNzYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBz
dHJlYW0vYXBwc3RyZWFtXzEuMS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0
cmVhbS9hcHBzdHJlYW1fMS4yLjAuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSSA9ICIgXAog
CWZpbGU6Ly8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaCBcCiAJZmlsZTovLzAwMDMt
Rml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRj
aCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTI5ODkyOWYzOTcyOWU4NGE3MGY2YmU2OTQx
ZjNlN2YzZmMyZWUzYzgzY2IzZWExYjFiNWIyODBhOGZlM2EyNCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5MDE5MTkzNzg5MTA1NTAyNzFmZWIyZDgyNjAzNGM5YWY2NTIyZjNhZDIxOGRlMDRkM2Q2
ZDM1ZGRiYTVjYjQ1IgogCiBTID0gIiR7VU5QQUNLRElSfS9BcHBTdHJlYW0tJHtQVn0iCiAKLS0g
CjIuNDcuMQoK

--===============1336722111172367893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2802312 to 2833032 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.1.6", added "/usr/lib/.debug/libappstream.so.1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGSIZE changed from 1356907 to 1360901 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGSIZE changed from 2721645 to 2851570 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-doc: FILELIST: added "/usr/share/doc/appstream/html/sect-Quickstart-Releases.html"
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PKGSIZE changed from 18009 to 18599 (+3%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PKGSIZE changed from 153234 to 152334 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PKGSIZE changed from 115222 to 114565 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PKGSIZE changed from 28037 to 28163 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PKGSIZE changed from 60838 to 60279 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGSIZE changed from 116819 to 116159 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PKGSIZE changed from 108688 to 108073 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PKGSIZE changed from 72907 to 72247 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PKGSIZE changed from 118922 to 118273 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGSIZE changed from 62405 to 61789 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGSIZE changed from 121441 to 120765 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PKGSIZE changed from 114949 to 114278 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PKGSIZE changed from 170253 to 169221 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PKGSIZE changed from 93286 to 92662 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PKGSIZE changed from 83640 to 82927 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PKGSIZE changed from 111832 to 111185 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGSIZE changed from 103962 to 103308 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PKGSIZE changed from 62591 to 64544 (+3%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PKGSIZE changed from 153168 to 155929 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PKGSIZE changed from 92697 to 92098 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PKGSIZE changed from 72564 to 71898 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGSIZE changed from 123732 to 125936 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PKGSIZE changed from 116660 to 115987 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGSIZE changed from 116031 to 115364 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PKGSIZE changed from 125212 to 127239 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGSIZE changed from 151504 to 150574 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PKGSIZE changed from 26362 to 25813 (-2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGSIZE changed from 116611 to 120689 (+3%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PKGSIZE changed from 112479 to 111862 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PKGSIZE changed from 145718 to 144878 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGSIZE changed from 117841 to 119857 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PKGSIZE changed from 199378 to 198381 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGSIZE changed from 121319 to 123487 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGSIZE changed from 161692 to 160784 (-1%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PKGSIZE changed from 103607 to 108445 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PKGSIZE changed from 31101 to 39115 (+26%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGSIZE changed from 2017382 to 2080249 (+3%)
packages/x86-64-v3-poky-linux/appstream/appstream-src: FILELIST: directory renamed /usr/src/debug/appstream/1.1.6/src -> /usr/src/debug/appstream/1.2.0/src, directory renamed /usr/src/debug/appstream/1.1.6/tools -> /usr/src/debug/appstream/1.2.0/tools
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-src: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGSIZE changed from 1127627 to 1109784 (-2%)
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.1.6", added "/usr/lib/libappstream.so.1.2.0"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream/appstream: PV changed from "1.1.6" to "1.2.0"
packages/x86-64-v3-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.1.6.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.2.0.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch"
packages/x86-64-v3-poky-linux/appstream: PKGV changed from 1.1.6 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/appstream: PV changed from "1.1.6" to "1.2.0"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.1.6 to libappstream.so.1.2.0
  /usr/lib/libappstream.so.1.1.6 moved to /usr/lib/libappstream.so.1.2.0
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.1.6 to libappstream.so.1.2.0
  /usr/lib/libappstream.so.1.1.6 moved to /usr/lib/libappstream.so.1.2.0

--===============1336722111172367893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="appstream-changelog.txt"

Changelog for appstream: 1.1.6 -> 1.2.0
Source: NEWS

Version 1.2.0
~~~~~~~~~~~~~
Released: 2026-08-28

Notes:
 * This release marks the libappstream-compose API as stable.

 * This release introduces a new, lightly sandboxed (on Linux) media worker for appstream-compose
   and switches to VIPS for image processing. Please report any issues you may find! The sandbox
   can be disabled by setting `ASC_NO_SANDBOX=1` in the environment.
   The image formats XPM, TIFF and BMP will no longer be read by Compose, and will be rejected
   unconditionally.

 * This release introduces <heading>My headline!</heading> markup for AppStream descriptions.
   Older versions will remove this markup, so only use it if your target clients have a recent
   version of AppStream.

Features:
 * compose: Create AscMedia for isolated out-of-process media handling using asc-mediaworker
 * compose: Process images, fonts & videos via the media worker
 * Generalize path segment validation, use it in the compose media worker
 * compose: Switch from using GdkPixbuf to VIPS for image processing
 * compose: Harmonize supported formats, don't read XPM/TIFF/BMP
 * compose: Make JPEG-XL the default image output format
 * compose: Implement basic support for FreeBSD
 * compose: Rely on VIPS for SVG support, drop our dedicated librsvg path
 * compose: Make image-targets and image batch-processing public API
 * compose: Expose the source-icon convention and a hint-tag lookup as public API
 * compose: Drop unstable-API marker
 * compose: Don't create image thumbnails that aren't a substantially smaller
 * compose: Only transfer pre-opened fds and no more directory fd to the worker
 * compose: Implement a basic sandbox for the mediaworker using Landlock
 * compose: Use RESTRICT_SELF_TSYNC and block UDP access on newer Landlock
 * compose: Mix the output image format type into the GCID
 * compose: Make AscUnit a proper abstract class
 * compose: Improve API documentation
 * Always sanitize whitespaces in keywords and drop empty ones
 * Assume a language element without percentage means full translation
 * news-to-metainfo: Support a details URL in the YAML variant
 * news-convert: Support inline Markdown in news text
 * news-convert: Support headers in XML<->YAML/NEWS/Markdown conversions
 * ascli: news-convert: Support standalone release XML as source/target
 * Whitespace-sanitize all description markup we read
 * Output descriptions as literals in YAML and wrap markup ourselves

Specification:
 * docs: Document the appstreamcli news file conversion helper
 * Implement support for headings in description markup

Bugfixes:
 * meson: Set _POSIX_C_SOURCE on Linux only
 * compose: Fix a race where units were deleting each other's icon directories
 * compose: Fix documentation and introspection annotation issues
 * compose: Drop dead public API, make some API private
 * compose: Sharpen with libvips instead of a hand-rolled unsharp mask
 * compose: Only read AVIF from HEIF containers, never HEIC
 * compose: Fix double-free crash when processing fonts
 * compose: Guard against bad locale in path names
 * compose: Ensure component-IDs are safe to use in filesystem paths
 * compose: Escape values for HTML reports, and create proper plain-text if needed
 * compose: Make missing-launchable-desktop-file an error
 * Fix a few translator hints that weren't picked up properly
 * Don't accept empty strings as URLs
 * its: Fix description inline markup translation for release data
 * validator: Fix improper use of variadic arguments
 * validator: Properly validate component-IDs with random UTF-8 characters
 * validator: Abort ID validation after the first invalid character
 * pool: Resolve crash if data locations are changed on a loaded pool
 * Fix wrong string comparison when detecting arm64 machines
 * ascli: Resolve crash when selection is cancelled in install/remove
 * Fix another crash when converting invalid description markup to Markdown
 * apt: Treat icon tarballs as hostile, instead of trusted
 * apt: Fix empty-directory check nuking the icon cache on every refresh
 * utils: Ensure we never ever follow symlinks when recursively deleting caches
 * xml: Only emit description enumerations for locales that are in them
 * cache: Never infinite-recurse when resolving addons for a component
 * yaml: Don't leave old header data around when parsing multiple YAML catalogs

Miscellaneous:
 * ci: fedora: Disable cisco-openh264 repo, it's currently broken on rawhide
 * compose: Stop leaking private symbols out of the shared library
 * compose: Make hint tag/severity/explanation setters private API
 * compose: Seal the global settings explicitly on start
 * news-convert: Refactor conversion code for better readability
 * ascli: Refactor subcommand dispatch
 * meson: Disable analyzer-infinite-loop more broadly for static analysis

Contributors:
 Matthias Klumpp

--===============1336722111172367893==--

