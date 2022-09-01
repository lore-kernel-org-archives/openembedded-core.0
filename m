Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775B8C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.12569.1662040786348939607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PJ2bGbU4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182f959c25d-36b1e27f-d614-4864-be5d-f9a5e93fd5be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uP7Hr0sb09+rDeivOGOfEObZqikA0acVt0J7vqsD6Jc=;
	b=PJ2bGbU4vRMbdH/x2x3m1Asz4RDWo9eBD0rGLPlr3ilE+0wyQyw9ag2OQxW17v4t
	5SnmhEFQr7YrblxeEXpPJ1hcD/xpIl1Z66MgWERDzIdJeb7Q6SR0VXN5tRTzWl5Ee+s
	/l7plpceR7qzHrpSiqd9BIrO6X8huIF9OJEvCNF8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uP7Hr0sb09+rDeivOGOfEObZqikA0acVt0J7vqsD6Jc=;
	b=jIkAfSSiNJlKZwQg9wVJ/WMfxhQwDIjqchPaA24nXbs6UuyhNFOA05RRqwEPtRkt
	FWcQy91kjKd64zI7hL57tch7KG51gioX3aj0943G1xurWKMi1HOmiSU1B9Pem4d0eQU
	SltdYGxBPYWEfjffcZAoc87HWCQISLIRCaKr12aM=
Content-Type: multipart/mixed; boundary="===============5372579725344551259=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.8.1 SUCCEEDED
Message-ID: 
 <01010182f959c25d-36b1e27f-d614-4864-be5d-f9a5e93fd5be-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170177

--===============5372579725344551259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.8.0-1.8.1.patch
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
--===============5372579725344551259==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.8.0-1.8.1.patch"

RnJvbSA4ZDBjZTRlMDE1ZmY3ZTBiMzE2ZjU4MmU0NmM4ZjkzNWY5ZWI4ODQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzowNzoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuOC4wIC0+IDEuOC4xCgotLS0KIC4uLi97cHl0aG9u
My1oYXRjaGxpbmdfMS44LjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS44LjEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuOC4wLmJi
ID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuOC4xLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS44LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuOC4xLmJiCnNpbWls
YXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1oYXRjaGxpbmdfMS44LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS44LjEuYmIKaW5kZXggMTdhMTBlZWIyZC4uYmZk
YjY2NDcxNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWhhdGNobGluZ18xLjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaGF0Y2hsaW5nXzEuOC4xLmJiCkBAIC04LDcgKzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0
aG9uX2hhdGNobGluZwogREVQRU5EUyArPSAicHl0aG9uMy1wbHVnZ3ktbmF0aXZlIHB5dGhvbjMt
dG9tbGktbmF0aXZlIHB5dGhvbjMtcGF0aHNwZWMtbmF0aXZlIHB5dGhvbjMtcGFja2FnaW5nLW5h
dGl2ZSBweXRob24zLWVkaXRhYmxlcy1uYXRpdmUiCiBERVBFTkRTOnJlbW92ZTpjbGFzcy1uYXRp
dmUgPSAicHl0aG9uMy1oYXRjaGxpbmctbmF0aXZlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YTRmOTgyZmRjYTA3MTdkOGM0NmJmZTdiNTAxMzAyZjkwYWFmMmE1MzAyODQ1ZDU1MGI0OWM4NzM5
NjgxZmViMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NDhiMDRiMjNmYWVkNjY5YjJiNTY1Yjk5
OGFjOTU1YWY0ZmVlYTY2YzVkZWVkM2ExMjEyYWM5Mzk5ZDJlMWNkIgogCiBkb19jb21waWxlOnBy
ZXBlbmQoKSB7CiAgICAgZXhwb3J0IFBZVEhPTlBBVEg9c3JjCi0tIAoyLjMxLjEKCg==

--===============5372579725344551259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.8.1.tar.gz"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 519762 to 520071 (+0%)
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.8.0" to "1.8.1"
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info

--===============5372579725344551259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.8.0.dist-info moved to /usr/lib/python3.10/site-packages/hatchling-1.8.1.dist-info

--===============5372579725344551259==--

