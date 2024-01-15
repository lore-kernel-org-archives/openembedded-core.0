Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E92BC48297
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.88289.1705340030548809217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ETV0PsTy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DEI5DH00;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d0e2fcb2a-e405e53a-2643-4a34-87b7-d3ffa577f981-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=84uxck5v729TWJ+MlAAK/hY+kwjKfc5DfdNzp9fMDIg=;
	b=ETV0PsTy3KmDBVn+nbik/d8JnBozxCKTAiuCPA5x6EH1PbOnKP1zyCD4CeOK/hTA
	OiAPxMJZ4k+smUdmgPVhP5Bym27nrgMZ/lhiE627XRkxhhS9832dPubtwAYiw8e0c6L
	FK/jjOJ7tkKOLAR1dE6TXTINGN8b1KeTbwzjNaek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=84uxck5v729TWJ+MlAAK/hY+kwjKfc5DfdNzp9fMDIg=;
	b=DEI5DH00d+2C8iV6PFUbGoeqRo+qpnyt/1IAqTgAw06urGpYqpINZSVMEvhKc/24
	xM+qB5rBCafX5RGJv76CyGFF1fA/BOQTvqJ8XEO6mAB4l957Dn/A38trp0QFegY56qo
	IcuOdVDlXDuHYR2fwUAAwBrLn3PZ1bY9VvvmQsMQ=
Content-Type: multipart/mixed; boundary="===============3648821864375791695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-applehelp: upgrading to 1.0.8 SUCCEEDED
Message-ID: <0101018d0e2fcb2a-e405e53a-2643-4a34-87b7-d3ffa577f981-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193746

--===============3648821864375791695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-applehelp* to *1.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-applehelp-upgrade-1.0.7-1.0.8.patch
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
From 83368ac047d5e61b03877cf50049d9bff714b3b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 08:02:57 +0000
Subject: [PATCH] python3-sphinxcontrib-applehelp: upgrade 1.0.7 -> 1.0.8

---
 ...lehelp_1.0.7.bb => python3-sphinxcontrib-applehelp_1.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.7.bb => python3-sphinxcontrib-applehelp_1.0.8.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
index ec3670641d..6ea7c516d5 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
 
-SRC_URI[sha256sum] = "39fdc8d762d33b01a7d8f026a3b7d71563ea3b72787d5f00ad8465bd9d6dfbfa"
+SRC_URI[sha256sum] = "c40a4f96f3776c4393d933412053962fac2b84f4c99a7982ba42e09576a70619"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============3648821864375791695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_applehelp-1.0.7.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_applehelp-1.0.8.dist-info

--===============3648821864375791695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib_applehelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib_applehelp-1.0.7.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib_applehelp-1.0.8.tar.gz;downloadfilename=sphinxcontrib_applehelp-1.0.8.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dbg: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dbg: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dev: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-doc: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-doc: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-locale: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-locale: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-src: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-src: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-staticdev: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-staticdev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp: PKGSIZE changed from 257535 to 257699 (+0%)
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_applehelp-1.0.7.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_applehelp-1.0.8.dist-info

--===============3648821864375791695==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-applehelp-upgrade-1.0.7-1.0.8.patch"

RnJvbSA4MzM2OGFjMDQ3ZDVlNjFiMDM4NzdjZjUwMDQ5ZDliZmY3MTRiM2IxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDg6MDI6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueGNvbnRyaWItYXBwbGVoZWxwOiB1cGdyYWRlIDEuMC43IC0+IDEuMC44Cgot
LS0KIC4uLmxlaGVscF8xLjAuNy5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItYXBwbGVoZWxw
XzEuMC44LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3Bo
aW54Y29udHJpYi1hcHBsZWhlbHBfMS4wLjcuYmIgPT4gcHl0aG9uMy1zcGhpbnhjb250cmliLWFw
cGxlaGVscF8xLjAuOC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1hcHBsZWhlbHBfMS4wLjcuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1hcHBsZWhlbHBf
MS4wLjguYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItYXBwbGVoZWxwXzEuMC43LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJp
Yi1hcHBsZWhlbHBfMS4wLjguYmIKaW5kZXggZWMzNjcwNjQxZC4uNmVhN2M1MTZkNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWIt
YXBwbGVoZWxwXzEuMC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbnhjb250cmliLWFwcGxlaGVscF8xLjAuOC5iYgpAQCAtMyw3ICszLDcgQEAgSE9N
RVBBR0UgPSAiaHR0cHM6Ly93d3cuc3BoaW54LWRvYy5vcmciCiBMSUNFTlNFID0gIkJTRC0yLUNs
YXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM3NzE1ODU3MDQy
ZDRjOGMwMTA1OTk5Y2EwYzA3MmM1IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzlmZGM4ZDc2
MmQzM2IwMWE3ZDhmMDI2YTNiN2Q3MTU2M2VhM2I3Mjc4N2Q1ZjAwYWQ4NDY1YmQ5ZDZkZmJmYSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjNDBhNGY5NmYzNzc2YzQzOTNkOTMzNDEyMDUzOTYyZmFj
MmI4NGY0Yzk5YTc5ODJiYTQyZTA5NTc2YTcwNjE5IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2Zs
aXRfY29yZQogCi0tIAoyLjQyLjAKCg==

--===============3648821864375791695==--

