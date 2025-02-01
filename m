Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B0FC0219E
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.42711.1738416044240252461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sm7ajMr/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wzod1OsS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194c1abd383-674af514-fa16-4e20-aa1f-5faee64efd29-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oiY8POeKJo+rc207C4qODC+3pUUR+NSGlAgHgr8zM8g=;
	b=Sm7ajMr/DpSRfhEX0BkjiINf7z6CubcNf6S6M2Uwai70N/aZ8tMi8tXHS+uv4EZc
	dOzgZeiln4aJhRGGHVojakSUuMd44tHXijnp78MZmkZDUJ2qackwS5nQ5SrmrwuPEnL
	xuw/ppNYnP6+1MBpdir6WoB9TuB8YwfrZhUXkjDI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oiY8POeKJo+rc207C4qODC+3pUUR+NSGlAgHgr8zM8g=;
	b=wzod1OsS7gll7JlPm/k62j5MeftdX+O7JKRKgodbfviKIN6l/SIbhJsoCuclIS8q
	Ai99fF51UlYLAzadp3TMV7dhsI+NCpyUTmy692N4P9OdemdvCVulUbj2nPRrO0IRM1l
	BT4hS1BQzl1rtdMSrqXuvK0ATY3f23UxWE6K6I08=
Content-Type: multipart/mixed; boundary="===============2687291320286880833=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-license-expression: upgrading to 30.4.1 SUCCEEDED
Message-ID: <01010194c1abd383-674af514-fa16-4e20-aa1f-5faee64efd29-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210532

--===============2687291320286880833==
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
From de2abf00ca836873915e55a3ce2567fbc1a7f08d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:09:36 +0000
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


--===============2687291320286880833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-license-expression: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.0.tar.gz;downloadfilename=license_expression-30.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.1.tar.gz;downloadfilename=license_expression-30.4.1.tar.gz"
packages/core2-64-poky-linux/python3-license-expression: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGSIZE changed from 1004031 to 1013480 (+1%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PV changed from "30.4.0" to "30.4.1"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGV changed from 30.4.0 [default] to 30.4.1 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGSIZE changed from 1110394 to 1120011 (+1%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PV changed from "30.4.0" to "30.4.1"
Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.0.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info

--===============2687291320286880833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.0.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.1.dist-info

--===============2687291320286880833==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-license-expression-upgrade-30.4.0-30.4.1.patch"

RnJvbSBkZTJhYmYwMGNhODM2ODczOTE1ZTU1YTNjZTI1NjdmYmMxYTdmMDhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODowOTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbGljZW5zZS1leHByZXNzaW9uOiB1cGdyYWRlIDMwLjQuMCAtPiAzMC40LjEKCi0tLQog
Li4ueHByZXNzaW9uXzMwLjQuMC5iYiA9PiBweXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40
LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1saWNlbnNl
LWV4cHJlc3Npb25fMzAuNC4wLmJiID0+IHB5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQu
MS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1saWNlbnNlLWV4cHJlc3Npb25fMzAuNC4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1saWNlbnNlLWV4cHJlc3Npb25fMzAuNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMS5iYgppbmRleCAz
YWY3MzliZWQ0Li42NDliNTNlYTQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMS5i
YgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL25leEIvbGlj
ZW5zZS1leHByZXNzaW9uIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vYXBhY2hlLTIuMC5MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY0NjQzOTdmOGVkNDM1M2NjNzc4
OTk5Y2FlYzQzYjA5OWY4ZDhkNWIzMzVmMjgyZTI2YTllYjk0MzU1MjJmMDUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiOWYwMjEwNWY5ZTBmY2VjYmE2YTg1ZGZiYmVkN2Q5NGVhMWMzYTcwY2YyM2Rk
YmZiNWFkZjM0MzhhNmY2ZmNlMCIKIAogaW5oZXJpdCBweXBpIHB0ZXN0LXB5dGhvbi1weXRlc3Qg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9QQUNLQUdFID0gImxpY2Vuc2VfZXhw
cmVzc2lvbiIKLS0gCjIuNDQuMQoK

--===============2687291320286880833==--

