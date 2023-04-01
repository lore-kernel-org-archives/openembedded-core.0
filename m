Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643D3C88CB2
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.32136.1680384534748528710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z6NSEp6M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101873eb92685-4b222ae8-0904-49ed-b59f-7d79a5dfafdb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tIvWPhubjGHrmYupsFmstpOS7AmQ1qzIYEV9zwd7S8g=;
	b=Z6NSEp6M70UHcIxgnM1gtNfpqYYwlJ8iOCc7oXAg+8PDTXwQ4q2cvPKXISF5D9DR
	qmCg+zw+PS+vuIGaYlowBjDCwwdTsQ8GNfIOsrvdJtTZQkW4tCyzpo6g7tA2QgsQRd7
	ec4uijx/j0fcT+L6YLYOtAQRLcREdr4cA6+cUbEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tIvWPhubjGHrmYupsFmstpOS7AmQ1qzIYEV9zwd7S8g=;
	b=BUzvlNLEn0h1U/KlBqHeJ08XORfl5RISzKE8I+ZWlMFA96qLctEKxZdcN2O+mY/2
	y+VBjpGtDUTPNmfXqU+6DvpbT41q9kKBwUImRk1lLDKBzkqkb3OT9GGIuZqG+fBwQg+
	PoWHHVddgQd1d4jFVfyoCJe1MWCpdhfArSK7czqA=
Content-Type: multipart/mixed; boundary="===============5342071585626161104=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.44.1 SUCCEEDED
Message-ID: <010101873eb92685-4b222ae8-0904-49ed-b59f-7d79a5dfafdb-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179503

--===============5342071585626161104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygobject* to *3.44.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.42.2-3.44.1.patch
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
--===============5342071585626161104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygobject: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.2.tar.xz file://0001-Do-not-build-tests.patch" to "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.44/pygobject-3.44.1.tar.xz file://0001-Do-not-build-tests.patch"
packages/core2-32-poky-linux/python3-pygobject: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1055308 to 1056748 (+0%)
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 923558 to 924924 (+0%)
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.42.2" to "3.44.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 707955 to 708283 (+0%)
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.11/site-packages/PyGObject-3.42.2.egg-info", added "/usr/lib/python3.11/site-packages/PyGObject-3.44.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.42.2 [default] to 3.44.1 [default]
Changes to packages/core2-32-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.11/site-packages/PyGObject-3.42.2.egg-info moved to /usr/lib/python3.11/site-packages/PyGObject-3.44.1.egg-info

--===============5342071585626161104==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.42.2-3.44.1.patch"

RnJvbSBhZDJmYjQ5ODEyMTUxNTA4YmE0Mzg3Mjk5ZjhmNGVjMDI5YmNhYTU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwOTo1MjowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnb2JqZWN0OiB1cGdyYWRlIDMuNDIuMiAtPiAzLjQ0LjEKCi0tLQogLi4ue3B5dGhv
bjMtcHlnb2JqZWN0XzMuNDIuMi5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjQ0LjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdvYmplY3RfMy40Mi4y
LmJiID0+IHB5dGhvbjMtcHlnb2JqZWN0XzMuNDQuMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDIuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy40NC4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWdvYmplY3RfMy40Mi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDQuMS5iYgppbmRleCBjYzdiMDdl
ODA0Li4xMTMyZTlhOWVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlnb2JqZWN0XzMuNDIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDQuMS5iYgpAQCAtMTgsNyArMTgsNyBAQCBTUkNf
VVJJID0gIiBcCiAgICAgaHR0cDovL2Z0cC5nbm9tZS5vcmcvcHViL0dOT01FL3NvdXJjZXMvJHtT
UkNOQU1FfS8ke0Bnbm9tZV92ZXJkaXIoIiR7UFZ9Iil9LyR7U1JDTkFNRX0tJHtQVn0udGFyLnh6
IFwKICAgICBmaWxlOi8vMDAwMS1Eby1ub3QtYnVpbGQtdGVzdHMucGF0Y2ggXAogIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImFkZTg2OTVlMmE3MDczODQ5ZGQwMzE2ZDMxZDg3MjhlMTVlMWUwYmM3
MWQ5ZmY2ZDFjMDllODZiZTUyYmM5NTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2M2ODA1ZDEz
MjFiZTkwY2MzMmU2NDgyMTVhNTYyNDMwZTBkM2Q2ZWRjZGE4ZjRjNWU3YTlkYWZmY2FkNTcxMCIK
IAogUyA9ICIke1dPUktESVJ9LyR7U1JDTkFNRX0tJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============5342071585626161104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.11/site-packages/PyGObject-3.42.2.egg-info", added "/usr/lib/python3.11/site-packages/PyGObject-3.44.1.egg-info"
Changes to packages/core2-32-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.11/site-packages/PyGObject-3.42.2.egg-info moved to /usr/lib/python3.11/site-packages/PyGObject-3.44.1.egg-info

--===============5342071585626161104==--

