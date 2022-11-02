Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A73C64E94
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.878.1667349634101442584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Xn+I6aSp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018435c858ee-ae87a8ab-38dc-4cb8-94d0-e89608d82b17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K2hFrro2t7y9ZbC1pUvAxYtzn6bp5Gq3MJ0rh6XghDI=;
	b=Xn+I6aSpfwd3KTHqaeS2ybDzS3bgwh1ciVv6za9psOhwVo/Fuuy7b0NMGCvz7l9t
	OdLVPlJQ+/JJn3UQPpmkEOd6OYO8dAGLa1OietcS46SZew2Oi1BwwdEHe806OCTF3GD
	hyfu8bpnrxap/FjH3uZY1BX9solpK8Y0eUkCw5Xo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K2hFrro2t7y9ZbC1pUvAxYtzn6bp5Gq3MJ0rh6XghDI=;
	b=NzScXPTJiD6lahPvbenIre8ZVtEXGjd8nw9iAVZkZzzXiQVzX6jC7Lrb6/fB+Xn/
	S7b6bAdExlYogPNILiaKz5geK42pXUwbaOdm9fixMyVeFxLq5QtK46GYnNbjfHyjfGD
	82eM06c6EDi/+RbIlbiqde+pIJvX9RSOFTZ+cvnQ=
Content-Type: multipart/mixed; boundary="===============6943616502124652134=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.2.0 SUCCEEDED
Message-ID: <0101018435c858ee-ae87a8ab-38dc-4cb8-94d0-e89608d82b17-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172442

--===============6943616502124652134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.1.3-7.2.0.patch
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
--===============6943616502124652134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest: PV changed from "7.1.3" to "7.2.0"
packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.2.0.tar.gz"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.1.3" to "7.2.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.1.3" to "7.2.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.1.3" to "7.2.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.1.3" to "7.2.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.1.3" to "7.2.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.1.3" to "7.2.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.1.3 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pytest-7.1.3.dist-info -> /usr/lib/python3.11/site-packages/pytest-7.2.0.dist-info, added "/usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/error.cpython-311.pyc /usr/lib/python3.11/site-packages/py.py /usr/lib/python3.11/site-packages/_pytest/_py/__init__.py /usr/lib/python3.11/site-packages/__pycache__/py.cpython-311.pyc /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/_pytest/_py/path.py /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/path.cpython-311.pyc /usr/lib/python3.11/site-packages/_pytest/_py/error.py"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2447699 to 2615775 (+7%)
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "7.1.3" to "7.2.0"
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.1.3.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.2.0.dist-info
  /usr/lib/python3.11/site-packages/__pycache__ was added
  /usr/lib/python3.11/site-packages/__pycache__/py.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/py.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/error.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__init__.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/path.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__ was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/error.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/path.cpython-311.pyc was added

--===============6943616502124652134==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.1.3-7.2.0.patch"

RnJvbSAyMTBhOWM0MjgwYjk4NmE4ZjEzMmFkNzhmNWFiNjRlNDZkN2ZjNGE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDo1NTozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0OiB1cGdyYWRlIDcuMS4zIC0+IDcuMi4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0ZXN0XzcuMS4zLmJiID0+IHB5dGhvbjMtcHl0ZXN0XzcuMi4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0XzcuMS4zLmJiID0+IHB5
dGhvbjMtcHl0ZXN0XzcuMi4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfNy4xLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Rf
Ny4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXRlc3RfNy4yLjAuYmIKaW5kZXggMzczZjdmMzVmYS4uMDJmYzU1ZmRiMCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjEuMy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuMi4wLmJiCkBA
IC01LDcgKzUsNyBAQCBERVNDUklQVElPTiA9ICJUaGUgcHl0ZXN0IGZyYW1ld29yayBtYWtlcyBp
dCBlYXN5IHRvIHdyaXRlIHNtYWxsIHRlc3RzLCB5ZXQgc2NhbAogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iZDI3ZTQxYjY1NTBmZTBmYzQ1
MzU2ZDFkODFlZTM3YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRmMzY1ZmVjMmRmZjljMTE2
MmY4MzRkOWYxOGFmMWJhMTMwNjJkYjBjNzA4YmY3Yjk0NmY4YTVjNzYxODBjMzkiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYzQwMTRlYjQwZTEwZjExZjM1NWFkNGUzYzJmYjJjNmM2ZDE5MTljNzNm
M2I1YTQzM2RlNDcwODIwMmNhZGU1OSIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xz
LXNjbS1uYXRpdmUiCiAKLS0gCjIuMzEuMQoK

--===============6943616502124652134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pytest-7.1.3.dist-info -> /usr/lib/python3.11/site-packages/pytest-7.2.0.dist-info, added "/usr/lib/python3.11/site-packages/py.py /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/path.cpython-311.pyc /usr/lib/python3.11/site-packages/__pycache__/py.cpython-311.pyc /usr/lib/python3.11/site-packages/_pytest/_py/error.py /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/error.cpython-311.pyc /usr/lib/python3.11/site-packages/_pytest/_py/path.py /usr/lib/python3.11/site-packages/_pytest/_py/__init__.py"
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.1.3.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.2.0.dist-info
  /usr/lib/python3.11/site-packages/__pycache__ was added
  /usr/lib/python3.11/site-packages/__pycache__/py.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/py.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/error.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__init__.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/path.py was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__ was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/error.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/_pytest/_py/__pycache__/path.cpython-311.pyc was added

--===============6943616502124652134==--

