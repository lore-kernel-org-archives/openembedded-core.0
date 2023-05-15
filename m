Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD89CA9EB4
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3763.1684186747398878690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VBbMLbSA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a558d-8383c70e-899e-43e8-ae1e-d87e8f4d055f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hXZ1IKleJdGosR+jHVVdLnzFyKGqvC91oWF2M95nbBY=;
	b=VBbMLbSAKI2t2XHbgjDyej6zUM2Bw/dMHQKGJSshXfvCm+10sVFKGu5wNyyI4tK0
	VjLuc09s1t084mmO1WWt4WoLEKeuKJrIz16wOMq2bfaTiygEft2mYog+hxjWE4ZLXup
	O/cmxXnMJx9g4ammZ5AUuv0BAzNurBDWP4TWRMaI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hXZ1IKleJdGosR+jHVVdLnzFyKGqvC91oWF2M95nbBY=;
	b=ITsu+tVTtamMv9Ze6dCeO/q/cM4onjIzUPw1WdKURQ5LC3IQlnbuOx3yvzrp8zZB
	TG+lTe5DYIOqdGjFNTu2aAROT+/YdDGgG/kCTzPPaXnY/TsTJMvAr3e6D7LPTm/dTRr
	WOmMKgwWlSiwM4Jm+N8OZxA5YWNYlKaZLZ5I/dx4=
Content-Type: multipart/mixed; boundary="===============3079685338666217903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2023.5.2 SUCCEEDED
Message-ID: <01010188215a558d-8383c70e-899e-43e8-ae1e-d87e8f4d055f-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181321

--===============3079685338666217903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2023.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2023.4.29-2023.5.2.patch
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
--===============3079685338666217903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-trove-classifiers: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.4.29.tar.gz;downloadfilename=trove-classifiers-2023.4.29.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.5.2.tar.gz;downloadfilename=trove-classifiers-2023.5.2.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2023.4.29" to "2023.5.2"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 90178 to 90172 (-0%)
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2023.4.29 [default] to 2023.5.2 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2023.4.29" to "2023.5.2"
Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/WHEEL was removed

--===============3079685338666217903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.4.29.dist-info/WHEEL was removed

--===============3079685338666217903==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2023.4.29-2023.5.2.patch"

RnJvbSBlOGQyMTViNGEwMzg4MDQ3NjY3YWZkNGMxY2JjZjY1ZDA3ODkwODk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6Mjk6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjMuNC4yOSAtPiAyMDIzLjUuMgoK
LS0tCiAuLi5maWVyc18yMDIzLjQuMjkuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDIzLjUuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjMuNC4yOS5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjMuNS4yLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDIzLjQuMjkuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy41LjIuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuNC4yOS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMu
NS4yLmJiCmluZGV4IDRiYmNlYTU0ODkuLjc4MDU3ZmViNTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDIzLjQuMjku
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNz
aWZpZXJzXzIwMjMuNS4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3
OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGFkY2MwNmYxZWI3YzQ5
NWYwYmRjZWI2OThiZDljMDQ0YjNlNTdiMGQ1NzY3ZDk5ZWM0YjZiMTdjOWJiZTk1NyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJjNDZkNmU0MGE5NTgxNTk5YjE2YzcxMmUwMTY0ZmVjMzc2NDg3MmE0
MDg1YzY3M2MwNzU1OTc4N2NhZWRiODY3IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YSBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============3079685338666217903==--

