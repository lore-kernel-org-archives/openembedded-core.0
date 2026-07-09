Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B774EC44512
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2994.1783577520198284789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EpqQR6El;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IX0t4vQJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f4581256d-5728b9f3-81e3-4fba-8e19-987ad46a3743-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577519;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=1N5Q/QfRoE8qRAs7J8VDtqhARmrPyt+ijN/1VLUAJxY=;
	b=EpqQR6ElyhUoy93PMF4ceI6wBMJj94Dc/hfdFlqvILvVDJuhXPBQ5W8LYz2xn5pd
	NtZqJ9PR2NkuO4lu7AODXoe6PzAxxVDxS4DclnJpanRzeuV8SQObtRSyTgZ9YeAmQum
	HpDyaLxk2haJRlhpFHWY8U96j4m1GZgOCVazGw5I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577519;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=1N5Q/QfRoE8qRAs7J8VDtqhARmrPyt+ijN/1VLUAJxY=;
	b=IX0t4vQJXyrhUIp669LtWDwzNwtIF4aEIbzUkquOBMrNm8KXsqsqpBtqamw3dsi+
	MeAKNC3CfBksKWGs5lE7uYyt2C574qOhSj29Vakik9yvvB2y5Vqn9AS0BK5JIGyYQ+j
	xxZin6dw9EH6X1p8ZGBfqFX/94VlIWsrWlD6oUoY=
Content-Type: multipart/mixed; boundary="===============8276680519295815987=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.28.5 SUCCEEDED
Message-ID: <0101019f4581256d-5728b9f3-81e3-4fba-8e19-987ad46a3743-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240539

--===============8276680519295815987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.28.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.28.4-1.28.5.patch
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
From 18eba0cedec987b3a54cd89ef1692e83b542b2a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 06:00:43 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.28.4 -> 1.28.5

---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch      | 6 +++---
 .../0003-tests-use-a-dictionaries-for-environment.patch     | 2 +-
 ...tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.4.bb => gstreamer1.0_1.28.5.bb}      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.4.bb => gstreamer1.0_1.28.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index de255bf791..6169d9d1b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 4e6aae8cbddb4567388f8f19919c2c17e36e0356 Mon Sep 17 00:00:00 2001
+From 3cea281141a16e63eb409a6daadcc0576ed19f68 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 957356c2ba..4295a48922 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 34d24b8d66088d92ca306a488028dee82a6f6982 Mon Sep 17 00:00:00 2001
+From 9505f9c64ae6ef4755ae76f68fef95672501da00 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index abd0ad6..93cd692 100644
+index a534231..3e25a5c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -661,6 +661,10 @@ if bashcomp_dep.found()
+@@ -662,6 +662,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index bc6dfe353a..515c6b5707 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From f34bc3040b1564a3d39de4a4426326866c437dae Mon Sep 17 00:00:00 2001
+From f4fd03742fea40d328c4ea51d036ee6844dfeaec Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 8eb4bc2a81..93cad8c49b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From ee4f5bd19394e055109486d88ff8e876c5c2572f Mon Sep 17 00:00:00 2001
+From be3ed0ed0e7b64ad8f42f866b45a14a7e62f9f8f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
index 59f4e99c70..4debccdc17 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "f5adc7e8f448c10260b3b25aa101c9d540674c8d9a54c2b77a86d04f2b3b50dd"
+SRC_URI[sha256sum] = "a5a9f783809b17a8eb774f4a7695b2cb8cba6b15520129906f87eaf30e7f8469"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============8276680519295815987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2804.0-gdb.py /usr/lib/.debug/libgstbase-1.0.so.0.2804.0 /usr/lib/.debug/libgstnet-1.0.so.0.2804.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2804.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2804.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2804.0", added "/usr/lib/.debug/libgstbase-1.0.so.0.2805.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2805.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2805.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2805.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2805.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 19126167 to 19170687 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6781737 to 6781752 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ar: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ar: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-kk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-kk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.28.4/gst -> /usr/src/debug/gstreamer1.0/1.28.5/gst, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.28.5/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.28.5/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/gst/printf -> /usr/src/debug/gstreamer1.0/1.28.5/gst/printf, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.28.5/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.28.5/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.28.5/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tests/check/pipelines ->
  /usr/src/debug/gstreamer1.0/1.28.5/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tests/validate -> /usr/src/debug/gstreamer1.0/1.28.5/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.28.5/tests/check/elements, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.28.5/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/plugins/elements -> /usr/src/debug/gstreamer1.0/1.28.5/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.28.5/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tests/check/generic -> /usr/src/debug/gstreamer1.0/1.28.5/tests/check/generic, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tools -> /usr/src/debug/gstreamer1.0/1.28.5/tools, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/gst/parse
  -> /usr/src/debug/gstreamer1.0/1.28.5/gst/parse, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.28.5/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/1.28.4/tests/check/gst -> /usr/src/debug/gstreamer1.0/1.28.5/tests/check/gst
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 10039199 to 10052787 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcheck-1.0.so.0.2804.0 /usr/lib/libgstcontroller-1.0.so.0.2804.0 /usr/lib/libgstbase-1.0.so.0.2804.0 /usr/lib/libgstnet-1.0.so.0.2804.0 /usr/lib/libgstreamer-1.0.so.0.2804.0", added "/usr/lib/libgstcheck-1.0.so.0.2805.0 /usr/lib/libgstcontroller-1.0.so.0.2805.0 /usr/lib/libgstbase-1.0.so.0.2805.0 /usr/lib/libgstreamer-1.0.so.0.2805.0 /usr/lib/libgstnet-1.0.so.0.2805.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGSIZE changed from 3515814 to 3528102 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.4.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.5.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: PV changed from "1.28.4" to "1.28.5"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2804.0 to libgstbase-1.0.so.0.2805.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2804.0 to libgstcheck-1.0.so.0.2805.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2804.0 to libgstcontroller-1.0.so.0.2805.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2804.0 to libgstnet-1.0.so.0.2805.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2804.0 to libgstreamer-1.0.so.0.2805.0
  /usr/lib/libgstbase-1.0.so.0.2804.0 moved to /usr/lib/libgstbase-1.0.so.0.2805.0
  /usr/lib/libgstcheck-1.0.so.0.2804.0 moved to /usr/lib/libgstcheck-1.0.so.0.2805.0
  /usr/lib/libgstcontroller-1.0.so.0.2804.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2805.0
  /usr/lib/libgstnet-1.0.so.0.2804.0 moved to /usr/lib/libgstnet-1.0.so.0.2805.0
  /usr/lib/libgstreamer-1.0.so.0.2804.0 moved to /usr/lib/libgstreamer-1.0.so.0.2805.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2804.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2805.0-gdb.py

--===============8276680519295815987==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.28.4-1.28.5.patch"

RnJvbSAxOGViYTBjZWRlYzk4N2IzYTU0Y2Q4OWVmMTY5MmU4M2I1NDJiMmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNjowMDo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMDogdXBncmFkZSAxLjI4LjQgLT4gMS4yOC41CgotLS0KIC4uLi8wMDAxLXRlc3Rz
LXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIHwgMiArLQogLi4u
LzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoICAgICAg
fCA2ICsrKy0tLQogLi4uLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9u
bWVudC5wYXRjaCAgICAgfCAyICstCiAuLi50ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4t
dGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaCB8IDIgKy0KIC4uLi97Z3N0cmVhbWVyMS4wXzEuMjgu
NC5iYiA9PiBnc3RyZWFtZXIxLjBfMS4yOC41LmJifSAgICAgIHwgMiArLQogNSBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjBfMS4yOC40LmJiID0+IGdzdHJlYW1l
cjEuMF8xLjI4LjUuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50
YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2Vk
LWluLW1lc29uLnBhdGNoCmluZGV4IGRlMjU1YmY3OTEuLjYxNjlkOWQxYjYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0
cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEtdGVzdHMtcmVz
cGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDRlNmFhZThjYmRkYjQ1NjczODhmOGYxOTkxOWMyYzE3ZTM2ZTAzNTYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDNjZWEyODExNDFhMTZlNjNlYjQwOWE2ZGFhZGNjMDU3NmVk
MTlmNjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFy
ZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAx
MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJlc3BlY3QgdGhlIGlkZW50ZW50YWlvbiB1c2Vk
IGluIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3Rz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8w
MDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaAppbmRleCA5
NTczNTZjMmJhLi40Mjk1YTQ4OTIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3Rh
bGwtdGhlLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVz
dHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM0ZDI0YjhkNjYwODhkOTJjYTMwNmE0ODgw
MjhkZWU4MmE2ZjY5ODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk1MDVmOWM2NGFl
NmVmNDc1NWFlNzZmNjhmZWY5NTY3MjUwMWRhMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwg
MTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBz
dXBwb3J0IGZvciBpbnN0YWxsIHRoZSB0ZXN0cwpAQCAtMTksMTAgKzE5LDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0ZXN0cy9jaGVjay90ZW1wbGF0ZS50ZXN0LmluCiAKIGRpZmYgLS1naXQgYS9t
ZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBhYmQwYWQ2Li45M2NkNjkyIDEwMDY0NAor
aW5kZXggYTUzNDIzMS4uM2UyNWE1YyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9t
ZXNvbi5idWlsZAotQEAgLTY2MSw2ICs2NjEsMTAgQEAgaWYgYmFzaGNvbXBfZGVwLmZvdW5kKCkK
K0BAIC02NjIsNiArNjYyLDEwIEBAIGlmIGJhc2hjb21wX2RlcC5mb3VuZCgpCiAgICBlbmRpZgog
IGVuZGlmCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVu
dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAv
MDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoCmluZGV4
IGJjNmRmZTM1M2EuLjUxNWM2YjU3MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMt
Zm9yLWVudmlyb25tZW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmly
b25tZW50LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMzRiYzMwNDBiMTU2NGEzZDM5ZGU0
YTQ0MjYzMjY4NjZjNDM3ZGFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNGZkMDM3
NDJmZWE0MGQzMjhjNGVhNTFkMDM2ZWU2ODQ0ZGZlYWVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBT
YXQsIDI0IEFwciAyMDIxIDEwOjM0OjQ3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiB1
c2UgYSBkaWN0aW9uYXJpZXMgZm9yIGVudmlyb25tZW50CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBl
ci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1z
Y3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2gKaW5kZXggOGViNGJjMmE4MS4u
OTNjYWQ4YzQ5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5z
dGFsbGVkX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWlu
c3RhbGxlZF90ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWU0ZjViZDE5Mzk0ZTA1
NTEwOTQ4NmQ4OGZmOGU4NzZjNWMyNTcyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YmUzZWQwZWQwZTdiNjRhZDhmNDJmODY2YjQ1YTE0YTdlNjJmOWY4ZiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgog
RGF0ZTogU3VuLCAyIE1heSAyMDIxIDAxOjU4OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRl
c3RzOiBhZGQgaGVscGVyIHNjcmlwdCB0byBydW4gdGhlIGluc3RhbGxlZF90ZXN0cwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4
LjQuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEu
MjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjguNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4LjUuYmIKaW5kZXgg
NTlmNGU5OWM3MC4uNGRlYmNjZGMxNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4LjUuYmIKQEAgLTIyLDcgKzIyLDcg
QEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdHJl
YW1lci9nc3RyZWFtZXItJHtQVn0udGFyLngKICAgICAgICAgICAgZmlsZTovLzAwMDMtdGVzdHMt
dXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rl
c3RzLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1YWRjN2U4
ZjQ0OGMxMDI2MGIzYjI1YWExMDFjOWQ1NDA2NzRjOGQ5YTU0YzJiNzdhODZkMDRmMmIzYjUwZGQi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTVhOWY3ODM4MDliMTdhOGViNzc0ZjRhNzY5NWIyY2I4
Y2JhNmIxNTUyMDEyOTkwNmY4N2VhZjMwZTdmODQ2OSIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9
IFwKICAgICAgICAgICAgICAgICAgICBjaGVjayBcCi0tIAoyLjQ3LjEKCg==

--===============8276680519295815987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstreamer-1.0.so.0.2804.0 /usr/lib/libgstcheck-1.0.so.0.2804.0 /usr/lib/libgstcontroller-1.0.so.0.2804.0 /usr/lib/libgstbase-1.0.so.0.2804.0 /usr/lib/libgstnet-1.0.so.0.2804.0", added "/usr/lib/libgstcheck-1.0.so.0.2805.0 /usr/lib/libgstreamer-1.0.so.0.2805.0 /usr/lib/libgstcontroller-1.0.so.0.2805.0 /usr/lib/libgstnet-1.0.so.0.2805.0 /usr/lib/libgstbase-1.0.so.0.2805.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2804.0 to libgstbase-1.0.so.0.2805.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2804.0 to libgstcheck-1.0.so.0.2805.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2804.0 to libgstcontroller-1.0.so.0.2805.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2804.0 to libgstnet-1.0.so.0.2805.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2804.0 to libgstreamer-1.0.so.0.2805.0
  /usr/lib/libgstbase-1.0.so.0.2804.0 moved to /usr/lib/libgstbase-1.0.so.0.2805.0
  /usr/lib/libgstcheck-1.0.so.0.2804.0 moved to /usr/lib/libgstcheck-1.0.so.0.2805.0
  /usr/lib/libgstcontroller-1.0.so.0.2804.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2805.0
  /usr/lib/libgstnet-1.0.so.0.2804.0 moved to /usr/lib/libgstnet-1.0.so.0.2805.0
  /usr/lib/libgstreamer-1.0.so.0.2804.0 moved to /usr/lib/libgstreamer-1.0.so.0.2805.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2804.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2805.0-gdb.py

--===============8276680519295815987==--

