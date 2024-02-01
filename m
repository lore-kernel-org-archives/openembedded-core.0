Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92C3C54E5A
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2110.1706810406583279066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aXstQZWb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CGtix9Kx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d65d3f2fc-ba9b0a84-5cb7-489a-bb9f-2967a0f7b3f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5nPHrND/YJvcK3BrLNS7VvsJQJrPf3J9L97HeUHoqQc=;
	b=aXstQZWb6wwvh1aqbi1p5gOugAPWCutyQ4TsQZ/5hwll2ijT5kaUWcLkSvxJteYB
	VZKYaUn+KkImZlu5GviVmR2HtTtNFFOeTCId3qXuI4UuPrVbgaBzHzGgEtWlQ0KHtSl
	CuF/Z5AiaNOVSOt7b3ajtDnsYSI4MD6WwJ0PJdEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5nPHrND/YJvcK3BrLNS7VvsJQJrPf3J9L97HeUHoqQc=;
	b=CGtix9Kx0Fe7YoBNiLrOE5U1SRRGIdqzxll/eyT61V6MlDkCgDk3WlwTDZvWxgYl
	HJJeW0EEYexAO1cPTpoe40NHfSpCfuiO0H4rZLxjNxzN+6klat7SsGDnuGMt3EtpI1P
	0N4JqIy7uFhU/F9qnjvBq2Aa7L6h+jskM6UH36tg=
Content-Type: multipart/mixed; boundary="===============1645654138364976773=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-htmlhelp: upgrading to 2.0.5 SUCCEEDED
Message-ID: <0101018d65d3f2fc-ba9b0a84-5cb7-489a-bb9f-2967a0f7b3f3-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194648

--===============1645654138364976773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-htmlhelp* to *2.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-htmlhelp-upgrade-2.0.4-2.0.5.patch
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
From f1739a0154b3818a10b42c07d5e8e3df42fbed09 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:29:48 +0000
Subject: [PATCH] python3-sphinxcontrib-htmlhelp: upgrade 2.0.4 -> 2.0.5

---
 ...tmlhelp_2.0.4.bb => python3-sphinxcontrib-htmlhelp_2.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.4.bb => python3-sphinxcontrib-htmlhelp_2.0.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
index a0a4b4496f..532d1fc22a 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
 
-SRC_URI[sha256sum] = "6c26a118a05b76000738429b724a0568dbde5b72391a688577da08f11891092a"
+SRC_URI[sha256sum] = "0dc87637d5de53dd5eec3a6a01753b1ccf99494bd756aafecd74b4fa9e729015"
 
 PYPI_PACKAGE = "sphinxcontrib-htmlhelp"
 
-- 
2.42.0


--===============1645654138364976773==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-htmlhelp-upgrade-2.0.4-2.0.5.patch"

RnJvbSBmMTczOWEwMTU0YjM4MThhMTBiNDJjMDdkNWU4ZTNkZjQyZmJlZDA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODoyOTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54Y29udHJpYi1odG1saGVscDogdXBncmFkZSAyLjAuNCAtPiAyLjAuNQoKLS0t
CiAuLi50bWxoZWxwXzIuMC40LmJiID0+IHB5dGhvbjMtc3BoaW54Y29udHJpYi1odG1saGVscF8y
LjAuNS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlu
eGNvbnRyaWItaHRtbGhlbHBfMi4wLjQuYmIgPT4gcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxo
ZWxwXzIuMC41LmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxoZWxwXzIuMC40LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItaHRtbGhlbHBfMi4wLjUu
YmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItaHRtbGhlbHBfMi4wLjQuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxo
ZWxwXzIuMC41LmJiCmluZGV4IGEwYTRiNDQ5NmYuLjUzMmQxZmMyMmEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxoZWxw
XzIuMC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhp
bnhjb250cmliLWh0bWxoZWxwXzIuMC41LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL3d3dy5zcGhpbngtZG9jLm9yZyIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjRkY2U1ZWY2YTEzNTYzMjQxYzI0
YmMzNjZmNDg4ODYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YzI2YTExOGEwNWI3NjAwMDcz
ODQyOWI3MjRhMDU2OGRiZGU1YjcyMzkxYTY4ODU3N2RhMDhmMTE4OTEwOTJhIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjBkYzg3NjM3ZDVkZTUzZGQ1ZWVjM2E2YTAxNzUzYjFjY2Y5OTQ5NGJkNzU2
YWFmZWNkNzRiNGZhOWU3MjkwMTUiCiAKIFBZUElfUEFDS0FHRSA9ICJzcGhpbnhjb250cmliLWh0
bWxoZWxwIgogCi0tIAoyLjQyLjAKCg==

--===============1645654138364976773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_htmlhelp-2.0.4.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_htmlhelp-2.0.5.dist-info

--===============1645654138364976773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-htmlhelp/sphinxcontrib_htmlhelp-2.0.4.tar.gz;downloadfilename=sphinxcontrib_htmlhelp-2.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-htmlhelp/sphinxcontrib_htmlhelp-2.0.5.tar.gz;downloadfilename=sphinxcontrib_htmlhelp-2.0.5.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dbg: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dbg: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dev: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-dev: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-doc: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-doc: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-locale: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-locale: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-src: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-src: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-staticdev: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp-staticdev: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp: PKGSIZE changed from 159734 to 159884 (+0%)
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp: PV changed from "2.0.4" to "2.0.5"
packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp/python3-sphinxcontrib-htmlhelp: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-htmlhelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_htmlhelp-2.0.4.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_htmlhelp-2.0.5.dist-info

--===============1645654138364976773==--

