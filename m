Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4531FCCF9E5
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.17946.1759325538806715840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NLPiNjDV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NTJkHSYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101999ff95f09-d3a43ecd-5b30-47ad-8ae0-17aad57b1d3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IxXSdy2gyB9u1+N+dFg3O6TdXK0FAzn6t1Jq1UxhcjA=;
	b=NLPiNjDVZC2h6i0df8EYgKniiPb93Gl7qcxPxXpSpoCGo4LiusGhhAi778RhxDSr
	bgwgvJluGCJqRHbZcmtQZn1UUHxBuL725E3b09nGX3K942/nBWIvJObi4z6a6VqlRtT
	VpLZlWnvk2FcssdusK+hpDWIVZxiTf1uhKWhK+5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IxXSdy2gyB9u1+N+dFg3O6TdXK0FAzn6t1Jq1UxhcjA=;
	b=NTJkHSYD8ka5YOuUi4fCxmAGk9IpdxVbp4zHnP/bqOt7wdUIm0pclZeUqcdKYmPR
	12xaUb44HPIN96XT30PCfYT+SgC20j9tZFKkLOjCKkohtClu5DaEw1whWgeTZH+urko
	MDsmwW+rTEPw5e8F0hv1Ia6k5nfdLAQ9Uda6BacU=
Content-Type: multipart/mixed; boundary="===============8211701368005067246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.2.14 SUCCEEDED
Message-ID: <010101999ff95f09-d3a43ecd-5b30-47ad-8ae0-17aad57b1d3e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224253

--===============8211701368005067246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.2.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.13-0.2.14.patch
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
From 79c890faf61ea5fd371bf46a0c029e79d2b42577 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:37:21 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.2.13 -> 0.2.14

---
 .../{python3-wcwidth_0.2.13.bb => python3-wcwidth_0.2.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.13.bb => python3-wcwidth_0.2.14.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
index 71bb1a2703..da2dc60263 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.14.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
+SRC_URI[sha256sum] = "4d478375d31bc5395a3c55c40ccdf3354688364cd61c4f6adacaa9215d0b3605"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.1


--===============8211701368005067246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.13.tar.gz;downloadfilename=wcwidth-0.2.13.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.14.tar.gz;downloadfilename=wcwidth-0.2.14.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 317339 to 317322 (-0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.2.13 [default] to 0.2.14 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.2.13" to "0.2.14"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 546870 to 616750 (+13%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info moved to /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info

--===============8211701368005067246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.13-0.2.14.patch"

RnJvbSA3OWM4OTBmYWY2MWVhNWZkMzcxYmY0NmEwYzAyOWU3OWQyYjQyNTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOTozNzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2N3aWR0aDogdXBncmFkZSAwLjIuMTMgLT4gMC4yLjE0CgotLS0KIC4uLi97cHl0aG9u
My13Y3dpZHRoXzAuMi4xMy5iYiA9PiBweXRob24zLXdjd2lkdGhfMC4yLjE0LmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2N3aWR0aF8wLjIuMTMuYmIg
PT4gcHl0aG9uMy13Y3dpZHRoXzAuMi4xNC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIuMTMuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIuMTQuYmIKc2ltaWxhcml0
eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXdjd2lkdGhfMC4yLjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIuMTQuYmIKaW5kZXggNzFiYjFhMjcwMy4uZGEyZGM2MDI2
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lk
dGhfMC4yLjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuMi4xNC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL2pxdWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcyZWEwYzA2Mzk5ZWIyODZkOTc4ZmRlZGI2OTIzYTll
YjQ3ZTFjNDg2Y2U2M2U5YjRlNjRmYzE4MzAzOTcyYjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NGQ0NzgzNzVkMzFiYzUzOTVhM2M1NWM0MGNjZGYzMzU0Njg4MzY0Y2Q2MWM0ZjZhZGFjYWE5MjE1
ZDBiMzYwNSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHB0ZXN0LXB5dGhvbi1weXRlc3QK
IAotLSAKMi40Ny4xCgo=

--===============8211701368005067246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 546870 to 616750 (+13%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.13/site-packages/wcwidth-0.2.13.dist-info moved to /usr/lib/python3.13/site-packages/wcwidth-0.2.14.dist-info

--===============8211701368005067246==--

