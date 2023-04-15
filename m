Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50F6CA9EAB
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13803.1681581684927022451
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HX7e7ExH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018786143579-08f27764-2bce-4f0f-9e72-3e2d3de97a65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E/E5tizJflRCe99av8a3G5Lv/xJs6fUWp304DjY7P+I=;
	b=HX7e7ExHIZ8rKDdh7CQAbBfv5Av0BxR5wcdc4Rd3TRrXw0fQqunwiB7jE1aM5+Oc
	FQfyBmOxLMR4C0C9nuIl7cyIaJ7lD6j9zmBVELf6hrPPorqP0/K9FfTNdbXxrZA0b6D
	O5opaIgqPID2FT/19BwI46wmHaFN1ybs8znEXVe4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E/E5tizJflRCe99av8a3G5Lv/xJs6fUWp304DjY7P+I=;
	b=atEG+8s+pCWHl2MXGMzJDJegw1AAnoxguQFsU0qJvOjSVREwNDSHrhjFW8A2yhaz
	ZPahUbaUak1ltoak36ChsOB79s0szMG795mS4YjtbcTlCqdwH84S7VyuK51qMw5UgiB
	7xiSePjYSwGIJaJ1TQ2Y2q+yhSl0vw721ZYTfhNc=
Content-Type: multipart/mixed; boundary="===============3196768676231730235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.2.2 SUCCEEDED
Message-ID: <0101018786143579-08f27764-2bce-4f0f-9e72-3e2d3de97a65-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180034

--===============3196768676231730235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.1.3-6.2.2.patch
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
--===============3196768676231730235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17379552 to 19630676 (+13%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3740233 to 3781220 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/check -> /usr/src/debug/btrfs-tools/6.2.2-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/image -> /usr/src/debug/btrfs-tools/6.2.2-r0/image, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/convert -> /usr/src/debug/btrfs-tools/6.2.2-r0/convert, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/kernel-lib -> /usr/src/debug/btrfs-tools/6.2.2-r0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/mkfs -> /usr/src/debug/btrfs-tools/6.2.2-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/cmds -> /usr/src/debug/btrfs-tools/6.2.2-r0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/kernel-shared -> /usr/src/debug/btrfs-tools/6.2.2-r0/kernel-shared, directory renamed /usr/src/d
 ebug/btrfs-tools/6.1.3-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfsutil, removed "/usr/src/debug/btrfs-tools/6.1.3-r0/common/units.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/help.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/units.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-find-root.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/help.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/kerncompat.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/ioctl.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/hash.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/xxhash.h /usr/sr
 c/debug/btrfs-tools/6.1.3-r0/crypto/hash.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/xxhash.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2b-ref.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/crc32c.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.1.3-r0/btrfstune.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/crc32c.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/fsfeatures.h /usr/src/debug/btrf
 s-tools/6.1.3-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/sha.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-map-logical.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-select-super.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2-impl.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/sha224-256.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-utils.c /usr/sr
 c/debug/btrfs-tools/6.1.3-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/messages.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/messages.c", added "/usr/src/debug/btrfs-tools/6.2.2-r0/common/units.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/help.h /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/crc32c.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/units.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/btrfs-find-root.c 
 /usr/src/debug/btrfs-tools/6.2.2-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/crc32c.h /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/help.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.2.2-r0/tune/change-uuid.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-sse2.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-avx2.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/hash.c /usr/src/debug/btrfs-tools/6.2.2-r0/tune/change-csum.c /usr/src/debug/btrfs-tools/6.2.2-r0/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/xxhash.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/hash.h /usr/src/debug/btrfs-tools/6.2.2-r0/tune/convert-bgt.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/cpu-utils.c /usr/s
 rc/debug/btrfs-tools/6.2.2-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/include/kerncompat.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-ref.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/crc32c.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.2.2-r0/tune/seeding.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/crc32c.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/sha256-x86.c /usr/
 src/debug/btrfs-tools/6.2.2-r0/btrfs.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/sha.h /usr/src/debug/btrfs-tools/6.2.2-r0/btrfs-map-logical.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-sse41.c /usr/src/debug/btrfs-tools/6.2.2-r0/btrfs-select-super.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2-impl.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/sha224-256.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/extent-
 cache.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/tune/tune.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/messages.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/tune/main.c /usr/src/debug/btrfs-tools/6.2.2-r0/include/ioctl.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/messages.c"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6156440 to 6328528 (+3%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.2.2-py3.11.egg-info

--===============3196768676231730235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17379552 to 19630676 (+13%)
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.2.2-py3.11.egg-info

--===============3196768676231730235==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.1.3-6.2.2.patch"

RnJvbSAxNzA4ZDhkYmU5N2Y5ZjU4NWMxYmZjMWEzY2QwNWNjMjhkYmU4NDA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMDg6MTY6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjEuMyAtPiA2LjIuMgoKLS0tCiAuLi4vYnRyZnMtdG9vbHMv
e2J0cmZzLXRvb2xzXzYuMS4zLmJiID0+IGJ0cmZzLXRvb2xzXzYuMi4yLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuMS4zLmJiID0+IGJ0
cmZzLXRvb2xzXzYuMi4yLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjEuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjIuMi5iYgppbmRleCBiNGRmYzViM2YzLi45YjAwNjE0OThkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xLjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
Mi4yLmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0cmZzLXByb2dzLmdpdDtiCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9u
LW1vZHVsZXMtYXIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Vc2UtcHJlYWQtcHdy
aXRlLWZ0cnVuY2F0ZS1zdGF0LWluc3RlYWQtb2YtNjRiaXQtZXF1LnBhdGNoIFwKICAgICAgICAg
ICAgIgotU1JDUkVWID0gIjkwOGI0YjQ0NTAzMjBlMzBmZGVmNjkzZjA5YjQyZjRlYjkzNzAyYzMi
CitTUkNSRVYgPSAiOTFhODMwMzRjNWIzMTY1N2Y5YThmYzllMGMyN2U4YTc5MmU2ODJjMyIKIFMg
PSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIgXAotLSAKMi4zOS4yCgo=

--===============3196768676231730235==--

