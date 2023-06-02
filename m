Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AAECA9ED7
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.7533.1685693432784147975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xu43+MiR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b288133-17f6ca41-3f9e-4375-b50b-afadd4ceb375-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DBYmnXcyI0rdrzKQXS/F5ajdrvOEQzgyNqCd3EqloeI=;
	b=Xu43+MiRo6tJTVv/qYKYTlwW1+jTapXOg84bbPZYo39HggFF7XbTR2e3q2X1Est3
	VtKTrYcoFYntn8KApfXqA+izB+VlYTgOeByUPc/zInlxCyPFuQXThRc9DjVRAES6gBb
	e4xQLGrwV/vUENXlCRohXqYWwsA3pHbBNDsD/ugk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DBYmnXcyI0rdrzKQXS/F5ajdrvOEQzgyNqCd3EqloeI=;
	b=KfXA80d6zglsS8uQrfPZDPdgrOynKHmslYxIg67jydxE2y3L0iYsvajX3tDArESV
	5d2v1yEZts+qaMC+pXSIom+TYHJjX94GrFpvKpINFqBuReR1wpaWHUintM7AwAhcaqQ
	bU9VWNktD0PXLXb2T98f3ZGvQaI2JWNuQ857Y3X8=
Content-Type: multipart/mixed; boundary="===============4765736396876910923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 0.29.35 SUCCEEDED
Message-ID: <010101887b288133-17f6ca41-3f9e-4375-b50b-afadd4ceb375-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182189

--===============4765736396876910923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *0.29.35* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.34-0.29.35.patch
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
--===============4765736396876910923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-0.29.34.dist-info moved to /usr/lib/python3.11/site-packages/Cython-0.29.35.dist-info

--===============4765736396876910923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.34-0.29.35.patch"

RnJvbSAwZjBlN2NkNGNmMzkxN2FmNWQ2MGZmMGI5OWYyMDAzNjY4ZjI2MWEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNDowMjo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDAuMjkuMzQgLT4gMC4yOS4zNQoKLS0tCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jICAgICAgICAgICAgICAgICAgfCAy
ICstCiAuLi4ve3B5dGhvbjMtY3l0aG9uXzAuMjkuMzQuYmIgPT4gcHl0aG9uMy1jeXRob25fMC4y
OS4zNS5iYn0gICAgfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jeXRo
b25fMC4yOS4zNC5iYiA9PiBweXRob24zLWN5dGhvbl8wLjI5LjM1LmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYwppbmRleCAyYjc3
ODQ5M2NkLi43MTU5NmNhZWRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbi1jeXRob24uaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uLWN5dGhvbi5pbmMKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSIKIFBZ
UElfUEFDS0FHRSA9ICJDeXRob24iCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxOTA5Njg4ZjVkN2I1MjFhNjBjMzk2ZDIwYmJhOWU0
N2ExYjJkMjc4NGJmYjA4NTQwMWUxZTFlN2QyOWEyOWE4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZlMzgxZmEwYmYwOGIzYzI2ZWMyZjYxNmIxOWFlODUyYzA2ZjU3NTBmNDI5MDExOGJmOTg2YjZm
ODVjOGM1MjciCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJDeXRob24tKD9QPHB2ZXI+LiopXC50
YXIiCiAKIGluaGVyaXQgcHlwaQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWN5dGhvbl8wLjI5LjM0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWN5dGhvbl8wLjI5LjM1LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzAuMjku
MzQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRo
b25fMC4yOS4zNS5iYgotLSAKMi4zOS4yCgo=

--===============4765736396876910923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.34" to "0.29.35"
packages/core2-32-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.34.tar.gz;downloadfilename=Cython-0.29.34.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.35.tar.gz;downloadfilename=Cython-0.29.35.tar.gz"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 7838848 to 7838956 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.34" to "0.29.35"
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.34" to "0.29.35"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.34" to "0.29.35"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.34" to "0.29.35"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8578776 to 8582915 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.34" to "0.29.35"
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.34" to "0.29.35"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 10312310 to 10315845 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.34 [default] to 0.29.35 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.34" to "0.29.35"
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-0.29.34.dist-info moved to /usr/lib/python3.11/site-packages/Cython-0.29.35.dist-info

--===============4765736396876910923==--

