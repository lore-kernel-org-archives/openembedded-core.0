Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3627C64EBE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.853.1667349633716892882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nCKxLdxN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018435c8571f-f9644d81-481a-4efd-afec-afcca5b623fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RRODSUhI7YLXqULOs8vgR54FjH1mBceBXTGH2rllTfI=;
	b=nCKxLdxNmyyFw3b/AfGiHLoiwSwefwHwx5fcz4b4e5T8QQWZcRlvFqck1WPegKO/
	v6sVTfYXWUV+D53VT+pxlnOkjl1oDaKB73KQG46GAWRFqSrGahWfa1YljjhKUHWiXcJ
	dFIXMrvVGGkKkehQ/pzftnjFellLYLZyezAGAy7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RRODSUhI7YLXqULOs8vgR54FjH1mBceBXTGH2rllTfI=;
	b=ARpLpaGyhGrNvpkGaHAvVjiEOSDYhyZc1tVGlWFQYXqbbzMIDM4X8manyT9fmElY
	yrpK4xn2QP1N65V/dguE8ir/blKMVs2hzVob77RC0eYnVcH+CP2/60oOEbxo5BthI0o
	aH12YLM3R2auOcw7YVVmpjgr4ycVOaPOe5vjeMFw=
Content-Type: multipart/mixed; boundary="===============8672060957861067560=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-fancy-pypi-readme: upgrading to 22.8.0 SUCCEEDED
Message-ID: <0101018435c8571f-f9644d81-481a-4efd-afec-afcca5b623fa-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172434

--===============8672060957861067560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatch-fancy-pypi-readme* to *22.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-fancy-pypi-readme-upgrade-22.7.0-22.8..patch
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
--===============8672060957861067560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_fancy_pypi_readme/hatch_fancy_pypi_readme-22.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_fancy_pypi_readme/hatch_fancy_pypi_readme-22.8.0.tar.gz"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme: PV changed from "22.7.0" to "22.8.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dbg: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dbg: PV changed from "22.7.0" to "22.8.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dev: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dev: PV changed from "22.7.0" to "22.8.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-doc: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-doc: PV changed from "22.7.0" to "22.8.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-locale: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-locale: PV changed from "22.7.0" to "22.8.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-src: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-src: PV changed from "22.7.0" to "22.8.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-staticdev: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-staticdev: PV changed from "22.7.0" to "22.8.0"
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PKGSIZE changed from 38486 to 39530 (+3%)
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PKGV changed from 22.7.0 [default] to 22.8.0 [default]
packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PV changed from "22.7.0" to "22.8.0"
Changes to packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme (sysroot):
  /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-22.7.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-22.8.0.dist-info

--===============8672060957861067560==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-fancy-pypi-readme-upgrade-22.7.0-22.8..patch"

RnJvbSBhYzMzMjAxMmI4NDk3ZGQ3YzU2NzkxZDlhMTYzMTE2ODMzYzk1NWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwOTo1NjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWU6IHVwZ3JhZGUgMjIuNy4wIC0+IDIyLjguMAoK
LS0tCiAuLi5hZG1lXzIyLjcuMC5iYiA9PiBweXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVhZG1l
XzIyLjguMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhh
dGNoLWZhbmN5LXB5cGktcmVhZG1lXzIyLjcuMC5iYiA9PiBweXRob24zLWhhdGNoLWZhbmN5LXB5
cGktcmVhZG1lXzIyLjguMC5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjIuNy4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVh
ZG1lXzIyLjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjIuNy4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gt
ZmFuY3ktcHlwaS1yZWFkbWVfMjIuOC4wLmJiCmluZGV4IGEwMTY3ZTI1ZTkuLjRjMjU2ZDE1NWIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaC1m
YW5jeS1weXBpLXJlYWRtZV8yMi43LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVhZG1lXzIyLjguMC5iYgpAQCAtNyw3ICs3
LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAogUFlQSV9QQUNLQUdFID0gImhh
dGNoX2ZhbmN5X3B5cGlfcmVhZG1lIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGVkZjJiYTBi
ODFhMjk3NWFiYjFkZWVlOTMxMGIyZWI4NWQyMjM4MGZkYTBkNTI4NjllNzYwYjU0MzVhYTU5NiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYTkxMjgyY2EwOTYwMWMxOGFkZWQ4ZTM3OGRhZjhiNTc4
YzcwMjE0ODY2ZjA5NzExNTZlZTliYjljZTZjMjZhIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2
ZSBuYXRpdmVzZGsiCiAKLS0gCjIuMzEuMQoK

--===============8672060957861067560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatch-fancy-pypi-readme (sysroot):
  /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-22.7.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-22.8.0.dist-info

--===============8672060957861067560==--

