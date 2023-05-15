Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFD2CA9ECE
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.3703.1684186746293284938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZWJVAs75;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188215a509f-1315ba2c-3d02-46cc-b8a4-d28ba35ebc23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/O4LMxPStgSXogaNqp0RX15lH12DlCZshzdONvfWUg0=;
	b=ZWJVAs75u2xTURIj3HeFGl5kv1TAdcP5TCVl4ejSskH8G5rk7EwdBkHhgjUn22io
	Rj+3AL3P5GzRaF+jYDXa4zA3LIGaGRV9sX4XYZCuyDyIRQGQKTAP7CCcFtEF4ma32X8
	TJ5iMwfjztCLkiDbNoaTXmkYX0H6YWKtogvB85Hg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/O4LMxPStgSXogaNqp0RX15lH12DlCZshzdONvfWUg0=;
	b=mWFloYi+ldJjNWrWxAbeA0BkZXyJEmSrCgehTEPSMQ2zdPkSdT55yufDQR8VL2rp
	TgAj3Fy/i1Q9m918ocJLjCStuBFuTV0e+WQ0pRZBh6jDLb7T1i50Z1sY9c8OcmjGnlv
	1L6H+9R+uQFe/HNCtis/cHt9nN6IUA/KVFePTUT0=
Content-Type: multipart/mixed; boundary="===============4018671046928411325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.29.0 SUCCEEDED
Message-ID: <01010188215a509f-1315ba2c-3d02-46cc-b8a4-d28ba35ebc23-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181298

--===============4018671046928411325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.29.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.28.7-0.29.0.patch
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
--===============4018671046928411325==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.28.7-0.29.0.patch"

RnJvbSBhNjU1OWEyMDA3OGExMWYzNTgxMzAyN2ZmNzY1NmNmNDQzZDA2MjE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTA6NDg6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRidXNtb2NrOiB1cGdyYWRlIDAuMjguNyAtPiAwLjI5LjAKCi0tLQogLi4uL3tweXRo
b24zLWRidXNtb2NrXzAuMjguNy5iYiA9PiBweXRob24zLWRidXNtb2NrXzAuMjkuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzbW9ja18wLjI4Ljcu
YmIgPT4gcHl0aG9uMy1kYnVzbW9ja18wLjI5LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjguNy5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzbW9ja18wLjI5LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRidXNtb2NrXzAuMjguNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjkuMC5iYgppbmRleCA0ZWEyMWE1NmVhLi4z
MmE0M2UwMGI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGJ1c21vY2tfMC4yOC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kYnVzbW9ja18wLjI5LjAuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weXRob24tZGJ1c21vY2svIgogTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3ODY5
Nzc3NTBkYmNiZGU2ZTI1NTMzMzlhMmU2NmQ5YThkNDQ1M2Q1Yzg0OGI5NDVlOGZkMWJhZGI3MzZm
ZmQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2VmZGIzZDgwMDM4NmI2NWU4ODU0ZDhlZTQ1Mzg3
NjQyNDEzODJiNGU2NjQ0MjNhZDdkOTU5YzkwMDhkZDQwOCIKIAogUFlQSV9QQUNLQUdFID0gInB5
dGhvbi1kYnVzbW9jayIKIAotLSAKMi4zOS4yCgo=

--===============4018671046928411325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.28.7.tar.gz;downloadfilename=python-dbusmock-0.28.7.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.29.0.tar.gz;downloadfilename=python-dbusmock-0.29.0.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 454922 to 457628 (+1%)
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info

--===============4018671046928411325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info

--===============4018671046928411325==--

