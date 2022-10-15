Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C795EC64ECC
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.24353.1665871393434269266
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iCGL7CHn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010183ddac2eff-38e9e848-2e9b-41d5-aa37-186d6f20624c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qZK0pyWCGd3NoxIqJfzOTOo+pSyIgGXSxRy4VnVUcdo=;
	b=iCGL7CHn+O2iSLqSs43Xbl753iA51Z5sYn1yFADbgo49oXVNad13QAYRRJe6FJOu
	ouROXj3WG1/oebyZmuw69y0Qn2WNLEoyvfrJcPQosh/HYfiQoGg7ESBCGkPOXn1o0M9
	z5pVeaGh83umZdl7VIqBMM5XpZEUF1EUpu1evMAY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qZK0pyWCGd3NoxIqJfzOTOo+pSyIgGXSxRy4VnVUcdo=;
	b=GXjXJ6wRFTHwv+8wA8fu6By7adS9PO9TGML66hh/25sULhpNCPUYZ1PJu51nXcTz
	tIA6zx3T+EhEKDDSxPWh+zh56wE7uSUhDJ/F5198t1UEuWro9d3EA3G3Pa7//JPaAOT
	mWmv07u1kQ1zD8bwDLyJdFy4W5ubCxTgseKHMlBA=
Content-Type: multipart/mixed; boundary="===============6599128273123653761=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.0 SUCCEEDED
Message-ID: <01010183ddac2eff-38e9e848-2e9b-41d5-aa37-186d6f20624c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171763

--===============6599128273123653761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.19.1-6.0.patch
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
--===============6599128273123653761==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.19.1-6.0.patch"

RnJvbSA4NmU2Y2U3YzQwNGE1YTFjMjQ1NmMwZGNiZWVlZWE1NTM0MjRkYzc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDg6MDc6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA1LjE5LjEgLT4gNi4wCgotLS0KIC4uLi9idHJmcy10b29scy97
YnRyZnMtdG9vbHNfNS4xOS4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuMC5iYn0gICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNS4xOS4xLmJiID0+IGJ0
cmZzLXRvb2xzXzYuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNS4xOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNf
NS4xOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRy
ZnMtdG9vbHNfNi4wLmJiCmluZGV4IGRiODAyNmUwZjAuLjg4N2E1MzBhNTIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc181LjE5LjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMC5i
YgpAQCAtMTgsNyArMTgsNyBAQCBERVBFTkRTID0gInV0aWwtbGludXggemxpYiIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0
cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRk
LWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBc
CiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJlMWQ5ZGFiMzI2ZTA0MzY5NmU2NjQ4YWJhNGNjZjkw
ODc0ZDFkM2QxIgorU1JDUkVWID0gIjNkYjc1NjM1MjY4NWYzOGMxZGUwYWE4ODZkMzgwYzczM2Uw
ZjUzZTciCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKLS0g
CjIuMzEuMQoK

--===============6599128273123653761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/top_level.txt was removed

--===============6599128273123653761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17362820 to 17270852 (-1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "5.19.1" to "6.0"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208437 to 208431 (-0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "5.19.1" to "6.0"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "5.19.1" to "6.0"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "5.19.1" to "6.0"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3643216 to 3649748 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "5.19.1" to "6.0"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/image -> /usr/src/debug/btrfs-tools/6.0-r0/image, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/convert -> /usr/src/debug/btrfs-tools/6.0-r0/convert, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/mkfs -> /usr/src/debug/btrfs-tools/6.0-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0 -> /usr/src/debug/btrfs-tools/6.0-r0, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.0-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/cmds -> /usr/src/debug/btrfs-tools/6.0-r0/cmds, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.0-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/libbtrfs -> /usr/src/debug/btrfs-tools/6.0-r0/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0
 /kernel-shared -> /usr/src/debug/btrfs-tools/6.0-r0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/5.19.1-r0/crypto -> /usr/src/debug/btrfs-tools/6.0-r0/crypto, removed "/usr/src/debug/btrfs-tools/5.19.1-r0/common/format-output.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/send-stream.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/help.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/units.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/device-scan.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/radix-tree.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/messages.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/format-output.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/send-stream.c /usr/src/debug/btrfs-tools/5.19.1-r0/check/mode-original.h /usr/src/de
 bug/btrfs-tools/5.19.1-r0/kernel-lib/rbtree.c /usr/src/debug/btrfs-tools/5.19.1-r0/check/common.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/help.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/repair.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/send-utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/list_sort.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/open-utils.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/units.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/string-table.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/utils.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/device-utils.h /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/messages.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/path-utils.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/device-scan.c /usr/src/debug/btrfs-tools/5.19.1-r0/check/mode-c
 ommon.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/path-utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/check/qgroup-verify.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/task-utils.h /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/5.19.1-r0/check/mode-lowmem.h /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/rbtree_augmented.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/open-utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/string-table.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/5.19.1-r0/check/qgroup-verify.h /usr/src/debug/btrfs-tools/5.19.1-r0/check/mode-lowmem.c /us
 r/src/debug/btrfs-tools/5.19.1-r0/check/mode-common.h /usr/src/debug/btrfs-tools/5.19.1-r0/check/main.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/task-utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/radix-tree.h /usr/src/debug/btrfs-tools/5.19.1-r0/common/repair.h /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/device-utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/kernel-lib/tables.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/5.19.1-r0/common/send-utils.h", added "/usr/src/debug/btrfs-tools/6.0-r0/check/common.h /usr/src/debug/btrfs-tools/6.0-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.0-r0/check/mode-lowmem.c /usr/src/debug/btrfs-tools/6.0-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/rbtree.h /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/rbtree.c /usr/src/debug/btrfs-tools/6.0-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.0-r0/check/mode-o
 riginal.h /usr/src/debug/btrfs-tools/6.0-r0/check/repair.h /usr/src/debug/btrfs-tools/6.0-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/list_sort.c /usr/src/debug/btrfs-tools/6.0-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.0-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.0-r0/check/qgroup-verify.c /usr/src/debug/btrfs-tools/6.0-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.0-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.0-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.0-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/overflow.h /usr/src/debug/btrfs-tools/6.0-r0/common/units.h /usr/src/debug/btrfs-tools/6.0-r0/common/utils.h /usr/src/debug/btrfs-tools/6.0-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/list.h /usr/src/debug/btrfs-tools/6.0-r0/check/mode-common.c /usr/src/debug/btrfs-tools/6.0-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.0-r0/common/send-utils.h /usr/src/debug
 /btrfs-tools/6.0-r0/kernel-lib/rbtree_augmented.h /usr/src/debug/btrfs-tools/6.0-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.0-r0/common/messages.h /usr/src/debug/btrfs-tools/6.0-r0/check/mode-common.h /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/raid56.h /usr/src/debug/btrfs-tools/6.0-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.0-r0/check/repair.c /usr/src/debug/btrfs-tools/6.0-r0/check/mode-lowmem.h /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/rbtree_types.h /usr/src/debug/btrfs-tools/6.0-r0/check/main.c /usr/src/debug/btrfs-tools/6.0-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.0-r0/check/clear-cache.c /usr/src/debug/btrfs-tools/6.0-r0/common/units.c /usr/src/debug/btrfs-tools/6.0-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.0-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.0-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.0-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/list_sort.h /usr/src/debug/btrfs-tools/6.
 0-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.0-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.0-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.0-r0/check/qgroup-verify.h /usr/src/debug/btrfs-tools/6.0-r0/common/utils.c /usr/src/debug/btrfs-tools/6.0-r0/common/messages.c /usr/src/debug/btrfs-tools/6.0-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.0-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.0-r0/common/help.c /usr/src/debug/btrfs-tools/6.0-r0/common/help.h /usr/src/debug/btrfs-tools/6.0-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/bitops.h /usr/src/debug/btrfs-tools/6.0-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.0-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.0-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/raid56.c /usr/src/debug/btrfs-tools/6.0-r0/kernel-lib/tables.c /usr/src/debug/btrfs-tools/6.0-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.0-r0/check/clear-cache.h"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "5.19.1" to "6.0"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6127331 to 6102812 (-0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "5.19.1" to "6.0"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 5.19.1 [default] to 6.0 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "5.19.1" to "6.0"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-6.0-py3.10.egg-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.19.1-py3.10.egg-info/top_level.txt was removed

--===============6599128273123653761==--

