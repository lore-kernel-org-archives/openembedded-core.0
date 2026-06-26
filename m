Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68265CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:11:37 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29407.1782454296789974959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KdFWo/jW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V1dIt+u/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f028e1ce3-ae6a0786-ce3c-47e8-b407-f616a222a83c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782454295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iIxMXV1iwPm3X54UgvdiIoljqKvx91OjMAh09wCmjMI=;
	b=KdFWo/jW7c7oDUYL+iweXiaK4VYgCADxH9omcT+hutzi8dZggr+RgvNB9HrE26OF
	Sc7CcSqgvx5QzJjPjwBS6CZ56JJB/YjwF7ujqrcSCcwG9ZTtUQHQeO+kfVxPeOWkDJW
	BnSOfqlIRQPV9wQf+YepfPC+kzoeuRPWs2IUTIxo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782454295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iIxMXV1iwPm3X54UgvdiIoljqKvx91OjMAh09wCmjMI=;
	b=V1dIt+u/D4/ABECFBVzP60uC5ii/5dihWLQbMBrdo/YjMlr8yLoHyLQjn4Z+TuIv
	lXzI3DW0oS0K1zf2g5Eyjfswh8wkNd6EHkDKaf92ZR0DRhSw55cS6g/TPlCleMCMRnA
	RnskyUyVEw9bsH6OcOr6hsCOgvLQEOzbzGlrKObA=
Content-Type: multipart/mixed; boundary="===============8704546177783317755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.8.2 SUCCEEDED
Message-ID: <0101019f028e1ce3-ae6a0786-ce3c-47e8-b407-f616a222a83c-000000@us-west-2.amazonses.com>
Date: Fri, 26 Jun 2026 06:11:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.26-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239593

--===============8704546177783317755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *expat* to *2.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-expat-upgrade-2.8.1-2.8.2.patch
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
From 173817d966706898769fea4b2dc2da560d828f27 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 26 Jun 2026 05:43:02 +0000
Subject: [PATCH] expat: upgrade 2.8.1 -> 2.8.2

---
 meta/recipes-core/expat/{expat_2.8.1.bb => expat_2.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.8.1.bb => expat_2.8.2.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.8.1.bb b/meta/recipes-core/expat/expat_2.8.2.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.8.1.bb
rename to meta/recipes-core/expat/expat_2.8.2.bb
index fa48d42bf8..0b9dbe161b 100644
--- a/meta/recipes-core/expat/expat_2.8.1.bb
+++ b/meta/recipes-core/expat/expat_2.8.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "f5833dd2e1cd7739ec9182804a1a29c4f0cc7c2f26b633d3a2188b7766a88ecb"
+SRC_URI[sha256sum] = "69e7f52417d85b1c2b7fe855e176eec55d0b2d7d92d691372d833a1c7df7923b"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.47.1


--===============8704546177783317755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.8.1 -> /usr/lib/cmake/expat-2.8.2
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.12.1", added "/usr/lib/libexpat.so.1.12.2"
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.12.1 to libexpat.so.1.12.2
  /usr/lib/cmake/expat-2.8.1 moved to /usr/lib/cmake/expat-2.8.2
  /usr/lib/libexpat.so.1.12.1 moved to /usr/lib/libexpat.so.1.12.2
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.12.1 to libexpat.so.1.12.2
  /usr/lib/cmake/expat-2.8.1 moved to /usr/lib/cmake/expat-2.8.2
  /usr/lib/libexpat.so.1.12.1 moved to /usr/lib/libexpat.so.1.12.2
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.2 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.2 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.2 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.2 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.2 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.2 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.2 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.2 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.2 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.2 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.2 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.2 moved to /usr/lib/libgthread-2.0.so.0.8800.1

--===============8704546177783317755==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.8.1-2.8.2.patch"

RnJvbSAxNzM4MTdkOTY2NzA2ODk4NzY5ZmVhNGIyZGMyZGE1NjBkODI4ZjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjYgSnVuIDIwMjYgMDU6NDM6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
eHBhdDogdXBncmFkZSAyLjguMSAtPiAyLjguMgoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9leHBh
dC97ZXhwYXRfMi44LjEuYmIgPT4gZXhwYXRfMi44LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvZXhwYXQve2V4cGF0XzIuOC4xLmJiID0+IGV4cGF0XzIuOC4yLmJifSAoOTIlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuOC4xLmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvZXhwYXQvZXhwYXRfMi44LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi44LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuOC4yLmJiCmluZGV4IGZhNDhkNDJiZjguLjBi
OWRiZTE2MWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuOC4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuOC4yLmJiCkBAIC0xNSw3
ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL1JfJHtWRVJT
SU9OX1RBR30vZXhwYXQtJHtQVn0udGFyLmJ6MiAgXAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxlYXNlcy8iCiBVUFNUUkVBTV9DSEVD
S19SRUdFWCA9ICJyZWxlYXNlcy90YWcvUl8oP1A8cHZlcj4uKykiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJmNTgzM2RkMmUxY2Q3NzM5ZWM5MTgyODA0YTFhMjljNGYwY2M3YzJmMjZiNjMzZDNh
MjE4OGI3NzY2YTg4ZWNiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY5ZTdmNTI0MTdkODViMWMy
YjdmZTg1NWUxNzZlZWM1NWQwYjJkN2Q5MmQ2OTEzNzJkODMzYTFjN2RmNzkyM2IiCiAKIEVYVFJB
X09FQ01BS0U6Y2xhc3MtbmF0aXZlICs9ICItREVYUEFUX0JVSUxEX0RPQ1M9T0ZGIgogCi0tIAoy
LjQ3LjEKCg==

--===============8704546177783317755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/expat/expat-bin: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-bin: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat-dbg: FILELIST: removed "/usr/lib/.debug/libexpat.so.1.12.1", added "/usr/lib/.debug/libexpat.so.1.12.2"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-dbg: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGSIZE changed from 1731216 to 1784736 (+3%)
packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.8.1 -> /usr/lib/cmake/expat-2.8.2
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-dev: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGSIZE changed from 67193 to 67198 (+0%)
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-doc: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGSIZE changed from 113683 to 118263 (+4%)
packages/x86-64-v3-poky-linux/expat/expat-locale: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-locale: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat-ptest: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-ptest: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat-ptest: PKGSIZE changed from 534624 to 538720 (+1%)
packages/x86-64-v3-poky-linux/expat/expat-src: FILELIST: directory renamed /usr/src/debug/expat/2.8.1/tests/benchmark -> /usr/src/debug/expat/2.8.2/tests/benchmark, directory renamed /usr/src/debug/expat/2.8.1/xmlwf -> /usr/src/debug/expat/2.8.2/xmlwf, directory renamed /usr/src/debug/expat/2.8.1/tests -> /usr/src/debug/expat/2.8.2/tests, removed "/usr/src/debug/expat/2.8.1/lib/nametab.h /usr/src/debug/expat/2.8.1/lib/random_arc4random.c /usr/src/debug/expat/2.8.1/lib/xmltok.c /usr/src/debug/expat/2.8.1/lib/siphash.h /usr/src/debug/expat/2.8.1/lib/internal.h /usr/src/debug/expat/2.8.1/lib/xmltok.h /usr/src/debug/expat/2.8.1/lib/expat.h /usr/src/debug/expat/2.8.1/lib/random_getentropy.c /usr/src/debug/expat/2.8.1/lib/xmlrole.h /usr/src/debug/expat/2.8.1/lib/random_getrandom.c /usr/src/debug/expat/2.8.1/lib/xmlrole.c /usr/src/debug/expat/2.8.1/lib/xmlparse.c /usr/src/debug/expat/2.8.1/lib/expat_external.h /usr/src/debug/expat/2.8.1/lib/random_arc4random_buf.c /usr/src/debug/expat/2.8.1
 /lib/xmltok_impl.c /usr/src/debug/expat/2.8.1/lib/random_arc4random_buf.h /usr/src/debug/expat/2.8.1/lib/xmltok_impl.h /usr/src/debug/expat/2.8.1/lib/xmltok_ns.c /usr/src/debug/expat/2.8.1/lib/random_dev_urandom.c", added "/usr/src/debug/expat/2.8.2/lib/nametab.h /usr/src/debug/expat/2.8.2/lib/random_arc4random.c /usr/src/debug/expat/2.8.2/lib/xmltok.c /usr/src/debug/expat/2.8.2/lib/siphash.h /usr/src/debug/expat/2.8.2/lib/internal.h /usr/src/debug/expat/2.8.2/lib/xmltok.h /usr/src/debug/expat/2.8.2/lib/expat.h /usr/src/debug/expat/2.8.2/lib/random_getentropy.c /usr/src/debug/expat/2.8.2/lib/xmlrole.h /usr/src/debug/expat/2.8.2/lib/random_getrandom.c /usr/src/debug/expat/2.8.2/lib/xmlrole.c /usr/src/debug/expat/2.8.2/lib/xmlparse.c /usr/src/debug/expat/2.8.2/lib/expat_external.h /usr/src/debug/expat/2.8.2/lib/xcsinc.c /usr/src/debug/expat/2.8.2/lib/random_arc4random_buf.c /usr/src/debug/expat/2.8.2/lib/xmltok_impl.c /usr/src/debug/expat/2.8.2/lib/random_arc4random_buf.h /usr/src/deb
 ug/expat/2.8.2/lib/xmltok_impl.h /usr/src/debug/expat/2.8.2/lib/xmltok_ns.c"
packages/x86-64-v3-poky-linux/expat/expat-src: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-src: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat-src: PKGSIZE changed from 1342883 to 1353198 (+1%)
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.12.1", added "/usr/lib/libexpat.so.1.12.2"
packages/x86-64-v3-poky-linux/expat/expat: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat/expat: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat: PKGV changed from 2.8.1 [default] to 2.8.2 [default]
packages/x86-64-v3-poky-linux/expat: PV changed from "2.8.1" to "2.8.2"
packages/x86-64-v3-poky-linux/expat: SRC_URI changed from "https://github.com/libexpat/libexpat/releases//download/R_2_8_1/expat-2.8.1.tar.bz2 file://run-ptest" to "https://github.com/libexpat/libexpat/releases//download/R_2_8_2/expat-2.8.2.tar.bz2 file://run-ptest"
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.12.1 to libexpat.so.1.12.2
  /usr/lib/cmake/expat-2.8.1 moved to /usr/lib/cmake/expat-2.8.2
  /usr/lib/libexpat.so.1.12.1 moved to /usr/lib/libexpat.so.1.12.2
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.12.1 to libexpat.so.1.12.2
  /usr/lib/cmake/expat-2.8.1 moved to /usr/lib/cmake/expat-2.8.2
  /usr/lib/libexpat.so.1.12.1 moved to /usr/lib/libexpat.so.1.12.2
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8800.2 to libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8800.2 to libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8800.2 to libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8800.2 to libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8800.2 to libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8800.2 to libgthread-2.0.so.0.8800.1
  /usr/lib/libgio-2.0.so.0.8800.2 moved to /usr/lib/libgio-2.0.so.0.8800.1
  /usr/lib/libgirepository-2.0.so.0.8800.2 moved to /usr/lib/libgirepository-2.0.so.0.8800.1
  /usr/lib/libglib-2.0.so.0.8800.2 moved to /usr/lib/libglib-2.0.so.0.8800.1
  /usr/lib/libgmodule-2.0.so.0.8800.2 moved to /usr/lib/libgmodule-2.0.so.0.8800.1
  /usr/lib/libgobject-2.0.so.0.8800.2 moved to /usr/lib/libgobject-2.0.so.0.8800.1
  /usr/lib/libgthread-2.0.so.0.8800.2 moved to /usr/lib/libgthread-2.0.so.0.8800.1

--===============8704546177783317755==--

