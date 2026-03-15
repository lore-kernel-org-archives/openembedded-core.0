Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB56DC5DF77
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28802.1773582117100608337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=anda1NnP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ig8YYchk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019cf1bb665f-3eb9fa43-3d0f-4dec-bd92-3b2332f6e9f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WSD/jZJ0NqvO8c1V8RXYp2Ec4wDQToxkGnvsBd3VdqQ=;
	b=anda1NnP4aGNwMA++JaK73FiDmhEWWiHUMmS3ae89VgDqKY6PWMKxjmJApbyZiBa
	VR3mbkx5QRiYKMplL0pZ74UN6HRZaTnd/GVaJpGF0D3NXvVCUzcOTiigz+AbqUg8BDe
	v/uRhOzil+kDtywEwo6pTiqNJwlzi8ozN/68MwVM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WSD/jZJ0NqvO8c1V8RXYp2Ec4wDQToxkGnvsBd3VdqQ=;
	b=ig8YYchkqZPAhiBgrfRFC1zoZ01xNXjkgr5JAsKBxm9OqKlKSGOECTK08MqIf5jP
	TRjHE4Ia2LxbK8xh8E9mEMBs4X2ziNUxBOYB0PWEJz7t5ypdsS5rmz8fk/TMGfFmqhJ
	VmcJ5qvsJCAhtWo0r0VABpBK91G9RZVDojFHRAGM=
Content-Type: multipart/mixed; boundary="===============7856275162483669509=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] erofs-utils: upgrading to 1.9.1 SUCCEEDED
Message-ID: <0101019cf1bb665f-3eb9fa43-3d0f-4dec-bd92-3b2332f6e9f7-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233139

--===============7856275162483669509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.8.10-1.9.1.patch
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
From ab75b345bf6dd05791a7c325be7c7f87bad09f6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 07:30:39 +0000
Subject: [PATCH] erofs-utils: upgrade 1.8.10 -> 1.9.1

---
 .../erofs-utils/{erofs-utils_1.8.10.bb => erofs-utils_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.10.bb => erofs-utils_1.9.1.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
index 3964ed8f5a..85ef13b7a1 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "51b5939b5f783221310d25146e6a2019ba8129b6"
+SRCREV = "d3fbccba6e409c100843563b416c47cd82c87ca0"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============7856275162483669509==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.8.10-1.9.1.patch"

RnJvbSBhYjc1YjM0NWJmNmRkMDU3OTFhN2MzMjViZTdjN2Y4N2JhZDA5ZjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDc6MzA6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjguMTAgLT4gMS45LjEKCi0tLQogLi4uL2Vyb2ZzLXV0aWxz
L3tlcm9mcy11dGlsc18xLjguMTAuYmIgPT4gZXJvZnMtdXRpbHNfMS45LjEuYmJ9IHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL3tlcm9mcy11dGlsc18xLjguMTAuYmIgPT4g
ZXJvZnMtdXRpbHNfMS45LjEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOC4xMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjkuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMt
dXRpbHNfMS44LjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRp
bHMvZXJvZnMtdXRpbHNfMS45LjEuYmIKaW5kZXggMzk2NGVkOGY1YS4uODVlZjEzYjdhMSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEu
OC4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRp
bHNfMS45LjEuYmIKQEAgLTUsNyArNSw3IEBAIFNFQ1RJT04gPSAiYmFzZSIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTczMDAxZDgwNGVhMWUzZDg0MzY1ZjY1MjI0MmNj
YTIwIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQveGlhbmcvZXJvZnMtdXRpbHMuZ2l0L3RyZWUvUkVBRE1FIgogCi1TUkNSRVYgPSAi
NTFiNTkzOWI1Zjc4MzIyMTMxMGQyNTE0NmU2YTIwMTliYTgxMjliNiIKK1NSQ1JFViA9ICJkM2Zi
Y2NiYTZlNDA5YzEwMDg0MzU2M2I0MTZjNDdjZDgyYzg3Y2EwIgogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGlhbmcvZXJvZnMtdXRpbHMu
Z2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRB
R1JFR0VYID0gInYoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKLS0gCjIuNDcuMQoK

--===============7856275162483669509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.8.10" to "1.9.1"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 2157208 to 2653200 (+23%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: FILELIST: added "/usr/sbin/.debug/mount.erofs"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.8.10" to "1.9.1"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.8.10" to "1.9.1"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 13532 to 26007 (+92%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: FILELIST: added "/usr/share/man/man8/mount.erofs.8"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.8.10" to "1.9.1"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.8.10" to "1.9.1"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 588791 to 766826 (+30%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: FILELIST: directory renamed /usr/src/debug/erofs-utils/1.8.10/fsck -> /usr/src/debug/erofs-utils/1.9.1/mkfs, directory renamed /usr/src/debug/erofs-utils/1.8.10/include -> /usr/src/debug/erofs-utils/1.9.1/include, directory renamed /usr/src/debug/erofs-utils/1.8.10/dump -> /usr/src/debug/erofs-utils/1.9.1/fsck, directory renamed /usr/src/debug/erofs-utils/1.8.10/mkfs -> /usr/src/debug/erofs-utils/1.9.1/mount, removed "/usr/src/debug/erofs-utils/1.8.10/lib/xattr.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/err.h /usr/src/debug/erofs-utils/1.8.10/lib/dedupe.c /usr/src/debug/erofs-utils/1.8.10/lib/dedupe_ext.c /usr/src/debug/erofs-utils/1.8.10/lib/config.c /usr/src/debug/erofs-utils/1.8.10/lib/liberofs_private.h /usr/src/debug/erofs-utils/1.8.10/lib/exclude.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/atomic.h /usr/src/debug/erofs-utils/1.8.10/lib/compressor_lz4hc.c /usr/src/debug/erofs-utils/1.8.10/lib/compressor.c /u
 sr/src/debug/erofs-utils/1.8.10/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.8.10/lib/bitops.c /usr/src/debug/erofs-utils/1.8.10/lib/fragments.c /usr/src/debug/erofs-utils/1.8.10/lib/compressor.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/bitops.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/flex-array.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/fragments.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/defs.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/list.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/rebuild.h /usr/src/debug/erofs-utils/1.8.10/lib/vmdk.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/dedupe.h /usr/src/debug/erofs-utils/1.8.10/lib/cache.c /usr/src/debug/erofs-utils/1.8.10/lib/liberofs_xxhash.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/dir.h /usr/src/debug/erofs-utils/1.8.10/lib/rebuild.c /usr/src/debug/erof
 s-utils/1.8.10/lib/compressor_deflate.c /usr/src/debug/erofs-utils/1.8.10/lib/super.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/hashtable.h /usr/src/debug/erofs-utils/1.8.10/lib/liberofs_uuid.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/tar.h /usr/src/debug/erofs-utils/1.8.10/lib/diskbuf.c /usr/src/debug/erofs-utils/1.8.10/lib/compress.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/hashmap.h /usr/src/debug/erofs-utils/1.8.10/lib/uuid.c /usr/src/debug/erofs-utils/1.8.10/lib/rolling_hash.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/cache.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/lock.h /usr/src/debug/erofs-utils/1.8.10/lib/data.c /usr/src/debug/erofs-utils/1.8.10/lib/sha256.h /usr/src/debug/erofs-utils/1.8.10/lib/dir.c /usr/src/debug/erofs-utils/1.8.10/lib/tar.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/compress_hints.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/compress.h /usr/src/debug/erofs-utils/1.8.10/lib/sha256.c /usr/src/debug/erofs-utils/1
 .8.10/lib/namei.c /usr/src/debug/erofs-utils/1.8.10/lib/xxhash.c /usr/src/debug/erofs-utils/1.8.10/lib/decompress.c /usr/src/debug/erofs-utils/1.8.10/lib/hashmap.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.8.10/lib/block_list.c /usr/src/debug/erofs-utils/1.8.10/lib/compress_hints.c /usr/src/debug/erofs-utils/1.8.10/lib/compressor_lz4.c /usr/src/debug/erofs-utils/1.8.10/lib/uuid_unparse.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/diskbuf.h /usr/src/debug/erofs-utils/1.8.10/lib/blobchunk.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/inode.h /usr/src/debug/erofs-utils/1.8.10/lib/zmap.c /usr/src/debug/erofs-utils/1.8.10/lib/inode.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/print.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/internal.h /usr/src/debug/erofs-utils/1.8.10/include/erofs/io.h /usr/src/debug/erofs-utils/1.8.10/lib/io.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/config.h /usr/src/debug/erofs-utils/1.8.10/li
 b/kite_deflate.c /usr/src/debug/erofs-utils/1.8.10/include/erofs/xattr.h", added "/usr/src/debug/erofs-utils/1.9.1/lib/zmap.c /usr/src/debug/erofs-utils/1.9.1/lib/namei.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/err.h /usr/src/debug/erofs-utils/1.9.1/lib/dedupe.c /usr/src/debug/erofs-utils/1.9.1/lib/block_list.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_oci.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/defs.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/list.h /usr/src/debug/erofs-utils/1.9.1/lib/io.c /usr/src/debug/erofs-utils/1.9.1/lib/xxhash.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/blobchunk.h /usr/src/debug/erofs-utils/1.9.1/lib/global.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_rebuild.h /usr/src/debug/erofs-utils/1.9.1/lib/remotes/oci.c /usr/src/debug/erofs-utils/1.9.1/lib/config.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/xattr.h /usr/src/debug/erofs-utils/1.9.1/lib/xattr.c /usr/src/debug/erofs-utils/1.9.1/lib/uuid.c /usr/src/debug/erofs-utils/
 1.9.1/lib/liberofs_cache.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/exclude.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/inode.h /usr/src/debug/erofs-utils/1.9.1/lib/compressor_lz4hc.c /usr/src/debug/erofs-utils/1.9.1/lib/compressor_lz4.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/block_list.h /usr/src/debug/erofs-utils/1.9.1/lib/compressor_deflate.c /usr/src/debug/erofs-utils/1.9.1/lib/uuid_unparse.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/config.h /usr/src/debug/erofs-utils/1.9.1/lib/data.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/decompress.h /usr/src/debug/erofs-utils/1.9.1/lib/sha256.c /usr/src/debug/erofs-utils/1.9.1/lib/sha256.h /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_fragments.h /usr/src/debug/erofs-utils/1.9.1/lib/cache.c /usr/src/debug/erofs-utils/1.9.1/lib/dedupe_ext.c /usr/src/debug/erofs-utils/1.9.1/lib/vmdk.c /usr/src/debug/erofs-utils/1.9.1/lib/gzran.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/dedupe.h /usr/src/debug/erofs-utils/1
 .9.1/lib/rolling_hash.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/diskbuf.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/hashmap.h /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_nbd.h /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_xxhash.h /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_private.h /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_gzran.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/atomic.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/flex-array.h /usr/src/debug/erofs-utils/1.9.1/lib/rebuild.c /usr/src/debug/erofs-utils/1.9.1/lib/fragments.c /usr/src/debug/erofs-utils/1.9.1/lib/dir.c /usr/src/debug/erofs-utils/1.9.1/lib/tar.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/workqueue.h /usr/src/debug/erofs-utils/1.9.1/lib/importer.c /usr/src/debug/erofs-utils/1.9.1/lib/decompress.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/tar.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/io.h /usr/src/debug/erofs-utils/1.9.1/lib/compress.c /usr/src/debug/erofs-utils/1.9.1/l
 ib/exclude.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_uuid.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/internal.h /usr/src/debug/erofs-utils/1.9.1/lib/blobchunk.c /usr/src/debug/erofs-utils/1.9.1/lib/compressor.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_base64.h /usr/src/debug/erofs-utils/1.9.1/lib/compress_hints.c /usr/src/debug/erofs-utils/1.9.1/lib/kite_deflate.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/dir.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/compress_hints.h /usr/src/debug/erofs-utils/1.9.1/lib/compressor.h /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_compress.h /usr/src/debug/erofs-utils/1.9.1/lib/hashmap.c /usr/src/debug/erofs-utils/1.9.1/lib/diskbuf.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/importer.h /usr/src/debug/erofs-utils/1.9.1/lib/workqueue.c /usr/src/debug/erofs-utils/1.9.1/lib/metabox.c /usr/src/debug/erofs-utils/1.9.1/lib/bitops.c /usr/src/debug/erofs-utils/1.9.1/lib/inode.c /usr/src/debug/erofs-utils/1.9.1/dump/main.c /usr/
 src/debug/erofs-utils/1.9.1/lib/super.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/bitops.h /usr/src/debug/erofs-utils/1.9.1/include/erofs/print.h /usr/src/debug/erofs-utils/1.9.1/lib/base64.c /usr/src/debug/erofs-utils/1.9.1/lib/liberofs_metabox.h /usr/src/debug/erofs-utils/1.9.1/lib/backends/nbd.c /usr/src/debug/erofs-utils/1.9.1/include/erofs/lock.h"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.8.10" to "1.9.1"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PV changed from "1.8.10" to "1.9.1"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 579240 to 727936 (+26%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: FILELIST: added "/usr/sbin/mount.erofs"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils: PKGV changed from 1.8.10 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/erofs-utils: PV changed from "1.8.10" to "1.9.1"

--===============7856275162483669509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 2157208 to 2653200 (+23%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 13532 to 26007 (+92%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: FILELIST: added "/usr/share/man/man8/mount.erofs.8"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 588791 to 766826 (+30%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 579240 to 727936 (+26%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: FILELIST: added "/usr/sbin/mount.erofs"

--===============7856275162483669509==--

