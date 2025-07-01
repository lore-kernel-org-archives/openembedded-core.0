Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C69C8303F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1425.1751386807795013058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YTbENjUC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DixWLs81;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010197c6c9f522-40d98c07-674c-4e85-bff9-276b7aa92a05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386814;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5XLU5BtFHNq2UTaVch7d/6XkAYOQkE6idGI8KGWjRg0=;
	b=YTbENjUCxuQK8a1AUgdZ3mkpBUQoWkjGYrKh93VwwbKERi9jVm48oCzofNCi+AoF
	g54BLAn/H7dNb6Uo9h87HDcypm9aiDH/1YwPRWDJOHZ2OoSr5VdfSSyaouvRbUk9bwx
	2xfkbNCLnx51v0zlxUQJ1lm1r/Sly2lxYSa3BXqM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386814;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5XLU5BtFHNq2UTaVch7d/6XkAYOQkE6idGI8KGWjRg0=;
	b=DixWLs81dzgPx2lAYrXThVaaYIXUP4Vl4yP7EskqnIN19bkQb8a7NPTkbBmCnlmx
	Yha/e2UF/g3SJoNdEgsKdS2/gUQT/tgF32W0ZTsbOQ5di0OGS2hDLxJKNhYEPzNPNo3
	brNAA+1cqWB3rIBKgqzo8BroX6CL7f0TWggUxJuQ=
Content-Type: multipart/mixed; boundary="===============2282260395426681677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-license-expression: upgrading to 30.4.3 SUCCEEDED
Message-ID: <01010197c6c9f522-40d98c07-674c-4e85-bff9-276b7aa92a05-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219638

--===============2282260395426681677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-license-expression* to *30.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-license-expression-upgrade-30.4.1-30.4.3.patch
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
From 435fb1e9f38afb653f6a437e3885573921d21a0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 09:06:35 +0000
Subject: [PATCH] python3-license-expression: upgrade 30.4.1 -> 30.4.3

---
 ...xpression_30.4.1.bb => python3-license-expression_30.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.4.1.bb => python3-license-expression_30.4.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
index ec613f6eaa..065284ed62 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "9f02105f9e0fcecba6a85dfbbed7d94ea1c3a70cf23ddbfb5adf3438a6f6fce0"
+SRC_URI[sha256sum] = "49f439fea91c4d1a642f9f2902b58db1d42396c5e331045f41ce50df9b40b1f2"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-- 
2.47.1


--===============2282260395426681677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: FILELIST: removed "/usr/lib/python3-license-expression/ptest/tests/test_skeleton_codestyle.py"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: FILELIST: directory renamed /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info -> /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info, removed "/usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/apache-2.0.LICENSE /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/NOTICE /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/AUTHORS.rst /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/CHANGELOG.rst /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/CODE_OF_CONDUCT.rst", added "/usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/apache-2.0.LICENSE /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/README.rst /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info
 /licenses/NOTICE /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/AUTHORS.rst /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/CHANGELOG.rst /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/CODE_OF_CONDUCT.rst"
Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info
  /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/README.rst was added

--===============2282260395426681677==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-license-expression-upgrade-30.4.1-30.4.3.patch"

RnJvbSA0MzVmYjFlOWYzOGFmYjY1M2Y2YTQzN2UzODg1NTczOTIxZDIxYTBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwOTowNjozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbGljZW5zZS1leHByZXNzaW9uOiB1cGdyYWRlIDMwLjQuMSAtPiAzMC40LjMKCi0tLQog
Li4ueHByZXNzaW9uXzMwLjQuMS5iYiA9PiBweXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40
LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1saWNlbnNl
LWV4cHJlc3Npb25fMzAuNC4xLmJiID0+IHB5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQu
My5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1saWNlbnNlLWV4cHJlc3Npb25fMzAuNC4zLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1saWNlbnNlLWV4cHJlc3Npb25fMzAuNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMy5iYgppbmRleCBl
YzYxM2Y2ZWFhLi4wNjUyODRlZDYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMy5i
YgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL25leEIvbGlj
ZW5zZS1leHByZXNzaW9uIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vYXBhY2hlLTIuMC5MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlmMDIxMDVmOWUwZmNlY2JhNmE4
NWRmYmJlZDdkOTRlYTFjM2E3MGNmMjNkZGJmYjVhZGYzNDM4YTZmNmZjZTAiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNDlmNDM5ZmVhOTFjNGQxYTY0MmY5ZjI5MDJiNThkYjFkNDIzOTZjNWUzMzEw
NDVmNDFjZTUwZGY5YjQwYjFmMiIKIAogaW5oZXJpdCBweXBpIHB0ZXN0LXB5dGhvbi1weXRlc3Qg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9QQUNLQUdFID0gImxpY2Vuc2VfZXhw
cmVzc2lvbiIKLS0gCjIuNDcuMQoK

--===============2282260395426681677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-license-expression: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.1.tar.gz;downloadfilename=license_expression-30.4.1.tar.gz" to "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.3.tar.gz;downloadfilename=license_expression-30.4.3.tar.gz"
packages/core2-64-poky-linux/python3-license-expression: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGSIZE changed from 117497 to 117398 (-0%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: FILELIST: removed "/usr/lib/python3-license-expression/ptest/tests/test_skeleton_codestyle.py"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PV changed from "30.4.1" to "30.4.3"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGSIZE changed from 1120033 to 1161503 (+4%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: FILELIST: directory renamed /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info -> /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info, removed "/usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/NOTICE /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/CODE_OF_CONDUCT.rst /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/CHANGELOG.rst /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/AUTHORS.rst /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info/licenses/apache-2.0.LICENSE", added "/usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/NOTICE /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/CODE_OF_CONDUCT.rst /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/li
 censes/CHANGELOG.rst /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/AUTHORS.rst /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/README.rst /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/apache-2.0.LICENSE"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGV changed from 30.4.1 [default] to 30.4.3 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PV changed from "30.4.1" to "30.4.3"
Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info
  /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info/licenses/README.rst was added

--===============2282260395426681677==--

