Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACB9C87FE3
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.24036.1677681914530581385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HbS8x6h3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101869da26f3b-a86da63d-32a2-4128-bebe-f3b6151c80bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mzRIeXu3hhJy9q81RppLxuJ9PxTUnrpketIMq71lUyw=;
	b=HbS8x6h3Ok8tmAVqDVSr0UZ0kxg6BzR8ApuJuGhCOuA2APwpgRz0Q3dqBZ6gk06Y
	OEWKu/BqGqhyYyzodJtzOyo7tTtioZBCQTuOOCsoiQN8CwfpMxXXWlN0k33Fx+p9uE8
	iRh/w7CHf+vZVW2IcAn+zoQOJIMDJBkw7p8SLLJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mzRIeXu3hhJy9q81RppLxuJ9PxTUnrpketIMq71lUyw=;
	b=ds85ycedXOtWYGZvz2mAx7xKOKIZkmy+ym2SoBCqbo3rAomd8BkTSzCLp3gY0RMg
	3h3nDrNQjSiMuWUpBIhhGiNPdTn4tVn5QWRVF8FqkMvg2zy8Zgf7JTcSXUOBpu4rY+F
	1xKLCSONugRhms9TcETwbJB+k17mlp7jCPv+l0cU=
Content-Type: multipart/mixed; boundary="===============5219756805865502100=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.12.1 SUCCEEDED
Message-ID: <010101869da26f3b-a86da63d-32a2-4128-bebe-f3b6151c80bc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177900

--===============5219756805865502100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-babel* to *2.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.11.0-2.12.1.patch
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
--===============5219756805865502100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-babel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.12.1.tar.gz"
packages/core2-32-poky-linux/python3-babel: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Babel-2.11.0.dist-info -> /usr/lib/python3.11/site-packages/Babel-2.12.1.dist-info, added "/usr/lib/python3.11/site-packages/babel/locale-data/cv_RU.dat /usr/lib/python3.11/site-packages/babel/locale-data/oc.dat /usr/lib/python3.11/site-packages/babel/locale-data/cv.dat /usr/lib/python3.11/site-packages/babel/locale-data/oc_FR.dat /usr/lib/python3.11/site-packages/babel/locale-data/tok.dat /usr/lib/python3.11/site-packages/babel/locale-data/frr.dat /usr/lib/python3.11/site-packages/babel/locale-data/raj.dat /usr/lib/python3.11/site-packages/babel/locale-data/sms.dat /usr/lib/python3.11/site-packages/babel/locale-data/mdf.dat /usr/lib/python3.11/site-packages/babel/locale-data/ann.dat /usr/lib/python3.11/site-packages/babel/locale-data/bgc.dat /usr/lib/python3.11/site-packages/babel/locale-data/bho.dat /usr/lib/python3.11/site-packages/babel/locale-data/ann_NG.dat /u
 sr/lib/python3.11/site-packages/babel/localtime/__pycache__/_fallback.cpython-311.pyc /usr/lib/python3.11/site-packages/babel/locale-data/pis_SB.dat /usr/lib/python3.11/site-packages/babel/py.typed /usr/lib/python3.11/site-packages/babel/locale-data/pis.dat /usr/lib/python3.11/site-packages/babel/locale-data/raj_IN.dat /usr/lib/python3.11/site-packages/babel/locale-data/bgc_IN.dat /usr/lib/python3.11/site-packages/babel/locale-data/bho_IN.dat /usr/lib/python3.11/site-packages/babel/locale-data/oc_ES.dat /usr/lib/python3.11/site-packages/babel/localtime/_helpers.py /usr/lib/python3.11/site-packages/babel/locale-data/frr_DE.dat /usr/lib/python3.11/site-packages/babel/locale-data/mdf_RU.dat /usr/lib/python3.11/site-packages/babel/locale-data/tok_001.dat /usr/lib/python3.11/site-packages/babel/locale-data/sms_FI.dat /usr/lib/python3.11/site-packages/babel/localtime/__pycache__/_helpers.cpython-311.pyc /usr/lib/python3.11/site-packages/babel/localtime/_fallback.py"
packages/core2-32-poky-linux/python3-babel/python3-babel: PV changed from "2.11.0" to "2.12.1"
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGSIZE changed from 30455511 to 32454058 (+7%)
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGV changed from 2.11.0 [default] to 2.12.1 [default]
Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.11/site-packages/Babel-2.11.0.dist-info moved to /usr/lib/python3.11/site-packages/Babel-2.12.1.dist-info
  /usr/lib/python3.11/site-packages/babel/locale-data/ann.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/ann_NG.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bgc.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bgc_IN.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bho.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bho_IN.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/cv.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/cv_RU.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/frr.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/frr_DE.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/mdf.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/mdf_RU.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/oc.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/oc_ES.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/oc_FR.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/pis.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/pis_SB.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/raj.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/raj_IN.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/sms.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/sms_FI.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/tok_001.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/tok.dat was added
  /usr/lib/python3.11/site-packages/babel/localtime/_fallback.py was added
  /usr/lib/python3.11/site-packages/babel/localtime/_helpers.py was added
  /usr/lib/python3.11/site-packages/babel/localtime/__pycache__/_fallback.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/babel/localtime/__pycache__/_helpers.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/babel/py.typed was added

--===============5219756805865502100==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.11.0-2.12.1.patch"

RnJvbSA4MGQ2ZDM1NWRkZGE0YTVjZTM1ZjIxZDUxOTg1NWY3ZGE2NjhjMDQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODoxNDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmFiZWw6IHVwZ3JhZGUgMi4xMS4wIC0+IDIuMTIuMQoKLS0tCiAuLi5hYmVsXzIuMTEu
MC5iYiA9PiBweXRob24zLWJhYmVsXzIuMTIuMS5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJhYmVsXzIuMTEuMC5iYiA9
PiBweXRob24zLWJhYmVsXzIuMTIuMS5iYn0gKDM3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmFiZWxfMi4xMS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTIuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDM3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmFi
ZWxfMi4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmFiZWxfMi4xMi4xLmJiCmluZGV4IGY2ZWFlODhiODAuLmVkYTg4NWY2MjggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjExLjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTIuMS5i
YgpAQCAtMSw5ICsxLDI4IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMg
aGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcg
aXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4
dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1t
YXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1V
cGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFy
cyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysg
TElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAxMy0yMDIyIGJ5
IHRoZSBCYWJlbCBUZWFtLCBzZWUgQVVUSE9SUyBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KKyMgK0Nv
cHlyaWdodCAoYykgMjAxMy0yMDIzIGJ5IHRoZSBCYWJlbCBUZWFtLCBzZWUgQVVUSE9SUyBmb3Ig
bW9yZSBpbmZvcm1hdGlvbi4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3Vy
Y2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICBtb2RpZmljYXRpb24sIGFy
ZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgCisj
CisKIERFU0NSSVBUSU9OID0gIkEgY29sbGVjdGlvbiBvZiB0b29scyBmb3IgaW50ZXJuYXRpb25h
bGl6aW5nIFB5dGhvbiBhcHBsaWNhdGlvbnMiCiBIT01FUEFHRSA9ICJodHRwOi8vYmFiZWwuZWRn
ZXdhbGwub3JnLyIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9ZmI5OGU5ZjIwMmI5NzhkNjU2OTgwN2I5NTI1Y2M2OTEiCitM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wZjk3ZDlhNjNlOTE0MDdiNGMw
ZDAxZWZkZTkxY2ZjMCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVlZjRiMzIyNmIwMTgwZGVk
ZGVkNDIyOTY1MWM4YjBlMWEzYTZhMjgzN2Q0NWEwNzMyNzJmMzEzZTRjZjk3ZjYiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiY2MyZDk5OTk5Y2QwMWQ0NDQyMGFlNzI1YTIxYzllMzcxMWIzYWFkYzc5
NzZkNjE0N2Y2MjJkODU4MTk2MzQ1NSIKIAogUFlQSV9QQUNLQUdFID0gIkJhYmVsIgogCi0tIAoy
LjM5LjIKCg==

--===============5219756805865502100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Babel-2.11.0.dist-info -> /usr/lib/python3.11/site-packages/Babel-2.12.1.dist-info, added "/usr/lib/python3.11/site-packages/babel/locale-data/frr_DE.dat /usr/lib/python3.11/site-packages/babel/locale-data/mdf_RU.dat /usr/lib/python3.11/site-packages/babel/locale-data/cv.dat /usr/lib/python3.11/site-packages/babel/localtime/__pycache__/_helpers.cpython-311.pyc /usr/lib/python3.11/site-packages/babel/localtime/_helpers.py /usr/lib/python3.11/site-packages/babel/py.typed /usr/lib/python3.11/site-packages/babel/locale-data/ann_NG.dat /usr/lib/python3.11/site-packages/babel/locale-data/bgc_IN.dat /usr/lib/python3.11/site-packages/babel/locale-data/bho_IN.dat /usr/lib/python3.11/site-packages/babel/locale-data/raj_IN.dat /usr/lib/python3.11/site-packages/babel/locale-data/oc_ES.dat /usr/lib/python3.11/site-packages/babel/locale-data/cv_RU.dat /usr/lib/python3.11/site-pac
 kages/babel/locale-data/pis_SB.dat /usr/lib/python3.11/site-packages/babel/locale-data/tok_001.dat /usr/lib/python3.11/site-packages/babel/localtime/__pycache__/_fallback.cpython-311.pyc /usr/lib/python3.11/site-packages/babel/locale-data/sms_FI.dat /usr/lib/python3.11/site-packages/babel/localtime/_fallback.py /usr/lib/python3.11/site-packages/babel/locale-data/pis.dat /usr/lib/python3.11/site-packages/babel/locale-data/ann.dat /usr/lib/python3.11/site-packages/babel/locale-data/bgc.dat /usr/lib/python3.11/site-packages/babel/locale-data/raj.dat /usr/lib/python3.11/site-packages/babel/locale-data/sms.dat /usr/lib/python3.11/site-packages/babel/locale-data/tok.dat /usr/lib/python3.11/site-packages/babel/locale-data/mdf.dat /usr/lib/python3.11/site-packages/babel/locale-data/bho.dat /usr/lib/python3.11/site-packages/babel/locale-data/frr.dat /usr/lib/python3.11/site-packages/babel/locale-data/oc.dat /usr/lib/python3.11/site-packages/babel/locale-data/oc_FR.dat"
Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.11/site-packages/Babel-2.11.0.dist-info moved to /usr/lib/python3.11/site-packages/Babel-2.12.1.dist-info
  /usr/lib/python3.11/site-packages/babel/locale-data/ann.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/ann_NG.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bgc.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bgc_IN.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bho.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/bho_IN.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/cv.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/cv_RU.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/frr.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/frr_DE.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/mdf.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/mdf_RU.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/oc.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/oc_ES.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/oc_FR.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/pis.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/pis_SB.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/raj.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/raj_IN.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/sms.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/sms_FI.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/tok_001.dat was added
  /usr/lib/python3.11/site-packages/babel/locale-data/tok.dat was added
  /usr/lib/python3.11/site-packages/babel/localtime/_fallback.py was added
  /usr/lib/python3.11/site-packages/babel/localtime/_helpers.py was added
  /usr/lib/python3.11/site-packages/babel/localtime/__pycache__/_fallback.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/babel/localtime/__pycache__/_helpers.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/babel/py.typed was added

--===============5219756805865502100==--

