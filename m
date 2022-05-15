Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FF1C47082
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18949.1652634913862702861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hsio56Hh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180c8b78a22-439f7228-dad1-4c74-841c-e942be2092d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Cfj+BRT3TslzaeMwoESk4pUm3ZMKqVCjcesaFL1m59w=;
	b=Hsio56HhkOEg/S1KW3lvaefaZ6Njad11VPUqiCDzt4gGxfWRGl/d7XFnPZZ0qApt
	PwNWwAAau7Lk+bDi/uJflTHRuzD0tCurFlfvEv9C2CsH9M/vaSTz7pl/eGwSyFK0Wog
	O61ru3lwKzQyyUZ7YxHdaLiywmFDt4v/lYhdJ590=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Cfj+BRT3TslzaeMwoESk4pUm3ZMKqVCjcesaFL1m59w=;
	b=jm8yMvPhpFV17eM/mU8XdFaUo/Jteeq5AbEIfewTpa1PgaCkPZbE7ftsOiA1/RES
	nfNgRxfJb1SbJhAZba4IkB51/d1XMlZMoAjwhHN+oz3ckBokoL/7kQU4uDi1poDVJF9
	2uQbmU/eQQoWS0VspaN+ndrRaOgAcP8PgGRHdP1c=
Content-Type: multipart/mixed; boundary="===============0426344736683123178=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.54.3 SUCCEEDED
Message-ID: 
 <01010180c8b78a22-439f7228-dad1-4c74-841c-e942be2092d0-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165627

--===============0426344736683123178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librsvg* to *2.54.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librsvg-upgrade-2.54.1-2.54.3.patch
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
--===============0426344736683123178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librsvg: SRC_URI changed from "https://download.gnome.org/sources//librsvg/2.54/librsvg-2.54.1.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch" to "https://download.gnome.org/sources//librsvg/2.54/librsvg-2.54.3.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch"
packages/core2-32-poky-linux/librsvg: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGSIZE changed from 8046556 to 8046808 (+0%)
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg-dev: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dev: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg-doc: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg-doc: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg-locale: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg-locale: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg-src: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg-src: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/librsvg: PKGSIZE changed from 11849919 to 11878599 (+0%)
packages/core2-32-poky-linux/librsvg/librsvg: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/librsvg: PV changed from "2.54.1" to "2.54.3"
packages/core2-32-poky-linux/librsvg/rsvg: PKGV changed from 2.54.1 [default] to 2.54.3 [default]
packages/core2-32-poky-linux/librsvg/rsvg: PV changed from "2.54.1" to "2.54.3"

--===============0426344736683123178==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-librsvg-upgrade-2.54.1-2.54.3.patch"

From f7a72d7666f6a132bd28fbee16e8361669d7c6cf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 11:50:22 +0000
Subject: [PATCH] librsvg: upgrade 2.54.1 -> 2.54.3

---
 .../librsvg/{librsvg_2.54.1.bb => librsvg_2.54.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.1.bb => librsvg_2.54.3.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
index 7bad2ed816..958e80f00a 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "d5557efbdcc415a4180e1116b7f736cb711b253d110d95fa86ec830f70026625"
+SRC_URI[archive.sha256sum] = "66158f2ef46dde260026846c4da102e4a9dd4e5293010f30949c6cc26dd6efe8"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.31.1


--===============0426344736683123178==--

