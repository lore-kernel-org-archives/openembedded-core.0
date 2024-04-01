Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AFFCD12AD
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2293.1711995071155001438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fiwfj4dZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=k0LolAqP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e9adba888-1f2eec13-2389-4051-85c4-37c05407ee11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jOAWSxPhadX/l+HihE6VYNWNEEELtO2te06jvMEX/SE=;
	b=Fiwfj4dZo1qNa2EJCphRmpZDEDrPBQlL90y5NTYyN9vEXm6FWj97fp9enVhPVarL
	0xMo/+Ho/ukppRhZygHkJX9yF4vjxvEBfCQ8vKLFBChKCuMr+a4QM3vMK5QFt0cEhJ2
	Eqkwpsn9VUTwFy1EZTwknsBkHWSPYS74ruqTGqN4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jOAWSxPhadX/l+HihE6VYNWNEEELtO2te06jvMEX/SE=;
	b=k0LolAqP29CcD4ueEzZA7qiNseuzPO2LSSrclUJesxihUQdlnZFQpF5NjfRjAYcV
	VJAK3LJRhlBbY5nTdIvdbogVIBSrCZlO191mgB7hPnD9mk+gew1UN12EtKRdoTpVO7l
	BB+yQ1m0PQisl2g1iQNFj/SFjpoE7cGwweJvIf7o=
Content-Type: multipart/mixed; boundary="===============9139307071835571789=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 3.0.18 SUCCEEDED
Message-ID: <0101018e9adba888-1f2eec13-2389-4051-85c4-37c05407ee11-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197824

--===============9139307071835571789==
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
From 2603c46fd81493ee2ba655738914d91bd8ee16fc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 17:39:25 +0000
Subject: [PATCH] libical: upgrade 3.0.17 -> 3.0.18

---
 ...e-Do-not-export-CC-into-gir-compiler.patch |  7 ++---
 .../{libical_3.0.17.bb => libical_3.0.18.bb}  | 29 +++++++++++++++++--
 2 files changed, 29 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.17.bb => libical_3.0.18.bb} (71%)

diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
index 3841c060ee..590fb6b647 100644
--- a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -1,4 +1,4 @@
-From c06d8a8990c996cbb854508a944202ba70ba7a7c Mon Sep 17 00:00:00 2001
+From 9edc2691eaf879403116f9ec37ff1e445cd62596 Mon Sep 17 00:00:00 2001
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


--===============9139307071835571789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical_cxx.so.3.0.17 /usr/lib/libical-glib.so.3.0.17 /usr/lib/libicalss.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libicalvcal.so.3.0.17 /usr/lib/libical.so.3.0.17", added "/usr/lib/libical_cxx.so.3.0.18 /usr/lib/libical.so.3.0.18 /usr/lib/libicalvcal.so.3.0.18 /usr/lib/libicalss_cxx.so.3.0.18 /usr/lib/libicalss.so.3.0.18 /usr/lib/libical-glib.so.3.0.18"
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

--===============9139307071835571789==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-3.0.17-3.0.18.patch"

RnJvbSAyNjAzYzQ2ZmQ4MTQ5M2VlMmJhNjU1NzM4OTE0ZDkxYmQ4ZWUxNmZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNzozOToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmljYWw6IHVwZ3JhZGUgMy4wLjE3IC0+IDMuMC4xOAoKLS0tCiAuLi5lLURvLW5vdC1leHBvcnQt
Q0MtaW50by1naXItY29tcGlsZXIucGF0Y2ggfCAgNyArKy0tLQogLi4uL3tsaWJpY2FsXzMuMC4x
Ny5iYiA9PiBsaWJpY2FsXzMuMC4xOC5iYn0gIHwgMjkgKysrKysrKysrKysrKysrKystLQogMiBm
aWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwve2xpYmljYWxfMy4wLjE3LmJiID0+IGxpYmljYWxf
My4wLjE4LmJifSAoNzElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmlj
YWwvbGliaWNhbC8wMDAxLWNtYWtlLURvLW5vdC1leHBvcnQtQ0MtaW50by1naXItY29tcGlsZXIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWwvMDAwMS1jbWFrZS1E
by1ub3QtZXhwb3J0LUNDLWludG8tZ2lyLWNvbXBpbGVyLnBhdGNoCmluZGV4IDM4NDFjMDYwZWUu
LjU5MGZiNmI2NDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGli
aWNhbC8wMDAxLWNtYWtlLURvLW5vdC1leHBvcnQtQ0MtaW50by1naXItY29tcGlsZXIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsLzAwMDEtY21ha2UtRG8t
bm90LWV4cG9ydC1DQy1pbnRvLWdpci1jb21waWxlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYzA2ZDhhODk5MGM5OTZjYmI4NTQ1MDhhOTQ0MjAyYmE3MGJhN2E3YyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOWVkYzI2OTFlYWY4Nzk0MDMxMTZmOWVjMzdmZjFlNDQ1Y2Q2MjU5
NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBUaHUsIDMgTWFyIDIwMjIgMjA6MTA6MDQgLTA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gY21ha2U6IERvIG5vdCBleHBvcnQgQ0MgaW50byBnaXIgY29tcGlsZXIKQEAgLTE1LDcg
KzE1LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9jbWFrZS9tb2R1bGVzL0dPYmplY3RJbnRyb3NwZWN0aW9uTWFjcm9zLmNtYWtlIGIvY21h
a2UvbW9kdWxlcy9HT2JqZWN0SW50cm9zcGVjdGlvbk1hY3Jvcy5jbWFrZQotaW5kZXggODNhZmY5
MzEuLmQ3ZDNmODk4IDEwMDY0NAoraW5kZXggODNhZmY5My4uZDdkM2Y4OSAxMDA2NDQKIC0tLSBh
L2NtYWtlL21vZHVsZXMvR09iamVjdEludHJvc3BlY3Rpb25NYWNyb3MuY21ha2UKICsrKyBiL2Nt
YWtlL21vZHVsZXMvR09iamVjdEludHJvc3BlY3Rpb25NYWNyb3MuY21ha2UKIEBAIC01MCw4ICs1
MCw3IEBAIG1hY3JvKGdpcl9hZGRfaW50cm9zcGVjdGlvbnMgaW50cm9zcGVjdGlvbnNfZ2lycykK
QEAgLTI4LDYgKzI4LDMgQEAgaW5kZXggODNhZmY5MzEuLmQ3ZDNmODk4IDEwMDY0NAogICAgICAg
ICAgICAgICAgJHtHT2JqZWN0SW50cm9zcGVjdGlvbl9TQ0FOTkVSX0FSR1N9CiAgICAgICAgICAg
ICAgICAtLW5hbWVzcGFjZT0ke19naXJfbmFtZXNwYWNlfQogICAgICAgICAgICAgICAgLS1uc3Zl
cnNpb249JHtfZ2lyX3ZlcnNpb259Ci0tLSAKLTIuMzUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE3LmJiIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xOC5iYgpzaW1pbGFyaXR5IGluZGV4IDcxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE3LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE4LmJiCmlu
ZGV4IGI5MTkxMmIwNDguLjE0ZjJmYTM1NzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmljYWwvbGliaWNhbF8zLjAuMTcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliaWNhbC9saWJpY2FsXzMuMC4xOC5iYgpAQCAtMSwzICsxLDI4IEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRS5MR1BMMjEudHh0CisjICsrKyBMSUNFTlNFLkxHUEwyMS50eHQKKyMg
QEAgLTEsMTEgKzEsMyBAQAorIyAtCisjIC0gTGliaWNhbCBpcyBDb3B5cmlnaHQgKEMpIDIwMTAt
MjAxNyBLbGFyYWx2ZGFsZW5zIERhdGFrb25zdWx0IEFCLgorIyAtCisjIC0gWW91IG1heSB1c2Us
IGRpc3RyaWJ1dGUgYW5kIGNvcHkgTGliaWNhbCB1bmRlciB0aGUgdGVybXMgb2YgdGhlCisjIC0g
R05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMi4xLCB3aGljaCBpcyBk
aXNwbGF5ZWQgYmVsb3cuCisjIC0KKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgLQorIyAgICAgICAg
ICAgICAgICAgICAgR05VIExFU1NFUiBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICAgICAg
ICAgICAgICAgICAgICAgIFZlcnNpb24gMi4xLCBGZWJydWFyeSAxOTk5CisjICAKKyMgCisjCisK
IFNVTU1BUlkgPSAiaUNhbCBhbmQgc2NoZWR1bGluZyAoUkZDIDI0NDUsIDI0NDYsIDI0NDcpIGxp
YnJhcnkiCiBERVNDUklQVElPTiA9ICJBbiBPcGVuIFNvdXJjZSBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUgaUNhbGVuZGFyIHByb3RvY29scyBcCiBhbmQgcHJvdG9jb2wgZGF0YSB1bml0cy4gVGhlIGlD
YWxlbmRhciBzcGVjaWZpY2F0aW9uIGRlc2NyaWJlcyBob3cgXApAQCAtNyw3ICszMiw3IEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJpY2FsL2xpYmljYWwiCiBCVUdUUkFDS0VS
ID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJpY2FsL2xpYmljYWwvaXNzdWVzIgogTElDRU5TRSA9
ICJMR1BMLTIuMS1vbmx5IHwgTVBMLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTE5MTBhMmE3NmRkZjZhOWJhMzY5MTgyNDk0MTcwZDg3IFwKLSAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL0xJQ0VOU0UuTEdQTDIxLnR4dDttZDU9OTMzYWRiNTYxZjE1OWU3YzNk
YTA3OTUzNmYwZWQ4NzEgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BM
MjEudHh0O21kNT04ZjY5MGJiNTM4ZjRiMzAxZDkzMTM3NGE2ZWI4NjRkMCBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLk1QTDIudHh0O21kNT1mNzVkMjkyN2QzYzFlZDI0MTRl
ZjcyMDQ4ZjVhZDY0MCBcCiAgICAgICAgICAgICAgICAgICAgICIKIFNFQ1RJT04gPSAibGlicyIK
QEAgLTE1LDcgKzQwLDcgQEAgU0VDVElPTiA9ICJsaWJzIgogU1JDX1VSSSA9ICIke0dJVEhVQl9C
QVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWNtYWtlLURvLW5vdC1leHBvcnQtQ0MtaW50by1naXItY29tcGlsZXIucGF0Y2ggXAog
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiY2RhOWE2ZGI2ODcwMjQwMzI4NzUy
ODU0ZDFlYTQ3NWFmOWJiYzYzNTZlNjc3MTAxODIwMGU0NzVlNWY3ODFiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjcyYjdkYzFhNTkzNzUzM2FlZTVhMmJhZWZjOTkwOTgzYjY2YjE0MWRkODBkNDNi
NTFmODBhY2VkNGFhZTIxOWMiCiAKIGluaGVyaXQgY21ha2UgcGtnY29uZmlnIGdvYmplY3QtaW50
cm9zcGVjdGlvbiB2YWxhIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQyLjAKCg==

--===============9139307071835571789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v3.0.17/libical-3.0.17.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch" to "https://github.com/libical/libical/releases//download/v3.0.18/libical-3.0.18.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch"
packages/core2-64-poky-linux/libical: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-dbg: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-dbg: PKGSIZE changed from 3151792 to 3152928 (+0%)
packages/core2-64-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libicalss.so.3.0.17 /usr/lib/.debug/libical-glib.so.3.0.17 /usr/lib/.debug/libical_cxx.so.3.0.17 /usr/lib/.debug/libical.so.3.0.17 /usr/lib/.debug/libicalvcal.so.3.0.17 /usr/lib/.debug/libicalss_cxx.so.3.0.17", added "/usr/lib/.debug/libical-glib.so.3.0.18 /usr/lib/.debug/libicalss.so.3.0.18 /usr/lib/.debug/libicalss_cxx.so.3.0.18 /usr/lib/.debug/libical_cxx.so.3.0.18 /usr/lib/.debug/libical.so.3.0.18 /usr/lib/.debug/libicalvcal.so.3.0.18"
packages/core2-64-poky-linux/libical/libical-dbg: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-dev: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-dev: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-doc: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-doc: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-locale: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-locale: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-src: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-src: PKGSIZE changed from 3062458 to 3064122 (+0%)
packages/core2-64-poky-linux/libical/libical-src: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical-staticdev: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical-staticdev: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
packages/core2-64-poky-linux/libical/libical: PV changed from "3.0.17" to "3.0.18"
packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalss.so.3.0.17 /usr/lib/libical-glib.so.3.0.17 /usr/lib/libicalss_cxx.so.3.0.17 /usr/lib/libicalvcal.so.3.0.17 /usr/lib/libical_cxx.so.3.0.17 /usr/lib/libical.so.3.0.17", added "/usr/lib/libicalvcal.so.3.0.18 /usr/lib/libicalss_cxx.so.3.0.18 /usr/lib/libical-glib.so.3.0.18 /usr/lib/libicalss.so.3.0.18 /usr/lib/libical.so.3.0.18 /usr/lib/libical_cxx.so.3.0.18"
packages/core2-64-poky-linux/libical/libical: PKGV changed from 3.0.17 [default] to 3.0.18 [default]
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

--===============9139307071835571789==--

