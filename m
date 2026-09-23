Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCB8C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1211.1790144869671279272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GPTwTPuw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cPvXBrBo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0ccf2f26d-086b796c-c30a-4c09-a748-987e444d274a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=58trKYky3UtTv7OwKC0BAgFCNmGFKDhqArH0OGcW5Fg=;
	b=GPTwTPuwItOBeDidU3fbrVFbs6WuoAD6sD0n1JITPm0S9dPjmNsFT8mau4D2uJEu
	DYWe3RL6blrkp642nE8Hu4n65rBxu5nc7NPGXchoD10TZQHQmpv+gLc0mN5azqcVKXX
	c/mMUV7K8LB4Jq8GIfLglzkk0NU/ohxYktTMJBgw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=58trKYky3UtTv7OwKC0BAgFCNmGFKDhqArH0OGcW5Fg=;
	b=cPvXBrBo3zBTrnPkFoLQFZkFcCPTWPrgbKL4Yy6eonCxCVak4dbxqv5qgx3JD22T
	gKC5RSVWdCOJvoipwp0gBeQX6Iw+wf3yYKg4XueDyPPIuOMepS/F4s2wBn6QmRKEY4K
	XiBW4OEe50Y5o8bgjekyGgqea64A4Gq07lFJeKG8=
Content-Type: multipart/mixed; boundary="===============7869459541068827884=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.4.10 SUCCEEDED
Message-ID: <010101a0ccf2f26d-086b796c-c30a-4c09-a748-987e444d274a-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246444

--===============7869459541068827884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.4.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.9-2.4.10.patch
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
From bb447834913e67cc5c52666a57d9a6e5eaa428ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 06:13:36 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.9 -> 2.4.10

---
 ...thon3-pdm-backend_2.4.9.bb => python3-pdm-backend_2.4.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.9.bb => python3-pdm-backend_2.4.10.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
index cdeadbaf1c..1458f514b4 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "c41a852ccbf4b567b033db9b2ae78660d7a4ea49307719959ab88a01f0aabb2e"
+SRC_URI[sha256sum] = "551b049379d4f270cba18f5bf73031cc229a4f883e085265465d326d4a636861"
 
 inherit pypi python_pep517
 
-- 
2.47.1


--===============7869459541068827884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.9.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.10.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-backend: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.9" to "2.4.10"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 839551 to 843165 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/WHEEL was removed

--===============7869459541068827884==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.9-2.4.10.patch"

RnJvbSBiYjQ0NzgzNDkxM2U2N2NjNWM1MjY2NmE1N2Q5YTZlNWVhYTQyOGFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDY6MTM6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1iYWNrZW5kOiB1cGdyYWRlIDIuNC45IC0+IDIuNC4xMAoKLS0tCiAuLi50aG9u
My1wZG0tYmFja2VuZF8yLjQuOS5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNC4xMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBkbS1iYWNrZW5kXzIu
NC45LmJiID0+IHB5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjEwLmJifSAoNzklKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQu
OS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8y
LjQuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC45LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjEwLmJiCmlu
ZGV4IGNkZWFkYmFmMWMuLjE0NThmNTE0YjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuOS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjEwLmJiCkBAIC00LDcg
KzQsNyBAQCBMSUNFTlNFID0gIk1JVCIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NGE1NjQyOTdiM2M1YjYyOWE1MjhiOTJm
ZDhmZjYxZWEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNDFhODUyY2NiZjRiNTY3YjAzM2Ri
OWIyYWU3ODY2MGQ3YTRlYTQ5MzA3NzE5OTU5YWI4OGEwMWYwYWFiYjJlIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjU1MWIwNDkzNzlkNGYyNzBjYmExOGY1YmY3MzAzMWNjMjI5YTRmODgzZTA4NTI2
NTQ2NWQzMjZkNGE2MzY4NjEiCiAKIGluaGVyaXQgcHlwaSBweXRob25fcGVwNTE3CiAKLS0gCjIu
NDcuMQoK

--===============7869459541068827884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/WHEEL was removed

--===============7869459541068827884==--

