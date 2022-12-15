Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DA7C71153
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.145435.1671136351362708133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JJltcOKk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010185177d1080-c27cd752-467a-497f-b222-2aa79349c7b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bRPyDIa96oyydGftESuPuNI5t0JcwTQwY/kaoiwjETc=;
	b=JJltcOKkbtzFZq5CCO7y6Kx7hyBdeB2vTp1fJ/3vNV5IHiFfpDaqPzhr6WLp+xrk
	I5SwFY4XjaNs65qyS1DzMyoYfDMBOwyiq9l94KXxQXKVTILN1V1eGFrjS1aFS3L2BDI
	KjDwuZG4esqPKIubAx5Tkh6vD9i/Wd7WLIs7mDyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bRPyDIa96oyydGftESuPuNI5t0JcwTQwY/kaoiwjETc=;
	b=aiQrTWiKmLpWXPqUOzYc3BzvIrvrytDma10jKmikPGSMof35niFnkrRDMo9rXtWC
	ZHNO4mKQnTJLCzZUIAWTenW8LTfuYgvSH0eDsDExwaaZ8leWsjHjhT+M/JES5eD91VA
	GddCwlHPlS5cxNM7yeCbQ+EARtWxHQVvWwVK45zI=
Content-Type: multipart/mixed; boundary="===============7190223998126284581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2022.12.7 SUCCEEDED
Message-ID: <01010185177d1080-c27cd752-467a-497f-b222-2aa79349c7b6-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174637

--===============7190223998126284581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2022.12.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2022.9.24-2022.12.7.patch
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
--===============7190223998126284581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2022.9.24-2022.12.7.patch"

RnJvbSBlYWI4NzI3NjFmM2FkM2VhMzE2ZDFjZjg2MjYxYzFmZTYzNzcyZWZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTA6MDA6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyMi45LjI0IC0+IDIwMjIuMTIuNwoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDIyLjkuMjQuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjIuMTIuNy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
Mi45LjI0LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDIyLjEyLjcuYmJ9ICg4NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45
LjI0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAy
Mi4xMi43LmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4yNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi4xMi43LmJiCmlu
ZGV4IGE2Yjc0NjcwNTIuLmRjYTNkMjY4MTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4yNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjEyLjcuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNjMmI3NDA0MzY5YzU4N2Mz
NTU5YWZiNjA0ZmNlMmYyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGQ5YzYwMTEyNGU1YTZi
YTk3MTJkYmM2MGQ5YzUzYzIxZTM0ZjVmNjQxZmU4MzAwMjMxNzM5NDMxMWJkY2UxNCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzNTgyNGI0YzNhOTcxMTU5NjRiNDA4ODQ0ZDY0YWExNGRiMWNjNTE4
ZjY1NjJlOGQ3MjYxNjk5ZDEzNTBhOWUzIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAot
LSAKMi4zNy4zCgo=

--===============7190223998126284581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.9.24.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.12.7.tar.gz"
packages/core2-32-poky-linux/python3-certifi: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2022.9.24" to "2022.12.7"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 300250 to 289113 (-4%)
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2022.9.24 [default] to 2022.12.7 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PV changed from "2022.9.24" to "2022.12.7"
Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/WHEEL was removed

--===============7190223998126284581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/certifi-2022.12.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/certifi-2022.9.24.dist-info/WHEEL was removed

--===============7190223998126284581==--

