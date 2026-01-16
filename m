Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BDCD4A5EB
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1437.1768526749272694186
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=drO+98IK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SRfbGd4N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019bc468b28d-15aebdcc-562c-479c-b101-227c9ea7e6fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q/rcuCkSPkz7r+2wh2vHD4sRVQ60dde6uj2EZ4q6oKM=;
	b=drO+98IKX/MuYHd9notqe0Kt1KppY0lIT5xw8B3crJ33ECHFabMZoxpmj4LmtWtn
	n/+tChrkaH0/y9ee10KDdCZzJsoymjb4/XT5PKvNhOvdUCqZpeuvhAQwgUd/iyrfkvz
	uJzertPRYG4JeEzZqcXwH3Zoxpv5+SYb99nvMDiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q/rcuCkSPkz7r+2wh2vHD4sRVQ60dde6uj2EZ4q6oKM=;
	b=SRfbGd4N0zzfIasIe2cATQ8ltIujLZuuXAdY9Oqao9E8AY46fP4QoHHTehL/R3oT
	GNZeTFNG1DjZFMKrPB35hvigf/qVrd2qNcwk9drbka8rQcoknQNuEx8q3YZIH3B7u+u
	5ztvHE4X+B60/5Aa+IUVt0/RJsH9wzjhCdPqqKgM=
Content-Type: multipart/mixed; boundary="===============2931011517264592054=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] harfbuzz: upgrading to 12.3.0 SUCCEEDED
Message-ID: <0101019bc468b28d-15aebdcc-562c-479c-b101-227c9ea7e6fa-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229491

--===============2931011517264592054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *12.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-12.2.0-12.3.0.patch
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
From 09398a6702daefcc2bddea9ef50db7bb8f5c34ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 23:38:46 +0000
Subject: [PATCH] harfbuzz: upgrade 12.2.0 -> 12.3.0

---
 .../harfbuzz/{harfbuzz_12.2.0.bb => harfbuzz_12.3.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.2.0.bb => harfbuzz_12.3.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
index ef2f6aa4f9..d2e63f5529 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ecb603aa426a8b24665718667bda64a84c1504db7454ee4cadbd362eea64e545"
+SRC_URI[sha256sum] = "8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f28e5370c93d42b7"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============2931011517264592054==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-12.2.0-12.3.0.patch"

RnJvbSAwOTM5OGE2NzAyZGFlZmNjMmJkZGVhOWVmNTBkYjdiYjhmNWMzNGZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjM6Mzg6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxMi4yLjAgLT4gMTIuMy4wCgotLS0KIC4uLi9oYXJmYnV6ei97aGFy
ZmJ1enpfMTIuMi4wLmJiID0+IGhhcmZidXp6XzEyLjMuMC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfMTIuMi4wLmJiID0+IGhhcmZidXp6
XzEyLjMuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTIuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzEyLjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTIuMi4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTIuMy4wLmJiCmluZGV4IGVm
MmY2YWE0ZjkuLmQyZTYzZjU1MjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9o
YXJmYnV6ei9oYXJmYnV6el8xMi4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzEyLjMuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Yjk4NDI5YjhlOGUzYzJhNjdjZmVmMDFlOTllNDg5M2Qg
XAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9
L2Rvd25sb2FkLyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZWNiNjAzYWE0MjZhOGIyNDY2NTcxODY2N2JkYTY0YTg0YzE1MDRkYjc0NTRlZTRjYWRiZDM2
MmVlYTY0ZTU0NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NjYwZWJkM2MyN2Q5NDA3ZmM4NDMz
YjVkMTcyYmFmYmE1ZjAzMTdjYjBiYjQzMzlmMjhlNTM3MGM5M2Q0MmI3IgogCiBERVBFTkRTICs9
ICJnbGliLTIuMC1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============2931011517264592054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61220.0", added "/usr/lib/libharfbuzz-icu.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61220.0", added "/usr/lib/libharfbuzz-subset.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61220.0 /usr/lib/libharfbuzz-cairo.so.0.61220.0 /usr/lib/libharfbuzz.so.0.61220.0", added "/usr/lib/libharfbuzz-cairo.so.0.61230.0 /usr/lib/libharfbuzz-gobject.so.0.61230.0 /usr/lib/libharfbuzz.so.0.61230.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61220.0 to libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61220.0 to libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61220.0 to libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61220.0 to libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61220.0 to libharfbuzz-subset.so.0.61230.0
  /usr/lib/libharfbuzz-cairo.so.0.61220.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0.61220.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0.61220.0 moved to /usr/lib/libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0.61220.0 moved to /usr/lib/libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0.61220.0 moved to /usr/lib/libharfbuzz-subset.so.0.61230.0

--===============2931011517264592054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 83377152 to 83020392 (-0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-icu.so.0.61220.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61220.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61220.0 /usr/lib/.debug/libharfbuzz.so.0.61220.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61220.0", added "/usr/lib/.debug/libharfbuzz-gobject.so.0.61230.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61230.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61230.0 /usr/lib/.debug/libharfbuzz.so.0.61230.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1809164 to 1809161 (-0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61220.0", added "/usr/lib/libharfbuzz-icu.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5171276 to 5175889 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/graph -> /usr/src/debug/harfbuzz/12.3.0/src/graph, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/G
 DEF, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/12.2.0/src -> /usr/src/debug/harfbuzz/12.3.0/src, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/glyf -> /usr/src/debug/harfbuzz/12.3.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/12.2.0/util -> /usr/src/debug/harfbuzz/12.3.0/util, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/name -> /usr/src/debug/harfbuzz/12.3.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/12.2.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/12.3.0/src/OT/Color/svg
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1042591 to 1030303 (-1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61220.0", added "/usr/lib/libharfbuzz-subset.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1242462 to 1234270 (-1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61220.0 /usr/lib/libharfbuzz-cairo.so.0.61220.0 /usr/lib/libharfbuzz-gobject.so.0.61220.0", added "/usr/lib/libharfbuzz-cairo.so.0.61230.0 /usr/lib/libharfbuzz.so.0.61230.0 /usr/lib/libharfbuzz-gobject.so.0.61230.0"
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "12.2.0" to "12.3.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/12.2.0/harfbuzz-12.2.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/12.3.0/harfbuzz-12.3.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 12.2.0 [default] to 12.3.0 [default]
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61220.0 to libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61220.0 to libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61220.0 to libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61220.0 to libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61220.0 to libharfbuzz-subset.so.0.61230.0
  /usr/lib/libharfbuzz-cairo.so.0.61220.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61230.0
  /usr/lib/libharfbuzz-gobject.so.0.61220.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61230.0
  /usr/lib/libharfbuzz-icu.so.0.61220.0 moved to /usr/lib/libharfbuzz-icu.so.0.61230.0
  /usr/lib/libharfbuzz.so.0.61220.0 moved to /usr/lib/libharfbuzz.so.0.61230.0
  /usr/lib/libharfbuzz-subset.so.0.61220.0 moved to /usr/lib/libharfbuzz-subset.so.0.61230.0

--===============2931011517264592054==--

