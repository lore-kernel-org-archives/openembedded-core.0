Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730AFCCA46A
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.3700.1684186745667924058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bTvpWTBc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a472e-950b6b10-f4ff-417a-b56d-e8e0cbcbf433-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5SSboFkZVdjL8KuwbpFywrzE6EswtI0N7mszH8BCzrs=;
	b=bTvpWTBcIoBSsyuTA4i87AjXjlmPpIvLU/vz/A8FSDOTrjo9RfeRoO2qehmHOk/r
	zuMtUgbX6wG9SSCiVdoboH7oyKk3bWn93aZUVR+OFkWitS5RPY4jmENJAmUJTdop+Bd
	mx0eBdbwhrm59AQvLCrc1mK4HEpFn6PMH3bLysnw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5SSboFkZVdjL8KuwbpFywrzE6EswtI0N7mszH8BCzrs=;
	b=VHKxfRtXpZ2IbHstXL/c2aA0fBjJH+FdYKZ9lrhwdz66sxsZtx4baOTHi8TRL+kO
	ec4jh7azWtwNIUbeO4PLbed6+5qWNcnWTAIJ5ZgdHvDyHt4OVFaJM6YAOTl5pa/1o5S
	CIrf4jl0c1CBTds7OTtRO68rr3eQHYcq6a/pNEEs=
Content-Type: multipart/mixed; boundary="===============5051015066901348129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pciutils: upgrading to 3.10.0 SUCCEEDED
Message-ID: <01010188215a472e-950b6b10-f4ff-417a-b56d-e8e0cbcbf433-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181273

--===============5051015066901348129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pciutils* to *3.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pciutils-upgrade-3.9.0-3.10.0.patch
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
--===============5051015066901348129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pciutils: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils: SRC_URI changed from "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.9.0.tar.xz file://configure.patch" to "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.10.0.tar.xz file://configure.patch"
packages/core2-32-poky-linux/pciutils/libpci: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/libpci: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.9.0", added "/usr/lib/libpci.so.3.10.0"
packages/core2-32-poky-linux/pciutils/libpci: PKGSIZE changed from 71523 to 83880 (+17%)
packages/core2-32-poky-linux/pciutils/pciutils-dbg: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-dbg: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-dbg: FILELIST: removed "/usr/lib/.debug/libpci.so.3.9.0", added "/usr/lib/.debug/libpci.so.3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-dbg: PKGSIZE changed from 479624 to 509088 (+6%)
packages/core2-32-poky-linux/pciutils/pciutils-dev: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-dev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-dev: PKGSIZE changed from 98810 to 99068 (+0%)
packages/core2-32-poky-linux/pciutils/pciutils-doc: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-doc: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-doc: PKGSIZE changed from 28911 to 31605 (+9%)
packages/core2-32-poky-linux/pciutils/pciutils-ids: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-ids: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-ids: PKGSIZE changed from 308957 to 313330 (+1%)
packages/core2-32-poky-linux/pciutils/pciutils-locale: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-locale: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-src: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-src: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-src: FILELIST: directory renamed /usr/src/debug/pciutils/3.9.0-r0 -> /usr/src/debug/pciutils/3.10.0-r0, removed "/usr/src/debug/pciutils/3.9.0-r0/lib/names.h /usr/src/debug/pciutils/3.9.0-r0/lib/types.h /usr/src/debug/pciutils/3.9.0-r0/lib/pci.h /usr/src/debug/pciutils/3.9.0-r0/lib/init.c /usr/src/debug/pciutils/3.9.0-r0/lib/mmio-ports.c /usr/src/debug/pciutils/3.9.0-r0/lib/names.c /usr/src/debug/pciutils/3.9.0-r0/lib/access.c /usr/src/debug/pciutils/3.9.0-r0/lib/dump.c /usr/src/debug/pciutils/3.9.0-r0/lib/names-hash.c /usr/src/debug/pciutils/3.9.0-r0/lib/generic.c /usr/src/debug/pciutils/3.9.0-r0/lib/names-hwdb.c /usr/src/debug/pciutils/3.9.0-r0/lib/filter.c /usr/src/debug/pciutils/3.9.0-r0/lib/i386-io-linux.h /usr/src/debug/pciutils/3.9.0-r0/lib/proc.c /usr/src/debug/pciutils/3.9.0-r0/lib/sysdep.h /usr/src/debug/pciutils/3.9.0-r0/lib/names-cache.c /usr/src/debug/pciutils/3.9.0-r0/lib/names-parse.c /usr/src/debug/pciutils/3.9.0-r0/lib/i
 nternal.h /usr/src/debug/pciutils/3.9.0-r0/lib/i386-ports.c /usr/src/debug/pciutils/3.9.0-r0/lib/sysfs.c /usr/src/debug/pciutils/3.9.0-r0/lib/params.c /usr/src/debug/pciutils/3.9.0-r0/lib/caps.c /usr/src/debug/pciutils/3.9.0-r0/lib/names-net.c", added "/usr/src/debug/pciutils/3.10.0-r0/lib/types.h /usr/src/debug/pciutils/3.10.0-r0/lib/pci.h /usr/src/debug/pciutils/3.10.0-r0/lib/dump.c /usr/src/debug/pciutils/3.10.0-r0/lib/i386-ports.c /usr/src/debug/pciutils/3.10.0-r0/lib/mmio-ports.c /usr/src/debug/pciutils/3.10.0-r0/lib/access.c /usr/src/debug/pciutils/3.10.0-r0/lib/names-net.c /usr/src/debug/pciutils/3.10.0-r0/lib/params.c /usr/src/debug/pciutils/3.10.0-r0/lib/proc.c /usr/src/debug/pciutils/3.10.0-r0/lib/names-hash.c /usr/src/debug/pciutils/3.10.0-r0/lib/names-hwdb.c /usr/src/debug/pciutils/3.10.0-r0/lib/generic.c /usr/src/debug/pciutils/3.10.0-r0/lib/filter.c /usr/src/debug/pciutils/3.10.0-r0/lib/i386-io-linux.h /usr/src/debug/pciutils/3.10.0-r0/lib/init.c /usr/src/debug/pciutil
 s/3.10.0-r0/lib/ecam.c /usr/src/debug/pciutils/3.10.0-r0/lib/caps.c /usr/src/debug/pciutils/3.10.0-r0/lib/names-cache.c /usr/src/debug/pciutils/3.10.0-r0/lib/names-parse.c /usr/src/debug/pciutils/3.10.0-r0/lib/names.c /usr/src/debug/pciutils/3.10.0-r0/lib/sysfs.c /usr/src/debug/pciutils/3.10.0-r0/lib/sysdep.h /usr/src/debug/pciutils/3.10.0-r0/lib/names.h /usr/src/debug/pciutils/3.10.0-r0/lib/internal.h"
packages/core2-32-poky-linux/pciutils/pciutils-src: PKGSIZE changed from 320917 to 355785 (+11%)
packages/core2-32-poky-linux/pciutils/pciutils-staticdev: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-staticdev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils: PKGSIZE changed from 149763 to 149792 (+0%)
Changes to packages/core2-32-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.9.0 to libpci.so.3.10.0
  /usr/lib/libpci.so.3.10.0 was added
  /usr/lib/libpci.so.3.9.0 was removed

--===============5051015066901348129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pciutils-upgrade-3.9.0-3.10.0.patch"

RnJvbSA1MWIxNGMwM2IwOTNkN2E1YzM4ZWI0OWU2NjlmZDIyYTQzOGMwZTZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDY6MjI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
Y2l1dGlsczogdXBncmFkZSAzLjkuMCAtPiAzLjEwLjAKCi0tLQogLi4uL3BjaXV0aWxzL3twY2l1
dGlsc18zLjkuMC5iYiA9PiBwY2l1dGlsc18zLjEwLjAuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWJzcC9wY2l1dGlscy97cGNpdXRpbHNfMy45LjAuYmIgPT4gcGNpdXRpbHNfMy4xMC4w
LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvcGNpdXRpbHMvcGNpdXRp
bHNfMy45LjAuYmIgYi9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzXzMuMTAuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL3BjaXV0
aWxzL3BjaXV0aWxzXzMuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxz
L3BjaXV0aWxzXzMuMTAuMC5iYgppbmRleCBmOWZlN2FhNzZhLi5lMjdjZmQ0Y2VkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzXzMuOS4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1ic3AvcGNpdXRpbHMvcGNpdXRpbHNfMy4xMC4wLmJiCkBAIC0xNCw3ICsxNCw3
IEBAIERFUEVORFMgPSAiemxpYiBrbW9kIG1ha2UtbmF0aXZlIgogU1JDX1VSSSA9ICIke0tFUk5F
TE9SR19NSVJST1J9L3NvZnR3YXJlL3V0aWxzL3BjaXV0aWxzL3BjaXV0aWxzLSR7UFZ9LnRhci54
eiBcCiAgICAgICAgICAgIGZpbGU6Ly9jb25maWd1cmUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJjZGVhN2FlOTcyMzlkZWUyMzI0OWEwOWM2OGExOWEyODdhM2YxMDlmYmViMmMyMzJl
YmI2MTZjYjM4NTk5MDEyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIzOGEyZTI3MTY2NzMwZTUz
YTE3ZmUwN2JmYWQyMjllMDdmYTM5YjYxODExN2U1OTQ0YjZkN2VkYTlmYmIwZTkiCiAKIGluaGVy
aXQgbXVsdGlsaWJfaGVhZGVyIHBrZ2NvbmZpZyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAKLS0gCjIu
MzkuMgoK

--===============5051015066901348129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pciutils/libpci: PKGSIZE changed from 71523 to 83880 (+17%)
packages/core2-32-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.9.0", added "/usr/lib/libpci.so.3.10.0"
packages/core2-32-poky-linux/pciutils/pciutils-src: PKGSIZE changed from 320917 to 355785 (+11%)
Changes to packages/core2-32-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.9.0 to libpci.so.3.10.0
  /usr/lib/libpci.so.3.10.0 was added
  /usr/lib/libpci.so.3.9.0 was removed

--===============5051015066901348129==--

