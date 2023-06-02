Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3ACCA9ED3
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7621.1685693431401227971
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VeDJkLXi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b288334-44ad4977-2f9a-4c66-9982-36d234dc7407-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iwDLZgiOFKIe/yJjRmXvYDqP4u9vmdHiRr/sMo7qNSg=;
	b=VeDJkLXijl4r72mULzyE2aYWN5Ar8pAX8CCD3RLyz6p7OkOrlm6nSOA5jnqCqXxw
	DELHQlposHiaa+IC766xaYat0eqX7CBXuSLQghcuG29BVL4zoh7ABimn/uFtmbT2bss
	OLp88astBbW0SfV9aP+71RoQuaBbOyu5ON52UB0Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iwDLZgiOFKIe/yJjRmXvYDqP4u9vmdHiRr/sMo7qNSg=;
	b=bOZqZWjOpGu29jE/5j198nN6BujOLf1pWQRATJq41YjsyY6Uj7ODn1E4RMu3x39e
	vGXvfDj997WkBo51VvqMNBx6hWRwq1se3cGn4uhzG1Va9Thw1ijskgi4bLOFE4dr2i5
	0quXcQwDOlLyRSWdtb3YSyELCisAduHPTfbBYlYg=
Content-Type: multipart/mixed; boundary="===============3198091729439776982=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.18.0 SUCCEEDED
Message-ID: <010101887b288334-44ad4977-2f9a-4c66-9982-36d234dc7407-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182196

--===============3198091729439776982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.17-3.18.0.patch
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
--===============3198091729439776982==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.17-3.18.0.patch"

RnJvbSAwZjgwMzk4OTZkYjBlZGFkNmFmYTFiYjk5NmY1ZWI5MzllMmQ5MTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjoxNDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21lOiB1cGdyYWRlIDMuMTcgLT4gMy4xOC4wCgotLS0KIC4uLmhvbjMt
cHljcnlwdG9kb21lXzMuMTcuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xOC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21lXzMu
MTcuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xOC4wLmJifSAoMzglKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4x
Ny5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVf
My4xOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMzglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xNy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjE4LjAuYmIK
aW5kZXggMDVmNjU0ZjIyNS4uYTFlNGI0MmJkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjE3LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xOC4wLmJiCkBAIC0x
LDUgKzEsNSBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5oZXJpdCBzZXR1
cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmNlMmUyZDhlODJmY2Y5NzIwMDU2NTIz
NzFhM2U4NzMxOTU2YTBjMWZiYjcxOWNjODk3OTQzYjM2OTVhZDkxYiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJjOWFkZWU2NTNmYzg4MmQ5ODk1NmUzM2NhMmMxZmI1ODJlMjNhOGFmN2FjODJmZWU3
NWJkNjExM2M1NWEwNDEzIgogCi0tIAoyLjM5LjIKCg==

--===============3198091729439776982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/WHEEL was removed

--===============3198091729439776982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.17.tar.gz;downloadfilename=pycryptodome-3.17.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.18.0.tar.gz;downloadfilename=pycryptodome-3.18.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodome: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1106284 to 1038032 (-6%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2772376 to 2774997 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2870721 to 2878604 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3655637 to 3640882 (-0%)
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.18.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/WHEEL was removed

--===============3198091729439776982==--

