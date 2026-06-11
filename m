Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54268CDE004
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50417.1781195501857594655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b8aOSsNU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PCZq3kL+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019eb786b88a-30635529-8bdc-4fc7-af0e-f1a7c3e71714-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195520;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eGCoHj/Z0EVtYZ0Cl+KJQv4h1BZlQFD4340dLpzsmUw=;
	b=b8aOSsNUtbWrEnChm5Cnu23fcl+m8KB9J9M40B48RcgrnuiUZGi8//whaUzYq8iH
	i6mGh8EUd/4N8hnbj7jSguwxsV6OvAwW8NfTIKMCW6U63QNWkrbkEOVGFvNpomm4PV8
	zlaJbFOfKpurk9Nwc7g2e2FY2cOuq40nUPKkciDY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195520;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eGCoHj/Z0EVtYZ0Cl+KJQv4h1BZlQFD4340dLpzsmUw=;
	b=PCZq3kL+R+A6pWJBrFmxlfNYh08Ix35PN7Y3VOG+OdDP+tUrfGo0I2k1yOi14aWd
	R30snmfdRbC2Uf6xql9wYYUYLq1trniQzXsGyj8on8wURl3+/bIBD2pL2TRdpjSunx5
	uE8EJBXkNgPmxioXBDsFaipNSb9hhSezUVHd7E3w=
Content-Type: multipart/mixed; boundary="===============7744693705780803287=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.16 SUCCEEDED
Message-ID: <0101019eb786b88a-30635529-8bdc-4fc7-af0e-f1a7c3e71714-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238555

--===============7744693705780803287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-utils* to *1.2.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.15.2-1.2.16.patch
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
From ce1bbdace31088ef3fdc1b0fe78ec44156434325 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:40:45 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.15.2 -> 1.2.16

---
 .../alsa/{alsa-utils_1.2.15.2.bb => alsa-utils_1.2.16.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.15.2.bb => alsa-utils_1.2.16.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb
index b792302c9f..40515e0d73 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 DEPENDS = "alsa-lib ncurses libsamplerate0 bash"
 
 # Only needed as the dynamic packaging was altered, remove on upgrade
-PR = "r2"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a"
+SRC_URI[sha256sum] = "092399d5e8749a1d5e188e393157521cec4b75693b60ebb79bbce728cff2232c"
 
 inherit autotools gettext pkgconfig manpages
 
-- 
2.47.1


--===============7744693705780803287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsa-info: PKGSIZE changed from 30138 to 30197 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsa-info: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsa-info: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsa-info: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsa-info: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaconf: PKGSIZE changed from 35437 to 35435 (-0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaconf: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaconf: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaconf: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaconf: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGSIZE changed from 80968 to 81000 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amidi: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amidi: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amidi: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amidi: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi2: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi2: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi2: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi2: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi2: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi2: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi2: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi2: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-axfer: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-axfer: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-axfer: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-axfer: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PKGSIZE changed from 2527840 to 2529728 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PKGSIZE changed from 107980 to 108302 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhlt-dmic-info: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhlt-dmic-info: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhlt-dmic-info: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhlt-dmic-info: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speaker-test: PKGSIZE changed from 1268024 to 1272120 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speaker-test: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speaker-test: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speaker-test: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speaker-test: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PKGSIZE changed from 1467743 to 1469272 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: FILELIST: directory renamed /usr/src/debug/alsa-utils/1.2.15.2/amidi -> /usr/src/debug/alsa-utils/1.2.16/amidi, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/alsaloop -> /usr/src/debug/alsa-utils/1.2.16/alsaloop, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/axfer -> /usr/src/debug/alsa-utils/1.2.16/axfer, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/topology/nhlt/intel/ssp -> /usr/src/debug/alsa-utils/1.2.16/topology/nhlt/intel/ssp, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/alsactl -> /usr/src/debug/alsa-utils/1.2.16/alsactl, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/alsaucm -> /usr/src/debug/alsa-utils/1.2.16/alsaucm, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/topology/nhlt -> /usr/src/debug/alsa-utils/1.2.16/topology/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/seq/aplaymidi -> /usr/src/debug/alsa-utils/1.2.16/seq/aplaymidi, directory renamed /usr/src/debug/
 alsa-utils/1.2.15.2/seq/aconnect -> /usr/src/debug/alsa-utils/1.2.16/seq/aconnect, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/aplay -> /usr/src/debug/alsa-utils/1.2.16/aplay, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/seq/aseqnet -> /usr/src/debug/alsa-utils/1.2.16/seq/aseqnet, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/nhlt -> /usr/src/debug/alsa-utils/1.2.16/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/alsamixer -> /usr/src/debug/alsa-utils/1.2.16/alsamixer, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/seq/aplaymidi2 -> /usr/src/debug/alsa-utils/1.2.16/seq/aplaymidi2, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/seq/aseqsend -> /usr/src/debug/alsa-utils/1.2.16/seq/aseqsend, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/speaker-test -> /usr/src/debug/alsa-utils/1.2.16/speaker-test, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/seq/aseqdump -> /usr/src/debug/alsa-utils/1.2.16/seq/aseqdump, directory renamed /u
 sr/src/debug/alsa-utils/1.2.15.2/topology/nhlt/intel -> /usr/src/debug/alsa-utils/1.2.16/topology/nhlt/intel, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/topology/nhlt/intel/dmic -> /usr/src/debug/alsa-utils/1.2.16/topology/nhlt/intel/dmic, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/topology -> /usr/src/debug/alsa-utils/1.2.16/topology, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/iecset -> /usr/src/debug/alsa-utils/1.2.16/iecset, directory renamed /usr/src/debug/alsa-utils/1.2.15.2/amixer -> /usr/src/debug/alsa-utils/1.2.16/amixer
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PV changed from "1.2.15.2" to "1.2.16"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils: PKGR changed from r2 [default] to r0 [default]
packages/x86-64-v3-poky-linux/alsa-utils: SRC_URI changed from "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.15.2.tar.bz2" to "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.16.tar.bz2"
packages/x86-64-v3-poky-linux/alsa-utils: PKGV changed from 1.2.15.2 [default] to 1.2.16 [default]
packages/x86-64-v3-poky-linux/alsa-utils: PR changed from "r2" to "r0"
packages/x86-64-v3-poky-linux/alsa-utils: PV changed from "1.2.15.2" to "1.2.16"

--===============7744693705780803287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-71c1ecede6f1fe6000080d4a533d29047c199815"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:71c1ecede6f1fe6000080d4a533d29047c199815"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 294 Local 273 Mirrors 0 Missed 21 Current 298 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 353 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_populate_lic_setscene)
NOTE: Running setscene task 365 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 388 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running task 902 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_recipe_qa)
NOTE: recipe alsa-utils-1.2.16-r0: task do_populate_lic_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 970 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_recipe_qa)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 404 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe alsa-utils-1.2.16-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 971 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 438 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 441 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 442 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 459 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/alsa-lib/1.2.15.3/temp/log.do_packagedata_setscene.2330130
NOTE: Running setscene task 468 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 469 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 973 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 480 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 482 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 483 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 985 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1011 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_unpack)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1051 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_create_recipe_spdx)
NOTE: recipe alsa-utils-1.2.16-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_patch)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1063 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: Running setscene task 507 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 518 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_patch: Succeeded
NOTE: Running setscene task 519 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 520 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1069 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1070 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 534 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1072 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_create_recipe_spdx)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch unihash changed to 4a3828845b745941e2e895938c146596fb6d7d120e560ca76d0f147954cdc557
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 541 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 544 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1110 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1116 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 590 of 592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1303 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata)
NOTE: Running task 1360 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1403 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1404 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1409 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_compile)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1410 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_install)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_install: Succeeded
NOTE: Running task 1411 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_package)
NOTE: Running task 1412 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_package: Succeeded
NOTE: Running task 1413 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1414 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_create_spdx)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_spdx: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1416 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1418 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 1419 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1421 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_populate_sysroot)
NOTE: recipe bash-5.3-r0: task do_populate_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1423 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx)
NOTE: recipe alsa-utils-1.2.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1425 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_configure)
NOTE: recipe alsa-utils-1.2.16-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_configure: Succeeded
NOTE: Running task 1426 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_compile)
NOTE: recipe alsa-utils-1.2.16-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_install)
NOTE: recipe alsa-utils-1.2.16-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_install: Succeeded
NOTE: Running task 1428 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_package)
NOTE: Running task 1429 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.16-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_package: Succeeded
NOTE: Running task 1430 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.16-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_packagedata: Succeeded
NOTE: Running task 1431 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_create_spdx)
NOTE: Running task 1432 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_package_write_ipk)
NOTE: Running task 1433 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_package_write_deb)
NOTE: Running task 1434 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_package_write_rpm)
NOTE: Running task 1435 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_package_qa)
NOTE: recipe alsa-utils-1.2.16-r0: task do_create_spdx: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_write_ipk: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_write_deb: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_qa: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 1436 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_create_package_spdx)
NOTE: recipe alsa-utils-1.2.16-r0: task do_create_package_spdx: Started
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_write_ipk: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_write_deb: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_create_package_spdx: Succeeded
NOTE: recipe alsa-utils-1.2.16-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 1437 of 1437 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb:do_build)
NOTE: Tasks Summary: Attempted 1437 tasks of which 1390 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.16-r0 to 0:1.2.15.3-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7744693705780803287==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.15.2-1.2.16.patch"

RnJvbSBjZTFiYmRhY2UzMTA4OGVmM2ZkYzFiMGZlNzhlYzQ0MTU2NDM0MzI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6NDA6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXV0aWxzOiB1cGdyYWRlIDEuMi4xNS4yIC0+IDEuMi4xNgoKLS0tCiAuLi4vYWxzYS97YWxz
YS11dGlsc18xLjIuMTUuMi5iYiA9PiBhbHNhLXV0aWxzXzEuMi4xNi5iYn0gICAgICB8IDMgKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11dGlsc18xLjIuMTUuMi5iYiA9PiBh
bHNhLXV0aWxzXzEuMi4xNi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE1LjIuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTUuMi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4x
Ni5iYgppbmRleCBiNzkyMzAyYzlmLi40MDUxNWUwZDczIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE1LjIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNi5iYgpAQCAtMTIsMTEgKzEyLDEw
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTU5NTMwYmRmMzM2NTli
MjllNzNkNGFkYjlmOWY2NTUyIFwKIERFUEVORFMgPSAiYWxzYS1saWIgbmN1cnNlcyBsaWJzYW1w
bGVyYXRlMCBiYXNoIgogCiAjIE9ubHkgbmVlZGVkIGFzIHRoZSBkeW5hbWljIHBhY2thZ2luZyB3
YXMgYWx0ZXJlZCwgcmVtb3ZlIG9uIHVwZ3JhZGUKLVBSID0gInIyIgogCiAjIGFsc2EtdXRpbHMg
c3BlY2lmaWVkIGluIFNSQ19VUkkgZHVlIHRvIGFsc2EtdXRpbHMtc2NyaXB0cyByZWNpcGUKIFNS
Q19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvdXRpbHMvYWxz
YS11dGlscy0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhYWFhZmJmYjAx
OTQyMTEzZWMwYzMxZTUxZjcwNTkxMGU4MTA3OTIwNTA4OGNhMmY4ZjEzN2EzODY5ZTFhM2EiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDkyMzk5ZDVlODc0OWExZDVlMTg4ZTM5MzE1NzUyMWNlYzRi
NzU2OTNiNjBlYmI3OWJiY2U3MjhjZmYyMjMyYyIKIAogaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4
dCBwa2djb25maWcgbWFucGFnZXMKIAotLSAKMi40Ny4xCgo=

--===============7744693705780803287==--

