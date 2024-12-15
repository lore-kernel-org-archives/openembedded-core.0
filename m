Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F41E7718E
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.33350.1734254985912167728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CqDF5lRH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Llqf2i+a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193c9a6fefa-e11c628a-8a51-457b-bdf0-ef8ade399fb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cB84jUsWYjljmnfs+ZJE8Id1CIRrHCrl9YoQSDpzCKw=;
	b=CqDF5lRH12BYixx6MyqUlW6j2fNbru9pxWHb4KzS2N/Yfc7hX1QUe1gA6zCnvKWZ
	vnDMy9qQo+zQ5NgBDX4B1yQ3VwBzJWotaAUyLqWmFxLlfR387TWAsjX3WkutYf05Pt7
	o/wFKSaTImCGkUD6unbWA6W2iuDZILm9r9XhWz9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cB84jUsWYjljmnfs+ZJE8Id1CIRrHCrl9YoQSDpzCKw=;
	b=Llqf2i+aepIgLmFb8GhB52YzZqYd8t8cYmAj5MlaJkxf66jNOJtZ8LaoRk+F6e8G
	1fQuuq8F+ihSmkTxxypMn/38yBDh2u3WrE3k7V7Lz7mp5rSVPhUk4RkuLcfWPkukZzD
	S8zEZ/GLk/bkVxIkaeX+ueRojgB1IxIlATRuUDDM=
Content-Type: multipart/mixed; boundary="===============5740197623071474119=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-glib: upgrading to 1.10.6 SUCCEEDED
Message-ID: <01010193c9a6fefa-e11c628a-8a51-457b-bdf0-ef8ade399fb8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208726

--===============5740197623071474119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *json-glib* to *1.10.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-glib-upgrade-1.10.0-1.10.6.patch
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

-- >8 --
From eedd147382d370b729df0f802be0f046e0c01ea3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 07:51:03 +0000
Subject: [PATCH] json-glib: upgrade 1.10.0 -> 1.10.6

---
 .../json-glib/{json-glib_1.10.0.bb => json-glib_1.10.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.10.0.bb => json-glib_1.10.6.bb} (93%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
similarity index 93%
rename from meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
index 332e8b65c3..8b009bc17b 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "1bca8d66d96106ecc147df3133b95a5bb784f1fa6f15d06dd7c1a8fb4a10af7b"
+SRC_URI[archive.sha256sum] = "77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native python3-docutils-native"
-- 
2.44.1


--===============5740197623071474119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/json-glib/json-glib-bin: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-bin: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-dbg: FILELIST: removed "/usr/lib/.debug/libjson-glib-1.0.so.0.1000.0", added "/usr/lib/.debug/libjson-glib-1.0.so.0.1000.6"
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-dbg: PKGSIZE changed from 1040208 to 1045056 (+0%)
packages/core2-64-poky-linux/json-glib/json-glib-dev: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-dev: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-dev: PKGSIZE changed from 469481 to 469520 (+0%)
packages/core2-64-poky-linux/json-glib/json-glib-doc: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-doc: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ab: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ab: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-as: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-as: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-be: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-be: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-be: PKGSIZE changed from 6917 to 6784 (-2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bg: PKGSIZE changed from 6578 to 6687 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-bn-in: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bn-in: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-bs: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-bs: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca+valencia: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca+valencia: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ca: PKGSIZE changed from 5695 to 5799 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-cs: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-cs: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-cs: PKGSIZE changed from 5506 to 5589 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-da: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-da: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-da: PKGSIZE changed from 5440 to 5527 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-de: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-de: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-de: PKGSIZE changed from 5647 to 5732 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-el: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-el: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-el: PKGSIZE changed from 7006 to 7111 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-en-gb: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-en-gb: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-en-gb: PKGSIZE changed from 5320 to 5396 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-eo: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-es: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-es: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-es: PKGSIZE changed from 5520 to 5628 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-et: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-et: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-eu: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-eu: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-eu: PKGSIZE changed from 5576 to 5630 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-fa: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fa: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fa: PKGSIZE changed from 6365 to 6465 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-fr: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fr: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fr: PKGSIZE changed from 5853 to 5950 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-fur: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-fur: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-fur: PKGSIZE changed from 5401 to 5517 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-gl: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-gl: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-gl: PKGSIZE changed from 5507 to 5585 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-he: PKGSIZE changed from 5307 to 5409 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hi: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hr: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hr: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hu: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-hu: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-hu: PKGSIZE changed from 5693 to 5780 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-id: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-id: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-id: PKGSIZE changed from 5328 to 5411 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-it: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-it: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ja: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ja: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ka: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ka: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ka: PKGSIZE changed from 7972 to 8090 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-kab: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-kab: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ko: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ko: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ko: PKGSIZE changed from 5727 to 5812 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-ky: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ky: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-lt: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-lt: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-lt: PKGSIZE changed from 5530 to 5609 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-lv: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-lv: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-lv: PKGSIZE changed from 5429 to 5516 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-ml: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ml: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ms: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ms: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-nb: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-nb: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ne: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-nl: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-nl: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-nl: PKGSIZE changed from 5479 to 5587 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-oc: PKGSIZE changed from 5732 to 5830 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-or: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-or: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pa: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pa: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pl: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pl: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pl: PKGSIZE changed from 5616 to 5712 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt-br: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt-br: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt-br: PKGSIZE changed from 5500 to 5591 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-pt: PKGSIZE changed from 5448 to 5515 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-ro: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ro: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ro: PKGSIZE changed from 5657 to 5770 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-ru: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ru: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-ru: PKGSIZE changed from 6840 to 6948 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-sk: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sk: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sl: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sl: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sl: PKGSIZE changed from 5542 to 5628 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr+latin: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr+latin: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sr: PKGSIZE changed from 6819 to 6935 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-sv: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-sv: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-sv: PKGSIZE changed from 5419 to 5508 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-te: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-te: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-tg: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-tg: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-th: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-th: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-th: PKGSIZE changed from 7647 to 7782 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-tr: PKGSIZE changed from 5457 to 5541 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-ug: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-ug: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-uk: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-uk: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-uk: PKGSIZE changed from 6880 to 7017 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-vi: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-vi: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-cn: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-cn: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-cn: PKGSIZE changed from 5154 to 5234 (+2%)
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-hk: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-hk: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-tw: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-locale-zh-tw: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-ptest: PKGSIZE changed from 318009 to 322105 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-src: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-src: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib-src: PKGSIZE changed from 627794 to 632892 (+1%)
packages/core2-64-poky-linux/json-glib/json-glib-staticdev: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib-staticdev: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.1000.0", added "/usr/lib/libjson-glib-1.0.so.0.1000.6"
packages/core2-64-poky-linux/json-glib/json-glib: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib/json-glib: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
packages/core2-64-poky-linux/json-glib: SRC_URI changed from "https://download.gnome.org/sources//json-glib/1.10/json-glib-1.10.0.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//json-glib/1.10/json-glib-1.10.6.tar.xz;name=archive file://run-ptest"
packages/core2-64-poky-linux/json-glib: PV changed from "1.10.0" to "1.10.6"
packages/core2-64-poky-linux/json-glib: PKGV changed from 1.10.0 [default] to 1.10.6 [default]
Changes to packages/core2-64-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.1000.0 to libjson-glib-1.0.so.0.1000.6
  /usr/lib/libjson-glib-1.0.so.0.1000.0 moved to /usr/lib/libjson-glib-1.0.so.0.1000.6

--===============5740197623071474119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.1000.0", added "/usr/lib/libjson-glib-1.0.so.0.1000.6"
Changes to packages/core2-64-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.1000.0 to libjson-glib-1.0.so.0.1000.6
  /usr/lib/libjson-glib-1.0.so.0.1000.0 moved to /usr/lib/libjson-glib-1.0.so.0.1000.6

--===============5740197623071474119==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-glib-upgrade-1.10.0-1.10.6.patch"

RnJvbSBlZWRkMTQ3MzgyZDM3MGI3MjlkZjBmODAyYmUwZjA0NmUwYzAxZWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDc6NTE6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
c29uLWdsaWI6IHVwZ3JhZGUgMS4xMC4wIC0+IDEuMTAuNgoKLS0tCiAuLi4vanNvbi1nbGliL3tq
c29uLWdsaWJfMS4xMC4wLmJiID0+IGpzb24tZ2xpYl8xLjEwLjYuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ25vbWUvanNvbi1nbGliL3tqc29uLWdsaWJfMS4xMC4wLmJiID0+IGpzb24tZ2xp
Yl8xLjEwLjYuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2pzb24t
Z2xpYi9qc29uLWdsaWJfMS4xMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9q
c29uLWdsaWJfMS4xMC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1nbm9tZS9qc29uLWdsaWIvanNvbi1nbGliXzEuMTAuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9qc29uLWdsaWJfMS4xMC42LmJiCmluZGV4IDMzMmU4
YjY1YzMuLjhiMDA5YmMxN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWds
aWIvanNvbi1nbGliXzEuMTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvanNvbi1nbGli
L2pzb24tZ2xpYl8xLjEwLjYuYmIKQEAgLTE5LDcgKzE5LDcgQEAgR0lET0NHRU5fTUVTT05fRU5B
QkxFX0ZMQUcgPSAnZW5hYmxlZCcKIEdJRE9DR0VOX01FU09OX0RJU0FCTEVfRkxBRyA9ICdkaXNh
YmxlZCcKIAogU1JDX1VSSSArPSAiIGZpbGU6Ly9ydW4tcHRlc3QiCi1TUkNfVVJJW2FyY2hpdmUu
c2hhMjU2c3VtXSA9ICIxYmNhOGQ2NmQ5NjEwNmVjYzE0N2RmMzEzM2I5NWE1YmI3ODRmMWZhNmYx
NWQwNmRkN2MxYThmYjRhMTBhZjdiIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNzdm
NGJjYmY5MzM5NTI4ZjE2NmI4MDczNDU4NjkzZjBhMjBiNzdiNzA1OWRiYzJkYjYxNzQ2YTE5Mjhi
MDI5MyIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9F
TkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9IgogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10g
PSAiLURtYW49dHJ1ZSwtRG1hbj1mYWxzZSxsaWJ4c2x0LW5hdGl2ZSB4bWx0by1uYXRpdmUgcHl0
aG9uMy1kb2N1dGlscy1uYXRpdmUiCi0tIAoyLjQ0LjEKCg==

--===============5740197623071474119==--

