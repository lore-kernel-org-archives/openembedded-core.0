Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF8FC32771
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.3946.1659679408182554141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ID5f/Yp7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101826c99fd89-ad919cb1-6a31-429c-901a-ce08afa61714-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dKYFXu1tffySzeByIc8WIgrdhHpD4pVgiJRawuQlX+k=;
	b=ID5f/Yp72QObphFGoVfE45EfeZ5LXat5fEV6pogEbm6bMdOc9eYFL9WbIav0xF/V
	hmWQ+a/QzqKbgDBbaIVBSPom153VNX21zRdNcsDXP901S0oA+wdLr0gic207vowPyS/
	AusTcqC33Grm06UFkbDoH6ZQgIjLaOoVQ9whYq4E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dKYFXu1tffySzeByIc8WIgrdhHpD4pVgiJRawuQlX+k=;
	b=gSsRs2e6Aq6GI9rCor+/yXtzfDAkQmzBDK2vTgr7OXD5GsF4gNPWucUpve7I5TeP
	SKp1RBAv729bZv2KJnYkvUPLBZjSwgQG6SNWUjYEhzhKWHJDVPn0d3vyVcJmDiN8HZA
	8H5qnhVcUNqVtSKdsoqYpG03AQH++S1GcY6qXnR0=
Content-Type: multipart/mixed; boundary="===============7273667445114110078=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.4.1 SUCCEEDED
Message-ID: 
 <010101826c99fd89-ad919cb1-6a31-429c-901a-ce08afa61714-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168893

--===============7273667445114110078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markdown* to *3.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.3.7-3.4.1.patch
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
--===============7273667445114110078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Markdown-3.3.7.dist-info -> /usr/lib/python3.10/site-packages/Markdown-3.4.1.dist-info, removed "/usr/lib/python3.10/site-packages/markdown/__pycache__/pep562.cpython-310.pyc /usr/lib/python3.10/site-packages/markdown/pep562.py"
Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.10/site-packages/Markdown-3.3.7.dist-info moved to /usr/lib/python3.10/site-packages/Markdown-3.4.1.dist-info
  /usr/lib/python3.10/site-packages/markdown/pep562.py was removed
  /usr/lib/python3.10/site-packages/markdown/__pycache__/pep562.cpython-310.pyc was removed

--===============7273667445114110078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-markdown: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.3.7.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.4.1.tar.gz"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PV changed from "3.3.7" to "3.4.1"
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.3.7 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 519373 to 496030 (-4%)
packages/core2-32-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Markdown-3.3.7.dist-info -> /usr/lib/python3.10/site-packages/Markdown-3.4.1.dist-info, removed "/usr/lib/python3.10/site-packages/markdown/__pycache__/pep562.cpython-310.pyc /usr/lib/python3.10/site-packages/markdown/pep562.py"
Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.10/site-packages/Markdown-3.3.7.dist-info moved to /usr/lib/python3.10/site-packages/Markdown-3.4.1.dist-info
  /usr/lib/python3.10/site-packages/markdown/pep562.py was removed
  /usr/lib/python3.10/site-packages/markdown/__pycache__/pep562.cpython-310.pyc was removed

--===============7273667445114110078==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.3.7-3.4.1.patch"

RnJvbSAyYTIxZTdmODk3MTZlYTE1YTE2YWYzZjU1ODAwOTMyYWE4YzQ3MTFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMjoxMzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy4zLjcgLT4gMy40LjEKCi0tLQogLi4uL3tweXRob24z
LW1hcmtkb3duXzMuMy43LmJiID0+IHB5dGhvbjMtbWFya2Rvd25fMy40LjEuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrZG93bl8zLjMuNy5iYiA9
PiBweXRob24zLW1hcmtkb3duXzMuNC4xLmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjMuNy5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjQuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbWFya2Rvd25fMy4zLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1tYXJrZG93bl8zLjQuMS5iYgppbmRleCBjNDU2Y2VjYzc4Li5lOTljMzMxMGFj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rv
d25fMy4zLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1h
cmtkb3duXzMuNC4xLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLm1kO21kNT03NDVhYWFkMGM2OWM2MDAzOWU2MzhiZmY5ZmZjNTllZCIKIGluaGVy
aXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJN
YXJrZG93biIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjYmI1MTZmMTYyMThlNjQzZDhlMGE5NWIz
MDlmNzdlYjExOGNiMTM4ZDM5YTRmMjc4NTFlNmE2MzU4MWRiODc0IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjNiODA5MDg2YmI2ZWZhZDQxNjE1NmUwMGEwZGE2NmZlNDc2MThhNWQ2OTE4ZGQ2ODhm
NTNmNDBjOGU0Y2ZlZmYiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgogCi0tIAoyLjMxLjEK
Cg==

--===============7273667445114110078==--

