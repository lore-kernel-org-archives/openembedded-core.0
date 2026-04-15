Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7062AF428E6
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19738.1776261874123920073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NLUqxSWN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l7BPrLha;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d91757703-fca505cd-297e-4d25-ba40-931cd7165c0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5UXH1E3sTYWR3E70FmxpqqQqCi/FybSKWoGeQiH4lCM=;
	b=NLUqxSWNAH7EA2Rv7e3XFLQlj83G9VX6UUqS6+U1BMULriufDGSF2VmOG9UpDhXP
	a+WCUht72DLy0kkBpYmBc8AeKpds0fs/+UNF5HElqHIgTuchCGHTBV+xNW0Xhq7SNqf
	KexUFm1ZRlVQr3G1UUkAi7VGZsCV6qbtX0ywdFKI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5UXH1E3sTYWR3E70FmxpqqQqCi/FybSKWoGeQiH4lCM=;
	b=l7BPrLhaZsnCS0ElKXbglaHG22KO6mcRlU9NGWCr/JETtRK+HtrD/oaCZKZkqglZ
	WGgWJSJEgvdHAB2shUdLtmmaAsW1G9vDxuLlcEm2yfv4L3ZMONlLwoc0hgJickj/W3H
	aDlDn4EzzplEqQ4n5yKgRRq4FKyQUNSjn5610UUU=
Content-Type: multipart/mixed; boundary="===============5640483515219419723=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.8.3 SUCCEEDED
Message-ID: <0101019d91757703-fca505cd-297e-4d25-ba40-931cd7165c0f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235267

--===============5640483515219419723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.8.2-5.8.3.patch
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
From 5b8e89dd7daf77f2cad56ebc2c79f14635b166a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 10:43:21 +0000
Subject: [PATCH] xz: upgrade 5.8.2 -> 5.8.3

---
 meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.3.bb} (97%)

diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/xz/xz_5.8.3.bb
similarity index 97%
rename from meta/recipes-extended/xz/xz_5.8.2.bb
rename to meta/recipes-extended/xz/xz_5.8.3.bb
index 982f5054c3..2c87065837 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1"
+SRC_URI[sha256sum] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.47.1


--===============5640483515219419723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.2", added "/usr/lib/liblzma.so.5.8.3"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/ar/man1/lzdiff.1 /usr/share/man/ar/man1/xzdiff.1 /usr/share/man/ar/man1/lzegrep.1 /usr/share/man/ar/man1/xzegrep.1 /usr/share/man/ar/man1/lzfgrep.1 /usr/share/man/ar/man1/xzfgrep.1 /usr/share/man/ar/man1/lzmadec.1 /usr/share/man/ar/man1/lzcat.1 /usr/share/man/ar/man1/unxz.1 /usr/share/man/ar/man1/xzcat.1 /usr/share/man/ar/man1/unlzma.1 /usr/share/man/ar/man1/lzgrep.1 /usr/share/man/ar/man1/xzgrep.1 /usr/share/man/ar/man1/xz.1 /usr/share/man/ar/man1/lzcmp.1 /usr/share/man/ar/man1/xzcmp.1 /usr/share/man/ar/man1/lzmore.1 /usr/share/man/ar/man1/xzless.1 /usr/share/man/ar/man1/lzless.1 /usr/share/man/ar/man1/lzma.1 /usr/share/man/ar/man1/xzdec.1 /usr/share/man/ar/man1/lzmainfo.1 /usr/share/man/ar/man1/xzmore.1"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3

--===============5640483515219419723==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.8.2-5.8.3.patch"

RnJvbSA1YjhlODlkZDdkYWY3N2YyY2FkNTZlYmMyYzc5ZjE0NjM1YjE2NmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTA6NDM6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ejogdXBncmFkZSA1LjguMiAtPiA1LjguMwoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
e3h6XzUuOC4yLmJiID0+IHh6XzUuOC4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94
ei97eHpfNS44LjIuYmIgPT4geHpfNS44LjMuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3h6XzUuOC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei94el81LjguMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3h6L3h6XzUuOC4zLmJiCmluZGV4IDk4MmY1MDU0YzMuLjJjODcwNjU4MzcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQveHoveHpfNS44LjMuYmIKQEAgLTI4LDcgKzI4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDM4ZDU2MmY2MTEyMTc0ZGU5M2E5Njc3NjgyMjMxYjIg
XAogU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vdHVrYWFuaS1wcm9qZWN0L3h6L3JlbGVh
c2VzL2Rvd25sb2FkL3Yke1BWfS94ei0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2UwOWM1MGE1
OTYyNzg2YjgzZTVkYTM4OWM5MGRkMmMxNWVjZDA5ODBhMjU4ZGQwMWY3MGY5ZTdjZTU4YThmMSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZDNhMWI5NzNhZjIxODExNGY0Zjg4OWJiYWEyZjRjMDM3
ZGVhYWUwYzhlODE1ZWVjMzgxYzNkNTQ2Yjk3NGEwIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cmVsZWFzZXMvdGFnL3YoP1A8cHZlcj5cZCsoXC5cZCspKykiCiBVUFNUUkVBTV9DSEVDS19VUkkg
PSAiaHR0cHM6Ly9naXRodWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9yZWxlYXNlcy8iCiAKLS0g
CjIuNDcuMQoK

--===============5640483515219419723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.gz file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.8.3/xz-5.8.3.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/xz: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/liblzma: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/liblzma: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.2", added "/usr/lib/liblzma.so.5.8.3"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGSIZE changed from 2251128 to 2255160 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-dbg: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.8.2", added "/usr/lib/.debug/liblzma.so.5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGSIZE changed from 229928 to 229942 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-dev: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGSIZE changed from 1390205 to 1517047 (+9%)
packages/x86-64-v3-poky-linux/xz/xz-doc: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/ar/man1/lzcat.1 /usr/share/man/ar/man1/xzcat.1 /usr/share/man/ar/man1/xzdec.1 /usr/share/man/ar/man1/unlzma.1 /usr/share/man/ar/man1/lzmainfo.1 /usr/share/man/ar/man1/xz.1 /usr/share/man/ar/man1/xzfgrep.1 /usr/share/man/ar/man1/xzegrep.1 /usr/share/man/ar/man1/lzfgrep.1 /usr/share/man/ar/man1/lzegrep.1 /usr/share/man/ar/man1/lzless.1 /usr/share/man/ar/man1/lzdiff.1 /usr/share/man/ar/man1/xzdiff.1 /usr/share/man/ar/man1/lzgrep.1 /usr/share/man/ar/man1/xzgrep.1 /usr/share/man/ar/man1/lzma.1 /usr/share/man/ar/man1/lzmadec.1 /usr/share/man/ar/man1/lzmore.1 /usr/share/man/ar/man1/xzmore.1 /usr/share/man/ar/man1/unxz.1 /usr/share/man/ar/man1/lzcmp.1 /usr/share/man/ar/man1/xzcmp.1 /usr/share/man/ar/man1/xzless.1"
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-ptest: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-src: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-src: PKGSIZE changed from 1696338 to 1698866 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-src: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-src: FILELIST: directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/lzma -> /usr/src/debug/xz/5.8.3/src/liblzma/lzma, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/api/lzma -> /usr/src/debug/xz/5.8.3/src/liblzma/api/lzma, directory renamed /usr/src/debug/xz/5.8.2/src/common -> /usr/src/debug/xz/5.8.3/src/common, directory renamed /usr/src/debug/xz/5.8.2/src/xzdec -> /usr/src/debug/xz/5.8.3/src/xzdec, directory renamed /usr/src/debug/xz/5.8.2/tests -> /usr/src/debug/xz/5.8.3/tests, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/rangecoder -> /usr/src/debug/xz/5.8.3/src/liblzma/rangecoder, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/simple -> /usr/src/debug/xz/5.8.3/src/liblzma/simple, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/check -> /usr/src/debug/xz/5.8.3/src/liblzma/check, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/common -> /usr/src/debug/xz/5.8.3/src/liblzma/common, directory renamed /usr/src/de
 bug/xz/5.8.2/src/lzmainfo -> /usr/src/debug/xz/5.8.3/src/lzmainfo, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/lz -> /usr/src/debug/xz/5.8.3/src/liblzma/lz, directory renamed /usr/src/debug/xz/5.8.2/src/xz -> /usr/src/debug/xz/5.8.3/src/xz, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/delta -> /usr/src/debug/xz/5.8.3/src/liblzma/delta
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz: PV changed from "5.8.2" to "5.8.3"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3

--===============5640483515219419723==--

