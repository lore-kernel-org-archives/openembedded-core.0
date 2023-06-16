Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFECC27C53
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.825.1686887483284132094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fnw4bZdc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c2544458-40759436-fb19-4e2d-bf2d-3c58e8517a4c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LAMdTlQpKuEvaweatnCJuQiNGetQ5Yk1TiHnEba3RL8=;
	b=fnw4bZdcrG7HzIBMnFnzTtZMAQJjoeDFBVlmduHE38rZN/UmItf6E9czR3n3ebwO
	AuxtxGtMoVHPJidSjw4grpxAN7GtOJsH4/cxGpC1AAiSCNznZ7jUXwM06Bu/eV0L0N9
	JdstxFsDdFFLWDLbgbq90mvfAhvdD4VvWuOX4WM0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LAMdTlQpKuEvaweatnCJuQiNGetQ5Yk1TiHnEba3RL8=;
	b=WAkFMhsHN2vGWu84dygAwUulBRjmZuyxev6i3S/oX6CVD2M/wHt5OiOe1UMzqckC
	TeeZLpS04E2s79cPM506LVL/zDlxf2n4A87bXe9MubTSAnX8JkimMJEaU49xaGQFjZ/
	JtuebVCDSW386VrRdMRZ952XhhbtdMPsMWunwMD4=
Content-Type: multipart/mixed; boundary="===============5238805600182879250=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 3.9.0 SUCCEEDED
Message-ID: <01010188c2544458-40759436-fb19-4e2d-bf2d-3c58e8517a4c-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182919

--===============5238805600182879250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flit-core* to *3.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-flit-core-upgrade-3.8.0-3.9.0.patch
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
From b5fa0808fd5fa787fb14f5389a105b65f1634c51 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:06:36 +0000
Subject: [PATCH] python3-flit-core: upgrade 3.8.0 -> 3.9.0

---
 .../{python3-flit-core_3.8.0.bb => python3-flit-core_3.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.8.0.bb => python3-flit-core_3.9.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
index 2e5b1e8069..b0bef4b6b6 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "d0f2a8f4bd45dc794befbf5839ecc0fd3830d65a57bd52b5997542fac5d5e937"
+SRC_URI[sha256sum] = "d75edf5eb324da20d53570a6a6f87f51e606eee8384925cd66a90611140844c7"
 
 inherit pypi python_flit_core
 
-- 
2.39.2


--===============5238805600182879250==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.8.0-3.9.0.patch"

RnJvbSBiNWZhMDgwOGZkNWZhNzg3ZmIxNGY1Mzg5YTEwNWI2NWYxNjM0YzUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6MDY6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWZsaXQtY29yZTogdXBncmFkZSAzLjguMCAtPiAzLjkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtZmxpdC1jb3JlXzMuOC4wLmJiID0+IHB5dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWZsaXQtY29yZV8zLjguMC5i
YiA9PiBweXRob24zLWZsaXQtY29yZV8zLjkuMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuOC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZsaXQtY29yZV8zLjkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZmxpdC1jb3JlXzMuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJiCmluZGV4IDJlNWIxZTgwNjkuLmIw
YmVmNGI2YjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1mbGl0LWNvcmVfMy44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWZsaXQtY29yZV8zLjkuMC5iYgpAQCAtOCw3ICs4LDcgQEAgQlVHVFJBQ0tFUiA9ICJo
dHRwczovL2dpdGh1Yi5jb20vcHlwYS9mbGl0L2lzc3VlcyIKIExJQ0VOU0UgPSAiQlNELTMtQ2xh
dXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NDFlYjc4ZmE4YTg3
Mjk4M2E4ODJjNjk0YTgzMDVmMDgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMGYyYThmNGJk
NDVkYzc5NGJlZmJmNTgzOWVjYzBmZDM4MzBkNjVhNTdiZDUyYjU5OTc1NDJmYWM1ZDVlOTM3Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3NWVkZjVlYjMyNGRhMjBkNTM1NzBhNmE2Zjg3ZjUxZTYw
NmVlZTgzODQ5MjVjZDY2YTkwNjExMTQwODQ0YzciCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxp
dF9jb3JlCiAKLS0gCjIuMzkuMgoK

--===============5238805600182879250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-flit-core: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/f/flit/flit-3.8.0.tar.gz;downloadfilename=flit-3.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/f/flit/flit-3.9.0.tar.gz;downloadfilename=flit-3.9.0.tar.gz"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dbg: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dbg: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-doc: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-doc: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-locale: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-locale: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-src: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-src: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-staticdev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-staticdev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PKGSIZE changed from 87520 to 88427 (+1%)
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PKGSIZE changed from 239828 to 241833 (+1%)
Changes to packages/core2-32-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info

--===============5238805600182879250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info

--===============5238805600182879250==--

