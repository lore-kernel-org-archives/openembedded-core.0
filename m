Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B308BCCA49D
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.39312.1656687063489428983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lpUbAOAd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010181ba3e6e50-4161fa61-080f-4a04-acfa-fcfd49758da7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tlubGAZT6j36pHaqWE4u220ingTaLKmmMGiyz1SCfdY=;
	b=lpUbAOAdxjBFekWtCe2Zt3c8r1+IfbKs2S3Df1pr+S2svHdZzspiWdZ7zqaUl2xe
	DgauhPXNwWJS7sTJ79gQspe1ncUOAAjNwvkAL8LII/gr2jWoKaqCqKCcGsS1QNwCLn4
	EVvJd1Qu0wLJDkDqrxSHBqyi6QLRncCtDTqBYwYI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tlubGAZT6j36pHaqWE4u220ingTaLKmmMGiyz1SCfdY=;
	b=PkEDYwnYoKCqdZNOxQmkl9LpsgBleqgYLkpL0+53HQi4wFhGB4BK7uN3IhH5O897
	gG15ATN7IwwUY/37zu835LLcsQlOw2CKU4tUJrdeKTh6Ylx36CVv2+r/yijL+h1s+iX
	3y+AKX/SJA/tmB/jjdlfoXW1AIEXu68+DGLXo978=
Content-Type: multipart/mixed; boundary="===============5433761240442072650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 62.6.0 SUCCEEDED
Message-ID: 
 <01010181ba3e6e50-4161fa61-080f-4a04-acfa-fcfd49758da7-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167499

--===============5433761240442072650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *62.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-62.5.0-62.6.0.patch
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
--===============5433761240442072650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-62.5.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-62.6.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "62.5.0" to "62.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4850408 to 4866050 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 62.5.0 [default] to 62.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "62.5.0" to "62.6.0"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info

--===============5433761240442072650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-62.5.0-62.6.0.patch"

From cd14fca3c574a466dd03bdf27d80ac90542939fc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 09:01:17 +0000
Subject: [PATCH] python3-setuptools: upgrade 62.5.0 -> 62.6.0

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_62.5.0.bb => python3-setuptools_62.6.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_62.5.0.bb => python3-setuptools_62.6.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 6d4a9ff0a2..b9574070ab 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 5dfa8a8e0b1ad4712a8b8309c8663b7b598ba2a8 Mon Sep 17 00:00:00 2001
+From b64f3066ead6b317fb62c031c173ec6eadd44db9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_62.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
index b3286d5dab..be6707ce88 100644
--- a/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "a4c782ac58fcc9e3a86e5e1a4c74cf9d24bf21e4f1562043309022e1bb76951c"
+SRC_URI[sha256sum] = "990a4f7861b31532871ab72331e755b5f14efbe52d336ea7f6118144dd478741"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.31.1


--===============5433761240442072650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.5.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info

--===============5433761240442072650==--

