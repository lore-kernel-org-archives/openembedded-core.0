Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE199C3600D
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7055.1740828325278188373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EFtMNwli;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DCPMlsjr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019551744fe3-42fe5993-7029-4144-8196-e8eda32d0595-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ejq25pI9CD+0q9iLrCnmqSbnHeHuhkcnIG+Y4X7G7Ms=;
	b=EFtMNwliC5gUMtkTVt4dR381UsHlrHpCa0rx/pIiI3owPwLC+GgBDlEzjh4egXXQ
	qRJtKNa0cxtcLyrXt1kBvlRmge7bJq17lso8VGZ1efB1nqjYrJ40hX7GDBH2Uh0Xp4W
	TwsLdyGKizBbMn5RqVJ3pyLtSXPwb41rD9uYzuK0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ejq25pI9CD+0q9iLrCnmqSbnHeHuhkcnIG+Y4X7G7Ms=;
	b=DCPMlsjrDxHpDmzgGd4NTKDqxXqu69FrG/AfNTbC+Yg7eEdXADsKf20t2EyknLP4
	iUBSTOFPPXRa8Gob5uWuGpaNkann1yEMxi1/tkYTamkluuCqGjomN21vdaPJFG908gD
	3IWH+OAZyxzOHMpgW+puU1zU0GbHsA/vG1FnyJAY=
Content-Type: multipart/mixed; boundary="===============4190757133298094440=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gcr: upgrading to 4.3.91 SUCCEEDED
Message-ID: <0101019551744fe3-42fe5993-7029-4144-8196-e8eda32d0595-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212148

--===============4190757133298094440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gcr* to *4.3.91* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gcr-upgrade-4.3.0-4.3.91.patch
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
From 69be1ff1fe7d82add9b94df8cc149536fd9a0da3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 09:25:53 +0000
Subject: [PATCH] gcr: upgrade 4.3.0 -> 4.3.91

---
 meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.3.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.3.91.bb
index dcd8658d9c..a76e8d486a 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c3ee8728e4364b0397f435fa20f92f901ab139d2b264f4e059d67b3c0f43cd36"
+SRC_URI[archive.sha256sum] = "9d326ed3d78ad0eafb0848395a068adbefdeb6cff04ec5615cb3ef767d933990"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.44.1


--===============4190757133298094440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcr/gcr-dbg: FILELIST: removed "/usr/lib/.debug/libgck-2.so.2.3.0 /usr/lib/.debug/libgcr-4.so.4.3.0", added "/usr/lib/.debug/libgck-2.so.2.3.91 /usr/lib/.debug/libgcr-4.so.4.3.91"
packages/core2-64-poky-linux/gcr/gcr-dbg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-dbg: PKGSIZE changed from 2617696 to 2812208 (+7%)
packages/core2-64-poky-linux/gcr/gcr-dbg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-dev: FILELIST: added "/usr/include/gcr-4/gcr/gcr-subject-public-key-info.h /usr/include/gcr-4/gcr/gcr-certificate-extension-list.h /usr/include/gcr-4/gcr/gcr-certificate-extensions.h /usr/include/gcr-4/gcr/gcr-certificate-extension.h"
packages/core2-64-poky-linux/gcr/gcr-dev: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-dev: PKGSIZE changed from 1164540 to 1256063 (+8%)
packages/core2-64-poky-linux/gcr/gcr-dev: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-doc: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-doc: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ab: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ab: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-af: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-af: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ar: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ar: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-as: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-as: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ast: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ast: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-az: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-az: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-be+latin: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-be+latin: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-be: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-be: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bg: PKGSIZE changed from 14442 to 14546 (+1%)
packages/core2-64-poky-linux/gcr/gcr-locale-bg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bn-in: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bn-in: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bs: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bs: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ca+valencia: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ca+valencia: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ca: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ca: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ckb: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ckb: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-cs: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-cs: PKGSIZE changed from 11674 to 11912 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-cs: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-cy: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-cy: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-da: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-da: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-de: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-de: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-dz: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-dz: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-el: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-el: PKGSIZE changed from 21945 to 14731 (-33%)
packages/core2-64-poky-linux/gcr/gcr-locale-el: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-en+shaw: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-en+shaw: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-en-ca: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-en-ca: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-en-gb: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-en-gb: PKGSIZE changed from 11224 to 11218 (-0%)
packages/core2-64-poky-linux/gcr/gcr-locale-en-gb: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-eo: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-eo: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-es: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-es: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-et: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-et: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-eu: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-eu: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fa: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fa: PKGSIZE changed from 13251 to 13517 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-fa: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fi: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fi: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fur: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fur: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ga: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ga: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-gl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-gl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-gu: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-gu: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-he: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-he: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PKGSIZE changed from 22002 to 15935 (-28%)
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-hr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-hr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-hu: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-hu: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-id: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-id: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ie: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ie: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-is: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-is: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-it: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-it: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ja: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ja: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ka: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ka: PKGSIZE changed from 17109 to 17519 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-ka: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PKGSIZE changed from 4213 to 6402 (+52%)
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-kk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-kk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-kn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-kn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ko: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ko: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-lt: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-lt: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-lv: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-lv: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mai: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mai: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ml: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ml: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ms: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ms: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-nb: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-nb: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PKGSIZE changed from 13348 to 16449 (+23%)
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-nl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-nl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-nn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-nn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-oc: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-oc: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-or: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-or: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pa: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pa: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pt-br: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pt-br: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pt: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pt: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ro: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ro: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ru: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ru: PKGSIZE changed from 14540 to 14846 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-ru: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-rw: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-rw: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-si: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-si: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PKGSIZE changed from 18051 to 11805 (-35%)
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sl: PKGSIZE changed from 11467 to 12012 (+5%)
packages/core2-64-poky-linux/gcr/gcr-locale-sl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sq: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sq: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PKGSIZE changed from 15805 to 11493 (-27%)
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PKGSIZE changed from 11507 to 14045 (+22%)
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sv: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sv: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ta: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ta: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-te: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-te: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-tg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-tg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-th: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-th: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-tr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-tr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ug: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ug: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-uk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-uk: PKGSIZE changed from 14304 to 14620 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-uk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-vi: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-vi: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-xh: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-xh: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-zh-cn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-zh-cn: PKGSIZE changed from 10946 to 11155 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-zh-cn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-zh-hk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-zh-hk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-zh-tw: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-zh-tw: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-src: FILELIST: directory renamed /usr/src/debug/gcr/4.3.0/gck -> /usr/src/debug/gcr/4.3.91/gck, directory renamed /usr/src/debug/gcr/4.3.0/tools/viewer -> /usr/src/debug/gcr/4.3.91/tools/viewer, removed "/usr/src/debug/gcr/4.3.0/gcr/gcr-importer.h /usr/src/debug/gcr/4.3.0/egg/egg-asn1x.c /usr/src/debug/gcr/4.3.0/egg/egg-asn1x.h /usr/src/debug/gcr/4.3.0/gcr/gcr-importer.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-request.c /usr/src/debug/gcr/4.3.0/egg/egg-asn1-defs.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-request.h /usr/src/debug/gcr/4.3.0/egg/egg-hkdf-libgcrypt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompter.c /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompter.h /usr/src/debug/gcr/4.3.0/egg/pk.asn.h /usr/src/debug/gcr/4.3.0/gcr/gcr-callback-output-stream.c /usr/src/debug/gcr/4.3.0/gcr/gcr-callback-output-stream.h /usr/src/debug/gcr/4.3.0/gcr/gcr-util.h /usr/src/debug/gcr/4.3.0/gcr/gcr-util.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-c
 hain.c /usr/src/debug/gcr/4.3.0/gcr/gcr-openpgp.h /usr/src/debug/gcr/4.3.0/egg/egg-openssl.h /usr/src/debug/gcr/4.3.0/gcr/gcr-marshal.h /usr/src/debug/gcr/4.3.0/gcr/gcr-openssh.h /usr/src/debug/gcr/4.3.0/egg/egg-hkdf.h /usr/src/debug/gcr/4.3.0/egg/egg-openssl.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-chain.h /usr/src/debug/gcr/4.3.0/gcr/gcr-marshal.c /usr/src/debug/gcr/4.3.0/egg/pkix.asn.h /usr/src/debug/gcr/4.3.0/gcr/gcr-openpgp.c /usr/src/debug/gcr/4.3.0/gcr/gcr-openssh.c /usr/src/debug/gcr/4.3.0/gcr/gcr-mock-prompter.c /usr/src/debug/gcr/4.3.0/gcr/gcr-parser-libgcrypt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompt.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-field-private.h /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompt.c /usr/src/debug/gcr/4.3.0/egg/egg-error.h /usr/src/debug/gcr/4.3.0/gcr/gcr-key-mechanisms.c /usr/src/debug/gcr/4.3.0/gcr/gcr-key-mechanisms.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-field.h /usr/src/debug/gcr/4.3.0/gcr/gcr-simple-certificate.h /usr/
 src/debug/gcr/4.3.0/gcr/gcr-simple-certificate.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-field.c /usr/src/debug/gcr/4.3.0/gcr/gcr-trust.c /usr/src/debug/gcr/4.3.0/egg/egg-crypto.h /usr/src/debug/gcr/4.3.0/egg/egg-symkey.h /usr/src/debug/gcr/4.3.0/egg/egg-symkey.c /usr/src/debug/gcr/4.3.0/gcr/gcr-trust.h /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-importer.h /usr/src/debug/gcr/4.3.0/egg/egg-armor.h /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-importer.c /usr/src/debug/gcr/4.3.0/egg/egg-armor.c /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-process.c /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-process.h /usr/src/debug/gcr/4.3.0/gcr/gcr-import-interaction.h /usr/src/debug/gcr/4.3.0/gcr/gcr-import-interaction.c /usr/src/debug/gcr/4.3.0/gcr/gcr-dbus-generated.c /usr/src/debug/gcr/4.3.0/gcr/gcr-dbus-generated.h /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-records.c /usr/src/debug/gcr/4.3.0/gcr/gcr-oids.c /usr/src/debug/gcr/4.3.0/gcr/gcr-oids.h /usr/src/debug/gcr/4.3.0/gcr/gcr-subject-public-key.h /usr/src/debug/g
 cr/4.3.0/gcr/gcr-enum-types.h /usr/src/debug/gcr/4.3.0/gcr/gcr-subject-public-key.c /usr/src/debug/gcr/4.3.0/gcr/gcr-enum-types.c /usr/src/debug/gcr/4.3.0/egg/egg-oid.c /usr/src/debug/gcr/4.3.0/egg/egg-libgcrypt.c /usr/src/debug/gcr/4.3.0/egg/egg-oid.h /usr/src/debug/gcr/4.3.0/egg/egg-libgcrypt.h /usr/src/debug/gcr/4.3.0/gcr/gcr-library.h /usr/src/debug/gcr/4.3.0/egg/egg-decimal.h /usr/src/debug/gcr/4.3.0/egg/egg-padding.h /usr/src/debug/gcr/4.3.0/gcr/gcr-internal.h /usr/src/debug/gcr/4.3.0/egg/egg-decimal.c /usr/src/debug/gcr/4.3.0/egg/egg-padding.c /usr/src/debug/gcr/4.3.0/gcr/gcr-fingerprint.h /usr/src/debug/gcr/4.3.0/gcr/gcr-library.c /usr/src/debug/gcr/4.3.0/gcr/gcr-fingerprint.c /usr/src/debug/gcr/4.3.0/egg/egg-crypto-libgcrypt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-types.h /usr/src/debug/gcr/4.3.0/egg/egg-secure-memory.c /usr/src/debug/gcr/4.3.0/gcr/gcr-secure-memory.c /usr/src/debug/gcr/4.3.0/egg/egg-secure-memory.h /usr/src/debug/gcr/4.3.0/gcr/gcr-pkcs11-certificate.h /usr/src/
 debug/gcr/4.3.0/gcr/gcr-pkcs11-certificate.c /usr/src/debug/gcr/4.3.0/egg/egg-buffer.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-section.h /usr/src/debug/gcr/4.3.0/gcr/gcr-parser.h /usr/src/debug/gcr/4.3.0/gcr/gcr-prompt.h /usr/src/debug/gcr/4.3.0/gcr/gcr-record.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate.c /usr/src/debug/gcr/4.3.0/egg/egg-buffer.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-section.c /usr/src/debug/gcr/4.3.0/gcr/gcr-parser.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate.h /usr/src/debug/gcr/4.3.0/gcr/gcr-prompt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-record.c /usr/src/debug/gcr/4.3.0/egg/egg-dn.h /usr/src/debug/gcr/4.3.0/egg/egg-hex.c /usr/src/debug/gcr/4.3.0/gcr/gcr-ssh-askpass.c /usr/src/debug/gcr/4.3.0/egg/egg-hex.h /usr/src/debug/gcr/4.3.0/egg/egg-dh-libgcrypt.c /usr/src/debug/gcr/4.3.0/egg/egg-dn.c /usr/src/debug/gcr/4.3.0/gcr/gcr-ssh-askpass.h /usr/src/debug/gcr/4.3.0/gcr/gcr-secret-exchange.c /usr/src/debug/gcr/4.3.0/gcr/gcr-secret-exchange.h /usr/src/debug
 /gcr/4.3.0/gcr/gcr-certificate-extensions.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-extensions.h /usr/src/debug/gcr/4.3.0/gcr/gcr-pkcs11-importer.c /usr/src/debug/gcr/4.3.0/egg/egg-dh.h /usr/src/debug/gcr/4.3.0/gcr/gcr-pkcs11-importer.h /usr/src/debug/gcr/4.3.0/egg/egg-dh.c", added "/usr/src/debug/gcr/4.3.91/gcr/gcr-record.c /usr/src/debug/gcr/4.3.91/gcr/gcr-prompt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-importer.h /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompt.h /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-importer.c /usr/src/debug/gcr/4.3.91/gcr/gcr-parser.h /usr/src/debug/gcr/4.3.91/gcr/gcr-prompt.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-subject-alt-name.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extensions-private.h /usr/src/debug/gcr/4.3.91/egg/pkix.asn.h /usr/src/debug/gcr/4.3.91/egg/egg-buffer.c /usr/src/debug/gcr/4.3.91/egg/egg-symkey.c /usr/src/debug/gcr/4.3.91/gcr/gcr-secret-exchange.h /usr/src/debu
 g/gcr/4.3.91/gcr/gcr-certificate-extension-certificate-policies.c /usr/src/debug/gcr/4.3.91/egg/egg-buffer.h /usr/src/debug/gcr/4.3.91/egg/egg-crypto.h /usr/src/debug/gcr/4.3.91/egg/egg-symkey.h /usr/src/debug/gcr/4.3.91/gcr/gcr-secret-exchange.c /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key-info-private.h /usr/src/debug/gcr/4.3.91/gcr/gcr-util.h /usr/src/debug/gcr/4.3.91/egg/egg-padding.c /usr/src/debug/gcr/4.3.91/gcr/gcr-util.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-crl-distribution-points.c /usr/src/debug/gcr/4.3.91/egg/egg-padding.h /usr/src/debug/gcr/4.3.91/gcr/gcr-parser-libgcrypt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-authority-key-identifier.c /usr/src/debug/gcr/4.3.91/gcr/gcr-key-mechanisms.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-list-private.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-request.h /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-process.h /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-importer.h /usr/src/debug
 /gcr/4.3.91/gcr/gcr-key-mechanisms.h /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-process.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-request.c /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-importer.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-private.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extensions.h /usr/src/debug/gcr/4.3.91/egg/egg-dh.c /usr/src/debug/gcr/4.3.91/egg/egg-dh.h /usr/src/debug/gcr/4.3.91/gcr/gcr-ssh-askpass.c /usr/src/debug/gcr/4.3.91/gcr/gcr-ssh-askpass.h /usr/src/debug/gcr/4.3.91/egg/egg-decimal.h /usr/src/debug/gcr/4.3.91/egg/egg-openssl.h /usr/src/debug/gcr/4.3.91/gcr/gcr-dbus-generated.c /usr/src/debug/gcr/4.3.91/egg/egg-decimal.c /usr/src/debug/gcr/4.3.91/egg/egg-openssl.c /usr/src/debug/gcr/4.3.91/gcr/gcr-dbus-generated.h /usr/src/debug/gcr/4.3.91/gcr/gcr-callback-output-stream.h /usr/src/debug/gcr/4.3.91/gcr/gcr-callback-output-stream.c /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key-info.h /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-publi
 c-key-info.c /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-records.c /usr/src/debug/gcr/4.3.91/gcr/gcr-mock-prompter.c /usr/src/debug/gcr/4.3.91/egg/egg-secure-memory.c /usr/src/debug/gcr/4.3.91/gcr/gcr-marshal.h /usr/src/debug/gcr/4.3.91/egg/egg-asn1-defs.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-section.c /usr/src/debug/gcr/4.3.91/gcr/gcr-marshal.c /usr/src/debug/gcr/4.3.91/egg/egg-secure-memory.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-section.h /usr/src/debug/gcr/4.3.91/egg/egg-hkdf.h /usr/src/debug/gcr/4.3.91/gcr/gcr-importer.h /usr/src/debug/gcr/4.3.91/gcr/gcr-importer.c /usr/src/debug/gcr/4.3.91/egg/egg-crypto-libgcrypt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-chain.h /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate.h /usr/src/debug/gcr/4.3.91/gcr/gcr-secure-memory.c /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificat
 e-chain.c /usr/src/debug/gcr/4.3.91/egg/egg-dh-libgcrypt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-certificate.c /usr/src/debug/gcr/4.3.91/gcr/gcr-simple-certificate.c /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-certificate.h /usr/src/debug/gcr/4.3.91/gcr/gcr-simple-certificate.h /usr/src/debug/gcr/4.3.91/egg/pk.asn.h /usr/src/debug/gcr/4.3.91/gcr/gcr-trust.h /usr/src/debug/gcr/4.3.91/gcr/gcr-types.h /usr/src/debug/gcr/4.3.91/gcr/gcr-trust.c /usr/src/debug/gcr/4.3.91/gcr/gcr-oids.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-field.c /usr/src/debug/gcr/4.3.91/gcr/gcr-oids.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-field.h /usr/src/debug/gcr/4.3.91/egg/egg-hex.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-subject-key-identifier.c /usr/src/debug/gcr/4.3.91/egg/egg-fips-libgcrypt.c /usr/src/debug/gcr/4.3.91/egg/egg-hkdf-libgcrypt.c /usr/src/debug/gcr/4.3.91/egg/egg-hex.c /usr/src/debug/gcr/4.3.91/gcr/gcr-internal.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension
 -basic-constraints.c /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompter.h /usr/src/debug/gcr/4.3.91/egg/egg-fips.h /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompter.c /usr/src/debug/gcr/4.3.91/egg/egg-dn.h /usr/src/debug/gcr/4.3.91/gcr/gcr-enum-types.h /usr/src/debug/gcr/4.3.91/gcr/gcr-openpgp.h /usr/src/debug/gcr/4.3.91/gcr/gcr-enum-types.c /usr/src/debug/gcr/4.3.91/egg/egg-dn.c /usr/src/debug/gcr/4.3.91/gcr/gcr-openpgp.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-field-private.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-list.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-list.c /usr/src/debug/gcr/4.3.91/egg/egg-oid.h /usr/src/debug/gcr/4.3.91/gcr/gcr-openssh.c /usr/src/debug/gcr/4.3.91/egg/egg-oid.c /usr/src/debug/gcr/4.3.91/gcr/gcr-openssh.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extensions-common.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension.c /usr/src/debug/gcr/4.3.91/gcr/gcr-library.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-e
 xtension-key-usage.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-extended-key-usage.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension.h /usr/src/debug/gcr/4.3.91/gcr/gcr-library.h /usr/src/debug/gcr/4.3.91/egg/egg-libgcrypt.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-authority-info-access.c /usr/src/debug/gcr/4.3.91/egg/egg-libgcrypt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-fingerprint.h /usr/src/debug/gcr/4.3.91/egg/egg-armor.c /usr/src/debug/gcr/4.3.91/egg/egg-asn1x.c /usr/src/debug/gcr/4.3.91/gcr/gcr-import-interaction.c /usr/src/debug/gcr/4.3.91/egg/egg-armor.h /usr/src/debug/gcr/4.3.91/egg/egg-asn1x.h /usr/src/debug/gcr/4.3.91/egg/egg-error.h /usr/src/debug/gcr/4.3.91/gcr/gcr-fingerprint.c /usr/src/debug/gcr/4.3.91/gcr/gcr-import-interaction.h /usr/src/debug/gcr/4.3.91/gcr/gcr-parser.c /usr/src/debug/gcr/4.3.91/gcr/gcr-record.h"
packages/core2-64-poky-linux/gcr/gcr-src: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-src: PKGSIZE changed from 1828826 to 1955317 (+7%)
packages/core2-64-poky-linux/gcr/gcr-src: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-staticdev: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-staticdev: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr: FILELIST: removed "/usr/lib/libgck-2.so.2.3.0 /usr/lib/libgcr-4.so.4.3.0", added "/usr/lib/libgck-2.so.2.3.91 /usr/lib/libgcr-4.so.4.3.91"
packages/core2-64-poky-linux/gcr/gcr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr: PKGSIZE changed from 979726 to 1034100 (+6%)
packages/core2-64-poky-linux/gcr/gcr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr: SRC_URI changed from "https://download.gnome.org/sources//gcr/4.3/gcr-4.3.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gcr/4.3/gcr-4.3.91.tar.xz;name=archive"
packages/core2-64-poky-linux/gcr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
Changes to packages/core2-64-poky-linux/gcr (sysroot):
  /usr/lib/libgck-2.so.2 changed symlink target from libgck-2.so.2.3.0 to libgck-2.so.2.3.91
  /usr/lib/libgcr-4.so.4 changed symlink target from libgcr-4.so.4.3.0 to libgcr-4.so.4.3.91
  /usr/include/gcr-4/gcr/gcr-certificate-extension.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extension-list.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extensions.h was added
  /usr/include/gcr-4/gcr/gcr-subject-public-key-info.h was added
  /usr/lib/libgck-2.so.2.3.91 was added
  /usr/lib/libgcr-4.so.4.3.91 was added
  /usr/lib/libgck-2.so.2.3.0 was removed
  /usr/lib/libgcr-4.so.4.3.0 was removed

--===============4190757133298094440==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gcr-upgrade-4.3.0-4.3.91.patch"

RnJvbSA2OWJlMWZmMWZlN2Q4MmFkZDliOTRkZjhjYzE0OTUzNmZkOWEwZGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwOToyNTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdj
cjogdXBncmFkZSA0LjMuMCAtPiA0LjMuOTEKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2djci97
Z2NyXzQuMy4wLmJiID0+IGdjcl80LjMuOTEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2dj
ci97Z2NyXzQuMy4wLmJiID0+IGdjcl80LjMuOTEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdub21lL2djci9nY3JfNC4zLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2Ny
L2djcl80LjMuOTEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWdub21lL2djci9nY3JfNC4zLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9n
Y3IvZ2NyXzQuMy45MS5iYgppbmRleCBkY2Q4NjU4ZDljLi5hNzZlOGQ0ODZhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2NyL2djcl80LjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z25vbWUvZ2NyL2djcl80LjMuOTEuYmIKQEAgLTE4LDcgKzE4LDcgQEAgaW5oZXJpdCBnbm9tZWJh
c2UgZ3RrLWljb24tY2FjaGUgZ2ktZG9jZ2VuIGZlYXR1cmVzX2NoZWNrIHZhbGEgZ29iamVjdC1p
bnRyb3NwZWMKIAogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIiR7QGJiLnV0aWxzLmNvbnRh
aW5zKCdESVNUUk9fRkVBVFVSRVMnLCAneDExJywgJ29wZW5nbCcsICcnLCBkKX0iCiAKLVNSQ19V
UklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImMzZWU4NzI4ZTQzNjRiMDM5N2Y0MzVmYTIwZjkyZjkw
MWFiMTM5ZDJiMjY0ZjRlMDU5ZDY3YjNjMGY0M2NkMzYiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2
c3VtXSA9ICI5ZDMyNmVkM2Q3OGFkMGVhZmIwODQ4Mzk1YTA2OGFkYmVmZGViNmNmZjA0ZWM1NjE1
Y2IzZWY3NjdkOTMzOTkwIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKIAkke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgZCl9IFwKLS0gCjIuNDQuMQoK

--===============4190757133298094440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1882 targets, 50 skipped, 0 masked, 0 errors.
Removing 124 recipes from the core2-64 sysroot...done.
Removing 123 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:dd91df54a8475ad1168b6a04b070cb54e3528075"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 986 Local 884 Mirrors 0 Missed 102 Current 441 (89% match, 92% complete)
Removing 9 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 517 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_populate_lic_setscene)
NOTE: Running setscene task 583 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 592 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 608 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 619 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 622 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 633 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 636 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 637 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcr-4.3.91-r0: task do_populate_lic_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 649 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: Running setscene task 650 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 657 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 658 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe gcr-4.3.91-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.17.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 671 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 675 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 679 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.82.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-native-4.17.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 690 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 696 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcr-4.3.91-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 697 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcr-4.3.91-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 705 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 707 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.16.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 708 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 724 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.82.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 737 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cargo-native-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 747 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 754 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 755 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 759 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 761 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 766 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 767 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 770 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 776 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.82.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 784 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.16.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 787 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 793 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.16.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 796 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: recipe rust-native-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 801 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 802 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 803 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/orc/0.4.40/temp/log.do_packagedata_setscene.111583
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.82.0.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-native-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 838 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 839 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 841 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 850 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 855 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 857 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 862 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_package_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 866 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 879 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 880 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 895 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 896 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 902 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 906 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 908 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 909 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.56.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 917 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 918 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 924 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 926 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 932 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 935 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 936 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 943 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 951 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 954 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 956 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running setscene task 957 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 958 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.56.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 959 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 960 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 963 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 964 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 965 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 977 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 984 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 986 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 991 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 994 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 998 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 999 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1002 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1006 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1007 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1012 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.40-r0: task do_package_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1017 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1018 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1021 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1028 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1029 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_package_setscene)
NOTE: Running setscene task 1030 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1039 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1044 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1049 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1053 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1054 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1055 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1057 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1060 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1065 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1068 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1069 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1072 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1074 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1078 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1080 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1081 of 1427 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1082 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1083 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1085 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1087 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1088 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1089 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1091 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1092 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1094 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1097 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1099 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1101 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-10.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1102 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1106 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1108 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1110 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1112 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1117 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1118 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1124 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1128 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1131 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1132 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1137 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1138 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1139 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1143 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1144 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1145 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1147 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1148 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1156 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1157 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1158 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1160 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1162 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1163 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1166 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1181 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1183 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1184 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1189 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1190 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1192 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1193 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1194 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1196 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1200 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1209 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1211 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1212 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1215 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1217 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1222 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1224 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1225 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1227 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1228 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1230 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1232 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1234 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1235 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1236 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1237 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1239 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1240 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1241 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1245 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1246 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1247 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1249 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1250 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1251 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1252 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1258 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1260 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1263 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1265 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1266 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1269 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1270 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1271 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1274 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1061 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1278 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1280 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1282 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1285 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1287 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1144 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1146 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_fetch: Started
NOTE: Running setscene task 1289 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1209 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_fetch)
NOTE: recipe dbus-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1229 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1269 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 1317 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: Running task 1324 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1327 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 1355 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: Running task 1361 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_unpack: Started
NOTE: Running setscene task 1291 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_fetch: Started
NOTE: Running task 1394 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_fetch)
NOTE: Running task 1401 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_fetch: Succeeded
NOTE: Running task 1416 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 1417 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_unpack)
NOTE: Running task 1420 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1293 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1294 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1421 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_fetch: Started
NOTE: Running task 1444 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe libical-3.0.19-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.2-r0: task do_write_config: Started
NOTE: Running task 1460 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1472 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_fetch)
NOTE: Running task 1473 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_fetch)
NOTE: Running task 1480 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_fetch)
NOTE: Running task 1485 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_unpack)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1297 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: Running setscene task 1298 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1299 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe libical-3.0.19-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1300 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Started
NOTE: recipe bluez5-5.79-r0: task do_fetch: Started
NOTE: recipe pango-1.56.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_unpack: Started
NOTE: Running setscene task 1301 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1302 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1303 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1305 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1306 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1307 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1308 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1310 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1311 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1313 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1314 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1316 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1318 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1319 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1321 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1322 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1323 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1325 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1329 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1331 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1335 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1336 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1337 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1338 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1339 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1341 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1342 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1343 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1349 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1353 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1355 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1356 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1358 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1359 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1362 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1363 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1365 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1368 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1369 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1370 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1372 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1375 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1548 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1549 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: Running task 1551 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_patch)
NOTE: Running task 1552 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_patch)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1553 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: Running task 1554 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1379 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1569 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1381 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1384 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1385 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe libical-3.0.19-r0: task do_patch: Started
NOTE: Running task 1609 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: Running task 1623 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_write_config)
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1387 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: Running task 1659 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_unpack)
NOTE: Running task 1660 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_unpack)
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1673 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1707 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: Running task 1714 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_patch)
NOTE: Running task 1732 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1389 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1390 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1392 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.79-r0: task do_unpack: Started
NOTE: recipe libical-3.0.19-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_unpack: Started
NOTE: Running task 1781 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_write_config)
NOTE: Running task 1802 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1848 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_generate_toolchain_file)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1859 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_write_config)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1394 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_write_config: Started
NOTE: Running task 1912 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.1-r0: task do_write_config: Started
NOTE: Running task 1972 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe harfbuzz-10.2.0-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Started
NOTE: Running task 2025 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Started
NOTE: Running task 2037 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_fetch)
NOTE: Running task 2038 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe pango-1.56.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_unpack: Succeeded
NOTE: Running task 2067 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_patch)
NOTE: Running task 2081 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_fetch)
NOTE: Running task 2083 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe bluez5-5.79-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2125 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_fetch)
NOTE: Running setscene task 1396 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1397 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1398 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2134 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_patch)
NOTE: Running task 2135 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_unpack)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_patch: Started
NOTE: Running task 2137 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 2138 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2160 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 2161 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_unpack)
NOTE: Running task 2168 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_fetch: Started
NOTE: recipe pango-1.56.1-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_fetch: Succeeded
NOTE: Running task 2173 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2179 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2181 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_unpack)
NOTE: recipe bluez5-5.79-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1399 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_unpack: Started
NOTE: Running setscene task 1402 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 2188 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2189 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_write_config)
NOTE: Running task 2190 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_unpack: Started
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2198 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2199 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_unpack: Succeeded
NOTE: Running task 2201 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_fetch)
NOTE: Running task 2202 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2203 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: Running task 2207 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 2225 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_write_config)
NOTE: Running task 2226 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe bluez5-5.79-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1406 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1407 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2263 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: Running task 2266 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_patch: Succeeded
NOTE: Running task 2302 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2304 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_write_config: Started
NOTE: Running task 2305 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_patch)
NOTE: Running task 2306 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 2323 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_write_config: Started
NOTE: Running task 2362 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: Running task 2364 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.91-r0: task do_fetch: Started
NOTE: recipe gcr-4.3.91-r0: task do_fetch: Succeeded
NOTE: Running task 2495 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_unpack)
NOTE: recipe gtk4-4.16.12-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1408 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1410 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1412 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2522 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: Running task 2524 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_unpack: Succeeded
NOTE: Running task 2525 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2526 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.3.91-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe gcr-4.3.91-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe gcr-4.3.91-r0: task do_write_config: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1416 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1417 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1419 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe gcr-4.3.91-r0: task do_unpack: Succeeded
NOTE: Running task 2664 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcr-4.3.91-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_patch: Succeeded
NOTE: recipe gcr-4.3.91-r0: task do_patch: Succeeded
NOTE: Running task 2684 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2686 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe gcr-4.3.91-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: Running task 2687 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe gtk4-4.16.12-r0: task do_unpack: Succeeded
NOTE: Running task 2688 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_patch)
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: recipe gcr-4.3.91-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_deploy_source_date_epoch unihash changed to d51a64b1503612fcfb814df2dd72cdc952e7c05522716db1b0e4d4f5ba396e71
NOTE: recipe gtk4-4.16.12-r0: task do_patch: Started
NOTE: recipe gtk4-4.16.12-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1421 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1425 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1426 of 1427 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3120 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3148 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3188 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3212 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3239 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3293 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3310 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3466 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3491 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3527 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3544 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata)
NOTE: Running task 3557 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_collect_spdx_deps)
NOTE: Running task 3563 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3628 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.40-r0: task do_packagedata: Started
NOTE: Running task 3629 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.18.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3630 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3631 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3634 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Started
NOTE: recipe orc-0.4.40-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3639 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3640 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_configure)
NOTE: recipe cairo-1.18.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3641 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_configure)
NOTE: Running task 3657 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3658 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3670 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure: Started
NOTE: Running task 3671 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3672 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3673 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3674 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: Running task 3675 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: Running task 3701 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: Running task 3703 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3704 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3709 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3710 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3722 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3725 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Succeeded
NOTE: Running task 3726 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_patch)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Succeeded
NOTE: Running task 3728 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 3729 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3730 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 3731 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 3732 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3733 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3734 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: Running task 3735 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_configure: Succeeded
NOTE: Running task 3736 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_compile: Started
NOTE: recipe cairo-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3737 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_compile: Started
NOTE: Running task 3738 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 3739 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure: Succeeded
NOTE: Running task 3740 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_configure_ptest_base)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3741 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_compile)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 3742 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3743 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: Running task 3744 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to 1eb0c930ae87cd3322ebe39329138c6ca50a4d528a193a85d0b0dcb13b1d4a8e
NOTE: Setscene tasks completed
NOTE: Running task 3745 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 3746 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: Running task 3747 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3748 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: Running task 3749 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: Running task 3750 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: Running task 3751 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 3752 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 8557ee9582a39f55fc4b83d5ed1a6f305205837da66da9e568b666f30c9e2586
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3753 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: Running task 3754 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3755 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3756 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3757 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3758 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: Running task 3759 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3760 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_install)
NOTE: recipe cairo-1.18.2-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 3761 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Succeeded
NOTE: Running task 3762 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_install: Succeeded
NOTE: Running task 3763 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_populate_sysroot)
NOTE: Running task 3764 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_package)
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3765 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_package: Started
NOTE: recipe cairo-1.18.2-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 3767 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3768 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 3769 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_package)
NOTE: Running task 3770 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libusb1-1.0.27-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 3771 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe cairo-1.18.2-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install: Succeeded
NOTE: Running task 3772 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3773 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3774 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 3775 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot)
NOTE: Running task 3776 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_package)
NOTE: recipe harfbuzz-10.2.0-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 639f31ce41657a15652556f2c7fbdc511551843ce8dfc6ada2e97e28a5d32428
NOTE: Setscene tasks completed
NOTE: Running task 3777 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: Running task 3778 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3779 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Running task 3780 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 7d7ac7d8b429c5bbc86731f55daa0f77350d913b50d5e3c7be0b2ae13696a994
NOTE: recipe cairo-1.18.2-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3781 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata)
NOTE: Running task 3782 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_package: Succeeded
NOTE: Running task 3783 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata)
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata unihash changed to 6be68f70331dbeea91705e3a9c945bacf57175a9d28f7c931c59fd01b44f50d6
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Succeeded
NOTE: Running task 3784 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata unihash changed to 9446d6247b0d1790f913a6d1a8b44e30f1e13f305680b1f6eca55f7011d7607f
NOTE: Setscene tasks completed
NOTE: Running task 3785 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx)
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Succeeded
NOTE: Running task 3786 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3787 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to a022f1f3d99e88e28aff433d6539c3af940c12efa3496c919c3f69729d3d16f7
NOTE: Setscene tasks completed
NOTE: Running task 3788 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe harfbuzz-10.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3789 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3790 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile: Succeeded
NOTE: Running task 3791 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3792 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 3793 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3794 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_package: Succeeded
NOTE: Running task 3795 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install: Succeeded
NOTE: Running task 3796 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3797 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_populate_sysroot)
NOTE: Running task 3798 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_packagedata unihash changed to 7f8092f5677da7cd14bcd0dd192cbbd5d41347d8540c1c8968c22680b8fd8e90
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3799 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 3800 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3801 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: Running task 3802 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_package: Succeeded
NOTE: Running task 3803 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_packagedata unihash changed to 1c2443b652aec67d71ecc65e81dedf25a10d6bd42705082116bad030f9265f04
NOTE: Setscene tasks completed
NOTE: Running task 3804 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Succeeded
NOTE: Running task 3805 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.12-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata unihash changed to ccb54fc768e2102cb4a8afbb68af920cb48f5a50563e906d6a7025ff75206187
NOTE: Setscene tasks completed
NOTE: Running task 3806 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Running task 3807 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 3808 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: Running task 3809 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3810 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3811 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_configure)
NOTE: recipe libical-3.0.19-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 3812 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to cd2d78881f739b2bc3f91e4f4d17dda5ecd7374aa6d6a853c3c305c1645efc31
NOTE: Setscene tasks completed
NOTE: Running task 3813 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3814 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3815 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_compile)
NOTE: recipe libical-3.0.19-r0: task do_compile: Started
NOTE: recipe libical-3.0.19-r0: task do_compile: Succeeded
NOTE: Running task 3816 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_install)
NOTE: recipe libical-3.0.19-r0: task do_install: Started
NOTE: recipe libical-3.0.19-r0: task do_install: Succeeded
NOTE: Running task 3817 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_populate_sysroot)
NOTE: Running task 3818 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package)
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.19-r0: task do_package: Started
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3819 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.79-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.79-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3820 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_configure)
NOTE: recipe bluez5-5.79-r0: task do_configure: Started
NOTE: recipe libical-3.0.19-r0: task do_package: Succeeded
NOTE: Running task 3821 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_packagedata)
NOTE: recipe libical-3.0.19-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.19-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_packagedata unihash changed to 500a9b260a978dae78515e215310b9f11e3f532f21ee57b48804bffefd5c5b66
NOTE: Setscene tasks completed
NOTE: Running task 3822 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_create_spdx)
NOTE: recipe libical-3.0.19-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 3823 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.79-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.79-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3824 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.79-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3825 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_compile)
NOTE: recipe bluez5-5.79-r0: task do_compile: Started
NOTE: recipe bluez5-5.79-r0: task do_compile: Succeeded
NOTE: Running task 3826 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_compile_ptest_base: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3827 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_install)
NOTE: recipe harfbuzz-10.2.0-r0: task do_install: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_install: Succeeded
NOTE: Running task 3828 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_populate_sysroot)
NOTE: Running task 3829 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_package)
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3830 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3831 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_configure)
NOTE: recipe pango-1.56.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 3832 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-10.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_packagedata unihash changed to 762ee4b920dbaf1d7e45d5d34e18ca9e60462cb7c8f0872f0383661e9d86aaff
NOTE: Setscene tasks completed
NOTE: Running task 3833 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-10.2.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.56.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3834 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_compile)
NOTE: recipe pango-1.56.1-r0: task do_compile: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3835 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.56.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.56.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 3836 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 3837 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 3838 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3839 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3840 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3841 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3842 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3843 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3844 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe pango-1.56.1-r0: task do_compile: Succeeded
NOTE: Running task 3845 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_install)
NOTE: recipe pango-1.56.1-r0: task do_install: Started
NOTE: recipe pango-1.56.1-r0: task do_install: Succeeded
NOTE: Running task 3846 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_populate_sysroot)
NOTE: Running task 3847 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_package)
NOTE: recipe pango-1.56.1-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.56.1-r0: task do_package: Started
NOTE: recipe pango-1.56.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3848 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3849 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe librsvg-2.59.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3850 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.59.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3851 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3852 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3853 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.59.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.56.1-r0: task do_package: Succeeded
NOTE: Running task 3854 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3855 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_configure)
NOTE: recipe pango-1.56.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_configure: Started
NOTE: recipe pango-1.56.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_packagedata unihash changed to d237878393d080e1923f5e592e96e9411e209ef314e3dd72cb66f74b1cf36d2b
NOTE: Setscene tasks completed
NOTE: Running task 3856 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_create_spdx)
NOTE: recipe pango-1.56.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.56.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3857 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.59.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.59.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3858 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_compile)
NOTE: recipe librsvg-2.59.2-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: Running task 3859 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3860 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: Running task 3861 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3862 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3863 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 3864 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3865 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3866 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3867 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3868 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 9d2c2bf0a2cd3758b1be629226d175d99464890c2cdc2daaa2c90554c9cd80b5
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3869 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3870 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3871 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3872 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: recipe bluez5-5.79-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3873 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3874 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe bluez5-5.79-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to d77f10842f8a9aeee9fc61e700c3a095eefc103b281e9bec48a7a1312f96504b
NOTE: Setscene tasks completed
NOTE: Running task 3875 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3876 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.79-r0: task do_install: Succeeded
NOTE: Running task 3877 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.79-r0: task do_install_ptest_base: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3878 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_populate_sysroot)
NOTE: Running task 3879 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_package)
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.79-r0: task do_package: Started
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3880 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: recipe bluez5-5.79-r0: task do_package: Succeeded
NOTE: Running task 3881 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata)
NOTE: recipe bluez5-5.79-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.79-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata unihash changed to 3073079f751d43a1abdacc79a12bc567b4e477355009d78a4258578aa3d5356f
NOTE: Setscene tasks completed
NOTE: Running task 3882 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_create_spdx)
NOTE: recipe bluez5-5.79-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.79-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3883 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_install: Succeeded
NOTE: Running task 3884 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_populate_sysroot)
NOTE: Running task 3885 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_package: Succeeded
NOTE: Running task 3886 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_packagedata unihash changed to 2d8dda4362c446bbb44b3cd4d1f6690ba4d9ca0f4df8ac66202fbc40ec7b8c96
NOTE: Setscene tasks completed
NOTE: Running task 3887 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.12-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: Running task 3888 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_install)
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Succeeded
NOTE: Running task 3889 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_package)
NOTE: Running task 3890 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Succeeded
NOTE: Running task 3891 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata unihash changed to 41092fa8deee2c047d92c41dc6dc22fcdcfaa6effe3b6fffa590de550deee2a6
NOTE: Setscene tasks completed
NOTE: Running task 3892 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_compile: Succeeded
NOTE: Running task 3893 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_install)
NOTE: recipe librsvg-2.59.2-r0: task do_install: Started
NOTE: recipe librsvg-2.59.2-r0: task do_install: Succeeded
NOTE: Running task 3894 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_populate_sysroot)
NOTE: Running task 3895 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_package)
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.59.2-r0: task do_package: Started
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3896 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3897 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_configure: Started
NOTE: recipe librsvg-2.59.2-r0: task do_package: Succeeded
NOTE: Running task 3898 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_packagedata)
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_packagedata unihash changed to 0f07ae49da70b984655cebfd3ccca1eb3776a32e8f606c9dc2f9ce150bd828e8
NOTE: Setscene tasks completed
NOTE: Running task 3899 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_create_spdx)
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3900 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3901 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_compile: Succeeded
NOTE: Running task 3902 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_install: Succeeded
NOTE: Running task 3903 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_populate_sysroot)
NOTE: Running task 3904 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3905 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.16.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.16.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3906 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_configure)
NOTE: recipe gtk4-4.16.12-r0: task do_configure: Started
NOTE: recipe gtk4-4.16.12-r0: task do_configure: Succeeded
NOTE: Running task 3907 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_compile)
NOTE: recipe gtk4-4.16.12-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_package: Succeeded
NOTE: Running task 3908 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_packagedata unihash changed to 21977a4ea310712e18f2bdbed4e9d4bba885d8f17816c96649385795cfaec52d
NOTE: Setscene tasks completed
NOTE: Running task 3909 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3910 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.16.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.16.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3911 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_install)
NOTE: recipe gtk4-4.16.12-r0: task do_install: Started
NOTE: recipe gtk4-4.16.12-r0: task do_install: Succeeded
NOTE: Running task 3912 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_package)
NOTE: Running task 3913 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.16.12-r0: task do_package: Started
NOTE: recipe gtk4-4.16.12-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.16.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3914 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-4.3.91-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-4.3.91-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3915 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_configure)
NOTE: recipe gcr-4.3.91-r0: task do_configure: Started
NOTE: recipe gcr-4.3.91-r0: task do_configure: Succeeded
NOTE: Running task 3916 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_compile)
NOTE: recipe gcr-4.3.91-r0: task do_compile: Started
NOTE: recipe gcr-4.3.91-r0: task do_compile: Succeeded
NOTE: Running task 3917 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_install)
NOTE: recipe gcr-4.3.91-r0: task do_install: Started
NOTE: recipe gcr-4.3.91-r0: task do_install: Succeeded
NOTE: Running task 3918 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_populate_sysroot)
NOTE: recipe gcr-4.3.91-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-4.3.91-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.16.12-r0: task do_package: Succeeded
NOTE: Running task 3919 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_packagedata)
NOTE: recipe gtk4-4.16.12-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.16.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_packagedata unihash changed to 153cc31609a3c033bf4263ce3bb0c06bb058ceca6bf52dac1366914bede11309
NOTE: Setscene tasks completed
NOTE: Running task 3920 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package)
NOTE: Running task 3921 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb:do_create_spdx)
NOTE: recipe gcr-4.3.91-r0: task do_package: Started
NOTE: recipe gtk4-4.16.12-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.16.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3922 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_collect_spdx_deps)
NOTE: recipe gcr-4.3.91-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcr-4.3.91-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcr-4.3.91-r0: task do_package: Succeeded
NOTE: Running task 3923 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_packagedata)
NOTE: recipe gcr-4.3.91-r0: task do_packagedata: Started
NOTE: recipe gcr-4.3.91-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_packagedata unihash changed to a4e01d4acf4462940c74db8a25477960cd4ad0e2b36b8b547e9bd6ae2268a7bd
NOTE: Setscene tasks completed
NOTE: Running task 3924 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_create_spdx)
NOTE: Running task 3925 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_write_ipk)
NOTE: Running task 3926 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_write_deb)
NOTE: Running task 3927 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_write_rpm)
NOTE: recipe gcr-4.3.91-r0: task do_create_spdx: Started
NOTE: Running task 3928 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_qa)
NOTE: recipe gcr-4.3.91-r0: task do_package_write_ipk: Started
NOTE: recipe gcr-4.3.91-r0: task do_package_write_deb: Started
NOTE: recipe gcr-4.3.91-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-4.3.91-r0: task do_package_qa: Started
NOTE: recipe gcr-4.3.91-r0: task do_create_spdx: Succeeded
NOTE: Running task 3929 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_create_package_spdx)
NOTE: recipe gcr-4.3.91-r0: task do_create_package_spdx: Started
NOTE: recipe gcr-4.3.91-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gcr-4.3.91-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_qa unihash changed to 2b95ccdcc5522e80ba1ca18a4402329356602963f7ab1132f3b84d4bc26a6ad5
NOTE: recipe gcr-4.3.91-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_write_ipk unihash changed to cd2c0096243c4426d4ee885cd4714463e7cefe42832e2c86bdce59a92c34ff1f
NOTE: recipe gcr-4.3.91-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_write_rpm unihash changed to 40568b6ba4fce2df38b8d224e3cf026e457735650e2ba0a366873a06c1fddb65
NOTE: recipe gcr-4.3.91-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_package_write_deb unihash changed to 5d7afa131c7706cc38820636e34bd82c5d681780706b10c2fce1beae5ab6d4f0
NOTE: Running noexec task 3930 of 3930 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.91.bb:do_build)
NOTE: Tasks Summary: Attempted 3930 tasks of which 3597 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc-src went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dbg went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc-examples went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc-staticdev went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dev went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc-doc went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc-locale went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package orc went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-0.4 went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-test-0.4 went backwards which would break package feeds (from 0:0.4.41-r0 to 0:0.4.40-r0) [version-going-backwards]
ERROR: orc-0.4.40-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4190757133298094440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gcr/gcr-dev: FILELIST: added "/usr/include/gcr-4/gcr/gcr-certificate-extension.h /usr/include/gcr-4/gcr/gcr-subject-public-key-info.h /usr/include/gcr-4/gcr/gcr-certificate-extension-list.h /usr/include/gcr-4/gcr/gcr-certificate-extensions.h"
packages/core2-64-poky-linux/gcr/gcr-locale-el: PKGSIZE changed from 21945 to 14731 (-33%)
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PKGSIZE changed from 22002 to 15935 (-28%)
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PKGSIZE changed from 4213 to 6402 (+52%)
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PKGSIZE changed from 13348 to 16449 (+23%)
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PKGSIZE changed from 18051 to 11805 (-35%)
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PKGSIZE changed from 15805 to 11493 (-27%)
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PKGSIZE changed from 11507 to 14045 (+22%)
packages/core2-64-poky-linux/gcr/gcr: FILELIST: removed "/usr/lib/libgcr-4.so.4.3.0 /usr/lib/libgck-2.so.2.3.0", added "/usr/lib/libgcr-4.so.4.3.91 /usr/lib/libgck-2.so.2.3.91"
Changes to packages/core2-64-poky-linux/gcr (sysroot):
  /usr/lib/libgck-2.so.2 changed symlink target from libgck-2.so.2.3.0 to libgck-2.so.2.3.91
  /usr/lib/libgcr-4.so.4 changed symlink target from libgcr-4.so.4.3.0 to libgcr-4.so.4.3.91
  /usr/include/gcr-4/gcr/gcr-certificate-extension.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extension-list.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extensions.h was added
  /usr/include/gcr-4/gcr/gcr-subject-public-key-info.h was added
  /usr/lib/libgck-2.so.2.3.91 was added
  /usr/lib/libgcr-4.so.4.3.91 was added
  /usr/lib/libgck-2.so.2.3.0 was removed
  /usr/lib/libgcr-4.so.4.3.0 was removed

--===============4190757133298094440==--

