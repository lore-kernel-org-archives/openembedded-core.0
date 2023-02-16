Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DB4C6FD18
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10289.1676508396798391416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YgH+2nBf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018657aff996-26b54eb4-a64c-4776-91e6-f0535fc1e1af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TuQ0LPPNggOmJl0C4a4B7KiYlAPnLhM5uga/CKOHUCY=;
	b=YgH+2nBfQjEKcRw2Kw7Caivju03bplc+BuqQ/5kq4iW2MijxYATcITO6i2w/E+ys
	QtwSMX9egebQHjkrSwgHP/Z+M8l0rA1ZNZGO7HR2e04bzMmtG2mIa4Cz0GqroRuE000
	GD8jvVfxE6IYDg5sVxu+Lpj6GqX9juMyMt2Bzg78=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TuQ0LPPNggOmJl0C4a4B7KiYlAPnLhM5uga/CKOHUCY=;
	b=PwaaGdyiDyoaNVm5voREwArRGFWrq1wHzM4HgVz991G9nkdVlJuhXqxneeA/lTip
	5HEX0vwQ6t5FmzKSMCir7rYQScOhN85NH9ENLpbxLr1O/G6gSI7wAh5jN9fAhJpqsoo
	APb6dgdO6LKWFjoFR7/8BwqAUAEiyssGeCkHqBnc=
Content-Type: multipart/mixed; boundary="===============7372808730508325959=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.3.1 SUCCEEDED
Message-ID: <0101018657aff996-26b54eb4-a64c-4776-91e6-f0535fc1e1af-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177239

--===============7372808730508325959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.2.0-67.3.1.patch
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
--===============7372808730508325959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.2.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.3.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1374947 to 1375615 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "67.2.0" to "67.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-67.2.0.dist-info -> /usr/lib/python3.11/site-packages/setuptools-67.3.1.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_normalization.py /usr/lib/python3.11/site-packages/setuptools/__pycache__/_normalization.cpython-311.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 67.2.0 [default] to 67.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5273357 to 5289283 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "67.2.0" to "67.3.1"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.2.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.3.1.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_normalization.py was added
  /usr/lib/python3.11/site-packages/setuptools/__pycache__/_normalization.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.2.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.3.1.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_normalization.py was added

--===============7372808730508325959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-67.2.0.dist-info -> /usr/lib/python3.11/site-packages/setuptools-67.3.1.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_normalization.py /usr/lib/python3.11/site-packages/setuptools/__pycache__/_normalization.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.2.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.3.1.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_normalization.py was added
  /usr/lib/python3.11/site-packages/setuptools/__pycache__/_normalization.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.2.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.3.1.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_normalization.py was added

--===============7372808730508325959==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.2.0-67.3.1.patch"

RnJvbSBmODMxZjhkN2VmMTMyODI2M2RjMGE3MmZjNmIzNjExMzFjNmRlZjMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTY6MTI6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjcuMi4wIC0+IDY3LjMuMQoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182Ny4yLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY3LjMuMS5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjcuMi4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182Ny4zLjEuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggZTIyZTc1N2ZjZC4uYjEyZTRmNWQwNSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAxYTdmYmQ2YjdjY2Y5ZDNmNjliZDU5MWZhMzVmYTQ4YzBiODkxNmJhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YTY3NzEwMTMxZmMxYjgyNDZlZGM0ZGJjZDgwNzdlZWQ5
NmUxM2Y3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjcuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjcuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjIu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjcuMy4xLmJiCmluZGV4IGE0MTIwNDNhOGIuLmVmNzU5YzhiZWYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjIuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
Ny4zLjEuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5w
eS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYjQ0MGVlNWY3ZTYwN2JiOGM5ZGUxNTI1OWRiYTI1ODNkZDQxYTM4ODc5YTdhYmMxZDQz
YTcxYzU5NTI0ZGE0OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYWVjMDdmZDg0OGQ4MDY3NjY5
NGQ2YmY2OWMwMDlkMjg5MTBhZWVjZTY4YTM4ZGJlODhiN2UxYmI2ZGJhMTJlIgogCiBERVBFTkRT
ICs9ICIke1BZVEhPTl9QTn0iCiAKLS0gCjIuMzcuMwoK

--===============7372808730508325959==--

