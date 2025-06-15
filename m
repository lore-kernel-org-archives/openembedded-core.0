Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B45C7EE31
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8863.1749993282158080202
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mNXp65W9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VJOfT3Pq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019773ba6486-30e6a9b0-ae02-4aa2-b5ae-49e1587e2d8b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FvQy4WdQRnCoQd/cWGczHKc2/yQ9PDPzeUTu8TYG7YU=;
	b=mNXp65W98H0WjbevEaFUXM43la5gTN1YkFl9BKVQzj7XWdR3NRA9TdoxgshK+9/m
	FjPGee/zwlDl6dfehIN1SOnPI06Ibv5hPP7I/6oVmddv+VF5tcAd+kSD0OfavSEGCRR
	smfP7p/iSBvIBneIPOm4LG1DNC0c/kFFQOtTRpYw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FvQy4WdQRnCoQd/cWGczHKc2/yQ9PDPzeUTu8TYG7YU=;
	b=VJOfT3Pq3quvkCtxQbWw8xuOhhzdHg6LI7rmgp7upyN89XEBzDdAufd1E8E/21Qo
	8cZMrkEnYc1wuNf28VC1KFCJfovYjPfZzEMbQAAGd6yPSGPB38B5TxQWTB0LW2g2ztW
	6tSZEj2LPZFfALL/BWA/8gH217vVzlclv6KG8O7U=
Content-Type: multipart/mixed; boundary="===============0983461482953012031=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.8.2 SUCCEEDED
Message-ID: <0101019773ba6486-30e6a9b0-ae02-4aa2-b5ae-49e1587e2d8b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218671

--===============0983461482953012031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.8.1-1.8.2.patch
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
From 29ac6841828015354c80f1aaa697deba99518571 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 07:57:07 +0000
Subject: [PATCH] meson: upgrade 1.8.1 -> 1.8.2

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch       | 2 +-
 ...1-python-module-do-not-manipulate-the-environment-when.patch | 2 +-
 .../meson/0002-Support-building-allarch-recipes-again.patch     | 2 +-
 meta/recipes-devtools/meson/{meson_1.8.1.bb => meson_1.8.2.bb}  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.8.1.bb => meson_1.8.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 98ca08c2ca..f631241602 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c01e5e29953e0302988f2d60adc50ebfa0e5d670 Mon Sep 17 00:00:00 2001
+From ceb8fc47e3aa9a99cbb455cb411a2e1f24e91187 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index f654447013..37b4a6cb22 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 6c3734f533ee7ad493188c8fc17bb1c65b65f0bd Mon Sep 17 00:00:00 2001
+From 99497f7e499bcfa38bbe7f570351500a50d5857f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ed35498c30..9b61a87a4e 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From e123195e5990c3071385defd96dfab1211e98c08 Mon Sep 17 00:00:00 2001
+From 2773f298077a33b5ea122c7491fa0969c8a1642e Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.8.1.bb b/meta/recipes-devtools/meson/meson_1.8.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.8.1.bb
rename to meta/recipes-devtools/meson/meson_1.8.2.bb
index af4bc9fecd..bfeaab0a79 100644
--- a/meta/recipes-devtools/meson/meson_1.8.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "b4e3b80e8fa633555abf447a95a700aba1585419467b2710d5e5bf88df0a7011"
+SRC_URI[sha256sum] = "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============0983461482953012031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.8.1/meson-1.8.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.8.2/meson-1.8.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 13185 to 13186 (+0%)
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 8741051 to 8746722 (+0%)
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info

--===============0983461482953012031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info

--===============0983461482953012031==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.8.1-1.8.2.patch"

RnJvbSAyOWFjNjg0MTgyODAxNTM1NGM4MGYxYWFhNjk3ZGViYTk5NTE4NTcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDc6NTc6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjguMSAtPiAxLjguMgoKLS0tCiAuLi4vbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggICAgICAgfCAyICstCiAuLi4xLXB5
dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gg
fCAyICstCiAuLi4vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1h
Z2Fpbi5wYXRjaCAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29u
XzEuOC4xLmJiID0+IG1lc29uXzEuOC4yLmJifSAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24ve21lc29uXzEuOC4xLmJiID0+IG1lc29uXzEuOC4yLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZh
bWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAppbmRleCA5OGNh
MDhjMmNhLi5mNjMxMjQxNjAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVz
b24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdh
cm5pbmdzLWZhdGFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMDFlNWUyOTk1M2UwMzAy
OTg4ZjJkNjBhZGM1MGViZmEwZTVkNjcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBj
ZWI4ZmM0N2UzYWE5YTk5Y2JiNDU1Y2I0MTFhMmUxZjI0ZTkxMTg3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6
IFR1ZSwgMyBKdWwgMjAxOCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQ
VSBmYW1pbHkgd2FybmluZ3MgZmF0YWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVu
dmlyb25tZW50LXdoZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVu
LnBhdGNoCmluZGV4IGY2NTQ0NDcwMTMuLjM3YjRhNmNiMjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlw
dWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUt
ZW52aXJvbm1lbnQtd2hlbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmMzNzM0ZjUzM2Vl
N2FkNDkzMTg4YzhmYzE3YmIxYzY1YjY1ZjBiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOTk0OTdmN2U0OTliY2ZhMzhiYmU3ZjU3MDM1MTUwMGE1MGQ1ODU3ZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogRGF0ZTogTW9uLCAxOSBOb3YgMjAxOCAxNDoyNDoyNiArMDEwMAogU3ViamVjdDogW1BB
VENIXSBweXRob24gbW9kdWxlOiBkbyBub3QgbWFuaXB1bGF0ZSB0aGUgZW52aXJvbm1lbnQgd2hl
biBjYWxsaW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJj
aC1yZWNpcGVzLWFnYWluLnBhdGNoCmluZGV4IGVkMzU0OThjMzAuLjliNjFhODdhNGUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVp
bGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFn
YWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMTIzMTk1ZTU5OTBjMzA3MTM4NWRlZmQ5
NmRmYWIxMjExZTk4YzA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNzczZjI5ODA3
N2EzM2I1ZWExMjJjNzQ5MWZhMDk2OWM4YTE2NDJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRlOiBUaHUsIDI2IEp1
bCAyMDE4IDE2OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgYnVpbGRpbmcg
YWxsYXJjaCByZWNpcGVzIGFnYWluCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24vbWVzb25fMS44LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25f
MS44LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb25fMS44LjIuYmIKaW5kZXggYWY0YmM5ZmVjZC4uYmZlYWFiMGE3OSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuOC4xLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjguMi5iYgpAQCAtMTUsNyArMTUs
NyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0k
e1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2Fy
bmluZ3MtZmF0YWwucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxk
aW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJiNGUzYjgwZThmYTYzMzU1NWFiZjQ0N2E5NWE3MDBhYmExNTg1NDE5NDY3
YjI3MTBkNWU1YmY4OGRmMGE3MDExIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImMxMDU4MTZkODE1
OGM3NmI3MmFkY2I5ZmY2MDI5NzcxOTA5NmRhN2QwN2Y2YjFmMDAwZmQ4YzAxM2NkMzg3YWYiCiBV
UFNUUkVBTV9DSEVDS19SRUdFWCA9ICIoP1A8cHZlcj5cZCsoXC5cZCspKykkIgogCiBpbmhlcml0
IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgZ2l0aHViLXJlbGVhc2VzCi0tIAoyLjQ3LjEK
Cg==

--===============0983461482953012031==--

