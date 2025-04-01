Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82570C369A9
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18076.1743511397481772925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eHjZhOwk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bDisC41X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010195f160a151-523f5d90-7382-49cb-a8dd-96e1b0d01e28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wuy2djlIOXtymNpXCKRWCPmIllLO5L/TIXNjq46LypQ=;
	b=eHjZhOwk/UE3IBssT1cfABNrI2IxcdEpKTsUesoRvR9Sa0mahaZJQdnvPKRwlHGP
	eefG4tHsjJe9+lhiQZSN2Ng8F+esct9yv5hC3pIa9jzBrxQUtQ2xHNk8J10o+5/Xd6O
	2LyPgLciX9SVApZ2l53As1ODIji9Cvx/vFbc4jCo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wuy2djlIOXtymNpXCKRWCPmIllLO5L/TIXNjq46LypQ=;
	b=bDisC41XVfn+06fp1vTs/thNODdbTflDl7xlpsuyEVZZ9ahVtAAnuVciYQ+/zSaV
	Ayi5iUkU1gBPhm78XDBxoscSCjgehyhjtyUiIe436+4gJtJAOgc/TxTQhUY64fj3Ni5
	MM8BBvXSmbucTvj60uJl1eMWERqB+Ia1b0eOWP48=
Content-Type: multipart/mixed; boundary="===============7741222204714628881=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.1.2 SUCCEEDED
Message-ID: <01010195f160a151-523f5d90-7382-49cb-a8dd-96e1b0d01e28-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214063

--===============7741222204714628881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.1.1-2.1.2.patch
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
From afdaa80974169d53033669ed9011a6adc715bf69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:06:29 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.1.1 -> 2.1.2

---
 ...ython3-poetry-core_2.1.1.bb => python3-poetry-core_2.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.1.1.bb => python3-poetry-core_2.1.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
index 1dd4337ae2..728b09cd7e 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "c1a1f6f00e4254742f40988a8caf665549101cf9991122cd5de1198897768b1a"
+SRC_URI[sha256sum] = "f9dbbbd0ebf9755476a1d57f04b30e9aecf71ca9dc2fcd4b17aba92c0002aa04"
 
 inherit python_poetry_core pypi
 
-- 
2.47.1


--===============7741222204714628881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.1.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.1.2.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.1.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.1.2.dist-info

--===============7741222204714628881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-poetry-core: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.1.1.tar.gz;downloadfilename=poetry_core-2.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.1.2.tar.gz;downloadfilename=poetry_core-2.1.2.tar.gz"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.1.1" to "2.1.2"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2479103 to 2491269 (+0%)
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.1.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.1.2.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.1.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.1.2.dist-info

--===============7741222204714628881==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.1.1-2.1.2.patch"

RnJvbSBhZmRhYTgwOTc0MTY5ZDUzMDMzNjY5ZWQ5MDExYTZhZGM3MTViZjY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOTowNjoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9ldHJ5LWNvcmU6IHVwZ3JhZGUgMi4xLjEgLT4gMi4xLjIKCi0tLQogLi4ueXRob24z
LXBvZXRyeS1jb3JlXzIuMS4xLmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNvcmVfMi4xLjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wb2V0cnktY29yZV8yLjEu
MS5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuMS4yLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjEuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjEu
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjEuMi5iYgppbmRleCAx
ZGQ0MzM3YWUyLi43MjhiMDljZDdlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMS4yLmJiCkBAIC0xNSw3ICsxNSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiXAogICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3Zl
bmRvci90b21saS9MSUNFTlNFO21kNT1hYWFhZjA4NzlkMTdkZjAxMTBkMWFhOGM4YzlmNDZmNSBc
CiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjMWExZjZmMDBlNDI1NDc0MmY0MDk4OGE4Y2Fm
NjY1NTQ5MTAxY2Y5OTkxMTIyY2Q1ZGUxMTk4ODk3NzY4YjFhIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImY5ZGJiYmQwZWJmOTc1NTQ3NmExZDU3ZjA0YjMwZTlhZWNmNzFjYTlkYzJmY2Q0YjE3YWJh
OTJjMDAwMmFhMDQiCiAKIGluaGVyaXQgcHl0aG9uX3BvZXRyeV9jb3JlIHB5cGkKIAotLSAKMi40
Ny4xCgo=

--===============7741222204714628881==--

