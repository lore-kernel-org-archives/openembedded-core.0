Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C73C021BE
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42631.1738416051260706031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ED6NLFIt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=w0c/SzfM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abd159-5c23b574-461d-4651-b6bd-edc19e88e4a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9lVBAI6JsHYd4ZAh2WN90Y5BIPVFQYTIcM/eb8HhDUQ=;
	b=ED6NLFItCYWLyGo0EKl5AKjr4ZzBTKWVC+iOkT/BbshzMFkrrQsnXJixLRylivBx
	JpIYt/ozhsOfgkj7tgmS5GhIdRueCNohYZBovv4bfY/1kERvVZ/LLCJD3I+jirovgam
	03cEbJTOwNntskopG9lCjxHRSlV0jzkAdQLkoZ0g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9lVBAI6JsHYd4ZAh2WN90Y5BIPVFQYTIcM/eb8HhDUQ=;
	b=w0c/SzfMqWqXEatKXPf+N4Fj2XeXVptEBzB7kjpVnknoXGV9DstPQ9MDkNop3nj/
	x+dpKYfVwvhfb5663jSw+F+Ot6QT9zvPpGzyguqy6Cfv+3c9Ef+6RbXST/FXOaMspYV
	9TVH5Dv8D7jc/Zjk9d9vS05WbWR5d9d6b5RH8za0=
Content-Type: multipart/mixed; boundary="===============1461003059058882849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 25.1.0 SUCCEEDED
Message-ID: <01010194c1abd159-5c23b574-461d-4651-b6bd-edc19e88e4a1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210528

--===============1461003059058882849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-attrs* to *25.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-24.3.0-25.1.0.patch
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
From b6ce05a9c472c950c7dc4bf8c827ba505e13f327 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:02:12 +0000
Subject: [PATCH] python3-attrs: upgrade 24.3.0 -> 25.1.0

---
 .../python/{python3-attrs_24.3.0.bb => python3-attrs_25.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_24.3.0.bb => python3-attrs_25.1.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-attrs_24.3.0.bb b/meta/recipes-devtools/python/python3-attrs_25.1.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-attrs_24.3.0.bb
rename to meta/recipes-devtools/python/python3-attrs_25.1.0.bb
index edb99fafce..fac9b7a46e 100644
--- a/meta/recipes-devtools/python/python3-attrs_24.3.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff"
+SRC_URI[sha256sum] = "1c97078a80c814273a76b2a298a932eb681c87415c11dee0a6921de7f1b02c3e"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.44.1


--===============1461003059058882849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-attrs: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/attrs/attrs-24.3.0.tar.gz;downloadfilename=attrs-24.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/a/attrs/attrs-25.1.0.tar.gz;downloadfilename=attrs-25.1.0.tar.gz"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dbg: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dbg: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dev: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dev: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-doc: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-doc: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-locale: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-locale: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-ptest: PKGSIZE changed from 360342 to 360359 (+0%)
packages/core2-64-poky-linux/python3-attrs/python3-attrs-ptest: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-ptest: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-src: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-src: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-staticdev: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-staticdev: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs: PKGSIZE changed from 402134 to 401479 (-0%)
packages/core2-64-poky-linux/python3-attrs/python3-attrs: PV changed from "24.3.0" to "25.1.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs: PKGV changed from 24.3.0 [default] to 25.1.0 [default]
Changes to packages/core2-64-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.13/site-packages/attrs-24.3.0.dist-info moved to /usr/lib/python3.13/site-packages/attrs-25.1.0.dist-info

--===============1461003059058882849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.13/site-packages/attrs-24.3.0.dist-info moved to /usr/lib/python3.13/site-packages/attrs-25.1.0.dist-info

--===============1461003059058882849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-24.3.0-25.1.0.patch"

RnJvbSBiNmNlMDVhOWM0NzJjOTUwYzdkYzRiZjhjODI3YmE1MDVlMTNmMzI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODowMjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXR0cnM6IHVwZ3JhZGUgMjQuMy4wIC0+IDI1LjEuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWF0dHJzXzI0LjMuMC5iYiA9PiBweXRob24zLWF0dHJzXzI1LjEuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWF0dHJzXzI0LjMuMC5iYiA9PiBw
eXRob24zLWF0dHJzXzI1LjEuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjQuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI1LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNf
MjQuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXR0cnNfMjUuMS4wLmJiCmluZGV4IGVkYjk5ZmFmY2UuLmZhYzliN2E0NmUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNC4zLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI1LjEuMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hdHRycy5vcmcvIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTU1NzMx
ODI0Y2Y5MjA1Y2ZhYmVhYjlhMDYwMDg4NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmNWMw
NzMzM2Q1NDMxMDM1NDFiYTdiZTBlMmNlMTZlZWVlODEzMGNiMGIzZjkyMzhhYjkwNGNlMWU4NWJh
ZmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWM5NzA3OGE4MGM4MTQyNzNhNzZiMmEyOThhOTMy
ZWI2ODFjODc0MTVjMTFkZWUwYTY5MjFkZTdmMWIwMmMzZSIKIAogaW5oZXJpdCBweXBpIHB0ZXN0
LXB5dGhvbi1weXRlc3QgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ0LjEKCg==

--===============1461003059058882849==--

