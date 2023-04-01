Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78091C88CB4
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.32133.1680384534515256745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LHsZgqgF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101873eb92295-0763dc81-0caf-47ac-9196-7d9ffca328f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DgDCLJu/EaaDhZKDhofu+j/xEOakgwUf1ntD8qxEg7Q=;
	b=LHsZgqgFOFLacpZ3TB5NHIrwrtJN/BjtlzvcvCTrd6jDBSQX9KVWQKFk9GYPzdt/
	30vQSWgj+lzkwM1oHcnIiiLKEiKeIsKglIBmcwVCzs40gFpfVZqlrb1TBCbZ2jC+w5H
	j1Mf7j+wYwrfRB3TtDjH844V1C16wfvQPnJRTyOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DgDCLJu/EaaDhZKDhofu+j/xEOakgwUf1ntD8qxEg7Q=;
	b=EyHvtgOFgfXEvt12FyE0Y4Ln/azmfvd+bB67wezkQyec6zf/pI4pcidZh2z+5vl3
	dlymOnaUkFSRdE7ff4gBrPxuH2xnRrJrBALaDTdz8O/fgRyAFIIepVp8H5Msj/Qq1uf
	bFjPUPbRBOx6lkrITfv/fVrcRnbLbzztz0E9AO5o=
Content-Type: multipart/mixed; boundary="===============1623018487371266260=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.2.2 SUCCEEDED
Message-ID: <010101873eb92295-0763dc81-0caf-47ac-9196-7d9ffca328f1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179498

--===============1623018487371266260==
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
--===============1623018487371266260==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.1.3-6.2.2.patch"

RnJvbSBmMTUxNTQ1ZmJkZGZkNjEyZjE1ODliMGVlNTg5NWQwZDE3OWVjZWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwNzo0MTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMS4zIC0+IDYuMi4yCgotLS0KIC4uLi9idHJmcy10b29scy97
YnRyZnMtdG9vbHNfNi4xLjMuYmIgPT4gYnRyZnMtdG9vbHNfNi4yLjIuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi4xLjMuYmIgPT4gYnRy
ZnMtdG9vbHNfNi4yLjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjEuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzYuMi4yLmJiCmluZGV4IGI0ZGZjNWIzZjMuLjliMDA2MTQ5OGQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjEuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4y
LjIuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2RhdmUvYnRyZnMtcHJvZ3MuZ2l0O2IKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24t
bW9kdWxlcy1hci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVVzZS1wcmVhZC1wd3Jp
dGUtZnRydW5jYXRlLXN0YXQtaW5zdGVhZC1vZi02NGJpdC1lcXUucGF0Y2ggXAogICAgICAgICAg
ICAiCi1TUkNSRVYgPSAiOTA4YjRiNDQ1MDMyMGUzMGZkZWY2OTNmMDliNDJmNGViOTM3MDJjMyIK
K1NSQ1JFViA9ICI5MWE4MzAzNGM1YjMxNjU3ZjlhOGZjOWUwYzI3ZThhNzkyZTY4MmMzIgogUyA9
ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjM5LjIKCg==

--===============1623018487371266260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17379552 to 19630676 (+13%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3740233 to 3781220 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/check -> /usr/src/debug/btrfs-tools/6.2.2-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/convert -> /usr/src/debug/btrfs-tools/6.2.2-r0/convert, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/kernel-lib -> /usr/src/debug/btrfs-tools/6.2.2-r0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/image -> /usr/src/debug/btrfs-tools/6.2.2-r0/image, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/kernel-shared -> /usr/src/debug/btrfs-tools/6.2.2-r0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.1.3-r0/mkfs -> /usr/src/debug/btrfs-tools/6.2.2-r0/mkfs, directory re
 named /usr/src/debug/btrfs-tools/6.1.3-r0/cmds -> /usr/src/debug/btrfs-tools/6.2.2-r0/cmds, removed "/usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/help.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/messages.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/messages.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/help.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/sha224-256.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/sha.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfstune.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-utils.c /usr/src/debug
 /btrfs-tools/6.1.3-r0/ioctl.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.1.3-r0/kerncompat.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/units.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/crc32c.c /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/crc32c.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/units.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/xxhash.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2-impl.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-stream.h /us
 r/src/debug/btrfs-tools/6.1.3-r0/crypto/xxhash.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-select-super.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2b-ref.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/hash.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/c
 ommon/send-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-map-logical.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/hash.c /usr/src/debug/btrfs-tools/6.1.3-r0/crypto/blake2.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.1.3-r0/btrfs-find-root.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.1.3-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.1.3-r0/common/fsfeatures.h", added "/usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/crc32c.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/help.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/messages.h /usr/src/debug/btrfs-tools/6.2.2-r0/tune/tune.h /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/crc32c.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/
 messages.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/help.c /usr/src/debug/btrfs-tools/6.2.2-r0/tune/main.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/sha224-256.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/sha.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.2.2-r0/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/string-utils.h /usr/src/debug/btrfs-to
 ols/6.2.2-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/units.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/crc32c.c /usr/src/debug/btrfs-tools/6.2.2-r0/btrfs.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-avx2.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-sse2.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/crc32c.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/units.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2-impl.h /usr/src/debug/btrfs-tools/6.2.2-r0/tune/change-csum.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/xxhash.h /usr/src/debug/btrfs-tools/6.2.2-r0/btrfs-select-super.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-stream.c /
 usr/src/debug/btrfs-tools/6.2.2-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-ref.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/hash.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/sha256-x86.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.2.2-
 r0/btrfs-map-logical.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/hash.c /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2.h /usr/src/debug/btrfs-tools/6.2.2-r0/crypto/blake2b-sse41.c /usr/src/debug/btrfs-tools/6.2.2-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.2.2-r0/btrfs-find-root.c /usr/src/debug/btrfs-tools/6.2.2-r0/include/kerncompat.h /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.2.2-r0/tune/convert-bgt.c /usr/src/debug/btrfs-tools/6.2.2-r0/tune/seeding.c /usr/src/debug/btrfs-tools/6.2.2-r0/include/ioctl.h /usr/src/debug/btrfs-tools/6.2.2-r0/tune/change-uuid.c /usr/src/debug/btrfs-tools/6.2.2-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.2.2-r0/common/fsfeatures.h"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6156440 to 6328528 (+3%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.1.3" to "6.2.2"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.1.3 [default] to 6.2.2 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.2.2-py3.11.egg-info

--===============1623018487371266260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17379552 to 19630676 (+13%)
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.2.2-py3.11.egg-info

--===============1623018487371266260==--

