Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EEEC64EC3
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.24221.1665871393170910750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K/Xe+2V4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac3334-cd5750f6-2dd4-45fe-a047-d2323e2f0a87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cTSkdtOaQ39V5w9Rirbuaobibwpk4iDepfgnYziUCjw=;
	b=K/Xe+2V4oFZcppXSplcHEv2BbFEI/nQgns9axL652U7DBATM3zQd3NqPi0+Oheer
	0ExgJlDd9fQ/X6KkZwOZXd+t8yoJxnJmP90Mjfgf7V9w77hMzBpYpAAELdjncjQwdvl
	ex97eODYUrsxFhML5H+zCDuzl71Ta/fb2QSXbXx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cTSkdtOaQ39V5w9Rirbuaobibwpk4iDepfgnYziUCjw=;
	b=OzgY42OzgaokKbVOAOjgEimHmpbMoAh8IV6w4cVNRgkblAZD5YzASeyRq4fKLA7y
	wpLiIQpCyeL4jQJUMUjxgrGfCsP1elnJ2sCunGlbwSA6v/ibRKQqBlGmfMhdIei3Xk/
	2sTitDidk3Enw+OuNkUHF7FFYpjmE04c2hC+jgg8=
Content-Type: multipart/mixed; boundary="===============3820439835539670441=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.9 SUCCEEDED
Message-ID: <01010183ddac3334-cd5750f6-2dd4-45fe-a047-d2323e2f0a87-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171773

--===============3820439835539670441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.8.3-2022.9.patch
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
--===============3820439835539670441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/WHEEL was removed

--===============3820439835539670441==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.8.3-2022.9.patch"

RnJvbSA4Y2JhODdlY2EwYjYwYzU2MDRiNmZhNjNjZjNhZWNmM2VmNDI5N2IwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MDU6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjIuOC4zIC0+IDIwMjIuOQoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDIyLjguMy5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjIuOS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjIu
OC4zLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMi45LmJifSAoODMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjguMy5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjku
YmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi45LmJiCmluZGV4IGJjODE5
YzBkZDYuLjNkY2JjMmRjYjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjguMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi45LmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMTI4Yzg4YTM5M2NkMDQxNTRjZWY0ZDRiMTBhNjQzZTQ0NzNhZTI5
MGI0MzZlOGU2MWQyZTk3YWU4ZTUzMjU1ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjOTUzMzMx
MmEyZDc3YzRjY2RiZmZkYTE1MDRhYmE4NTBkOWIyMjRmZDhiNDNlOTI5Y2VlMmFhNjg0NzhlODJh
IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRT
OiR7UE59ICs9ICJweXRob24zLXJ1YW1lbC15YW1sIHB5dGhvbjMtanNvbnNjaGVtYSBweXRob24z
LXJmYzM5ODciCi0tIAoyLjMxLjEKCg==

--===============3820439835539670441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.3.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.9.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 243550 to 245688 (+1%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.8.3" to "2022.9"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/WHEEL was removed

--===============3820439835539670441==--

