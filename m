Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22E7CFC610
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53356.1728588943585531958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LE2KUEl6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=g6k7JVvk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277ee0dcf-e05b2b3d-d187-4923-b2e8-d60b2ed53272-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588943;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6LxHCyA3GVSH/95QzoW5kzWq5xasVzLrcWdQZKvoD70=;
	b=LE2KUEl6S8VNVp8Lzq91zDfEBD3B6rQL/PxfNQmPXfhifKSYdVqdY9O7q+cRq6GG
	lJD0GTWzhR0qxaH7Hoxy3h0YMt7N90t6R35bMocK0F/ILP50GfjNJE4btEBC6sZ7K3z
	IR2Zu86RwVm5vWE8TuLpAQNTSkIuFFent95OR/tc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588943;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6LxHCyA3GVSH/95QzoW5kzWq5xasVzLrcWdQZKvoD70=;
	b=g6k7JVvkIbMhaXTL5ZE1tQ5wDaVL5GsXTywfj/5xvnISYON4cLtMxaJomAF+qrOG
	7kn7GXYpZgfs9CasR6oemObTRsywkkt0a5R37MpIaZgPOULJzCEUBy8OUDyba9l/xKb
	FKGX1kX221xkd9tCldlHIYS9XC8gFhfQP9mNVA+Q=
Content-Type: multipart/mixed; boundary="===============2741463365044791977=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtd-utils: upgrading to 2.2.1 SUCCEEDED
Message-ID: <0101019277ee0dcf-e05b2b3d-d187-4923-b2e8-d60b2ed53272-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205441

--===============2741463365044791977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mtd-utils* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtd-utils-upgrade-2.2.0-2.2.1.patch
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
From 51a621fe9ec89d8065051a8ba7ea46b36f882e79 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 01:41:33 +0000
Subject: [PATCH] mtd-utils: upgrade 2.2.0 -> 2.2.1

---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index a40d79c864..3545f8e426 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.2.0"
+PV = "2.2.1"
 
-SRCREV = "31e990c56aba7584cde310685d663bb122f16003"
+SRCREV = "13ec33609213c1dbd75852a09560a707a7f19a5c"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.44.1


--===============2741463365044791977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtd-utils: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PKGSIZE changed from 8228048 to 8225400 (-0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dbg: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PKGSIZE changed from 38489 to 38504 (+0%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-dev: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-doc: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-doc: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-jffs2: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-locale: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-locale: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-misc: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-misc: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PKGSIZE changed from 1440713 to 1456112 (+1%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-src: FILELIST: directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/mtd-tests -> /usr/src/debug/mtd-utils/2.2.1/tests/mtd-tests, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/ubi-tests -> /usr/src/debug/mtd-utils/2.2.1/tests/ubi-tests, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/fs-tests/simple -> /usr/src/debug/mtd-utils/2.2.1/tests/fs-tests/simple, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/fs-tests/integrity -> /usr/src/debug/mtd-utils/2.2.1/tests/fs-tests/integrity, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/jittertest -> /usr/src/debug/mtd-utils/2.2.1/tests/jittertest, directory renamed /usr/src/debug/mtd-utils/2.2.0/ubifs-utils/mkfs.ubifs/hashtable -> /usr/src/debug/mtd-utils/2.2.1/ubifs-utils/mkfs.ubifs/hashtable, directory renamed /usr/src/debug/mtd-utils/2.2.0/ubifs-utils/mkfs.ubifs -> /usr/src/debug/mtd-utils/2.2.1/ubifs-utils/mkfs.ubifs, directory renamed /usr/src/debug/mtd-utils
 /2.2.0/include/mtd -> /usr/src/debug/mtd-utils/2.2.1/include/mtd, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/fs-tests/lib -> /usr/src/debug/mtd-utils/2.2.1/tests/fs-tests/lib, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/fs-tests/utils -> /usr/src/debug/mtd-utils/2.2.1/tests/fs-tests/utils, directory renamed /usr/src/debug/mtd-utils/2.2.0/nor-utils -> /usr/src/debug/mtd-utils/2.2.1/nor-utils, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/checkfs -> /usr/src/debug/mtd-utils/2.2.1/tests/checkfs, directory renamed /usr/src/debug/mtd-utils/2.2.0/tests/fs-tests/stress/atoms -> /usr/src/debug/mtd-utils/2.2.1/tests/fs-tests/stress/atoms, directory renamed /usr/src/debug/mtd-utils/2.2.0/misc-utils -> /usr/src/debug/mtd-utils/2.2.1/misc-utils, directory renamed /usr/src/debug/mtd-utils/2.2.0/include/linux -> /usr/src/debug/mtd-utils/2.2.1/include/linux, directory renamed /usr/src/debug/mtd-utils/2.2.0/nand-utils -> /usr/src/debug/mtd-utils/2.2.1/nand-utils, dir
 ectory renamed /usr/src/debug/mtd-utils/2.2.0/ubi-utils -> /usr/src/debug/mtd-utils/2.2.1/ubi-utils, removed "/usr/src/debug/mtd-utils/2.2.0/jffsX-utils/compr_rtime.c /usr/src/debug/mtd-utils/2.2.0/lib/libscan.c /usr/src/debug/mtd-utils/2.2.0/lib/libmtd_legacy.c /usr/src/debug/mtd-utils/2.2.0/lib/libubi.c /usr/src/debug/mtd-utils/2.2.0/include/dictionary.h /usr/src/debug/mtd-utils/2.2.0/include/libmtd.h /usr/src/debug/mtd-utils/2.2.0/lib/libmtd.c /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/jffs2reader.c /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/compr.h /usr/src/debug/mtd-utils/2.2.0/lib/libfec.c /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/jffs2dump.c /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/compr.c /usr/src/debug/mtd-utils/2.2.0/lib/libiniparser.c /usr/src/debug/mtd-utils/2.2.0/include/libfec.h /usr/src/debug/mtd-utils/2.2.0/include/common.h /usr/src/debug/mtd-utils/2.2.0/include/crc32.h /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/sumtool.c /usr/src/debug/mtd-utils/2.2.0/jffsX-utils
 /compr_zlib.c /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/summary.h /usr/src/debug/mtd-utils/2.2.0/lib/common.c /usr/src/debug/mtd-utils/2.2.0/lib/libcrc32.c /usr/src/debug/mtd-utils/2.2.0/include/libubigen.h /usr/src/debug/mtd-utils/2.2.0/include/libubi.h /usr/src/debug/mtd-utils/2.2.0/include/libiniparser.h /usr/src/debug/mtd-utils/2.2.0/include/libscan.h /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/compr_lzo.c /usr/src/debug/mtd-utils/2.2.0/lib/libmtd_int.h /usr/src/debug/mtd-utils/2.2.0/lib/libubigen.c /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/mkfs.jffs2.c /usr/src/debug/mtd-utils/2.2.0/lib/libubi_int.h /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/rbtree.c /usr/src/debug/mtd-utils/2.2.0/lib/dictionary.c /usr/src/debug/mtd-utils/2.2.0/include/xalloc.h /usr/src/debug/mtd-utils/2.2.0/jffsX-utils/rbtree.h", added "/usr/src/debug/mtd-utils/2.2.1/jffsX-utils/compr_rtime.c /usr/src/debug/mtd-utils/2.2.1/lib/libscan.c /usr/src/debug/mtd-utils/2.2.1/lib/libmtd_legacy.c /usr/src/debug/mtd-uti
 ls/2.2.1/lib/libubi.c /usr/src/debug/mtd-utils/2.2.1/include/dictionary.h /usr/src/debug/mtd-utils/2.2.1/include/libmtd.h /usr/src/debug/mtd-utils/2.2.1/lib/libmtd.c /usr/src/debug/mtd-utils/2.2.1/include/list.h /usr/src/debug/mtd-utils/2.2.1/lib/rbtree.c /usr/src/debug/mtd-utils/2.2.1/lib/list_sort.c /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/jffs2reader.c /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/compr.h /usr/src/debug/mtd-utils/2.2.1/lib/libfec.c /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/jffs2dump.c /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/compr.c /usr/src/debug/mtd-utils/2.2.1/lib/libiniparser.c /usr/src/debug/mtd-utils/2.2.1/include/libfec.h /usr/src/debug/mtd-utils/2.2.1/include/common.h /usr/src/debug/mtd-utils/2.2.1/include/crc32.h /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/sumtool.c /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/compr_zlib.c /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/summary.h /usr/src/debug/mtd-utils/2.2.1/lib/common.c /usr/src/debug/mtd-utils/2.2.1/lib/li
 bcrc32.c /usr/src/debug/mtd-utils/2.2.1/include/libubigen.h /usr/src/debug/mtd-utils/2.2.1/include/libubi.h /usr/src/debug/mtd-utils/2.2.1/include/libiniparser.h /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/compr_lzo.c /usr/src/debug/mtd-utils/2.2.1/lib/libmtd_int.h /usr/src/debug/mtd-utils/2.2.1/lib/libubigen.c /usr/src/debug/mtd-utils/2.2.1/jffsX-utils/mkfs.jffs2.c /usr/src/debug/mtd-utils/2.2.1/lib/libubi_int.h /usr/src/debug/mtd-utils/2.2.1/lib/dictionary.c /usr/src/debug/mtd-utils/2.2.1/include/rbtree.h /usr/src/debug/mtd-utils/2.2.1/include/xalloc.h /usr/src/debug/mtd-utils/2.2.1/include/libscan.h"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PKGSIZE changed from 365684 to 389764 (+7%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-staticdev: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-tests: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-tests: PKGSIZE changed from 1420917 to 1412725 (-1%)
packages/core2-64-poky-linux/mtd-utils/mtd-utils-tests: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils-ubifs: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils-ubifs: PKGV changed from 2.2.0 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/mtd-utils/mtd-utils: PV changed from "2.2.0" to "2.2.1"
packages/core2-64-poky-linux/mtd-utils/mtd-utils: PKGV changed from 2.2.0 [default] to 2.2.1 [default]

--===============2741463365044791977==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtd-utils-upgrade-2.2.0-2.2.1.patch"

RnJvbSA1MWE2MjFmZTllYzg5ZDgwNjUwNTFhOGJhN2VhNDZiMzZmODgyZTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDE6NDE6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dGQtdXRpbHM6IHVwZ3JhZGUgMi4yLjAgLT4gMi4yLjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tdGQvbXRkLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdGQvbXRk
LXV0aWxzX2dpdC5iYgppbmRleCBhNDBkNzljODY0Li4zNTQ1ZjhlNDI2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210ZC9tdGQtdXRpbHNfZ2l0LmJiCkBAIC0xMSw5ICsxMSw5IEBAIGluaGVy
aXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiBERVBFTkRTID0gInps
aWIgZTJmc3Byb2dzIHV0aWwtbGludXgiCiBSREVQRU5EUzptdGQtdXRpbHMtdGVzdHMgKz0gImJh
c2giCiAKLVBWID0gIjIuMi4wIgorUFYgPSAiMi4yLjEiCiAKLVNSQ1JFViA9ICIzMWU5OTBjNTZh
YmE3NTg0Y2RlMzEwNjg1ZDY2M2JiMTIyZjE2MDAzIgorU1JDUkVWID0gIjEzZWMzMzYwOTIxM2Mx
ZGJkNzU4NTJhMDk1NjBhNzA3YTdmMTlhNWMiCiBTUkNfVVJJID0gImdpdDovL2dpdC5pbmZyYWRl
YWQub3JnL210ZC11dGlscy5naXQ7YnJhbmNoPW1hc3RlciIKIAogUyA9ICIke1dPUktESVJ9L2dp
dCIKLS0gCjIuNDQuMQoK

--===============2741463365044791977==--

