Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A60CA9EC9
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 05:38:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4313.1791610676578040710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 22:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d3iwIKCC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hZRxm+kp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1245160d3-2ae2a9da-04b3-4768-b739-386a6260fcf7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791610675;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=t7MqW3gPTyblx0UGG38r7KMFdO7MHJoXzIL587Ba08c=;
	b=d3iwIKCCIwaJo1KDXjc7FWlH6963r0cHv1Fv4gMfa6Iw62MlpdAfDDUVl8B4mdOw
	NTLsXPg3sXxRyKzJbd6T71AcxduNR9rJyYs7ftlJszNqTzXO05TePR8PQ0N1VcoccWq
	9rIY7hSzZw8rz8OEZYyHETU+wSPhNkGicMzcHjW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791610675;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=t7MqW3gPTyblx0UGG38r7KMFdO7MHJoXzIL587Ba08c=;
	b=hZRxm+kphrHkg7r11dLJI74jL9o/zrvhayXkrf8Dr9EawyZnpEns+QKOmQrMg+Xu
	WaR2qO8GMbHm18T0k9q6y49k6yZo9JuP6n8LO6qT2iwxAdYlvzYuJ0xYtOJqC0DWvWG
	b69kcIslJcbP8gEC0oVpxquufd4X7D3lm3dr649o=
Content-Type: multipart/mixed; boundary="===============7312235932924936514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.54.0 SUCCEEDED
Message-ID: <010101a1245160d3-2ae2a9da-04b3-4768-b739-386a6260fcf7-000000@us-west-2.amazonses.com>
Date: Sat, 10 Oct 2026 05:37:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 05:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247492

--===============7312235932924936514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.54.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.53.4-3.54.0.patch
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
From 7b40d206dc3107d0dc2dcdea61aa86902855c49f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 10 Oct 2026 05:37:48 +0000
Subject: [PATCH] sqlite3: upgrade 3.53.4 -> 3.54.0

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch  | 8 ++++----
 .../sqlite/{sqlite3_3.53.4.bb => sqlite3_3.54.0.bb}       | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.4.bb => sqlite3_3.54.0.bb} (97%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index dc49a3731f..1aba204f6c 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From 7c6c5749f809eb3fd50fbaabb4ca6379968b3c5e Mon Sep 17 00:00:00 2001
+From 0e78981daf571069e1361592919a1140e895816c Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
@@ -29,10 +29,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index fa36dfb..a78ba8b 100644
+index 17c1315..940171c 100644
 --- a/autosetup/sqlite-config.tcl
 +++ b/autosetup/sqlite-config.tcl
-@@ -287,6 +287,14 @@ proc sqlite-configure {buildMode configScript} {
+@@ -292,6 +292,14 @@ proc sqlite-configure {buildMode configScript} {
        }
      }
  
@@ -47,7 +47,7 @@ index fa36dfb..a78ba8b 100644
      # Options for ICU: International Components for Unicode
      icu {
        {*} {
-@@ -674,7 +682,7 @@ proc sqlite-check-common-system-deps {} {
+@@ -679,7 +687,7 @@ proc sqlite-check-common-system-deps {} {
      string.h strings.h \
      inttypes.h
  
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.54.0.bb
similarity index 97%
rename from meta/recipes-support/sqlite/sqlite3_3.53.4.bb
rename to meta/recipes-support/sqlite/sqlite3_3.54.0.bb
index 137ec26207..5f15ed93c7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.54.0.bb
@@ -22,7 +22,7 @@ B = "${WORKDIR}/build"
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
 
-SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
+SRC_URI[sha256sum] = "134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
-- 
2.47.1


--===============7312235932924936514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3530400.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3540000.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 730282 to 735553 (+1%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.4", added "/usr/lib/libsqlite3.so.3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGSIZE changed from 1603020 to 1619308 (+1%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.53.4", added "/usr/lib/.debug/libsqlite3.so.3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 7033896 to 7193688 (+2%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.53.4 -> /usr/src/debug/sqlite3/3.54.0
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11392094 to 11546123 (+1%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.53.4" to "3.54.0"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.53.4 [default] to 3.54.0 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGSIZE changed from 421728 to 462688 (+10%)
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so.3.53.4 moved to /usr/lib/libsqlite3.so.3.54.0
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so.3.53.4 moved to /usr/lib/libsqlite3.so.3.54.0

--===============7312235932924936514==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.53.4-3.54.0.patch"

RnJvbSA3YjQwZDIwNmRjMzEwN2QwZGMyZGNkZWE2MWFhODY5MDI4NTVjNDlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTAgT2N0IDIwMjYgMDU6Mzc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTMuNCAtPiAzLjU0LjAKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggIHwgOCArKysrLS0tLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjUzLjQuYmIgPT4gc3FsaXRlM18zLjU0LjAuYmJ9ICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNTMuNC5iYiA9PiBz
cWxpdGUzXzMuNTQuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRvLWRp
c2FibGUtemxpYi5wYXRjaAppbmRleCBkYzQ5YTM3MzFmLi4xYWJhMjA0ZjZjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8t
ZGlzYWJsZS16bGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxp
dGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDdjNmM1NzQ5ZjgwOWViM2ZkNTBmYmFhYmI0Y2E2Mzc5OTY4YjNjNWUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDBlNzg5ODFkYWY1NzEwNjllMTM2MTU5MjkxOWExMTQwZTg5
NTgxNmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIu
bWFya29Ac2llbWVucy5jb20+CiBEYXRlOiBTdW4sIDEyIE9jdCAyMDI1IDIzOjMyOjQ2ICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBvcHRpb24gdG8gZGlzYWJsZSB6bGliCkBAIC0yOSwxMCAr
MjksMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1zcGVjaWZpY10KICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wgYi9hdXRvc2V0dXAvc3FsaXRlLWNvbmZp
Zy50Y2wKLWluZGV4IGZhMzZkZmIuLmE3OGJhOGIgMTAwNjQ0CitpbmRleCAxN2MxMzE1Li45NDAx
NzFjIDEwMDY0NAogLS0tIGEvYXV0b3NldHVwL3NxbGl0ZS1jb25maWcudGNsCiArKysgYi9hdXRv
c2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wKLUBAIC0yODcsNiArMjg3LDE0IEBAIHByb2Mgc3FsaXRl
LWNvbmZpZ3VyZSB7YnVpbGRNb2RlIGNvbmZpZ1NjcmlwdH0geworQEAgLTI5Miw2ICsyOTIsMTQg
QEAgcHJvYyBzcWxpdGUtY29uZmlndXJlIHtidWlsZE1vZGUgY29uZmlnU2NyaXB0fSB7CiAgICAg
ICAgfQogICAgICB9CiAgCkBAIC00Nyw3ICs0Nyw3IEBAIGluZGV4IGZhMzZkZmIuLmE3OGJhOGIg
MTAwNjQ0CiAgICAgICMgT3B0aW9ucyBmb3IgSUNVOiBJbnRlcm5hdGlvbmFsIENvbXBvbmVudHMg
Zm9yIFVuaWNvZGUKICAgICAgaWN1IHsKICAgICAgICB7Kn0gewotQEAgLTY3NCw3ICs2ODIsNyBA
QCBwcm9jIHNxbGl0ZS1jaGVjay1jb21tb24tc3lzdGVtLWRlcHMge30geworQEAgLTY3OSw3ICs2
ODcsNyBAQCBwcm9jIHNxbGl0ZS1jaGVjay1jb21tb24tc3lzdGVtLWRlcHMge30gewogICAgICBz
dHJpbmcuaCBzdHJpbmdzLmggXAogICAgICBpbnR0eXBlcy5oCiAgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjQuYmIgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjU0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My40LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjU0LjAuYmIKaW5k
ZXggMTM3ZWMyNjIwNy4uNWYxNWVkOTNjNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy41My40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Nx
bGl0ZS9zcWxpdGUzXzMuNTQuMC5iYgpAQCAtMjIsNyArMjIsNyBAQCBCID0gIiR7V09SS0RJUn0v
YnVpbGQiCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuc3FsaXRlLm9yZy8yMDI2L3NxbGl0ZS1hdXRv
Y29uZi0ke1NRTElURV9QVn0udGFyLmd6IgogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtQWRkLW9w
dGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwZTk0
ODM5MDBlOTJjZDVkZThmZDQ4ZDE2YmY5MjAwMTQ1YTYxZjdmZDViZTU0MmE1YWM4MWQ4YTk1MTZl
YjljIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEzNGVjMDgwMmRkYTU3OTU4MTZlMjVkMjU4NzJk
MjBiMzEyY2IzOTczNDM4YzQ5YjMwYmM0MGI3NzA1ZWE5ZWQiCiAKIFVQU1RSRUFNX0NIRUNLX1VS
SSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVs
ZWFzZWxvZy8oP1A8cHZlcj4oXGQrW1wuXC1fXSopKylcLmh0bWwiCi0tIAoyLjQ3LjEKCg==

--===============7312235932924936514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.4", added "/usr/lib/libsqlite3.so.3.54.0"
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so.3.53.4 moved to /usr/lib/libsqlite3.so.3.54.0
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.4 to libsqlite3.so.3.54.0
  /usr/lib/libsqlite3.so.3.53.4 moved to /usr/lib/libsqlite3.so.3.54.0

--===============7312235932924936514==--

