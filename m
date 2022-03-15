Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD64C352A8
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.10487.1647349735120844679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MdwqgSvu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017f8db21d00-d17bc2b7-3d70-4f43-ae5a-0dc9ebcea21c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R9n+HYEy8eUsSj430YM5dJZRWjbWgTWNUj55dmkmCxI=;
	b=MdwqgSvu/d9YVuvKDCQjU+GJjtJbZnXAww7jXddDHUzd2VZF29e3k6dwpj02emFf
	mGjGcpADyCFnStRLE2oQwtZe63RJK2ftuaM4XtG3iCBKwMGpcSRHM95+3LtlGLRbEmm
	5OV2Db9g5fhP5wdIFjMhw3dC5WqSTw3TGnD/wBPY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R9n+HYEy8eUsSj430YM5dJZRWjbWgTWNUj55dmkmCxI=;
	b=SqXuIMkxSjZjoUoflffl3+OZCng7QQU7gb6x11oVTLvjzNm1CXtbb1Puxz3qPK1Q
	UCooxVmyUYxQMnmaLEymEoVrQKJt56zOeyb27XaJX0k8JYoqbJZwIJC3v8PkqrfEIii
	Ai8gmCFla3rRthlePGvYK9FVO2BMSrOprncArJcA=
Content-Type: multipart/mixed; boundary="===============1608485144133741830=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.52.7 SUCCEEDED
Message-ID: 
 <0101017f8db21d00-d17bc2b7-3d70-4f43-ae5a-0dc9ebcea21c-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163257

--===============1608485144133741830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librsvg* to *2.52.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librsvg-upgrade-2.52.6-2.52.7.patch
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
--===============1608485144133741830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librsvg: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg: SRC_URI changed from "https://download.gnome.org/sources//librsvg/2.52/librsvg-2.52.6.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch" to "https://download.gnome.org/sources//librsvg/2.52/librsvg-2.52.7.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch"
packages/core2-32-poky-linux/librsvg: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGSIZE changed from 8369340 to 8368944 (-0%)
packages/core2-32-poky-linux/librsvg/librsvg-dev: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dev: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg-doc: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg-doc: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg-locale: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg-locale: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg-src: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg-src: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/librsvg: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/librsvg: PKGSIZE changed from 11622983 to 11627079 (+0%)
packages/core2-32-poky-linux/librsvg/rsvg: PKGV changed from 2.52.6 [default] to 2.52.7 [default]
packages/core2-32-poky-linux/librsvg/rsvg: PV changed from "2.52.6" to "2.52.7"
packages/core2-32-poky-linux/librsvg/rsvg: PKGSIZE changed from 5883520 to 5887616 (+0%)

--===============1608485144133741830==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-librsvg-upgrade-2.52.6-2.52.7.patch"

From de946067ff9af46484c438698b56f9437aacbd84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 09:55:58 +0000
Subject: [PATCH] librsvg: upgrade 2.52.6 -> 2.52.7

---
 .../librsvg/{librsvg_2.52.6.bb => librsvg_2.52.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.6.bb => librsvg_2.52.7.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.6.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
index 85ecc10d00..3c9305572b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "a3f939a1e6a3a60408244632d0323f8c3b20eb4b7b000536e2e5bd93b8effaad"
+SRC_URI[archive.sha256sum] = "057c1eeeaf85c84e254bdb707459207f5840da5b4d52b4711c03140ed09e6887"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.27.0


--===============1608485144133741830==--

