Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B270C2BBE5
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.4414.1655298220237833708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gFnScspJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101816776619a-994d17a0-a35a-4cdb-a24e-a5f497991658-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cITOE+tepcNGLisrJrmH2wMGpXRV5x3tdN+62VUkPWU=;
	b=gFnScspJ8Uirs1EKR8DnlVXXpU8lF+A+HRzsOaCW9tlisLATiojlcEOXSpQ6XzOe
	baE0p6QIPb8nIBdlW7nnn+cSsIKvSvTXQ4y+A/iwnOmQFXh2AwU5GknhIks2ya+OPF5
	Ov5oRbdvQkcydtg07q98HfodJOTPJUO4zHMvrXg0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cITOE+tepcNGLisrJrmH2wMGpXRV5x3tdN+62VUkPWU=;
	b=Z+IYDmAEueHWWwtfwZ0DtXZnwYyppaRhKgWLJZrHjYdwRlrrP9/02mgNs+wmiqUo
	1+QkBq/X5++UVtcSMUmjMPls3PqYHNupSiq8s+9ObDvg2y88WeARPRhX1vXIPkpeQw5
	0jnEwAOP8D8PJ5KFAp7cztxi3UjW/uOjbae+XLOk=
Content-Type: multipart/mixed; boundary="===============4094534773706943317=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.47.2 SUCCEEDED
Message-ID: 
 <010101816776619a-994d17a0-a35a-4cdb-a24e-a5f497991658-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166941

--===============4094534773706943317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.47.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.46.11-6.47.2.patch
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
--===============4094534773706943317==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.46.11-6.47.2.patch"

From 8896ee0b19a990652fcb933f3004d6bb9c3afe0b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 07:54:35 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.46.11 -> 6.47.2

---
 ...thon3-hypothesis_6.46.11.bb => python3-hypothesis_6.47.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.11.bb => python3-hypothesis_6.47.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
index 1d9772d4ff..d51e5ec82d 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
+SRC_URI[sha256sum] = "9c01a225eada7d74d38430e3e91e659e3a892fbc2b15f7b051779ded6ab73ee7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.31.1


--===============4094534773706943317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.46.11.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.47.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.47.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.46.11" to "6.47.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2070320 to 2072631 (+0%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============4094534773706943317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.47.2.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============4094534773706943317==--

