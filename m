Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357F3C678DB
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10157.1676508398900702592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BdgkZQYh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018657b0020f-aae4efc3-2270-4831-980d-e0ad6e2bb70f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VYjYG7yr7nbdLYvoNwHvd4QFFP8ucjQXuaHx1GHIOWk=;
	b=BdgkZQYhBd8zXXh5jifPk3NSLyBMhtgJfSJYhEDGZwnB3YuKxEqx9FvOobGa7CW/
	gWNV5Ym+7Pdn5WSzbWqPlBXHn26Yb0kcs2/UP1mdQzT9Pd2ThqE3NARa4GVWJCAPPbz
	WbpU66AAl0mKXZf+dpI432/GiuR9xq6w80R+pzV0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VYjYG7yr7nbdLYvoNwHvd4QFFP8ucjQXuaHx1GHIOWk=;
	b=ZEQ2MCLnGdmjrc1yAWQj0gMUsNgoBqnVMjiPOsa66v+MtYcCJPFnCOPJqZNb5Wda
	napc8E43k/sy2/e3Pye/cA3I5xH8zkKPn+RmpuMhgdpc0xPwKaHcFTqlGreR2wR9iXf
	FnTtbp/RBp8VqaOa3j9FD1OEOrrXu+fx3mWnvMhY=
Content-Type: multipart/mixed; boundary="===============1827744275227626529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.14.0 SUCCEEDED
Message-ID: <0101018657b0020f-aae4efc3-2270-4831-980d-e0ad6e2bb70f-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:38 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177266

--===============1827744275227626529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *liburcu* to *0.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburcu-upgrade-0.13.2-0.14.0.patch
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
--===============1827744275227626529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/liburcu: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu: SRC_URI changed from "http://lttng.org/files/urcu/userspace-rcu-0.13.2.tar.bz2" to "http://lttng.org/files/urcu/userspace-rcu-0.14.0.tar.bz2"
packages/core2-32-poky-linux/liburcu: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
packages/core2-32-poky-linux/liburcu/liburcu-dbg: PKGSIZE changed from 756152 to 790928 (+5%)
packages/core2-32-poky-linux/liburcu/liburcu-dbg: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu/liburcu-dbg: FILELIST: removed "/usr/lib/.debug/liburcu-bp.so.8.0.0 /usr/lib/.debug/liburcu-mb.so.8.0.0 /usr/lib/.debug/liburcu-cds.so.8.0.0 /usr/lib/.debug/liburcu-qsbr.so.8.0.0 /usr/lib/.debug/liburcu-common.so.8.0.0 /usr/lib/.debug/liburcu-memb.so.8.0.0 /usr/lib/.debug/liburcu.so.8.0.0 /usr/lib/.debug/liburcu-signal.so.8.0.0", added "/usr/lib/.debug/liburcu-mb.so.8.1.0 /usr/lib/.debug/liburcu-bp.so.8.1.0 /usr/lib/.debug/liburcu-common.so.8.1.0 /usr/lib/.debug/liburcu-qsbr.so.8.1.0 /usr/lib/.debug/liburcu-cds.so.8.1.0 /usr/lib/.debug/liburcu-memb.so.8.1.0 /usr/lib/.debug/liburcu-signal.so.8.1.0 /usr/lib/.debug/liburcu.so.8.1.0"
packages/core2-32-poky-linux/liburcu/liburcu-dbg: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
packages/core2-32-poky-linux/liburcu/liburcu-dev: PKGSIZE changed from 369524 to 382475 (+4%)
packages/core2-32-poky-linux/liburcu/liburcu-dev: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu/liburcu-dev: FILELIST: added "/usr/include/urcu/urcu-poll.h /usr/include/urcu/assert.h"
packages/core2-32-poky-linux/liburcu/liburcu-dev: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
packages/core2-32-poky-linux/liburcu/liburcu-doc: PKGSIZE changed from 165312 to 166595 (+1%)
packages/core2-32-poky-linux/liburcu/liburcu-doc: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu/liburcu-doc: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
packages/core2-32-poky-linux/liburcu/liburcu-locale: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu/liburcu-locale: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
packages/core2-32-poky-linux/liburcu/liburcu-src: PKGSIZE changed from 431068 to 451744 (+5%)
packages/core2-32-poky-linux/liburcu/liburcu-src: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu/liburcu-src: FILELIST: directory renamed /usr/src/debug/liburcu/0.13.2-r0/include/urcu/uatomic -> /usr/src/debug/liburcu/0.14.0-r0/include/urcu/uatomic, directory renamed /usr/src/debug/liburcu/0.13.2-r0/include/urcu/static -> /usr/src/debug/liburcu/0.14.0-r0/include/urcu/static, removed "/usr/src/debug/liburcu/0.13.2-r0/include/urcu/lfstack.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/wfstack.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/rculfstack.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/rculfqueue.h /usr/src/debug/liburcu/0.13.2-r0/src/rculfhash-mm-mmap.c /usr/src/debug/liburcu/0.13.2-r0/include/urcu/wfcqueue.h /usr/src/debug/liburcu/0.13.2-r0/src/urcu-pointer.c /usr/src/debug/liburcu/0.13.2-r0/src/lfstack.c /usr/src/debug/liburcu/0.13.2-r0/src/wfstack.c /usr/src/debug/liburcu/0.13.2-r0/include/urcu/urcu-bp.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/wfqueue.h /usr/src/debug/liburcu/0.13.2-r0/src/urcu-wait.h /usr/src/debug/libur
 cu/0.13.2-r0/include/urcu/ref.h /usr/src/debug/liburcu/0.13.2-r0/src/compat_futex.c /usr/src/debug/liburcu/0.13.2-r0/src/rculfhash-mm-chunk.c /usr/src/debug/liburcu/0.13.2-r0/src/rculfhash-mm-order.c /usr/src/debug/liburcu/0.13.2-r0/include/urcu/call-rcu.h /usr/src/debug/liburcu/0.13.2-r0/src/rculfstack.c /usr/src/debug/liburcu/0.13.2-r0/src/rculfqueue.c /usr/src/debug/liburcu/0.13.2-r0/src/compat-getcpu.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/urcu-signal.h /usr/src/debug/liburcu/0.13.2-r0/src/urcu-defer-impl.h /usr/src/debug/liburcu/0.13.2-r0/src/wfcqueue.c /usr/src/debug/liburcu/0.13.2-r0/src/urcu-bp.c /usr/src/debug/liburcu/0.13.2-r0/include/urcu/urcu-memb.h /usr/src/debug/liburcu/0.13.2-r0/src/wfqueue.c /usr/src/debug/liburcu/0.13.2-r0/src/rculfhash.c /usr/src/debug/liburcu/0.13.2-r0/include/urcu/flavor.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/futex.h /usr/src/debug/liburcu/0.13.2-r0/src/workqueue.c /usr/src/debug/liburcu/0.13.2-r0/include/urcu/urcu-mb.h /usr/src/
 debug/liburcu/0.13.2-r0/src/urcu-qsbr.c /usr/src/debug/liburcu/0.13.2-r0/src/urcu-call-rcu-impl.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/rculfhash.h /usr/src/debug/liburcu/0.13.2-r0/src/compat-smp.h /usr/src/debug/liburcu/0.13.2-r0/src/workqueue.h /usr/src/debug/liburcu/0.13.2-r0/include/urcu/list.h /usr/src/debug/liburcu/0.13.2-r0/src/rculfhash-internal.h /usr/src/debug/liburcu/0.13.2-r0/src/urcu.c", added "/usr/src/debug/liburcu/0.14.0-r0/include/urcu/lfstack.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/wfstack.h /usr/src/debug/liburcu/0.14.0-r0/src/urcu-poll-impl.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/rculfstack.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/rculfqueue.h /usr/src/debug/liburcu/0.14.0-r0/src/rculfhash-mm-mmap.c /usr/src/debug/liburcu/0.14.0-r0/include/urcu/wfcqueue.h /usr/src/debug/liburcu/0.14.0-r0/src/urcu-pointer.c /usr/src/debug/liburcu/0.14.0-r0/src/lfstack.c /usr/src/debug/liburcu/0.14.0-r0/src/wfstack.c /usr/src/debug/liburcu/0.14.0-r0/i
 nclude/urcu/urcu-bp.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/wfqueue.h /usr/src/debug/liburcu/0.14.0-r0/src/urcu-wait.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/ref.h /usr/src/debug/liburcu/0.14.0-r0/src/compat_futex.c /usr/src/debug/liburcu/0.14.0-r0/src/rculfhash-mm-chunk.c /usr/src/debug/liburcu/0.14.0-r0/src/rculfhash-mm-order.c /usr/src/debug/liburcu/0.14.0-r0/include/urcu/call-rcu.h /usr/src/debug/liburcu/0.14.0-r0/src/rculfqueue.c /usr/src/debug/liburcu/0.14.0-r0/src/rculfstack.c /usr/src/debug/liburcu/0.14.0-r0/src/compat-getcpu.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/urcu-signal.h /usr/src/debug/liburcu/0.14.0-r0/src/urcu-defer-impl.h /usr/src/debug/liburcu/0.14.0-r0/src/wfcqueue.c /usr/src/debug/liburcu/0.14.0-r0/src/urcu-bp.c /usr/src/debug/liburcu/0.14.0-r0/include/urcu/urcu-memb.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/urcu-poll.h /usr/src/debug/liburcu/0.14.0-r0/src/wfqueue.c /usr/src/debug/liburcu/0.14.0-r0/src/rculfhash.c /usr/src/debug/lib
 urcu/0.14.0-r0/include/urcu/flavor.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/futex.h /usr/src/debug/liburcu/0.14.0-r0/src/workqueue.c /usr/src/debug/liburcu/0.14.0-r0/include/urcu/urcu-mb.h /usr/src/debug/liburcu/0.14.0-r0/src/urcu-qsbr.c /usr/src/debug/liburcu/0.14.0-r0/src/urcu-call-rcu-impl.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/rculfhash.h /usr/src/debug/liburcu/0.14.0-r0/src/compat-smp.h /usr/src/debug/liburcu/0.14.0-r0/src/workqueue.h /usr/src/debug/liburcu/0.14.0-r0/include/urcu/list.h /usr/src/debug/liburcu/0.14.0-r0/src/rculfhash-internal.h /usr/src/debug/liburcu/0.14.0-r0/src/urcu.c"
packages/core2-32-poky-linux/liburcu/liburcu-src: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
packages/core2-32-poky-linux/liburcu/liburcu-staticdev: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu/liburcu-staticdev: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
packages/core2-32-poky-linux/liburcu/liburcu: PV changed from "0.13.2" to "0.14.0"
packages/core2-32-poky-linux/liburcu/liburcu: FILELIST: removed "/usr/lib/liburcu-memb.so.8.0.0 /usr/lib/liburcu-qsbr.so.8.0.0 /usr/lib/liburcu-common.so.8.0.0 /usr/lib/liburcu-signal.so.8.0.0 /usr/lib/liburcu-cds.so.8.0.0 /usr/lib/liburcu-bp.so.8.0.0 /usr/lib/liburcu-mb.so.8.0.0 /usr/lib/liburcu.so.8.0.0", added "/usr/lib/liburcu-cds.so.8.1.0 /usr/lib/liburcu-bp.so.8.1.0 /usr/lib/liburcu-mb.so.8.1.0 /usr/lib/liburcu-signal.so.8.1.0 /usr/lib/liburcu-common.so.8.1.0 /usr/lib/liburcu-memb.so.8.1.0 /usr/lib/liburcu-qsbr.so.8.1.0 /usr/lib/liburcu.so.8.1.0"
packages/core2-32-poky-linux/liburcu/liburcu: PKGV changed from 0.13.2 [default] to 0.14.0 [default]
Changes to packages/core2-32-poky-linux/liburcu (sysroot):
  /usr/lib/liburcu-bp.so.8 changed symlink target from liburcu-bp.so.8.0.0 to liburcu-bp.so.8.1.0
  /usr/lib/liburcu-bp.so changed symlink target from liburcu-bp.so.8.0.0 to liburcu-bp.so.8.1.0
  /usr/lib/liburcu-cds.so.8 changed symlink target from liburcu-cds.so.8.0.0 to liburcu-cds.so.8.1.0
  /usr/lib/liburcu-cds.so changed symlink target from liburcu-cds.so.8.0.0 to liburcu-cds.so.8.1.0
  /usr/lib/liburcu-common.so.8 changed symlink target from liburcu-common.so.8.0.0 to liburcu-common.so.8.1.0
  /usr/lib/liburcu-common.so changed symlink target from liburcu-common.so.8.0.0 to liburcu-common.so.8.1.0
  /usr/lib/liburcu-mb.so.8 changed symlink target from liburcu-mb.so.8.0.0 to liburcu-mb.so.8.1.0
  /usr/lib/liburcu-mb.so changed symlink target from liburcu-mb.so.8.0.0 to liburcu-mb.so.8.1.0
  /usr/lib/liburcu-memb.so.8 changed symlink target from liburcu-memb.so.8.0.0 to liburcu-memb.so.8.1.0
  /usr/lib/liburcu-memb.so changed symlink target from liburcu-memb.so.8.0.0 to liburcu-memb.so.8.1.0
  /usr/lib/liburcu-qsbr.so.8 changed symlink target from liburcu-qsbr.so.8.0.0 to liburcu-qsbr.so.8.1.0
  /usr/lib/liburcu-qsbr.so changed symlink target from liburcu-qsbr.so.8.0.0 to liburcu-qsbr.so.8.1.0
  /usr/lib/liburcu-signal.so.8 changed symlink target from liburcu-signal.so.8.0.0 to liburcu-signal.so.8.1.0
  /usr/lib/liburcu-signal.so changed symlink target from liburcu-signal.so.8.0.0 to liburcu-signal.so.8.1.0
  /usr/lib/liburcu.so.8 changed symlink target from liburcu.so.8.0.0 to liburcu.so.8.1.0
  /usr/lib/liburcu.so changed symlink target from liburcu.so.8.0.0 to liburcu.so.8.1.0
  /usr/lib/liburcu-bp.so.8.0.0 moved to /usr/lib/liburcu-bp.so.8.1.0
  /usr/lib/liburcu-cds.so.8.0.0 moved to /usr/lib/liburcu-cds.so.8.1.0
  /usr/lib/liburcu-common.so.8.0.0 moved to /usr/lib/liburcu-common.so.8.1.0
  /usr/lib/liburcu-mb.so.8.0.0 moved to /usr/lib/liburcu-mb.so.8.1.0
  /usr/lib/liburcu-memb.so.8.0.0 moved to /usr/lib/liburcu-memb.so.8.1.0
  /usr/lib/liburcu-qsbr.so.8.0.0 moved to /usr/lib/liburcu-qsbr.so.8.1.0
  /usr/lib/liburcu-signal.so.8.0.0 moved to /usr/lib/liburcu-signal.so.8.1.0
  /usr/lib/liburcu.so.8.0.0 moved to /usr/lib/liburcu.so.8.1.0
  /usr/include/urcu/assert.h was added
  /usr/include/urcu/urcu-poll.h was added

--===============1827744275227626529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburcu-upgrade-0.13.2-0.14.0.patch"

RnJvbSA4NzkwNDA4NDZlMWRhYjUwOTcyYjQ2OGYxMjA4NDM4OGJmYjNjNjcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTYgRmViIDIwMjMgMDA6NDE6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmN1OiB1cGdyYWRlIDAuMTMuMiAtPiAwLjE0LjAKCi0tLQogLi4uL2xpYnVyY3Uve2xpYnVy
Y3VfMC4xMy4yLmJiID0+IGxpYnVyY3VfMC4xNC4wLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlidXJjdS97bGlidXJjdV8wLjEzLjIuYmIgPT4gbGlidXJjdV8wLjE0
LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS9s
aWJ1cmN1XzAuMTMuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8w
LjE0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTMuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTQuMC5iYgppbmRleCA2ZWNmMmUyMWMwLi5mMDNjOTkw
NjMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1cmN1L2xpYnVyY3VfMC4x
My4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8wLjE0LjAu
YmIKQEAgLTEyLDcgKzEyLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9ZTU0OGQyODczNzI4OWQ3NWE4ZjFlMDFiYTJmZDc4MjUgXAogCiBTUkNfVVJJID0gImh0dHA6
Ly9sdHRuZy5vcmcvZmlsZXMvdXJjdS91c2Vyc3BhY2UtcmN1LSR7UFZ9LnRhci5iejIiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIxMjEzZmQ5ZjFiMGI3NGRhN2RlMmJiNzQzMzViNzYwOThkYjk3
MzhmZWM1ZDNjZGMwN2MwYzUyNGYzNGZjMDMyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNhNDNi
ZjI2MWQ0ZDM5MmNmZjIwZGZhZTQ0MDgzNjYwM2JmMDA5ZmNlMjRmZGM5YjI2OTdkODM3YTIyMzlk
NGYiCiAKIFMgPSAiJHtXT1JLRElSfS91c2Vyc3BhY2UtcmN1LSR7UFZ9IgogaW5oZXJpdCBhdXRv
dG9vbHMgbXVsdGlsaWJfaGVhZGVyCi0tIAoyLjM3LjMKCg==

--===============1827744275227626529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/liburcu/liburcu-dev: FILELIST: added "/usr/include/urcu/urcu-poll.h /usr/include/urcu/assert.h"
packages/core2-32-poky-linux/liburcu/liburcu: FILELIST: removed "/usr/lib/liburcu-common.so.8.0.0 /usr/lib/liburcu-signal.so.8.0.0 /usr/lib/liburcu-cds.so.8.0.0 /usr/lib/liburcu-memb.so.8.0.0 /usr/lib/liburcu-qsbr.so.8.0.0 /usr/lib/liburcu.so.8.0.0 /usr/lib/liburcu-bp.so.8.0.0 /usr/lib/liburcu-mb.so.8.0.0", added "/usr/lib/liburcu-cds.so.8.1.0 /usr/lib/liburcu-common.so.8.1.0 /usr/lib/liburcu-signal.so.8.1.0 /usr/lib/liburcu-memb.so.8.1.0 /usr/lib/liburcu-qsbr.so.8.1.0 /usr/lib/liburcu.so.8.1.0 /usr/lib/liburcu-mb.so.8.1.0 /usr/lib/liburcu-bp.so.8.1.0"
Changes to packages/core2-32-poky-linux/liburcu (sysroot):
  /usr/lib/liburcu-bp.so.8 changed symlink target from liburcu-bp.so.8.0.0 to liburcu-bp.so.8.1.0
  /usr/lib/liburcu-bp.so changed symlink target from liburcu-bp.so.8.0.0 to liburcu-bp.so.8.1.0
  /usr/lib/liburcu-cds.so.8 changed symlink target from liburcu-cds.so.8.0.0 to liburcu-cds.so.8.1.0
  /usr/lib/liburcu-cds.so changed symlink target from liburcu-cds.so.8.0.0 to liburcu-cds.so.8.1.0
  /usr/lib/liburcu-common.so.8 changed symlink target from liburcu-common.so.8.0.0 to liburcu-common.so.8.1.0
  /usr/lib/liburcu-common.so changed symlink target from liburcu-common.so.8.0.0 to liburcu-common.so.8.1.0
  /usr/lib/liburcu-mb.so.8 changed symlink target from liburcu-mb.so.8.0.0 to liburcu-mb.so.8.1.0
  /usr/lib/liburcu-mb.so changed symlink target from liburcu-mb.so.8.0.0 to liburcu-mb.so.8.1.0
  /usr/lib/liburcu-memb.so.8 changed symlink target from liburcu-memb.so.8.0.0 to liburcu-memb.so.8.1.0
  /usr/lib/liburcu-memb.so changed symlink target from liburcu-memb.so.8.0.0 to liburcu-memb.so.8.1.0
  /usr/lib/liburcu-qsbr.so.8 changed symlink target from liburcu-qsbr.so.8.0.0 to liburcu-qsbr.so.8.1.0
  /usr/lib/liburcu-qsbr.so changed symlink target from liburcu-qsbr.so.8.0.0 to liburcu-qsbr.so.8.1.0
  /usr/lib/liburcu-signal.so.8 changed symlink target from liburcu-signal.so.8.0.0 to liburcu-signal.so.8.1.0
  /usr/lib/liburcu-signal.so changed symlink target from liburcu-signal.so.8.0.0 to liburcu-signal.so.8.1.0
  /usr/lib/liburcu.so.8 changed symlink target from liburcu.so.8.0.0 to liburcu.so.8.1.0
  /usr/lib/liburcu.so changed symlink target from liburcu.so.8.0.0 to liburcu.so.8.1.0
  /usr/lib/liburcu-bp.so.8.0.0 moved to /usr/lib/liburcu-bp.so.8.1.0
  /usr/lib/liburcu-cds.so.8.0.0 moved to /usr/lib/liburcu-cds.so.8.1.0
  /usr/lib/liburcu-common.so.8.0.0 moved to /usr/lib/liburcu-common.so.8.1.0
  /usr/lib/liburcu-mb.so.8.0.0 moved to /usr/lib/liburcu-mb.so.8.1.0
  /usr/lib/liburcu-memb.so.8.0.0 moved to /usr/lib/liburcu-memb.so.8.1.0
  /usr/lib/liburcu-qsbr.so.8.0.0 moved to /usr/lib/liburcu-qsbr.so.8.1.0
  /usr/lib/liburcu-signal.so.8.0.0 moved to /usr/lib/liburcu-signal.so.8.1.0
  /usr/lib/liburcu.so.8.0.0 moved to /usr/lib/liburcu.so.8.1.0
  /usr/include/urcu/assert.h was added
  /usr/include/urcu/urcu-poll.h was added

--===============1827744275227626529==--

