Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB861D172DA
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29184.1769951561247612160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hBgRTsQp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rdKz5qIS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c19559b4c-799cbbbf-46ba-4e96-a0a2-4316bcf93e48-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Eu8R7EsHm4uzuAj4Xkp/eMutOJ+YqTIpLFE41jjR32A=;
	b=hBgRTsQpoG93iMV4LSLtKz7bKBEtd8NAMJ9UzMdHkZr6AdpORmVS4irlxOx7UEhC
	3tjz0EVmhjtxhT54vqOVHMrS0tFbuXOxSoZZXjfTHfghyqYex3Q6VDZxsEPoQ/t2DEB
	USDoIEQA8pmfKRPzVb7HS+ZEUCzNpA+rJb5ms2qE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Eu8R7EsHm4uzuAj4Xkp/eMutOJ+YqTIpLFE41jjR32A=;
	b=rdKz5qIS1K3p6EorP0VShX1E06ZFSBuEznTbNtmE5HAmQYQJtOO53VW3jDOc5Xp/
	7oFEZ2jQ3zIGB83SqM68l0c80SQHFCrIBDvZ74PkuTzkMft4ABmkBMkrCYTSzkGCx6E
	AQedYlHDWIaSkrTdlTlZHtv0dJlxyJUpFU5uvevY=
Content-Type: multipart/mixed; boundary="===============0851419373720828326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.7.4 SUCCEEDED
Message-ID: <0101019c19559b4c-799cbbbf-46ba-4e96-a0a2-4316bcf93e48-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230269

--===============0851419373720828326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *expat* to *2.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-expat-upgrade-2.7.3-2.7.4.patch
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
From 35d43b0ee31a4fea31950fa134336d38c5f3f7e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 07:31:57 +0000
Subject: [PATCH] expat: upgrade 2.7.3 -> 2.7.4

---
 meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.7.3.bb b/meta/recipes-core/expat/expat_2.7.4.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.3.bb
rename to meta/recipes-core/expat/expat_2.7.4.bb
index 069254e13c..95a1ed52c4 100644
--- a/meta/recipes-core/expat/expat_2.7.3.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "59c31441fec9a66205307749eccfee551055f2d792f329f18d97099e919a3b2f"
+SRC_URI[sha256sum] = "e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.47.1


--===============0851419373720828326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.7.3 -> /usr/lib/cmake/expat-2.7.4
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.11.1", added "/usr/lib/libexpat.so.1.11.2"
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.11.1 to libexpat.so.1.11.2
  /usr/lib/cmake/expat-2.7.3 moved to /usr/lib/cmake/expat-2.7.4
  /usr/lib/libexpat.so.1.11.1 moved to /usr/lib/libexpat.so.1.11.2
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.11.1 to libexpat.so.1.11.2
  /usr/lib/cmake/expat-2.7.3 moved to /usr/lib/cmake/expat-2.7.4
  /usr/lib/libexpat.so.1.11.1 moved to /usr/lib/libexpat.so.1.11.2
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed

--===============0851419373720828326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/expat/expat-bin: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-bin: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat-dbg: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat-dbg: FILELIST: removed "/usr/lib/.debug/libexpat.so.1.11.1", added "/usr/lib/.debug/libexpat.so.1.11.2"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGSIZE changed from 2741880 to 2746376 (+0%)
packages/x86-64-v3-poky-linux/expat/expat-dev: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.7.3 -> /usr/lib/cmake/expat-2.7.4
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGSIZE changed from 66678 to 66555 (-0%)
packages/x86-64-v3-poky-linux/expat/expat-doc: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGSIZE changed from 103407 to 107376 (+4%)
packages/x86-64-v3-poky-linux/expat/expat-locale: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-locale: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat-ptest: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-ptest: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat-src: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-src: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat-src: FILELIST: directory renamed /usr/src/debug/expat/2.7.3/xmlwf -> /usr/src/debug/expat/2.7.4/xmlwf, directory renamed /usr/src/debug/expat/2.7.3/tests/benchmark -> /usr/src/debug/expat/2.7.4/tests/benchmark, directory renamed /usr/src/debug/expat/2.7.3/lib -> /usr/src/debug/expat/2.7.4/lib, directory renamed /usr/src/debug/expat/2.7.3/tests -> /usr/src/debug/expat/2.7.4/tests
packages/x86-64-v3-poky-linux/expat/expat-src: PKGSIZE changed from 1312424 to 1315480 (+0%)
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat/expat: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.11.1", added "/usr/lib/libexpat.so.1.11.2"
packages/x86-64-v3-poky-linux/expat: PV changed from "2.7.3" to "2.7.4"
packages/x86-64-v3-poky-linux/expat: SRC_URI changed from "https://github.com/libexpat/libexpat/releases//download/R_2_7_3/expat-2.7.3.tar.bz2 file://run-ptest" to "https://github.com/libexpat/libexpat/releases//download/R_2_7_4/expat-2.7.4.tar.bz2 file://run-ptest"
packages/x86-64-v3-poky-linux/expat: PKGV changed from 2.7.3 [default] to 2.7.4 [default]
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.11.1 to libexpat.so.1.11.2
  /usr/lib/cmake/expat-2.7.3 moved to /usr/lib/cmake/expat-2.7.4
  /usr/lib/libexpat.so.1.11.1 moved to /usr/lib/libexpat.so.1.11.2
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.11.1 to libexpat.so.1.11.2
  /usr/lib/cmake/expat-2.7.3 moved to /usr/lib/cmake/expat-2.7.4
  /usr/lib/libexpat.so.1.11.1 moved to /usr/lib/libexpat.so.1.11.2
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed

--===============0851419373720828326==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.7.3-2.7.4.patch"

RnJvbSAzNWQ0M2IwZWUzMWE0ZmVhMzE5NTBmYTEzNDMzNmQzOGM1ZjNmN2UyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNzozMTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV4
cGF0OiB1cGdyYWRlIDIuNy4zIC0+IDIuNy40CgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0
L3tleHBhdF8yLjcuMy5iYiA9PiBleHBhdF8yLjcuNC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29y
ZS9leHBhdC97ZXhwYXRfMi43LjMuYmIgPT4gZXhwYXRfMi43LjQuYmJ9ICg5MiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi43LjMuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9leHBhdC9leHBhdF8yLjcuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjcuMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi43LjQuYmIKaW5kZXggMDY5MjU0ZTEzYy4uOTVh
MWVkNTJjNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi43LjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi43LjQuYmIKQEAgLTE1LDcg
KzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvUl8ke1ZFUlNJ
T05fVEFHfS9leHBhdC0ke1BWfS50YXIuYnoyICBcCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6
Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3JlbGVhc2VzLyIKIFVQU1RSRUFNX0NIRUNL
X1JFR0VYID0gInJlbGVhc2VzL3RhZy9SXyg/UDxwdmVyPi4rKSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjU5YzMxNDQxZmVjOWE2NjIwNTMwNzc0OWVjY2ZlZTU1MTA1NWYyZDc5MmYzMjlmMThk
OTcwOTllOTE5YTNiMmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTZhZjExYjAxZTMyZTVlZjY0
OTA2YTVjY2E4ODA5ZWFiYzRiZWI3ZmYyZjlhMGU2YWFiYmQ0MmU4MjUxMzVkMCIKIAogRVhUUkFf
T0VDTUFLRTpjbGFzcy1uYXRpdmUgKz0gIi1ERVhQQVRfQlVJTERfRE9DUz1PRkYiCiAKLS0gCjIu
NDcuMQoK

--===============0851419373720828326==--

