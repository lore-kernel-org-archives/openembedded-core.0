Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BAFC3525B
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.10653.1647349734807705545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=h91h1O4J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017f8db21a29-182a15c1-fb63-4e22-ba57-0fe2b79fc660-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JiDfczkW77FEGda7OLckBVSKgCGZf9uUpZyc2bj3qts=;
	b=h91h1O4JO3YiOytp0hb+scb2nWellGlzU4DR59gfdUW6kqU2qMLarVVLLfMIPkEs
	uluOlaLge6+bg0waKV4S9l/vWSygjNL1RahJk8l3Mtv1Dse+LVZbV6F05yIzPZkf8Ib
	7yFoQkAvD7D7uyrekC+dIy18b4g6nq8O1nice7qY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JiDfczkW77FEGda7OLckBVSKgCGZf9uUpZyc2bj3qts=;
	b=Gmx2LzszEAaA+kepaMnMrPp9KcItZ7/AcFj453uBQu2PSdYsHUQkwY3skSrLKEgY
	cW8TCfBNEqVK2buBzaZ5T6JqCYlqJ1OnKgtAVcw4MvytVXSXmXL6UwlmYii4fxZNTIk
	f1OXQl8AecDUEbKTWJV4OBMmVSbU4JTC1DMAS9O0=
Content-Type: multipart/mixed; boundary="===============5869323244761873075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.61.3 SUCCEEDED
Message-ID: 
 <0101017f8db21a29-182a15c1-fb63-4e22-ba57-0fe2b79fc660-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163251

--===============5869323244761873075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.61.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.61.2-0.61.3.patch
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
--===============5869323244761873075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases/download/0.61.2/meson-0.61.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch" to "https://github.com/mesonbuild/meson/releases/download/0.61.3/meson-0.61.3.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson: PV changed from "0.61.2" to "0.61.3"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.61.2" to "0.61.3"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.61.2" to "0.61.3"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5345 to 5342 (-0%)
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.61.2" to "0.61.3"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.61.2" to "0.61.3"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.61.2" to "0.61.3"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.61.2" to "0.61.3"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.61.2 [default] to 0.61.3 [default]
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 5481033 to 5482908 (+0%)
packages/core2-32-poky-linux/meson/meson: PV changed from "0.61.2" to "0.61.3"
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.61.2.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.61.3.dist-info

--===============5869323244761873075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.61.2.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.61.3.dist-info

--===============5869323244761873075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.61.2-0.61.3.patch"

From 400ca1df63be3f41c27d481769999afb56679ae9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 07:29:24 +0000
Subject: [PATCH] meson: upgrade 0.61.2 -> 0.61.3

---
 .../recipes-devtools/meson/{meson_0.61.2.bb => meson_0.61.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.61.2.bb => meson_0.61.3.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-devtools/meson/meson_0.61.3.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.61.2.bb
rename to meta/recipes-devtools/meson/meson_0.61.3.bb
index 8304bfdac9..ecc6272998 100644
--- a/meta/recipes-devtools/meson/meson_0.61.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "0233a7f8d959079318f6052b0939c27f68a5de86ba601f25c9ee6869fb5f5889"
+SRC_URI[sha256sum] = "9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.27.0


--===============5869323244761873075==--

