Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C37C3271E
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.13442.1713248039915144425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A8fT6vfI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0BplXzG/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58aa4b8-ff815920-43fa-4980-b15f-4f6b83d42a93-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zo1Fnm8yeKJCdV6SDvk+a/TE4nn3WZNfQMT/WfXfho4=;
	b=A8fT6vfI1NpNPhk6prQMC0J+BDeYYVGNgE3pyNjtzb8HO+HuFfddk1HGQV9yeIiQ
	3KsxPjhBEo2d+hDaSeL/fRczKvHCv+ZgBvKXUdOOW/x8hdWjzvSd4G4JWP4psR7GP0a
	/YDaVUAQBLAPEitEe35uQRoImBGz/XIrc8nCtRvs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zo1Fnm8yeKJCdV6SDvk+a/TE4nn3WZNfQMT/WfXfho4=;
	b=0BplXzG/hBIJt+XVRMo7uhZboVcdwvhoPag9PBmv7LqXB+pXdviVl8uJ54wSt/9f
	PuQ6tuvPVaSkpuQEGZCFV02J2X3suWl4MsEYMqYYGBJR9J2+2hOqQzMKk0F4YOd2D/4
	RTBepV04PjEIxeCpH9DLaJ+sKOExqaaSdVVVyhBI=
Content-Type: multipart/mixed; boundary="===============3433501615692431839=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 3.0.18 SUCCEEDED
Message-ID: <0101018ee58aa4b8-ff815920-43fa-4980-b15f-4f6b83d42a93-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198423

--===============3433501615692431839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libical* to *3.0.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libical-upgrade-3.0.17-3.0.18.patch
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
From 51d2ad34a739dc838a646e38ce534c37b639caff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 05:45:02 +0000
Subject: [PATCH] libical: upgrade 3.0.17 -> 3.0.18

---
 ...e-Do-not-export-CC-into-gir-compiler.patch |  7 ++---
 .../{libical_3.0.17.bb => libical_3.0.18.bb}  | 29 +++++++++++++++++--
 2 files changed, 29 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.17.bb => libical_3.0.18.bb} (71%)

diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
index 3841c060ee..34d9fb90f3 100644
--- a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -1,4 +1,4 @@
-From c06d8a8990c996cbb854508a944202ba70ba7a7c Mon Sep 17 00:00:00 2001
+From 4d6ae2f1214f94611164ab70dd45ba10edc8c080 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 3 Mar 2022 20:10:04 -0800
 Subject: [PATCH] cmake: Do not export CC into gir compiler
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/cmake/modules/GObjectIntrospectionMacros.cmake b/cmake/modules/GObjectIntrospectionMacros.cmake
-index 83aff931..d7d3f898 100644
+index 83aff93..d7d3f89 100644
 --- a/cmake/modules/GObjectIntrospectionMacros.cmake
 +++ b/cmake/modules/GObjectIntrospectionMacros.cmake
 @@ -50,8 +50,7 @@ macro(gir_add_introspections introspections_girs)
@@ -28,6 +28,3 @@ index 83aff931..d7d3f898 100644
                ${GObjectIntrospection_SCANNER_ARGS}
                --namespace=${_gir_namespace}
                --nsversion=${_gir_version}
--- 
-2.35.1
-
diff --git a/meta/recipes-support/libical/libical_3.0.17.bb b/meta/recipes-support/libical/libical_3.0.18.bb
similarity index 71%
rename from meta/recipes-support/libical/libical_3.0.17.bb
rename to meta/recipes-support/libical/libical_3.0.18.bb
index b91912b048..14f2fa3570 100644
--- a/meta/recipes-support/libical/libical_3.0.17.bb
+++ b/meta/recipes-support/libical/libical_3.0.18.bb
@@ -1,3 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.LGPL21.txt
+# +++ LICENSE.LGPL21.txt
+# @@ -1,11 +1,3 @@
+# -
+# - Libical is Copyright (C) 2010-2017 Klaralvdalens Datakonsult AB.
+# -
+# - You may use, distribute and copy Libical under the terms of the
+# - GNU Lesser General Public License version 2.1, which is displayed below.
+# -
+# --------------------------------------------------------------------------
+# -
+#                    GNU LESSER GENERAL PUBLIC LICENSE
+#                         Version 2.1, February 1999
+#  
+# 
+#
+
 SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
 DESCRIPTION = "An Open Source implementation of the iCalendar protocols \
 and protocol data units. The iCalendar specification describes how \
@@ -7,7 +32,7 @@ HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
 LICENSE = "LGPL-2.1-only | MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
-                    file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
+                    file://LICENSE.LGPL21.txt;md5=8f690bb538f4b301d931374a6eb864d0 \
                     file://LICENSE.MPL2.txt;md5=f75d2927d3c1ed2414ef72048f5ad640 \
                     "
 SECTION = "libs"
@@ -15,7 +40,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "bcda9a6db6870240328752854d1ea475af9bbc6356e6771018200e475e5f781b"
+SRC_URI[sha256sum] = "72b7dc1a5937533aee5a2baefc990983b66b141dd80d43b51f80aced4aae219c"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.42.0


--===============3433501615692431839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical_cxx.so.3.0.17 /usr/lib/libicalvcal.so.3.0.17 /usr/lib/libical.so.3.0.17 /usr/lib/libical-glib.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libicalss.so.3.0.17", added "/usr/lib/libical.so.3.0.18 /usr/lib/libicalvcal.so.3.0.18 /usr/lib/libical_cxx.so.3.0.18 /usr/lib/libicalss.so.3.0.18 /usr/lib/libicalss_cxx.so.3.0.18 /usr/lib/libical-glib.so.3.0.18"
Changes to packages/core2-64-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.17 to libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.17 to libical-glib.so.3.0.18
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.17 to libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.17 to libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.17 to libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.17 to libicalvcal.so.3.0.18
  /usr/lib/libical_cxx.so.3.0.17 moved to /usr/lib/libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3.0.17 moved to /usr/lib/libical-glib.so.3.0.18
  /usr/lib/libical.so.3.0.17 moved to /usr/lib/libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3.0.17 moved to /usr/lib/libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3.0.17 moved to /usr/lib/libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3.0.17 moved to /usr/lib/libicalvcal.so.3.0.18
Changes to packages/x86_64-linux/libical-native (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.17 to libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.17 to libical-glib.so.3.0.18
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.17 to libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.17 to libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.17 to libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.17 to libicalvcal.so.3.0.18
  /usr/lib/libical_cxx.so.3.0.17 moved to /usr/lib/libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3.0.17 moved to /usr/lib/libical-glib.so.3.0.18
  /usr/lib/libical.so.3.0.17 moved to /usr/lib/libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3.0.17 moved to /usr/lib/libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3.0.17 moved to /usr/lib/libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3.0.17 moved to /usr/lib/libicalvcal.so.3.0.18

--===============3433501615692431839==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-3.0.17-3.0.18.patch"

RnJvbSA1MWQyYWQzNGE3MzlkYzgzOGE2NDZlMzhjZTUzNGMzN2I2MzljYWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDU6NDU6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpY2FsOiB1cGdyYWRlIDMuMC4xNyAtPiAzLjAuMTgKCi0tLQogLi4uZS1Eby1ub3QtZXhwb3J0
LUNDLWludG8tZ2lyLWNvbXBpbGVyLnBhdGNoIHwgIDcgKystLS0KIC4uLi97bGliaWNhbF8zLjAu
MTcuYmIgPT4gbGliaWNhbF8zLjAuMTguYmJ9ICB8IDI5ICsrKysrKysrKysrKysrKysrLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL3tsaWJpY2FsXzMuMC4xNy5iYiA9PiBsaWJpY2Fs
XzMuMC4xOC5iYn0gKDcxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJp
Y2FsL2xpYmljYWwvMDAwMS1jbWFrZS1Eby1ub3QtZXhwb3J0LUNDLWludG8tZ2lyLWNvbXBpbGVy
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsLzAwMDEtY21ha2Ut
RG8tbm90LWV4cG9ydC1DQy1pbnRvLWdpci1jb21waWxlci5wYXRjaAppbmRleCAzODQxYzA2MGVl
Li4zNGQ5ZmI5MGYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xp
YmljYWwvMDAwMS1jbWFrZS1Eby1ub3QtZXhwb3J0LUNDLWludG8tZ2lyLWNvbXBpbGVyLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbC8wMDAxLWNtYWtlLURv
LW5vdC1leHBvcnQtQ0MtaW50by1naXItY29tcGlsZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGMwNmQ4YTg5OTBjOTk2Y2JiODU0NTA4YTk0NDIwMmJhNzBiYTdhN2MgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDRkNmFlMmYxMjE0Zjk0NjExMTY0YWI3MGRkNDViYTEwZWRjOGMw
ODAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogRGF0ZTogVGh1LCAzIE1hciAyMDIyIDIwOjEwOjA0IC0wODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGNtYWtlOiBEbyBub3QgZXhwb3J0IENDIGludG8gZ2lyIGNvbXBpbGVyCkBAIC0xNSw3
ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvY21ha2UvbW9kdWxlcy9HT2JqZWN0SW50cm9zcGVjdGlvbk1hY3Jvcy5jbWFrZSBiL2Nt
YWtlL21vZHVsZXMvR09iamVjdEludHJvc3BlY3Rpb25NYWNyb3MuY21ha2UKLWluZGV4IDgzYWZm
OTMxLi5kN2QzZjg5OCAxMDA2NDQKK2luZGV4IDgzYWZmOTMuLmQ3ZDNmODkgMTAwNjQ0CiAtLS0g
YS9jbWFrZS9tb2R1bGVzL0dPYmplY3RJbnRyb3NwZWN0aW9uTWFjcm9zLmNtYWtlCiArKysgYi9j
bWFrZS9tb2R1bGVzL0dPYmplY3RJbnRyb3NwZWN0aW9uTWFjcm9zLmNtYWtlCiBAQCAtNTAsOCAr
NTAsNyBAQCBtYWNybyhnaXJfYWRkX2ludHJvc3BlY3Rpb25zIGludHJvc3BlY3Rpb25zX2dpcnMp
CkBAIC0yOCw2ICsyOCwzIEBAIGluZGV4IDgzYWZmOTMxLi5kN2QzZjg5OCAxMDA2NDQKICAgICAg
ICAgICAgICAgICR7R09iamVjdEludHJvc3BlY3Rpb25fU0NBTk5FUl9BUkdTfQogICAgICAgICAg
ICAgICAgLS1uYW1lc3BhY2U9JHtfZ2lyX25hbWVzcGFjZX0KICAgICAgICAgICAgICAgIC0tbnN2
ZXJzaW9uPSR7X2dpcl92ZXJzaW9ufQotLS0gCi0yLjM1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xNy5iYiBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmljYWwvbGliaWNhbF8zLjAuMTguYmIKc2ltaWxhcml0eSBpbmRleCA3MSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xNy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xOC5iYgpp
bmRleCBiOTE5MTJiMDQ4Li4xNGYyZmEzNTcwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmljYWwvbGliaWNhbF8zLjAuMTguYmIKQEAgLTEsMyArMSwyOCBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIExJQ0VOU0UuTEdQTDIxLnR4dAorIyArKysgTElDRU5TRS5MR1BMMjEudHh0Cisj
IEBAIC0xLDExICsxLDMgQEAKKyMgLQorIyAtIExpYmljYWwgaXMgQ29weXJpZ2h0IChDKSAyMDEw
LTIwMTcgS2xhcmFsdmRhbGVucyBEYXRha29uc3VsdCBBQi4KKyMgLQorIyAtIFlvdSBtYXkgdXNl
LCBkaXN0cmlidXRlIGFuZCBjb3B5IExpYmljYWwgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZQorIyAt
IEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIuMSwgd2hpY2ggaXMg
ZGlzcGxheWVkIGJlbG93LgorIyAtCisjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIC0KKyMgICAgICAg
ICAgICAgICAgICAgIEdOVSBMRVNTRVIgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAgICAgICAg
ICAgICAgICAgICAgICAgICBWZXJzaW9uIDIuMSwgRmVicnVhcnkgMTk5OQorIyAgCisjIAorIwor
CiBTVU1NQVJZID0gImlDYWwgYW5kIHNjaGVkdWxpbmcgKFJGQyAyNDQ1LCAyNDQ2LCAyNDQ3KSBs
aWJyYXJ5IgogREVTQ1JJUFRJT04gPSAiQW4gT3BlbiBTb3VyY2UgaW1wbGVtZW50YXRpb24gb2Yg
dGhlIGlDYWxlbmRhciBwcm90b2NvbHMgXAogYW5kIHByb3RvY29sIGRhdGEgdW5pdHMuIFRoZSBp
Q2FsZW5kYXIgc3BlY2lmaWNhdGlvbiBkZXNjcmliZXMgaG93IFwKQEAgLTcsNyArMzIsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vbGliaWNhbC9saWJpY2FsIgogQlVHVFJBQ0tF
UiA9ICJodHRwczovL2dpdGh1Yi5jb20vbGliaWNhbC9saWJpY2FsL2lzc3VlcyIKIExJQ0VOU0Ug
PSAiTEdQTC0yLjEtb25seSB8IE1QTC0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xOTEwYTJhNzZkZGY2YTliYTM2OTE4MjQ5NDE3MGQ4NyBcCi0gICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyMS50eHQ7bWQ1PTkzM2FkYjU2MWYxNTllN2Mz
ZGEwNzk1MzZmMGVkODcxIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UuTEdQ
TDIxLnR4dDttZDU9OGY2OTBiYjUzOGY0YjMwMWQ5MzEzNzRhNmViODY0ZDAgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5NUEwyLnR4dDttZDU9Zjc1ZDI5MjdkM2MxZWQyNDE0
ZWY3MjA0OGY1YWQ2NDAgXAogICAgICAgICAgICAgICAgICAgICAiCiBTRUNUSU9OID0gImxpYnMi
CkBAIC0xNSw3ICs0MCw3IEBAIFNFQ1RJT04gPSAibGlicyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJf
QkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1jbWFrZS1Eby1ub3QtZXhwb3J0LUNDLWludG8tZ2lyLWNvbXBpbGVyLnBhdGNoIFwK
ICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmNkYTlhNmRiNjg3MDI0MDMyODc1
Mjg1NGQxZWE0NzVhZjliYmM2MzU2ZTY3NzEwMTgyMDBlNDc1ZTVmNzgxYiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI3MmI3ZGMxYTU5Mzc1MzNhZWU1YTJiYWVmYzk5MDk4M2I2NmIxNDFkZDgwZDQz
YjUxZjgwYWNlZDRhYWUyMTljIgogCiBpbmhlcml0IGNtYWtlIHBrZ2NvbmZpZyBnb2JqZWN0LWlu
dHJvc3BlY3Rpb24gdmFsYSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40Mi4wCgo=

--===============3433501615692431839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v3.0.17/libical-3.0.17.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch" to "https://github.com/libical/libical/releases//download/v3.0.18/libical-3.0.18.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch"
packages/core2-64-poky-linux/libical: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libical.so.3.0.17 /usr/lib/.debug/libical_cxx.so.3.0.17 /usr/lib/.debug/libicalvcal.so.3.0.17 /usr/lib/.debug/libicalss.so.3.0.17 /usr/lib/.debug/libicalss_cxx.so.3.0.17 /usr/lib/.debug/libical-glib.so.3.0.17", added "/usr/lib/.debug/libicalss_cxx.so.3.0.18 /usr/lib/.debug/libicalss.so.3.0.18 /usr/lib/.debug/libical_cxx.so.3.0.18 /usr/lib/.debug/libical.so.3.0.18 /usr/lib/.debug/libicalvcal.so.3.0.18 /usr/lib/.debug/libical-glib.so.3.0.18"
packages/core2-64-poky-linux/libical/libical-dbg: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-dbg: PKGSIZE changed from 3151792 to 3152928 (+0%)
packages/core2-64-poky-linux/libical/libical-dbg: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-dev: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-dev: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-doc: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-doc: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-locale: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-locale: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-src: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-src: PKGSIZE changed from 3062458 to 3064122 (+0%)
packages/core2-64-poky-linux/libical/libical-src: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-staticdev: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-staticdev: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical-glib.so.3.0.17 /usr/lib/libicalss.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libicalvcal.so.3.0.17 /usr/lib/libical.so.3.0.17 /usr/lib/libical_cxx.so.3.0.17", added "/usr/lib/libical.so.3.0.18 /usr/lib/libicalvcal.so.3.0.18 /usr/lib/libicalss_cxx.so.3.0.18 /usr/lib/libicalss.so.3.0.18 /usr/lib/libical-glib.so.3.0.18 /usr/lib/libical_cxx.so.3.0.18"
packages/core2-64-poky-linux/libical/libical: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical: PV changed from "3.0.17" to "3.0.18"
Changes to packages/core2-64-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.17 to libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.17 to libical-glib.so.3.0.18
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.17 to libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.17 to libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.17 to libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.17 to libicalvcal.so.3.0.18
  /usr/lib/libical_cxx.so.3.0.17 moved to /usr/lib/libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3.0.17 moved to /usr/lib/libical-glib.so.3.0.18
  /usr/lib/libical.so.3.0.17 moved to /usr/lib/libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3.0.17 moved to /usr/lib/libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3.0.17 moved to /usr/lib/libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3.0.17 moved to /usr/lib/libicalvcal.so.3.0.18
Changes to packages/x86_64-linux/libical-native (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.17 to libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.17 to libical-glib.so.3.0.18
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.17 to libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.17 to libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.17 to libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.17 to libicalvcal.so.3.0.18
  /usr/lib/libical_cxx.so.3.0.17 moved to /usr/lib/libical_cxx.so.3.0.18
  /usr/lib/libical-glib.so.3.0.17 moved to /usr/lib/libical-glib.so.3.0.18
  /usr/lib/libical.so.3.0.17 moved to /usr/lib/libical.so.3.0.18
  /usr/lib/libicalss_cxx.so.3.0.17 moved to /usr/lib/libicalss_cxx.so.3.0.18
  /usr/lib/libicalss.so.3.0.17 moved to /usr/lib/libicalss.so.3.0.18
  /usr/lib/libicalvcal.so.3.0.17 moved to /usr/lib/libicalvcal.so.3.0.18

--===============3433501615692431839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 40 recipes from the core2-64 sysroot...done.
Removing 40 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9f3581833b42029ff130d19ca996d4bfa6261f50"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9f3581833b42029ff130d19ca996d4bfa6261f50"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 301 Local 290 Mirrors 0 Missed 11 Current 247 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 256 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 257 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 258 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 826 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 347 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe vala-0.56.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 827 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 361 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: recipe vala-0.56.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 382 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: Running task 845 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 846 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: Running task 847 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_lic)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_lic: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_lic unihash changed to 42ecc967368b9c08a044768ace00e86061e1c814386ed1d75793550355ddb9e1
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch unihash changed to a121a1edf120e6ab240cead796f70945bd27927fc8eb247a67e4d1201babf66a
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 399 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 418 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 432 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 445 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 451 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 458 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libcap-ng/0.8.4/temp/log.do_packagedata_setscene.890215
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 477 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_package_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 482 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_package_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 504 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 509 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 514 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 548 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1448 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata)
NOTE: Running task 1506 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1553 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1554 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_configure)
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_configure: Started
NOTE: recipe libical-3.0.18-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_compile)
NOTE: recipe libical-3.0.18-r0: task do_compile: Started
NOTE: recipe libical-3.0.18-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_install)
NOTE: recipe libical-3.0.18-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package)
NOTE: Running task 1558 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.18-r0: task do_package: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_package: Succeeded
NOTE: Running task 1559 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata unihash changed to 6a27f1c17f0c1a557ac06f28f3e03e0caeef4c64b31ddc2e5b27d6b69848d4a6
NOTE: Setscene tasks completed
NOTE: Running task 1560 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_spdx)
NOTE: Running task 1561 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_write_ipk)
NOTE: Running task 1562 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_write_deb)
NOTE: Running task 1563 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_write_rpm)
NOTE: Running task 1564 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_qa)
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.18-r0: task do_package_write_ipk: Started
NOTE: recipe libical-3.0.18-r0: task do_package_write_deb: Started
NOTE: recipe libical-3.0.18-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.18-r0: task do_package_qa: Started
NOTE: recipe libical-3.0.18-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_write_ipk unihash changed to 9e0036c8908515544142c1478305be0ae56782fff8b6970f57522c9ef9055b5d
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 1565 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_runtime_spdx)
NOTE: recipe libical-3.0.18-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_qa unihash changed to cf0db67598f04851460345e65f739d7f1a6a5adeee663ac4e2ee7319e612f0b2
NOTE: recipe libical-3.0.18-r0: task do_create_runtime_spdx: Started
NOTE: recipe libical-3.0.18-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_write_deb unihash changed to f92d2f82c94e32c0039db3c65d93f2fbd3cc09802734fa0535736fa3368d3614
NOTE: recipe libical-3.0.18-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package_write_rpm unihash changed to 5204011f67739f16280192e183ee42cd6ce121bf3fb2102d18722cf255dd3121
NOTE: Running noexec task 1566 of 1566 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_build)
NOTE: Tasks Summary: Attempted 1566 tasks of which 1544 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3433501615692431839==--

