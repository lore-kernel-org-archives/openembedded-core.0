Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C175C74A5B
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.145715.1673805743605412015
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ghmor1oo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185b698c2a2-27a259e5-b5d8-4518-b179-a77c6b452537-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ObRgspGIarHla7OOU3Na2Bt54YW8dOX3SzPE5RgNwMA=;
	b=Ghmor1ooqA6yxBUY9PybfeirZxcxvo7y6jqPRmcS3trrNBj88yO9OmpIHFsZfohN
	UhP5R8RsLFdK1iXcqiTNQLp3Yy7Bn+VnRV75vtnG602ovedAw8tFXbqDknE2nDtXT8Y
	cqLv0sjsm5HpWdAkZl+P0GwFl7DcPEriy4j4kyhE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ObRgspGIarHla7OOU3Na2Bt54YW8dOX3SzPE5RgNwMA=;
	b=Y3rnFVTC5rPsL9R7J0jPYi4exK9z75v37YwrOr1fe3fJqlNR/hSB3Rm2j5Qv2Ge+
	XufOAbydUuKplpN1iBUTNLenuVNorqKbPI8jA466cHHkiTQ0eTUk6CEy4Vxmz9P/lY4
	8yflLnXkkEEDo/sask6s2vOVFRCeZNE6hWF6fjMY=
Content-Type: multipart/mixed; boundary="===============9181678295474950138=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.28.7 SUCCEEDED
Message-ID: <01010185b698c2a2-27a259e5-b5d8-4518-b179-a77c6b452537-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175902

--===============9181678295474950138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.28.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.28.6-0.28.7.patch
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
--===============9181678295474950138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.28.6.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.28.7.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.28.6" to "0.28.7"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 446239 to 447152 (+0%)
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.28.6 [default] to 0.28.7 [default]
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.6.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info

--===============9181678295474950138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.6.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info

--===============9181678295474950138==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.28.6-0.28.7.patch"

RnJvbSBhMTE1MTg4ZTFhMTVlOTA1MWNhY2UwN2E4NDE4YmRiYmJjOGY0NDJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTE6NDQ6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRidXNtb2NrOiB1cGdyYWRlIDAuMjguNiAtPiAwLjI4LjcKCi0tLQogLi4uL3tweXRo
b24zLWRidXNtb2NrXzAuMjguNi5iYiA9PiBweXRob24zLWRidXNtb2NrXzAuMjguNy5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzbW9ja18wLjI4LjYu
YmIgPT4gcHl0aG9uMy1kYnVzbW9ja18wLjI4LjcuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjguNi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzbW9ja18wLjI4LjcuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRidXNtb2NrXzAuMjguNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjguNy5iYgppbmRleCAxMjkwZmNkMmYxLi40
ZWEyMWE1NmVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGJ1c21vY2tfMC4yOC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kYnVzbW9ja18wLjI4LjcuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weXRob24tZGJ1c21vY2svIgogTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNiNDk2
ZmFiODRhZmYzOTM2MDU0Zjc0N2U5YTIyYmIwN2FjNTc4M2IxZDk2N2M2Y2MzOTUzNmM3YmEzMTVm
Y2UiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDc4Njk3Nzc1MGRiY2JkZTZlMjU1MzMzOWEyZTY2
ZDlhOGQ0NDUzZDVjODQ4Yjk0NWU4ZmQxYmFkYjczNmZmZCIKIAogUFlQSV9QQUNLQUdFID0gInB5
dGhvbi1kYnVzbW9jayIKIAotLSAKMi4zNy4zCgo=

--===============9181678295474950138==--

