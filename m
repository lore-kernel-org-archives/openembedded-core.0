Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F29CCD98D5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50621.1781195513928724445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XDEE70VV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l6pFqhvI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb786cbe8-d68675d2-6c73-4e01-af43-bf08153d4b9c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lvUyKm9QxHMkdVVWfm72f1PbZp/Dd7ck/eBLhlDi4hM=;
	b=XDEE70VVQvPVVCFiJ3glrnDBTGtup+aM9PgZ+1pr31sBNVbzJ7OikD31u11VnUTd
	G1TI5Q2zvovC9BD1/g5RAqBsdI6L8zavzKgG+meNFLXyr/Lve4QDCzHd9HRG64FxobI
	o4CyJAMy+rXwBehyUMYvkGPnI24pzyMrYfdVup4g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lvUyKm9QxHMkdVVWfm72f1PbZp/Dd7ck/eBLhlDi4hM=;
	b=l6pFqhvIgwAwNIKxuQ9xRYb9K2VtrZhNV8PVacCVnTxAMj0j06fQ2beG/BkPdfoY
	MC1NVoBEO/PLR+qEAg0clAS9UmwkCKZnP3a0hE27RV5MLMD1NtjWxtKYTgSiq+C8iEA
	puimrDRsETgOADzJfHXzdKQMkZ9Ehg+ekkFtFStQ=
Content-Type: multipart/mixed; boundary="===============6265212829723944772=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.53.2 SUCCEEDED
Message-ID: <0101019eb786cbe8-d68675d2-6c73-4e01-af43-bf08153d4b9c-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238580

--===============6265212829723944772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.53.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.53.0-3.53.2.patch
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
From 216745baa75edc380dc5df289b4729ecd63d2898 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 16:21:46 +0000
Subject: [PATCH] sqlite3: upgrade 3.53.0 -> 3.53.2

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch    | 6 +++---
 .../sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.2.bb}         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.0.bb => sqlite3_3.53.2.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 77181fe4df..b4231438cc 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
+From a324ff380e6e83141f37cbee7b89e87282deb349 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
@@ -29,7 +29,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index 85fe414382..77190a7053 100644
+index fa36dfb..a78ba8b 100644
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
  
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb b/meta/recipes-support/sqlite/sqlite3_3.53.2.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.53.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.2.bb
index 75e08e58b1..38045f1604 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.2.bb
@@ -4,6 +4,6 @@ LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a"
+SRC_URI[sha256sum] = "588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.47.1


--===============6265212829723944772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3530000.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3530200.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.53.0" to "3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 729499 to 730169 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.53.0" to "3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.53.0" to "3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.53.0" to "3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.0", added "/usr/lib/libsqlite3.so.3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGSIZE changed from 1594828 to 1598924 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.53.0" to "3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.53.0", added "/usr/lib/.debug/libsqlite3.so.3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 7015048 to 7024064 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.53.0" to "3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.53.0 -> /usr/src/debug/sqlite3/3.53.2
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11360261 to 11380400 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.53.0" to "3.53.2"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.53.0 [default] to 3.53.2 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.53.0" to "3.53.2"
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.2
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.2

--===============6265212829723944772==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.53.0-3.53.2.patch"

RnJvbSAyMTY3NDViYWE3NWVkYzM4MGRjNWRmMjg5YjQ3MjllY2Q2M2QyODk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTY6MjE6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTMuMCAtPiAzLjUzLjIKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjUzLjAuYmIgPT4gc3FsaXRlM18zLjUzLjIuYmJ9ICAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUve3NxbGl0ZTNfMy41My4wLmJiID0+
IHNxbGl0ZTNfMy41My4yLmJifSAoNzQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8t
ZGlzYWJsZS16bGliLnBhdGNoCmluZGV4IDc3MTgxZmU0ZGYuLmI0MjMxNDM4Y2MgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10
by1kaXNhYmxlLXpsaWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3Nx
bGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZjk4YTczOTAzMmRkODYzYmE4ZGQzMTU3MjlkZWQ3YWQwYzg2NDczYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTMyNGZmMzgwZTZlODMxNDFmMzdjYmVlN2I4OWU4NzI4
MmRlYjM0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIE1hcmtvIDxwZXRl
ci5tYXJrb0BzaWVtZW5zLmNvbT4KIERhdGU6IFN1biwgMTIgT2N0IDIwMjUgMjM6MzI6NDYgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIG9wdGlvbiB0byBkaXNhYmxlIHpsaWIKQEAgLTI5LDcg
KzI5LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1zcGVjaWZpY10KICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wgYi9hdXRvc2V0dXAvc3FsaXRlLWNvbmZp
Zy50Y2wKLWluZGV4IDg1ZmU0MTQzODIuLjc3MTkwYTcwNTMgMTAwNjQ0CitpbmRleCBmYTM2ZGZi
Li5hNzhiYThiIDEwMDY0NAogLS0tIGEvYXV0b3NldHVwL3NxbGl0ZS1jb25maWcudGNsCiArKysg
Yi9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wKIEBAIC0yODcsNiArMjg3LDE0IEBAIHByb2Mg
c3FsaXRlLWNvbmZpZ3VyZSB7YnVpbGRNb2RlIGNvbmZpZ1NjcmlwdH0gewpAQCAtNDcsNyArNDcs
NyBAQCBpbmRleCA4NWZlNDE0MzgyLi43NzE5MGE3MDUzIDEwMDY0NAogICAgICAjIE9wdGlvbnMg
Zm9yIElDVTogSW50ZXJuYXRpb25hbCBDb21wb25lbnRzIGZvciBVbmljb2RlCiAgICAgIGljdSB7
CiAgICAgICAgeyp9IHsKLUBAIC02NTYsNyArNjY0LDcgQEAgcHJvYyBzcWxpdGUtY2hlY2stY29t
bW9uLXN5c3RlbS1kZXBzIHt9IHsKK0BAIC02NzQsNyArNjgyLDcgQEAgcHJvYyBzcWxpdGUtY2hl
Y2stY29tbW9uLXN5c3RlbS1kZXBzIHt9IHsKICAgICAgc3RyaW5nLmggc3RyaW5ncy5oIFwKICAg
ICAgaW50dHlwZXMuaAogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRl
L3NxbGl0ZTNfMy41My4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNf
My41My4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNzQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My4yLmJiCmluZGV4IDc1ZTA4ZTU4YjEuLjM4MDQ1ZjE2
MDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTMu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjIuYmIK
QEAgLTQsNiArNCw2IEBAIExJQ0VOU0UgPSAiYmxlc3NpbmciCiBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9zcWxpdGUzLmg7ZW5kbGluZT0xMTttZDU9Nzg2ZDNkYzU4MWVmZjAzZjRmZDllNGE3
N2VkMDBjNjYiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5zcWxpdGUub3JnLzIwMjYvc3FsaXRl
LWF1dG9jb25mLSR7U1FMSVRFX1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODUx
ZTliMzgxOTJmZTJjZWFhNjVlMGJhYTY2NWU3ZmEwNjIzMGMzZDliZDFhNmE5NjYyZDAyMzgwZDcz
MzY1YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1ODhhZDUxOTQ5NDE5YTU2ZWJlODFmZTU2MTkz
ZDUxMGM1NTllYjk0YzlhNTc3NDgzODc4NjBiNWQzMDY5MzE2IgogCiBTUkNfVVJJICs9ICJmaWxl
Oi8vMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRjaCIKLS0gCjIuNDcuMQoK

--===============6265212829723944772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.0", added "/usr/lib/libsqlite3.so.3.53.2"
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.2
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.0 to libsqlite3.so.3.53.2
  /usr/lib/libsqlite3.so.3.53.0 moved to /usr/lib/libsqlite3.so.3.53.2

--===============6265212829723944772==--

