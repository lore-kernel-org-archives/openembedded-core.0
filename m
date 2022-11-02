Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7918DC64E93
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.862.1667349634206665317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dwUSmxFc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018435c85a25-e47315aa-54d4-4eab-a061-31356725e4b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CL0psDsI/P79w+P27Scc6b6K5JzqHNe4r+M/m9RVFBo=;
	b=dwUSmxFcqt1XBYQhdfyHv90AY54UJRCRlQb5X98vIeQbgbqL5PyKM8MRsskMrqia
	24QEYqybh+x/g39aZk92vPfk396fOtofzaC7c/uBJam6lkFmGiFdUDeTCNeFAfNGGF5
	uSWxhvdawBIbJaw0DY3Qfg4EY2tp+/R9naWBVkx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CL0psDsI/P79w+P27Scc6b6K5JzqHNe4r+M/m9RVFBo=;
	b=C31S9MRIk8LV2PTkw0e3FUzCN76zhuA6GweswDZf+zpe5I34I69W+BLSwYwHVMOh
	haisEPgGkXDyK1t5UAxlS9cqWrfnBv4cSv7ZaftGpSJyQHrXbaD2yxqqPSSwEm/RKxa
	F9veHxW8cEteblKvjiTKylSO4jBQOYYMm16/555w=
Content-Type: multipart/mixed; boundary="===============5980956759410935656=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.38.0 SUCCEEDED
Message-ID: <0101018435c85a25-e47315aa-54d4-4eab-a061-31356725e4b5-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172445

--===============5980956759410935656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.38.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.37.1-0.38.0.patch
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
--===============5980956759410935656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.37.1.tar.gz file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.38.0.tar.gz file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
packages/core2-32-poky-linux/python3-wheel: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PV changed from "0.37.1" to "0.38.0"
packages/core2-32-poky-linux/python3-wheel/python3-wheel: FILELIST: directory renamed /usr/lib/python3.11/site-packages/wheel-0.37.1.dist-info -> /usr/lib/python3.11/site-packages/wheel-0.38.0.dist-info, removed "/usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/__pycache__/pkginfo.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/pkginfo.py /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_typing.py", added "/usr/lib/python3.11/site-packages/wheel/vendored/packaging/_manylinux.py /usr/lib/python3.11/site-packages/wheel/__pycache__/_setuptools_logging.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_manylinux.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_musllinux.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/_setuptools_logging.py /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_musl
 linux.py"
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.37.1 [default] to 0.38.0 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 230849 to 228318 (-1%)
Changes to packages/core2-32-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.37.1.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.38.0.dist-info
  /usr/lib/python3.11/site-packages/wheel/__pycache__/_setuptools_logging.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/wheel/_setuptools_logging.py was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_manylinux.py was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_musllinux.py was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_manylinux.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_musllinux.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/wheel/pkginfo.py was removed
  /usr/lib/python3.11/site-packages/wheel/__pycache__/pkginfo.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_typing.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_typing.py was removed

--===============5980956759410935656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-wheel/python3-wheel: FILELIST: directory renamed /usr/lib/python3.11/site-packages/wheel-0.37.1.dist-info -> /usr/lib/python3.11/site-packages/wheel-0.38.0.dist-info, removed "/usr/lib/python3.11/site-packages/wheel/__pycache__/pkginfo.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/pkginfo.py /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_typing.py", added "/usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_musllinux.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_musllinux.py /usr/lib/python3.11/site-packages/wheel/_setuptools_logging.py /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_manylinux.py /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_manylinux.cpython-311.pyc /usr/lib/python3.11/site-packages/wheel/__pycache__/_setuptools_logging.cpython
 -311.pyc"
Changes to packages/core2-32-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.37.1.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.38.0.dist-info
  /usr/lib/python3.11/site-packages/wheel/__pycache__/_setuptools_logging.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/wheel/_setuptools_logging.py was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_manylinux.py was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_musllinux.py was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_manylinux.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_musllinux.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/wheel/pkginfo.py was removed
  /usr/lib/python3.11/site-packages/wheel/__pycache__/pkginfo.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/__pycache__/_typing.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/wheel/vendored/packaging/_typing.py was removed

--===============5980956759410935656==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.37.1-0.38.0.patch"

RnJvbSBkZmMxMjU2ODk1ZTJmM2EzYTY0ZjQzZDk2OGUxZTRiY2Y1MGQ2ODRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMToxMjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2hlZWw6IHVwZ3JhZGUgMC4zNy4xIC0+IDAuMzguMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXdoZWVsXzAuMzcuMS5iYiA9PiBweXRob24zLXdoZWVsXzAuMzguMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdoZWVsXzAuMzcuMS5iYiA9PiBw
eXRob24zLXdoZWVsXzAuMzguMC5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC4zNy4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuMzguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg3
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxf
MC4zNy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2hlZWxfMC4zOC4wLmJiCmluZGV4IDJmN2RkMTIyYmEuLjJhMmFiZDFmMjUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjM3LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuMzguMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1BLRy1JTkZPO2JlZ2lubGluZT0xMDtlbmRsaW5l
PTEwO21kNT04MjI3MTgwMTI2Nzk3YTAxNDhmOTRmNDgzZjNlMTQ4OSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImU5YTUwNGU3OTNlZmJjYTFiOGUwZTljYjk3OWEyNDljZjRhMGE3YjViOGM5ZThi
NjVhNWUzOWQ0OTUyOWMxYzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDUyODQ0YWZlZTY0Y2Rk
NGJiMjgwNjFiYTZiNWMwNjgxOGIyMzdmYjQ5MDI2M2UwZGJlYTIyNzA4MGY3ZDJkNyIKIAogaW5o
ZXJpdCBweXRob25fZmxpdF9jb3JlIHB5cGkKIAotLSAKMi4zMS4xCgo=

--===============5980956759410935656==--

