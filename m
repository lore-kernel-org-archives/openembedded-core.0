Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4436CD6004F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4810.1731964629996632695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X/zBaeoI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FjIXw16C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101934122f21b-0757f5c3-faea-4597-8a1a-1bde91f33aaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YxeG5rSfofXg2ZLJoILpMcC+nizSNgxtS2lbOaXHX/Y=;
	b=X/zBaeoI3Bl0aotjp4eIDKTvOlvlyAZ/3ggMGci4ZM2MvV+QeuYuqQza/F8oVyYo
	JWw9j07NLzr0YHbqvmbGGEV6kUJy+1DHEhvq2sqMDcNe6ztikcaRshcjKHNZnliHPuI
	OR8i+0rP5NCartaFIoLlEGz5vpKeASErqqaf7m3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YxeG5rSfofXg2ZLJoILpMcC+nizSNgxtS2lbOaXHX/Y=;
	b=FjIXw16CtFvjbCBajeNE906QrgA0Q8hX/9Q9cxuabY35CEmifUuaqD/fDWqHH0iA
	BX1u6PFAw2Z+MMJ80pV2uN3BiYtCXlIKZ4mZ6ohHeBG772T5/C+hnA6qJetaU71Asuy
	TxD+afMvoWkpgtmiDttB7SXlmRs5JdJ454N4gjd4=
Content-Type: multipart/mixed; boundary="===============1877766736180080263=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-license-expression: upgrading to 30.4.0 SUCCEEDED
Message-ID: <010101934122f21b-0757f5c3-faea-4597-8a1a-1bde91f33aaa-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207281

--===============1877766736180080263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-license-expression* to *30.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-license-expression-upgrade-30.3.1-30.4.0.patch
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
From 76606746f9b4f035a6bf117df148eda39c631427 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 22:21:35 +0000
Subject: [PATCH] python3-license-expression: upgrade 30.3.1 -> 30.4.0

---
 ...xpression_30.3.1.bb => python3-license-expression_30.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.3.1.bb => python3-license-expression_30.4.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-license-expression_30.3.1.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
index edf7ead2e4..7a035206da 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "60d5bec1f3364c256a92b9a08583d7ea933c7aa272c8d36d04144a89a3858c01"
+SRC_URI[sha256sum] = "6464397f8ed4353cc778999caec43b099f8d8d5b335f282e26a9eb9435522f05"
 
 inherit pypi ptest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-- 
2.44.1


--===============1877766736180080263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.3.1.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.0.dist-info

--===============1877766736180080263==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-license-expression-upgrade-30.3.1-30.4.0.patch"

RnJvbSA3NjYwNjc0NmY5YjRmMDM1YTZiZjExN2RmMTQ4ZWRhMzljNjMxNDI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjI6MjE6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbjogdXBncmFkZSAzMC4zLjEgLT4gMzAuNC4wCgotLS0K
IC4uLnhwcmVzc2lvbl8zMC4zLjEuYmIgPT4gcHl0aG9uMy1saWNlbnNlLWV4cHJlc3Npb25fMzAu
NC4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbGljZW5z
ZS1leHByZXNzaW9uXzMwLjMuMS5iYiA9PiBweXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40
LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40LjAuYmIKaW5kZXgg
ZWRmN2VhZDJlNC4uN2EwMzUyMDZkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC4zLjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40LjAu
YmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9uZXhCL2xp
Y2Vuc2UtZXhwcmVzc2lvbiIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL2FwYWNoZS0yLjAuTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4
OTg2OTY4ZjQzMjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2MGQ1YmVjMWYzMzY0YzI1NmE5
MmI5YTA4NTgzZDdlYTkzM2M3YWEyNzJjOGQzNmQwNDE0NGE4OWEzODU4YzAxIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjY0NjQzOTdmOGVkNDM1M2NjNzc4OTk5Y2FlYzQzYjA5OWY4ZDhkNWIzMzVm
MjgyZTI2YTllYjk0MzU1MjJmMDUiCiAKIGluaGVyaXQgcHlwaSBwdGVzdCBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhCiBQWVBJX1BBQ0tBR0UgPSAibGljZW5zZV9leHByZXNzaW9uIgotLSAK
Mi40NC4xCgo=

--===============1877766736180080263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-license-expression: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.3.1.tar.gz;downloadfilename=license_expression-30.3.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.0.tar.gz;downloadfilename=license_expression-30.4.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-license-expression: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGSIZE changed from 1102218 to 1119992 (+2%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PV changed from "30.3.1" to "30.4.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGSIZE changed from 1093852 to 1111814 (+2%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGV changed from 30.3.1 [default] to 30.4.0 [default]
Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.3.1.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.0.dist-info

--===============1877766736180080263==--

