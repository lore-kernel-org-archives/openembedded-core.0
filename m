Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A89CC369A8
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.18068.1743511391433248578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Tk9hSNh4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BOAa9DH2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195f160a397-b985e072-fa81-487d-a44c-ab36e2d4a153-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=38xC5tHUY795Lx4b6Pw5gKLawCRgp9ZBLbCx7nxu9OA=;
	b=Tk9hSNh43iGKPb4tvdMgsFlA1mKLCK6/0PFJ5Z4PRPQkzm/kmnHajPCRWeJ1sp92
	WKw0gWiVZkPHwrwFCQgPDOXx6uS8FQ7OHBhLa19fe+WULobDVl5rD3bARrTac29qnY3
	jv9Cn3L5QEsDMa1nXsT5SorIEYKFWFj8KQsLCroE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=38xC5tHUY795Lx4b6Pw5gKLawCRgp9ZBLbCx7nxu9OA=;
	b=BOAa9DH2u1A2jcf1MC/Fuw15fgbSAR1tQVxfEfB9dFiXJSJ69ZbCPwh+D0fS4S2F
	gvehlZl0IBVTx9zLhQ9jUh+s5FbyWGAM6o1p/SNIl8NKkWkzTKzt1fUmYirTLTAo9Jz
	hnfh1s+HImLr2srbW4482u1UnpvK5UbedI/jZLv4=
Content-Type: multipart/mixed; boundary="===============1525917419699455918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2025.2 SUCCEEDED
Message-ID: <01010195f160a397-b985e072-fa81-487d-a44c-ab36e2d4a153-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214065

--===============1525917419699455918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytz* to *2025.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2025.1-2025.2.patch
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
From 8d59b19ea5f36326bd26bc9f919c63008f317411 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:13:51 +0000
Subject: [PATCH] python3-pytz: upgrade 2025.1 -> 2025.2

---
 .../python/{python3-pytz_2025.1.bb => python3-pytz_2025.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2025.1.bb => python3-pytz_2025.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2025.1.bb b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2025.1.bb
rename to meta/recipes-devtools/python/python3-pytz_2025.2.bb
index 6d1861fbd5..86bfceadc8 100644
--- a/meta/recipes-devtools/python/python3-pytz_2025.1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "c2db42be2a2518b28e65f9207c4d05e6ff547d1efa4086469ef855e4ab70178e"
+SRC_URI[sha256sum] = "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.1


--===============1525917419699455918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pytz-2025.1.dist-info -> /usr/lib/python3.13/site-packages/pytz-2025.2.dist-info, added "/usr/lib/python3.13/site-packages/pytz/zoneinfo/America/Coyhaique"
Changes to packages/core2-64-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.13/site-packages/pytz-2025.1.dist-info moved to /usr/lib/python3.13/site-packages/pytz-2025.2.dist-info
  /usr/lib/python3.13/site-packages/pytz/zoneinfo/America/Coyhaique was added

--===============1525917419699455918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2025.1-2025.2.patch"

RnJvbSA4ZDU5YjE5ZWE1ZjM2MzI2YmQyNmJjOWY5MTljNjMwMDhmMzE3NDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOToxMzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ejogdXBncmFkZSAyMDI1LjEgLT4gMjAyNS4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0el8yMDI1LjEuYmIgPT4gcHl0aG9uMy1weXR6XzIwMjUuMi5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDI1LjEuYmIgPT4gcHl0
aG9uMy1weXR6XzIwMjUuMi5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI1LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI1LjIuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNS4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8y
MDI1LjIuYmIKaW5kZXggNmQxODYxZmJkNS4uODZiZmNlYWRjOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNS4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjUuMi5iYgpAQCAtNyw3ICs3
LDcgQEAgaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAogUFRF
U1RfUFlURVNUX0RJUiA9ICJweXR6L3Rlc3RzIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzJk
YjQyYmUyYTI1MThiMjhlNjVmOTIwN2M0ZDA1ZTZmZjU0N2QxZWZhNDA4NjQ2OWVmODU1ZTRhYjcw
MTc4ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNjBiOWUzZGJiNDlhMjA5YzIxYWQ2MTgwOWM3
ZmI0NTM2NDNlMDQ4YjM4OTI0Yzc2NTgxMzU0Njc0NmU4MWMzIgogCiBSREVQRU5EUzoke1BOfTpj
bGFzcy10YXJnZXQgKz0gIlwKICAgICBweXRob24zLWRhdGV0aW1lIFwKLS0gCjIuNDcuMQoK

--===============1525917419699455918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2025.1.tar.gz;downloadfilename=pytz-2025.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2025.2.tar.gz;downloadfilename=pytz-2025.2.tar.gz"
packages/core2-64-poky-linux/python3-pytz: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pytz-2025.1.dist-info -> /usr/lib/python3.13/site-packages/pytz-2025.2.dist-info, added "/usr/lib/python3.13/site-packages/pytz/zoneinfo/America/Coyhaique"
packages/core2-64-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1024477 to 1027070 (+0%)
Changes to packages/core2-64-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.13/site-packages/pytz-2025.1.dist-info moved to /usr/lib/python3.13/site-packages/pytz-2025.2.dist-info
  /usr/lib/python3.13/site-packages/pytz/zoneinfo/America/Coyhaique was added

--===============1525917419699455918==--

