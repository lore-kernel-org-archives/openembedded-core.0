Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80458CA9EBE
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.3714.1684186748009481278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dt3QJygW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a517d-85fbb066-a834-42af-bd25-a6c1e1cb2641-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mqvaXpo9w6J/ye8+l8rrz0f5mo0mQF9RkIvtGf14Too=;
	b=Dt3QJygWjM8XUj4sWWpfHt1U3LOlYyR/F0JI+DdaUeryxqVmE0tOJbdjNKWrHq+m
	gwWQN/BlBbAnk6FPLxLFvdNSzsRbxHQIvOaqOPDumEHQPeEChED0lQl8X8zhU/se3RE
	v2hSCpDyVCP1Ofsh5VRDGh+Kc034tCFk4y53Z05M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mqvaXpo9w6J/ye8+l8rrz0f5mo0mQF9RkIvtGf14Too=;
	b=Yd1KMr+9n+GZMSJKSj+d0W/1KYYyxzCAMSpRwLPEYFK6UaUVseaJwUOwddoq8vOV
	5i2ootP7amNFMXh0lEaYMITguiTZldYZyYQe2cbhLjK2slsFleVEQ8mWhCCnQwCrnbK
	lQhrZjCFw4VOL3qzkDxVwkwZT8224gJdA3OObqcQ=
Content-Type: multipart/mixed; boundary="===============0779608503668993951=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.17.0 SUCCEEDED
Message-ID: <01010188215a517d-85fbb066-a834-42af-bd25-a6c1e1cb2641-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181314

--===============0779608503668993951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.14.1-1.17.0.patch
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
--===============0779608503668993951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.14.1.tar.gz;downloadfilename=hatchling-1.14.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.17.0.tar.gz;downloadfilename=hatchling-1.17.0.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info/licenses -> /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info -> /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info, added "/usr/lib/python3.11/site-packages/hatchling/builders/__pycache__/app.cpython-311.pyc /usr/lib/python3.11/site-packages/hatchling/builders/app.py"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.14.1" to "1.17.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.14.1 [default] to 1.17.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 660679 to 680279 (+3%)
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info
  /usr/lib/python3.11/site-packages/hatchling/builders/app.py was added
  /usr/lib/python3.11/site-packages/hatchling/builders/__pycache__/app.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info
  /usr/lib/python3.11/site-packages/hatchling/builders/app.py was added
  /usr/lib/python3.11/site-packages/hatchling/builders/__pycache__/app.cpython-311.pyc was added

--===============0779608503668993951==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.14.1-1.17.0.patch"

RnJvbSA4NWY0ZWNkM2ZmN2UyYTBiZGM5NjE4NTc0ZjQ0ZGNmMjg2MTlmN2JjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTA6NTk6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjE0LjEgLT4gMS4xNy4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjE0LjEuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4xNy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTQu
MS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjE3LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE0LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTcuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE3LjAuYmIKaW5kZXggYTNkMmI3
NDFiMS4uMDVhODZmMGVmYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjE0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE3LjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NWZiYzg4Y2JkMGQ5NmMwOWMzZTkzOTJiNTFkYjUxM2Zk
NGNiNGNhZjQ3NjE1ZDY1ZjkzNWE1ZWYxNzU2MTMzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIx
MjQ0ZGIzZjQ1YjRlZjVhMDAxMDZhNDY2MTJkYTEwN2NkZmFmODVmMTU4MGI4ZTFjMDU5ZmVmYzk4
YjA5MzAiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuMzkuMgoK

--===============0779608503668993951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info/licenses -> /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info -> /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info, added "/usr/lib/python3.11/site-packages/hatchling/builders/__pycache__/app.cpython-311.pyc /usr/lib/python3.11/site-packages/hatchling/builders/app.py"
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info
  /usr/lib/python3.11/site-packages/hatchling/builders/app.py was added
  /usr/lib/python3.11/site-packages/hatchling/builders/__pycache__/app.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.14.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.17.0.dist-info
  /usr/lib/python3.11/site-packages/hatchling/builders/app.py was added
  /usr/lib/python3.11/site-packages/hatchling/builders/__pycache__/app.cpython-311.pyc was added

--===============0779608503668993951==--

