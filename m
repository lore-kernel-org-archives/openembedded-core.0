Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA83D5CC89
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17384.1765872131258546268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Rg1TbZe/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e4MHF5vY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262e8bdb-6c76f95f-f9f0-4db0-b154-15009d8c90a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pB/OXf53LLhj8X9eCk3x88Hd2TBNE5ODJCuD6NWpD0c=;
	b=Rg1TbZe/O+/hOaVvQt0qlQslqBt13E1pC2UTlsHBrY8ylGGQQgoX+IyJzV/zbZVn
	N499GU0rYzDj+5YLqqjp5GzixHBXaB2VBeP/R01tpjLGnqvgij3bc6U9Whld2bC5on7
	NSAUbP4KRwvV5F4UlEfuH7u9MIioMCJ85sKkZvMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pB/OXf53LLhj8X9eCk3x88Hd2TBNE5ODJCuD6NWpD0c=;
	b=e4MHF5vYNuTC7qIYwYPukIY+zOerWT8EwzR4UgjdNOdlW0niwCkCJ6UcAIgmjMVn
	cQX0sVbovjCrzi0AFZnNA6mVR2uaslla/8NDoK0GZVQDD4UbO9gAz7cCUuGV6d2NR3M
	lvNPcufY7ixNrKvDXzewzOFttiZZckeEVgyEDRn4=
Content-Type: multipart/mixed; boundary="===============8773819127243230759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.2 SUCCEEDED
Message-ID: <0101019b262e8bdb-6c76f95f-f9f0-4db0-b154-15009d8c90a0-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227810

--===============8773819127243230759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.1-2.26.2.patch
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
From 232baebb6d829e2204d885dd7feacd07731bbbe0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:39:00 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.1 -> 2.26.2

---
 .../python/{python3-pdm_2.26.1.bb => python3-pdm_2.26.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.1.bb => python3-pdm_2.26.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.1.bb b/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.2.bb
index bd25f141f0..13dd1ec0db 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "60a568201424a7193b661f6fed6e446e39695b52edc5e0904ba0b07fcaf2e787"
+SRC_URI[sha256sum] = "98207f8aabd6913a25ee0b4985e79e1652e2db274915f3ccf9408e33191ede4e"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============8773819127243230759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info

--===============8773819127243230759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.1.tar.gz;downloadfilename=pdm-2.26.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.2.tar.gz;downloadfilename=pdm-2.26.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.1" to "2.26.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.1 [default] to 2.26.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2248256 to 2252358 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.2.dist-info

--===============8773819127243230759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.1-2.26.2.patch"

RnJvbSAyMzJiYWViYjZkODI5ZTIyMDRkODg1ZGQ3ZmVhY2QwNzczMWJiYmUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6Mzk6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI2LjEgLT4gMi4yNi4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjYuMS5iYiA9PiBweXRob24zLXBkbV8yLjI2LjIuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjYuMS5iYiA9PiBweXRo
b24zLXBkbV8yLjI2LjIuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjIu
YmIKaW5kZXggYmQyNWYxNDFmMC4uMTNkZDFlYzBkYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjIuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYwYTU2ODIwMTQyNGE3MTkzYjY2MWY2ZmVkNmU0NDZl
Mzk2OTViNTJlZGM1ZTA5MDRiYTBiMDdmY2FmMmU3ODciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
OTgyMDdmOGFhYmQ2OTEzYTI1ZWUwYjQ5ODVlNzllMTY1MmUyZGIyNzQ5MTVmM2NjZjk0MDhlMzMx
OTFlZGU0ZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============8773819127243230759==--

