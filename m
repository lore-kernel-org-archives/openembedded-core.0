Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D47C41535
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.19014.1652634913400654263
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hipmb04Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180c8b786de-f94276c6-2c9b-49b9-8c9c-26930979fed2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oPaL+xTOVzH+nVvYI9hvwiM2+bVXJVb0aDJ6W+3Acik=;
	b=Hipmb04ZUZK96D7PPUu45ufZ+MmiwkZIV29QrkrQbutUqIsy30h2uqUYFzxVD0jJ
	XEpyOVciJMkeLOO+V+Maf5zju6AbUaXnLxDH42HiosvI6KbpxwKY2A6bkmj8jsO0l0G
	tAeUx6JxZ2R574TkEo7VOIRC/AxSmn5uqKoSuUm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oPaL+xTOVzH+nVvYI9hvwiM2+bVXJVb0aDJ6W+3Acik=;
	b=L02ARkT/wqvZkGqYuRDpxQ0L0c2KxdaMuKwAKEjrHH7xsmf0elTWPo6lur1A9edZ
	LX66NOt7gHxxsyxbL6xKV6E46rcP/p9DDTUirWY+mty0QsZ1cZLKbrwpzO6FEiAp1mK
	AZPRiz+KbLPMjrzKnjng1LDgM+sWCOL2gg8lp9EI=
Content-Type: multipart/mixed; boundary="===============5481240802457879190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 3.2.2 SUCCEEDED
Message-ID: 
 <01010180c8b786de-f94276c6-2c9b-49b9-8c9c-26930979fed2-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165617

--===============5481240802457879190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bcrypt* to *3.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-3.2.0-3.2.2.patch
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
--===============5481240802457879190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-bcrypt: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-3.2.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-3.2.2.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-bcrypt: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-dev: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-dev: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-doc: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-doc: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-locale: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-locale: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGSIZE changed from 16790 to 16572 (-1%)
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-src: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-src: PKGSIZE changed from 99305 to 99458 (+0%)
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-src: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PV changed from "3.2.0" to "3.2.2"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt: PKGV changed from 3.2.0 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt: PKGSIZE changed from 76960 to 77658 (+1%)
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt: FILELIST: directory renamed /usr/lib/python3.10/site-packages/bcrypt-3.2.0.dist-info -> /usr/lib/python3.10/site-packages/bcrypt-3.2.2.dist-info, added "/usr/lib/python3.10/site-packages/bcrypt/_bcrypt.pyi"
packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt: PV changed from "3.2.0" to "3.2.2"
Changes to packages/core2-32-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.10/site-packages/bcrypt-3.2.0.dist-info moved to /usr/lib/python3.10/site-packages/bcrypt-3.2.2.dist-info
  /usr/lib/python3.10/site-packages/bcrypt/_bcrypt.pyi was added

--===============5481240802457879190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-bcrypt/python3-bcrypt: FILELIST: directory renamed /usr/lib/python3.10/site-packages/bcrypt-3.2.0.dist-info -> /usr/lib/python3.10/site-packages/bcrypt-3.2.2.dist-info, added "/usr/lib/python3.10/site-packages/bcrypt/_bcrypt.pyi"
Changes to packages/core2-32-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.10/site-packages/bcrypt-3.2.0.dist-info moved to /usr/lib/python3.10/site-packages/bcrypt-3.2.2.dist-info
  /usr/lib/python3.10/site-packages/bcrypt/_bcrypt.pyi was added

--===============5481240802457879190==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-3.2.0-3.2.2.patch"

From fae4f2554cd597854156e15c43fe208717ad22c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 07:46:27 +0000
Subject: [PATCH] python3-bcrypt: upgrade 3.2.0 -> 3.2.2

---
 .../{python3-bcrypt_3.2.0.bb => python3-bcrypt_3.2.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_3.2.0.bb => python3-bcrypt_3.2.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb b/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
rename to meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
index 6a4d1aef5c..54070e4b9c 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
 
-SRC_URI[md5sum] = "fe31390dab603728f756cd3d6830c80a"
-SRC_URI[sha256sum] = "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29"
+SRC_URI[sha256sum] = "433c410c2177057705da2a9f2cd01dd157493b2a7ac14c8593a16b3dab6b6bfb"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.31.1


--===============5481240802457879190==--

