Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE047F43857
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19743.1776261880454230442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Diy8dO5G;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e4OjQRyQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917597e3-c345af46-52e3-4a81-9179-662a3a6ddbbd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mwcsphXLm0uGEHvkD4eClMta5CSovgj7WCbwK4gGbo4=;
	b=Diy8dO5GTMYrZGSUEiutcz0UKhBYNYEaNZq5J0IQy19A4dXQEC0i7LsTn0Qc31ds
	Kd3OldXVfLbct9ZucNAaiuvPqgli53fazNu+JGafpK/31dKtC/hlirJ30jznOQF89Hc
	KpKVu0bolq/6DOZW7YNLlZ0+YNA2kHkxMbuP4TyQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mwcsphXLm0uGEHvkD4eClMta5CSovgj7WCbwK4gGbo4=;
	b=e4OjQRyQlhKaWEs9Jcshano7O1A42CozCVjw+8SM7dF32e3Bf8+ds9znRJp/A3Au
	MIMtcWLz331m3ORsqpXriVM8pdcNE6w6MmRzZ/E9g1TNRptg8gKsCUUNPn528tA6li5
	DMISj+Fv5QzpnC781V55pVNgMHH3sMFbFYQU2gf4=
Content-Type: multipart/mixed; boundary="===============0734785538982363635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.53.0 SUCCEEDED
Message-ID: <0101019d917597e3-c345af46-52e3-4a81-9179-662a3a6ddbbd-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235304

--===============0734785538982363635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.53.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.51.3-3.53.0.patch
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
From 441fcd423b33aa0ca58c70b4ce23369406ca29e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 14:01:33 +0000
Subject: [PATCH] sqlite3: upgrade 3.51.3 -> 3.53.0

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch    | 6 +++---
 .../sqlite/{sqlite3_3.51.3.bb => sqlite3_3.53.0.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.51.3.bb => sqlite3_3.53.0.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 77181fe4df..7454ab5932 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
+From 44ea438288a83aab70f85ca59348658383777b0f Mon Sep 17 00:00:00 2001
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
  
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.51.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.0.bb
index ea583e4a42..21295bf437 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
@@ -4,6 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a"
+SRC_URI[sha256sum] = "851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.47.1


--===============0734785538982363635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.51.3", added "/usr/lib/libsqlite3.so.3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGSIZE changed from 364384 to 413536 (+13%)
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so.3.51.3 moved to /usr/lib/libsqlite3.so.3.53.0
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was removed
  /usr/share/re2c/stdlib/unicode_properties.re was removed
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so.3.51.3 moved to /usr/lib/libsqlite3.so.3.53.0

--===============0734785538982363635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.51.3-3.53.0.patch"

RnJvbSA0NDFmY2Q0MjNiMzNhYTBjYTU4YzcwYjRjZTIzMzY5NDA2Y2EyOWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTQ6MDE6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTEuMyAtPiAzLjUzLjAKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjUxLjMuYmIgPT4gc3FsaXRlM18zLjUzLjAuYmJ9ICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUve3NxbGl0ZTNfMy41MS4zLmJiID0+
IHNxbGl0ZTNfMy41My4wLmJifSAoNzQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8t
ZGlzYWJsZS16bGliLnBhdGNoCmluZGV4IDc3MTgxZmU0ZGYuLjc0NTRhYjU5MzIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10
by1kaXNhYmxlLXpsaWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3Nx
bGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZjk4YTczOTAzMmRkODYzYmE4ZGQzMTU3MjlkZWQ3YWQwYzg2NDczYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDRlYTQzODI4OGE4M2FhYjcwZjg1Y2E1OTM0ODY1ODM4
Mzc3N2IwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIE1hcmtvIDxwZXRl
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
L3NxbGl0ZTNfMy41MS4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNf
My41My4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTEuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My4wLmJiCmluZGV4IGVhNTgzZTRhNDIuLjIxMjk1YmY0
MzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTEu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjAuYmIK
QEAgLTQsNiArNCw2IEBAIExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9zcWxpdGUzLmg7ZW5kbGluZT0xMTttZDU9Nzg2ZDNkYzU4MWVmZjAzZjRmZDllNGE3N2VkMDBj
NjYiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5zcWxpdGUub3JnLzIwMjYvc3FsaXRlLWF1dG9j
b25mLSR7U1FMSVRFX1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODFmNWJlMzk3
MDQ5YjBjYWUxYjE2N2YyMjI1YWY3NjQ2ZmMwZjgyZTRhOWIzYzQ4YzllYTNhNTMzZTIxZDc3YSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NTFlOWIzODE5MmZlMmNlYWE2NWUwYmFhNjY1ZTdmYTA2
MjMwYzNkOWJkMWE2YTk2NjJkMDIzODBkNzMzNjVhIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAw
MS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaCIKLS0gCjIuNDcuMQoK

--===============0734785538982363635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3510300.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3530000.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 710687 to 729499 (+3%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.51.3", added "/usr/lib/libsqlite3.so.3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGSIZE changed from 1524780 to 1537484 (+1%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.51.3", added "/usr/lib/.debug/libsqlite3.so.3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 6639952 to 6776432 (+2%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.51.3 -> /usr/src/debug/sqlite3/3.53.0
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11130391 to 11360261 (+2%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.51.3" to "3.53.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.51.3 [default] to 3.53.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGSIZE changed from 364384 to 413536 (+13%)
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so.3.51.3 moved to /usr/lib/libsqlite3.so.3.53.0
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was removed
  /usr/share/re2c/stdlib/unicode_properties.re was removed
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.51.3 to libsqlite3.so.3.53.0
  /usr/lib/libsqlite3.so.3.51.3 moved to /usr/lib/libsqlite3.so.3.53.0

--===============0734785538982363635==--

