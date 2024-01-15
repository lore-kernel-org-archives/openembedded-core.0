Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7EBC48BC1
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.88837.1705340028829172787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZqQQkwXF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e0bmjiWP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018d0e2fcdce-8b682064-aa6a-44e5-bb77-d63efcc913ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z4sSHuIrlQa7ZJX9M6LttpmKKleDh0IvRoMMxKdlMQE=;
	b=ZqQQkwXFAW7ejnd8r5wRNJnvfDttOEJfxiCWdtHSYb4+GjSaweB13JuoAtrFrvcg
	uXd6fEUXa0iAlOODY+LI348XMc1UIjkJv0p4ClqPlo7bjNFzulQbCnJJ+pLJqYiRfjg
	S4smjUJtKrmLuQVOEp7gDrwECHnFNeAQCmpwXubM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z4sSHuIrlQa7ZJX9M6LttpmKKleDh0IvRoMMxKdlMQE=;
	b=e0bmjiWPYLsAbMTcQbKEla+aBcdF4PM8bFdmodeUdJzCBF2kyG+nvW3imWxTtNmo
	zBY0/UeqMorlpLVcnHDJTYp+WWKpx0rTVo2jckWSjR/6mR/Trgj7dT+JxnsH7kEymvb
	YSs9HqTuTehImZ7d4NPv6nHUZp7UnJf72f7zgsmE=
Content-Type: multipart/mixed; boundary="===============4534794443257554013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.4.5 SUCCEEDED
Message-ID: <0101018d0e2fcdce-8b682064-aa6a-44e5-bb77-d63efcc913ac-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193736

--===============4534794443257554013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xz* to *5.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.4.4-5.4.5.patch
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
From 6b7f06e22d645166a98598dc83255529429e45af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 10:38:39 +0000
Subject: [PATCH] xz: upgrade 5.4.4 -> 5.4.5

---
 meta/recipes-extended/xz/{xz_5.4.4.bb => xz_5.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.4.bb => xz_5.4.5.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.4.bb b/meta/recipes-extended/xz/xz_5.4.5.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.4.bb
rename to meta/recipes-extended/xz/xz_5.4.5.bb
index 90f4c3d82c..09eade8be0 100644
--- a/meta/recipes-extended/xz/xz_5.4.4.bb
+++ b/meta/recipes-extended/xz/xz_5.4.5.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "aae39544e254cfd27e942d35a048d592959bd7a79f9a624afb0498bb5613bdf8"
+SRC_URI[sha256sum] = "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d6"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.42.0


--===============4534794443257554013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.4.4-5.4.5.patch"

RnJvbSA2YjdmMDZlMjJkNjQ1MTY2YTk4NTk4ZGM4MzI1NTUyOTQyOWU0NWFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTA6Mzg6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ejogdXBncmFkZSA1LjQuNCAtPiA1LjQuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
e3h6XzUuNC40LmJiID0+IHh6XzUuNC41LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94
ei97eHpfNS40LjQuYmIgPT4geHpfNS40LjUuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuNC40LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3h6XzUuNC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei94el81LjQuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3h6L3h6XzUuNC41LmJiCmluZGV4IDkwZjRjM2Q4MmMuLjA5ZWFkZThiZTAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQveHoveHpfNS40LjUuYmIKQEAgLTI1LDcgKzI1LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YzhlYTg0ZWJlN2I5M2NjZTY3NmI1NDM1NWRjNmIyYzAg
XAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly90dWthYW5pLm9y
Zy94ei94ei0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWFlMzk1NDRlMjU0
Y2ZkMjdlOTQyZDM1YTA0OGQ1OTI5NTliZDdhNzlmOWE2MjRhZmIwNDk4YmI1NjEzYmRmOCIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIxMzVjOTBiOTM0YWVlOGZiYzBkNDY3ZGU4N2EwNWNiNzBkNjI3
ZGEzNmFiZTUxOGMzNTdhODczNzA5ZTViN2Q2IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAieHot
KD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKIENBQ0hFRF9DT05GSUdVUkVWQVJTICs9ICJn
bF9jdl9wb3NpeF9zaGVsbD0vYmluL3NoIgotLSAKMi40Mi4wCgo=

--===============4534794443257554013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.4.4", added "/usr/lib/liblzma.so.5.4.5"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5

--===============4534794443257554013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xz: SRC_URI changed from "https://tukaani.org/xz/xz-5.4.4.tar.gz" to "https://tukaani.org/xz/xz-5.4.5.tar.gz"
packages/core2-64-poky-linux/xz: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/liblzma: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.4.4", added "/usr/lib/liblzma.so.5.4.5"
packages/core2-64-poky-linux/xz/liblzma: PV changed from "5.4.4" to "5.4.5"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5
packages/core2-64-poky-linux/xz/xz-dbg: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.4.4", added "/usr/lib/.debug/liblzma.so.5.4.5"
packages/core2-64-poky-linux/xz/xz-dbg: PKGSIZE changed from 1048912 to 1047928 (-0%)
packages/core2-64-poky-linux/xz/xz-dbg: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-dev: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-dev: PKGSIZE changed from 225642 to 225688 (+0%)
packages/core2-64-poky-linux/xz/xz-dev: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-doc: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-doc: PKGSIZE changed from 1790015 to 1792415 (+0%)
packages/core2-64-poky-linux/xz/xz-doc: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-ca: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-cs: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-da: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-da: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-de: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-de: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGSIZE changed from 26104 to 26139 (+0%)
packages/core2-64-poky-linux/xz/xz-locale-eo: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-es: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-es: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-fi: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-fr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-hr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-hu: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-it: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-it: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-ko: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-pl: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-ro: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-sr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-sv: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-tr: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-uk: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-vi: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-src: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-src: PKGSIZE changed from 1326020 to 1331834 (+0%)
packages/core2-64-poky-linux/xz/xz-src: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz-staticdev: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz-staticdev: PV changed from "5.4.4" to "5.4.5"
packages/core2-64-poky-linux/xz/xz: PKGV changed from 5.4.4 [default] to 5.4.5 [default]
packages/core2-64-poky-linux/xz/xz: PV changed from "5.4.4" to "5.4.5"
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.4.4 to liblzma.so.5.4.5
  /usr/lib/liblzma.so.5.4.4 moved to /usr/lib/liblzma.so.5.4.5

--===============4534794443257554013==--

