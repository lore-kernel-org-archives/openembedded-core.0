Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434B6F42129
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19814.1776261874154191723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J1QNiFl5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xah+kLPM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d91754a8a-b4658fce-fc33-437a-8948-d045264954b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f7sNNuT3xxfxEaZ1APO6u8eaSdjcINea9BZlRZ+jF0c=;
	b=J1QNiFl5wQgv1g6hbv4y+Hei+rggdUO6N6Mc6MN9SiHduoQPhvDMWZ8U4JRlxF1z
	4N0B7AhqBISd/EDkn5jRWkzl3sdaWSHUuZWSLUxFygc99k60eJZ8R7/u9uyd6h9+K0w
	9Uim/SPHHJaP1QGjDWt3eHG8FblHPtSjrP0VWPWo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f7sNNuT3xxfxEaZ1APO6u8eaSdjcINea9BZlRZ+jF0c=;
	b=xah+kLPMf/+r+bBtp3o1/V5DTbU+lOcvFenlApxG7nKLuSAyZGGjWI2DzRPq/wg3
	KwwjvM+gXmv+jGjy02QNV9zvp/rf9AfkXClKBh7GFM4JP0LVQOF9WtLIL5DKZBC/z+p
	c3S9ms36JiM0tKQfdCFP1YXriG/Sqf29xEITp3gM=
Content-Type: multipart/mixed; boundary="===============4023314167381286560=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.4.3 SUCCEEDED
Message-ID: <0101019d91754a8a-b4658fce-fc33-437a-8948-d045264954b2-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235228

--===============4023314167381286560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.4.0-1.4.3.patch
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
From 104a3e48fb077540cf026e17cf76193c4249e584 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:21:49 +0000
Subject: [PATCH] python3-build: upgrade 1.4.0 -> 1.4.3

---
 .../python/{python3-build_1.4.0.bb => python3-build_1.4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.4.0.bb => python3-build_1.4.3.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.4.0.bb b/meta/recipes-devtools/python/python3-build_1.4.3.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.4.0.bb
rename to meta/recipes-devtools/python/python3-build_1.4.3.bb
index 910f08374b..1e7794fe3f 100644
--- a/meta/recipes-devtools/python/python3-build_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "f1b91b925aa322be454f8330c6fb48b465da993d1e7e7e6fa35027ec49f3c936"
+SRC_URI[sha256sum] = "5aa4231ae0e807efdf1fd0623e07366eca2ab215921345a2e38acdd5d0fa0a74"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============4023314167381286560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 157521 to 173846 (+10%)
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.4.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.4.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.3.dist-info
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
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.3.dist-info

--===============4023314167381286560==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.4.0-1.4.3.patch"

RnJvbSAxMDRhM2U0OGZiMDc3NTQwY2YwMjZlMTdjZjc2MTkzYzQyNDllNTg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MjE6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJ1aWxkOiB1cGdyYWRlIDEuNC4wIC0+IDEuNC4zCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYnVpbGRfMS40LjAuYmIgPT4gcHl0aG9uMy1idWlsZF8xLjQuMy5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYnVpbGRfMS40LjAuYmIgPT4gcHl0
aG9uMy1idWlsZF8xLjQuMy5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS40LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRf
MS40LjMuYmIKaW5kZXggOTEwZjA4Mzc0Yi4uMWU3Nzk0ZmUzZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjQuMy5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvYnVpbGQiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMxMDQzOWFm
Mjg3YjBmYjQ3ODBiMmFkNjkwN2MyNTZjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjFiOTFi
OTI1YWEzMjJiZTQ1NGY4MzMwYzZmYjQ4YjQ2NWRhOTkzZDFlN2U3ZTZmYTM1MDI3ZWM0OWYzYzkz
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1YWE0MjMxYWUwZTgwN2VmZGYxZmQwNjIzZTA3MzY2
ZWNhMmFiMjE1OTIxMzQ1YTJlMzhhY2RkNWQwZmEwYTc0IgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============4023314167381286560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.4.0.tar.gz;downloadfilename=build-1.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.4.3.tar.gz;downloadfilename=build-1.4.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.4.0 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.4.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.4.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.4.0" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 157521 to 173846 (+10%)
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.3.dist-info
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
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py was removed
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.3.dist-info

--===============4023314167381286560==--

