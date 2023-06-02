Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9902CECAA3A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.7526.1685693431674496888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Sc0TcsJB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b287c71-6c863e04-25c5-4ef4-8eff-e6b4dd916c16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s6MAjozyh12AL2nScKZltf2ra2uIVFOWlN8e9FMJixw=;
	b=Sc0TcsJBbONbJqs5wlU1jKybKjdn5cEdfSgD+UluWLF4wgioQ6SwSLUbguDj2fLu
	e8dyk+KDBQijQKhxeuFpmBkq0p8GV3v8bl/i7v7rqiOyauOosL52R45jKxfnFxcTtN9
	8dW1qs1sBFxQ0AdJtowx3oEzjkvgKa3P6bEmts2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s6MAjozyh12AL2nScKZltf2ra2uIVFOWlN8e9FMJixw=;
	b=h4XsgdbXDdQXQcOwnN9Z0dKh9j0zoAn1uJCbQ73hismE3BcoIWd5hTEfBppPw5K4
	mrQCl6gJ0t1O5o9yA5JLlLdAl4dLjde7hpWXORz5UMEjlehCXJHq7/b1PQXEYlUdOcR
	hQYn7EaEnVHJF+skPwi6bcDuHto7q4++Tv7uYEug=
Content-Type: multipart/mixed; boundary="===============1142540024156404179=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.3.1 SUCCEEDED
Message-ID: <010101887b287c71-6c863e04-25c5-4ef4-8eff-e6b4dd916c16-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182164

--===============1142540024156404179==
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
--===============1142540024156404179==
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

--===============1142540024156404179==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.3-6.3.1.patch"

RnJvbSBiYzQyMjYxOTBhNGE4ODYyZGIxZmRiNTRlZmNkZWZiZmE4NTMwYjg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwOToxODo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMyAtPiA2LjMuMQoKLS0tCiAuLi4vYnRyZnMtdG9vbHMve2J0
cmZzLXRvb2xzXzYuMy5iYiA9PiBidHJmcy10b29sc182LjMuMS5iYn0gICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuMy5iYiA9PiBidHJmcy10
b29sc182LjMuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjMuMS5iYgppbmRleCA1YzQzZDk1MWM0Li4wYmRmNDhkZWQyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4zLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjMuMS5iYgpAQCAt
MTgsNyArMTgsNyBAQCBERVBFTkRTID0gInV0aWwtbGludXggemxpYiIKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0cmZzLXBy
b2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1h
ci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJmYmEzMWQ2MzRlM2JjNjU4ZTdkNDJh
NmMwMGYzMWViYjYwYWRmOTAxIgorU1JDUkVWID0gIjlkMmM4YzM2NGE2YjhkZjRiMWE0N2FkMzg0
Y2Q3NWZkNGJhNTNlMTIiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBQQUNLQUdFQ09ORklHID8/
PSAiIFwKLS0gCjIuMzkuMgoK

--===============1142540024156404179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 19974880 to 21090388 (+6%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208609 to 207554 (-1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.3-r0 -> /usr/src/debug/btrfs-tools/6.3.1-r0, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/tune -> /usr/src/debug/btrfs-tools/6.3.1-r0/tune, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/crypto -> /usr/src/debug/btrfs-tools/6.3.1-r0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/common -> /usr/src/debug/btrfs-tools/6.3.1-r0/common, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/image -> /usr/src/debug/btrfs-tools/6.3.1-r0/image, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/check -> /usr/src/debug/btrfs-tools/6.3.1-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/cmds -> /usr/s
 rc/debug/btrfs-tools/6.3.1-r0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/mkfs -> /usr/src/debug/btrfs-tools/6.3.1-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.3-r0/convert -> /usr/src/debug/btrfs-tools/6.3.1-r0/convert, removed "/usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/crc32c.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/crc32c.c /usr/src/debug
 /btrfs-tools/6.3-r0/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/compression.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/extent_io.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/extent_io.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/tables.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/list_sort.c /usr/src/debug/btrfs-too
 ls/6.3-r0/kernel-shared/print-tree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/rbtree_augmented.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/print-tree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/root-tree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/file-item.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/6.3-r0/include/kerncompat.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/rbtree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-tree.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/free-space-tree.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/bitmap.h /usr/src/debug/btrfs-tools/6.3-r
 0/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/uuid-tree.c /usr/src/debug/btrfs-tools/6.3-r0/include/ioctl.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/volumes.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/volumes.c /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.3-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/6.3-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.3-r0/kernel-shared/send.h", added "/usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/print-tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/accessors.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent_io.h /usr/src/deb
 ug/btrfs-tools/6.3.1-r0/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/uapi/btrfs.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/send.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/print-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/bitmap.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent_io.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/accessors.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/root-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/async-thread.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/crc32c.h /usr/
 src/debug/btrfs-tools/6.3.1-r0/kernel-lib/trace.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/async-thread.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/compression.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.3.1-r0/include/kerncompat.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/file-item.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/uapi/btrfs_tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.
 3.1-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/messages.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/volumes.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree_augmented.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/messages.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/list_sort.c /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/volumes.c /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent-io-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/misc.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-t
 ree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/locking.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/tables.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/extent-io-tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/free-space-tree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/locking.h /usr/src/debug/btrfs-tools/6.3.1-r0/libbtrfs/crc32c.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/file-item.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/tree-checker.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6
 .3.1-r0/libbtrfs/kerncompat.h /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/tree-checker.c /usr/src/debug/btrfs-tools/6.3.1-r0/kernel-shared/uuid-tree.c"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3788366 to 3998178 (+6%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.3" to "6.3.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.3 [default] to 6.3.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6340786 to 7012532 (+11%)
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

--===============1142540024156404179==--

