Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29181C52D7B
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.75496.1722536827840124860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Da3dLITP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JxHTbwDe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f3218dd-4826adfc-65b2-40a1-b9ec-646560fba17f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=efAB0h/PQ3SO7lCdZC6+Xw+ld+c0znrkjimmzHgef6I=;
	b=Da3dLITP9SQUqiX2W249s9qvFkRuFNhH5yJig1TUB4f0D1nR3eDcNDrtB9Swak90
	SUShjnG25FTtoUooqmFMEIeay1anpQOKNVGu3mEKZv7zqzUq1fV+NLXrnvoiTHuxCLD
	SHgXRs83etc9qxJcowXiE00SZLEvUTcKve71RU5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=efAB0h/PQ3SO7lCdZC6+Xw+ld+c0znrkjimmzHgef6I=;
	b=JxHTbwDemvluXAHO/8iWViZu4cMf2G4qRkBUh3NPxNpftHgWC7lRDfWU91G/ZhNB
	B7+vTOEWR2guazEyHgUHbZrPMhF/zeCBEF0PJZfsTsIgriqAj8xA9yHxbCegGfaOOWl
	nBvNQYLezNN+Gg0tCBe3Q7YO3gCwcyoHb+pKM8SM=
Content-Type: multipart/mixed; boundary="===============2884577268670495192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2024.5 SUCCEEDED
Message-ID: <010101910f3218dd-4826adfc-65b2-40a1-b9ec-646560fba17f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202809

--===============2884577268670495192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2024.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2024.4-2024.5.patch
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
From 593259a7e504fef9c91dc4dcae4de5e4d3a60ba9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:32:28 +0000
Subject: [PATCH] python3-dtschema: upgrade 2024.4 -> 2024.5

---
 .../{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.4.bb => python3-dtschema_2024.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.5.bb
index 9583cd57b9..1eb24eca23 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "18dd1d34b4a5e451291e5444e9ceb4a6febc605871cdaef22673b6f80aa4a131"
+SRC_URI[sha256sum] = "ea259a9ba4d1e1eff44ac8d362950361e46750bdeaf30a437a7ed33159c35fd8"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.44.0


--===============2884577268670495192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.4.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info

--===============2884577268670495192==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2024.4-2024.5.patch"

RnJvbSA1OTMyNTlhN2U1MDRmZWY5YzkxZGM0ZGNhZTRkZTVlNGQzYTYwYmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDozMjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyNC40IC0+IDIwMjQuNQoKLS0tCiAuLi4ve3B5dGhv
bjMtZHRzY2hlbWFfMjAyNC40LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNC41LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjQuNC5i
YiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC40LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZHRzY2hlbWFfMjAyNC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC41LmJiCmluZGV4IDk1ODNjZDU3YjkuLjFl
YjI0ZWNhMjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kdHNjaGVtYV8yMDI0LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMThkZDFkMzRiNGE1ZTQ1MTI5MWU1NDQ0ZTljZWI0YTZm
ZWJjNjA1ODcxY2RhZWYyMjY3M2I2ZjgwYWE0YTEzMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJl
YTI1OWE5YmE0ZDFlMWVmZjQ0YWM4ZDM2Mjk1MDM2MWU0Njc1MGJkZWFmMzBhNDM3YTdlZDMzMTU5
YzM1ZmQ4IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJE
RVBFTkRTOiR7UE59ICs9ICJcCi0tIAoyLjQ0LjAKCg==

--===============2884577268670495192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.4.tar.gz;downloadfilename=dtschema-2024.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.5.tar.gz;downloadfilename=dtschema-2024.5.tar.gz"
packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2024.4 [default] to 2024.5 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2024.4" to "2024.5"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 359118 to 362570 (+1%)
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.4.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info

--===============2884577268670495192==--

