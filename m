Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED4AC36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18040.1743511391276820323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=canWR1Ye;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Mdj7FEbD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195f160b25e-6582797e-f9a1-4e93-82a3-0553af385526-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511401;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=78MQmEMHcDlUhrnjepUGI/yMTpgWbjLhIbe7NZCua4Q=;
	b=canWR1YewiJHVI86EPFSrRRV6vTq1lM8e8ActjniBbT/AdWZ3GQ/qvsegrZFy0Bj
	TPkRvDSvaw4ZM/A4THhzsnXviDx9QIpib3+hmxdOdvpccZXDFG02EgOEQ0TK0wZQPsl
	ghpvZUS2zg0LI9Q0p8PO5SE5KuvhCRYA3ELpWr2E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511401;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=78MQmEMHcDlUhrnjepUGI/yMTpgWbjLhIbe7NZCua4Q=;
	b=Mdj7FEbDg1uowuYw6nBXioCUOqqeig6RMqV+RRYU5liIHQVVSsWaGl01bs+aW1d0
	jDGqoVBh9hTqwqTf6wirTsh3cf0q/n5urfac5qLwQv98sZ+iOstYaqy3j4k4j1gdNYj
	I9BWqMj610sz1RgxqZ6X2H2BEXSX/BpeEuMZMjYs=
Content-Type: multipart/mixed; boundary="===============8548592532918374844=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-yamllint: upgrading to 1.37.0 SUCCEEDED
Message-ID: <01010195f160b25e-6582797e-f9a1-4e93-82a3-0553af385526-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214076

--===============8548592532918374844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-yamllint* to *1.37.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-yamllint-upgrade-1.36.0-1.37.0.patch
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
From e5a05f8eb18b2685a85f7adcbfb49451196efa00 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:43:20 +0000
Subject: [PATCH] python3-yamllint: upgrade 1.36.0 -> 1.37.0

---
 .../{python3-yamllint_1.36.0.bb => python3-yamllint_1.37.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.36.0.bb => python3-yamllint_1.37.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
index f6c1a1dd90..9ba0e8bc6e 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "3835a65994858679ea06fd998dd968c3f71935cd93742990405999d888e21130"
+SRC_URI[sha256sum] = "ead81921d4d87216b2528b7a055664708f9fb8267beb0c427cb706ac6ab93580"
 
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 
-- 
2.47.1


--===============8548592532918374844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: FILELIST: directory renamed /usr/lib/python3.13/site-packages/yamllint-1.36.0.dist-info -> /usr/lib/python3.13/site-packages/yamllint-1.37.0.dist-info, added "/usr/lib/python3.13/site-packages/yamllint/decoder.py /usr/lib/python3.13/site-packages/yamllint/__pycache__/decoder.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.13/site-packages/yamllint-1.36.0.dist-info moved to /usr/lib/python3.13/site-packages/yamllint-1.37.0.dist-info
  /usr/lib/python3.13/site-packages/yamllint/decoder.py was added
  /usr/lib/python3.13/site-packages/yamllint/__pycache__/decoder.cpython-313.pyc was added

--===============8548592532918374844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-yamllint-upgrade-1.36.0-1.37.0.patch"

RnJvbSBlNWEwNWY4ZWIxOGIyNjg1YTg1ZjdhZGNiZmI0OTQ1MTE5NmVmYTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOTo0MzoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMteWFtbGxpbnQ6IHVwZ3JhZGUgMS4zNi4wIC0+IDEuMzcuMAoKLS0tCiAuLi4ve3B5dGhv
bjMteWFtbGxpbnRfMS4zNi4wLmJiID0+IHB5dGhvbjMteWFtbGxpbnRfMS4zNy4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXlhbWxsaW50XzEuMzYuMC5i
YiA9PiBweXRob24zLXlhbWxsaW50XzEuMzcuMC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteWFtbGxpbnRfMS4zNi4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXlhbWxsaW50XzEuMzcuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMteWFtbGxpbnRfMS4zNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMteWFtbGxpbnRfMS4zNy4wLmJiCmluZGV4IGY2YzFhMWRkOTAuLjli
YTBlOGJjNmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My15YW1sbGludF8xLjM2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXlhbWxsaW50XzEuMzcuMC5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gInlhbWxsaW50Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzgzNWE2NTk5NDg1ODY3OWVhMDZmZDk5OGRkOTY4YzNm
NzE5MzVjZDkzNzQyOTkwNDA1OTk5ZDg4OGUyMTEzMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJl
YWQ4MTkyMWQ0ZDg3MjE2YjI1MjhiN2EwNTU2NjQ3MDhmOWZiODI2N2JlYjBjNDI3Y2I3MDZhYzZh
YjkzNTgwIgogCiBSREVQRU5EUzoke1BOfSArPSAicHl0aG9uMy1wYXRoc3BlYyBweXRob24zLXB5
eWFtbCIKIAotLSAKMi40Ny4xCgo=

--===============8548592532918374844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-yamllint: SRC_URI changed from "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.36.0.tar.gz;downloadfilename=yamllint-1.36.0.tar.gz" to "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.37.0.tar.gz;downloadfilename=yamllint-1.37.0.tar.gz"
packages/core2-64-poky-linux/python3-yamllint: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint: PV changed from "1.36.0" to "1.37.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dbg: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dbg: PV changed from "1.36.0" to "1.37.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dev: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dev: PV changed from "1.36.0" to "1.37.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-doc: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-doc: PV changed from "1.36.0" to "1.37.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-locale: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-locale: PV changed from "1.36.0" to "1.37.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-src: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-src: PV changed from "1.36.0" to "1.37.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-staticdev: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-staticdev: PV changed from "1.36.0" to "1.37.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: FILELIST: directory renamed /usr/lib/python3.13/site-packages/yamllint-1.36.0.dist-info -> /usr/lib/python3.13/site-packages/yamllint-1.37.0.dist-info, added "/usr/lib/python3.13/site-packages/yamllint/decoder.py /usr/lib/python3.13/site-packages/yamllint/__pycache__/decoder.cpython-313.pyc"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PKGV changed from 1.36.0 [default] to 1.37.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PKGSIZE changed from 344727 to 351695 (+2%)
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PV changed from "1.36.0" to "1.37.0"
Changes to packages/core2-64-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.13/site-packages/yamllint-1.36.0.dist-info moved to /usr/lib/python3.13/site-packages/yamllint-1.37.0.dist-info
  /usr/lib/python3.13/site-packages/yamllint/decoder.py was added
  /usr/lib/python3.13/site-packages/yamllint/__pycache__/decoder.cpython-313.pyc was added

--===============8548592532918374844==--

