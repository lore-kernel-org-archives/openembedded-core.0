Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D39C2BBE9
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.979.1657900665345661915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JuD/3CdH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101018202949213-6bedfd0b-5536-41c6-8614-77df52859ef3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mio9TmyU3Y2kyx2YHK6Y5MAM61rqPDkqb8MpYH1JgPQ=;
	b=JuD/3CdH9XSsDLk4xkSu2UxREWjpcbDLKPxPtx/JAsHSKKws8MvzrTcWANl+G25P
	L17ltEHIy3jJY4vTq1WsoiapC24slK3vZ7Rj05t87L2co9pfE1HWDGmdOTL6VVZ8Gpt
	9fg3ZZi8rzW1XXLKRmxw7hiB/hupduVUYKPJARIc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mio9TmyU3Y2kyx2YHK6Y5MAM61rqPDkqb8MpYH1JgPQ=;
	b=Pjxf/9e1YnKUz3l/GHtuChxR9qNWLR9mF+Tuze7+EzqxLNaPUJ2vLwC8hpuPIqqT
	snNr2/BC/PTJ+lLlnCMRlBJjlRpMkqCi8bj5biFgLh3cqVJb3xgDlDhVmD9BZ5ETu74
	7p550C5fsGi9gBJ52MxpTWmU8v3gzcp+ha4a2SP4=
Content-Type: multipart/mixed; boundary="===============8350373039954806026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.50.1 SUCCEEDED
Message-ID: 
 <0101018202949213-6bedfd0b-5536-41c6-8614-77df52859ef3-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168074

--===============8350373039954806026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.50.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.48.2-6.50.1.patch
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
--===============8350373039954806026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.48.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.50.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.48.2" to "6.50.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.48.2 [default] to 6.50.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2072669 to 2079543 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.48.2" to "6.50.1"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.50.1.dist-info

--===============8350373039954806026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.50.1.dist-info

--===============8350373039954806026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.48.2-6.50.1.patch"

From cb42f0da0e09aca0b4ca268c106fea98ec469882 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:54:50 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.48.2 -> 6.50.1

---
 ...ython3-hypothesis_6.48.2.bb => python3-hypothesis_6.50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.48.2.bb => python3-hypothesis_6.50.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
index 9e74e2c1cd..0c93c12493 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ef548f10438095678af7fcfa369b882390355a6329db73174a65749b677677ec"
+SRC_URI[sha256sum] = "1a19ade3b27825cab622c95fcf25182a27a42f97589c163173fcbdafb8621d1e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.31.1


--===============8350373039954806026==--

