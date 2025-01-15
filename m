Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C25AC021A7
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17797.1736936768847596287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Zx1twupA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=F8VihYpz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194697fc1fc-e34ec8cf-dbcc-45f6-b765-3c6a8e019795-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936768;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WZJTJKpZnh8rankqTa9gFamptARW/pCY35GFhUKpvwU=;
	b=Zx1twupA7VP4qobJbLg4lwBclKH3KAMJcYEWTzDmgi3ERI9BUCO2w8dEL2ZME8Ck
	xbulUJEMi/H2z999PsHI1t1zwjJheItseiwGjMX5fzIMgOTuC7NS2ZQmJfjwT9rkGDL
	Oog/oF+sIyUt8JZDuPwfIlRxQS3sfdpzk/wpfjjc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936768;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WZJTJKpZnh8rankqTa9gFamptARW/pCY35GFhUKpvwU=;
	b=F8VihYpzqv1muhTnX0q7ZnqmawA0L8sqk3TlU2jLLRCez6mep52nScjQ0TJBcGcU
	gDyznwtRnRJs0Ts0k8lymATOy99sAF5m9t0xMdq02RY46/xMoEaYN1P3gRx9pEYt4/K
	GKpfnsP/1JhKgh/OxrdulVkOdWCC63EpBFE0utBY=
Content-Type: multipart/mixed; boundary="===============7099048899145570167=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-license-expression: upgrading to 30.4.1 SUCCEEDED
Message-ID: <01010194697fc1fc-e34ec8cf-dbcc-45f6-b765-3c6a8e019795-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209841

--===============7099048899145570167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-license-expression* to *30.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-license-expression-upgrade-30.4.0-30.4.1.patch
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
From c30c96be40efaed1cec72bd164b1199701eadc0a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:30:56 +0000
Subject: [PATCH] python3-license-expression: upgrade 30.4.0 -> 30.4.1

---
 ...xpression_30.4.0.bb => python3-license-expression_30.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.4.0.bb => python3-license-expression_30.4.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
index 3af739bed4..649b53ea49 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6464397f8ed4353cc778999caec43b099f8d8d5b335f282e26a9eb9435522f05"
+SRC_URI[sha256sum] = "9f02105f9e0fcecba6a85dfbbed7d94ea1c3a70cf23ddbfb5adf3438a6f6fce0"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-- 
2.44.1


--===============7099048899145570167==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-license-expression-upgrade-30.4.0-30.4.1.patch"

RnJvbSBjMzBjOTZiZTQwZWZhZWQxY2VjNzJiZDE2NGIxMTk5NzAxZWFkYzBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6MzA6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbjogdXBncmFkZSAzMC40LjAgLT4gMzAuNC4xCgotLS0K
IC4uLnhwcmVzc2lvbl8zMC40LjAuYmIgPT4gcHl0aG9uMy1saWNlbnNlLWV4cHJlc3Npb25fMzAu
NC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbGljZW5z
ZS1leHByZXNzaW9uXzMwLjQuMC5iYiA9PiBweXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40
LjEuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40LjEuYmIKaW5kZXgg
M2FmNzM5YmVkNC4uNjQ5YjUzZWE0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40LjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40LjEu
YmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9uZXhCL2xp
Y2Vuc2UtZXhwcmVzc2lvbiIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL2FwYWNoZS0yLjAuTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4
OTg2OTY4ZjQzMjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2NDY0Mzk3ZjhlZDQzNTNjYzc3
ODk5OWNhZWM0M2IwOTlmOGQ4ZDViMzM1ZjI4MmUyNmE5ZWI5NDM1NTIyZjA1IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjlmMDIxMDVmOWUwZmNlY2JhNmE4NWRmYmJlZDdkOTRlYTFjM2E3MGNmMjNk
ZGJmYjVhZGYzNDM4YTZmNmZjZTAiCiAKIGluaGVyaXQgcHlwaSBwdGVzdC1weXRob24tcHl0ZXN0
IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIFBZUElfUEFDS0FHRSA9ICJsaWNlbnNlX2V4
cHJlc3Npb24iCi0tIAoyLjQ0LjEKCg==

--===============7099048899145570167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-license-expression: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.0.tar.gz;downloadfilename=license_expression-30.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.1.tar.gz;downloadfilename=license_expression-30.4.1.tar.gz"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGSIZE changed from 1004031 to 1013480 (+1%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGSIZE changed from 1110394 to 1120011 (+1%)
Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.0.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info

--===============7099048899145570167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.0.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info

--===============7099048899145570167==--

