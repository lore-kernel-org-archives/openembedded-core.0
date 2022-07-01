Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19F4C2BBEC
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.39735.1656687063021870407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LjGBZFfs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181ba3e6bac-ee979f0c-cbd3-4345-bf4f-333f994b81a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hOepcpaMwImYCvSYeGjSkHbDm+22AWDawO/cqJqzW80=;
	b=LjGBZFfsYCG7FhMpVc6KVSy+DYINzZA3Kz+HiaEVgaY1QuugLZe7ZZkJJhYUPgwj
	0kJOX3BrlhvZBYvYMgxqa7fAxL8DeUakDiOzty5ZH0C95OGZ3OSkLc4OxdHdSkP09Ce
	5FY/0H46WkSZ/IlAneKyvF4qjwFgCcidNaIbTaRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hOepcpaMwImYCvSYeGjSkHbDm+22AWDawO/cqJqzW80=;
	b=g5VJqeU2sb8KRL4QC1jm+Yh5e5vqu0suCVIAvCZqEjfTKYW3A9lB1QbCrqjIE6aA
	CLRvDQg26LbKTTWsoYOn+4Y2ajd0dSG1Rd7w7wR1e34HXVwU05wVsjgkAnkjPTUX1Cd
	zkQUcbV8xsLhLvnOffmp70KyKVXp5roqel8se2rE=
Content-Type: multipart/mixed; boundary="===============7943343418824947441=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.48.2 SUCCEEDED
Message-ID: 
 <01010181ba3e6bac-ee979f0c-cbd3-4345-bf4f-333f994b81a5-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167487

--===============7943343418824947441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.48.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.46.11-6.48.2.patch
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
--===============7943343418824947441==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.46.11-6.48.2.patch"

From e00574065a831589357a1391badbde2742b529a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:42:13 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.46.11 -> 6.48.2

---
 ...thon3-hypothesis_6.46.11.bb => python3-hypothesis_6.48.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.11.bb => python3-hypothesis_6.48.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb b/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
index 1d9772d4ff..9e74e2c1cd 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
+SRC_URI[sha256sum] = "ef548f10438095678af7fcfa369b882390355a6329db73174a65749b677677ec"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.31.1


--===============7943343418824947441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.46.11.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.48.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.46.11" to "6.48.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.48.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2070320 to 2072669 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.46.11" to "6.48.2"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============7943343418824947441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.48.2.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============7943343418824947441==--

