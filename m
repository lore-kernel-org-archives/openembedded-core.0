Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771F5CA9ED6
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7534.1685693433057780540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fx9/f4Pb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b28821b-8daf5a50-b8f4-4afc-9774-82b0d37adfe5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FbchEvHV4SYXIv98Gde2Ib9j9681tuUtlvlUup08n+4=;
	b=Fx9/f4PbZ4w7MXyUnxiyMvgH4ie1dG3VepckPOLD4Q6YVcART2xxv8NORCihodia
	7Ykwk7eEyIKXIlh3yWJn8dS7RygOlIpMUqciUcRmeJ/2roZhTMltTtX43Rz9LzdhFEa
	9S3wmLtANChZMYqihSHLnNv4kGNFhdzoG5HBMnew=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FbchEvHV4SYXIv98Gde2Ib9j9681tuUtlvlUup08n+4=;
	b=dqiqlmR/p6eeJocXhSiHMpqqMv71NzoPKfZ4rJo3ygWoAXY/pmowFZ0Chy5hwsO/
	PXhfs1l9bMI/eXLOz4JH8XxCkVuTotkNz+q0eYwR2nTHnOTwtrw2n+YFnhQR9TnFEVl
	7ieV4TvfNgxC+PrVKMxqslWsi9pMiWBvOTxhidVA=
Content-Type: multipart/mixed; boundary="===============3950843833677283419=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-fancy-pypi-readme: upgrading to 23.1.0 SUCCEEDED
Message-ID: <010101887b28821b-8daf5a50-b8f4-4afc-9774-82b0d37adfe5-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182193

--===============3950843833677283419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatch-fancy-pypi-readme* to *23.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-fancy-pypi-readme-upgrade-22.8.0-23.1..patch
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
--===============3950843833677283419==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-fancy-pypi-readme-upgrade-22.8.0-23.1..patch"

RnJvbSA1ODg5M2EyNmUxYmEwN2E1YzY4MjVlNGNmOWU3ZDNlMmQ3M2IwOWI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNDozODo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWU6IHVwZ3JhZGUgMjIuOC4wIC0+IDIzLjEuMAoK
LS0tCiAuLi5hZG1lXzIyLjguMC5iYiA9PiBweXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVhZG1l
XzIzLjEuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhh
dGNoLWZhbmN5LXB5cGktcmVhZG1lXzIyLjguMC5iYiA9PiBweXRob24zLWhhdGNoLWZhbmN5LXB5
cGktcmVhZG1lXzIzLjEuMC5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjIuOC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVh
ZG1lXzIzLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjIuOC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gt
ZmFuY3ktcHlwaS1yZWFkbWVfMjMuMS4wLmJiCmluZGV4IDRjMjU2ZDE1NWIuLjhmNmU5OTZhNDQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaC1m
YW5jeS1weXBpLXJlYWRtZV8yMi44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVhZG1lXzIzLjEuMC5iYgpAQCAtNyw3ICs3
LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAogUFlQSV9QQUNLQUdFID0gImhh
dGNoX2ZhbmN5X3B5cGlfcmVhZG1lIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGE5MTI4MmNh
MDk2MDFjMThhZGVkOGUzNzhkYWY4YjU3OGM3MDIxNDg2NmYwOTcxMTU2ZWU5YmI5Y2U2YzI2YSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMWRmNDQwNjMwOTRhZjFlODI0OGNlYWNkNDdhOTJjOWNm
MzEzZDZiOTgyM2JmNjZhZjhhOTI3YzM5NjAyODdkIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2
ZSBuYXRpdmVzZGsiCiAKLS0gCjIuMzkuMgoK

--===============3950843833677283419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme (sysroot):
  /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-22.8.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-23.1.0.dist-info

--===============3950843833677283419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_fancy_pypi_readme/hatch_fancy_pypi_readme-22.8.0.tar.gz;downloadfilename=hatch_fancy_pypi_readme-22.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_fancy_pypi_readme/hatch_fancy_pypi_readme-23.1.0.tar.gz;downloadfilename=hatch_fancy_pypi_readme-23.1.0.tar.gz"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme: PV changed from "22.8.0" to "23.1.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dbg: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dbg: PV changed from "22.8.0" to "23.1.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dev: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dev: PV changed from "22.8.0" to "23.1.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-doc: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-doc: PV changed from "22.8.0" to "23.1.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-locale: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-locale: PV changed from "22.8.0" to "23.1.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-src: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-src: PV changed from "22.8.0" to "23.1.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-staticdev: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-staticdev: PV changed from "22.8.0" to "23.1.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PKGV changed from 22.8.0 [default] to 23.1.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PKGSIZE changed from 39163 to 41837 (+7%)
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PV changed from "22.8.0" to "23.1.0"
Changes to packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme (sysroot):
  /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-22.8.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-23.1.0.dist-info

--===============3950843833677283419==--

