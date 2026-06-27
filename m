Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0224AC44502
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50708.1782540478697227167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U6EQ41Wu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xOJ0qNiS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f07b125bd-167751aa-b2ab-41a5-813b-459f4e5b6d0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540478;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Ud0CH4WLN/Nu3YRcSnjIuPdQg6bOv6Wk7spXLLZVnp0=;
	b=U6EQ41Wudw0Boh97j5bJ4Bo3Av+Yq8l2GAqBC6qh4Kt3kBSDHd8IcYa12bmiI2sL
	X92o6mVqmOyEWtZm0wUvAlKyRRTjDGIBSCwYEvRhDOb6I02gYCmULZYTpjvfcZW8svi
	V8Zry2+riJwoklxL9md//TjNH3L54TkkrttLHZ8w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540478;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Ud0CH4WLN/Nu3YRcSnjIuPdQg6bOv6Wk7spXLLZVnp0=;
	b=xOJ0qNiSaVhFtpijcNPz8S4qh4B8qkvMB1/YDZQ5txjpndWVQwMY6QqPuttYRrVv
	hn6kNCj8eJri5sRFpVq49VU7FdI0zi+YwRx4AbiOOaRAXb5Pw+q+wlOYKW3QEu+sT4N
	y9xDGhhe32Jj8/xKjCbS2J0NW/WauJZTEk+WRZ7Q=
Content-Type: multipart/mixed; boundary="===============7898027151942261761=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.53.3 SUCCEEDED
Message-ID: <0101019f07b125bd-167751aa-b2ab-41a5-813b-459f4e5b6d0e-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239681

--===============7898027151942261761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.53.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.53.2-3.53.3.patch
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
From e24e51a0d198f46ba1e841eb669681e1b4bc9720 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 27 Jun 2026 06:07:48 +0000
Subject: [PATCH] sqlite3: upgrade 3.53.2 -> 3.53.3

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch        | 2 +-
 .../sqlite/{sqlite3_3.53.2.bb => sqlite3_3.53.3.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.2.bb => sqlite3_3.53.3.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index b4231438cc..dc49a3731f 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From a324ff380e6e83141f37cbee7b89e87282deb349 Mon Sep 17 00:00:00 2001
+From 7c6c5749f809eb3fd50fbaabb4ca6379968b3c5e Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.2.bb b/meta/recipes-support/sqlite/sqlite3_3.53.3.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.53.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.3.bb
index 38045f1604..655f3a2b96 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.3.bb
@@ -4,6 +4,6 @@ LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316"
+SRC_URI[sha256sum] = "c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.47.1


--===============7898027151942261761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2026/sqlite-autoconf-3530200.tar.gz file://0001-Add-option-to-disable-zlib.patch" to "http://www.sqlite.org/2026/sqlite-autoconf-3530300.tar.gz file://0001-Add-option-to-disable-zlib.patch"
packages/x86-64-v3-poky-linux/sqlite3: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 730169 to 730282 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.2", added "/usr/lib/libsqlite3.so.3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 7024072 to 7026632 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-dbg: FILELIST: removed "/usr/lib/.debug/libsqlite3.so.3.53.2", added "/usr/lib/.debug/libsqlite3.so.3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 11380400 to 11389768 (+0%)
packages/x86-64-v3-poky-linux/sqlite3/sqlite3-src: FILELIST: directory renamed /usr/src/debug/sqlite3/3.53.2 -> /usr/src/debug/sqlite3/3.53.3
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PV changed from "3.53.2" to "3.53.3"
packages/x86-64-v3-poky-linux/sqlite3/sqlite3: PKGV changed from 3.53.2 [default] to 3.53.3 [default]
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so.3.53.2 moved to /usr/lib/libsqlite3.so.3.53.3
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so.3.53.2 moved to /usr/lib/libsqlite3.so.3.53.3

--===============7898027151942261761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/sqlite3/libsqlite3: FILELIST: removed "/usr/lib/libsqlite3.so.3.53.2", added "/usr/lib/libsqlite3.so.3.53.3"
Changes to packages/x86-64-v3-poky-linux/sqlite3 (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so.3.53.2 moved to /usr/lib/libsqlite3.so.3.53.3
Changes to packages/x86_64-linux/sqlite3-native (sysroot):
  /usr/lib/libsqlite3.so.0 changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so changed symlink target from libsqlite3.so.3.53.2 to libsqlite3.so.3.53.3
  /usr/lib/libsqlite3.so.3.53.2 moved to /usr/lib/libsqlite3.so.3.53.3

--===============7898027151942261761==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.53.2-3.53.3.patch"

RnJvbSBlMjRlNTFhMGQxOThmNDZiYTFlODQxZWI2Njk2ODFlMWI0YmM5NzIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjcgSnVuIDIwMjYgMDY6MDc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTMuMiAtPiAzLjUzLjMKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggICAgICAgIHwgMiArLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjUzLjIuYmIgPT4gc3FsaXRlM18zLjUzLjMuYmJ9ICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNTMuMi5i
YiA9PiBzcWxpdGUzXzMuNTMuMy5iYn0gKDc0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9u
LXRvLWRpc2FibGUtemxpYi5wYXRjaAppbmRleCBiNDIzMTQzOGNjLi5kYzQ5YTM3MzFmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy8wMDAxLUFkZC1vcHRp
b24tdG8tZGlzYWJsZS16bGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0
ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGEzMjRmZjM4MGU2ZTgzMTQxZjM3Y2JlZTdiODllODcyODJkZWIzNDkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdjNmM1NzQ5ZjgwOWViM2ZkNTBmYmFhYmI0Y2E2
Mzc5OTY4YjNjNWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQZXRlciBNYXJrbyA8
cGV0ZXIubWFya29Ac2llbWVucy5jb20+CiBEYXRlOiBTdW4sIDEyIE9jdCAyMDI1IDIzOjMyOjQ2
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBvcHRpb24gdG8gZGlzYWJsZSB6bGliCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjIuYmIgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUzLjMuYmIKc2ltaWxhcml0eSBp
bmRleCA3NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNf
My41My4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18z
LjUzLjMuYmIKaW5kZXggMzgwNDVmMTYwNC4uNjU1ZjNhMmI5NiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41My4yLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTMuMy5iYgpAQCAtNCw2ICs0LDYgQEAgTElDRU5T
RSA9ICJibGVzc2luZyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NxbGl0ZTMuaDtlbmRs
aW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIKIAogU1JDX1VSSSA9
ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNi9zcWxpdGUtYXV0b2NvbmYtJHtTUUxJVEVfUFZ9
LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ODhhZDUxOTQ5NDE5YTU2ZWJlODFmZTU2
MTkzZDUxMGM1NTllYjk0YzlhNTc3NDgzODc4NjBiNWQzMDY5MzE2IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImM5MTdkN2RiMTY2NDhlYzk1ZjcxNDk3NGFjZTVlNWRjZjQ2YjdkYzcwZTI2NjAwYTBh
MTAyYTMxNDExMjVkYjAiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1vcHRpb24tdG8t
ZGlzYWJsZS16bGliLnBhdGNoIgotLSAKMi40Ny4xCgo=

--===============7898027151942261761==--

