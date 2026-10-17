Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA3FCC6B2A
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 05:59:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1560.1792216785324092497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 22:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AAiKiG5E;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zeV7Cbdd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a14871dd87-157db5eb-36b1-487e-82ef-1660509060f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792216784;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=8THXOXuNTfXe2qqbrtFrqqj/HQpDSUpV9iP2DaMBZrw=;
	b=AAiKiG5EHlJvrN6IShWbWVxWf560UVvlM8fYzU6U5UZngmFM4m3mArD4wYmF3D0g
	imIiVy6DEJ2v1JOccqsgXhii+U95qnKrASeWlEJNyyvYQ2jKWIswpO0T4IGlrboO2sn
	VQOamCPpF3FUWH57zylOoMBoir69hmRgKhgxq7ms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792216784;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=8THXOXuNTfXe2qqbrtFrqqj/HQpDSUpV9iP2DaMBZrw=;
	b=zeV7Cbdd+jbD2WDpEUqfZf3yUTw51wvlKVoKES0r9HqvCueZHVonvVqLF378O1d0
	ITE5TFWRX9ULpwVyXp48KZqz1PORHq1wL9Egn+pFZiKTaoD2VWJvBmlpGyzLbwHbxGM
	3yhpvEK2YTOUA1XS/FOnO8amNZMh+tXk0XbOonxw=
Content-Type: multipart/mixed; boundary="===============0410338783658003458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.54.1 SUCCEEDED
Message-ID: <010101a14871dd87-157db5eb-36b1-487e-82ef-1660509060f5-000000@us-west-2.amazonses.com>
Date: Sat, 17 Oct 2026 05:59:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.17-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 05:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248073

--===============0410338783658003458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.54.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.54.0-3.54.1.patch
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
From 7f0b1527bb0e940d0e81784340d1762d4c76d1da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 17 Oct 2026 05:59:37 +0000
Subject: [PATCH] sqlite3: upgrade 3.54.0 -> 3.54.1

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch      | 4 ++--
 .../sqlite/{sqlite3_3.54.0.bb => sqlite3_3.54.1.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.54.0.bb => sqlite3_3.54.1.bb} (97%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 1aba204f6c..73e039b667 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From 0e78981daf571069e1361592919a1140e895816c Mon Sep 17 00:00:00 2001
+From 39938c36e321714eacdbaa9f6a95af5b2e82b80f Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
@@ -29,7 +29,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index 17c1315..940171c 100644
+index 9316e0c..957e14a 100644
 --- a/autosetup/sqlite-config.tcl
 +++ b/autosetup/sqlite-config.tcl
 @@ -292,6 +292,14 @@ proc sqlite-configure {buildMode configScript} {
diff --git a/meta/recipes-support/sqlite/sqlite3_3.54.0.bb b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
similarity index 97%
rename from meta/recipes-support/sqlite/sqlite3_3.54.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.54.1.bb
index 96c9d76558..681b8e1e20 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.54.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
@@ -22,7 +22,7 @@ B = "${WORKDIR}/build"
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
 
-SRC_URI[sha256sum] = "134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed"
+SRC_URI[sha256sum] = "926ef8d3eab93fbf6e06011901273eec076b25594a4e1cdadd50c987f4f6d64e"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
-- 
2.47.1


--===============0410338783658003458==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.54.0-3.54.1.patch"

RnJvbSA3ZjBiMTUyN2JiMGU5NDBkMGU4MTc4NDM0MGQxNzYyZDRjNzZkMWRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTcgT2N0IDIwMjYgMDU6NTk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTQuMCAtPiAzLjU0LjEKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggICAgICB8IDQgKystLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjU0LjAuYmIgPT4gc3FsaXRlM18zLjU0LjEuYmJ9ICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS97c3FsaXRlM18zLjU0LjAuYmIg
PT4gc3FsaXRlM18zLjU0LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10
by1kaXNhYmxlLXpsaWIucGF0Y2gKaW5kZXggMWFiYTIwNGY2Yy4uNzNlMDM5YjY2NyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9u
LXRvLWRpc2FibGUtemxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUv
c3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAwZTc4OTgxZGFmNTcxMDY5ZTEzNjE1OTI5MTlhMTE0MGU4OTU4MTZjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzOTkzOGMzNmUzMjE3MTRlYWNkYmFhOWY2YTk1YWY1
YjJlODJiODBmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgTWFya28gPHBl
dGVyLm1hcmtvQHNpZW1lbnMuY29tPgogRGF0ZTogU3VuLCAxMiBPY3QgMjAyNSAyMzozMjo0NiAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBBZGQgb3B0aW9uIHRvIGRpc2FibGUgemxpYgpAQCAtMjks
NyArMjksNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQog
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2F1dG9zZXR1cC9zcWxpdGUtY29uZmlnLnRjbCBiL2F1dG9zZXR1cC9zcWxpdGUtY29u
ZmlnLnRjbAotaW5kZXggMTdjMTMxNS4uOTQwMTcxYyAxMDA2NDQKK2luZGV4IDkzMTZlMGMuLjk1
N2UxNGEgMTAwNjQ0CiAtLS0gYS9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wKICsrKyBiL2F1
dG9zZXR1cC9zcWxpdGUtY29uZmlnLnRjbAogQEAgLTI5Miw2ICsyOTIsMTQgQEAgcHJvYyBzcWxp
dGUtY29uZmlndXJlIHtidWlsZE1vZGUgY29uZmlnU2NyaXB0fSB7CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjU0LjAuYmIgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjU0LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41NC4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjU0LjEuYmIKaW5k
ZXggOTZjOWQ3NjU1OC4uNjgxYjhlMWUyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy41NC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Nx
bGl0ZS9zcWxpdGUzXzMuNTQuMS5iYgpAQCAtMjIsNyArMjIsNyBAQCBCID0gIiR7V09SS0RJUn0v
YnVpbGQiCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuc3FsaXRlLm9yZy8yMDI2L3NxbGl0ZS1hdXRv
Y29uZi0ke1NRTElURV9QVn0udGFyLmd6IgogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtQWRkLW9w
dGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMzRl
YzA4MDJkZGE1Nzk1ODE2ZTI1ZDI1ODcyZDIwYjMxMmNiMzk3MzQzOGM0OWIzMGJjNDBiNzcwNWVh
OWVkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkyNmVmOGQzZWFiOTNmYmY2ZTA2MDExOTAxMjcz
ZWVjMDc2YjI1NTk0YTRlMWNkYWRkNTBjOTg3ZjRmNmQ2NGUiCiAKIFVQU1RSRUFNX0NIRUNLX1VS
SSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVs
ZWFzZWxvZy8oP1A8cHZlcj4oXGQrW1wuXC1fXSopKylcLmh0bWwiCi0tIAoyLjQ3LjEKCg==

--===============0410338783658003458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.54.0", added "/usr/lib/libsqlite3.so.3.54.1"
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so.3.54.0 moved to /usr/lib/libsqlite3.so.3.54.1
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so.3.54.0 moved to /usr/lib/libsqlite3.so.3.54.1

--===============0410338783658003458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3540000.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3540100.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 735553 to 735545 (-0%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.54.0", added "/usr/lib/libsqlite3.so.3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 7193688 to 7195216 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.54.0", added "/usr/lib/.debug/libsqlite3.so.3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11546123 to 11548873 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.54.0 -> /usr/src/debug/sqlite3/3.54.1
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.54.0" to "3.54.1"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.54.0 [default] to 3.54.1 [default]
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so.3.54.0 moved to /usr/lib/libsqlite3.so.3.54.1
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.54.0 to libsqlite3.so.3.54.1
  /usr/lib/libsqlite3.so.3.54.0 moved to /usr/lib/libsqlite3.so.3.54.1

--===============0410338783658003458==--

