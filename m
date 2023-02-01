Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5A4C74A44
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30010.1675272855416563684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dS9ammmM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101860e0b1cfa-8dd8ebf7-6dea-494b-9f2d-7b04d172caca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6C0r8pRB+XYVVFQNoe7QKMNH7lFQnlXYamSjdHcA4fA=;
	b=dS9ammmM2YjRIGL1GmcpWdQsjvtkUr1ibknj6z1DzD8IgeyUCqyJfffGlLJe7f6a
	b32OqXVyqjREDYhPa6DmLafMxUY1pHW/hLOKA21i5tMgCzihx6IDmV1Vb/N7Uz5CmFe
	6xhxboO2+YWEycAHTOiJUYI9f60nektQJ1svcm7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6C0r8pRB+XYVVFQNoe7QKMNH7lFQnlXYamSjdHcA4fA=;
	b=H/6BSZS14RDyODg84LYwqv93j1ScYwFPC1fPBfBRqm9X3rOjNV9IPgUy904ZTAKd
	VthnWNfOha7qzdvkM5EQtuZX59k7L1PwtJlRZtLTJ3wnjs8lH8ggE4tS3hoS3EuXRi+
	KbnVAf8kPAKk1xMMiunvnuKxnAE62vdQM93ReW/g=
Content-Type: multipart/mixed; boundary="===============4144310528151036146=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex: upgrading to 3.17 SUCCEEDED
Message-ID: <010101860e0b1cfa-8dd8ebf7-6dea-494b-9f2d-7b04d172caca-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176594

--===============4144310528151036146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodomex* to *3.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-upgrade-3.16.0-3.17.patch
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
--===============4144310528151036146==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-upgrade-3.16.0-3.17.patch"

RnJvbSA1ZmI0M2ZjNmM1ZmJjZmRiMjc1NTdjMzMxZTgzOWIzYWU3YzM1ZDE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMTo1NToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21leDogdXBncmFkZSAzLjE2LjAgLT4gMy4xNwoKLS0tCiAuLi5uMy1w
eWNyeXB0b2RvbWV4XzMuMTYuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xNy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3J5cHRvZG9tZXhf
My4xNi4wLmJiID0+IHB5dGhvbjMtcHljcnlwdG9kb21leF8zLjE3LmJifSAoNjklKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4
XzMuMTYuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0
b2RvbWV4XzMuMTcuYmIKc2ltaWxhcml0eSBpbmRleCA2OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xNi4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8z
LjE3LmJiCmluZGV4IDM2ZWY3NzI4NjMuLjcyMGFlYzJkMzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTYuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjE3
LmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5o
ZXJpdCBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTliYTlkOGVkNjM4NzMz
YzllOTU2NjQ0NzBiNzFkNjI0YTZkZWYxNDllMmRiNmNjNTJjMWFjYTVhNmEyZGYxZCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwYWY5M2FhZDhkNjJlODEwMjQ3YmVlZGVmMDI2MWMxNDg3OTBjNTJm
M2NkMzM2NDM3OTFjYzYzOTZkZDIxN2MxIgogCiBGSUxFUzoke1BOfS10ZXN0cyA9ICIgXAogICAg
ICR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9L0NyeXB0b2RvbWUvU2VsZlRlc3QvIFwKLS0gCjIu
MzcuMwoK

--===============4144310528151036146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodomex: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.16.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.17.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1042416 to 1068560 (+3%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2772209 to 2772376 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 2847142 to 2874599 (+1%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3639831 to 3648934 (+0%)
Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/WHEEL was removed

--===============4144310528151036146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info/WHEEL was removed

--===============4144310528151036146==--

