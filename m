Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCC3D5CC9E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17406.1765872155127138718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TTaMK4bk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Tc7OrK1Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262eb808-15e43dcb-0cf7-492d-a820-98dead34d5aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8VlhOdLatl1cacpcl46sSl9ZPcyWsa5ODaidzgF9Ees=;
	b=TTaMK4bkJM6Kg20umVA9HfgUDYKVy9FOjwyPoyxg7dJW51GbgsJIwHcvKcWDIX93
	mjyMypl1UFCRg2R2J4EOaDo3LV8sOP3GKptCZjL7Gp9cZ4oWck7HOH/7iDmuoYCQ3UI
	D5Gh0YM+8VUGq+LDFlgPfwWXIxHeK2GRqbB+9w+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8VlhOdLatl1cacpcl46sSl9ZPcyWsa5ODaidzgF9Ees=;
	b=Tc7OrK1ZUrndbQ4q0AgQFn6qIm/HxAcl8d2Y8GMATjILGBj7kau1fNMm69Y4b8LW
	+zCve0Hxc3eLtShEsXr3YBTR7rT00oO6z0TyX+QoH9CQbhAR5254LIs9htGcteNw5l4
	2OTxin4m4iFF/w9BtGEe/qtZiAlPm3nmmMn1EQh4=
Content-Type: multipart/mixed; boundary="===============5566695337207732931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libarchive: upgrading to 3.8.4 SUCCEEDED
Message-ID: <0101019b262eb808-15e43dcb-0cf7-492d-a820-98dead34d5aa-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227849

--===============5566695337207732931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libarchive* to *3.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libarchive-upgrade-3.8.3-3.8.4.patch
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
From ccf9445311cf2c3e15babe00588a941eb823e880 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 02:48:11 +0000
Subject: [PATCH] libarchive: upgrade 3.8.3 -> 3.8.4

---
 .../libarchive/{libarchive_3.8.3.bb => libarchive_3.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.3.bb => libarchive_3.8.4.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.3.bb b/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.4.bb
index e3706ba3bb..e89638f5c6 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "a290c2d82bce7b806d1e5309558a7bd0ef39067a868f4622a0e32e71a4de8cb6"
+SRC_URI[sha256sum] = "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.47.1


--===============5566695337207732931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.8.3", added "/usr/lib/libarchive.so.13.8.4"
Changes to packages/x86-64-v3-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so.13.8.3 moved to /usr/lib/libarchive.so.13.8.4
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so.13.8.3 moved to /usr/lib/libarchive.so.13.8.4

--===============5566695337207732931==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.8.3-3.8.4.patch"

RnJvbSBjY2Y5NDQ1MzExY2YyYzNlMTViYWJlMDA1ODhhOTQxZWI4MjNlODgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6NDg6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhcmNoaXZlOiB1cGdyYWRlIDMuOC4zIC0+IDMuOC40CgotLS0KIC4uLi9saWJhcmNoaXZlL3ts
aWJhcmNoaXZlXzMuOC4zLmJiID0+IGxpYmFyY2hpdmVfMy44LjQuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL3tsaWJhcmNoaXZlXzMuOC4zLmJiID0+IGxpYmFy
Y2hpdmVfMy44LjQuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJhcmNoaXZlL2xpYmFyY2hpdmVfMy44LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8z
LjguNC5iYgppbmRleCBlMzcwNmJhM2JiLi5lODk2MzhmNWM2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuOC4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy44LjQuYmIKQEAgLTMyLDcg
KzMyLDcgQEAgRVhUUkFfT0VDT05GICs9ICItLWVuYWJsZS1sYXJnZWZpbGUgLS13aXRob3V0LWlj
b252IgogU1JDX1VSSSA9ICJodHRwczovL2xpYmFyY2hpdmUub3JnL2Rvd25sb2Fkcy9saWJhcmNo
aXZlLSR7UFZ9LnRhci5neiIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5saWJh
cmNoaXZlLm9yZy8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjkwYzJkODJiY2U3YjgwNmQx
ZTUzMDk1NThhN2JkMGVmMzkwNjdhODY4ZjQ2MjJhMGUzMmU3MWE0ZGU4Y2I2IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImIyYzc1YjEzMmEwZWM0MzI3NGQyODY3MjIxYmVmY2I0MjUwMzRjZDAzOGU0
NjVhZmJmYWQwOTkxMWFiYjFhYmIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHVwZGF0ZS1hbHRlcm5h
dGl2ZXMgcGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============5566695337207732931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)
packages/x86-64-v3-poky-linux/libarchive/bsdcpio: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/bsdcpio: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive/bsdtar: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/bsdtar: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive: SRC_URI changed from "https://libarchive.org/downloads/libarchive-3.8.3.tar.gz" to "https://libarchive.org/downloads/libarchive-3.8.4.tar.gz"
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: FILELIST: removed "/usr/lib/.debug/libarchive.so.13.8.3", added "/usr/lib/.debug/libarchive.so.13.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-dbg: PKGSIZE changed from 3033368 to 3033840 (+0%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-dev: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive-dev: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-doc: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive-doc: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-locale: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive-locale: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: FILELIST: directory renamed /usr/src/debug/libarchive/3.8.3/unzip -> /usr/src/debug/libarchive/3.8.4/unzip, directory renamed /usr/src/debug/libarchive/3.8.3/cat -> /usr/src/debug/libarchive/3.8.4/cat, directory renamed /usr/src/debug/libarchive/3.8.3/cpio -> /usr/src/debug/libarchive/3.8.4/cpio, directory renamed /usr/src/debug/libarchive/3.8.3/libarchive_fe -> /usr/src/debug/libarchive/3.8.4/libarchive_fe, directory renamed /usr/src/debug/libarchive/3.8.3/libarchive -> /usr/src/debug/libarchive/3.8.4/libarchive, directory renamed /usr/src/debug/libarchive/3.8.3/tar -> /usr/src/debug/libarchive/3.8.4/tar
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive-src: PKGSIZE changed from 3695333 to 3695768 (+0%)
packages/x86-64-v3-poky-linux/libarchive/libarchive-staticdev: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive-staticdev: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
packages/x86-64-v3-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.8.3", added "/usr/lib/libarchive.so.13.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive: PV changed from "3.8.3" to "3.8.4"
packages/x86-64-v3-poky-linux/libarchive/libarchive: PKGV changed from 3.8.3 [default] to 3.8.4 [default]
Changes to packages/x86-64-v3-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so.13.8.3 moved to /usr/lib/libarchive.so.13.8.4
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.8.3 to libarchive.so.13.8.4
  /usr/lib/libarchive.so.13.8.3 moved to /usr/lib/libarchive.so.13.8.4

--===============5566695337207732931==--

