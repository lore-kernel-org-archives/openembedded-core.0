Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9C5C47080
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.10470.1648819421011227813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=1TKXemyz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 0101017fe54bbb78-992025f4-8ed3-40e6-ba00-ed428c9ec518-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LS3CJSHJB9U5DI/2sGDlCp1M+6Qqm5WXScHJrpZHdSQ=;
	b=1TKXemyz0zBi5NcVtghcDNh/ICfNSSyJSGKJFvi/XFC+mHizfpNO8GZlvqE/sgo8
	0dFvM1QVOJad/cnChteF3M/O6g5FJc/W5YUuJqtx5H6MUJZojzVncF5HtUp7vadU3LF
	eI8uKhOGqiY/mHuy/7laUT0MjlDcDyUVPrFataAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LS3CJSHJB9U5DI/2sGDlCp1M+6Qqm5WXScHJrpZHdSQ=;
	b=Wz7WgQbtRBMkTnHkO+y2gd+jXB0GVNQSb1zkpegsFb0ztZdIidwlE4E8S9u/SMKT
	mK0g+o4RnocOMvZtkjph4CebRqnC/tuRcqcHo02UPAV/9OQo4yzFfiEl7KzfdAKnhEA
	J+b0Y6GTsu83QikAymZvnQW5ic1Q07q4CTN/h7O4=
Content-Type: multipart/mixed; boundary="===============8810882569616782037=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.40.1 SUCCEEDED
Message-ID: 
 <0101017fe54bbb78-992025f4-8ed3-40e6-ba00-ed428c9ec518-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163900

--===============8810882569616782037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.40.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.39.5-6.40.1.patch
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
--===============8810882569616782037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.39.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.40.1.dist-info

--===============8810882569616782037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.39.5.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.40.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2021519 to 2028913 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.39.5" to "6.40.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.39.5 [default] to 6.40.1 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.39.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.40.1.dist-info

--===============8810882569616782037==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.39.5-6.40.1.patch"

From 273f6b68ed0556463c248a9abceca9b52f011049 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 07:35:02 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.39.5 -> 6.40.1

---
 ...ython3-hypothesis_6.39.5.bb => python3-hypothesis_6.40.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.39.5.bb => python3-hypothesis_6.40.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.40.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.40.1.bb
index 03ec94c1c1..d3fa6d14a8 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.40.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2972edc54c90c70049facfc31db19f1997f9c5e89d2a05f6eeea1107600350f0"
+SRC_URI[sha256sum] = "063e5da9f6a0861f2530cf543ce6b1f3e5a7932670c1955ed862025eed3a15bc"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.27.0


--===============8810882569616782037==--

