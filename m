Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669EEC678D5
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.144493.1671136350830110874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gStrlUet;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d179f-f9661804-0bfa-4275-8abc-188049481b7e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PrnxkklmGEix6rIxFcqIZ+R+USAkGGDEmzshCmxqDqY=;
	b=gStrlUetwjSy2v2uQyYGNbXNVRaPmVeZVz2hZ2dS1Wmlkhuv8LUGzab2FjYjXJjT
	pAZ2UVwWExh3lYbf6HCcDaIScnWkhIoiHD3Hp21ABNpiTKhM7r16iTTHz9WY8kQFJHS
	6BzamVA3tspHXcMxLXG5xv9xp5PHoDvcwPt8eKLg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PrnxkklmGEix6rIxFcqIZ+R+USAkGGDEmzshCmxqDqY=;
	b=Gz21Tv2FUusP7+AZiEiCrDmVv28m3xRNAw4dSny3TQaAVY5hC+Wp/6scHGOcGDlf
	eTw+CMmYxUFIb9JWhyCYEHCcH9hoBV644zinGFGpOntouKw3319JhpQhhXqAUEvMVLr
	FaJ1Mtwwhj0p5dYP3KjxFn1seKytSC4AOEcuOjww=
Content-Type: multipart/mixed; boundary="===============4628445863681461173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.23 SUCCEEDED
Message-ID: <01010185177d179f-f9661804-0bfa-4275-8abc-188049481b7e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174667

--===============4628445863681461173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsolv* to *0.7.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.22-0.7.23.patch
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
--===============4628445863681461173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsolv: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2314768 to 2364692 (+2%)
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 126599 to 128805 (+2%)
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGSIZE changed from 281775 to 296630 (+5%)
packages/core2-32-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-src: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1590486 to 1637219 (+3%)
packages/core2-32-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.22-r0/tools -> /usr/src/debug/libsolv/0.7.23-r0/tools, directory renamed /usr/src/debug/libsolv/0.7.22-r0/ext -> /usr/src/debug/libsolv/0.7.23-r0/ext, removed "/usr/src/debug/libsolv/0.7.22-r0/src/rules.h /usr/src/debug/libsolv/0.7.22-r0/src/poolvendor.h /usr/src/debug/libsolv/0.7.22-r0/src/repodata.h /usr/src/debug/libsolv/0.7.22-r0/src/policy.h /usr/src/debug/libsolv/0.7.22-r0/src/sha1.h /usr/src/debug/libsolv/0.7.22-r0/src/poolvendor.c /usr/src/debug/libsolv/0.7.22-r0/src/hash.h /usr/src/debug/libsolv/0.7.22-r0/src/rules.c /usr/src/debug/libsolv/0.7.22-r0/src/sha1.c /usr/src/debug/libsolv/0.7.22-r0/src/dataiterator.h /usr/src/debug/libsolv/0.7.22-r0/src/policy.c /usr/src/debug/libsolv/0.7.22-r0/src/repodata.c /usr/src/debug/libsolv/0.7.22-r0/src/solvable.h /usr/src/debug/libsolv/0.7.22-r0/src/repo.c /usr/src/debug/libsolv/0.7.22-r0/src/fileprovides.c /usr/src/debug/libsolv/0.7.
 22-r0/src/cplxdeps.h /usr/src/debug/libsolv/0.7.22-r0/src/pool.h /usr/src/debug/libsolv/0.7.22-r0/src/repo.h /usr/src/debug/libsolv/0.7.22-r0/src/util.h /usr/src/debug/libsolv/0.7.22-r0/src/solvable.c /usr/src/debug/libsolv/0.7.22-r0/src/pool.c /usr/src/debug/libsolv/0.7.22-r0/src/util.c /usr/src/debug/libsolv/0.7.22-r0/src/cplxdeps.c /usr/src/debug/libsolv/0.7.22-r0/src/solver_private.h /usr/src/debug/libsolv/0.7.22-r0/src/chksum.h /usr/src/debug/libsolv/0.7.22-r0/src/queue.c /usr/src/debug/libsolv/0.7.22-r0/src/dirpool.c /usr/src/debug/libsolv/0.7.22-r0/src/queue.h /usr/src/debug/libsolv/0.7.22-r0/src/chksum.c /usr/src/debug/libsolv/0.7.22-r0/src/bitmap.c /usr/src/debug/libsolv/0.7.22-r0/src/poolarch.c /usr/src/debug/libsolv/0.7.22-r0/src/problems.h /usr/src/debug/libsolv/0.7.22-r0/src/sha2.h /usr/src/debug/libsolv/0.7.22-r0/src/suse.c /usr/src/debug/libsolv/0.7.22-r0/src/sha2.c /usr/src/debug/libsolv/0.7.22-r0/src/bitmap.h /usr/src/debug/libsolv/0.7.22-r0/src/poolarch.h /usr/src/
 debug/libsolv/0.7.22-r0/src/problems.c /usr/src/debug/libsolv/0.7.22-r0/src/userinstalled.c /usr/src/debug/libsolv/0.7.22-r0/src/solverdebug.h /usr/src/debug/libsolv/0.7.22-r0/src/repo_solv.c /usr/src/debug/libsolv/0.7.22-r0/src/poolid.h /usr/src/debug/libsolv/0.7.22-r0/src/repo_write.h /usr/src/debug/libsolv/0.7.22-r0/src/cleandeps.c /usr/src/debug/libsolv/0.7.22-r0/src/solvversion.h /usr/src/debug/libsolv/0.7.22-r0/src/poolid.c /usr/src/debug/libsolv/0.7.22-r0/src/repo_solv.h /usr/src/debug/libsolv/0.7.22-r0/src/diskusage.c /usr/src/debug/libsolv/0.7.22-r0/src/repo_write.c /usr/src/debug/libsolv/0.7.22-r0/src/solver.c /usr/src/debug/libsolv/0.7.22-r0/src/solver_util.c /usr/src/debug/libsolv/0.7.22-r0/src/solverdebug.c /usr/src/debug/libsolv/0.7.22-r0/src/solvversion.c /usr/src/debug/libsolv/0.7.22-r0/src/evr.c /usr/src/debug/libsolv/0.7.22-r0/src/md5.c /usr/src/debug/libsolv/0.7.22-r0/src/order.c /usr/src/debug/libsolv/0.7.22-r0/src/solver.h /usr/src/debug/libsolv/0.7.22-r0/src/re
 popack.h /usr/src/debug/libsolv/0.7.22-r0/src/knownid.h /usr/src/debug/libsolv/0.7.22-r0/src/evr.h /usr/src/debug/libsolv/0.7.22-r0/src/md5.h /usr/src/debug/libsolv/0.7.22-r0/src/selection.h /usr/src/debug/libsolv/0.7.22-r0/src/pooltypes.h /usr/src/debug/libsolv/0.7.22-r0/src/selection.c /usr/src/debug/libsolv/0.7.22-r0/src/repopage.c /usr/src/debug/libsolv/0.7.22-r0/src/dirpool.h /usr/src/debug/libsolv/0.7.22-r0/src/filelistfilter.c /usr/src/debug/libsolv/0.7.22-r0/src/strpool.h /usr/src/debug/libsolv/0.7.22-r0/src/transaction.c /usr/src/debug/libsolv/0.7.22-r0/src/repopage.h /usr/src/debug/libsolv/0.7.22-r0/src/transaction.h /usr/src/debug/libsolv/0.7.22-r0/src/strpool.c", added "/usr/src/debug/libsolv/0.7.23-r0/src/rules.h /usr/src/debug/libsolv/0.7.23-r0/src/poolvendor.h /usr/src/debug/libsolv/0.7.23-r0/src/repodata.h /usr/src/debug/libsolv/0.7.23-r0/src/policy.h /usr/src/debug/libsolv/0.7.23-r0/src/sha1.h /usr/src/debug/libsolv/0.7.23-r0/src/poolvendor.c /usr/src/debug/libsolv/
 0.7.23-r0/src/hash.h /usr/src/debug/libsolv/0.7.23-r0/src/rules.c /usr/src/debug/libsolv/0.7.23-r0/src/sha1.c /usr/src/debug/libsolv/0.7.23-r0/src/dataiterator.h /usr/src/debug/libsolv/0.7.23-r0/src/policy.c /usr/src/debug/libsolv/0.7.23-r0/src/repodata.c /usr/src/debug/libsolv/0.7.23-r0/src/solvable.h /usr/src/debug/libsolv/0.7.23-r0/src/repo.c /usr/src/debug/libsolv/0.7.23-r0/src/fileprovides.c /usr/src/debug/libsolv/0.7.23-r0/src/cplxdeps.h /usr/src/debug/libsolv/0.7.23-r0/src/pool.h /usr/src/debug/libsolv/0.7.23-r0/src/repo.h /usr/src/debug/libsolv/0.7.23-r0/src/util.h /usr/src/debug/libsolv/0.7.23-r0/src/solvable.c /usr/src/debug/libsolv/0.7.23-r0/src/pool.c /usr/src/debug/libsolv/0.7.23-r0/src/util.c /usr/src/debug/libsolv/0.7.23-r0/src/cplxdeps.c /usr/src/debug/libsolv/0.7.23-r0/src/solver_private.h /usr/src/debug/libsolv/0.7.23-r0/src/chksum.h /usr/src/debug/libsolv/0.7.23-r0/src/queue.c /usr/src/debug/libsolv/0.7.23-r0/src/dirpool.c /usr/src/debug/libsolv/0.7.23-r0/src/queu
 e.h /usr/src/debug/libsolv/0.7.23-r0/src/chksum.c /usr/src/debug/libsolv/0.7.23-r0/src/bitmap.c /usr/src/debug/libsolv/0.7.23-r0/src/poolarch.c /usr/src/debug/libsolv/0.7.23-r0/src/problems.h /usr/src/debug/libsolv/0.7.23-r0/src/sha2.h /usr/src/debug/libsolv/0.7.23-r0/src/suse.c /usr/src/debug/libsolv/0.7.23-r0/src/sha2.c /usr/src/debug/libsolv/0.7.23-r0/src/bitmap.h /usr/src/debug/libsolv/0.7.23-r0/src/poolarch.h /usr/src/debug/libsolv/0.7.23-r0/src/problems.c /usr/src/debug/libsolv/0.7.23-r0/src/userinstalled.c /usr/src/debug/libsolv/0.7.23-r0/src/solverdebug.h /usr/src/debug/libsolv/0.7.23-r0/src/repo_solv.c /usr/src/debug/libsolv/0.7.23-r0/src/poolid.h /usr/src/debug/libsolv/0.7.23-r0/src/repo_write.h /usr/src/debug/libsolv/0.7.23-r0/src/cleandeps.c /usr/src/debug/libsolv/0.7.23-r0/src/solvversion.h /usr/src/debug/libsolv/0.7.23-r0/src/poolid.c /usr/src/debug/libsolv/0.7.23-r0/src/repo_solv.h /usr/src/debug/libsolv/0.7.23-r0/src/diskusage.c /usr/src/debug/libsolv/0.7.23-r0/src/r
 epo_write.c /usr/src/debug/libsolv/0.7.23-r0/src/solver.c /usr/src/debug/libsolv/0.7.23-r0/src/solver_util.c /usr/src/debug/libsolv/0.7.23-r0/src/solverdebug.c /usr/src/debug/libsolv/0.7.23-r0/src/solvversion.c /usr/src/debug/libsolv/0.7.23-r0/src/evr.c /usr/src/debug/libsolv/0.7.23-r0/src/decision.c /usr/src/debug/libsolv/0.7.23-r0/src/md5.c /usr/src/debug/libsolv/0.7.23-r0/src/order.c /usr/src/debug/libsolv/0.7.23-r0/src/solver.h /usr/src/debug/libsolv/0.7.23-r0/src/repopack.h /usr/src/debug/libsolv/0.7.23-r0/src/knownid.h /usr/src/debug/libsolv/0.7.23-r0/src/evr.h /usr/src/debug/libsolv/0.7.23-r0/src/md5.h /usr/src/debug/libsolv/0.7.23-r0/src/selection.h /usr/src/debug/libsolv/0.7.23-r0/src/pooltypes.h /usr/src/debug/libsolv/0.7.23-r0/src/selection.c /usr/src/debug/libsolv/0.7.23-r0/src/repopage.c /usr/src/debug/libsolv/0.7.23-r0/src/dirpool.h /usr/src/debug/libsolv/0.7.23-r0/src/filelistfilter.c /usr/src/debug/libsolv/0.7.23-r0/src/strpool.h /usr/src/debug/libsolv/0.7.23-r0/src/
 transaction.c /usr/src/debug/libsolv/0.7.23-r0/src/repopage.h /usr/src/debug/libsolv/0.7.23-r0/src/transaction.h /usr/src/debug/libsolv/0.7.23-r0/src/strpool.c"
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv-tools: PKGSIZE changed from 175308 to 179404 (+2%)
packages/core2-32-poky-linux/libsolv/libsolv: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolv: PV changed from "0.7.22" to "0.7.23"
packages/core2-32-poky-linux/libsolv/libsolv: PKGSIZE changed from 653752 to 674232 (+3%)
packages/core2-32-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.22 [default] to 0.7.23 [default]
packages/core2-32-poky-linux/libsolv/libsolvext: PV changed from "0.7.22" to "0.7.23"

--===============4628445863681461173==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.22-0.7.23.patch"

RnJvbSBjOTMwNjc0MDg0NTE2MWJhYjUyNWQ0MmFkMDdkMmM4NWUzZTExMDAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTM6MDE6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy4yMiAtPiAwLjcuMjMKCi0tLQogLi4uL2xpYnNvbHYve2xpYnNv
bHZfMC43LjIyLmJiID0+IGxpYnNvbHZfMC43LjIzLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYve2xpYnNvbHZfMC43LjIyLmJiID0+IGxpYnNvbHZfMC43
LjIzLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2
L2xpYnNvbHZfMC43LjIyLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29s
dl8wLjcuMjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjIzLmJiCmluZGV4IGMyN2JmOWM2N2UuLjEy
NTY5MDU3MjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNv
bHZfMC43LjIyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZf
MC43LjIzLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9v
cGVuU1VTRS9saWJzb2x2LmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRf
ci5wYXRjaCBcCiAiCiAKLVNSQ1JFViA9ICJlYTExNGIyNTdiNzhiZGE2ZWUzZTQyMzgxMThlZDkz
YmM1N2M1OTg0IgorU1JDUkVWID0gIjZkZWFjYTdjZjYxZWMyYjMyYzRhM2I0OTRhNzUxYzhkMTVl
ZmJlOGIiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxk
KykrKSIKIAotLSAKMi4zNy4zCgo=

--===============4628445863681461173==--

