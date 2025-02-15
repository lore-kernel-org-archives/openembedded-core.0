Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7276DC021B7
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8060.1739623335830717786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LNZCt9xg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=b2407Ybu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019509a184a3-8f4370fa-f24b-406c-bac7-057a9b84664f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RWm1iVh+SduRZd30idccLbEWowb1aVHfBBvf8lPEYvk=;
	b=LNZCt9xgzixe+CDC3jBQQg3IcB2gzZBgjdIbFXN7BGl69PHxGYAkIEaYFBC4L8vf
	HgxZT6xfL6QkKN+yMocWQ+zJx5xYlb2LSORM5HRfNaTFPaZwd2XqXtvIRwNRZSU1mdL
	3EZKgwEqDxrSyj2UzS5Ot+7drf+b0gcabq5c/EAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RWm1iVh+SduRZd30idccLbEWowb1aVHfBBvf8lPEYvk=;
	b=b2407Ybu6J097LuJgRYoBJlVOfqmfRJGT1doeFe8x78zTSVSAKuTGiq3zS3ClSoQ
	Md0hcug4XJpKkdFnKnsoJJv+Im5ohU5DxNbdq7GygHLHNmBOOECq4Eaarxwo0RAuCQ+
	k5dOzotpAshx6g5BRHNZ3ckzgN3GKWhILAwfVu/A=
Content-Type: multipart/mixed; boundary="===============0412527181293152665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] erofs-utils: upgrading to 1.8.5 SUCCEEDED
Message-ID: <0101019509a184a3-8f4370fa-f24b-406c-bac7-057a9b84664f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211415

--===============0412527181293152665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.8.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.8.4-1.8.5.patch
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
From 3311838964e0371b019b88320f176c1f9ea7f7e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:16:59 +0000
Subject: [PATCH] erofs-utils: upgrade 1.8.4 -> 1.8.5

---
 .../erofs-utils/{erofs-utils_1.8.4.bb => erofs-utils_1.8.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.4.bb => erofs-utils_1.8.5.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
index ba06e7019d..54ead294fb 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "b4b93c26c7e8e771af93627f02791818e7c78f6c"
+SRCREV = "7bc147fafd53a2a9ff7c22399491079e5bfffafc"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.44.1


--===============0412527181293152665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.8.4" to "1.8.5"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 1778376 to 2060328 (+16%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.8.4" to "1.8.5"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.8.4" to "1.8.5"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 12349 to 13129 (+6%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.8.4" to "1.8.5"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: FILELIST: directory renamed /usr/src/debug/erofs-utils/1.8.4/dump -> /usr/src/debug/erofs-utils/1.8.5/dump, directory renamed /usr/src/debug/erofs-utils/1.8.4/include -> /usr/src/debug/erofs-utils/1.8.5/include, directory renamed /usr/src/debug/erofs-utils/1.8.4/fsck -> /usr/src/debug/erofs-utils/1.8.5/fsck, directory renamed /usr/src/debug/erofs-utils/1.8.4/mkfs -> /usr/src/debug/erofs-utils/1.8.5/mkfs, directory renamed /usr/src/debug/erofs-utils/1.8.4/lib -> /usr/src/debug/erofs-utils/1.8.5/lib, removed "/usr/src/debug/erofs-utils/1.8.4/include/erofs/cache.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/xattr.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/config.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/hashtable.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/io.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.8.
 4/include/erofs/internal.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/diskbuf.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/atomic.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/tar.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/dedupe.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/list.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/flex-array.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/defs.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/compress_hints.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/fragments.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/inode.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/dir.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/rebuild.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/compress.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/print.h /usr/src/debug/erofs-utils/1.8.4/include/erofs/err.h /usr/src/
 debug/erofs-utils/1.8.4/include/erofs/hashmap.h", added "/usr/src/debug/erofs-utils/1.8.5/include/erofs/cache.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/xattr.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/config.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/hashtable.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/io.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/internal.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/diskbuf.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/atomic.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/tar.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/bitops.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/dedupe.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/list.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/flex-array.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/defs.h /usr/src/debug/erofs-utils/1.8.5/include
 /erofs/compress_hints.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/fragments.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/inode.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/dir.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/rebuild.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/compress.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/print.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/err.h /usr/src/debug/erofs-utils/1.8.5/include/erofs/hashmap.h"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.8.4" to "1.8.5"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 562765 to 571068 (+1%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.8.4" to "1.8.5"
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PV changed from "1.8.4" to "1.8.5"
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 460120 to 529960 (+15%)
packages/core2-64-poky-linux/erofs-utils: PKGV changed from 1.8.4 [default] to 1.8.5 [default]
packages/core2-64-poky-linux/erofs-utils: PV changed from "1.8.4" to "1.8.5"

--===============0412527181293152665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.8.4-1.8.5.patch"

RnJvbSAzMzExODM4OTY0ZTAzNzFiMDE5Yjg4MzIwZjE3NmMxZjllYTdmN2U5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6MTY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjguNCAtPiAxLjguNQoKLS0tCiAuLi4vZXJvZnMtdXRpbHMv
e2Vyb2ZzLXV0aWxzXzEuOC40LmJiID0+IGVyb2ZzLXV0aWxzXzEuOC41LmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMve2Vyb2ZzLXV0aWxzXzEuOC40LmJiID0+IGVy
b2ZzLXV0aWxzXzEuOC41LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRp
bHNfMS44LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9l
cm9mcy11dGlsc18xLjguNS5iYgppbmRleCBiYTA2ZTcwMTlkLi41NGVhZDI5NGZiIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS44LjQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEu
OC41LmJiCkBAIC01LDcgKzUsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT03MzAwMWQ4MDRlYTFlM2Q4NDM2NWY2NTIyNDJjY2EyMCIK
IEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdC90cmVlL1JFQURNRSIKIAotU1JDUkVWID0gImI0Yjkz
YzI2YzdlOGU3NzFhZjkzNjI3ZjAyNzkxODE4ZTdjNzhmNmMiCitTUkNSRVYgPSAiN2JjMTQ3ZmFm
ZDUzYTJhOWZmN2MyMjM5OTQ5MTA3OWU1YmZmZmFmYyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdDti
cmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdF
WCA9ICJ2KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCi0tIAoyLjQ0LjEKCg==

--===============0412527181293152665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 1778376 to 2060328 (+16%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 460120 to 529960 (+15%)

--===============0412527181293152665==--

