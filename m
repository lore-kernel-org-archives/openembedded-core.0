Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99A4CD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 05:12:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14376.1782191526166090089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 22:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mHwVgfwX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vEGPjfWN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ef2e48b86-75dcf01c-9d5e-451c-a4ac-13e3347e7f6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782191525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=he3y02uryfjGveZe6ea65aESNcRMF+a8WBO6avS1iC0=;
	b=mHwVgfwX41X9aAxjGObuaUFGiCA7gE0RgWK5A7hh+y6BG8ZjvcQMM078LlPdJgAg
	rf4D2QkbgFAXedXv8XVDiyXhO/XO9fCyp2kfDuqTESj7Drwu8SGu4rxBJK9OZ5gCxzK
	wEQGX5nfUGkkfBs5P0vguf7HohXwLWUKnejkvFiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782191525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=he3y02uryfjGveZe6ea65aESNcRMF+a8WBO6avS1iC0=;
	b=vEGPjfWNNPjQA0Vcq9IzGm/QZ1wvWbHZ/v1Sidq+EiZoRcyw7SMqJUNvbPwZpESm
	wUz+HLAKUSq2xu6QDobCUOwhJnou7ZHMrbNRcU45UCtL/ZafDaZLB8N3eiQ7e8TEJzq
	DUsYNhctMEIOzCzyVvlPbUKepxzpo+kFGiVV0Cdg=
Content-Type: multipart/mixed; boundary="===============3462583541538573091=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.28.0 SUCCEEDED
Message-ID: <0101019ef2e48b86-75dcf01c-9d5e-451c-a4ac-13e3347e7f6c-000000@us-west-2.amazonses.com>
Date: Tue, 23 Jun 2026 05:12:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.23-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 05:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239331

--===============3462583541538573091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.28.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.27.0-2.28.0.patch
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
From 6120ece3e61af55f006b67b9fabf096e20ed27dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 23 Jun 2026 05:07:03 +0000
Subject: [PATCH] python3-pdm: upgrade 2.27.0 -> 2.28.0

---
 .../python/{python3-pdm_2.27.0.bb => python3-pdm_2.28.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.27.0.bb => python3-pdm_2.28.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.27.0.bb b/meta/recipes-devtools/python/python3-pdm_2.28.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.27.0.bb
rename to meta/recipes-devtools/python/python3-pdm_2.28.0.bb
index f378e1edda..23d2f9e521 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.28.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "dbfbc484065d0150fa5b29484ead908354313d8699cf74c099d4531826bd04de"
+SRC_URI[sha256sum] = "ca7d21548955086985070d2fe4334a55e59093a466b25eebc6bb0769a0539e89"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============3462583541538573091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.27.0.tar.gz;downloadfilename=pdm-2.27.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.28.0.tar.gz;downloadfilename=pdm-2.28.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.27.0" to "2.28.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.27.0" to "2.28.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.27.0" to "2.28.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.27.0" to "2.28.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.27.0" to "2.28.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.27.0" to "2.28.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.27.0" to "2.28.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.27.0 [default] to 2.28.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2516493 to 2551788 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.27.0" to "2.28.0"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info

--===============3462583541538573091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.27.0.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info

--===============3462583541538573091==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.27.0-2.28.0.patch"

RnJvbSA2MTIwZWNlM2U2MWFmNTVmMDA2YjY3YjlmYWJmMDk2ZTIwZWQyN2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjMgSnVuIDIwMjYgMDU6MDc6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI3LjAgLT4gMi4yOC4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjcuMC5iYiA9PiBweXRob24zLXBkbV8yLjI4LjAuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjcuMC5iYiA9PiBweXRo
b24zLXBkbV8yLjI4LjAuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI3LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjcuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI4LjAu
YmIKaW5kZXggZjM3OGUxZWRkYS4uMjNkMmY5ZTUyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI4LjAuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRiZmJjNDg0MDY1ZDAxNTBmYTViMjk0ODRlYWQ5MDgz
NTQzMTNkODY5OWNmNzRjMDk5ZDQ1MzE4MjZiZDA0ZGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
Y2E3ZDIxNTQ4OTU1MDg2OTg1MDcwZDJmZTQzMzRhNTVlNTkwOTNhNDY2YjI1ZWViYzZiYjA3Njlh
MDUzOWU4OSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============3462583541538573091==--

