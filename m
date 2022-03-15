Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8293FC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.10406.1647349734994305275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fT8b4WQJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db21ad8-a5f5f352-de7d-47f2-b121-c12263879e4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fCcykB+J+0O2LoignHbbxseaeTRb1sSHsFGfK779lGw=;
	b=fT8b4WQJQiEcAaUHWCkRNcfDQ9jviUUKimPvB23XCmgK9Q4GLrQ0E6R/CMmPHeQ6
	oZDyIvW2E4y2/YfQI0M09xhcaChRoDNr+0zbEMQWO6J6wq/+2JbgACKUdtpsmtVgmE8
	pq47GCt22wVGV2e+8qrM2WKvl6mxHJ++t8NSCy/Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fCcykB+J+0O2LoignHbbxseaeTRb1sSHsFGfK779lGw=;
	b=CN4bbEE9jCHJ0vNoNc4etRdE5Hbb/ALdHoTj5TueJxP+tf1w6D1WtjsRpwu/vmRR
	oA1NgAFPOE52povIVQcpeN9bpiWcEEwLF0wFBjwUevp0PGl8gOuiJPUdo3tnGTr+EBU
	JpZqmWgX6CvUDQaMXNvL4khgrTvHrMD4oyGUIin0=
Content-Type: multipart/mixed; boundary="===============8071207529942803605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.39.3 SUCCEEDED
Message-ID: 
 <0101017f8db21ad8-a5f5f352-de7d-47f2-b121-c12263879e4d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163254

--===============8071207529942803605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.39.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.39.2-6.39.3.patch
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
--===============8071207529942803605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.39.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.39.3.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.39.2" to "6.39.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2024845 to 2025371 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.39.2 [default] to 6.39.3 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.39.2.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.39.3.dist-info

--===============8071207529942803605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.39.2.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.39.3.dist-info

--===============8071207529942803605==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.39.2-6.39.3.patch"

From 24a4397026864ab80665cfcb0822ac653131460a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 07:45:51 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.39.2 -> 6.39.3

---
 ...ython3-hypothesis_6.39.2.bb => python3-hypothesis_6.39.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.39.2.bb => python3-hypothesis_6.39.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.39.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.39.3.bb
index 01732d0087..b4a2f3f7e7 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.39.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "7a16ba804baeebdcc5dc4638c32c5fc3fc552c1be30ae21a84c5d9c802b06e31"
+SRC_URI[sha256sum] = "f496dd053fb951b6da9611481fb4e54eeab1d37b594da5efe869083fad3ae621"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.27.0


--===============8071207529942803605==--

