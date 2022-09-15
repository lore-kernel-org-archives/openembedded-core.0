Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A48C6FD27
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10625.1663251513868395778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nmsCVqgU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101834183fe35-a4c68c03-66fb-4d9d-b78d-c8084b11e162-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RFlA+PQ/iNLy5udSyucChoOOWW6XgH/4Ep8DchhQV9o=;
	b=nmsCVqgU/ufKCncuw5yx9YCqsm6P9mVNULOhThIpM5dXTFQKwlXynPozBvYLOpfM
	ZcogAE2jzsdrZbCnQD3UfefjThdTJOdfYCMWwEVAems61vPEHtAAP2ynqSSdGhKmjaY
	qeNgXaqTaaNO0AWvdkNCLIxb+CT2jgEtbmVPIbtY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RFlA+PQ/iNLy5udSyucChoOOWW6XgH/4Ep8DchhQV9o=;
	b=BQXHXfsCru3ZaQWIHf+EGttW5/jGHBz4ul9f7/L4P99nIy2YjiuI21atNse69wMh
	CqW1X/XtNI7aQTfw1LrNpTwFBNMRY0UET1+UmZcBsEHeo8xGXb6ac42I54FE5z4rYkq
	+Jvs2Yr17JroX3xsuY7jXP3ZtPwcm6ffHbtfzmmU=
Content-Type: multipart/mixed; boundary="===============0169644215687428617=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 5.9.2 SUCCEEDED
Message-ID: 
 <010101834183fe35-a4c68c03-66fb-4d9d-b78d-c8084b11e162-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170733

--===============0169644215687428617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-psutil* to *5.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-5.9.1-5.9.2.patch
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
--===============0169644215687428617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: removed "/usr/lib/python3.10/site-packages/psutil/tests/__pycache__/foo.cpython-310.pyc /usr/lib/python3.10/site-packages/psutil/tests/foo.py"
Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.10/site-packages/psutil-5.9.1.dist-info moved to /usr/lib/python3.10/site-packages/psutil-5.9.2.dist-info
  /usr/lib/python3.10/site-packages/psutil/tests/foo.py was removed
  /usr/lib/python3.10/site-packages/psutil/tests/__pycache__/foo.cpython-310.pyc was removed

--===============0169644215687428617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-psutil: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.2.tar.gz"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 107268 to 107508 (+0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 54682 to 55004 (+1%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: removed "/usr/lib/python3.10/site-packages/psutil/tests/foo.py /usr/lib/python3.10/site-packages/psutil/tests/__pycache__/foo.cpython-310.pyc"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 864960 to 864816 (-0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "5.9.1" to "5.9.2"
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 679290 to 679291 (+0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGV changed from 5.9.1 [default] to 5.9.2 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PV changed from "5.9.1" to "5.9.2"
Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.10/site-packages/psutil-5.9.1.dist-info moved to /usr/lib/python3.10/site-packages/psutil-5.9.2.dist-info
  /usr/lib/python3.10/site-packages/psutil/tests/foo.py was removed
  /usr/lib/python3.10/site-packages/psutil/tests/__pycache__/foo.cpython-310.pyc was removed

--===============0169644215687428617==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-5.9.1-5.9.2.patch"

RnJvbSAwNGRiYzA3YTQ0OGQ2MGE0NjA2Njc4ZGRjMDkzYzRmNDY3MGI3MTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTA6Mjk6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBzdXRpbDogdXBncmFkZSA1LjkuMSAtPiA1LjkuMgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXBzdXRpbF81LjkuMS5iYiA9PiBweXRob24zLXBzdXRpbF81LjkuMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBzdXRpbF81LjkuMS5iYiA9PiBw
eXRob24zLXBzdXRpbF81LjkuMi5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF81LjkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg3
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGls
XzUuOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHN1dGlsXzUuOS4yLmJiCmluZGV4IDA0YjZmYjAyZGUuLjViMzEwMTQ2NTcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNS45LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF81LjkuMi5iYgpA
QCAtMyw3ICszLDcgQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lMzVmZDlmMjcxZDE5ZDVmNzQyZjIwYTlkMWY4YmI4YiIK
IEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9wc3V0aWwvIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNTdmMTgxOWI1ZDllOTVjZGZiMGM4ODFhOGE1YjdkNTQyZWQwYjdjNTIy
ZDU3NTcwNmE4MGJlZGM4NDhjODk1NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZWI4NjFhMTBi
NmMzYmIwMDcwMTA2M2IzN2U0YWZjNzU0ZjgyMTdmMGYwOWM0MjI4MDU4NmJkNmFjNzEyYjVjIgog
CiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi4zMS4xCgo=

--===============0169644215687428617==--

