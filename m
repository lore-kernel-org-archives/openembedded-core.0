Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6C8C3F2D4
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.4463.1655298222125581702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eT9b48+q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101018167766443-43a1e569-9cee-4541-b07e-c85d29e68a68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xAYL8N3IXbW2d0+DCJhVqNuHi5akkkpH1qa7rj1TdOU=;
	b=eT9b48+qdj45JGntCYHgbO1DBLYZmq6o4gItnVF2e0ngZFB4ZfPEgiyYD/HrBqo/
	Z+YbJOXCGwOeFx2dMGO8M+NW2fHCaB4YkJlRG5a64XVMZsdjAUv6iboHR4Pbmfiw/RN
	A6s2pdXdrAIy/Dh/OZYoSO+cVayuc48UoOfWyaV8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xAYL8N3IXbW2d0+DCJhVqNuHi5akkkpH1qa7rj1TdOU=;
	b=VgHe7SvsnwJDMhV762c6lICn7CV1He1qxMAPmtrG5uM1wz/XfxneFuwBn1M7C5Mn
	e4EW0S3zam++ta3Emr2zh4ZvA7SnWq+Y2MGI2nVrjYtKcZg50dBlkTFlgahvjjty6D0
	YXUDLY6oSjGQl1Rs1sWgyrt90Pxs/pvj02HG+H44=
Content-Type: multipart/mixed; boundary="===============2266628497541771039=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.54.4 SUCCEEDED
Message-ID: 
 <0101018167766443-43a1e569-9cee-4541-b07e-c85d29e68a68-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166963

--===============2266628497541771039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librsvg* to *2.54.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librsvg-upgrade-2.54.3-2.54.4.patch
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
--===============2266628497541771039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librsvg: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg: SRC_URI changed from "https://download.gnome.org/sources//librsvg/2.54/librsvg-2.54.3.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch" to "https://download.gnome.org/sources//librsvg/2.54/librsvg-2.54.4.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch"
packages/core2-32-poky-linux/librsvg: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGSIZE changed from 8046808 to 8043720 (-0%)
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg-dev: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dev: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg-doc: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg-doc: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg-locale: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg-locale: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg-src: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg-src: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/librsvg: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/librsvg: PKGSIZE changed from 11878599 to 11886791 (+0%)
packages/core2-32-poky-linux/librsvg/librsvg: PV changed from "2.54.3" to "2.54.4"
packages/core2-32-poky-linux/librsvg/rsvg: PKGV changed from 2.54.3 [default] to 2.54.4 [default]
packages/core2-32-poky-linux/librsvg/rsvg: PKGSIZE changed from 5797520 to 5805712 (+0%)
packages/core2-32-poky-linux/librsvg/rsvg: PV changed from "2.54.3" to "2.54.4"

--===============2266628497541771039==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-librsvg-upgrade-2.54.3-2.54.4.patch"

From 95ce95f60b2ca0b0884c24c95a7e18f25b3979af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 10:56:43 +0000
Subject: [PATCH] librsvg: upgrade 2.54.3 -> 2.54.4

---
 .../librsvg/{librsvg_2.54.3.bb => librsvg_2.54.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.3.bb => librsvg_2.54.4.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
index 3578898692..cc7fb9bbdf 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "66158f2ef46dde260026846c4da102e4a9dd4e5293010f30949c6cc26dd6efe8"
+SRC_URI[archive.sha256sum] = "ea152a243f6a43c0e036a28c70de3fcbcdea5664c6811c78592bc229ecc24833"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.31.1


--===============2266628497541771039==--

