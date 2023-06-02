Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B49BCA9ECE
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7632.1685693432454653899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aZcTajsj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b288388-8279b9b0-1b05-4200-b7d3-f97ab4a28acf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z+o6Nk04NL/yJ7wDZypobv+Zn/g2ZVUXklr8RaVuQMU=;
	b=aZcTajsjNixurutNa6sy//vI9Crsfo2VxCzyQPt7haPzgVNeEphSQ8qywY5/oaez
	vbYFQitGUiRHkZ0Cv5P8kVwNV6zSBIJkkL95OxhX9gWIweP1RodOeAwG1jb6V4/FGV8
	WRl4Oi/l69fpLw1rQCN/81Qwx5GCs4Q/ZKSmB9Ng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z+o6Nk04NL/yJ7wDZypobv+Zn/g2ZVUXklr8RaVuQMU=;
	b=GJKIc4WUHAWutn80OfolAvEi0ME8R3TO6BY62ke3OVNagRVjUTHJmOVRjvGPnJQm
	tiM/ZUWS37YEgXrh9lTlyxejKQVcG+JxLPa5xeJTL6LceK0RcTrAoFlFsaiU2h7nkjG
	6IvZ85zLmwec6sX4LfxoN7VfSmHf1e3asXoTJ9So=
Content-Type: multipart/mixed; boundary="===============5174666543042687065=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex: upgrading to 3.18.0 SUCCEEDED
Message-ID: <010101887b288388-8279b9b0-1b05-4200-b7d3-f97ab4a28acf-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182198

--===============5174666543042687065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodomex* to *3.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-upgrade-3.17-3.18.0.patch
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
--===============5174666543042687065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/WHEEL was removed

--===============5174666543042687065==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-upgrade-3.17-3.18.0.patch"

RnJvbSBjNWU3MzNlYzBiNDAwOWM3OTY0ODNlOWE5Y2JiNWY5MzdiNWQyOGE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjoyMTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21leDogdXBncmFkZSAzLjE3IC0+IDMuMTguMAoKLS0tCiAuLi5uMy1w
eWNyeXB0b2RvbWV4XzMuMTcuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTguMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3J5cHRvZG9tZXhf
My4xNy5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xOC4wLmJifSAoNjklKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4
XzMuMTcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9k
b21leF8zLjE4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA2OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xNy5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4x
OC4wLmJiCmluZGV4IDcyMGFlYzJkMzYuLmNiYmMxN2FkYmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTcuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xOC4w
LmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5o
ZXJpdCBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGFmOTNhYWQ4ZDYyZTgx
MDI0N2JlZWRlZjAyNjFjMTQ4NzkwYzUyZjNjZDMzNjQzNzkxY2M2Mzk2ZGQyMTdjMSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzZTNlY2I1ZmU5NzllN2MxYmIwMDI3ZTUxODM0MGFjZjdlZTYwNDE1
ZDc5Mjk1ZTUyNTFkMTNjNjhkZGU1NzZlIgogCiBGSUxFUzoke1BOfS10ZXN0cyA9ICIgXAogICAg
ICR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9L0NyeXB0b2RvbWUvU2VsZlRlc3QvIFwKLS0gCjIu
MzkuMgoK

--===============5174666543042687065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodomex: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.17.tar.gz;downloadfilename=pycryptodomex-3.17.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.18.0.tar.gz;downloadfilename=pycryptodomex-3.18.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodomex: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1106412 to 1038164 (-6%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2772376 to 2774997 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 2874599 to 2882474 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.17" to "3.18.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.17 [default] to 3.18.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3661222 to 3646475 (-0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.17" to "3.18.0"
Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.18.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodomex-3.17.dist-info/WHEEL was removed

--===============5174666543042687065==--

