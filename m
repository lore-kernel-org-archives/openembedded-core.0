Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F0FC47086
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.10559.1648819422038561410
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RM8Cfmbi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017fe54bc08c-b15185b4-1514-4b31-bfd3-6a5ca8e6bd2e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=mm303dELyhHFh+0NDYrDjUMEw8JbwnIDmXQYB35FDhc=;
	b=RM8CfmbivM0g7iEmwDip99FvOtM5XZ7yBxrFcZjfFnwPsNOp59mzDHQXfn19fk5d
	xonYca1ZSLAJCMMLwRSvjxiM6KQ5uNQIM/DgP9p6loe/5LlOdSmGUOGECMLsTbCNsL2
	kL1gOU29o5sBzi5p4SGj+VmCwSBldy4AHTtnAt/Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=mm303dELyhHFh+0NDYrDjUMEw8JbwnIDmXQYB35FDhc=;
	b=RWNu5ILCTZuQJKtODp6ygPlGkJ6uHU/tzA6RO/zJurCU4d4lFw+s1bvFvrhesM7o
	jBFLm3p2GYExF4OFlJ0uXidZW6jjKHg2wZNec0snPUBXa2HB55a0yW0v2/JQ2kamA4z
	XBtDeumaSkLTVy6WmkwgIBwtTPPEeofaLS+o2MVk=
Content-Type: multipart/mixed; boundary="===============1442991496204368749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libx11: upgrading to 1.7.4 SUCCEEDED
Message-ID: 
 <0101017fe54bc08c-b15185b4-1514-4b31-bfd3-6a5ca8e6bd2e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163918

--===============1442991496204368749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libx11* to *1.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-upgrade-1.7.3.1-1.7.4.patch
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
--===============1442991496204368749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libx11: SRC_URI changed from "https://www.x.org/releases//individual/lib/libX11-1.7.3.1.tar.xz file://disable_tests.patch" to "https://www.x.org/releases//individual/lib/libX11-1.7.4.tar.xz file://disable_tests.patch"
packages/core2-32-poky-linux/libx11: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-dbg: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGSIZE changed from 10920980 to 10922164 (+0%)
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11/libx11-dev: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-dev: PKGSIZE changed from 253619 to 253616 (-0%)
packages/core2-32-poky-linux/libx11/libx11-dev: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11/libx11-doc: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-doc: PKGSIZE changed from 1997511 to 1996643 (-0%)
packages/core2-32-poky-linux/libx11/libx11-doc: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11/libx11-locale: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-locale: PKGSIZE changed from 1235025 to 1182207 (-4%)
packages/core2-32-poky-linux/libx11/libx11-locale: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11/libx11-src: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-src: PKGSIZE changed from 5437107 to 5437056 (-0%)
packages/core2-32-poky-linux/libx11/libx11-src: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11/libx11-staticdev: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11/libx11-xcb: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11-xcb: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/libx11/libx11: PV changed from "1.7.3.1" to "1.7.4"
packages/core2-32-poky-linux/libx11/libx11: PKGV changed from 1.7.3.1 [default] to 1.7.4 [default]

--===============1442991496204368749==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libx11-upgrade-1.7.3.1-1.7.4.patch"

From d7c137d15aad4c20e75e5f65e00274d228603d20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 12:01:21 +0000
Subject: [PATCH] libx11: upgrade 1.7.3.1 -> 1.7.4

---
 .../xorg-lib/{libx11_1.7.3.1.bb => libx11_1.7.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.3.1.bb => libx11_1.7.4.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.4.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.4.bb
index 0c3abcd896..13ffed7db7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
            "
-SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989"
+SRC_URI[sha256sum] = "0e7d48bfa0b0ee5705d14fe140cf4310744ed131f0a6241b7cf03db06000fe51"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.27.0


--===============1442991496204368749==--

