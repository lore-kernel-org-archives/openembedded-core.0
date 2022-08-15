Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AE5C2BB47
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.6264.1660589821426876572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fmGoj0ie;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182a2ddc94d-587877a1-f245-43b8-9a0c-662ecf59e4e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QYmtLv9ZJHjG+MoNQKODyiH1MM1cdSqRqJ6Ulh1v3XA=;
	b=fmGoj0ied57J0/4E9fWzbFPJMhEHm8LHZ6Yel8yKHkmSsNicuUzUZEP1vzQTpMSU
	h3lrSsare8gYTnJB28HjMUfSYCgPR3eetHNURMGOOk37xRUczAAJ+l+eKYnOfSKCTsj
	bEYf3ekuEeiIEKAxTAa/10tq4jE6ne4BSjJ+5Hi4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QYmtLv9ZJHjG+MoNQKODyiH1MM1cdSqRqJ6Ulh1v3XA=;
	b=a1+Pgum4bzy+efyYH20ULHTbSAAz99mL/LMpBRMF0g8gvyx3KbmSl1S5xISGqfQu
	tSd9UXYxYR3xVPtL61k7Bz85+5Rs69DyXu/nyEirh6HaeYaRMhfEFKvadzDUPPdQ1LI
	MkFXs0lK14q2N1GwSGa4HkGHph2r6hnpaSjRxJ/o=
Content-Type: multipart/mixed; boundary="===============5562360258461404420=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2022.2.1 SUCCEEDED
Message-ID: 
 <01010182a2ddc94d-587877a1-f245-43b8-9a0c-662ecf59e4e3-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169385

--===============5562360258461404420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytz* to *2022.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2022.1-2022.2.1.patch
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
--===============5562360258461404420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.2.1.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pytz: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 61126 to 59168 (-3%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info -> /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info, added "/usr/lib/python3.10/site-packages/pytz/zoneinfo/Europe/Kyiv"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1061752 to 1054609 (-1%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PV changed from "2022.1" to "2022.2.1"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2022.1 [default] to 2022.2.1 [default]
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/zip-safe was added
  /usr/lib/python3.10/site-packages/pytz/zoneinfo/Europe/Kyiv was added
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/zip-safe was removed

--===============5562360258461404420==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2022.1-2022.2.1.patch"

RnJvbSBkNDRhMGU4YmI1MWUwNWNlMGQ0ZWM5YzI4MGMxYjdkY2VmYTJlOWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6NDM6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dHo6IHVwZ3JhZGUgMjAyMi4xIC0+IDIwMjIuMi4xCgotLS0KIC4uLi9weXRob24v
e3B5dGhvbjMtcHl0el8yMDIyLjEuYmIgPT4gcHl0aG9uMy1weXR6XzIwMjIuMi4xLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDIyLjEuYmIgPT4g
cHl0aG9uMy1weXR6XzIwMjIuMi4xLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuMS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6
XzIwMjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5dHpfMjAyMi4yLjEuYmIKaW5kZXggYTRiYjRmNWM4Zi4uYmI3YWVlZWMzNSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjIuMi4xLmJi
CkBAIC01LDcgKzUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDtt
ZDU9MWE2N2ZjNDZjMWI1OTZjY2U1ZDIxMjA5YmJlNzU5OTkiCiAKIGluaGVyaXQgcHlwaSBzZXR1
cHRvb2xzMyBwdGVzdAogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWU3NjBlMmZlNmE4MTYzYmMw
YjNkOWExOWM0Zjg0MzQyYWZhMGEyYWZmZWJmYWE4NGIwMWI5NzhhMDJlY2FhNyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJjZWEyMjE0MTcyMDRmMmQxYTJhYTAzZGRhZTNlODY3OTIxOTcxZDBkNzZm
MTRkODdhYmI0NDE0NDE1YmJkY2Y1IgogCiBSREVQRU5EUzoke1BOfTpjbGFzcy10YXJnZXQgKz0g
IlwKICAgICAke1BZVEhPTl9QTn0tZGF0ZXRpbWUgXAotLSAKMi4zMS4xCgo=

--===============5562360258461404420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info -> /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info, added "/usr/lib/python3.10/site-packages/pytz/zoneinfo/Europe/Kyiv"
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/pytz-2022.2.1.dist-info/zip-safe was added
  /usr/lib/python3.10/site-packages/pytz/zoneinfo/Europe/Kyiv was added
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/pytz-2022.1.dist-info/zip-safe was removed

--===============5562360258461404420==--

