Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E64EEE261
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102962.1767267468928181330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NRQRe/31;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bGV5gnzN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b7959b939-ed003273-1a0c-4b48-9796-094af7613b2e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FGP1ESiEXWGArLa1B5Y5EXmKQ1hxOzhcynJpN2eixIs=;
	b=NRQRe/31Xe/SyIuM06KU4PCWxNIWxu7A+srRnUMvR4SYKVzU1jmOGpegL6BTihLp
	byG1RK8aGORTX9GzvKm9190SEaLRboHq5vTdk0l72Sl8h5jBqzFAHX64Vt1Vfaw4Uf/
	q8ywjfObyAhwONqwN7noWzquyw0SLykDDU/rFAyY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FGP1ESiEXWGArLa1B5Y5EXmKQ1hxOzhcynJpN2eixIs=;
	b=bGV5gnzN4HToWqauTpUzFddmCNEfnnBiPis4hwSqcLBH9EG4ZUrFuwSAEGZcRFeb
	NP1RmzG8P8Z409sxTCa4Ho5AQV1sH0xM5+d2xaqf0hKz+6/k8In1dTquqX5n6zVEzyR
	6F4fuUXN2makjChb2g7tEdCn0xeL/SOG72hX0C8c=
Content-Type: multipart/mixed; boundary="===============0165002628761737597=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0: upgrading to 1.26.10 SUCCEEDED
Message-ID: <0101019b7959b939-ed003273-1a0c-4b48-9796-094af7613b2e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228809

--===============0165002628761737597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.26.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.26.9-1.26.10.patch
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
From 7d93947246648fc28125108c6e61166956c617fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 11:13:27 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.26.9 -> 1.26.10

---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.26.9.bb => gstreamer1.0_1.26.10.bb}       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb => gstreamer1.0_1.26.10.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b040..715cf90bac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From 223e7d7fd9dece2db90786a6e15c7baefc5331b6 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index ccfc869813..de3c5d091b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
+From 87fa1acc2516933a6a53b0a46c8ee17811b3520f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 0a77e90..cadfaeb 100644
+index 82cfdd8..fe6774c 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -664,6 +664,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b..71360d5c59 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From 7f0a3f7ecf8a31883e420c3aa0239a801c41c065 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445..8ea825b5ca 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From 6a1861cca7c367a48a9651014fd4e6969925b336 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.10.bb
index c66f614629..e31e0f4086 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.10.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff23aecde80670c8"
+SRC_URI[sha256sum] = "d7f20bec75edeb8677662926c33e987da64a42616c24fc3353b9ad44ed750cd6"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============0165002628761737597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstreamer-1.0.so.0.2609.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2609.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2609.0 /usr/lib/.debug/libgstbase-1.0.so.0.2609.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2609.0", added "/usr/lib/.debug/libgstcontroller-1.0.so.0.2610.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2610.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2610.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2610.0 /usr/lib/.debug/libgstbase-1.0.so.0.2610.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 17631839 to 17633831 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6481612 to 6481616 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.26.9/gst -> /usr/src/debug/gstreamer1.0/1.26.10/gst, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/validate -> /usr/src/debug/gstreamer1.0/1.26.10/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/chec
 k/libcheck -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/plugins/elements -> /usr/src/debug/gstreamer1.0/1.26.10/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/elements, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/gst -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/gst, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/gst/parse -> /usr/src/debug/gstreamer1.0/1.26.10/gst/parse, directory renamed /usr/src/debug/gstreamer1
 .0/1.26.9/gst/printf -> /usr/src/debug/gstreamer1.0/1.26.10/gst/printf, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tools -> /usr/src/debug/gstreamer1.0/1.26.10/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/generic -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/generic
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9738771 to 9739171 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstnet-1.0.so.0.2609.0 /usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstbase-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0 /usr/lib/libgstreamer-1.0.so.0.2609.0", added "/usr/lib/libgstcheck-1.0.so.0.2610.0 /usr/lib/libgstnet-1.0.so.0.2610.0 /usr/lib/libgstcontroller-1.0.so.0.2610.0 /usr/lib/libgstreamer-1.0.so.0.2610.0 /usr/lib/libgstbase-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.9.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.10.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2609.0 to libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2609.0 to libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2609.0 to libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2609.0 to libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2609.0 to libgstreamer-1.0.so.0.2610.0
  /usr/lib/libgstbase-1.0.so.0.2609.0 moved to /usr/lib/libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0.2609.0 moved to /usr/lib/libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0.2609.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0.2609.0 moved to /usr/lib/libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0.2609.0 moved to /usr/lib/libgstreamer-1.0.so.0.2610.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2610.0-gdb.py

--===============0165002628761737597==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.26.9-1.26.10.patch"

RnJvbSA3ZDkzOTQ3MjQ2NjQ4ZmMyODEyNTEwOGM2ZTYxMTY2OTU2YzYxN2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMToxMzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMDogdXBncmFkZSAxLjI2LjkgLT4gMS4yNi4xMAoKLS0tCiAuLi4vMDAwMS10ZXN0
cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaCAgIHwgMiArLQog
Li4uLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoICAg
ICAgICB8IDQgKystLQogLi4uLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZp
cm9ubWVudC5wYXRjaCAgICAgICB8IDIgKy0KIC4uLjQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQt
dG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggfCAyICstCiAuLi4ve2dzdHJlYW1lcjEu
MF8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wXzEuMjYuMTAuYmJ9ICAgICAgIHwgMiArLQogNSBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjBfMS4yNi45LmJiID0+
IGdzdHJlYW1lcjEuMF8xLjI2LjEwLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRo
ZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVu
dGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaAppbmRleCBlMWQ4NzBiMDQwLi43MTVjZjkwYmFjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LzAwMDEtdGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAx
LXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBhZDRjNTc3ZmY4ZDI5ZjZkYmFmNWNhMmQwMTNlOWQyMWM0NGY5MTIy
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyMjNlN2Q3ZmQ5ZGVjZTJkYjkwNzg2YTZl
MTVjN2JhZWZjNTMzMWI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFy
ZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDExIEFwciAyMDIxIDE5
OjQ4OjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiByZXNwZWN0IHRoZSBpZGVudGVu
dGFpb24gdXNlZCBpbiBtZXNvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxs
LXRoZS10ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0
Y2gKaW5kZXggY2NmYzg2OTgxMy4uZGUzYzVkMDkxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0
LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3Rh
bGwtdGhlLXRlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMzMwNjMzNjA3OTFlMTc4
ZGUxMzgzMDRlMjlhYjIyNjQ1ODJkOTE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4
N2ZhMWFjYzI1MTY5MzNhNmE1M2IwYTQ2YzhlZTE3ODExYjM1MjBmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBE
YXRlOiBTdW4sIDExIEFwciAyMDIxIDE5OjQ4OjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRl
c3RzOiBhZGQgc3VwcG9ydCBmb3IgaW5zdGFsbCB0aGUgdGVzdHMKQEAgLTE5LDcgKzE5LDcgQEAg
U2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2NoZWNrL3RlbXBsYXRlLnRlc3QuaW4KIAogZGlmZiAt
LWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDBhNzdlOTAuLmNhZGZhZWIg
MTAwNjQ0CitpbmRleCA4MmNmZGQ4Li5mZTY3NzRjIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQK
ICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNjY0LDYgKzY2NCwxMCBAQCBpZiBiYXNoY29tcF9kZXAu
Zm91bmQoKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAw
MDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaAppbmRleCAx
MjM2MjkwZTJiLi43MTM2MGQ1YzU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZv
ci1lbnZpcm9ubWVudC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9u
bWVudC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzc0YzZhY2U4M2U5Njk3YWFlMGIyMWJh
MjZmMzE2Yjc5Mjc5YzM5YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2YwYTNmN2Vj
ZjhhMzE4ODNlNDIwYzNhYTAyMzlhODAxYzQxYzA2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU2F0
LCAyNCBBcHIgMjAyMSAxMDozNDo0NyArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogdXNl
IGEgZGljdGlvbmFyaWVzIGZvciBlbnZpcm9ubWVudApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXIt
c2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2Ny
aXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoCmluZGV4IGRmMzgyYTQ0NDUuLjhl
YTgyNWI1Y2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3Rh
bGxlZF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0
YWxsZWRfdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUzMWFiNDc3ZWVkMDYxY2M3
MmVkNjc5NWI0ODM3OTVkNTNhZjZkZmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZh
MTg2MWNjYTdjMzY3YTQ4YTk2NTEwMTRmZDRlNjk2OTkyNWIzMzYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERh
dGU6IFN1biwgMiBNYXkgMjAyMSAwMTo1ODowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0
czogYWRkIGhlbHBlciBzY3JpcHQgdG8gcnVuIHRoZSBpbnN0YWxsZWRfdGVzdHMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yNi45
LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2
LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yNi45LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjYuMTAuYmIKaW5kZXgg
YzY2ZjYxNDYyOS4uZTMxZTBmNDA4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2LjEwLmJiCkBAIC0yMiw3ICsyMiw3
IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyLSR7UFZ9LnRhci54CiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXRlc3Rz
LXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3RhbGxlZF90
ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZWU4Nzcy
ZTQ2ODEwMmViZTg2ZDQxNGQ4YzRjNzQ0MGRkOTFkOWYzZTkzOTY5NTJmZjIzYWVjZGU4MDY3MGM4
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3ZjIwYmVjNzVlZGViODY3NzY2MjkyNmMzM2U5ODdk
YTY0YTQyNjE2YzI0ZmMzMzUzYjlhZDQ0ZWQ3NTBjZDYiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIk
e0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJ3Rlc3RzJywgJycsIGQp
fSBcCiAgICAgICAgICAgICAgICAgICAgY2hlY2sgXAotLSAKMi40Ny4xCgo=

--===============0165002628761737597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstnet-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0 /usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstreamer-1.0.so.0.2609.0 /usr/lib/libgstbase-1.0.so.0.2609.0", added "/usr/lib/libgstnet-1.0.so.0.2610.0 /usr/lib/libgstreamer-1.0.so.0.2610.0 /usr/lib/libgstcheck-1.0.so.0.2610.0 /usr/lib/libgstcontroller-1.0.so.0.2610.0 /usr/lib/libgstbase-1.0.so.0.2610.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2609.0 to libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2609.0 to libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2609.0 to libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2609.0 to libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2609.0 to libgstreamer-1.0.so.0.2610.0
  /usr/lib/libgstbase-1.0.so.0.2609.0 moved to /usr/lib/libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0.2609.0 moved to /usr/lib/libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0.2609.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0.2609.0 moved to /usr/lib/libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0.2609.0 moved to /usr/lib/libgstreamer-1.0.so.0.2610.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2610.0-gdb.py

--===============0165002628761737597==--

