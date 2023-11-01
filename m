Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6865C25B53
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8644.1698848703198982738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Uec8spJd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K8982K8b;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b45fed9-dff0c476-f000-41cf-91c7-da0cfcce3295-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DC2g5AepcOwTdoYpEoX3K1KXJo76exXMMaMs53Rl0xQ=;
	b=Uec8spJdUsv163hvt7VOBk2MaevtsE5DlV8MfvU0EGq+QEouhS38p0yWffci2lv8
	4a4U1xkD4LFyeFhfulPm2+OsiBueZZdtrUw+RO1wMSypYjaHI1JGP3VW45Bursi9Tss
	XPJzlLGuYEF1jpoXTOwMnUIptl9lAOXxlQE9S7fg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DC2g5AepcOwTdoYpEoX3K1KXJo76exXMMaMs53Rl0xQ=;
	b=K8982K8byKKeWDQhpiZisOeTIlYn/ziIxWBAt3VT6Nw1vt7ddtGxa5hoCtnwKJb8
	I8fzDgs5tRu0ldm5LF2wEGRsh7TbpN+M1XjjuEkWPJ165Asfi6bHuq1pukcb8F65PbQ
	GPpdB6TnNVo0vQKhbAM8S2ycRrUea3EEBthN24Xo=
Content-Type: multipart/mixed; boundary="===============0776412955493778298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.78.1 SUCCEEDED
Message-ID: <0101018b8b45fed9-dff0c476-f000-41cf-91c7-da0cfcce3295-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189925

--===============0776412955493778298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.78.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.78.0-2.78.1.patch
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
From 739a4de74ae14091c76c0288f0efa673cbcf005d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:11:36 +0000
Subject: [PATCH] glib-2.0: upgrade 2.78.0 -> 2.78.1

---
 ...n.build-do-not-enable-pidfd-features-on-native-g.patch | 8 +++-----
 .../recipes-core/glib-2.0/glib-2.0/relocate-modules.patch | 2 +-
 .../glib-2.0/{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb}   | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 788f420d11..2430426d38 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 9aa9574861fad39d0679025e35fe1e188345f685 Mon Sep 17 00:00:00 2001
+From 4abb5227ecf2a1bf80044cac87f0dde4f7f9b1ef Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -9,12 +9,13 @@ where these features are not implemented.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  meson.build | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 1c36993..bbf97fc 100644
+index 8cf53c6..24bce07 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
@@ -27,6 +28,3 @@ index 1c36993..bbf97fc 100644
  endif
  
  # Check for __uint128_t (gcc) by checking for 128-bit division
--- 
-2.30.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 841fedef8a..3edc589f6b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From b90d13900dd2777c2ab90c5b0be1a872c10a17da Mon Sep 17 00:00:00 2001
+From 3083a9796b21bb9383c08b84de77e981c6971ada Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
index 500e4e873e..a490262112 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "44eaab8b720877ce303c5540b657b126f12dc94972d9880b52959f43fb537b30"
+SRC_URI[sha256sum] = "915bc3d0f8507d650ead3832e2f8fb670fce59aac4d7754a7dab6f1e6fed78b2"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.39.2


--===============0776412955493778298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 26452945 to 26461609 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgobject-2.0.so.0.7800.0 /usr/lib/.debug/libglib-2.0.so.0.7800.0 /usr/lib/.debug/libgthread-2.0.so.0.7800.0 /usr/lib/.debug/libgio-2.0.so.0.7800.0 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7800.0-gdb.py /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7800.0-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7800.0", added "/usr/lib/.debug/libgobject-2.0.so.0.7800.1 /usr/lib/.debug/libglib-2.0.so.0.7800.1 /usr/lib/.debug/libgthread-2.0.so.0.7800.1 /usr/lib/.debug/libgio-2.0.so.0.7800.1 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7800.1-gdb.py /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7800.1-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7800.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGSIZE changed from 2546612 to 2546661 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGSIZE changed from 143555 to 143595 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGSIZE changed from 137951 to 137940 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGSIZE changed from 60698 to 60288 (-1%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PKGSIZE changed from 139848 to 139866 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGSIZE changed from 147640 to 147670 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PKGSIZE changed from 139096 to 138502 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGSIZE changed from 159208 to 168206 (+6%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGSIZE changed from 134763 to 136075 (+1%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGSIZE changed from 138371 to 138482 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGSIZE changed from 141596 to 141404 (-0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGSIZE changed from 178174 to 178225 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGSIZE changed from 135181 to 135260 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGSIZE changed from 135951 to 135959 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGSIZE changed from 125278 to 125293 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGSIZE changed from 11148632 to 11156824 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 23648458 to 23654455 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGSIZE changed from 3773835 to 3777931 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgmodule-2.0.so.0.7800.0 /usr/lib/libgio-2.0.so.0.7800.0 /usr/lib/libgobject-2.0.so.0.7800.0 /usr/lib/libgthread-2.0.so.0.7800.0 /usr/lib/libglib-2.0.so.0.7800.0", added "/usr/lib/libgmodule-2.0.so.0.7800.1 /usr/lib/libgobject-2.0.so.0.7800.1 /usr/lib/libgio-2.0.so.0.7800.1 /usr/lib/libgthread-2.0.so.0.7800.1 /usr/lib/libglib-2.0.so.0.7800.1"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-2.0: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.78/glib-2.78.0.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch" to "https://download.gnome.org/sources//glib/2.78/glib-2.78.1.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-
 Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7800.0 to libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7800.0 to libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7800.0 to libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7800.0 to libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7800.0 to libgthread-2.0.so.0.7800.1
  /usr/lib/libgio-2.0.so.0.7800.0 moved to /usr/lib/libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0.7800.0 moved to /usr/lib/libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0.7800.0 moved to /usr/lib/libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0.7800.0 moved to /usr/lib/libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0.7800.0 moved to /usr/lib/libgthread-2.0.so.0.7800.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7800.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7800.1-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7800.0 to libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7800.0 to libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7800.0 to libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7800.0 to libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7800.0 to libgthread-2.0.so.0.7800.1
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.1-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.1-gdb.py
  /usr/lib/libgio-2.0.so.0.7800.0 moved to /usr/lib/libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0.7800.0 moved to /usr/lib/libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0.7800.0 moved to /usr/lib/libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0.7800.0 moved to /usr/lib/libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0.7800.0 moved to /usr/lib/libgthread-2.0.so.0.7800.1
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.1

--===============0776412955493778298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.78.0-2.78.1.patch"

RnJvbSA3MzlhNGRlNzRhZTE0MDkxYzc2YzAyODhmMGVmYTY3M2NiY2YwMDVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjoxMTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzguMCAtPiAyLjc4LjEKCi0tLQogLi4ubi5idWlsZC1kby1ub3Qt
ZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIHwgOCArKystLS0tLQogLi4u
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIHwg
MiArLQogLi4uL2dsaWItMi4wL3tnbGliLTIuMF8yLjc4LjAuYmIgPT4gZ2xpYi0yLjBfMi43OC4x
LmJifSAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wXzIuNzgu
MC5iYiA9PiBnbGliLTIuMF8yLjc4LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxl
LXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjAvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1
cmVzLW9uLW5hdGl2ZS1nLnBhdGNoCmluZGV4IDc4OGY0MjBkMTEuLjI0MzA0MjZkMzggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtbWVzb24uYnVp
bGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLmJ1aWxkLWRvLW5v
dC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDlhYTk1NzQ4NjFmYWQzOWQwNjc5MDI1ZTM1ZmUxZTE4ODM0NWY2ODUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDRhYmI1MjI3ZWNmMmExYmY4MDA0NGNhYzg3ZjBkZGU0Zjdm
OWIxZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogU2F0LCAxNiBTZXAgMjAyMyAyMjoyODoyNyArMDIw
MAogU3ViamVjdDogW1BBVENIXSBtZXNvbi5idWlsZDogZG8gbm90IGVuYWJsZSBwaWRmZCBmZWF0
dXJlcyBvbiBuYXRpdmUgZ2xpYgpAQCAtOSwxMiArOSwxMyBAQCB3aGVyZSB0aGVzZSBmZWF0dXJl
cyBhcmUgbm90IGltcGxlbWVudGVkLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUg
W29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgorCiAtLS0KICBtZXNvbi5idWlsZCB8IDMgKystCiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVz
b24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMWMzNjk5My4uYmJmOTdmYyAxMDA2NDQKK2lu
ZGV4IDhjZjUzYzYuLjI0YmNlMDcgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVz
b24uYnVpbGQKIEBAIC05ODEsNyArOTgxLDggQEAgaWYgY2MubGlua3MoJycnI2luY2x1ZGUgPHN5
cy9zeXNjYWxsLmg+CkBAIC0yNyw2ICsyOCwzIEBAIGluZGV4IDFjMzY5OTMuLmJiZjk3ZmMgMTAw
NjQ0CiAgZW5kaWYKICAKICAjIENoZWNrIGZvciBfX3VpbnQxMjhfdCAoZ2NjKSBieSBjaGVja2lu
ZyBmb3IgMTI4LWJpdCBkaXZpc2lvbgotLS0gCi0yLjMwLjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gK
aW5kZXggODQxZmVkZWY4YS4uM2VkYzU4OWY2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBiOTBkMTM5MDBkZDI3NzdjMmFiOTBjNWIwYmUxYTg3MmMxMGExN2Rh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMDgzYTk3OTZiMjFiYjkzODNjMDhiODRk
ZTc3ZTk4MWM2OTcxYWRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTEgTWFyIDIwMTYgMTU6MzU6
NTUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2xpYi0yLjA6IHJlbG9jYXRlIHRoZSBHSU8gbW9k
dWxlIGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43OC4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjBfMi43OC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzguMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43OC4xLmJiCmluZGV4IDUwMGU0
ZTg3M2UuLmE0OTAyNjIxMTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2dsaWItMi4wXzIuNzguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LTIuMF8yLjc4LjEuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0
aXZlID0gIiBmaWxlOi8vcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBcCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlk
ZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggXAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDRlYWFiOGI3MjA4NzdjZTMwM2M1NTQw
YjY1N2IxMjZmMTJkYzk0OTcyZDk4ODBiNTI5NTlmNDNmYjUzN2IzMCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5MTViYzNkMGY4NTA3ZDY1MGVhZDM4MzJlMmY4ZmI2NzBmY2U1OWFhYzRkNzc1NGE3
ZGFiNmYxZTZmZWQ3OGIyIgogCiAjIEZpbmQgYW55IG1lc29uIGNyb3NzIGZpbGVzIGluIEZJTEVT
UEFUSCB0aGF0IGFyZSByZWxldmFudCBmb3IgdGhlIGN1cnJlbnQKICMgYnVpbGQgKHVzaW5nIHNp
dGVpbmZvKSBhbmQgYWRkIHRoZW0gdG8gRVhUUkFfT0VNRVNPTi4KLS0gCjIuMzkuMgoK

--===============0776412955493778298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libglib-2.0.so.0.7800.0 /usr/lib/libgio-2.0.so.0.7800.0 /usr/lib/libgthread-2.0.so.0.7800.0 /usr/lib/libgmodule-2.0.so.0.7800.0 /usr/lib/libgobject-2.0.so.0.7800.0", added "/usr/lib/libglib-2.0.so.0.7800.1 /usr/lib/libgio-2.0.so.0.7800.1 /usr/lib/libgthread-2.0.so.0.7800.1 /usr/lib/libgmodule-2.0.so.0.7800.1 /usr/lib/libgobject-2.0.so.0.7800.1"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7800.0 to libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7800.0 to libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7800.0 to libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7800.0 to libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7800.0 to libgthread-2.0.so.0.7800.1
  /usr/lib/libgio-2.0.so.0.7800.0 moved to /usr/lib/libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0.7800.0 moved to /usr/lib/libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0.7800.0 moved to /usr/lib/libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0.7800.0 moved to /usr/lib/libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0.7800.0 moved to /usr/lib/libgthread-2.0.so.0.7800.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7800.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7800.1-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7800.0 to libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7800.0 to libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7800.0 to libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7800.0 to libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7800.0 to libgthread-2.0.so.0.7800.1
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.1-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.0-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.1-gdb.py
  /usr/lib/libgio-2.0.so.0.7800.0 moved to /usr/lib/libgio-2.0.so.0.7800.1
  /usr/lib/libglib-2.0.so.0.7800.0 moved to /usr/lib/libglib-2.0.so.0.7800.1
  /usr/lib/libgmodule-2.0.so.0.7800.0 moved to /usr/lib/libgmodule-2.0.so.0.7800.1
  /usr/lib/libgobject-2.0.so.0.7800.0 moved to /usr/lib/libgobject-2.0.so.0.7800.1
  /usr/lib/libgthread-2.0.so.0.7800.0 moved to /usr/lib/libgthread-2.0.so.0.7800.1
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.1

--===============0776412955493778298==--

