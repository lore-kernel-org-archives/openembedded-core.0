Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942E6C64EB6
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.24357.1665871394224316399
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QYTujbH+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddac32c4-ac37c38a-0121-4cb3-82b5-81685c1f8061-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PcydZ+2Ma/c6kvuUDTgjVbZxKA7StOcnbVmKQiCI2cs=;
	b=QYTujbH+RsEjtQQYldqZKCuQK2GqIyJVzSvA5mpSVmoxY/zVgbcaACl8uMFpr4R+
	iUPgXneMCHN6sWfamMkpCHgmq1Z3QD08gQjQiwHvE8EM469mDuT33bD4kLiCEiQoXZf
	I5jZBfseu/PymfhWd8ND1a4j5SwB45jIlbCVr83w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PcydZ+2Ma/c6kvuUDTgjVbZxKA7StOcnbVmKQiCI2cs=;
	b=IHk7NciqaBAtKoF+zEsjsGy2tyNuFADJiG/QUI56pq6uGHs3PQF3/k3prwfyJZQy
	NJBLBkFyIM5928HL/5fdmi0UW+E4DfFqgjVA5HijXBoXrs0uiG5rEzr2q52985vykZW
	donZotjcc6ODmXPgU4Y06Hvjts7VLQuofTIEbOUo=
Content-Type: multipart/mixed; boundary="===============0980560075887482407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.56.2 SUCCEEDED
Message-ID: <01010183ddac32c4-ac37c38a-0121-4cb3-82b5-81685c1f8061-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171778

--===============0980560075887482407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.56.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.54.5-6.56.2.patch
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
--===============0980560075887482407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info -> /usr/lib/python3.10/site-packages/hypothesis-6.56.2.dist-info, added "/usr/lib/python3.10/site-packages/__pycache__/_hypothesis_ftz_detector.cpython-310.pyc /usr/lib/python3.10/site-packages/_hypothesis_ftz_detector.py"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.56.2.dist-info
  /usr/lib/python3.10/site-packages/_hypothesis_ftz_detector.py was added
  /usr/lib/python3.10/site-packages/__pycache__/_hypothesis_ftz_detector.cpython-310.pyc was added

--===============0980560075887482407==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.54.5-6.56.2.patch"

RnJvbSBlZWMzNDVhNGY3NDM1Yjk5N2E0ZDc0M2U4ODRkMjg1N2M2YjdiZGU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MTY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi41NC41IC0+IDYuNTYuMgoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182LjU0LjUuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTYuMi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi41
NC41LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjU2LjIuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41NC41
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41
Ni4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuNS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41Ni4yLmJiCmluZGV4
IDlhZGI2MTQ0OTMuLjQ1ZmYwNDdiZWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU2LjIuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhOTA1NjgyNTY5NWY0MTViZmFkNGU4MDhhZTcxOWZjMDEz
ODNhOWFiNjU5Nzc1MzE5NzI0MzY1YWZjYzdlYzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODVi
ZjE0ZjViNTFlNzYwOWIyMjAyYWFhNjljNThkNDFhZWY3MzlhYmYwYzAwYThkNmUwZWI5YWQ3OTJl
MGIwOSIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjMxLjEKCg==

--===============0980560075887482407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.54.5.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.56.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.54.5" to "6.56.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info -> /usr/lib/python3.10/site-packages/hypothesis-6.56.2.dist-info, added "/usr/lib/python3.10/site-packages/__pycache__/_hypothesis_ftz_detector.cpython-310.pyc /usr/lib/python3.10/site-packages/_hypothesis_ftz_detector.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.54.5 [default] to 6.56.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2089727 to 2113729 (+1%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.56.2.dist-info
  /usr/lib/python3.10/site-packages/_hypothesis_ftz_detector.py was added
  /usr/lib/python3.10/site-packages/__pycache__/_hypothesis_ftz_detector.cpython-310.pyc was added

--===============0980560075887482407==--

