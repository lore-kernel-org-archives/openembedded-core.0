Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BD8CA9EC9
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7617.1685693430680420661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=frBt/GtO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b288529-c8857f8d-b807-42ae-a1da-3482fe6f2fd2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8JypMQhSFxSPTeMsZoAxK2yPypcXgzZP/vGEl0IVTsg=;
	b=frBt/GtO065pRbfB/QD2gfv1yIaUmnpKGDyfVxTEnCzSYHh4oZWSzCaKCczUo6BU
	KJKLtyYllTIo6iiONOFM/M1a9//S0gJ5brmFkuJnOsMnToUGCFARLx+L17nBA6I4EDu
	A/PCQC2eWTXdy6Mh5mPio3aBml1H0/NIju/o4gIw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8JypMQhSFxSPTeMsZoAxK2yPypcXgzZP/vGEl0IVTsg=;
	b=Wygp+6dt6JrBOeroqBpXsKiueI80HCbUhptJ35+F4oQiQQxynn1bQJqBdapBIify
	KOHKQvEpqBx4BgPEClJNd2DInKbrCE4u5f9NoMyLTCutWgKt/xfnuONtl6nIkpzGyU/
	pH1zW4hBcuo6a69hT09kL5qZHPwMHuFrl3zbB9dY=
Content-Type: multipart/mixed; boundary="===============2905699188840629573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2023.5.24 SUCCEEDED
Message-ID: <010101887b288529-c8857f8d-b807-42ae-a1da-3482fe6f2fd2-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182202

--===============2905699188840629573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2023.5.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2023.5.2-2023.5.24.patch
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
--===============2905699188840629573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was removed

--===============2905699188840629573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2023.5.2-2023.5.24.patch"

RnJvbSA3ZTdmM2EzZTAyMDIzOTZjN2M3ZWY1Yjc2NDVmZmE4MDZhZmY2ODQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNzowMjo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyMy41LjIgLT4gMjAyMy41LjI0Cgot
LS0KIC4uLmZpZXJzXzIwMjMuNS4yLmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAy
My41LjI0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyMy41LjIuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDIzLjUuMjQuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuNS4yLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuNS4yNC5iYgpz
aW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy41LjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDIzLjUu
MjQuYmIKaW5kZXggNzgwNTdmZWI1Mi4uMmQ0ODRkNGIyYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuNS4yLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lm
aWVyc18yMDIzLjUuMjQuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9weXBhL3Ryb3ZlLWNsYXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5
YmQ4OTg2OTY4ZjQzMjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNDZkNmU0MGE5NTgxNTk5
YjE2YzcxMmUwMTY0ZmVjMzc2NDg3MmE0MDg1YzY3M2MwNzU1OTc4N2NhZWRiODY3IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImZkNWExNTQ2MjgzYmU5NDFmNDc1NDBhMTM1YmRlYWU4ZmIyNjEzODBh
NmEyMDRkOWMxODAxMmYyYTFiMGNlYWUiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29s
c19idWlsZF9tZXRhIHB0ZXN0CiAKLS0gCjIuMzkuMgoK

--===============2905699188840629573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-trove-classifiers: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.5.2.tar.gz;downloadfilename=trove-classifiers-2023.5.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.5.24.tar.gz;downloadfilename=trove-classifiers-2023.5.24.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2023.5.2 [default] to 2023.5.24 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2023.5.2" to "2023.5.24"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 90172 to 90302 (+0%)
Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.2.dist-info/WHEEL was removed

--===============2905699188840629573==--

