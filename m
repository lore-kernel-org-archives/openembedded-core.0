Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E268BEEE270
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29682.1694804394236312760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IzJNwK/p;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VBRVss+9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a9a36be9b-ef7532f4-4310-4a35-988a-3334dbd92def-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ivgp0vX1lBIAJhAZQJs7+5HuhmhJmESTZjmqKZdihFY=;
	b=IzJNwK/psBNGClJCekiEcBzPQRh/oVDxsmRF90fsuf0RQUr2yb+RG75Kft6HnWyV
	nMA0u40ucADKI/QncmtqjGbPz7wQjvp4CrAQJeoz9QSkv2MIYUpX1fl9EuIlpfB9dwl
	q3g9otr+C9qQ/F/pXmZhyyX8lCqJIKCL0gaBp9VA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ivgp0vX1lBIAJhAZQJs7+5HuhmhJmESTZjmqKZdihFY=;
	b=VBRVss+9aV4Mza3akg5F87gcXv5hJmp3XkquvS9VnLuBI/4ezbEBXpbYZfP0LP51
	ghlou5IRmh2M4pIyue+wZRBAge89D3e/LmNnogWoYhXJtopzZmrQppofYzzXqDKFQkg
	4RnC9XmIGhTdbeSptDlFpdhK3jJsemmJvB0EfG1I=
Content-Type: multipart/mixed; boundary="===============6302499394605310530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 7.2.6 SUCCEEDED
Message-ID: <0101018a9a36be9b-ef7532f4-4310-4a35-988a-3334dbd92def-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187714

--===============6302499394605310530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *7.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-7.2.5-7.2.6.patch
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
From 3ef1b9ae2b459ddce3abad4296fa9bd595421dd6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 10:50:39 +0000
Subject: [PATCH] python3-sphinx: upgrade 7.2.5 -> 7.2.6

---
 .../python/{python3-sphinx_7.2.5.bb => python3-sphinx_7.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.2.5.bb => python3-sphinx_7.2.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb b/meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
index f55cc5a3ec..f4ed0720ff 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.2.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 
-SRC_URI[sha256sum] = "1a9290001b75c497fd087e92b0334f1bbfa1a1ae7fddc084990c4b7bd1130b88"
+SRC_URI[sha256sum] = "9a5160e1ea90688d5963ba09a2dcd8bdd526620edbb65c328728f1b2228d5ab5"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.39.2


--===============6302499394605310530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-7.2.5.tar.gz;downloadfilename=sphinx-7.2.5.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-7.2.6.tar.gz;downloadfilename=sphinx-7.2.6.tar.gz"
packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx: PV changed from "7.2.5" to "7.2.6"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "7.2.5" to "7.2.6"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "7.2.5" to "7.2.6"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "7.2.5" to "7.2.6"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "7.2.5" to "7.2.6"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "7.2.5" to "7.2.6"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "7.2.5" to "7.2.6"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 7.2.5 [default] to 7.2.6 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 15669062 to 15671664 (+0%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "7.2.5" to "7.2.6"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-7.2.5.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.2.6.dist-info

--===============6302499394605310530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-7.2.5-7.2.6.patch"

RnJvbSAzZWYxYjlhZTJiNDU5ZGRjZTNhYmFkNDI5NmZhOWJkNTk1NDIxZGQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTA6NTA6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA3LjIuNSAtPiA3LjIuNgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNwaGlueF83LjIuNS5iYiA9PiBweXRob24zLXNwaGlueF83LjIuNi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF83LjIuNS5iYiA9PiBw
eXRob24zLXNwaGlueF83LjIuNi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMi41LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjIuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
XzcuMi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54XzcuMi42LmJiCmluZGV4IGY1NWNjNWEzZWMuLmY0ZWQwNzIwZmYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNy4yLjUuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjIuNi5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0y
LUNsYXVzZSAmIE1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTVl
YjZhYzFiMTE1YTFlZDI0YTEyZDlmMTViNjMzOTkzIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MWE5MjkwMDAxYjc1YzQ5N2ZkMDg3ZTkyYjAzMzRmMWJiZmExYTFhZTdmZGRjMDg0OTkwYzRiN2Jk
MTEzMGI4OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5YTUxNjBlMWVhOTA2ODhkNTk2M2JhMDlh
MmRjZDhiZGQ1MjY2MjBlZGJiNjVjMzI4NzI4ZjFiMjIyOGQ1YWI1IgogCiBpbmhlcml0IHB5dGhv
bl9mbGl0X2NvcmUgcHlwaQogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiL1NwaGlueC8oP1A8cHZl
cj4oXGQrW1wuXC1fXSopKykvIgotLSAKMi4zOS4yCgo=

--===============6302499394605310530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-7.2.5.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.2.6.dist-info

--===============6302499394605310530==--

