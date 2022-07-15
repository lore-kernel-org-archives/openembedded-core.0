Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF261CCA489
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.940.1657900668119059240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mRx6Plap;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101820294986b-b1c801de-d83e-4ce7-bef1-7d679f80bde0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JLWEUyhpHipbmX4hdmFfBddcU7HLqWxlR0FQGYnDNZo=;
	b=mRx6PlapSlEWbIHJgTq1R4rdF5mYl2t1aqO6mqxsX75kZR7AlD/Kit73iP2D7Tl0
	9BJmVgq99taaJt2AyLLLVMtdwuoC1NglJSPEiN+dRaJ0InIEklL8TwHTXewdNUhisfE
	cIYhgH2/CWbqhHSrfhRJRzv3E+saRFELdbNnW5m8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JLWEUyhpHipbmX4hdmFfBddcU7HLqWxlR0FQGYnDNZo=;
	b=Azr0YTnlm5hZOGMEL6xVLJINzCE5xlXuj369q5UkI89iEj95uDBXhORHk867nex+
	WLs2UDjL/vhIyfb/9SD9AarF5gEiipFrblNi6zW3yHlmLHw98inmT2V+A++Cs5r1anV
	PGSN6kveRxwAc+AvFYbjjYNpy31eGbO4YE7lkABw=
Content-Type: multipart/mixed; boundary="===============1655066412059545828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.4 SUCCEEDED
Message-ID: 
 <010101820294986b-b1c801de-d83e-4ce7-bef1-7d679f80bde0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168109

--===============1655066412059545828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-2.3-2.4.patch
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
--===============1655066412059545828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PV changed from "2.3" to "2.4"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGSIZE changed from 16555 to 17231 (+4%)
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-32-poky-linux/hwlatdetect: PV changed from "2.3" to "2.4"

--===============1655066412059545828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-2.3-2.4.patch"

From 98adef0ca244b6be1d5d2691f2463caf46a8ec75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 14:24:17 +0000
Subject: [PATCH] hwlatdetect: upgrade 2.3 -> 2.4

---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index e519dfdc61..93fa390bba 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "338843c1ee157ae5d990c6f544f66b447b24fa8b"
-PV = "2.3"
+SRCREV = "ca4a6293da23ad0fd708ea1fecb2d465a9ea6093"
+PV = "2.4"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
-- 
2.31.1


--===============1655066412059545828==--

