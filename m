Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64D7C7EE39
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.32144.1680384536068517963
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lXyumOVD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101873eb92bae-55e268f5-b911-4108-9278-b201c1be19a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L1R64DzNyVv9FUPqkdo8Sqds4njGZfRRpgK4SWmIepU=;
	b=lXyumOVD6Gz9oepTugDURUoAhJxsSZWIlwIaxTIZ3fy24ZgL6atqd35EpNtV1Xwh
	RnmgznXXirUMEpAGzCyvJu/fhvA/6EonQjL3ClwDKpgvkZYHBMnicRpGWt0Ic4RndXl
	lp6LYiAu5NwiPZrDaZG+x+Hu9bGAQ4SvzHuIB0Ps=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L1R64DzNyVv9FUPqkdo8Sqds4njGZfRRpgK4SWmIepU=;
	b=FdNgutMhqBSRaCXIZSdfk3jSEORVZw15NFssIrxrPDu1EwGQtcqveFHSklkyPnnK
	MFS6ehRQktsfsnPlkFFv0CVOKXE+khs8qEVHe8hvBwknEo0x3MzW2haRIgc9kLqTPWo
	1tRUlVRiMRiyg90rohG5yTDKpKi48jA+yPxG+TTA=
Content-Type: multipart/mixed; boundary="===============1893410972599544019=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.243.0 SUCCEEDED
Message-ID: <010101873eb92bae-55e268f5-b911-4108-9278-b201c1be19a4-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179533

--===============1893410972599544019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.243.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.239.0-1.3.243.0.patch
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
--===============1893410972599544019==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.239.0-1.3.243.0.patch"

RnJvbSA3ODBmNjRjYjRjZmU4YzA2ZWExZGU1ZDE4NWMzMTk5MWRiYzEyMDQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxNzozMzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjIzOS4wIC0+IDEuMy4yNDMuMAoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjIzOS4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjI0My4wLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjMuMjM5LjAu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjMuMjQzLjAuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjM5LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yNDMuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuMy4yMzkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjMuMjQzLjAuYmIKaW5kZXggYWZkNTljYmNiMS4uNGMzOWIwYzM1
MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjMuMjM5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjMuMjQzLjAuYmIKQEAgLTcsNyArNyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzkzOGI4NWJjZWI4ZmIyNmMxYTgwN2YyOGE1MmFl
MmQiCiAKLVNSQ1JFViA9ICJkMTNiNTIyMjJjMzlhN2U5YTQwMWI0NDY0NmYwY2EzYTY0MGZiZDQ3
IgorU1JDUkVWID0gIjFmZWFmNDQxNGViMmIzNTM3NjRkMDFkODhmOGFhNGJjYzY3YjYwZGIiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiBQRSA9ICIxIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFH
UkVHRVggPSAic2RrLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKLS0gCjIuMzkuMgoK

--===============1893410972599544019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/extinst.nonsemantic.debugbreak.grammar.json /usr/include/spirv/unified1/NonSemanticDebugBreak.h"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2796020 to 2818269 (+1%)
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.239.0" to "1.3.243.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.239.0 [default] to 1.3.243.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.239.0" to "1.3.243.0"
Changes to packages/core2-32-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/extinst.nonsemantic.debugbreak.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticDebugBreak.h was added

--===============1893410972599544019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/NonSemanticDebugBreak.h /usr/include/spirv/unified1/extinst.nonsemantic.debugbreak.grammar.json"
Changes to packages/core2-32-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/extinst.nonsemantic.debugbreak.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticDebugBreak.h was added

--===============1893410972599544019==--

