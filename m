Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BF2CCA492
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.616.1654100323854989287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=V7JfS3B5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010181200feacd-4006c0ac-b745-4599-9798-cc147f2ef12f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BZf6Nbl+hdeMaSdFEHww6xaL0SkO+8uNkzzP6nUh6Is=;
	b=V7JfS3B5N6YOn5KlIn0RZxH9xDE5Al4R1PUIC61E4ncSJhV44SKFb3BV5y6kjRMX
	GxzzPwywn3E2zf8ejVxXPN0Lg0SD+LZORDQJHMFbYaE+kczbpAxMnfxMLAWyegGhvgI
	Sx2C7A51pfDNh8K+HqmVCoXGQ0BvPineYEqlECNQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BZf6Nbl+hdeMaSdFEHww6xaL0SkO+8uNkzzP6nUh6Is=;
	b=kTsocrNHwQA++3evuV33VUVkMe4HHF4+lIx3ga64tUTB7ojTBEAFFknhiu1+EOBt
	TeG5mudMHULL1cxP63VSYFo2IJmBsT0r4wKadpDLQRbikd1NtotlFKCECSm1AajPr4L
	8jIy9XkkC7s3kFugnvXV80FTIQnHuHyd/V2EQbbI=
Content-Type: multipart/mixed; boundary="===============8867414549656975814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.22.4 SUCCEEDED
Message-ID: 
 <01010181200feacd-4006c0ac-b745-4599-9798-cc147f2ef12f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166401

--===============8867414549656975814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.22.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.22.3-1.22.4.patch
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
--===============8867414549656975814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.22.3/numpy-1.22.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.22.4/numpy-1.22.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 30772680 to 30773484 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18538049 to 18539381 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 260590 to 260622 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 33116355 to 33126764 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.22.3" to "1.22.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.22.3 [default] to 1.22.4 [default]
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.22.3.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.22.4.dist-info

--===============8867414549656975814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.22.3.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.22.4.dist-info

--===============8867414549656975814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.22.3-1.22.4.patch"

From 72720f573d2ec532cafe9a071c793232449b446d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 08:32:42 +0000
Subject: [PATCH] python3-numpy: upgrade 1.22.3 -> 1.22.4

---
 .../python/{python3-numpy_1.22.3.bb => python3-numpy_1.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.22.3.bb => python3-numpy_1.22.4.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.22.3.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.4.bb
index b5b1c4e714..7aa473a7e9 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "a906c0b4301a3d62ccf66d058fe779a65c1c34f6719ef2058f96e1856f48bca5"
+SRC_URI[sha256sum] = "b4308198d0e41efaa108e57d69973398439c7299a9d551680cdd603cf6d20709"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.31.1


--===============8867414549656975814==--

