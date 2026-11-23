Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48128.1795412254318360272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=etg5o/p6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TP5fUTFZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a206e8db4a-aef63d48-9b78-46bf-adf9-359c8d8d843b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795412253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pUrkdldo/AnhJTqybDSncuHLmp54CGvML+FcCQmpCNQ=;
	b=etg5o/p6BApkwZA6jaeU2lv2hCweuhPEH0TAihJdZbhWIFlN7PzGhV2CI8NPq72n
	q2yLwJXAIjm0nZpPVDa8qLgvbeNTE905bOW3I5I0BtRjyrRQ5YNADDMt/5Rp5t/Jfux
	kIzjQAwmA6r8nplPikMzbj4U7B7r4F9mK510NdkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795412253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pUrkdldo/AnhJTqybDSncuHLmp54CGvML+FcCQmpCNQ=;
	b=TP5fUTFZM7CGSc5LccEfzznaeo747pN24oOBYpG90Ra8p2sBYhoWoKsPYxGVmJF5
	9Uv5wQ7hR7YaqZrquQitu9bk5j4xUUEnJXjuHhtFTUcKE/I/wK5tK1fNUkqGuLX2CJE
	ADHewv2PkzJPkFt9NzEmvgY0enj4YV+9+FD1Fghc=
Content-Type: multipart/mixed; boundary="===============2309562332188901403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.62.2 SUCCEEDED
Message-ID: <010101a206e8db4a-aef63d48-9b78-46bf-adf9-359c8d8d843b-000000@us-west-2.amazonses.com>
Date: Mon, 23 Nov 2026 05:37:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.23-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250886

--===============2309562332188901403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.62.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.62.1-2.62.2.patch
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
From e6896f8142d301fdb2c5423cb637500f1c5e0e37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 23 Nov 2026 05:37:27 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.62.1 -> 2.62.2

What's new in at-spi2-core 2.62.2:

    libatspi: Don't crash when a direct connection fails before the root is
    known.

    libatspi: Notify when an AtspiEventListener's callback is no longer valid.
    device-x11: Report each key once while using the raw key fallback.
---
 .../atk/{at-spi2-core_2.62.1.bb => at-spi2-core_2.62.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.62.1.bb => at-spi2-core_2.62.2.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.62.1.bb b/meta/recipes-support/atk/at-spi2-core_2.62.2.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.62.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.62.2.bb
index 44b0f7e7cf..bc9c8fa0c2 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.62.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.62.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "cca6b6a86e4389d89b370288761ce2385ddeceb10c4412da78689bc30c88af2d"
+SRC_URI[archive.sha256sum] = "7ce81820ddf873b8d930177e0790f730f60d22d8e0acee9ba8f75d8202598de3"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============2309562332188901403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.26210.1", added "/usr/lib/libatk-1.0.so.0.26211.1"
packages/x86-64-v3-poky-linux/at-spi2-core: PACKAGES: added "at-spi2-core-locale-mi"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.26210.1 to libatk-1.0.so.0.26211.1
  /usr/lib/libatk-1.0.so.0.26210.1 moved to /usr/lib/libatk-1.0.so.0.26211.1

--===============2309562332188901403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: FILELIST: removed "/usr/lib/.debug/libatk-1.0.so.0.26210.1", added "/usr/lib/.debug/libatk-1.0.so.0.26211.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGSIZE changed from 2508136 to 2508960 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PKGSIZE changed from 2204589 to 2204590 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: FILELIST: directory renamed /usr/src/debug/at-spi2-core/2.62.1/atk-adaptor/gtk-2.0 -> /usr/src/debug/at-spi2-core/2.62.2/atk-adaptor/gtk-2.0, directory renamed /usr/src/debug/at-spi2-core/2.62.1/dbind -> /usr/src/debug/at-spi2-core/2.62.2/dbind, directory renamed /usr/src/debug/at-spi2-core/2.62.1/droute -> /usr/src/debug/at-spi2-core/2.62.2/droute, directory renamed /usr/src/debug/at-spi2-core/2.62.1/atk-adaptor -> /usr/src/debug/at-spi2-core/2.62.2/atk-adaptor, directory renamed /usr/src/debug/at-spi2-core/2.62.1/atspi -> /usr/src/debug/at-spi2-core/2.62.2/atspi, directory renamed /usr/src/debug/at-spi2-core/2.62.1/atk -> /usr/src/debug/at-spi2-core/2.62.2/atk, directory renamed /usr/src/debug/at-spi2-core/2.62.1/atk-adaptor/adaptors -> /usr/src/debug/at-spi2-core/2.62.2/atk-adaptor/adaptors, directory renamed /usr/src/debug/at-spi2-core/2.62.1/bus -> /usr/src/debug/at-spi2-core/2.62.2/bus, directory renamed /usr/src/debu
 g/at-spi2-core/2.62.1/xml -> /usr/src/debug/at-spi2-core/2.62.2/xml, directory renamed /usr/src/debug/at-spi2-core/2.62.1/registryd -> /usr/src/debug/at-spi2-core/2.62.2/registryd
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGSIZE changed from 2135364 to 2136818 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.26210.1", added "/usr/lib/libatk-1.0.so.0.26211.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PKGSIZE changed from 1012123 to 1012137 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core: PV changed from "2.62.1" to "2.62.2"
packages/x86-64-v3-poky-linux/at-spi2-core: SRC_URI changed from "https://download.gnome.org/sources//at-spi2-core/2.62/at-spi2-core-2.62.1.tar.xz;name=archive" to "https://download.gnome.org/sources//at-spi2-core/2.62/at-spi2-core-2.62.2.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/at-spi2-core: PKGV changed from 2.62.1 [default] to 2.62.2 [default]
packages/x86-64-v3-poky-linux/at-spi2-core: PACKAGES: added "at-spi2-core-locale-mi"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.26210.1 to libatk-1.0.so.0.26211.1
  /usr/lib/libatk-1.0.so.0.26210.1 moved to /usr/lib/libatk-1.0.so.0.26211.1

--===============2309562332188901403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.62.1-2.62.2.patch"

RnJvbSBlNjg5NmY4MTQyZDMwMWZkYjJjNTQyM2NiNjM3NTAwZjFjNWUwZTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjMgTm92IDIwMjYgMDU6Mzc6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dC1zcGkyLWNvcmU6IHVwZ3JhZGUgMi42Mi4xIC0+IDIuNjIuMgoKV2hhdCdzIG5ldyBpbiBhdC1z
cGkyLWNvcmUgMi42Mi4yOgoKICAgIGxpYmF0c3BpOiBEb24ndCBjcmFzaCB3aGVuIGEgZGlyZWN0
IGNvbm5lY3Rpb24gZmFpbHMgYmVmb3JlIHRoZSByb290IGlzCiAgICBrbm93bi4KCiAgICBsaWJh
dHNwaTogTm90aWZ5IHdoZW4gYW4gQXRzcGlFdmVudExpc3RlbmVyJ3MgY2FsbGJhY2sgaXMgbm8g
bG9uZ2VyIHZhbGlkLgogICAgZGV2aWNlLXgxMTogUmVwb3J0IGVhY2gga2V5IG9uY2Ugd2hpbGUg
dXNpbmcgdGhlIHJhdyBrZXkgZmFsbGJhY2suCi0tLQogLi4uL2F0ay97YXQtc3BpMi1jb3JlXzIu
NjIuMS5iYiA9PiBhdC1zcGkyLWNvcmVfMi42Mi4yLmJifSAgICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXRrL3thdC1zcGkyLWNvcmVfMi42Mi4xLmJiID0+IGF0LXNwaTItY29yZV8yLjYy
LjIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNw
aTItY29yZV8yLjYyLjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1jb3Jl
XzIuNjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9hdGsvYXQtc3BpMi1jb3JlXzIuNjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjYyLjIuYmIKaW5kZXggNDRiMGY3ZTdjZi4uYmM5
YzhmYTBjMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29y
ZV8yLjYyLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8y
LjYyLjIuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCiBDVkVfUFJPRFVDVCAr
PSAiYXQtc3BpMi1hdGsiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImNjYTZiNmE4
NmU0Mzg5ZDg5YjM3MDI4ODc2MWNlMjM4NWRkZWNlYjEwYzQ0MTJkYTc4Njg5YmMzMGM4OGFmMmQi
CitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI3Y2U4MTgyMGRkZjg3M2I4ZDkzMDE3N2Uw
NzkwZjczMGY2MGQyMmQ4ZTBhY2VlOWJhOGY3NWQ4MjAyNTk4ZGUzIgogCiBERVBFTkRTID0gIiBc
CiAJZGJ1cyBcCi0tIAoyLjQ3LjEKCg==

--===============2309562332188901403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="at-spi2-core-changelog.txt"

What's new in at-spi2-core 2.62.2:

    libatspi: Don't crash when a direct connection fails before the root is
    known.

    libatspi: Notify when an AtspiEventListener's callback is no longer valid.
    device-x11: Report each key once while using the raw key fallback.

--===============2309562332188901403==--
