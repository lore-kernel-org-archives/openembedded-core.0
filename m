Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C0BC7EE26
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.30013.1675272856389576971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EUf6ijBF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b2019-2640ead6-35fe-456f-a2e7-8ad9e8c90438-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u18lGsHQzN2sGITdCHUerOCbOj73OnpxnMAVMxW8Svo=;
	b=EUf6ijBFWa6U9xQWlZsqYlQJFktgpvdaUIuOb0kYQJa9ZQcxiPLplygnv1zh/U/b
	CHVN8v269tZGwwmxul+uWKgiPBOOBMkfbQWHOS3x4xa8YLyIBRCxifNFf3KLLbdX94u
	ucjhJMS/6sD1uM3mWydFBoJ8fXtZtq7Gb+Gd7JLY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u18lGsHQzN2sGITdCHUerOCbOj73OnpxnMAVMxW8Svo=;
	b=SBDrignCMVoT9dVfWyLfP7tT7ZIe9f9Djy8u2mpKV9gaVTeVLvT8FuxQut0qcKiB
	52Iff8/T1qoRQhRkK+2scOl9MvXEaFXFDIn/rF/dYk8ulOdlDnMrikkw5SlaHfKDVTA
	gtgBJDhsaffk+1F3gWbjrbc+Jl0DGoG77KPPY/ko=
Content-Type: multipart/mixed; boundary="===============5642722467153493242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.14 SUCCEEDED
Message-ID: <010101860e0b2019-2640ead6-35fe-456f-a2e7-8ad9e8c90438-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176608

--===============5642722467153493242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.13-1.26.14.patch
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
--===============5642722467153493242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.13-1.26.14.patch"

RnJvbSAyODIxNGFiMzYyY2Q0MmJkODBmYzI2ZGQxYWM0MzhhYjkwYzZiYjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMzowNzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAxLjI2LjEzIC0+IDEuMjYuMTQKCi0tLQogLi4uL3tweXRo
b24zLXVybGxpYjNfMS4yNi4xMy5iYiA9PiBweXRob24zLXVybGxpYjNfMS4yNi4xNC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzEuMjYuMTMu
YmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTQuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMy5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTQuYmIKc2lt
aWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXVybGxpYjNfMS4yNi4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xNC5iYgppbmRleCA3YWY5NTExN2NmLi5m
MzVhMTQxZGYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJsbGliM18xLjI2LjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11cmxsaWIzXzEuMjYuMTQuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9zaGF6b3cvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWMyODIzY2I5OTU0MzljOTg0ZmQ2
MmE5NzNkNzk4MTVjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzA4M2RkMGRjZTY4ZGJmYmUx
MTI5ZDUyNzFjYjkwZjk0NDdkZWE3ZDUyMDk3YzZlMDEyNjEyMGM1MjFkZGVhOCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIwNzY5MDdiZjhmZDM1NWNkZTc3NzI4NDcxMzE2NjI1YTRkMmY3ZTcxM2Mx
MjVmNTE5NTNiYjViM2VlY2Y0ZjcyIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAK
Mi4zNy4zCgo=

--===============5642722467153493242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.13.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.14.tar.gz"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 900718 to 900896 (+0%)
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.14.dist-info

--===============5642722467153493242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.14.dist-info

--===============5642722467153493242==--

