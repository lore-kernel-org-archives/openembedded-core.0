Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B35C32767
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.6337.1660589820872736460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TMmEaAf0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182a2ddc9e1-fccd6d2c-067a-430f-bb11-abb59976d1b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h88Hqh8UQB5dOyfMUp166MI+al4L0qV6EJZECbhTy5U=;
	b=TMmEaAf0acgsxEPkwV8n53tfF06UbfUFeMOhlBDBrPgrW4z5zJpiE3IjyEA0ahVl
	TkRl28VYLddKEBuop49srm/QrqV37AnJZtHl1GxmCMYzdTD+OPLBNuDRBwBNwGMcBH9
	QDQOt3bl6Q+qSF550pNBPuUCflQPyF62cnwocCtU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h88Hqh8UQB5dOyfMUp166MI+al4L0qV6EJZECbhTy5U=;
	b=O7Hm9OfMFqXRT9IjSiTDCh4H58JTRpncBiistmPAgLHuRCyAhlKm9QkjG9bKtpBw
	M27wAowB3e+hy9pQTsXAy786Lq1rZQQ3QMBvaFnenLwiPJQ4qfpBZddT7S+tghkb0bj
	ojmTCUoy9QvRBLlE9X+w2uOmbXaa6RzZJAHZH3PQ=
Content-Type: multipart/mixed; boundary="===============3207537504542851089=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 65.0.0 SUCCEEDED
Message-ID: 
 <01010182a2ddc9e1-fccd6d2c-067a-430f-bb11-abb59976d1b6-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169377

--===============3207537504542851089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *65.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-63.4.1-65.0.0.patch
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
--===============3207537504542851089==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-63.4.1-65.0.0.patch"

RnJvbSAxNGU3NDNhMTc5MGYyODJkYWQ5MTZlMmFlNzllYzMzNzQ2ODRjMDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6NDc6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjMuNC4xIC0+IDY1LjAuMAoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182My40LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY1LjAuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjMuNC4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182NS4wLjAuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggMjg4OGUzZDYyYy4uYzc1ZjBlMGI2NSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBhMDIwZmQ5MGE3MDYwZjc3ODNlZjI4NmJjZGY5ZGJmMzA3MTg0OTc4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZGUxMDQ0MmM4Y2JjZjdjNzZlYTc0ZTA3MGNhNzJhZDU4
YWVjOGYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjMuNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjUuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzYzLjQu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjUuMC4wLmJiCmluZGV4IGUzMTY2NWYzYmUuLmUyZTg2Yjg5MTkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzYzLjQuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
NS4wLjAuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gImZpbGU6Ly8wMDAxLWNoYW5nZS1zaGViYW5nLXRvLXB5dGhvbjMucGF0Y2ggXAogICAg
ICAgICAgICAgZmlsZTovLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3Nz
aWJsZS10by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdjNzg1NGVl
MTQyOWEyNDAwOTAyOTc2MjhkYzlmNzViMzUzMThkMTkzNTM3OTY4ZTJkYzE0MDEwZWUyZjViY2Ei
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDczZjhjZDcxNGExYTY2OTFmNWViNWFiZWVhY2JmMzEz
MjQyYjdhYTJmNWViYTkzNzc2NTQyYzFhYWQ5MGM2ZiIKIAogREVQRU5EUyArPSAiJHtQWVRIT05f
UE59IgogCi0tIAoyLjMxLjEKCg==

--===============3207537504542851089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-63.4.1.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.0.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1568888 to 1571011 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "63.4.1" to "65.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 63.4.1 [default] to 65.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info -> /usr/lib/python3.10/site-packages/setuptools-65.0.0.dist-info, removed "/usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_msi.py /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_msi.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_wininst.py /usr/lib/python3.10/site-packages/setuptools/_distutils/msvc9compiler.py /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_wininst.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/msvccompiler.py /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-310.pyc", added "/usr/lib/python3.10/site-packages/setuptools/comma
 nd/editable_wheel.py /usr/lib/python3.10/site-packages/setuptools/command/__pycache__/editable_wheel.cpython-310.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4864266 to 4814430 (-1%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "63.4.1" to "65.0.0"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.0.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/command/editable_wheel.py was added
  /usr/lib/python3.10/site-packages/setuptools/command/__pycache__/editable_wheel.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_msi.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_wininst.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_msi.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_wininst.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-310.pyc was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.0.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/command/editable_wheel.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_msi.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_wininst.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvccompiler.py was removed

--===============3207537504542851089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info -> /usr/lib/python3.10/site-packages/setuptools-65.0.0.dist-info, removed "/usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_wininst.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_msi.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/msvc9compiler.py /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_msi.py /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_wininst.py /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_distutils/msvccompiler.py", added "/usr/lib/python3.10/site-packages/setuptools/comma
 nd/editable_wheel.py /usr/lib/python3.10/site-packages/setuptools/command/__pycache__/editable_wheel.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.0.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/command/editable_wheel.py was added
  /usr/lib/python3.10/site-packages/setuptools/command/__pycache__/editable_wheel.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_msi.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_wininst.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_msi.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/bdist_wininst.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvccompiler.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvc9compiler.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/__pycache__/msvccompiler.cpython-310.pyc was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.0.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/command/editable_wheel.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_msi.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/bdist_wininst.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvc9compiler.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_distutils/msvccompiler.py was removed

--===============3207537504542851089==--

