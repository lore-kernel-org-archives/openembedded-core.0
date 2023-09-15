Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19991EEEC00
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29678.1694804394083795600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Qxp64f79;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=o5hj82XC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a9a36c059-17927474-e68f-4578-bace-8126ca5dfa71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/KeWf85y1n9tFeaIX7KRgB0jiwdstrO1Ga88VdEcKuo=;
	b=Qxp64f79meNiUV6yh53hqd3uHgsiN2UIhE3vhsSjdVE2g206f/1/jPJBB410sImF
	V79k4fZZkbqIxjGbQ0QJI7ujuxwWdRnPjed6m5Z/aRc77IXq9nZwi5pVwqW9BFxtOn6
	JB2T1pn7aaOX4ZgRIK0a4VQytjKJbD9qcdgtI2do=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/KeWf85y1n9tFeaIX7KRgB0jiwdstrO1Ga88VdEcKuo=;
	b=o5hj82XC7dl7ySNvwx/UDrDhudjIMmOOsfqxqBn4dnr+l6NExV89m9oQ2Tn7FPgj
	O/3cKRU+xcenSC3hFqbCODlADpxqsF441d0bZpfzJCQQgqqa4vw2zBonO0jT6gSB8XL
	WbaIGDdqZnIWlULoIFqbqrw17dScA5IOanvMHWwc=
Content-Type: multipart/mixed; boundary="===============1504720324193516541=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libarchive: upgrading to 3.7.2 SUCCEEDED
Message-ID: <0101018a9a36c059-17927474-e68f-4578-bace-8126ca5dfa71-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187723

--===============1504720324193516541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libarchive* to *3.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libarchive-upgrade-3.7.1-3.7.2.patch
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
From 6fd804cf92a9255cf2955346a4c9e5d854ffecd7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 13:06:37 +0000
Subject: [PATCH] libarchive: upgrade 3.7.1 -> 3.7.2

---
 .../libarchive/{libarchive_3.7.1.bb => libarchive_3.7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.1.bb => libarchive_3.7.2.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.1.bb b/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.2.bb
index e40c3e7ed0..a09f607fcf 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "5d24e40819768f74daf846b99837fc53a3a9dcdf3ce1c2003fe0596db850f0f0"
+SRC_URI[sha256sum] = "df404eb7222cf30b4f8f93828677890a2986b66ff8bf39dac32a804e96ddf104"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.39.2


--===============1504720324193516541==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.7.1-3.7.2.patch"

RnJvbSA2ZmQ4MDRjZjkyYTkyNTVjZjI5NTUzNDZhNGM5ZTVkODU0ZmZlY2Q3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTM6MDY6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhcmNoaXZlOiB1cGdyYWRlIDMuNy4xIC0+IDMuNy4yCgotLS0KIC4uLi9saWJhcmNoaXZlL3ts
aWJhcmNoaXZlXzMuNy4xLmJiID0+IGxpYmFyY2hpdmVfMy43LjIuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL3tsaWJhcmNoaXZlXzMuNy4xLmJiID0+IGxpYmFy
Y2hpdmVfMy43LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJhcmNoaXZlL2xpYmFyY2hpdmVfMy43LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8z
LjcuMi5iYgppbmRleCBlNDBjM2U3ZWQwLi5hMDlmNjA3ZmNmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlXzMuNy4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy43LjIuYmIKQEAgLTMyLDcg
KzMyLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vbGliYXJjaGl2ZS5vcmcvZG93bmxvYWRzL2xpYmFy
Y2hpdmUtJHtQVn0udGFyLmd6IgogU1JDX1VSSSArPSAiZmlsZTovL2NvbmZpZ3VyZWhhY2sucGF0
Y2giCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL2xpYmFyY2hpdmUub3JnLyIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjVkMjRlNDA4MTk3NjhmNzRkYWY4NDZiOTk4MzdmYzUzYTNhOWRj
ZGYzY2UxYzIwMDNmZTA1OTZkYjg1MGYwZjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGY0MDRl
YjcyMjJjZjMwYjRmOGY5MzgyODY3Nzg5MGEyOTg2YjY2ZmY4YmYzOWRhYzMyYTgwNGU5NmRkZjEw
NCIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAyMy0zMDU3MV0gPSAidXBzdHJlYW0td29udGZpeDogdXBz
dHJlYW0gaGFzIGRvY3VtZW50ZWQgdGhhdCByZXBvcnRlZCBmdW5jdGlvbiBpcyBub3QgdGhyZWFk
LXNhZmUiCiAKLS0gCjIuMzkuMgoK

--===============1504720324193516541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libarchive/bsdcpio: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/bsdcpio: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/bsdtar: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/bsdtar: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive: SRC_URI changed from "http://libarchive.org/downloads/libarchive-3.7.1.tar.gz file://configurehack.patch" to "http://libarchive.org/downloads/libarchive-3.7.2.tar.gz file://configurehack.patch"
packages/core2-32-poky-linux/libarchive: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive-dbg: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/libarchive-dbg: FILELIST: removed "/usr/lib/.debug/libarchive.so.13.7.1", added "/usr/lib/.debug/libarchive.so.13.7.2"
packages/core2-32-poky-linux/libarchive/libarchive-dbg: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive-dbg: PKGSIZE changed from 2529884 to 2536680 (+0%)
packages/core2-32-poky-linux/libarchive/libarchive-dev: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/libarchive-dev: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive-doc: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/libarchive-doc: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive-doc: PKGSIZE changed from 376532 to 376940 (+0%)
packages/core2-32-poky-linux/libarchive/libarchive-locale: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/libarchive-locale: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive-src: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/libarchive-src: FILELIST: directory renamed /usr/src/debug/libarchive/3.7.1-r0/tar -> /usr/src/debug/libarchive/3.7.2-r0/tar, directory renamed /usr/src/debug/libarchive/3.7.1-r0/cpio -> /usr/src/debug/libarchive/3.7.2-r0/cpio, directory renamed /usr/src/debug/libarchive/3.7.1-r0/cat -> /usr/src/debug/libarchive/3.7.2-r0/cat, directory renamed /usr/src/debug/libarchive/3.7.1-r0/libarchive_fe -> /usr/src/debug/libarchive/3.7.2-r0/libarchive_fe, directory renamed /usr/src/debug/libarchive/3.7.1-r0/libarchive -> /usr/src/debug/libarchive/3.7.2-r0/libarchive, removed "/usr/src/debug/libarchive/3.7.1-r0/unzip/bsdunzip.c", added "/usr/src/debug/libarchive/3.7.2-r0/unzip/bsdunzip.h /usr/src/debug/libarchive/3.7.2-r0/unzip/bsdunzip.c /usr/src/debug/libarchive/3.7.2-r0/unzip/cmdline.c"
packages/core2-32-poky-linux/libarchive/libarchive-src: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive-src: PKGSIZE changed from 3545636 to 3562283 (+0%)
packages/core2-32-poky-linux/libarchive/libarchive-staticdev: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/libarchive-staticdev: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive: PV changed from "3.7.1" to "3.7.2"
packages/core2-32-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.7.1", added "/usr/lib/libarchive.so.13.7.2"
packages/core2-32-poky-linux/libarchive/libarchive: PKGV changed from 3.7.1 [default] to 3.7.2 [default]
packages/core2-32-poky-linux/libarchive/libarchive: PKGSIZE changed from 921768 to 925864 (+0%)
Changes to packages/core2-32-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so.13.7.1 moved to /usr/lib/libarchive.so.13.7.2
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so.13.7.1 moved to /usr/lib/libarchive.so.13.7.2

--===============1504720324193516541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.7.1", added "/usr/lib/libarchive.so.13.7.2"
Changes to packages/core2-32-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so.13.7.1 moved to /usr/lib/libarchive.so.13.7.2
Changes to packages/x86_64-linux/libarchive-native (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.7.1 to libarchive.so.13.7.2
  /usr/lib/libarchive.so.13.7.1 moved to /usr/lib/libarchive.so.13.7.2

--===============1504720324193516541==--

