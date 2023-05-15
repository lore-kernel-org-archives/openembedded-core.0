Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D731CA9EC3
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3768.1684186748022968313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K8y0Us5I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a51cc-7696c75e-63a3-40d4-be94-46a22bd668fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9YheaQBFL29S+LNvObThmHmg5W+Mx8RbxnkT5gU6WOQ=;
	b=K8y0Us5IlK2jlyQJarC4FhmuOBEbeOSmOxYOAa5/cOLJbneyG/nqKqdr4XspU84v
	BOEsBSONlWJOVKBFYRL6WOrUdF6wItquDDPwc3Wfax7xTWibKX2gO9MQzEpiGfcd0ii
	zDSpmcSIcTQwDjCjOhc+JgIHE68ww2GvmJGMWyFw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9YheaQBFL29S+LNvObThmHmg5W+Mx8RbxnkT5gU6WOQ=;
	b=L5OwxZ4QswA111jawIn4afL0WItbvkFjAWe/G/7Szjzu0pB1vR/rEF+RQjUEBYwr
	WVJ6lKlrbetIt+ONV12LFcZaEpECTQtjKvNjvwSHuq2UXbJroZTfaNnQEEygJoukaCO
	3aU8BQ/U+LAJHISBc+1WkuChFbTK4VZ3dca3Cx/I=
Content-Type: multipart/mixed; boundary="===============1105457071102929404=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 6.6.0 SUCCEEDED
Message-ID: <01010188215a51cc-7696c75e-63a3-40d4-be94-46a22bd668fa-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181312

--===============1105457071102929404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *6.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-6.2.0-6.6.0.patch
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
--===============1105457071102929404==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-6.2.0-6.6.0.patch"

RnJvbSA2MTJkYzQ2NWE5YWY1ZTgwOTg3MTY1NWEzNTVmMGEzYzczYmI0NWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTE6MDY6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YTogdXBncmFkZSA2LjIuMCAtPiA2LjYuMAoKLS0tCiAu
Li5pYi1tZXRhZGF0YV82LjIuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWltcG9ydGxp
Yi1tZXRhZGF0YV82LjIuMC5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYuMC5i
Yn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1w
b3J0bGliLW1ldGFkYXRhXzYuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuNi4wLmJiCmluZGV4IDNlOWI0MGVl
OWQuLjM0YmM1NWIwZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNi4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjYuMC5iYgpAQCAtOCw3
ICs4LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIFBZUElf
UEFDS0FHRSA9ICJpbXBvcnRsaWJfbWV0YWRhdGEiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIv
aW1wb3J0bGliLW1ldGFkYXRhLyg/UDxwdmVyPihcZCtbXC5cLV9dKikrKS8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI5MTI3YWFkMmY0OWQ3MjAzZTcxMTIwOThjMTJiOTJlNGZkMTA2MWNjZDE4
NTQ4Y2RmZGM0OTE3MWE4YzA3M2NjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkyNTAxY2RmOWNj
NjZlYmQzZTYxMmYxYjRmMGMwNzY1ZGZhNDJmMGZhMzhmZmIzMTliNmJkODRkZDY3NWQ3MDUiCiAK
IFMgPSAiJHtXT1JLRElSfS9pbXBvcnRsaWJfbWV0YWRhdGEtJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============1105457071102929404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.2.0.tar.gz;downloadfilename=importlib_metadata-6.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.6.0.tar.gz;downloadfilename=importlib_metadata-6.6.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 134917 to 144970 (+7%)
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.6.0.dist-info

--===============1105457071102929404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.6.0.dist-info

--===============1105457071102929404==--

