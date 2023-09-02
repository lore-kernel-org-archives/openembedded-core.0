Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80970CA0FFA
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5671.1693650552758403265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MyBwGHvc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C3xL0HkK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a55708478-5b662143-f296-4254-95bd-4ceece37c6c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HVoO8v9OBvwYTHEN63ICMGXijFKbWfU1UTaa9yt0n4s=;
	b=MyBwGHvcnEzy5hHtqPKCSB97PIn5kDU5yxL0ovcQa7ASHDeXN3YtpyHlfaLBOm6s
	tIISuBasVBOdO6BMmWR+iLT8VZpCt03bfVTxzYc4DPeDc6MEXwCt/BhsbHK21GT6iNS
	HkGD60+sRq7u2YzE1IGMK2dwMuqVA0yluKkOHApM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HVoO8v9OBvwYTHEN63ICMGXijFKbWfU1UTaa9yt0n4s=;
	b=C3xL0HkKWOk6qTBzYE/6S691xWZ7KURVloKfedahN7UOivYIibiOAW4VTnndwJm7
	X7yrf159JdFQgLx4tKnF1TzMsR/eebrqHbj/uU2UoMf3X/1TiSsG8ikg+A2MtBoC7Pc
	jItSz7LloVb8NL/Z4BuyzQcJb08fovs3jQBfl30o=
Content-Type: multipart/mixed; boundary="===============2334092295814243694=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zlib: upgrading to 1.3 SUCCEEDED
Message-ID: <0101018a55708478-5b662143-f296-4254-95bd-4ceece37c6c9-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187045

--===============2334092295814243694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zlib* to *1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-zlib-upgrade-1.2.13-1.3.patch
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
From 63883745c29eb2b1be263a4fb70161b3ac9fc838 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 11:08:28 +0000
Subject: [PATCH] zlib: upgrade 1.2.13 -> 1.3

---
 meta/recipes-core/zlib/{zlib_1.2.13.bb => zlib_1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/zlib/{zlib_1.2.13.bb => zlib_1.3.bb} (93%)

diff --git a/meta/recipes-core/zlib/zlib_1.2.13.bb b/meta/recipes-core/zlib/zlib_1.3.bb
similarity index 93%
rename from meta/recipes-core/zlib/zlib_1.2.13.bb
rename to meta/recipes-core/zlib/zlib_1.3.bb
index ec977a3035..c8fd855ee6 100644
--- a/meta/recipes-core/zlib/zlib_1.2.13.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://zlib.net/${BP}.tar.gz \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30"
+SRC_URI[sha256sum] = "ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
-- 
2.39.2


--===============2334092295814243694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/zlib: SRC_URI changed from "https://zlib.net/zlib-1.2.13.tar.gz file://0001-configure-Pass-LDFLAGS-to-link-tests.patch file://run-ptest" to "https://zlib.net/zlib-1.3.tar.gz file://0001-configure-Pass-LDFLAGS-to-link-tests.patch file://run-ptest"
packages/core2-32-poky-linux/zlib: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib: PKGV changed from 1.2.13 [default] to 1.3 [default]
Changes to packages/core2-32-poky-linux/zlib (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so.1.3 was added
  /usr/lib/libz.so.1.2.13 was removed
packages/core2-32-poky-linux/zlib/zlib-dbg: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib-dbg: FILELIST: removed "/usr/lib/.debug/libz.so.1.2.13", added "/usr/lib/.debug/libz.so.1.3"
packages/core2-32-poky-linux/zlib/zlib-dbg: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib-dbg: PKGSIZE changed from 212084 to 212344 (+0%)
packages/core2-32-poky-linux/zlib/zlib-dev: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib-dev: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib-dev: PKGSIZE changed from 114159 to 113665 (-0%)
packages/core2-32-poky-linux/zlib/zlib-doc: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib-doc: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib-doc: PKGSIZE changed from 4477 to 4474 (-0%)
packages/core2-32-poky-linux/zlib/zlib-locale: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib-locale: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib-ptest: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib-ptest: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib-src: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib-src: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib-src: PKGSIZE changed from 1112607 to 1103701 (-1%)
packages/core2-32-poky-linux/zlib/zlib-staticdev: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib-staticdev: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib-staticdev: PKGSIZE changed from 271970 to 272494 (+0%)
packages/core2-32-poky-linux/zlib/zlib: PV changed from "1.2.13" to "1.3"
packages/core2-32-poky-linux/zlib/zlib: FILELIST: removed "/usr/lib/libz.so.1.2.13", added "/usr/lib/libz.so.1.3"
packages/core2-32-poky-linux/zlib/zlib: PKGV changed from 1.2.13 [default] to 1.3 [default]
packages/core2-32-poky-linux/zlib/zlib: PKGSIZE changed from 95634 to 95627 (-0%)
Changes to packages/x86_64-linux/zlib-native (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so.1.3 was added
  /usr/lib/libz.so.1.2.13 was removed

--===============2334092295814243694==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-zlib-upgrade-1.2.13-1.3.patch"

RnJvbSA2Mzg4Mzc0NWMyOWViMmIxYmUyNjNhNGZiNzAxNjFiM2FjOWZjODM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMTowODoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHps
aWI6IHVwZ3JhZGUgMS4yLjEzIC0+IDEuMwoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS96bGliL3t6
bGliXzEuMi4xMy5iYiA9PiB6bGliXzEuMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS96bGli
L3t6bGliXzEuMi4xMy5iYiA9PiB6bGliXzEuMy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS96bGliL3psaWJfMS4yLjEzLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvemxp
Yi96bGliXzEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29yZS96bGliL3psaWJfMS4yLjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS96
bGliL3psaWJfMS4zLmJiCmluZGV4IGVjOTc3YTMwMzUuLmM4ZmQ4NTVlZTYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3psaWIvemxpYl8xLjIuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvemxpYi96bGliXzEuMy5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gImh0dHBz
Oi8vemxpYi5uZXQvJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tf
VVJJID0gImh0dHA6Ly96bGliLm5ldC8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiM2EyNGRl
OTdhOGZkYmM4MzViOTgzMzE2OTUwMTAzMGI4OTc3MDMxYmNiNTRiM2IzYWMxMzc0MGY4NDZhYjMw
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmMGJhNGMyOTIwMTNkYmMyNzUzMGIzYTgxZTFmOWE4
MTNjZDM5ZGUwMWNhNWUwZjhiZjM1NTcwMmVmYTU5M2UiCiAKICMgV2hlbiBhIG5ldyByZWxlYXNl
IGlzIG1hZGUgdGhlIHByZXZpb3VzIHJlbGVhc2UgaXMgbW92ZWQgdG8gZm9zc2lscy8sIHNvIGFk
ZCB0aGlzCiAjIHRvIFBSRU1JUlJPUlMgc28gaXQgaXMgYWxzbyBzZWFyY2hlZCBhdXRvbWF0aWNh
bGx5LgotLSAKMi4zOS4yCgo=

--===============2334092295814243694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/zlib (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so.1.3 was added
  /usr/lib/libz.so.1.2.13 was removed
packages/core2-32-poky-linux/zlib/zlib: FILELIST: removed "/usr/lib/libz.so.1.2.13", added "/usr/lib/libz.so.1.3"
Changes to packages/x86_64-linux/zlib-native (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so changed symlink target from libz.so.1.2.13 to libz.so.1.3
  /usr/lib/libz.so.1.3 was added
  /usr/lib/libz.so.1.2.13 was removed

--===============2334092295814243694==--

