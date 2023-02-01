Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59896C6FD1E
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.30352.1675272853925881843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ebd4g7nK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101860e0b1d8f-b3f625cf-a689-4315-a7ce-c32e2aa9427e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2xl8NItaQ8eZIV7Lue8GFxjF1uSldzfoEX+U7VvREHk=;
	b=ebd4g7nKQjsbNTw3cuDEU3iu0K+b0RxIi5t5AU4LenlUaeMMlZvc5jINGTWP1OnM
	i/JSF6W0mHjkFFGlqbTlzxh+Xibm7Ia2rqIaa78iyKtffRZQpt7RVlenb+fpmphijV3
	9ysvx+uQRaHSfU0eyWUeT3VG/4NNwszTcgeUpiPs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2xl8NItaQ8eZIV7Lue8GFxjF1uSldzfoEX+U7VvREHk=;
	b=DssYm+hm7I+fG8oeiH37S/Igliqfv2lPrjafa0sNTsdlxLxHkIG7dZQgTgKS6idn
	CiJg3oQ5FmJRCardkdfU+Nh9W0l7pzkEBnDWKrqIzgMouLLPkXwPmJ4PrGxzcbdW9GV
	UkhEiwgJcAOFArONpiyDi4eHZ7QVagCKvldXUH0w=
Content-Type: multipart/mixed; boundary="===============6435684387612875369=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.2.1 SUCCEEDED
Message-ID: <010101860e0b1d8f-b3f625cf-a689-4315-a7ce-c32e2aa9427e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176593

--===============6435684387612875369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.2.0-7.2.1.patch
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
--===============6435684387612875369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.2.1.tar.gz"
packages/core2-32-poky-linux/python3-pytest: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest: PV changed from "7.2.0" to "7.2.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.2.0" to "7.2.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.2.0" to "7.2.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.2.0" to "7.2.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.2.0" to "7.2.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.2.0" to "7.2.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.2.0" to "7.2.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.2.0 [default] to 7.2.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2610901 to 2612891 (+0%)
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "7.2.0" to "7.2.1"
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.2.1.dist-info

--===============6435684387612875369==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.2.0-7.2.1.patch"

RnJvbSAwNDI3YWM4MjViN2U5MjJmZWZhY2RlZGY0NzAxOGM1ZmZmNWQwODEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMjozNDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0OiB1cGdyYWRlIDcuMi4wIC0+IDcuMi4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0ZXN0XzcuMi4wLmJiID0+IHB5dGhvbjMtcHl0ZXN0XzcuMi4xLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0XzcuMi4wLmJiID0+IHB5
dGhvbjMtcHl0ZXN0XzcuMi4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfNy4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Rf
Ny4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXRlc3RfNy4yLjEuYmIKaW5kZXggMDJmYzU1ZmRiMC4uODVmYzUwN2RkZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjIuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuMi4xLmJiCkBA
IC01LDcgKzUsNyBAQCBERVNDUklQVElPTiA9ICJUaGUgcHl0ZXN0IGZyYW1ld29yayBtYWtlcyBp
dCBlYXN5IHRvIHdyaXRlIHNtYWxsIHRlc3RzLCB5ZXQgc2NhbAogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iZDI3ZTQxYjY1NTBmZTBmYzQ1
MzU2ZDFkODFlZTM3YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM0MDE0ZWI0MGUxMGYxMWYz
NTVhZDRlM2MyZmIyYzZjNmQxOTE5YzczZjNiNWE0MzNkZTQ3MDgyMDJjYWRlNTkiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZDQ1ZTA5NTJmMzcyNzI0MTkxOGI4ZmQwZjM3NmY1ZmY2YjMwMWNjMDc3
N2M2ZjlhNTU2OTM1YzkyZDhhN2Q0MiIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xz
LXNjbS1uYXRpdmUiCiAKLS0gCjIuMzcuMwoK

--===============6435684387612875369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.2.0.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.2.1.dist-info

--===============6435684387612875369==--

