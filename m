Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D3BC47081
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.2324.1651434543048188996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=0p3b7pDz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180812b545c-5cc0f4e4-cfc5-4886-b630-97d94e0118a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cASF5ffVHUQT83/la0ItctUfJZFr91phlXpLFkXVtQA=;
	b=0p3b7pDzIYjdKflV6JlwLvF5rrCptXiEX2GyL3WU+6elD106W70QAfFng0R3cd/j
	7GR2J9rJiEYyDOCbGXvyq4vmPGBouNW+5dpdYA5SG/gN9eAz2rsyd9zaLQHZIsPyW0c
	CX8vujO7/EZDPQCKeNfHVJDle6GTxEqKPsrSVsgI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cASF5ffVHUQT83/la0ItctUfJZFr91phlXpLFkXVtQA=;
	b=KqdQlebWM5mbTRIvWpfaq3chgXcYOsJxoyx3O3+PWeDriPYt03dAmSsNMNIz/DS6
	dl8z4kTcjl8VeL0d57fm/1ZhSLJLTgEoUYAXOuxPpNChZ/K2SBRML1X/mKMNXBuSvXa
	Izl+14MeIKIwGtH4dHORdL5/HmgKxQWA3WHPjkFQ=
Content-Type: multipart/mixed; boundary="===============4469569663251236044=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.46.0 SUCCEEDED
Message-ID: 
 <01010180812b545c-5cc0f4e4-cfc5-4886-b630-97d94e0118a0-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165107

--===============4469569663251236044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.46.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.44.0-6.46.0.patch
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
--===============4469569663251236044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.44.0.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.46.0.dist-info

--===============4469569663251236044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.44.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.46.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.44.0" to "6.46.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2037436 to 2046008 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.44.0 [default] to 6.46.0 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.44.0.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.46.0.dist-info

--===============4469569663251236044==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.44.0-6.46.0.patch"

From 43b32b3e349fa3de89a1753c5ff8acaf7c2c8285 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:19:01 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.44.0 -> 6.46.0

---
 ...ython3-hypothesis_6.44.0.bb => python3-hypothesis_6.46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.44.0.bb => python3-hypothesis_6.46.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
index e0f80b0e11..fb58297c27 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "620ffa1782f9cb0b732b66b811d11c3beeb678b96fae947740aaab1dfd74a996"
+SRC_URI[sha256sum] = "349e4a94926c91377fa3806ff363c6b9b65f95bec67d146066a16610501bf067"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.27.0


--===============4469569663251236044==--

