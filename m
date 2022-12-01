Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D2DC64E90
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.46826.1669908627073689165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VDH4mbdj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010184ce4f7b68-1f4e73e0-86dd-4e5c-a6b2-1b7a107f32e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LbOiUU1doSJdMLFuHc8NOdBss+QYLjw0OpXMOEqhde4=;
	b=VDH4mbdjf40p/I4zRL54u7oZmaCFPkRgJevO/heMlTIZKY1pskr5VBaWcGtY4b0V
	mXEidfPwzJQ4Pu6QXj9KU0wQSK4lh/N5vxEKJJiFP0cvw7xvAixrVZDkJKEVGBUkBeW
	YB6wtGz0LuzbtN9L+eGwGhAdf/fPyrYrKP55a9ts=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LbOiUU1doSJdMLFuHc8NOdBss+QYLjw0OpXMOEqhde4=;
	b=WpMfzZpAG86apNi4xTHPdrUx5WJjsfwuF682WkCPCTgyTpkLBFESaApXBYY3Gu9X
	FcyWncnLOwnZ32gIXDO2++rs5hxW+WMpC8qwzo6TAtLImgcpU6ZQn9SGPgAQPUmDeLy
	h6Kp1bBmvU95W3WB1Hs/Cwxascp3hsroUqwGKzwk=
Content-Type: multipart/mixed; boundary="===============8504129433696409490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex: upgrading to 3.16.0 SUCCEEDED
Message-ID: <01010184ce4f7b68-1f4e73e0-86dd-4e5c-a6b2-1b7a107f32e9-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174149

--===============8504129433696409490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodomex* to *3.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-upgrade-3.15.0-3.16.0.patch
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
--===============8504129433696409490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.16.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodomex: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1042136 to 1042132 (-0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2772679 to 2772209 (-0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 2847506 to 2848084 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3650210 to 3650298 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.15.0" to "3.16.0"
Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info

--===============8504129433696409490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info

--===============8504129433696409490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-upgrade-3.15.0-3.16.0.patch"

RnJvbSA0YTdjZjFlYzgzNjhlZjBjM2FiYWVmNWU4MGIwNDYxMjgwNWVkMDc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOTo1OTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21leDogdXBncmFkZSAzLjE1LjAgLT4gMy4xNi4wCgotLS0KIC4uLi1w
eWNyeXB0b2RvbWV4XzMuMTUuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xNi4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21l
eF8zLjE1LjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTYuMC5iYn0gKDY5JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9k
b21leF8zLjE1LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlj
cnlwdG9kb21leF8zLjE2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA2OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xNS4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9k
b21leF8zLjE2LjAuYmIKaW5kZXggZTIyY2UzMDgzMy4uMzZlZjc3Mjg2MyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4xNS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2Rv
bWV4XzMuMTYuMC5iYgpAQCAtMSw3ICsxLDcgQEAKIHJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9t
ZS5pbmMKIGluaGVyaXQgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjczNDFm
MWJiMmRhZGIwZDFhMDA0N2YzNGMzYTU4MjA4YTkyNDIzY2RiZDMyNDRkOTk4ZTRiMjhkZjVlYWMw
ZWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTliYTlkOGVkNjM4NzMzYzllOTU2NjQ0NzBiNzFk
NjI0YTZkZWYxNDllMmRiNmNjNTJjMWFjYTVhNmEyZGYxZCIKIAogRklMRVM6JHtQTn0tdGVzdHMg
PSAiIFwKICAgICAke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfS9DcnlwdG9kb21lL1NlbGZUZXN0
LyBcCi0tIAoyLjMxLjEKCg==

--===============8504129433696409490==--

