Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F816CFD31C
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53262.1728588944704958677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cQ7IeKz3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=slx8LE3q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277ee5d51-750ca481-0605-41e1-a31f-397d92b06207-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588963;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h3QLZrlBMMcYhuSeaBdejwohyad10kXgy3NO+MPYaf8=;
	b=cQ7IeKz3LBrbKdCRl3y2GkzLqFdY97bPZdzSAD8mo/SJ1XkCxAwgxJLNAThCVeXj
	pKtIwx1kKf2Ykk6BmmoioC+tCVQxMS1bB98+g+ThJKLeoSAgpzLg5rh39nWKG+Wn9p0
	d/Ag1vkgGgYwy6bcGfRIQotWF4fquD4jBRTy30sE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588963;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h3QLZrlBMMcYhuSeaBdejwohyad10kXgy3NO+MPYaf8=;
	b=slx8LE3q6mi4Y3kxGShz2YU6bgXhpeNOCl7Ow5NjMUICcOUOw7E++dotfvFNUnrQ
	1hyW+zzU2eixRbTgiwivhZe9wVNwqtAPMsEF6cEUkH8Fl2/H07Ynajt7+JzLs0E5AfQ
	FFlqNu7+4VL0e1vEtXbWMh+yU4cnVMFcwjAqU1cE=
Content-Type: multipart/mixed; boundary="===============1716336533023355500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.24.8 SUCCEEDED
Message-ID: <0101019277ee5d51-750ca481-0605-41e1-a31f-397d92b06207-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205504

--===============1716336533023355500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.24.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.24.6-1.24.8.patch
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
From cff0db28609103adc2904d4c21e87fdd4f1c2174 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 05:58:56 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.24.6 -> 1.24.8

---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.24.6.bb => gstreamer1.0_1.24.8.bb}        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.6.bb => gstreamer1.0_1.24.8.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 80e6ca3f99..9f797090a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 9c932b1c17d62a3e54c2dc55b1f75dc48d73134c Mon Sep 17 00:00:00 2001
+From 9f129c4294348beee5d544192cde0e7a04c5c710 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 4d88706a4a..12ec7455b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 32707203ac17cd7130224445aa760f36d4cec579 Mon Sep 17 00:00:00 2001
+From 8bb6e1ed59343449b989d5f89515b18851fd5866 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 1d87075..6aaf23c 100644
+index 6188e09..dd9f0f3 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -645,6 +645,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 8d0c6dbf34..ef538fbb3b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From fca19b2f5db1be4daef4ea00c60a64120fa08178 Mon Sep 17 00:00:00 2001
+From c386a31ce7d8a529f54efc60b38cd659557c8a73 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 629b0563f6..0190481fa3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 5f80e65b73fee2d081ff4ffb442f71eb5b0ccfc4 Mon Sep 17 00:00:00 2001
+From 7082b09fa160f69cabb29806a260b7cb72a60107 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.8.bb
index 71ff327675..16ce4e3bb2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.8.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "64342060d7c6f9e36a35e3be38a4f5ac3b41ed93b0853619be45141ef3cc1b9d"
+SRC_URI[sha256sum] = "b807dbf36c5d2b3ce1c604133ed0c737350f9523ce4d8d644a1177c5f9d6ded3"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.44.1


--===============1716336533023355500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstnet-1.0.so.0.2406.0 /usr/lib/libgstcontroller-1.0.so.0.2406.0 /usr/lib/libgstbase-1.0.so.0.2406.0 /usr/lib/libgstcheck-1.0.so.0.2406.0 /usr/lib/libgstreamer-1.0.so.0.2406.0", added "/usr/lib/libgstbase-1.0.so.0.2408.0 /usr/lib/libgstcheck-1.0.so.0.2408.0 /usr/lib/libgstnet-1.0.so.0.2408.0 /usr/lib/libgstcontroller-1.0.so.0.2408.0 /usr/lib/libgstreamer-1.0.so.0.2408.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2406.0 to libgstbase-1.0.so.0.2408.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2406.0 to libgstcheck-1.0.so.0.2408.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2406.0 to libgstcontroller-1.0.so.0.2408.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2406.0 to libgstnet-1.0.so.0.2408.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2406.0 to libgstreamer-1.0.so.0.2408.0
  /usr/lib/libgstbase-1.0.so.0.2406.0 moved to /usr/lib/libgstbase-1.0.so.0.2408.0
  /usr/lib/libgstcheck-1.0.so.0.2406.0 moved to /usr/lib/libgstcheck-1.0.so.0.2408.0
  /usr/lib/libgstcontroller-1.0.so.0.2406.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2408.0
  /usr/lib/libgstnet-1.0.so.0.2406.0 moved to /usr/lib/libgstnet-1.0.so.0.2408.0
  /usr/lib/libgstreamer-1.0.so.0.2406.0 moved to /usr/lib/libgstreamer-1.0.so.0.2408.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2406.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2408.0-gdb.py

--===============1716336533023355500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 15717543 to 15717687 (+0%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstcontroller-1.0.so.0.2406.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2406.0-gdb.py /usr/lib/.debug/libgstcheck-1.0.so.0.2406.0 /usr/lib/.debug/libgstbase-1.0.so.0.2406.0 /usr/lib/.debug/libgstnet-1.0.so.0.2406.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2406.0", added "/usr/lib/.debug/libgstcontroller-1.0.so.0.2408.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2408.0-gdb.py /usr/lib/.debug/libgstbase-1.0.so.0.2408.0 /usr/lib/.debug/libgstnet-1.0.so.0.2408.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2408.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2408.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6179047 to 6179076 (+0%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGSIZE changed from 3973392 to 3973424 (+0%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9548544 to 9551034 (+0%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcheck-1.0.so.0.2406.0 /usr/lib/libgstnet-1.0.so.0.2406.0 /usr/lib/libgstbase-1.0.so.0.2406.0 /usr/lib/libgstcontroller-1.0.so.0.2406.0 /usr/lib/libgstreamer-1.0.so.0.2406.0", added "/usr/lib/libgstcheck-1.0.so.0.2408.0 /usr/lib/libgstreamer-1.0.so.0.2408.0 /usr/lib/libgstnet-1.0.so.0.2408.0 /usr/lib/libgstcontroller-1.0.so.0.2408.0 /usr/lib/libgstbase-1.0.so.0.2408.0"
packages/core2-64-poky-linux/gstreamer1.0: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.6.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.8.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/core2-64-poky-linux/gstreamer1.0: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
Changes to packages/core2-64-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2406.0 to libgstbase-1.0.so.0.2408.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2406.0 to libgstcheck-1.0.so.0.2408.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2406.0 to libgstcontroller-1.0.so.0.2408.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2406.0 to libgstnet-1.0.so.0.2408.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2406.0 to libgstreamer-1.0.so.0.2408.0
  /usr/lib/libgstbase-1.0.so.0.2406.0 moved to /usr/lib/libgstbase-1.0.so.0.2408.0
  /usr/lib/libgstcheck-1.0.so.0.2406.0 moved to /usr/lib/libgstcheck-1.0.so.0.2408.0
  /usr/lib/libgstcontroller-1.0.so.0.2406.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2408.0
  /usr/lib/libgstnet-1.0.so.0.2406.0 moved to /usr/lib/libgstnet-1.0.so.0.2408.0
  /usr/lib/libgstreamer-1.0.so.0.2406.0 moved to /usr/lib/libgstreamer-1.0.so.0.2408.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2406.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2408.0-gdb.py

--===============1716336533023355500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.24.6-1.24.8.patch"

RnJvbSBjZmYwZGIyODYwOTEwM2FkYzI5MDRkNGMyMWU4N2ZkZDRmMWMyMTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDU6NTg6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjA6IHVwZ3JhZGUgMS4yNC42IC0+IDEuMjQuOAoKLS0tCiAuLi4vMDAwMS10ZXN0
cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaCAgIHwgMiArLQog
Li4uLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoICAg
ICAgICB8IDQgKystLQogLi4uLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZp
cm9ubWVudC5wYXRjaCAgICAgICB8IDIgKy0KIC4uLjQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQt
dG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggfCAyICstCiAuLi4ve2dzdHJlYW1lcjEu
MF8xLjI0LjYuYmIgPT4gZ3N0cmVhbWVyMS4wXzEuMjQuOC5iYn0gICAgICAgIHwgMiArLQogNSBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjBfMS4yNC42LmJiID0+
IGdzdHJlYW1lcjEuMF8xLjI0LjguYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhl
LWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50
YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCmluZGV4IDgwZTZjYTNmOTkuLjlmNzk3MDkwYTIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAv
MDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEt
dGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDljOTMyYjFjMTdkNjJhM2U1NGMyZGM1NWIxZjc1ZGM0OGQ3MzEzNGMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlmMTI5YzQyOTQzNDhiZWVlNWQ1NDQxOTJj
ZGUwZTdhMDRjNWM3MTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJl
c21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTEgQXByIDIwMjEgMTk6
NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJlc3BlY3QgdGhlIGlkZW50ZW50
YWlvbiB1c2VkIGluIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwt
dGhlLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRj
aAppbmRleCA0ZDg4NzA2YTRhLi4xMmVjNzQ1NWIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQt
Zm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFs
bC10aGUtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMyNzA3MjAzYWMxN2NkNzEz
MDIyNDQ0NWFhNzYwZjM2ZDRjZWM1NzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhi
YjZlMWVkNTkzNDM0NDliOTg5ZDVmODk1MTViMTg4NTFmZDU4NjYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERh
dGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVz
dHM6IGFkZCBzdXBwb3J0IGZvciBpbnN0YWxsIHRoZSB0ZXN0cwpAQCAtMTksNyArMTksNyBAQCBT
aWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBj
cmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbgogCiBkaWZmIC0t
Z2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMWQ4NzA3NS4uNmFhZjIzYyAx
MDA2NDQKK2luZGV4IDYxODhlMDkuLmRkOWYwZjMgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAog
KysrIGIvbWVzb24uYnVpbGQKIEBAIC02NDUsNiArNjQ1LDEwIEBAIGlmIGJhc2hjb21wX2RlcC5m
b3VuZCgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAw
My10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoCmluZGV4IDhk
MGM2ZGJmMzQuLmVmNTM4ZmJiM2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9y
LWVudmlyb25tZW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25t
ZW50LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmY2ExOWIyZjVkYjFiZTRkYWVmNGVhMDBj
NjBhNjQxMjBmYTA4MTc4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMzg2YTMxY2U3
ZDhhNTI5ZjU0ZWZjNjBiMzhjZDY1OTU1N2M4YTczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQs
IDI0IEFwciAyMDIxIDEwOjM0OjQ3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiB1c2Ug
YSBkaWN0aW9uYXJpZXMgZm9yIGVudmlyb25tZW50CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1z
Y3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3Jp
cHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2gKaW5kZXggNjI5YjA1NjNmNi4uMDE5
MDQ4MWZhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFs
bGVkX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3Rh
bGxlZF90ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWY4MGU2NWI3M2ZlZTJkMDgx
ZmY0ZmZiNDQyZjcxZWI1YjBjY2ZjNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzA4
MmIwOWZhMTYwZjY5Y2FiYjI5ODA2YTI2MGI3Y2I3MmE2MDEwNyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0
ZTogU3VuLCAyIE1heSAyMDIxIDAxOjU4OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3Rz
OiBhZGQgaGVscGVyIHNjcmlwdCB0byBydW4gdGhlIGluc3RhbGxlZF90ZXN0cwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI0LjYu
YmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjQu
OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjQuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI0LjguYmIKaW5kZXggNzFm
ZjMyNzY3NS4uMTZjZTRlM2JiMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI0LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI0LjguYmIKQEAgLTIyLDcgKzIyLDcgQEAg
U1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdHJlYW1l
ci9nc3RyZWFtZXItJHtQVn0udGFyLngKICAgICAgICAgICAgZmlsZTovLzAwMDMtdGVzdHMtdXNl
LWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3Rz
LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY0MzQyMDYwZDdj
NmY5ZTM2YTM1ZTNiZTM4YTRmNWFjM2I0MWVkOTNiMDg1MzYxOWJlNDUxNDFlZjNjYzFiOWQiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYjgwN2RiZjM2YzVkMmIzY2UxYzYwNDEzM2VkMGM3MzczNTBm
OTUyM2NlNGQ4ZDY0NGExMTc3YzVmOWQ2ZGVkMyIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJi
LnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9IFwK
ICAgICAgICAgICAgICAgICAgICBjaGVjayBcCi0tIAoyLjQ0LjEKCg==

--===============1716336533023355500==--

