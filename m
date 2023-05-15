Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998ACCA9EC5
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3712.1684186747944154153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ObAjP5Vy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a5194-3f1eb7c1-9ff1-4525-9dd5-b1c980462e7d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dsw0V2Mm3fea2DmrIgi+FBaQrIiSLWaJUhosLMTrS/4=;
	b=ObAjP5Vy8oIGwqbd9u2vdl6BN2PAKT8wqgrSaWy7qm1mik/TT37cguMooBprkgdC
	6n0vITCoSzo7lLNpDnKcX2GZcPoBe7PHLf3okUjItYID8u0zkDWS6BcZK5YKLGX9PoG
	vLAezbHZETivQIk/GNy1t06TwElSjhvn7e18bTVM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dsw0V2Mm3fea2DmrIgi+FBaQrIiSLWaJUhosLMTrS/4=;
	b=cxuGq5sGCipffQ662K2JAQJfj9IWlnOeQgLrLjkbkMItHETaU2bsd4yDO6fT7Pxv
	tpJTqc6UDqjgQvYsafIJXb/KjUtofhjoHqHV3G9EcsvxoBkR3indj91FAsT7gI+XCcN
	1b8AoqOel01BJpX90P/VcpABnRixsbip0SCBps2I=
Content-Type: multipart/mixed; boundary="===============0840999663340008933=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.75.3 SUCCEEDED
Message-ID: <01010188215a5194-3f1eb7c1-9ff1-4525-9dd5-b1c980462e7d-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181309

--===============0840999663340008933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.75.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.71.0-6.75.3.patch
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
--===============0840999663340008933==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.71.0-6.75.3.patch"

RnJvbSBmN2RmMTlmOGU4MTBiYjc1NGRhN2E5YjAwY2RjOTc1N2I5YTczN2E1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTE6MDI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi43MS4wIC0+IDYuNzUuMwoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182LjcxLjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzUuMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi43
MS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182Ljc1LjMuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43MS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43
NS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzEuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43NS4zLmJiCmluZGV4
IDhlYzg4NWZhYmYuLjMzODZiMWJkOWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljc1LjMuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImIyYzNiYmVhZDcyMTg5YzBiYmE2ZTEyODQ4YjQ4NGNlYWZh
ZGI2ZTg3MmFjMzFlNDAwMTMyMjgyMzkzNjYyMjEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTVj
ZGFkYjgwYTdhYzU5MDg3NTgxNjI0ZDI2NmE0ZmI1ODViNWNjZTliN2Y4OGY1MDZjNDgxYTlmMGU1
ODNmNiIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjM5LjIKCg==

--===============0840999663340008933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.71.0.tar.gz;downloadfilename=hypothesis-6.71.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.75.3.tar.gz;downloadfilename=hypothesis-6.75.3.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.71.0" to "6.75.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2806255 to 2858759 (+2%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.75.3.dist-info, added "/usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.71.0 [default] to 6.75.3 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.75.3.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py was added
  /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc was added

--===============0840999663340008933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.75.3.dist-info, added "/usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.75.3.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py was added
  /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc was added

--===============0840999663340008933==--

