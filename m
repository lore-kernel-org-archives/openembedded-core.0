Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830A2C35294
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.13955.1646329345343450096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=N1UljI5a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f50e03127-74488799-666b-4df8-a063-bfcf134cb7ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tKKWFElxqN+lTRa7nBf4ApIB6J/oSFY3RuF4vZsPesQ=;
	b=N1UljI5aIKBjeIKSbZj1k3D9V2QWtAwDBkKOGpiR94v/PLOU0hhiYk3DxN8Q/ccN
	5effN/aiHSUmpefdJ20E2dH8+wB0k1RnHD+kJNr2Cz5WGaDPCURg1//rEF2Tg44Pfyw
	3/Q43EeFziWx3h/XKO+gnVJgOQQssQXcBi2n6WsU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tKKWFElxqN+lTRa7nBf4ApIB6J/oSFY3RuF4vZsPesQ=;
	b=XC+ZR8y3DdNLpmaQaW++VLIZqit3+cTSgkIOxT+fOOvY4aLLGy8QCVr4aBGzC+Pa
	fQMIlNNErCFmrjDZULV8kdPU/CmmA73JKNrKIesxNL24e+pQ0bnrBYdDEKclt44Wtbs
	MuzUcOjsFDlEd6v02Q+ZCdi/F6m54EnivldSZ2Hg=
Content-Type: multipart/mixed; boundary="===============9009703755515944799=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsecret: upgrading to 0.20.5 SUCCEEDED
Message-ID: 
 <0101017f50e03127-74488799-666b-4df8-a063-bfcf134cb7ef-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162689

--===============9009703755515944799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsecret* to *0.20.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsecret-upgrade-0.20.4-0.20.5.patch
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
--===============9009703755515944799==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libsecret-upgrade-0.20.4-0.20.5.patch"

From 1717983e8ae3180e46ebe6f3f8bb9239785eda89 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 15:04:16 +0000
Subject: [PATCH] libsecret: upgrade 0.20.4 -> 0.20.5

---
 .../libsecret/libsecret/determinism.patch     | 37 -------------------
 ...ibsecret_0.20.4.bb => libsecret_0.20.5.bb} |  4 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-gnome/libsecret/libsecret/determinism.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.4.bb => libsecret_0.20.5.bb} (88%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/determinism.patch b/meta/recipes-gnome/libsecret/libsecret/determinism.patch
deleted file mode 100644
index ad96e8f59b..0000000000
--- a/meta/recipes-gnome/libsecret/libsecret/determinism.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-secret-enum-types.c/h.template: Fix reproducibility issue 
-
-When full filenames are used in generated sources it makes the resulting
-debug packages non-reproducible. Best practise is to use basename in
-comments instead.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/68]
-
-Index: libsecret-0.20.4/libsecret/secret-enum-types.c.template
-===================================================================
---- libsecret-0.20.4.orig/libsecret/secret-enum-types.c.template
-+++ libsecret-0.20.4/libsecret/secret-enum-types.c.template
-@@ -23,8 +23,8 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--#include "@filename@"
--/* enumerations from "@filename@" */
-+#include "@basename@"
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-Index: libsecret-0.20.4/libsecret/secret-enum-types.h.template
-===================================================================
---- libsecret-0.20.4.orig/libsecret/secret-enum-types.h.template
-+++ libsecret-0.20.4/libsecret/secret-enum-types.h.template
-@@ -27,7 +27,7 @@ G_BEGIN_DECLS
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
similarity index 88%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
index 39ecdd770a..edb2b4a882 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
@@ -14,9 +14,7 @@ inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI += " file://determinism.patch"
-
-SRC_URI[archive.sha256sum] = "325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28"
+SRC_URI[archive.sha256sum] = "3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.27.0


--===============9009703755515944799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsecret: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret: PACKAGES: added "libsecret-locale-ab libsecret-locale-fi libsecret-locale-vi"
packages/core2-32-poky-linux/libsecret: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret: SRC_URI changed from "https://download.gnome.org/sources//libsecret/0.20/libsecret-0.20.4.tar.xz;name=archive file://determinism.patch" to "https://download.gnome.org/sources//libsecret/0.20/libsecret-0.20.5.tar.xz;name=archive"
packages/core2-32-poky-linux/libsecret/libsecret-dbg: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-dbg: PKGSIZE changed from 787936 to 796960 (+1%)
packages/core2-32-poky-linux/libsecret/libsecret-dbg: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-dev: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-dev: PKGSIZE changed from 668274 to 674256 (+1%)
packages/core2-32-poky-linux/libsecret/libsecret-dev: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-doc: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-doc: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-an: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-an: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ar: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ar: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-as: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-as: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-be: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-be: PKGSIZE changed from 1714 to 2165 (+26%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-be: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-bg: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-bg: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-bs: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-bs: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca+valencia: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca+valencia: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca: PKGSIZE changed from 1505 to 1537 (+2%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ckb: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ckb: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-cs: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-cs: PKGSIZE changed from 1540 to 1588 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-cs: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-da: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-da: PKGSIZE changed from 1368 to 1540 (+13%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-da: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-de: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-de: PKGSIZE changed from 1527 to 1554 (+2%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-de: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-el: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-el: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-en-gb: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-en-gb: PKGSIZE changed from 1410 to 1484 (+5%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-en-gb: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-eo: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-eo: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-es: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-es: PKGSIZE changed from 1560 to 1616 (+4%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-es: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-eu: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-eu: PKGSIZE changed from 1511 to 1525 (+1%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-eu: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-fa: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-fa: PKGSIZE changed from 1621 to 1677 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-fa: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-fr: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-fr: PKGSIZE changed from 1559 to 1668 (+7%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-fr: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-fur: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-fur: PKGSIZE changed from 1482 to 1524 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-fur: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-gl: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-gl: PKGSIZE changed from 1432 to 1717 (+20%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-gl: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-he: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-he: PKGSIZE changed from 1457 to 1573 (+8%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-he: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-hr: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-hr: PKGSIZE changed from 1524 to 1561 (+2%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-hr: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-hu: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-hu: PKGSIZE changed from 1494 to 1541 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-hu: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-id: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-id: PKGSIZE changed from 1441 to 1478 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-id: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-it: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-it: PKGSIZE changed from 1437 to 1598 (+11%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-it: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ja: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ja: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-kk: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-kk: PKGSIZE changed from 1718 to 1764 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-kk: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ko: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ko: PKGSIZE changed from 1447 to 1487 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-ko: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-lt: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-lt: PKGSIZE changed from 1530 to 1569 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-lt: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-lv: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-lv: PKGSIZE changed from 1520 to 1562 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-lv: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ml: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ml: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ms: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ms: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-nb: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-nb: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ne: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ne: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-nl: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-nl: PKGSIZE changed from 1500 to 1541 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-nl: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-oc: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-oc: PKGSIZE changed from 1589 to 1603 (+1%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-oc: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pa: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pa: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pl: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pl: PKGSIZE changed from 1427 to 1568 (+10%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-pl: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt-br: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt-br: PKGSIZE changed from 1543 to 1586 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt-br: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt: PKGSIZE changed from 1540 to 1571 (+2%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ro: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ro: PKGSIZE changed from 1596 to 1643 (+3%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-ro: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ru: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ru: PKGSIZE changed from 1885 to 1972 (+5%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-ru: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sk: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sk: PKGSIZE changed from 1496 to 1565 (+5%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-sk: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sl: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sl: PKGSIZE changed from 1662 to 1661 (-0%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-sl: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr+latin: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr+latin: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr: PKGSIZE changed from 1893 to 1977 (+4%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sv: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sv: PKGSIZE changed from 1477 to 1536 (+4%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-sv: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-tg: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-tg: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-tr: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-tr: PKGSIZE changed from 1490 to 1519 (+2%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-tr: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-uk: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-uk: PKGSIZE changed from 1871 to 1938 (+4%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-uk: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-cn: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-cn: PKGSIZE changed from 1275 to 1370 (+7%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-cn: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-hk: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-hk: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-tw: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-tw: PKGSIZE changed from 1264 to 1393 (+10%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-tw: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-src: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-src: PKGSIZE changed from 1133917 to 1132504 (-0%)
packages/core2-32-poky-linux/libsecret/libsecret-src: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret-staticdev: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret-staticdev: PKGV changed from 0.20.4 [default] to 0.20.5 [default]
packages/core2-32-poky-linux/libsecret/libsecret: PV changed from "0.20.4" to "0.20.5"
packages/core2-32-poky-linux/libsecret/libsecret: PKGSIZE changed from 478888 to 479220 (+0%)
packages/core2-32-poky-linux/libsecret/libsecret: PKGV changed from 0.20.4 [default] to 0.20.5 [default]

--===============9009703755515944799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsecret: PACKAGES: added "libsecret-locale-fi libsecret-locale-vi libsecret-locale-ab"
packages/core2-32-poky-linux/libsecret/libsecret-locale-be: PKGSIZE changed from 1714 to 2165 (+26%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-da: PKGSIZE changed from 1368 to 1540 (+13%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-gl: PKGSIZE changed from 1432 to 1717 (+20%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-it: PKGSIZE changed from 1437 to 1598 (+11%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-tw: PKGSIZE changed from 1264 to 1393 (+10%)

--===============9009703755515944799==--

