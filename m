Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C043C32718
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1113.1714579215414642812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hm/FkimP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dySC8HlY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e2956f-54f1b109-371c-4ca1-8247-8ad54fdcc2f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0jqJwIh3ZWoTtj31KbkmjUOLHdM6L1nV2mfqo5D81EE=;
	b=Hm/FkimPtVB6iakMauR3criE7JGHPA5LV96Hzs2+2vzgm/+Ux5XYcbJAmvRKgGxi
	IKpJ3QosuwHwoB8E3IsoO2IMScFSkTK0lgUE74QVRG1jf4P6r8Rb4K0CTxuxkrG9CXn
	y5PKfKSsclQCBXp2PuAThwdUQY2gVYkB+TiZ/PSo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0jqJwIh3ZWoTtj31KbkmjUOLHdM6L1nV2mfqo5D81EE=;
	b=dySC8HlYsQNeErGARb/7JackF3k4D+5tYKtKPXaayhGNrRB78vXNdvqUqL9zyHsl
	OFWV7BiMN6pZv0FNTU2t5PGFpc+PEohIi9G3BdXFdUekPC93cnqGkqaksFTDAPob6pZ
	UaG2jHKHsCVV0PiVBydrBfIIDrhYDHR0M09r+CrA=
Content-Type: multipart/mixed; boundary="===============4610456283150735556=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.14.3 SUCCEEDED
Message-ID: <0101018f34e2956f-54f1b109-371c-4ca1-8247-8ad54fdcc2f6-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198826

--===============4610456283150735556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.14.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.14.2-4.14.3.patch
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
From 996fadc048a042aac75d3f293159545b3384edc4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 09:41:51 +0000
Subject: [PATCH] gtk4: upgrade 4.14.2 -> 4.14.3

---
 meta/recipes-gnome/gtk+/{gtk4_4.14.2.bb => gtk4_4.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.2.bb => gtk4_4.14.3.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.14.3.bb
index 282e81f048..95a0b84e44 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.3.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "22604cef2898a79e5f2143bb7aee2b7d1fa2eb946989a9d1338ecf9c8ae0e072"
+SRC_URI[sha256sum] = "2be5c858bdef1104d37848c9779c089372c8d31503f6efc4b94e53b546fc9a43"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.44.0


--===============4610456283150735556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1400.2", added "/usr/lib/libgtk-4.so.1.1400.3"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1400.2 to libgtk-4.so.1.1400.3
  /usr/lib/libgtk-4.so.1.1400.2 moved to /usr/lib/libgtk-4.so.1.1400.3

--===============4610456283150735556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1400.2", added "/usr/lib/.debug/libgtk-4.so.1.1400.3"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 64012616 to 64021784 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dev: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 24332839 to 24336962 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-doc: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PKGSIZE changed from 105871 to 106173 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 112851 to 113153 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 130184 to 130368 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGSIZE changed from 120359 to 120555 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 163535 to 163723 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kab: PKGSIZE changed from 40288 to 42459 (+5%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PKGSIZE changed from 114261 to 114562 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PKGSIZE changed from 106223 to 113298 (+7%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGSIZE changed from 111389 to 111572 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 109296 to 109598 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 110310 to 110746 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 136608 to 136802 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PKGSIZE changed from 104710 to 105015 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-src: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 54691565 to 54696572 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1400.2", added "/usr/lib/libgtk-4.so.1.1400.3"
packages/core2-64-poky-linux/gtk4/gtk4: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4/gtk4: PKGSIZE changed from 18258831 to 18258835 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4: PV changed from "4.14.2" to "4.14.3"
packages/core2-64-poky-linux/gtk4: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/core2-64-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.14/gtk-4.14.2.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.14/gtk-4.14.3.tar.xz"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1400.2 to libgtk-4.so.1.1400.3
  /usr/lib/libgtk-4.so.1.1400.2 moved to /usr/lib/libgtk-4.so.1.1400.3

--===============4610456283150735556==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.14.2-4.14.3.patch"

RnJvbSA5OTZmYWRjMDQ4YTA0MmFhYzc1ZDNmMjkzMTU5NTQ1YjMzODRlZGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwOTo0MTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC4xNC4yIC0+IDQuMTQuMwoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky97Z3RrNF80LjE0LjIuYmIgPT4gZ3RrNF80LjE0LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdu
b21lL2d0aysve2d0azRfNC4xNC4yLmJiID0+IGd0azRfNC4xNC4zLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjE0LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjE0LjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC4zLmJiCmluZGV4IDI4MmU4MWYwNDguLjk1
YTBiODRlNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC4zLmJiCkBAIC0zNyw3
ICszNyw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIp
fSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImd0ay0oP1A8cHZlcj5cZCtcLihcZCpbMDI0Njhd
KSsoXC5cZCspKylcLnRhci54eiIKIAogU1JDX1VSSSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9w
dWIvZ25vbWUvc291cmNlcy9ndGsvJHtNQUpfVkVSfS9ndGstJHtQVn0udGFyLnh6IgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjIyNjA0Y2VmMjg5OGE3OWU1ZjIxNDNiYjdhZWUyYjdkMWZhMmViOTQ2
OTg5YTlkMTMzOGVjZjljOGFlMGUwNzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmJlNWM4NThi
ZGVmMTEwNGQzNzg0OGM5Nzc5YzA4OTM3MmM4ZDMxNTAzZjZlZmM0Yjk0ZTUzYjU0NmZjOWE0MyIK
IAogUyA9ICIke1dPUktESVJ9L2d0ay0ke1BWfSIKIAotLSAKMi40NC4wCgo=

--===============4610456283150735556==--

