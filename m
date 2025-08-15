Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AEFCA0EFD
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.11415.1755263224476769368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=azoNKgiY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tkdDAQNH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010198add74803-71a8482a-aa18-4da3-b188-b7c9baebd916-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263223;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t7+fswbUzxT/t1m+EJdCtYZ22+Hj+VXRg+Dh5lMqL/4=;
	b=azoNKgiYCkshePbvLsd5VtXwfPu/0Lbid2M4LiTtU2aTe2kTKKtb//MjsexYmaBZ
	nwN33+O4V3w854m5TyxledhJobl8oyRM+WtcjhTvSb8oK3Jgm5hDPVs2L68SVl5DVHi
	JWrj0/AURhl51wpMV3biQIkBgFCfyPO86GsZsl5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263223;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t7+fswbUzxT/t1m+EJdCtYZ22+Hj+VXRg+Dh5lMqL/4=;
	b=tkdDAQNHqhD0HtWrU3kfyV36xHOkM1sQAJ04+hOPdeOJUYkR2wTTbhumQdNS3Aza
	/Dqk1Eb+VigzMpvvFdDD4AlNhvQ9SecaI9r26cvT5XQ03Iu/PoVyw6sR5im1AcRASx6
	WCutnqfdXlbvZ9pZY1zEpnb9roLoqPgW4Gl2RIHM=
Content-Type: multipart/mixed; boundary="===============2412386541007956766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.8.3 SUCCEEDED
Message-ID: <01010198add74803-71a8482a-aa18-4da3-b188-b7c9baebd916-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221904

--===============2412386541007956766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.8.2-1.8.3.patch
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
From 77e839c9be82cc927e183a6e433d272e4575b54a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:42:28 +0000
Subject: [PATCH] meson: upgrade 1.8.2 -> 1.8.3

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch     | 4 ++--
 ...python-module-do-not-manipulate-the-environment-when.patch | 2 +-
 .../meson/0002-Support-building-allarch-recipes-again.patch   | 2 +-
 .../recipes-devtools/meson/{meson_1.8.2.bb => meson_1.8.3.bb} | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.8.2.bb => meson_1.8.3.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 98ca08c2ca..032aa243ed 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c01e5e29953e0302988f2d60adc50ebfa0e5d670 Mon Sep 17 00:00:00 2001
+From df08789fc590596cf35b7b0ddad44c8bb27cd207 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,7 +26,7 @@ index 43fad0c..27be871 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 2a9cf16..6b2bd6b 100644
+index c20390f..c8eabf0 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
 @@ -436,10 +436,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index f654447013..32f1cbd032 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 6c3734f533ee7ad493188c8fc17bb1c65b65f0bd Mon Sep 17 00:00:00 2001
+From bbf272bddf9a124087ce249238566d04fdb1da07 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ed35498c30..fced9ab2c0 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From e123195e5990c3071385defd96dfab1211e98c08 Mon Sep 17 00:00:00 2001
+From 3579499776835fa4152e009ddd9b507a75d26723 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.8.2.bb b/meta/recipes-devtools/meson/meson_1.8.3.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.8.2.bb
rename to meta/recipes-devtools/meson/meson_1.8.3.bb
index bfeaab0a79..e306471244 100644
--- a/meta/recipes-devtools/meson/meson_1.8.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af"
+SRC_URI[sha256sum] = "f118aa910fc0a137cc2dd0122232dbf82153d9a12fb5b0f5bb64896f6a157abf"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============2412386541007956766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info
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
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info

--===============2412386541007956766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.8.2/meson-1.8.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.8.3/meson-1.8.3.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 8748389 to 8758687 (+0%)
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.8.2" to "1.8.3"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info
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
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.3.dist-info

--===============2412386541007956766==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.8.2-1.8.3.patch"

RnJvbSA3N2U4MzljOWJlODJjYzkyN2UxODNhNmU0MzNkMjcyZTQ1NzViNTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6NDI6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjguMiAtPiAxLjguMwoKLS0tCiAuLi4vbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggICAgIHwgNCArKy0tCiAuLi5weXRo
b24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoIHwg
MiArLQogLi4uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdh
aW4ucGF0Y2ggICB8IDIgKy0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL21lc29uL3ttZXNvbl8xLjgu
Mi5iYiA9PiBtZXNvbl8xLjguMy5iYn0gfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVz
b24ve21lc29uXzEuOC4yLmJiID0+IG1lc29uXzEuOC4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13
YXJuaW5ncy1mYXRhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8w
MDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAppbmRleCA5OGNhMDhjMmNh
Li4wMzJhYTI0M2VkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVz
b24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdz
LWZhdGFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMDFlNWUyOTk1M2UwMzAyOTg4ZjJk
NjBhZGM1MGViZmEwZTVkNjcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkZjA4Nzg5
ZmM1OTA1OTZjZjM1YjdiMGRkYWQ0NGM4YmIyN2NkMjA3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwg
MyBKdWwgMjAxOCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1p
bHkgd2FybmluZ3MgZmF0YWwKQEAgLTI2LDcgKzI2LDcgQEAgaW5kZXggNDNmYWQwYy4uMjdiZTg3
MSAxMDA2NDQKICAgICAgICAgIGVuZGlhbiA9IGxpdGVyYWxbJ2VuZGlhbiddCiAgICAgICAgICBp
ZiBlbmRpYW4gbm90IGluICgnbGl0dGxlJywgJ2JpZycpOgogZGlmZiAtLWdpdCBhL21lc29uYnVp
bGQvZW52aXJvbm1lbnQucHkgYi9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5Ci1pbmRleCAyYTlj
ZjE2Li42YjJiZDZiIDEwMDY0NAoraW5kZXggYzIwMzkwZi4uYzhlYWJmMCAxMDA2NDQKIC0tLSBh
L21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkKICsrKyBiL21lc29uYnVpbGQvZW52aXJvbm1lbnQu
cHkKIEBAIC00MzYsMTAgKzQzNiw4IEBAIGRlZiBkZXRlY3RfY3B1X2ZhbWlseShjb21waWxlcnM6
IENvbXBpbGVyc0RpY3QpIC0+IHN0cjoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVu
dmlyb25tZW50LXdoZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVu
LnBhdGNoCmluZGV4IGY2NTQ0NDcwMTMuLjMyZjFjYmQwMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlw
dWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUt
ZW52aXJvbm1lbnQtd2hlbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmMzNzM0ZjUzM2Vl
N2FkNDkzMTg4YzhmYzE3YmIxYzY1YjY1ZjBiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYmJmMjcyYmRkZjlhMTI0MDg3Y2UyNDkyMzg1NjZkMDRmZGIxZGEwNyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogRGF0ZTogTW9uLCAxOSBOb3YgMjAxOCAxNDoyNDoyNiArMDEwMAogU3ViamVjdDogW1BB
VENIXSBweXRob24gbW9kdWxlOiBkbyBub3QgbWFuaXB1bGF0ZSB0aGUgZW52aXJvbm1lbnQgd2hl
biBjYWxsaW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJj
aC1yZWNpcGVzLWFnYWluLnBhdGNoCmluZGV4IGVkMzU0OThjMzAuLmZjZWQ5YWIyYzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVp
bGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFn
YWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMTIzMTk1ZTU5OTBjMzA3MTM4NWRlZmQ5
NmRmYWIxMjExZTk4YzA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNTc5NDk5Nzc2
ODM1ZmE0MTUyZTAwOWRkZDliNTA3YTc1ZDI2NzIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRlOiBUaHUsIDI2IEp1
bCAyMDE4IDE2OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgYnVpbGRpbmcg
YWxsYXJjaCByZWNpcGVzIGFnYWluCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24vbWVzb25fMS44LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25f
MS44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb25fMS44LjMuYmIKaW5kZXggYmZlYWFiMGE3OS4uZTMwNjQ3MTI0NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuOC4yLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjguMy5iYgpAQCAtMTUsNyArMTUs
NyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0k
e1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2Fy
bmluZ3MtZmF0YWwucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxk
aW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJjMTA1ODE2ZDgxNThjNzZiNzJhZGNiOWZmNjAyOTc3MTkwOTZkYTdkMDdm
NmIxZjAwMGZkOGMwMTNjZDM4N2FmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYxMThhYTkxMGZj
MGExMzdjYzJkZDAxMjIyMzJkYmY4MjE1M2Q5YTEyZmI1YjBmNWJiNjQ4OTZmNmExNTdhYmYiCiBV
UFNUUkVBTV9DSEVDS19SRUdFWCA9ICIoP1A8cHZlcj5cZCsoXC5cZCspKykkIgogCiBpbmhlcml0
IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgZ2l0aHViLXJlbGVhc2VzCi0tIAoyLjQ3LjEK
Cg==

--===============2412386541007956766==--

