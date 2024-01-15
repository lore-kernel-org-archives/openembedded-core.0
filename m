Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76D6C47DD7
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.88278.1705340029588139260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N3CQ6oTe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=APIz4WYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fcfc3-4a1457a0-8fb8-4a5e-bbf8-477e76932419-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ddfh+I758WkBbA5n6FC3Ska45WeteuaXg2FKHsQ2M/A=;
	b=N3CQ6oTecFmjDJRlApBwL6XLE2o1AMKj5S4cKIXs9UO0bLsZXXPphRzi5XCk+A7f
	XO569PaeAYxDrH8eXB1XPnElZLiJpfhKmQUxRKmVdMgH3bzZrVfWL7I7G+O+HeGLjEB
	M4TZoeCmpZXXnz8rr656LpqmzvSiQSMkxKJHyR+M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ddfh+I758WkBbA5n6FC3Ska45WeteuaXg2FKHsQ2M/A=;
	b=APIz4WYDkI/B3OI4K67zPD3Wf0Np2pUbXZXvp8X0wJIbjUfZ4br/bggQz4UIhbWJ
	Xv0sAjF9t8nmFBI1/3nbXshfJGW+Y5dFNTUhLqm0akIZkfygh2ytmlZE+y9epq+Ff04
	nWZj+iGkIJYvfAHRuckM9FBWdQb1Pywl3q4HksE4=
Content-Type: multipart/mixed; boundary="===============6303919692632011454=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.32.4 SUCCEEDED
Message-ID: <0101018d0e2fcfc3-4a1457a0-8fb8-4a5e-bbf8-477e76932419-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193776

--===============6303919692632011454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.32.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.32.3-1.32.4.patch
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
From 37c01a4e0d42f57fa2dc15eb9d8ae60043a95ff4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 13:34:56 +0000
Subject: [PATCH] mpg123: upgrade 1.32.3 -> 1.32.4

---
 .../mpg123/{mpg123_1.32.3.bb => mpg123_1.32.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.3.bb => mpg123_1.32.4.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
index 3ea68b12a8..8c6101fee8 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4"
+SRC_URI[sha256sum] = "5a99664338fb2f751b662f40ee25804d0c9db6b575dcb5ce741c6dc64224a08a"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.42.0


--===============6303919692632011454==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.32.3-1.32.4.patch"

RnJvbSAzN2MwMWE0ZTBkNDJmNTdmYTJkYzE1ZWI5ZDhhZTYwMDQzYTk1ZmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTM6MzQ6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
cGcxMjM6IHVwZ3JhZGUgMS4zMi4zIC0+IDEuMzIuNAoKLS0tCiAuLi4vbXBnMTIzL3ttcGcxMjNf
MS4zMi4zLmJiID0+IG1wZzEyM18xLjMyLjQuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9tcGcxMjMve21wZzEyM18xLjMyLjMuYmIgPT4gbXBnMTIzXzEuMzIu
NC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMv
bXBnMTIzXzEuMzIuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMi40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEuMzIuNC5iYgppbmRleCAzZWE2OGIxMmE4Li44YzYx
MDFmZWU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIz
XzEuMzIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEu
MzIuNC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lN2I5YzE1ZmNmYjk4NmFiYjRjYzVl
ODQwMGEyNDE2OSIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5tcGcxMjMuZGUvZG93bmxvYWQv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZDk5MTNhNTdkNGVlOGY0OTdh
MTgyYzZlODI1ODI2MDI0MDk3ODJhNGZiNDgxZTk4OWZlZWJmNDQzNTg2N2I0IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjVhOTk2NjQzMzhmYjJmNzUxYjY2MmY0MGVlMjU4MDRkMGM5ZGI2YjU3NWRj
YjVjZTc0MWM2ZGM2NDIyNGEwOGEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm1wZzEyMy0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi40Mi4wCgo=

--===============6303919692632011454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.48.1 /usr/lib/libsyn123.so.0.2.2 /usr/lib/libout123.so.0.5.0", added "/usr/lib/libmpg123.so.0.48.2 /usr/lib/libout123.so.0.5.1 /usr/lib/libsyn123.so.0.2.3"
Changes to packages/core2-64-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.48.1 to libmpg123.so.0.48.2
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.48.1 to libmpg123.so.0.48.2
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.5.0 to libout123.so.0.5.1
  /usr/lib/libout123.so changed symlink target from libout123.so.0.5.0 to libout123.so.0.5.1
  /usr/lib/libsyn123.so.0 changed symlink target from libsyn123.so.0.2.2 to libsyn123.so.0.2.3
  /usr/lib/libsyn123.so changed symlink target from libsyn123.so.0.2.2 to libsyn123.so.0.2.3
  /usr/lib/libmpg123.so.0.48.1 moved to /usr/lib/libmpg123.so.0.48.2
  /usr/lib/libout123.so.0.5.0 moved to /usr/lib/libout123.so.0.5.1
  /usr/lib/libsyn123.so.0.2.2 moved to /usr/lib/libsyn123.so.0.2.3

--===============6303919692632011454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mpg123: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.32.3.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.32.4.tar.bz2"
packages/core2-64-poky-linux/mpg123: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2301544 to 2302520 (+0%)
packages/core2-64-poky-linux/mpg123/mpg123-dbg: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123-dbg: FILELIST: removed "/usr/lib/.debug/libmpg123.so.0.48.1 /usr/lib/.debug/libout123.so.0.5.0 /usr/lib/.debug/libsyn123.so.0.2.2", added "/usr/lib/.debug/libmpg123.so.0.48.2 /usr/lib/.debug/libout123.so.0.5.1 /usr/lib/.debug/libsyn123.so.0.2.3"
packages/core2-64-poky-linux/mpg123/mpg123-dev: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123-doc: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123-locale: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1902858 to 1903721 (+0%)
packages/core2-64-poky-linux/mpg123/mpg123-src: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123/mpg123-src: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123-src: FILELIST: directory renamed /usr/src/debug/mpg123/1.32.3/src -> /usr/src/debug/mpg123/1.32.4/src, directory renamed /usr/src/debug/mpg123/1.32.3/src/compat -> /usr/src/debug/mpg123/1.32.4/src/compat, directory renamed /usr/src/debug/mpg123/1.32.3/src/libout123/modules -> /usr/src/debug/mpg123/1.32.4/src/libout123/modules, removed "/usr/src/debug/mpg123/1.32.3/src/libmpg123/newhuffman.h /usr/src/debug/mpg123/1.32.3/src/libout123/stringlists.h /usr/src/debug/mpg123/1.32.3/src/libout123/wav.h /usr/src/debug/mpg123/1.32.3/src/libout123/stringlists.c /usr/src/debug/mpg123/1.32.3/src/libout123/wav.c /usr/src/debug/mpg123/1.32.3/src/libsyn123/syn123_int.h /usr/src/debug/mpg123/1.32.3/src/libout123/out123_int.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/dct64.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/frame.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/index.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/parse.c /usr/src/debug/mpg123/1.32.3/src/
 libmpg123/synth.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/index.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/parse.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/synth.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/frame.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/feature.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/stringbuf.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/getbits.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/dither_impl.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/icy2utf8.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/synth_ntom.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/synth_mono.h /usr/src/debug/mpg123/1.32.3/src/libsyn123/libsyn123.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/icy2utf8.c /usr/src/debug/mpg123/1.32.3/src/libout123/module.c /usr/src/debug/mpg123/1.32.3/src/libsyn123/volume.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/decode.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/sample.h /usr/src/debug/mpg123/1.32.3/src/libout123/module.h /usr/src/debug/mpg123/
 1.32.3/src/libsyn123/sampleconv.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/libmpg123.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/l3tabs.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/synth_real.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/synths.h /usr/src/debug/mpg123/1.32.3/src/libout123/wavhead.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/swap_bytes_impl.h /usr/src/debug/mpg123/1.32.3/src/libout123/xfermem.c /usr/src/debug/mpg123/1.32.3/src/libsyn123/pinknoise.c /usr/src/debug/mpg123/1.32.3/src/libout123/xfermem.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/fmt123.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/getcpuflags.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/mpg123.h /usr/src/debug/mpg123/1.32.3/src/libout123/out123.h /usr/src/debug/mpg123/1.32.3/src/libsyn123/syn123.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/layer3.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/id3.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/icy.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/mpg123lib_inter
 n.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/icy.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/id3.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/equalizer.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/lfs_wrap.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/readers.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/lfs_wrap.c /usr/src/debug/mpg123/1.32.3/src/libout123/hextxt.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/layer1.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/format.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/ntom.c /usr/src/debug/mpg123/1.32.3/src/libout123/hextxt.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/dither.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/reader.h /usr/src/debug/mpg123/1.32.3/src/libout123/buffer.h /usr/src/debug/mpg123/1.32.3/src/libsyn123/geiger.c /usr/src/debug/mpg123/1.32.3/src/libout123/buffer.c /usr/src/debug/mpg123/1.32.3/src/libsyn123/filter.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/l3bandgain.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/costabs.h 
 /usr/src/debug/mpg123/1.32.3/src/libmpg123/l12tabs.h /usr/src/debug/mpg123/1.32.3/src/libsyn123/resample.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/layer2.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/synth_8bit.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/synth_s32.c /usr/src/debug/mpg123/1.32.3/src/libout123/libout123.c /usr/src/debug/mpg123/1.32.3/src/libsyn123/g711_impl.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/gapless.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/optimize.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/tabinit.c /usr/src/debug/mpg123/1.32.3/src/libmpg123/l2tables.h /usr/src/debug/mpg123/1.32.3/src/libmpg123/optimize.c", added "/usr/src/debug/mpg123/1.32.4/src/libmpg123/newhuffman.h /usr/src/debug/mpg123/1.32.4/src/libout123/stringlists.h /usr/src/debug/mpg123/1.32.4/src/libout123/wav.h /usr/src/debug/mpg123/1.32.4/src/libout123/stringlists.c /usr/src/debug/mpg123/1.32.4/src/libout123/wav.c /usr/src/debug/mpg123/1.32.4/src/libsyn123/syn123_int.h /usr/src/debug/m
 pg123/1.32.4/src/libout123/out123_int.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/dct64.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/frame.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/index.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/parse.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/synth.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/index.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/parse.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/synth.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/frame.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/feature.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/stringbuf.c /usr/src/debug/mpg123/1.32.4/src/common/sample.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/getbits.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/dither_impl.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/icy2utf8.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/synth_ntom.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/synth_mono.h /usr/src/debug/mpg123/1.32.4/src/libsyn123/libsyn123.c /usr/src/d
 ebug/mpg123/1.32.4/src/libmpg123/icy2utf8.c /usr/src/debug/mpg123/1.32.4/src/libout123/module.c /usr/src/debug/mpg123/1.32.4/src/libsyn123/volume.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/decode.h /usr/src/debug/mpg123/1.32.4/src/libout123/module.h /usr/src/debug/mpg123/1.32.4/src/libsyn123/sampleconv.c /usr/src/debug/mpg123/1.32.4/src/common/swap_bytes_impl.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/libmpg123.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/l3tabs.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/synth_real.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/synths.h /usr/src/debug/mpg123/1.32.4/src/include/mpg123.h /usr/src/debug/mpg123/1.32.4/src/include/out123.h /usr/src/debug/mpg123/1.32.4/src/include/syn123.h /usr/src/debug/mpg123/1.32.4/src/libout123/wavhead.h /usr/src/debug/mpg123/1.32.4/src/libout123/xfermem.c /usr/src/debug/mpg123/1.32.4/src/libsyn123/pinknoise.c /usr/src/debug/mpg123/1.32.4/src/libout123/xfermem.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/getcpufla
 gs.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/layer3.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/id3.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/icy.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/mpg123lib_intern.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/icy.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/id3.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/equalizer.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/lfs_wrap.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/readers.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/lfs_wrap.c /usr/src/debug/mpg123/1.32.4/src/libout123/hextxt.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/layer1.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/format.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/ntom.c /usr/src/debug/mpg123/1.32.4/src/libout123/hextxt.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/dither.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/reader.h /usr/src/debug/mpg123/1.32.4/src/libout123/buffer.h /usr/src/debug/mpg123/1.32.4/src/libsyn123/geiger.c 
 /usr/src/debug/mpg123/1.32.4/src/libout123/buffer.c /usr/src/debug/mpg123/1.32.4/src/libsyn123/filter.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/l3bandgain.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/costabs.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/l12tabs.h /usr/src/debug/mpg123/1.32.4/src/libsyn123/resample.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/layer2.c /usr/src/debug/mpg123/1.32.4/src/libmpg123/synth_8bit.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/synth_s32.c /usr/src/debug/mpg123/1.32.4/src/libout123/libout123.c /usr/src/debug/mpg123/1.32.4/src/libsyn123/g711_impl.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/gapless.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/optimize.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/tabinit.c /usr/src/debug/mpg123/1.32.4/src/include/fmt123.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/l2tables.h /usr/src/debug/mpg123/1.32.4/src/libmpg123/optimize.c"
packages/core2-64-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123: PKGSIZE changed from 994207 to 994255 (+0%)
packages/core2-64-poky-linux/mpg123/mpg123: PV changed from "1.32.3" to "1.32.4"
packages/core2-64-poky-linux/mpg123/mpg123: PKGV changed from 1.32.3 [default] to 1.32.4 [default]
packages/core2-64-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.48.1 /usr/lib/libsyn123.so.0.2.2 /usr/lib/libout123.so.0.5.0", added "/usr/lib/libout123.so.0.5.1 /usr/lib/libsyn123.so.0.2.3 /usr/lib/libmpg123.so.0.48.2"
Changes to packages/core2-64-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.48.1 to libmpg123.so.0.48.2
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.48.1 to libmpg123.so.0.48.2
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.5.0 to libout123.so.0.5.1
  /usr/lib/libout123.so changed symlink target from libout123.so.0.5.0 to libout123.so.0.5.1
  /usr/lib/libsyn123.so.0 changed symlink target from libsyn123.so.0.2.2 to libsyn123.so.0.2.3
  /usr/lib/libsyn123.so changed symlink target from libsyn123.so.0.2.2 to libsyn123.so.0.2.3
  /usr/lib/libmpg123.so.0.48.1 moved to /usr/lib/libmpg123.so.0.48.2
  /usr/lib/libout123.so.0.5.0 moved to /usr/lib/libout123.so.0.5.1
  /usr/lib/libsyn123.so.0.2.2 moved to /usr/lib/libsyn123.so.0.2.3

--===============6303919692632011454==--

