Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A5CC2FC01
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.803.1686887482622643101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JGDlXk7a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c25441aa-5d15b171-54af-45c8-90c5-10e50f2f7936-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UPNAo9ywuzYipChQE6KRrYswXIdy7PJLs+Q1A6jMERg=;
	b=JGDlXk7aq6pukfT5NlCNr//A3Mz57CLJsrT80101YE8NP+FMqvILGpLqy3tJxlyp
	Tg1yvPt/JQSwdodQYW9sOQO5X8rw3I2KX3i36H33oq9zgO1ebzfSfnWjgPO7xX4c76y
	sAg8jnNz5NtNyQElKCgKuhe/uj/SRkbzys0/Qkc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UPNAo9ywuzYipChQE6KRrYswXIdy7PJLs+Q1A6jMERg=;
	b=bj7sxsgFeCcEHz1xAeWUoKQFn+cVfzRTBGz7g9Qd9N4OXzd2qNbcHgVKGUEYpgz8
	mPu4DNeXhnyoUm2DSB/EeTveClVnNWz1mSOCIF/I1I/IwxX1V/gH4+l85xa3p4gVZLs
	w+XxTPKPqf71Kn8vWTCcIfWlNIhArfUkKVN45dB4=
Content-Type: multipart/mixed; boundary="===============6186059508263560655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.3.1 SUCCEEDED
Message-ID: <01010188c25441aa-5d15b171-54af-45c8-90c5-10e50f2f7936-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182902

--===============6186059508263560655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.3-6.3.1.patch
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
From 0b2d86117fa9f7346dfb15ef0a7e4aac481684b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 08:11:43 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.3 -> 6.3.1

---
 .../btrfs-tools/{btrfs-tools_6.3.bb => btrfs-tools_6.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.bb => btrfs-tools_6.3.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
index 5c43d951c4..0bdf48ded2 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "fba31d634e3bc658e7d42a6c00f31ebb60adf901"
+SRCREV = "9d2c8c364a6b8df4b1a47ad384cd75fd4ba53e12"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.2


--===============6186059508263560655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.3-6.3.1.patch"

RnJvbSAwYjJkODYxMTdmYTlmNzM0NmRmYjE1ZWYwYTdlNGFhYzQ4MTY4NGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDg6MTE6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjMgLT4gNi4zLjEKCi0tLQogLi4uL2J0cmZzLXRvb2xzL3ti
dHJmcy10b29sc182LjMuYmIgPT4gYnRyZnMtdG9vbHNfNi4zLjEuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182LjMuYmIgPT4gYnRyZnMt
dG9vbHNfNi4zLjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29sc182LjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4zLjEuYmIKaW5kZXggNWM0M2Q5NTFjNC4uMGJkZjQ4ZGVkMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4zLjEuYmIKQEAg
LTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNfVVJJID0gImdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2ZS9idHJmcy1w
cm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMt
YXIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiZmJhMzFkNjM0ZTNiYzY1OGU3ZDQy
YTZjMDBmMzFlYmI2MGFkZjkwMSIKK1NSQ1JFViA9ICI5ZDJjOGMzNjRhNmI4ZGY0YjFhNDdhZDM4
NGNkNzVmZDRiYTUzZTEyIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/
Pz0gIiBcCi0tIAoyLjM5LjIKCg==

--===============6186059508263560655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 19975124 to 21090636 (+6%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208609 to 207554 (-1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3788366 to 3998178 (+6%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.3-r0/cmds -> /usr/src/debug/btrfs-tools/6.3.1-r0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.3-r0 -> /usr/src/debug/btrfs-tools/6.3.1-r0, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/crypto -> /usr/src/debug/btrfs-tools/6.3.1-r0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/check -> /usr/src/debug/btrfs-tools/6.3.1-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/mkfs -> /usr/src/debug/btrfs-tools/6.3.1-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/convert -> /usr/src/debug/btrfs-tools/6.3.1-r0/convert, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/tune -> /usr/s
 rc/debug/btrfs-tools/6.3.1-r0/tune, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/common -> /usr/src/debug/btrfs-tools/6.3.1-r0/common, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/image -> /usr/src/debug/btrfs-tools/6.3.1-r0/image, removed "/usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/uuid-tree.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/extent_io.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/tables.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/list_sort.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/extent_io.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/compression.h /usr/src/debug/btrfs-tools/6.3-r0/include/ioctl.h /us
 r/src/debug/btrfs-tools/6.3-r0/kernel-shared/file-item.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/rbtree.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/volumes.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/volumes.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/print-tree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-tree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/print-tree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-t
 ree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/crc32c.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/crc32c.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/bitmap.h /usr/src/debug/btrfs-tools/6.3-r0/include/kerncompat.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-li
 b/rbtree_augmented.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/send.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/root-tree.c", added "/usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/file-item.c /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/
 6.3.1-r0/kernel-shared/file-item.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/send.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree_augmented.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/messages.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/messages.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/accessors.h
  /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/async-thread.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent-io-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/crc32c.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent-io-tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/crc32c.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/async-thread.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/accessors.c /usr/src/debug/btrfs-tools/6.3.1-r0/include/kerncompat.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/compression.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent_io.c /usr/s
 rc/debug/btrfs-tools/6.3.1-r0/kernel-shared/root-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/tree-checker.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/uuid-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/uapi/btrfs.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/kerncompat.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/tables.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent_io.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/tree-checker.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/volumes.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/print-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tool
 s/6.3.1-r0/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/print-tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/volumes.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/locking.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/trace.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/locking.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/list_sort.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/uapi/btrfs_tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/bitmap.h /usr/src/debug/b
 trfs-tools/6.3.1-r0/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/misc.h"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6340786 to 7012532 (+11%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.3 [default] to 6.3.1 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/top_level.txt was removed

--===============6186059508263560655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6340786 to 7012532 (+11%)
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.1-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.3-py3.11.egg-info/top_level.txt was removed

--===============6186059508263560655==--

