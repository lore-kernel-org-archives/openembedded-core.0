Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A074C678DB
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.144509.1671136352190779105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lzZ1rQPp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185177d14d6-0ef3b26d-74d0-45ec-a440-e2e994f88f3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EHuHDm9aubnXW/zYFM0ognyljda/0HzGkrevdVh+WBA=;
	b=lzZ1rQPpsduN94NPqLjx2oHfR51lTciYF7+Vi876QuuXKEk2J0r6F19xMBbROzfl
	vu04drT2O5BSizDN7noZ8ZqWBOLhPg3n4/G19/O9oJE8MJNuIGW1rXK0c36JXm62QzX
	SmkpmdjXnB83+dkyRR6XQEO/tzPpouQ31eTMUc8w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EHuHDm9aubnXW/zYFM0ognyljda/0HzGkrevdVh+WBA=;
	b=jhZQi38x0nE3b4sptP7zYGlecBP/AK3OCUSqz08oZZspQwh6ogJMb0zJSUxzDkue
	By4A7o7/2BM2IWQY7qhZvj7mxdLhvPR+xanJzWIOpFzbRfktEaIOcOV7ur7XcZKAw8O
	0a6hX7DX20nSAy6k+sobBnUTFg2HeVHt4mTQIVyc=
Content-Type: multipart/mixed; boundary="===============5235466171213525639=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 65.6.3 SUCCEEDED
Message-ID: <01010185177d14d6-0ef3b26d-74d0-45ec-a440-e2e994f88f3f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174660

--===============5235466171213525639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *65.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-65.5.1-65.6.3.patch
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
--===============5235466171213525639==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-65.5.1-65.6.3.patch"

RnJvbSBmZDM0MzMxZjhlMzVhZTRlNmNiMTNmMjA2YWYwYzRhYTkzYWNlOTI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6NTE6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjUuNS4xIC0+IDY1LjYuMwoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182NS41LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY1LjYuMy5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjUuNS4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182NS42LjMuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggMWI1ZjljNzU3Ny4uOGRiMWYxNjBmZCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBhMGUwODczYThlZTY2NzRkNDNlNjA0ZDY2YmY2NmQ5NGZjOGVlYjZmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZDlmYmE5ODUyZGJjYTNkNmE4ZmY3ZDc2NzMxMmVmYmMx
ZTNjNWQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjUuNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjUuNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY1LjUu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjUuNi4zLmJiCmluZGV4IDhkYzcyNGU1NWEuLmE4YmNiM2E2MDIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY1LjUuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
NS42LjMuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gImZpbGU6Ly8wMDAxLWNoYW5nZS1zaGViYW5nLXRvLXB5dGhvbjMucGF0Y2ggXAogICAg
ICAgICAgICAgZmlsZTovLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3Nz
aWJsZS10by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUxOTdhMTlh
YThlYzk3MjI5MjhmMjIwNmY4ZGU3NTJkZWYwZTRjOWZjNjk1MzUyNzM2MGQxYzM2ZDk0ZGRiMmYi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTc2MjA3NTdiZjk4NGI1OGRlYWYzMmZjOGE0NTc3YTli
YmMwODUwY2Y5MmMyMGUxY2U0MWMzOGMxOWU1ZmI3NSIKIAogREVQRU5EUyArPSAiJHtQWVRIT05f
UE59IgogCi0tIAoyLjM3LjMKCg==

--===============5235466171213525639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.5.1.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.6.3.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info -> /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 6071920 to 6076889 (+0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added
  /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added

--===============5235466171213525639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info -> /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added
  /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added

--===============5235466171213525639==--

