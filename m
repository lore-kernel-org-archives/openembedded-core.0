Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B249ECD4F4A
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34773.1778851244441245730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=utHEJ1mP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=y9YkEZzW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcbe77d-0d285ebf-c931-45da-a3d1-4a9130f54a5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851244;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0ulMCwjVBdAhkBC3ZOPFgFK70newK4Zq80BdN1nQLyA=;
	b=utHEJ1mPbwIFXbv6+Fu74sy7I8kseJH7sJ8JYsxI+dBg7Owyol6JMwtomzYckBnc
	2d22RBil46mCkIa1COGNxFrM+E3Xo0WdZ5AsISui7OcNFvcQWqBMEfYr6ZZN+uQ7O76
	ooeqBFtBStA2tptD+4tGTGXWxoiiqyVYY8FwN5Es=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851244;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0ulMCwjVBdAhkBC3ZOPFgFK70newK4Zq80BdN1nQLyA=;
	b=y9YkEZzWgVPmdaOnOt0wKZUOmFPe6vIVcZw/R+igW8yTBhr040MFD15cx4DbJNFq
	/Fo9jXd4JDrfsYZBu6gX3Dik2NRS22F21isVqs96A4FJcyyt6Mha52Fb/c3AMvL0vcL
	vbwy6j5+7wssrePqQWpVLDlvF7/s9thcB4/WIY6o=
Content-Type: multipart/mixed; boundary="===============0597688009470314451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.53.1 SUCCEEDED
Message-ID: <0101019e2bcbe77d-0d285ebf-c931-45da-a3d1-4a9130f54a5d-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237171

--===============0597688009470314451==
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
From 1e14ac6503b4c5c919e07628a4093c364e515c48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 13:13:49 +0000
Subject: [PATCH] sqlite3: upgrade 3.53.0 -> 3.53.1

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch    | 6 +++---
 .../sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.1.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.1.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 77181fe4df..0985145adb 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
+From e6afcc324bb55cb307690593c1e9e339385307d4 Mon Sep 17 00:00:00 2001
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


--===============0597688009470314451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9883625 to 9685472 (-2%)
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3530000.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3530100.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 729499 to 729491 (-0%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.0", added "/usr/lib/libsqlite3.so.3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.53.0", added "/usr/lib/.debug/libsqlite3.so.3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 6776440 to 6777416 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.53.0 -> /usr/src/debug/sqlite3/3.53.1
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11360261 to 11362216 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.53.0 [default] to 3.53.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.53.0" to "3.53.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGSIZE changed from 413536 to 409440 (-1%)
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.1
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.1
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.1

--===============0597688009470314451==
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

--===============0597688009470314451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.53.0-3.53.1.patch"

RnJvbSAxZTE0YWM2NTAzYjRjNWM5MTllMDc2MjhhNDA5M2MzNjRlNTE1YzQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTM6MTM6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTMuMCAtPiAzLjUzLjEKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjUzLjAuYmIgPT4gc3FsaXRlM18zLjUzLjEuYmJ9ICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUve3NxbGl0ZTNfMy41My4wLmJiID0+
IHNxbGl0ZTNfMy41My4xLmJifSAoNzQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8t
ZGlzYWJsZS16bGliLnBhdGNoCmluZGV4IDc3MTgxZmU0ZGYuLjA5ODUxNDVhZGIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10
by1kaXNhYmxlLXpsaWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3Nx
bGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZjk4YTczOTAzMmRkODYzYmE4ZGQzMTU3MjlkZWQ3YWQwYzg2NDczYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTZhZmNjMzI0YmI1NWNiMzA3NjkwNTkzYzFlOWUzMzkz
ODUzMDdkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIE1hcmtvIDxwZXRl
ci5tYXJrb0BzaWVtZW5zLmNvbT4KIERhdGU6IFN1biwgMTIgT2N0IDIwMjUgMjM6MzI6NDYgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIG9wdGlvbiB0byBkaXNhYmxlIHpsaWIKQEAgLTI5LDcg
KzI5LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1zcGVjaWZpY10KICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wgYi9hdXRvc2V0dXAvc3FsaXRlLWNvbmZp
Zy50Y2wKLWluZGV4IDg1ZmU0MTQzODIuLjc3MTkwYTcwNTMgMTAwNjQ0CitpbmRleCA1OWVjYjcx
Li4xNmQxZTYwIDEwMDY0NAogLS0tIGEvYXV0b3NldHVwL3NxbGl0ZS1jb25maWcudGNsCiArKysg
Yi9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wKIEBAIC0yODcsNiArMjg3LDE0IEBAIHByb2Mg
c3FsaXRlLWNvbmZpZ3VyZSB7YnVpbGRNb2RlIGNvbmZpZ1NjcmlwdH0gewpAQCAtNDcsNyArNDcs
NyBAQCBpbmRleCA4NWZlNDE0MzgyLi43NzE5MGE3MDUzIDEwMDY0NAogICAgICAjIE9wdGlvbnMg
Zm9yIElDVTogSW50ZXJuYXRpb25hbCBDb21wb25lbnRzIGZvciBVbmljb2RlCiAgICAgIGljdSB7
CiAgICAgICAgeyp9IHsKLUBAIC02NTYsNyArNjY0LDcgQEAgcHJvYyBzcWxpdGUtY2hlY2stY29t
bW9uLXN5c3RlbS1kZXBzIHt9IHsKK0BAIC02NzQsNyArNjgyLDcgQEAgcHJvYyBzcWxpdGUtY2hl
Y2stY29tbW9uLXN5c3RlbS1kZXBzIHt9IHsKICAgICAgc3RyaW5nLmggc3RyaW5ncy5oIFwKICAg
ICAgaW50dHlwZXMuaAogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRl
L3NxbGl0ZTNfMy41My4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNf
My41My4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNzQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My4xLmJiCmluZGV4IDIxMjk1YmY0MzcuLjExMjNhYzI0
ZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTMu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjEuYmIK
QEAgLTQsNiArNCw2IEBAIExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9zcWxpdGUzLmg7ZW5kbGluZT0xMTttZDU9Nzg2ZDNkYzU4MWVmZjAzZjRmZDllNGE3N2VkMDBj
NjYiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5zcWxpdGUub3JnLzIwMjYvc3FsaXRlLWF1dG9j
b25mLSR7U1FMSVRFX1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODUxZTliMzgx
OTJmZTJjZWFhNjVlMGJhYTY2NWU3ZmEwNjIzMGMzZDliZDFhNmE5NjYyZDAyMzgwZDczMzY1YSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4M2U2YjIwMjBhMDM0ZTlhN2FkNGE3MmZlZWE1OWUxYWQ1
MmYxNjJlMDljYmQyNjczNWEzZmZiOTgzNTlmYzRmIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAw
MS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaCIKLS0gCjIuNDcuMQoK

--===============0597688009470314451==--

