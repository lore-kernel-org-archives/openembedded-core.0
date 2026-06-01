Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF42CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1583.1780328157968905555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tZXrlzBZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=m3AyKH6s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d3d126-9cddfc57-5ae8-4756-9a27-b0ebefffed22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/N8wV/gx4HDa/6PA4VsM9+4qWQdSGuoCZHoIT3X93cY=;
	b=tZXrlzBZT4U7rSlo4OFdGNPi0t8fZ9dwbE5x/zr8Xrgs0qh2oq/lkP3k4NYpPQ8n
	zt3ho22sP5/uhcJvF6vEu1vofkahn2H/Qzs3I2Qh+kBvxkdJ0cwQuD6Tk3puowGZx13
	o0xGCXCeMjPl1h5g663o1KGfBOpTY381q/pWD9Z0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/N8wV/gx4HDa/6PA4VsM9+4qWQdSGuoCZHoIT3X93cY=;
	b=m3AyKH6sTjZdMh4oE/3SLCwstZMh/Q2+BGn7BPZRpPWQ+0d6yFVR913jdUSKYmou
	2We63ZPzpu8wEhTo4Hs61O5qn3O99F0VLZ7QkZcmT9sC6bFYL9dMRnqW5eLsN5NP2mg
	5eVKtCU1fUgJU8RpMuOiMytYyFn/TzPTkxRVmBQs=
Content-Type: multipart/mixed; boundary="===============1866187059248296169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.53.1 SUCCEEDED
Message-ID: <0101019e83d3d126-9cddfc57-5ae8-4756-9a27-b0ebefffed22-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237963

--===============1866187059248296169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.53.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.53.0-3.53.1.patch
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
From 4f30ec9bd100933c2bf8d3b4d1f8676467e4ce0c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 15:26:13 +0000
Subject: [PATCH] sqlite3: upgrade 3.53.0 -> 3.53.1

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch    | 6 +++---
 .../sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.1.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.1.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 77181fe4df..13204379e9 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
+From 24d3a33f8850a8752e62b81da522e66099f9eecb Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
@@ -29,7 +29,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index 85fe414382..77190a7053 100644
+index 59ecb71..16d1e60 100644
 --- a/autosetup/sqlite-config.tcl
 +++ b/autosetup/sqlite-config.tcl
 @@ -287,6 +287,14 @@ proc sqlite-configure {buildMode configScript} {
@@ -47,7 +47,7 @@ index 85fe414382..77190a7053 100644
      # Options for ICU: International Components for Unicode
      icu {
        {*} {
-@@ -656,7 +664,7 @@ proc sqlite-check-common-system-deps {} {
+@@ -674,7 +682,7 @@ proc sqlite-check-common-system-deps {} {
      string.h strings.h \
      inttypes.h
  
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb b/meta/recipes-support/sqlite/sqlite3_3.53.1.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.53.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.1.bb
index 21295bf437..1123ac24d6 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.1.bb
@@ -4,6 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a"
+SRC_URI[sha256sum] = "83e6b2020a034e9a7ad4a72feea59e1ad52f162e09cbd26735a3ffb98359fc4f"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.47.1


--===============1866187059248296169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.0", added "/usr/lib/libsqlite3.so.3.53.1"
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.1
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.1

--===============1866187059248296169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.53.0-3.53.1.patch"

RnJvbSA0ZjMwZWM5YmQxMDA5MzNjMmJmOGQzYjRkMWY4Njc2NDY3ZTRjZTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNToyNjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNx
bGl0ZTM6IHVwZ3JhZGUgMy41My4wIC0+IDMuNTMuMQoKLS0tCiAuLi4vc3FsaXRlL3NxbGl0ZTMv
MDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaCAgICB8IDYgKysrLS0tCiAuLi4v
c3FsaXRlL3tzcWxpdGUzXzMuNTMuMC5iYiA9PiBzcWxpdGUzXzMuNTMuMS5iYn0gICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS97c3FsaXRlM18zLjUzLjAuYmIgPT4g
c3FsaXRlM18zLjUzLjEuYmJ9ICg3NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1k
aXNhYmxlLXpsaWIucGF0Y2gKaW5kZXggNzcxODFmZTRkZi4uMTMyMDQzNzllOSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRv
LWRpc2FibGUtemxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlMy8wMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBmOThhNzM5MDMyZGQ4NjNiYThkZDMxNTcyOWRlZDdhZDBjODY0NzNjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNGQzYTMzZjg4NTBhODc1MmU2MmI4MWRhNTIyZTY2MDk5
ZjllZWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgTWFya28gPHBldGVy
Lm1hcmtvQHNpZW1lbnMuY29tPgogRGF0ZTogU3VuLCAxMiBPY3QgMjAyNSAyMzozMjo0NiArMDIw
MAogU3ViamVjdDogW1BBVENIXSBBZGQgb3B0aW9uIHRvIGRpc2FibGUgemxpYgpAQCAtMjksNyAr
MjksNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQogIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL2F1dG9zZXR1cC9zcWxpdGUtY29uZmlnLnRjbCBiL2F1dG9zZXR1cC9zcWxpdGUtY29uZmln
LnRjbAotaW5kZXggODVmZTQxNDM4Mi4uNzcxOTBhNzA1MyAxMDA2NDQKK2luZGV4IDU5ZWNiNzEu
LjE2ZDFlNjAgMTAwNjQ0CiAtLS0gYS9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wKICsrKyBi
L2F1dG9zZXR1cC9zcWxpdGUtY29uZmlnLnRjbAogQEAgLTI4Nyw2ICsyODcsMTQgQEAgcHJvYyBz
cWxpdGUtY29uZmlndXJlIHtidWlsZE1vZGUgY29uZmlnU2NyaXB0fSB7CkBAIC00Nyw3ICs0Nyw3
IEBAIGluZGV4IDg1ZmU0MTQzODIuLjc3MTkwYTcwNTMgMTAwNjQ0CiAgICAgICMgT3B0aW9ucyBm
b3IgSUNVOiBJbnRlcm5hdGlvbmFsIENvbXBvbmVudHMgZm9yIFVuaWNvZGUKICAgICAgaWN1IHsK
ICAgICAgICB7Kn0gewotQEAgLTY1Niw3ICs2NjQsNyBAQCBwcm9jIHNxbGl0ZS1jaGVjay1jb21t
b24tc3lzdGVtLWRlcHMge30geworQEAgLTY3NCw3ICs2ODIsNyBAQCBwcm9jIHNxbGl0ZS1jaGVj
ay1jb21tb24tc3lzdGVtLWRlcHMge30gewogICAgICBzdHJpbmcuaCBzdHJpbmdzLmggXAogICAg
ICBpbnR0eXBlcy5oCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUv
c3FsaXRlM18zLjUzLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18z
LjUzLjEuYmIKc2ltaWxhcml0eSBpbmRleCA3NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjEuYmIKaW5kZXggMjEyOTViZjQzNy4uMTEyM2FjMjRk
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTMuMS5iYgpA
QCAtNCw2ICs0LDYgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L3NxbGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2
NiIKIAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNi9zcWxpdGUtYXV0b2Nv
bmYtJHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NTFlOWIzODE5
MmZlMmNlYWE2NWUwYmFhNjY1ZTdmYTA2MjMwYzNkOWJkMWE2YTk2NjJkMDIzODBkNzMzNjVhIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjgzZTZiMjAyMGEwMzRlOWE3YWQ0YTcyZmVlYTU5ZTFhZDUy
ZjE2MmUwOWNiZDI2NzM1YTNmZmI5ODM1OWZjNGYiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAx
LUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNoIgotLSAKMi40Ny4xCgo=

--===============1866187059248296169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11330424 to 11130992 (-2%)
packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3530000.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3530100.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 729499 to 729491 (-0%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.0", added "/usr/lib/libsqlite3.so.3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 7015048 to 7017432 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.53.0", added "/usr/lib/.debug/libsqlite3.so.3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11360261 to 11362216 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.53.0 -> /usr/src/debug/sqlite3/3.53.1
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.1
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.1

--===============1866187059248296169==--

