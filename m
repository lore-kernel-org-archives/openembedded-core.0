Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDECCC369D8
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.20162.1744723971053462475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RcyaAZBj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HYyEGCGP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019639a72b7d-51bba6e7-dacc-4265-885b-91d89fa46e21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EfGEAKQt3DA4B5G0JAIMQ6DsD0SflLhEWnNesVaqlqw=;
	b=RcyaAZBjTIeghoPGULOFCY6ioCyjtWSFEJX2Hyiv8FUMgQueZBGHmCYJf2h9N/nn
	IRL7tF4OYWObiPLRsnx6LvIbUn5AQwVWegOBsrKKC9fQ4PwD6jakQAp/2GTDgWG/5Fb
	PRNfwRNp9Q+3xnM00nwz5V5r8g7ap3FRibUHPOUU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EfGEAKQt3DA4B5G0JAIMQ6DsD0SflLhEWnNesVaqlqw=;
	b=HYyEGCGPvk3nB2CUFn5yPoss8nbjFnP+ye4LppJL+URvSkr7URM2ZmySTDQEqFG9
	r9XYgDfj+e8i4x0b0mU5iSwIUP4b26F1viDcqEduL3znE2/IB5tFKmHidKetBih9Dt5
	AQUQHsPyjoZUoMl4WXChnhz9ZEQVBqgu5b5xIgfg=
Content-Type: multipart/mixed; boundary="===============3971134074013053736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.4.0 SUCCEEDED
Message-ID: <0101019639a72b7d-51bba6e7-dacc-4265-885b-91d89fa46e21-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214886

--===============3971134074013053736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.3.0-2.4.0.patch
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
From a4ea8854eebd9b9a6a01084efafbe0768ff72429 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:52:25 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.3.0 -> 2.4.0

---
 .../{python3-urllib3_2.3.0.bb => python3-urllib3_2.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.3.0.bb => python3-urllib3_2.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
index fe913e6b73..7a4bffc05e 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
+SRC_URI[sha256sum] = "414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============3971134074013053736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.3.0-2.4.0.patch"

RnJvbSBhNGVhODg1NGVlYmQ5YjlhNmEwMTA4NGVmYWZiZTA3NjhmZjcyNDI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6NTI6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi4zLjAgLT4gMi40LjAKCi0tLQogLi4uL3tweXRob24z
LXVybGxpYjNfMi4zLjAuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuNC4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuMy4wLmJiID0+
IHB5dGhvbjMtdXJsbGliM18yLjQuMC5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjMuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNC4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzIuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJsbGliM18yLjQuMC5iYgppbmRleCBmZTkxM2U2YjczLi43YTRiZmZjMDVlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjMu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjQuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3Vy
bGxpYjMvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PTUyZDI3M2EzMDU0Y2VkNTYxMjc1ZDRkMTUyNjBlY2RhIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjhjNTQ0OWIzY2YwODYxNjc5Y2U3ZTA1MDNjN2I0NGI1ZWM5
ODFiZWMwZDFkMzc5NWEwN2YxYmE5NmYwMjA0ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTRi
YzY1MzViNzg3ZmViZDc1Njc4MDRjYzAxNWZlZTM5ZGFhYjhhZDg2MjY4ZjEzMTBhOTI1MDY5N2Rl
NDY2IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============3971134074013053736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.3.0.tar.gz;downloadfilename=urllib3-2.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.4.0.tar.gz;downloadfilename=urllib3-2.4.0.tar.gz"
packages/core2-64-poky-linux/python3-urllib3: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 865171 to 867524 (+0%)
Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.3.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.4.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.11.15.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info

--===============3971134074013053736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.3.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.4.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.11.15.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info

--===============3971134074013053736==--

