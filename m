Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A8DCDE003
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50612.1781195504249404383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rogp+L3Z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=y6iJG40d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb786bdda-63d8fe35-0d82-4c47-8346-aeab5b27e9b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195521;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I5mWneyzZUpApvjzzMikio3N//9OKEQ3GjomaQ3Y/Ks=;
	b=rogp+L3ZbT4gnU3UzbssVbJQHJ0s05XoyJ2aBK1k73V5Jp47QCBKB1gMozDhTvFS
	7v0visZ8bfoTazczCFLk5OiATwC/viVt+Qo6gQK74k9wMcIi3iptMNGoYrdE7Q04ZmN
	998OU2c2qTsL8UWp6rdgSaMTVDao68mPy4KIwR8k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195521;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I5mWneyzZUpApvjzzMikio3N//9OKEQ3GjomaQ3Y/Ks=;
	b=y6iJG40d4zheoLv4oPM93mxVUWIKsMPevc8bFoW2v+IyN1DKY5sigb1XKALNDYsB
	aHZaZ7tI6IzbPHo+bRb9xWwbB/vHFlGFK8/f/pVnToBDbxmsdq/gwLD1/peMog5H9TY
	SHXdnW08N6TyJp84os3RKxV/9E/yWgag85ww+ELw=
Content-Type: multipart/mixed; boundary="===============6266721716689921614=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0: upgrading to 1.28.3 SUCCEEDED
Message-ID: <0101019eb786bdda-63d8fe35-0d82-4c47-8346-aeab5b27e9b8-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238561

--===============6266721716689921614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.28.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.28.2-1.28.3.patch
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
From b5989fbbe5de718883eb518caa2614ab679ceea6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 14:03:14 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.28.2 -> 1.28.3

---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch      | 6 +++---
 .../0003-tests-use-a-dictionaries-for-environment.patch     | 2 +-
 ...tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.3.bb}      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b040..340603d6ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From 4e94d73a36790d22fa5b208e5f6b20ad1c5b36c7 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 720a6f0c97..de86e8938e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
+From 87b42739d347999e3ba279c400e4707161f309d2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 8adc055..b5c9e5b 100644
+index db74bdc..3c8df4d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -667,6 +667,10 @@ if bashcomp_dep.found()
+@@ -661,6 +661,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b..c6c5084aa8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From 5cc37ecfa225ad005b91c002570faef9cfd9bfc6 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445..5b5b62ab71 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From 6c0a36e6f44569060b39319278818f2440980ed7 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.3.bb
index b727783746..97bb7e8920 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "ce5cd44d4ffeafdcc3dddaa072b2179c0b7cb1abf4e6c5d18d4375f8a39fe491"
+SRC_URI[sha256sum] = "5e84ecb942e136944eb9812f19cff7bcf05a85637482a32da55b892914c397d1"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============6266721716689921614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2802.0-gdb.py /usr/lib/.debug/libgstbase-1.0.so.0.2802.0 /usr/lib/.debug/libgstnet-1.0.so.0.2802.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2802.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2802.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2802.0", added "/usr/lib/.debug/libgstreamer-1.0.so.0.2803.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2803.0-gdb.py /usr/lib/.debug/libgstbase-1.0.so.0.2803.0 /usr/lib/.debug/libgstnet-1.0.so.0.2803.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2803.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2803.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 19074935 to 19108543 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6778466 to 6781722 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ar: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ar: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-kk: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-kk: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGSIZE changed from 4218467 to 4222563 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/validate -> /usr/src/debug/gstreamer1.0/1.28.3/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/gst -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/gst, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/gst/printf -> /usr/src/debug/gstreamer1.0/1.28.3/gst/printf, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/plugins/elements -> /usr/src/debug/gstreamer1.0/1.28.3/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/gst/parse -> /usr/src/debug/gstreamer1.0/1.28.3/gst/parse, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/
 libs -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/generic -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/generic, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/elements, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tools -> /usr/src/debug/gstreamer1.0/1.28.3/tools, directory renamed /usr/src/debug/gstreamer1.0/1.28.2
 /gst -> /usr/src/debug/gstreamer1.0/1.28.3/gst, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/net
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 10023669 to 10028786 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcontroller-1.0.so.0.2802.0 /usr/lib/libgstbase-1.0.so.0.2802.0 /usr/lib/libgstcheck-1.0.so.0.2802.0 /usr/lib/libgstnet-1.0.so.0.2802.0 /usr/lib/libgstreamer-1.0.so.0.2802.0", added "/usr/lib/libgstcontroller-1.0.so.0.2803.0 /usr/lib/libgstcheck-1.0.so.0.2803.0 /usr/lib/libgstbase-1.0.so.0.2803.0 /usr/lib/libgstnet-1.0.so.0.2803.0 /usr/lib/libgstreamer-1.0.so.0.2803.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.2.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.3.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0: PV changed from "1.28.2" to "1.28.3"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2802.0 to libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2802.0 to libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2802.0 to libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2802.0 to libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2802.0 to libgstreamer-1.0.so.0.2803.0
  /usr/lib/libgstbase-1.0.so.0.2802.0 moved to /usr/lib/libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0.2802.0 moved to /usr/lib/libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0.2802.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0.2802.0 moved to /usr/lib/libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0.2802.0 moved to /usr/lib/libgstreamer-1.0.so.0.2803.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2802.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2803.0-gdb.py

--===============6266721716689921614==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.28.2-1.28.3.patch"

RnJvbSBiNTk4OWZiYmU1ZGU3MTg4ODNlYjUxOGNhYTI2MTRhYjY3OWNlZWE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTQ6MDM6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjA6IHVwZ3JhZGUgMS4yOC4yIC0+IDEuMjguMwoKLS0tCiAuLi4vMDAwMS10ZXN0
cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaCB8IDIgKy0KIC4u
Li8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaCAgICAg
IHwgNiArKystLS0KIC4uLi8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJv
bm1lbnQucGF0Y2ggICAgIHwgMiArLQogLi4udGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVu
LXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggfCAyICstCiAuLi4ve2dzdHJlYW1lcjEuMF8xLjI4
LjIuYmIgPT4gZ3N0cmVhbWVyMS4wXzEuMjguMy5iYn0gICAgICB8IDIgKy0KIDUgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wXzEuMjguMi5iYiA9PiBnc3RyZWFt
ZXIxLjBfMS4yOC4zLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVu
dGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNl
ZC1pbi1tZXNvbi5wYXRjaAppbmRleCBlMWQ4NzBiMDQwLi4zNDA2MDNkNmVhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEtdGVz
dHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJl
c3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBhZDRjNTc3ZmY4ZDI5ZjZkYmFmNWNhMmQwMTNlOWQyMWM0NGY5MTIyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZTk0ZDczYTM2NzkwZDIyZmE1YjIwOGU1ZjZiMjBhZDFj
NWIzNmM3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVh
cmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDExIEFwciAyMDIxIDE5OjQ4OjEzICsw
MTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiByZXNwZWN0IHRoZSBpZGVudGVudGFpb24gdXNl
ZCBpbiBtZXNvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAv
MDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2gKaW5kZXgg
NzIwYTZmMGM5Ny4uZGU4NmU4OTM4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0
YWxsLXRoZS10ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRl
c3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5MmU3ZDQwOTBmYTQ1OGJmMDJkMzQxOGNk
MDFjOTYwOTgyODIxZTkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4N2I0MjczOWQz
NDc5OTllM2JhMjc5YzQwMGU0NzA3MTYxZjMwOWQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTdW4s
IDExIEFwciAyMDIxIDE5OjQ4OjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBhZGQg
c3VwcG9ydCBmb3IgaW5zdGFsbCB0aGUgdGVzdHMKQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBjcmVhdGUg
bW9kZSAxMDA2NDQgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbgogCiBkaWZmIC0tZ2l0IGEv
bWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggOGFkYzA1NS4uYjVjOWU1YiAxMDA2NDQK
K2luZGV4IGRiNzRiZGMuLjNjOGRmNGQgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIv
bWVzb24uYnVpbGQKLUBAIC02NjcsNiArNjY3LDEwIEBAIGlmIGJhc2hjb21wX2RlcC5mb3VuZCgp
CitAQCAtNjYxLDYgKzY2MSwxMCBAQCBpZiBiYXNoY29tcF9kZXAuZm91bmQoKQogICAgZW5kaWYK
ICBlbmRpZgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1l
bnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaAppbmRl
eCAxMjM2MjkwZTJiLi5jNmM1MDg0YWE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVz
LWZvci1lbnZpcm9ubWVudC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZp
cm9ubWVudC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzc0YzZhY2U4M2U5Njk3YWFlMGIy
MWJhMjZmMzE2Yjc5Mjc5YzM5YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWNjMzdl
Y2ZhMjI1YWQwMDViOTFjMDAyNTcwZmFlZjljZmQ5YmZjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTog
U2F0LCAyNCBBcHIgMjAyMSAxMDozNDo0NyArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czog
dXNlIGEgZGljdGlvbmFyaWVzIGZvciBlbnZpcm9ubWVudApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxw
ZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXIt
c2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoCmluZGV4IGRmMzgyYTQ0NDUu
LjViNWI2MmFiNzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWlu
c3RhbGxlZF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1p
bnN0YWxsZWRfdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUzMWFiNDc3ZWVkMDYx
Y2M3MmVkNjc5NWI0ODM3OTVkNTNhZjZkZmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDZjMGEzNmU2ZjQ0NTY5MDYwYjM5MzE5Mjc4ODE4ZjI0NDA5ODBlZDcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4K
IERhdGU6IFN1biwgMiBNYXkgMjAyMSAwMTo1ODowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSB0
ZXN0czogYWRkIGhlbHBlciBzY3JpcHQgdG8gcnVuIHRoZSBpbnN0YWxsZWRfdGVzdHMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4y
OC4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8x
LjI4LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4LjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yOC4zLmJiCmluZGV4
IGI3Mjc3ODM3NDYuLjk3YmI3ZTg5MjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yOC4zLmJiCkBAIC0yMiw3ICsyMiw3
IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyLSR7UFZ9LnRhci54CiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXRlc3Rz
LXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3RhbGxlZF90
ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZTVjZDQ0
ZDRmZmVhZmRjYzNkZGRhYTA3MmIyMTc5YzBiN2NiMWFiZjRlNmM1ZDE4ZDQzNzVmOGEzOWZlNDkx
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVlODRlY2I5NDJlMTM2OTQ0ZWI5ODEyZjE5Y2ZmN2Jj
ZjA1YTg1NjM3NDgyYTMyZGE1NWI4OTI5MTRjMzk3ZDEiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIk
e0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJ3Rlc3RzJywgJycsIGQp
fSBcCiAgICAgICAgICAgICAgICAgICAgY2hlY2sgXAotLSAKMi40Ny4xCgo=

--===============6266721716689921614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcontroller-1.0.so.0.2802.0 /usr/lib/libgstreamer-1.0.so.0.2802.0 /usr/lib/libgstcheck-1.0.so.0.2802.0 /usr/lib/libgstnet-1.0.so.0.2802.0 /usr/lib/libgstbase-1.0.so.0.2802.0", added "/usr/lib/libgstcontroller-1.0.so.0.2803.0 /usr/lib/libgstnet-1.0.so.0.2803.0 /usr/lib/libgstreamer-1.0.so.0.2803.0 /usr/lib/libgstbase-1.0.so.0.2803.0 /usr/lib/libgstcheck-1.0.so.0.2803.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2802.0 to libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2802.0 to libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2802.0 to libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2802.0 to libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2802.0 to libgstreamer-1.0.so.0.2803.0
  /usr/lib/libgstbase-1.0.so.0.2802.0 moved to /usr/lib/libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0.2802.0 moved to /usr/lib/libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0.2802.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0.2802.0 moved to /usr/lib/libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0.2802.0 moved to /usr/lib/libgstreamer-1.0.so.0.2803.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2802.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2803.0-gdb.py

--===============6266721716689921614==--

