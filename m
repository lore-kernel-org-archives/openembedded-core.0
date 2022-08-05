Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5C3C3276F
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.3858.1659679408313275178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GpqOBW9x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c99fd38-5b0ce143-57ee-4959-9a2d-a50bb84af52c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+0duehzSYBeRI6/YMXacYI6FdDos2k/P+SjRSyfYV9U=;
	b=GpqOBW9xDtLwgXagqiZDxjGUR/EdRpOjIKfKIFlduf8EXOFBXYgaPtQbX+D5ISbO
	rOl6XPDIV7KmIxWWzDy5lQszuleVcrXQScc9cYGhEu46xJHjwS3xP5vhvfbUjSLGxGf
	x5XMnKCHBkVYz94ocAAJRvJrmHrR7aM4paqCWOCI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+0duehzSYBeRI6/YMXacYI6FdDos2k/P+SjRSyfYV9U=;
	b=YAYvjsy5oI2M4qlx9foaG3sQhxLAFl5qq487PTiibeHSFzl45HtwJetKTiQUJYsl
	0v844oUjnXE7x1lcdLglM5nicua81nXy14HzTJVzCH6NFGShfsV6rTyFB2eV+FEWtiP
	j9kEmsfRHlCwZzD8AdIj4wG64PEvCqSXOJKervj0=
Content-Type: multipart/mixed; boundary="===============2263055205488486100=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.9.1 SUCCEEDED
Message-ID: 
 <010101826c99fd38-5b0ce143-57ee-4959-9a2d-a50bb84af52c-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168897

--===============2263055205488486100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.9.0-4.9.1.patch
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
--===============2263055205488486100==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.9.0-4.9.1.patch"

RnJvbSBhNTYzZGE2OTRjODY0YTJhN2M5NWVhYWU5NWJjODEwN2Q3NWE3ZGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMjoxMDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjkuMCAtPiA0LjkuMQoKLS0tCiAuLi57cHl0aG9u
My1qc29uc2NoZW1hXzQuOS4wLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjkuMS5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25zY2hlbWFfNC45LjAu
YmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuOS4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuOS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC45LjEuYmIK
c2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC45LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuOS4xLmJiCmluZGV4IDY2ZTBhZmZj
NjQuLjEyNWJjNmI0ZDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1qc29uc2NoZW1hXzQuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuOS4xLmJiCkBAIC00LDcgKzQsNyBAQCBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTdhNjBhODFj
MTQ2ZWMyNTU5OWEzZTFkYWJiODYxMGE4IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2pz
b24vTElDRU5TRTttZDU9OWQ0ZGU0MzExMWQzMzU3MGM4ZmU0OWI0Y2IwZTAxYWYiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkZjEwZTY1YzhmMzY4N2E0OGU5M2QwZDM0OGNlMGNlNWY4OTdiNWEy
OGU5YmJjYmJlOGY3YzdlYWYwMTllODUwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQwOGM0Yzhl
ZDBkZWRlM2IyNjhmN2E0NDE3ODRmNzQyMDYzODBiMDRmOTNlYjJkNTM3YzdiZWZiM2RmMzA5OWYi
CiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuMzEuMQoK

--===============2263055205488486100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.9.0.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.9.1.dist-info

--===============2263055205488486100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonschema: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.9.1.tar.gz"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.9.0" to "4.9.1"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.9.0 [default] to 4.9.1 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.9.0" to "4.9.1"
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.10/site-packages/jsonschema-4.9.0.dist-info moved to /usr/lib/python3.10/site-packages/jsonschema-4.9.1.dist-info

--===============2263055205488486100==--

