Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CDBC6FD1E
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.12464.1662040786452331550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NU/E1v4t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010182f959c232-ce21e014-d9b4-4f76-a92e-780efeea54f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o6/Ff0fwHamBlJ7q+9GG2En3kfbdfYPOiTqghjd1Xe4=;
	b=NU/E1v4tpia6/bs8bYDcBJdM5CRZV4IbGNM89QGpXfwg/3o1Mw8u9yPTfzMn4CTu
	CcnoZE1igkqtqcN1wJ0qO7JBto1OL3JlQTa0LQBLg/Jpj9tba+Pd/A9SNTRHZdLHbzC
	LFIUW/TAY0MCtv7EeDRInmGWN5/HXZNRa+BQAaa0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o6/Ff0fwHamBlJ7q+9GG2En3kfbdfYPOiTqghjd1Xe4=;
	b=cEsjXCCdtgRmwHAZjZZ+viJM7d05YFg4ias/ehXxrRIlhnT4GV22EC1jYxjBeXLN
	s486Yrxvqycfdd3YaWr6N7DL8TOU4MHrf10jhLohxZ4kUfWZQY3zJEnFjF5Bef1Z2E3
	NJrBibei+Q8EVzmRwPJGiIVWNDq/opCr99wA60pc=
Content-Type: multipart/mixed; boundary="===============2164964564368843760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.54.4 SUCCEEDED
Message-ID: 
 <01010182f959c232-ce21e014-d9b4-4f76-a92e-780efeea54f9-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170176

--===============2164964564368843760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.54.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.46.11-6.54.4.patch
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
--===============2164964564368843760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.46.11.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.54.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.46.11" to "6.54.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2070320 to 2089724 (+1%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.54.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.46.11" to "6.54.4"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============2164964564368843760==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.46.11-6.54.4.patch"

RnJvbSBlMmE2ZDU5ZjgxYzRiNzZjMmIyNjMyNzg2MDQwMzM1ZDYyNzI4MzE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzoxMToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjQ2LjExIC0+IDYuNTQuNAoKLS0tCiAuLi50aG9u
My1oeXBvdGhlc2lzXzYuNDYuMTEuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi40
Ni4xMS5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi41NC40LmJifSAoOTElKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNDYu
MTEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjU0LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi40Ni4xMS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41NC40LmJiCmlu
ZGV4IDFkOTc3MmQ0ZmYuLjY0MDczMjczNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNDYuMTEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41NC40LmJiCkBAIC0xMyw3
ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwKICAgICAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNWMxY2Y2MWIyNGIwOTQzNTU1NzdhNmI4ZmJiYjhl
YjU0YzFiMDIxNmZiYzA1MTlhZjk3YzQ2YmRkZjQzYzQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImVlNDJmZTRkMmZmOTZjNDk5MTAwODU3ODBkNmI4ZjM0Y2JjZjRjNDQ0Mjc2MTZlMjI4MzM4Njlk
NDUxMTE2YmIiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0cnMgXAot
LSAKMi4zMS4xCgo=

--===============2164964564368843760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.4.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============2164964564368843760==--

