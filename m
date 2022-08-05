Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64353C32793
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4051.1659679407917235114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Fdnij/S3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101826c99fc2a-0fa68b31-9d23-4189-985e-011895e5a9d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wr7ok5j+jAhXGOx074H/o+UoCBugCoNZmnW/RXWGCDU=;
	b=Fdnij/S3uC0yJ06ggcZsZyvPGlllAuylV3wkDsV8zdxmRjByDoZkUOiOjibx0I/8
	LgyyPRRazmt7/kWYEotJhWNOSeciIjtLa5bna/Y3D2oH2rDiHbUqPWw23Y/BRiY7APE
	S1nlLRqm28ofiumvI0kAHelsRNY+NORTOB18zl0M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wr7ok5j+jAhXGOx074H/o+UoCBugCoNZmnW/RXWGCDU=;
	b=IXW6uuvjsyxwKnA94FGk5cUSC4Hs+dMLqb+Q7EpEuCAyLB4jAFWO34HaNwfbir48
	8iSmCs8/0iDGwO9j+X9vm/z2PWoWjnbwM2wRWlP9QkdM0ioKxjAZg+QRilGKFHAjB8y
	TR0K00yBi4JLx8pta/U/loukXu3VC25BC8kvafuI=
Content-Type: multipart/mixed; boundary="===============4019637698551070189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.8 SUCCEEDED
Message-ID: 
 <010101826c99fc2a-0fa68b31-9d23-4189-985e-011895e5a9d4-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168890

--===============4019637698551070189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.7-2022.8.patch
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
--===============4019637698551070189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.7.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/schemas/msi-consumer.yaml /usr/lib/python3.10/site-packages/dtschema/schemas/pci/pci-iommu.yaml /usr/bin/dt-check-compatible"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.7.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info
  /usr/lib/python3.10/site-packages/dtschema/schemas/msi-consumer.yaml was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/pci/pci-iommu.yaml was added

--===============4019637698551070189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.7.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.7 [default] to 2022.8 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.7" to "2022.8"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.7.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/schemas/msi-consumer.yaml /usr/bin/dt-check-compatible /usr/lib/python3.10/site-packages/dtschema/schemas/pci/pci-iommu.yaml"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 226184 to 241896 (+7%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.7.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.8.dist-info
  /usr/lib/python3.10/site-packages/dtschema/schemas/msi-consumer.yaml was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/pci/pci-iommu.yaml was added

--===============4019637698551070189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.7-2022.8.patch"

RnJvbSBmNjcyMDMzMWE0MWVhOGZhMWM4NWI5YzVmYTczNDFjM2VhNTQ3N2I1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMjowMzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMi43IC0+IDIwMjIuOAoKLS0tCiAuLi4ve3B5dGhv
bjMtZHRzY2hlbWFfMjAyMi43LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMi44LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjIuNy5i
YiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjIuOC5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi43LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC5iYgpzaW1p
bGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZHRzY2hlbWFfMjAyMi43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi44LmJiCmluZGV4IGRkOTA5MmY0NDkuLmU4
YzhhYzZmOTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kdHNjaGVtYV8yMDIyLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjIuOC5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHNl
dHVwdG9vbHMzCiAKIFBZUElfUEFDS0FHRSA9ICJkdHNjaGVtYSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjIyMzg3NTNmYTE2YmVlN2IyNjg0MWNjZWQ3NWQ3NDVhZjc3N2I4OTYxOTBmNDBhZmY1
ODAyOTkyMzM1MjAxYmIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWJlZmU3YzlmNzRjZWEyNDhh
OGI1MjRjZjYxODVhYzQ4OTEyYTViMmFhZTk2ODU0ZDc3Y2I5NDU4NDQzM2NhNCIKIAogREVQRU5E
UyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBSREVQRU5EUzoke1BOfSArPSAi
cHl0aG9uMy1ydWFtZWwteWFtbCBweXRob24zLWpzb25zY2hlbWEgcHl0aG9uMy1yZmMzOTg3Igot
LSAKMi4zMS4xCgo=

--===============4019637698551070189==--

