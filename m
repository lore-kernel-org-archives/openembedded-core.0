Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971A7C64EB1
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.849.1667349633238799225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FUQk5wTK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c85a0e-a18bc7cd-6096-46d0-bc00-ed307c951401-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V3thmXjF3ZWTItmz0JxSO9vUHuODCwgaPYU0yIQF2Mg=;
	b=FUQk5wTKaF5WjO2ZzT/mbrluPi2HMjAoqVt5/HYGQhpGRGeGMo8FX9PvlKxjLWaK
	/kWHm5ZePDnR/Uqj9L8aV0kieG1fMLgqk5sko+uakcX+uDy88E+t2v0/J09uUKz78BV
	hKq+OkKqnBQmvpXpopWx1QWG2t8jubULwNyP7g3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V3thmXjF3ZWTItmz0JxSO9vUHuODCwgaPYU0yIQF2Mg=;
	b=doLyySXWidT8Db/MosXH5aATjoeli5yKNpjo2wpK2m4yiZwIhhWkg47mip91pTPK
	x+7SSHnfMPkdvcq3UYYTBCOt1/RKfjq708Josg4DygPOcnaA1I0qfUlDquNJP0VWUJl
	dyMWcUB8jip1NTK8mQpfh4HPp2YlV4s2+XdX/sCM=
Content-Type: multipart/mixed; boundary="===============5030664761499278965=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.10.0 SUCCEEDED
Message-ID: <0101018435c85a0e-a18bc7cd-6096-46d0-bc00-ed307c951401-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172439

--===============5030664761499278965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.9.0-3.10.0.patch
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
--===============5030664761499278965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.10.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.9.0" to "3.10.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 30276 to 31831 (+5%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info -> /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info, removed "/usr/lib/python3.11/site-packages/__pycache__/zipp.cpython-311.pyc /usr/lib/python3.11/site-packages/zipp.py", added "/usr/lib/python3.11/site-packages/zipp/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/zipp/__pycache__/py310compat.cpython-311.pyc /usr/lib/python3.11/site-packages/zipp/__init__.py /usr/lib/python3.11/site-packages/zipp/py310compat.py"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/zipp/__init__.py was added
  /usr/lib/python3.11/site-packages/zipp/py310compat.py was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__ was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__/py310compat.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/__pycache__ was removed
  /usr/lib/python3.11/site-packages/__pycache__/zipp.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/zipp.py was removed

--===============5030664761499278965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info -> /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info, removed "/usr/lib/python3.11/site-packages/zipp.py /usr/lib/python3.11/site-packages/__pycache__/zipp.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/zipp/__init__.py /usr/lib/python3.11/site-packages/zipp/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/zipp/__pycache__/py310compat.cpython-311.pyc /usr/lib/python3.11/site-packages/zipp/py310compat.py"
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/zipp/__init__.py was added
  /usr/lib/python3.11/site-packages/zipp/py310compat.py was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__ was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/zipp/__pycache__/py310compat.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/__pycache__ was removed
  /usr/lib/python3.11/site-packages/__pycache__/zipp.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/zipp-3.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/zipp.py was removed

--===============5030664761499278965==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.9.0-3.10.0.patch"

RnJvbSBjMWM3ODNmZmEwNGM5MWQxZDY1NjE0NThhNWJiNWViZjNkMWE1NDdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMToxNToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtemlwcDogdXBncmFkZSAzLjkuMCAtPiAzLjEwLjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy16aXBwXzMuOS4wLmJiID0+IHB5dGhvbjMtemlwcF8zLjEwLjAuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy16aXBwXzMuOS4wLmJiID0+IHB5dGhv
bjMtemlwcF8zLjEwLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXppcHBfMy45LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtemlwcF8zLjEwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy45LjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTAu
MC5iYgppbmRleCAwMGM1NWNiZTdmLi41NmQ4ZTcwNmM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjkuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjEwLjAuYmIKQEAgLTMsNyArMyw3IEBA
IEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9qYXJhY28vemlwcCIKIExJQ0VOU0UgPSAi
TUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9N2E3MTI2ZTA2ODIw
NjI5MGYzZmU5ZjhkNmM3MTNlYTYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYTdhZjkxYzNk
YjQwZWM3MmRkOWQxNTRhZTE4ZTAwOGM2OWVmZThjYTg4ZGRlNGY5YTczMWJiODJmZTJmOWViIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhNzI2MmZkOTMwYmQzZTM2YzUwYjlhNjQ4OTdhZWMzZmFm
ZmYzZGZkZWVjOTYyM2FlMjJiNDBlOTNmOTliYjgiCiAKIERFUEVORFMgKz0gIiR7UFlUSE9OX1BO
fS1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiAKLS0gCjIuMzEuMQoK

--===============5030664761499278965==--

