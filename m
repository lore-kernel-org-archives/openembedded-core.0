Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83520C53219
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 05:53:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34891.1784958788272512404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 22:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rfUXIbkn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZPxFHUQS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f97d5aa58-bfde08d9-4036-4cf0-b72c-698c0f5d0f9b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784958790;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=e095RmRVRB09aD2Dr4XmVLHfFiT+9DoPWRkIGlKW6+o=;
	b=rfUXIbkn9QEl//nLHeQLNRQmbT93rPxwRoXZguqgTZcNPz2CRRZt1D/ka6Ck7LuL
	EedtwudWPAVA2L/34s50aHbmVP51K7UmHZW1WBspNr9WZKspRAFZQpNYgandPjpk4hc
	6a56hazuxc5gmQ4ig/rxz57O5NmOHBT2DNCnkQu4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784958790;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=e095RmRVRB09aD2Dr4XmVLHfFiT+9DoPWRkIGlKW6+o=;
	b=ZPxFHUQStyYku0Hrv1Co06u6SDcmyiB8PGAlZgoebKVRKlG6HQqp11N9nv3fi6h3
	kilUlla6qdk2GcoTk6hKWwaZ1J/7l3H84w3v3qNM76IfL6vu0IuGtm8M1RzQu3FEpkV
	V7gOkEQ/gNvdBrzXKvX9Mxnk4e2CoIHnYPwrA108=
Content-Type: multipart/mixed; boundary="===============7472610701088845659=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.53.4 SUCCEEDED
Message-ID: <0101019f97d5aa58-bfde08d9-4036-4cf0-b72c-698c0f5d0f9b-000000@us-west-2.amazonses.com>
Date: Sat, 25 Jul 2026 05:53:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 05:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241961

--===============7472610701088845659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.53.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.53.3-3.53.4.patch
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
From 9cdb3b4a40d0244914e798e090d3e9dde9be655f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 25 Jul 2026 05:53:03 +0000
Subject: [PATCH] sqlite3: upgrade 3.53.3 -> 3.53.4

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch        | 2 +-
 .../sqlite/{sqlite3_3.53.3.bb => sqlite3_3.53.4.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.3.bb => sqlite3_3.53.4.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index dc49a3731f..f1308c0dae 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From 7c6c5749f809eb3fd50fbaabb4ca6379968b3c5e Mon Sep 17 00:00:00 2001
+From 8a2c91662b677e7fc3c9129c1b29d5bc903fcb1e Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.3.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.53.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 655f3a2b96..66132158e0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -4,6 +4,6 @@ LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0"
+SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.47.1


--===============7472610701088845659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3530300.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3530400.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.3", added "/usr/lib/libsqlite3.so.3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 7026632 to 7027488 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.53.3", added "/usr/lib/.debug/libsqlite3.so.3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11389768 to 11392094 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.53.3 -> /usr/src/debug/sqlite3/3.53.4
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.53.3" to "3.53.4"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.53.3 [default] to 3.53.4 [default]
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so.3.53.3 moved to /usr/lib/libsqlite3.so.3.53.4
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so.3.53.3 moved to /usr/lib/libsqlite3.so.3.53.4

--===============7472610701088845659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.3", added "/usr/lib/libsqlite3.so.3.53.4"
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so.3.53.3 moved to /usr/lib/libsqlite3.so.3.53.4
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.3 to libsqlite3.so.3.53.4
  /usr/lib/libsqlite3.so.3.53.3 moved to /usr/lib/libsqlite3.so.3.53.4

--===============7472610701088845659==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.53.3-3.53.4.patch"

RnJvbSA5Y2RiM2I0YTQwZDAyNDQ5MTRlNzk4ZTA5MGQzZTlkZGU5YmU2NTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjUgSnVsIDIwMjYgMDU6NTM6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTMuMyAtPiAzLjUzLjQKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggICAgICAgIHwgMiArLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjUzLjMuYmIgPT4gc3FsaXRlM18zLjUzLjQuYmJ9ICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNTMuMy5i
YiA9PiBzcWxpdGUzXzMuNTMuNC5iYn0gKDc0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9u
LXRvLWRpc2FibGUtemxpYi5wYXRjaAppbmRleCBkYzQ5YTM3MzFmLi5mMTMwOGMwZGFlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRp
b24tdG8tZGlzYWJsZS16bGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0
ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDdjNmM1NzQ5ZjgwOWViM2ZkNTBmYmFhYmI0Y2E2Mzc5OTY4YjNjNWUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhhMmM5MTY2MmI2NzdlN2ZjM2M5MTI5YzFiMjlk
NWJjOTAzZmNiMWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQZXRlciBNYXJrbyA8
cGV0ZXIubWFya29Ac2llbWVucy5jb20+CiBEYXRlOiBTdW4sIDEyIE9jdCAyMDI1IDIzOjMyOjQ2
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBvcHRpb24gdG8gZGlzYWJsZSB6bGliCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjMuYmIgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjQuYmIKc2ltaWxhcml0eSBp
bmRleCA3NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNf
My41My4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18z
LjUzLjQuYmIKaW5kZXggNjU1ZjNhMmI5Ni4uNjYxMzIxNThlMCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTMuNC5iYgpAQCAtNCw2ICs0LDYgQEAgTElDRU5T
RSA9ICJibGVzc2luZyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NxbGl0ZTMuaDtlbmRs
aW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIKIAogU1JDX1VSSSA9
ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNi9zcWxpdGUtYXV0b2NvbmYtJHtTUUxJVEVfUFZ9
LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjOTE3ZDdkYjE2NjQ4ZWM5NWY3MTQ5NzRh
Y2U1ZTVkY2Y0NmI3ZGM3MGUyNjYwMGEwYTEwMmEzMTQxMTI1ZGIwIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjBlOTQ4MzkwMGU5MmNkNWRlOGZkNDhkMTZiZjkyMDAxNDVhNjFmN2ZkNWJlNTQyYTVh
YzgxZDhhOTUxNmViOWMiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1vcHRpb24tdG8t
ZGlzYWJsZS16bGliLnBhdGNoIgotLSAKMi40Ny4xCgo=

--===============7472610701088845659==--

