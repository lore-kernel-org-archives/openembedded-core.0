Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F3BC48298
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4592.1704114719956425306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HwYhFsCe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FcGcvUCQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018cc5270a8c-3f338baa-d49e-46ff-a7e8-0268470b035f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YX/oPohzTHOitr1vswuT8nOTyKT2TCgPrI1R+f5L6/M=;
	b=HwYhFsCew+nTZAWhB6+T7sWdZ6r5jYjY+XJiWdLdBlTQbG6YcSC/a2pmE4DLYKUa
	4AbRWPANLGmeWjmjRS50q46SmHbRftOvKHDLawHXt91llXVnnqMHXqd24CQK3aDPjnZ
	C0NWjY7DqLZQ3hu1xH5+zSHiYgzqxOhnEqmD/GLA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YX/oPohzTHOitr1vswuT8nOTyKT2TCgPrI1R+f5L6/M=;
	b=FcGcvUCQ8yPIhuaxFyqePDs2VS+TzXGr9EaoSgseys8SWi66HujsouNVQ667ycS9
	Jz40BxtQLK1XCNm/ITZBORDluzutBfgJpd02dv23rxGcRiNWUeysk0XvaZhsX0sxsk1
	jXxtja5LD5qI+9PsD9U6Uqaj3cwj2vI2wMZeQNAQ=
Content-Type: multipart/mixed; boundary="===============0684415106237008125=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-fancy-pypi-readme: upgrading to 23.2.0 SUCCEEDED
Message-ID: <0101018cc5270a8c-3f338baa-d49e-46ff-a7e8-0268470b035f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193130

--===============0684415106237008125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatch-fancy-pypi-readme* to *23.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-fancy-pypi-readme-upgrade-23.1.0-23.2..patch
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

-- >8 --
From d531de5b2bee2004b64160af7467efc131504332 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 07:08:53 +0000
Subject: [PATCH] python3-hatch-fancy-pypi-readme: upgrade 23.1.0 -> 23.2.0

---
 ...adme_23.1.0.bb => python3-hatch-fancy-pypi-readme_23.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-fancy-pypi-readme_23.1.0.bb => python3-hatch-fancy-pypi-readme_23.2.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.2.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb
rename to meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.2.0.bb
index 8f6e996a44..65b61d550f 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.2.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_fancy_pypi_readme"
 
-SRC_URI[sha256sum] = "b1df44063094af1e8248ceacd47a92c9cf313d6b9823bf66af8a927c3960287d"
+SRC_URI[sha256sum] = "2762b31de2c78572f87d82986910ff46b89834d3743fa5fcdefc1d215ab21b24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.42.0


--===============0684415106237008125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme (sysroot):
  /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-23.1.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-23.2.0.dist-info

--===============0684415106237008125==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-fancy-pypi-readme-upgrade-23.1.0-23.2..patch"

RnJvbSBkNTMxZGU1YjJiZWUyMDA0YjY0MTYwYWY3NDY3ZWZjMTMxNTA0MzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNzowODo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWU6IHVwZ3JhZGUgMjMuMS4wIC0+IDIzLjIuMAoK
LS0tCiAuLi5hZG1lXzIzLjEuMC5iYiA9PiBweXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVhZG1l
XzIzLjIuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhh
dGNoLWZhbmN5LXB5cGktcmVhZG1lXzIzLjEuMC5iYiA9PiBweXRob24zLWhhdGNoLWZhbmN5LXB5
cGktcmVhZG1lXzIzLjIuMC5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjMuMS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVh
ZG1lXzIzLjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjMuMS4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gt
ZmFuY3ktcHlwaS1yZWFkbWVfMjMuMi4wLmJiCmluZGV4IDhmNmU5OTZhNDQuLjY1YjYxZDU1MGYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaC1m
YW5jeS1weXBpLXJlYWRtZV8yMy4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVhZG1lXzIzLjIuMC5iYgpAQCAtNyw3ICs3
LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAogUFlQSV9QQUNLQUdFID0gImhh
dGNoX2ZhbmN5X3B5cGlfcmVhZG1lIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjFkZjQ0MDYz
MDk0YWYxZTgyNDhjZWFjZDQ3YTkyYzljZjMxM2Q2Yjk4MjNiZjY2YWY4YTkyN2MzOTYwMjg3ZCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNzYyYjMxZGUyYzc4NTcyZjg3ZDgyOTg2OTEwZmY0NmI4
OTgzNGQzNzQzZmE1ZmNkZWZjMWQyMTVhYjIxYjI0IgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2
ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDIuMAoK

--===============0684415106237008125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_fancy_pypi_readme/hatch_fancy_pypi_readme-23.1.0.tar.gz;downloadfilename=hatch_fancy_pypi_readme-23.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_fancy_pypi_readme/hatch_fancy_pypi_readme-23.2.0.tar.gz;downloadfilename=hatch_fancy_pypi_readme-23.2.0.tar.gz"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dbg: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dbg: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dev: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-dev: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-doc: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-doc: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-locale: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-locale: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-src: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-src: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-staticdev: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme-staticdev: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PV changed from "23.1.0" to "23.2.0"
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PKGV changed from 23.1.0 [default] to 23.2.0 [default]
packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme/python3-hatch-fancy-pypi-readme: PKGSIZE changed from 41837 to 42476 (+2%)
Changes to packages/core2-64-poky-linux/python3-hatch-fancy-pypi-readme (sysroot):
  /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-23.1.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_fancy_pypi_readme-23.2.0.dist-info

--===============0684415106237008125==--

