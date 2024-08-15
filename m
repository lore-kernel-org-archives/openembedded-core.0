Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9B4C54753
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.131425.1723748334195889716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MIO3EtsS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XSjEHWov;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191576837df-757b5904-d4ad-4292-a80f-bc988b2422ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yBiJHKf0Nf7owckRYuxKWFG21hE6xGigbtS6YkeY8No=;
	b=MIO3EtsSGg9JiknyRnj6MTh8vhbki0PnbA4zMvH4jfFpblPwAYS/ema9FaP/XhAZ
	jCKGUIyYskWuhIik5JKx9CNSNPYdz69k9OsY9pN2cS5GyCTL1T8WzPMuGHe9siAN7+e
	RvDcSmCO8fcYP4jz3M37zmxdpEcCkNt66j9aQB5M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yBiJHKf0Nf7owckRYuxKWFG21hE6xGigbtS6YkeY8No=;
	b=XSjEHWovPwOcBJ5oCm7gs0gtUk8DsdK0R0vRtrYL8l1Xf7s+E/px0XQJEShraTPO
	UgoZ7ifPmzTe/KleGq9QKfl1mXDLzFNNm3zSW+g5Zaj5xJCXq9T6ekd9VNTiqpIYMUX
	niUsf6rZcOW/uOzC2tuQmFfpZwA67Vm6IqywUaFk=
Content-Type: multipart/mixed; boundary="===============1437196384029790913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] erofs-utils: upgrading to 1.8.1 SUCCEEDED
Message-ID: <01010191576837df-757b5904-d4ad-4292-a80f-bc988b2422ea-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203365

--===============1437196384029790913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.7.1-1.8.1.patch
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
From 4056601b19b2dc7604bd5b439e1473893c622041 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 10:12:56 +0000
Subject: [PATCH] erofs-utils: upgrade 1.7.1 -> 1.8.1

---
 .../erofs-utils/{erofs-utils_1.7.1.bb => erofs-utils_1.8.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.7.1.bb => erofs-utils_1.8.1.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
index a23cb330ea..50d6e3b38e 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "83d94dc619075e71ca4d0f42941cfc18d269a2af"
+SRCREV = "ddbed14463fb798eff71fd4d4395357eb598e175"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.44.0


--===============1437196384029790913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 1407656 to 1640392 (+17%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 10023 to 11696 (+17%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 499100 to 554033 (+11%)

--===============1437196384029790913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 1407656 to 1640392 (+17%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.7.1" to "1.8.1"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.7.1" to "1.8.1"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 10023 to 11696 (+17%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.7.1" to "1.8.1"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.7.1" to "1.8.1"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: FILELIST: directory renamed /usr/src/debug/erofs-utils/1.7.1/fsck -> /usr/src/debug/erofs-utils/1.8.1/fsck, directory renamed /usr/src/debug/erofs-utils/1.7.1/mkfs -> /usr/src/debug/erofs-utils/1.8.1/mkfs, directory renamed /usr/src/debug/erofs-utils/1.7.1/include -> /usr/src/debug/erofs-utils/1.8.1/include, directory renamed /usr/src/debug/erofs-utils/1.7.1/dump -> /usr/src/debug/erofs-utils/1.8.1/dump, removed "/usr/src/debug/erofs-utils/1.7.1/include/erofs/dedupe.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/tar.h /usr/src/debug/erofs-utils/1.7.1/lib/fragments.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/xxhash.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/diskbuf.h /usr/src/debug/erofs-utils/1.7.1/lib/compress.c /usr/src/debug/erofs-utils/1.7.1/lib/liberofs_uuid.h /usr/src/debug/erofs-utils/1.7.1/lib/kite_deflate.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.7.1/lib/nam
 ei.c /usr/src/debug/erofs-utils/1.7.1/lib/rebuild.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/compress_hints.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/flex-array.h /usr/src/debug/erofs-utils/1.7.1/lib/inode.c /usr/src/debug/erofs-utils/1.7.1/lib/compressor_lz4hc.c /usr/src/debug/erofs-utils/1.7.1/lib/rb_tree.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/compress.h /usr/src/debug/erofs-utils/1.7.1/lib/compressor_lz4.c /usr/src/debug/erofs-utils/1.7.1/lib/rb_tree.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/config.h /usr/src/debug/erofs-utils/1.7.1/lib/config.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/err.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/rebuild.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/cache.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/print.h /usr/src/debug/erofs-utils/1.7.1/lib/io.c /usr/src/debug/erofs-utils/1.7.1/
 lib/uuid_unparse.c /usr/src/debug/erofs-utils/1.7.1/lib/dir.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.7.1/lib/tar.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/defs.h /usr/src/debug/erofs-utils/1.7.1/lib/compressor.c /usr/src/debug/erofs-utils/1.7.1/lib/compressor_deflate.c /usr/src/debug/erofs-utils/1.7.1/lib/exclude.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/dir.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/io.h /usr/src/debug/erofs-utils/1.7.1/lib/uuid.c /usr/src/debug/erofs-utils/1.7.1/lib/compressor.h /usr/src/debug/erofs-utils/1.7.1/lib/data.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/xattr.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/inode.h /usr/src/debug/erofs-utils/1.7.1/lib/xxhash.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/fragments.h /usr/src/debug/erofs-utils/1.7.1/lib/xattr.c /usr/src/debug/erofs-utils/1.7.1/lib/rolling_hash.h /usr/src/debug/erofs-utils/1.7.1/lib/compress_hints.c /usr/src/debug
 /erofs-utils/1.7.1/lib/diskbuf.c /usr/src/debug/erofs-utils/1.7.1/lib/decompress.c /usr/src/debug/erofs-utils/1.7.1/lib/cache.c /usr/src/debug/erofs-utils/1.7.1/lib/hashmap.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/internal.h /usr/src/debug/erofs-utils/1.7.1/lib/super.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/hashtable.h /usr/src/debug/erofs-utils/1.7.1/lib/blobchunk.c /usr/src/debug/erofs-utils/1.7.1/lib/block_list.c /usr/src/debug/erofs-utils/1.7.1/lib/sha256.h /usr/src/debug/erofs-utils/1.7.1/lib/zmap.c /usr/src/debug/erofs-utils/1.7.1/include/erofs/hashmap.h /usr/src/debug/erofs-utils/1.7.1/include/erofs/list.h /usr/src/debug/erofs-utils/1.7.1/lib/sha256.c /usr/src/debug/erofs-utils/1.7.1/lib/dedupe.c", added "/usr/src/debug/erofs-utils/1.8.1/include/erofs/dedupe.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/tar.h /usr/src/debug/erofs-utils/1.8.1/lib/fragments.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/diskbuf.h /usr/src/debug/erofs-utils/1.8.1/lib/compres
 s.c /usr/src/debug/erofs-utils/1.8.1/lib/liberofs_uuid.h /usr/src/debug/erofs-utils/1.8.1/lib/kite_deflate.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.8.1/lib/namei.c /usr/src/debug/erofs-utils/1.8.1/lib/rebuild.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/compress_hints.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/flex-array.h /usr/src/debug/erofs-utils/1.8.1/lib/inode.c /usr/src/debug/erofs-utils/1.8.1/lib/compressor_lz4hc.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/compress.h /usr/src/debug/erofs-utils/1.8.1/lib/compressor_lz4.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/config.h /usr/src/debug/erofs-utils/1.8.1/lib/config.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/err.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/rebuild.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/cache.h /usr/src/debug/e
 rofs-utils/1.8.1/include/erofs/print.h /usr/src/debug/erofs-utils/1.8.1/lib/io.c /usr/src/debug/erofs-utils/1.8.1/lib/uuid_unparse.c /usr/src/debug/erofs-utils/1.8.1/lib/dir.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.8.1/lib/tar.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/defs.h /usr/src/debug/erofs-utils/1.8.1/lib/compressor.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/atomic.h /usr/src/debug/erofs-utils/1.8.1/lib/compressor_deflate.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/dir.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/io.h /usr/src/debug/erofs-utils/1.8.1/lib/exclude.c /usr/src/debug/erofs-utils/1.8.1/lib/compressor.h /usr/src/debug/erofs-utils/1.8.1/lib/data.c /usr/src/debug/erofs-utils/1.8.1/lib/uuid.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/xattr.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/inode.h /usr/src/debug/erofs-utils/1.8.1/lib/xxhash.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/fragmen
 ts.h /usr/src/debug/erofs-utils/1.8.1/lib/xattr.c /usr/src/debug/erofs-utils/1.8.1/lib/rolling_hash.h /usr/src/debug/erofs-utils/1.8.1/lib/compress_hints.c /usr/src/debug/erofs-utils/1.8.1/lib/diskbuf.c /usr/src/debug/erofs-utils/1.8.1/lib/decompress.c /usr/src/debug/erofs-utils/1.8.1/lib/cache.c /usr/src/debug/erofs-utils/1.8.1/lib/hashmap.c /usr/src/debug/erofs-utils/1.8.1/lib/xxhash.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/internal.h /usr/src/debug/erofs-utils/1.8.1/lib/super.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/hashtable.h /usr/src/debug/erofs-utils/1.8.1/lib/blobchunk.c /usr/src/debug/erofs-utils/1.8.1/lib/block_list.c /usr/src/debug/erofs-utils/1.8.1/lib/sha256.h /usr/src/debug/erofs-utils/1.8.1/lib/zmap.c /usr/src/debug/erofs-utils/1.8.1/include/erofs/hashmap.h /usr/src/debug/erofs-utils/1.8.1/include/erofs/list.h /usr/src/debug/erofs-utils/1.8.1/lib/sha256.c /usr/src/debug/erofs-utils/1.8.1/lib/dedupe.c"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 499100 to 554033 (+11%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.7.1" to "1.8.1"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.7.1" to "1.8.1"
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 419056 to 455896 (+9%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PV changed from "1.7.1" to "1.8.1"
packages/core2-64-poky-linux/erofs-utils: PKGV changed from 1.7.1 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/erofs-utils: PV changed from "1.7.1" to "1.8.1"

--===============1437196384029790913==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.7.1-1.8.1.patch"

RnJvbSA0MDU2NjAxYjE5YjJkYzc2MDRiZDViNDM5ZTE0NzM4OTNjNjIyMDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTA6MTI6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjcuMSAtPiAxLjguMQoKLS0tCiAuLi4vZXJvZnMtdXRpbHMv
e2Vyb2ZzLXV0aWxzXzEuNy4xLmJiID0+IGVyb2ZzLXV0aWxzXzEuOC4xLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMve2Vyb2ZzLXV0aWxzXzEuNy4xLmJiID0+IGVy
b2ZzLXV0aWxzXzEuOC4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjcuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRp
bHNfMS43LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9l
cm9mcy11dGlsc18xLjguMS5iYgppbmRleCBhMjNjYjMzMGVhLi41MGQ2ZTNiMzhlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS43LjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEu
OC4xLmJiCkBAIC01LDcgKzUsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT03MzAwMWQ4MDRlYTFlM2Q4NDM2NWY2NTIyNDJjY2EyMCIK
IEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdC90cmVlL1JFQURNRSIKIAotU1JDUkVWID0gIjgzZDk0
ZGM2MTkwNzVlNzFjYTRkMGY0Mjk0MWNmYzE4ZDI2OWEyYWYiCitTUkNSRVYgPSAiZGRiZWQxNDQ2
M2ZiNzk4ZWZmNzFmZDRkNDM5NTM1N2ViNTk4ZTE3NSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdDti
cmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdF
WCA9ICJ2KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCi0tIAoyLjQ0LjAKCg==

--===============1437196384029790913==--

