Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953AFC27C51
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5947.1689456455188126413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fREpOaty;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101895b73ab4c-6417d4ff-59cb-4637-8e06-a7db59504063-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Adj9KNltrHOKH5/W+3kZqJaIEd10xtC79H9ZAX046vA=;
	b=fREpOatyeJvDfPxEP4AKG3MtLi8CdKFXtYzhfdxbAVv/55vrtVpztl2uYINF+iQY
	Us8BmCdnfG5ymjgessGKYp57YDwSpZPIxoN+oDIbVVLTCMKQteg5XFxpBJRaKRiA0xx
	Sdxp3eVVb6pZ3alZndXWDXphOyQAwLTYAZ7x6OiE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Adj9KNltrHOKH5/W+3kZqJaIEd10xtC79H9ZAX046vA=;
	b=P+sE3IsKNGoP460CkXu4U/AMuN3UAAHoboXm4HwPEhCytJYCvHYiNE+oAB8Bx082
	DCKYW3cUm72b00a+umsLZ6qwpXrSM/KgOd58evqytGTXGBApXE2Z8OHP2UL19KMBMeF
	i4df9fJ+6y3IyrOutUNFvfykRzPhKfc+w+/F0gYg=
Content-Type: multipart/mixed; boundary="===============8930758717740266919=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2023.7.6 SUCCEEDED
Message-ID: <010101895b73ab4c-6417d4ff-59cb-4637-8e06-a7db59504063-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184357

--===============8930758717740266919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2023.7.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2023.5.24-2023.7.6.patch
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
From b25b62dfddccaa887a2ddc76e6e93ff776adf39c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 13:19:55 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2023.5.24 -> 2023.7.6

---
 ...fiers_2023.5.24.bb => python3-trove-classifiers_2023.7.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.5.24.bb => python3-trove-classifiers_2023.7.6.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
index 2d484d4b2c..7879dc2031 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "fd5a1546283be941f47540a135bdeae8fb261380a6a204d9c18012f2a1b0ceae"
+SRC_URI[sha256sum] = "8a8e168b51d20fed607043831d37632bb50919d1c80a64e0f1393744691a8b22"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.2


--===============8930758717740266919==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2023.5.24-2023.7.6.patch"

RnJvbSBiMjViNjJkZmRkY2NhYTg4N2EyZGRjNzZlNmU5M2ZmNzc2YWRmMzljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTM6MTk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjMuNS4yNCAtPiAyMDIzLjcuNgoK
LS0tCiAuLi5maWVyc18yMDIzLjUuMjQuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDIzLjcuNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjMuNS4yNC5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjMuNy42LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDIzLjUuMjQuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy43LjYuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuNS4yNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMu
Ny42LmJiCmluZGV4IDJkNDg0ZDRiMmMuLjc4NzlkYzIwMzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDIzLjUuMjQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNz
aWZpZXJzXzIwMjMuNy42LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3
OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmQ1YTE1NDYyODNiZTk0
MWY0NzU0MGExMzViZGVhZThmYjI2MTM4MGE2YTIwNGQ5YzE4MDEyZjJhMWIwY2VhZSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4YThlMTY4YjUxZDIwZmVkNjA3MDQzODMxZDM3NjMyYmI1MDkxOWQx
YzgwYTY0ZTBmMTM5Mzc0NDY5MWE4YjIyIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YSBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============8930758717740266919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-trove-classifiers: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.5.24.tar.gz;downloadfilename=trove-classifiers-2023.5.24.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.7.6.tar.gz;downloadfilename=trove-classifiers-2023.7.6.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-trove-classifiers: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2023.5.24" to "2023.7.6"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2023.5.24 [default] to 2023.7.6 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 90302 to 90400 (+0%)
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2023.5.24" to "2023.7.6"
Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was removed

--===============8930758717740266919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.5.24.dist-info/WHEEL was removed

--===============8930758717740266919==--

