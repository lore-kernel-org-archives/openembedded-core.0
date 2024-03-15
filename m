Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9911FC54EF3
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1271.1710522012004625181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cGdkPuGq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uHUIN68u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e430e977c-50b42075-3473-4230-ab81-3b736fcc8422-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SDJHtz1iGPCfZPlVNeYDm08pSsvkAFtNjEDAecO35DI=;
	b=cGdkPuGq8Qc6g5phvV/PMLivpnnVRVnOTes3t0EmYtDeh9QLsF6XN3a0rCve5jnO
	+BiPbsL/cNtmIbcQR3Sa4YYtop+HoIcb8fI9i89IwoVaxdTIAhm4Lj8lIouqmdGATAG
	gRXpJ0zci5O/dIp2qRyyW7BSzll7P7SQ5KQqFZG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SDJHtz1iGPCfZPlVNeYDm08pSsvkAFtNjEDAecO35DI=;
	b=uHUIN68uA+LDDutGWyzZgH8C3E8xKWpknu5oo2j7D4K0sagIcSqSR2LKvrkywv4+
	l0UWxVe/RXdPDo0q2YdMvSch4orfXScgSYh+WmPoq4EPc5hm4uhO0Q3g/RmayuVpaJA
	ZW0BENsNurN6uBOrnhBWTWrJe+liNpyKYLCWI5jQ=
Content-Type: multipart/mixed; boundary="===============6305728462288322784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.4.4 SUCCEEDED
Message-ID: <0101018e430e977c-50b42075-3473-4230-ab81-3b736fcc8422-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197203

--===============6305728462288322784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libadwaita* to *1.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.4.3-1.4.4.patch
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
From 7d654d0dae964b75b38e4bef2008646b5ef225ed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 12:08:38 +0000
Subject: [PATCH] libadwaita: upgrade 1.4.3 -> 1.4.4

---
 .../libadwaita/{libadwaita_1.4.3.bb => libadwaita_1.4.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.3.bb => libadwaita_1.4.4.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
index e3f849ad6a..e81580feba 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "ae9622222b0eb18e23675655ad2ba01741db4d8655a796f4cf077b093e2f5841"
+SRC_URI[archive.sha256sum] = "f802b7d8d5ae33be4650ef571a580f144a806202a26f527dacd57d1560938828"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.42.0


--===============6305728462288322784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libadwaita: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.4/libadwaita-1.4.3.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.4/libadwaita-1.4.4.tar.xz;name=archive"
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 3906360 to 3906536 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PKGSIZE changed from 1925712 to 1925715 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGSIZE changed from 6073 to 6199 (+2%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 7801097 to 7801200 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita: PV changed from "1.4.3" to "1.4.4"
packages/core2-64-poky-linux/libadwaita/libadwaita: PKGV changed from 1.4.3 [default] to 1.4.4 [default]

--===============6305728462288322784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.4.3-1.4.4.patch"

RnJvbSA3ZDY1NGQwZGFlOTY0Yjc1YjM4ZTRiZWYyMDA4NjQ2YjVlZjIyNWVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTI6MDg6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuNC4zIC0+IDEuNC40CgotLS0KIC4uLi9saWJhZHdhaXRhL3ts
aWJhZHdhaXRhXzEuNC4zLmJiID0+IGxpYmFkd2FpdGFfMS40LjQuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuNC4zLmJiID0+IGxpYmFkd2Fp
dGFfMS40LjQuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjQuMy5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRh
L2xpYmFkd2FpdGFfMS40LjQuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjQuMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjQuNC5iYgppbmRleCBl
M2Y4NDlhZDZhLi5lODE1ODBmZWJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
YWR3YWl0YS9saWJhZHdhaXRhXzEuNC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS40LjQuYmIKQEAgLTExLDcgKzExLDcgQEAgREVQRU5EUyA9ICIg
XAogCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZh
bGEgZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYWU5NjIy
MjIyYjBlYjE4ZTIzNjc1NjU1YWQyYmEwMTc0MWRiNGQ4NjU1YTc5NmY0Y2YwNzdiMDkzZTJmNTg0
MSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImY4MDJiN2Q4ZDVhZTMzYmU0NjUwZWY1
NzFhNTgwZjE0NGE4MDYyMDJhMjZmNTI3ZGFjZDU3ZDE1NjA5Mzg4MjgiCiAKIEFOWV9PRl9ESVNU
Uk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKLS0gCjIuNDIuMAoK

--===============6305728462288322784==--

