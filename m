Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EF4C64EB6
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.46823.1669908626738629588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EYixbLlX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010184ce4f7a22-c551a2ed-23b5-4c3a-b92a-f40e4600b8a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VXCod0rxnhLgELPbyO+E3ST8kAzOOOgU+ep3doo10Zg=;
	b=EYixbLlXYUS0hjhPtYTDQx9E1jP0p73hk1kqxo2Ya0/u6PJk12MBEBvaA/H91m86
	b374NgGIjA6J+yTJXkPYfFmlmu4VsB9ZPUgrSf7B5sMyrOOngL+DAJA6Mexvms6w3Du
	ZtHdJrLRPFM2ZOV1ZkZ6B0k8WPWJ2C21MKWYgfrA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VXCod0rxnhLgELPbyO+E3ST8kAzOOOgU+ep3doo10Zg=;
	b=Mgc/BLc+nplbDxZFUWlW25rXRWu7GcbdBligJYDJ9VzhGS3ReCRtj9HIeHN5jUti
	f8LrEF/KxMeUNtUVZfJMiSWi1RgK6opeZAvfPlvh67C9y6C1qTSO5l3oYnOzk1pG7q+
	vWPHLEKh+F4jcPs6HKmtS7eun+Ye2Ed8WGP8fHh0=
Content-Type: multipart/mixed; boundary="===============6255409271466354584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-gitdb: upgrading to 4.0.10 SUCCEEDED
Message-ID: <01010184ce4f7a22-c551a2ed-23b5-4c3a-b92a-f40e4600b8a1-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174141

--===============6255409271466354584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-gitdb* to *4.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-gitdb-upgrade-4.0.9-4.0.10.patch
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
--===============6255409271466354584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-gitdb: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.9.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.10.tar.gz"
packages/core2-32-poky-linux/python3-gitdb: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dbg: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dbg: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dev: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dev: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-doc: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-doc: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-locale: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-locale: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-src: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-src: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-staticdev: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-staticdev: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PKGSIZE changed from 410961 to 408148 (-1%)
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
Changes to packages/core2-32-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/AUTHORS was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/AUTHORS was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/WHEEL was removed

--===============6255409271466354584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-gitdb-upgrade-4.0.9-4.0.10.patch"

RnJvbSBkNGM0M2ZiZjhiOTM3ZTRhOGMxZjZiMmRjODEyZTZhMDg3ODI3ZmYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOToyNDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0ZGI6IHVwZ3JhZGUgNC4wLjkgLT4gNC4wLjEwCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLWdpdGRiLmluYyAgICAgICAgICAgICAgICAgICB8IDIgKy0K
IC4uLi9weXRob24ve3B5dGhvbjMtZ2l0ZGJfNC4wLjkuYmIgPT4gcHl0aG9uMy1naXRkYl80LjAu
MTAuYmJ9ICB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWdpdGRiXzQu
MC45LmJiID0+IHB5dGhvbjMtZ2l0ZGJfNC4wLjEwLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1naXRkYi5pbmMgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1naXRkYi5pbmMKaW5kZXggOTQ4Mjk2NGYzMC4uZDky
ZDY0NTNkOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24t
Z2l0ZGIuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWdpdGRi
LmluYwpAQCAtOCw3ICs4LDcgQEAgaW5oZXJpdCBweXBpCiAKIFBZUElfUEFDS0FHRSA9ICJnaXRk
YiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhYzJmZDQ1YzBhMWM5Y2Y2MTllNjNhOTBkNjJi
ZGM2Mzg5MmVmOTIzODc0MjRiODU1NzkyYTZjYWJlNzg5YWEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNmViOTkwYjY5ZGY0ZTE1YmFkODk5ZWE4NjhkYzQ2NTcyYzNmNzUzMzk3MzU2NjNiODFkZTc5
YjA2ZjE3ZWI5YSIKIAogREVQRU5EUyA9ICIke1BZVEhPTl9QTn0tYXN5bmMgJHtQWVRIT05fUE59
LXNldHVwdG9vbHMtbmF0aXZlICR7UFlUSE9OX1BOfS1zbW1hcCIKIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdGRiXzQuMC45LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdGRiXzQuMC4xMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWdpdGRiXzQuMC45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZ2l0ZGJfNC4wLjEwLmJiCi0tIAoyLjMxLjEKCg==

--===============6255409271466354584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/AUTHORS was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/AUTHORS was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/WHEEL was removed

--===============6255409271466354584==--

