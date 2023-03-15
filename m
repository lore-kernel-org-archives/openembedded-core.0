Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71725C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12146.1678895726271888402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VCqzLQft;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010186e5fbbb8e-54e1c4b9-7484-453c-8031-90809b7ed658-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b+hEXzq9RnXq6wTeo+7xqggHPr+NtP8KHSdcFc59NMk=;
	b=VCqzLQft1qsBp4hsM2+Q1wbiP9+NVMzZmBOCTkI3CGif7NuDIymq5MOHsrb0KdCh
	oAN1owYrXlTylGk+EIJPy1y7ZA/n2ubPULnrT3vZwydOCmp4ls2IC0QPJY/+NUADHWs
	MRkGqHVvUJGrKHPr+D0RHBLjM2PD76HbVF5OGf3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b+hEXzq9RnXq6wTeo+7xqggHPr+NtP8KHSdcFc59NMk=;
	b=NPwf4PMiENWqvNOdDBlp3ND6VifASns/UQOqG3iGKH+0rD58H3+CYrEsYWVUi/Sq
	j3pnlaQa0S1Rs/ePs15JcYVH6rN3fgILZpYb8HaGyWiKKHb5Hj+rsDnEQuGNyrAbPjE
	vlr6cC/WSm/UuVO7diuBD/zJd38dP3wu21YVCWMg=
Content-Type: multipart/mixed; boundary="===============4691657827652553759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.5.1 SUCCEEDED
Message-ID: <01010186e5fbbb8e-54e1c4b9-7484-453c-8031-90809b7ed658-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178602

--===============4691657827652553759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-scons* to *4.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.4.0-4.5.1.patch
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
--===============4691657827652553759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.11/site-packages/SCons-4.4.0.dist-info -> /usr/lib/python3.11/site-packages/SCons-4.5.1.dist-info, removed "/usr/lib/python3.11/site-packages/SCons/Taskmaster.py /usr/lib/python3.11/site-packages/SCons/Util.py /usr/lib/python3.11/site-packages/SCons/__pycache__/Job.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/__pycache__/Taskmaster.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/__pycache__/Util.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Job.py", added "/usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/Job.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/envs.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Taskmaster/__init__.py /usr/lib/python3.11/site-packages/SCons/Taskmaster/Job.py /usr/lib/python3.11/site-packages/SCons/Util/__init__.py /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/__i
 nit__.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Tool/__pycache__/qt3.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Tool/MSCommon/README.rst /usr/lib/python3.11/site-packages/SCons/Util/envs.py /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/types.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Tool/qt3.py /usr/lib/python3.11/site-packages/SCons/Util/types.py /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/hashes.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/hashes.py"
Changes to packages/core2-32-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.11/site-packages/SCons-4.4.0.dist-info moved to /usr/lib/python3.11/site-packages/SCons-4.5.1.dist-info
  /usr/lib/python3.11/site-packages/SCons/Taskmaster was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__init__.py was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/Job.py was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__ was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/Job.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Tool/MSCommon/README.rst was added
  /usr/lib/python3.11/site-packages/SCons/Tool/__pycache__/qt3.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Tool/qt3.py was added
  /usr/lib/python3.11/site-packages/SCons/Util was added
  /usr/lib/python3.11/site-packages/SCons/Util/envs.py was added
  /usr/lib/python3.11/site-packages/SCons/Util/hashes.py was added
  /usr/lib/python3.11/site-packages/SCons/Util/__init__.py was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__ was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/envs.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/hashes.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/types.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/types.py was added
  /usr/lib/python3.11/site-packages/SCons/Job.py was removed
  /usr/lib/python3.11/site-packages/SCons/__pycache__/Job.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/SCons/__pycache__/Taskmaster.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/SCons/__pycache__/Util.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/SCons/Taskmaster.py was removed
  /usr/lib/python3.11/site-packages/SCons/Util.py was removed

--===============4691657827652553759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.4.0-4.5.1.patch"

RnJvbSBhZjNiYmFkYjYzMGY2NzQ2OTgyZjEzNGMxOWY2YTBiMjY4ODFmMTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDg6MTE6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNjb25zOiB1cGdyYWRlIDQuNC4wIC0+IDQuNS4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc2NvbnNfNC40LjAuYmIgPT4gcHl0aG9uMy1zY29uc180LjUuMS5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2NvbnNfNC40LjAuYmIgPT4gcHl0
aG9uMy1zY29uc180LjUuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC41LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuNC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNf
NC41LjEuYmIKaW5kZXggYWQxMTQ5NTk3Zi4uMjc5MzQ3YWM5YyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuNC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjUuMS5iYgpAQCAtNSw3ICs1
LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1kOTAzYjBiODAyN2Y0NjE0MDJiYWM5YjUxNjliMzZmNyIKIAogU1JDX1VSSSArPSAiIGZp
bGU6Ly8wMDAxLUZpeC1tYW4tcGFnZS1pbnN0YWxsYXRpb24ucGF0Y2giCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNzcwM2M0ZTlkMjIwMGI0ODU0YTMxODAwYzFkYmQ0NTg3ZTFmYTg2ZTc1ZjU4Nzk1
Yzc0MGJjZmE3ZWNhN2VhYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5ZGFlYWJlNGQ4N2JhMmJk
NGVhMTU0MTA3NjVmYzFlZDJkOTMxYjcyM2U0ZGM3MzBhNDg3YTM5MTFiOWExNzM4IgogCiBQWVBJ
X1BBQ0tBR0UgPSAiU0NvbnMiCiAKLS0gCjIuMzkuMgoK

--===============4691657827652553759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-scons: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/SCons/SCons-4.4.0.tar.gz;downloadfilename=SCons-4.4.0.tar.gz file://0001-Fix-man-page-installation.patch" to "https://files.pythonhosted.org/packages/source/S/SCons/SCons-4.5.1.tar.gz;downloadfilename=SCons-4.5.1.tar.gz file://0001-Fix-man-page-installation.patch"
packages/core2-32-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons/python3-scons-doc: PKGSIZE changed from 682393 to 705113 (+3%)
packages/core2-32-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons/python3-scons-src: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons/python3-scons: PV changed from "4.4.0" to "4.5.1"
packages/core2-32-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.11/site-packages/SCons-4.4.0.dist-info -> /usr/lib/python3.11/site-packages/SCons-4.5.1.dist-info, removed "/usr/lib/python3.11/site-packages/SCons/__pycache__/Job.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/__pycache__/Taskmaster.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/__pycache__/Util.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Taskmaster.py /usr/lib/python3.11/site-packages/SCons/Util.py /usr/lib/python3.11/site-packages/SCons/Job.py", added "/usr/lib/python3.11/site-packages/SCons/Util/__pycache__/types.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/hashes.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/envs.py /usr/lib/python3.11/site-packages/SCons/Tool/MSCommon/README.rst /usr/lib/python3.11/site-packages/SCons/Tool/__pycache__/qt3.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/hashes
 .py /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/Job.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Util/__init__.py /usr/lib/python3.11/site-packages/SCons/Tool/qt3.py /usr/lib/python3.11/site-packages/SCons/Util/types.py /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/envs.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/SCons/Taskmaster/Job.py /usr/lib/python3.11/site-packages/SCons/Taskmaster/__init__.py"
packages/core2-32-poky-linux/python3-scons/python3-scons: PKGV changed from 4.4.0 [default] to 4.5.1 [default]
packages/core2-32-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 21941952 to 22028199 (+0%)
Changes to packages/core2-32-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.11/site-packages/SCons-4.4.0.dist-info moved to /usr/lib/python3.11/site-packages/SCons-4.5.1.dist-info
  /usr/lib/python3.11/site-packages/SCons/Taskmaster was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__init__.py was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/Job.py was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__ was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Taskmaster/__pycache__/Job.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Tool/MSCommon/README.rst was added
  /usr/lib/python3.11/site-packages/SCons/Tool/__pycache__/qt3.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Tool/qt3.py was added
  /usr/lib/python3.11/site-packages/SCons/Util was added
  /usr/lib/python3.11/site-packages/SCons/Util/envs.py was added
  /usr/lib/python3.11/site-packages/SCons/Util/hashes.py was added
  /usr/lib/python3.11/site-packages/SCons/Util/__init__.py was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__ was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/envs.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/hashes.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/__pycache__/types.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/SCons/Util/types.py was added
  /usr/lib/python3.11/site-packages/SCons/Job.py was removed
  /usr/lib/python3.11/site-packages/SCons/__pycache__/Job.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/SCons/__pycache__/Taskmaster.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/SCons/__pycache__/Util.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/SCons/Taskmaster.py was removed
  /usr/lib/python3.11/site-packages/SCons/Util.py was removed

--===============4691657827652553759==--

