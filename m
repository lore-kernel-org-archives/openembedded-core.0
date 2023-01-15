Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1C7C71157
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.145830.1673805743891763141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K1AZfJIN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185b698c488-d3c00fbc-9175-471e-8884-416a133b8cf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RwjIv48vuNJhdUqAFBj2AexOsSdpBoAjqAiy6AKgSEs=;
	b=K1AZfJINIpzzTZWtTRGLHJYh926MJGn4WSvCr4T1GRZGWjLQQYVzHHX0hoKMsVcQ
	W7XhnhtJyHty75cBDOM0FLjnlC7fTtLRNCgXU0JDJqwxVWiP2cjS6xPpcXmdI0oGQX3
	dvKAgm2UhZo7Ug0qqJcxCFw2r1rBO7l9RIp4zxrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RwjIv48vuNJhdUqAFBj2AexOsSdpBoAjqAiy6AKgSEs=;
	b=QwbGsxzPEo4lpGzpt+vme2tvveZYEl6vLDokpjLo6S/fHAEcaCtcXT2FmtWJcTcv
	0V8WwK8kYuG3mUr4O3JzGktIzu1bkUf1VFJC6tjnNpNw+l6TnnLfQgjLguuKjFe+Y7N
	K9zonHqSbezxF1OHva3oPAtaabgX32VOcf+iNxjI=
Content-Type: multipart/mixed; boundary="===============5446993012301020534=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.14.0 SUCCEEDED
Message-ID: <01010185b698c488-d3c00fbc-9175-471e-8884-416a133b8cf4-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175912

--===============5446993012301020534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.13.0-2.14.0.patch
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
--===============5446993012301020534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygments: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.13.0.tar.gz" to "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.14.0.tar.gz"
packages/core2-32-poky-linux/python3-pygments: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PV changed from "2.13.0" to "2.14.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 7595211 to 7734713 (+2%)
packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Pygments-2.13.0.dist-info -> /usr/lib/python3.11/site-packages/Pygments-2.14.0.dist-info, removed "/usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/mcfunction.py", added "/usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/fift.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/phix.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/jsonnet.py /usr/lib/python3.11/site-packages/pygments/lexers/wowtoc.py /usr/lib/python3.11/site-packages/pygments/lexers/arturo.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/arturo.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/jsonnet.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/tlb.py /usr/lib/python3.11/site-packages/py
 gments/lexers/__pycache__/mips.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/minecraft.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wren.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tlb.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/func.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/func.py /usr/lib/python3.11/site-packages/pygments/lexers/mips.py /usr/lib/python3.11/site-packages/pygments/lexers/minecraft.py /usr/lib/python3.11/site-packages/pygments/lexers/wren.py /usr/lib/python3.11/site-packages/pygments/lexers/fift.py /usr/lib/python3.11/site-packages/pygments/lexers/phix.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wowtoc.cpython-311.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.13.0 [default] to 2.14.0 [default]
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.11/site-packages/Pygments-2.13.0.dist-info moved to /usr/lib/python3.11/site-packages/Pygments-2.14.0.dist-info
  /usr/lib/python3.11/site-packages/pygments/lexers/arturo.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/fift.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/func.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/jsonnet.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/minecraft.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/mips.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/phix.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/arturo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/fift.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/func.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/jsonnet.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/minecraft.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/mips.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/phix.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tlb.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wowtoc.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wren.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/tlb.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/wowtoc.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/wren.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/mcfunction.py was removed
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-311.pyc was removed

--===============5446993012301020534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Pygments-2.13.0.dist-info -> /usr/lib/python3.11/site-packages/Pygments-2.14.0.dist-info, removed "/usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/mcfunction.py", added "/usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wren.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/mips.py /usr/lib/python3.11/site-packages/pygments/lexers/phix.py /usr/lib/python3.11/site-packages/pygments/lexers/fift.py /usr/lib/python3.11/site-packages/pygments/lexers/wren.py /usr/lib/python3.11/site-packages/pygments/lexers/func.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/arturo.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/func.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/jsonnet.py /usr/lib/
 python3.11/site-packages/pygments/lexers/__pycache__/mips.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tlb.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/tlb.py /usr/lib/python3.11/site-packages/pygments/lexers/wowtoc.py /usr/lib/python3.11/site-packages/pygments/lexers/arturo.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wowtoc.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/minecraft.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/minecraft.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/fift.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/phix.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/jsonnet.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.11/site-packages/Pygments-2.13.0.dist-info moved to /usr/lib/python3.11/site-packages/Pygments-2.14.0.dist-info
  /usr/lib/python3.11/site-packages/pygments/lexers/arturo.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/fift.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/func.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/jsonnet.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/minecraft.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/mips.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/phix.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/arturo.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/fift.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/func.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/jsonnet.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/minecraft.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/mips.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/phix.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tlb.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wowtoc.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/wren.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/tlb.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/wowtoc.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/wren.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/mcfunction.py was removed
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/mcfunction.cpython-311.pyc was removed

--===============5446993012301020534==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.13.0-2.14.0.patch"

RnJvbSA2MWJhM2FhZDBhNTYwNWE1MjYyYzgxZGU3OTg1MGY4OWIzNjRkZmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTI6MTU6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMTMuMCAtPiAyLjE0LjAKCi0tLQogLi4uL3tweXRo
b24zLXB5Z21lbnRzXzIuMTMuMC5iYiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTQuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdtZW50c18yLjEzLjAu
YmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjE0LjAuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTMuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjE0LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z21lbnRzXzIuMTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTQuMC5iYgppbmRleCA1OTcwNmNjMjAwLi4x
Njc2OWU5MjYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnbWVudHNfMi4xMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdtZW50c18yLjE0LjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzZhMTNj
OTA1MTRlMjg5OWYxZWJhN2Y0MWMzZWU1OTIiCiAKIGluaGVyaXQgc2V0dXB0b29sczMKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1NmE4NTA4YWU5NWY5OGUyYjliZGY5M2E2YmU1YWUzZjdkOGFmODU4
YjQzZTAyYzVhMmZmMDgzNzI2YmU0MGMxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIzZWQwNmE5
ZThhYzlhOWFhZTVhNmY1ZGJlNzhhOGE1ODY1NWQxN2I0M2I5M2MwNzhmMDk0ZGRjNDc2YWUyOTci
CiAKIERFUEVORFMgKz0gIlwKICAgICAgICAgICAgICR7UFlUSE9OX1BOfSBcCi0tIAoyLjM3LjMK
Cg==

--===============5446993012301020534==--

