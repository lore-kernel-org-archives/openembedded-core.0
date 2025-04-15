Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076A1C369DA
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.20153.1744723974175266570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=b0B1fOOm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GdRjCjCT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019639a726d3-6bf1ee08-d6dc-4976-924f-37caa405c5ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tBUxB4/I5bAVH/S5aTaQWU46ZMUTLdiYmMopa5TZn1Y=;
	b=b0B1fOOmDVxAUVbFH+KBlcsO47d3FoKxr+Z6l41c4c5KXzH0rT+0Ku6P9QVLHzRu
	AsO0+PLjHr4tLOtksSdy2JQxEF1YSLwqL/3OiZ3KdWA5jNqZ7VSIgj3SaVs7utCfAal
	FTcQKsqSmagPhQSjzmlVKAPIpdLL0Jw5Ky5kbdXw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tBUxB4/I5bAVH/S5aTaQWU46ZMUTLdiYmMopa5TZn1Y=;
	b=GdRjCjCTzh7IOB9te5gdyGRC+9C8QxLwCZy9flayjyXuk/iMj8rI3hLZGKbtrsbZ
	0hFJ+nhtXnRwKibkaD9+rx9pZItp3tpLBvXKj1WNYfO9Zjuuh9ONDDf63bT4CSJltPJ
	uEWk2lDcFW0UjK/24Z7WR7izfWjJW8J3XQ9/ItdI=
Content-Type: multipart/mixed; boundary="===============7015165760471482463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.3.0 SUCCEEDED
Message-ID: <0101019639a726d3-6bf1ee08-d6dc-4976-924f-37caa405c5ea-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214883

--===============7015165760471482463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *8.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch
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
From 45e66b86ae01b91ef7c9b45dbbce488e00645295 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:44:50 +0000
Subject: [PATCH] python3-sphinx: upgrade 8.2.1 -> 8.3.0

---
 .../python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
index 614566b8f4..25bbc1bff8 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "3bad4314a7fa72ce92344eaaa14c42ddf3177ee6a79c227e4ff8ae07d416f584"
 
 inherit python_flit_core pypi
 
-- 
2.47.1


--===============7015165760471482463==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch"

RnJvbSA0NWU2NmI4NmFlMDFiOTFlZjdjOWI0NWRiYmNlNDg4ZTAwNjQ1Mjk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6NDQ6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA4LjIuMSAtPiA4LjMuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBweXRob24zLXNwaGlueF84LjMuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBw
eXRob24zLXNwaGlueF84LjMuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
XzguMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54XzguMy4wLmJiCmluZGV4IDYxNDU2NmI4ZjQuLjI1YmJjMWJmZjggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOC4yLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjMuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0y
LUNsYXVzZSAmIE1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21k
NT1lMzBjMzdhMmI3ZmIwYWZhM2FkYzBkNzJiODVlOGIwNCIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU0YjkzMjk1MWI5YzE4YjAzOWY3M2I3MmU0ZTYzYWZlOTY3ZDkwNDA4NzAwZWMyMjJiOTgx
YWMyNDY0N2MwMWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2JhZDQzMTRhN2ZhNzJjZTkyMzQ0
ZWFhYTE0YzQyZGRmMzE3N2VlNmE3OWMyMjdlNGZmOGFlMDdkNDE2ZjU4NCIKIAogaW5oZXJpdCBw
eXRob25fZmxpdF9jb3JlIHB5cGkKIAotLSAKMi40Ny4xCgo=

--===============7015165760471482463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.2.1.tar.gz;downloadfilename=sphinx-8.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.3.0.tar.gz;downloadfilename=sphinx-8.3.0.tar.gz"
packages/core2-64-poky-linux/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 16966169 to 16967764 (+0%)
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============7015165760471482463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============7015165760471482463==--

