Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61614C369CF
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20181.1744723983075023318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HPXTGF03;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=i9ng3C+v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019639a738bd-f69a3ac9-44b2-4504-9c36-ab690f11c300-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GwkC2GPCJyEEnFgVnAPaLLirz0WNtpt1wRFqgigb6Ig=;
	b=HPXTGF03Zbw1phxifY2VdoL9ZMFluisNY+qdh9xlNP65N0GexEtTomL53psmi7JE
	xFyoVtukit3e/sLJz7vz1kHnNX961kZ0AMVRVJc4C4gGg7yOhUNqgjFQRt7CyKPR1x2
	5ireyuhm5lOIuJYLVeJdunGWIh3CcHpz8pyTPQNg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GwkC2GPCJyEEnFgVnAPaLLirz0WNtpt1wRFqgigb6Ig=;
	b=i9ng3C+vs5j6th2//wW39mgnVsyqg5E/r1LdlPfcY8kfLlhZLVcfPzAkfGlf+yWa
	axWAjOEjr3pdzGi+3xzeSX8I0qwQfnwuNKUg32xsPuPk+VSkKcxErduBEaRI0Hh0+E1
	nuPrUtHkZvxv+FfMIOw/WK8+cR2HNddL1r20r5eY=
Content-Type: multipart/mixed; boundary="===============1400109137979041878=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.12 SUCCEEDED
Message-ID: <0101019639a738bd-f69a3ac9-44b2-4504-9c36-ab690f11c300-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214900

--===============1400109137979041878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cups* to *2.4.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.11-2.4.12.patch
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
From f0ca6d0c1e85fbd2da6b3ffc3f2577906faa6e79 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 08:44:08 +0000
Subject: [PATCH] cups: upgrade 2.4.11 -> 2.4.12

---
 .../recipes-extended/cups/cups/0001-use-echo-only-in-init.patch | 2 +-
 .../cups/cups/0002-don-t-try-to-run-generated-binaries.patch    | 2 +-
 .../cups/0004-cups-fix-multilib-install-file-conflicts.patch    | 2 +-
 meta/recipes-extended/cups/cups/libexecdir.patch                | 2 +-
 meta/recipes-extended/cups/{cups_2.4.11.bb => cups_2.4.12.bb}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.11.bb => cups_2.4.12.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index c0cb7df581..e5fddd8cce 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
+From d6d1a65927efa6b8d9faf382fc73ef806d9185c0 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index cf2f1a6747..104cd67816 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
+From eed4a0fb29b7c2372b7558eac1951292f3ed1682 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 31338822e6..b6b7525df1 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
+From 26b1a3d9a965536c677a6b07cb858c1e966bb938 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 493c7970ea..7aa0769096 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
+From 92e2417a5b037a6bde676ffed6259affb2eb0f96 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
diff --git a/meta/recipes-extended/cups/cups_2.4.11.bb b/meta/recipes-extended/cups/cups_2.4.12.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.11.bb
rename to meta/recipes-extended/cups/cups_2.4.12.bb
index 71568295cb..ac73c2780f 100644
--- a/meta/recipes-extended/cups/cups_2.4.11.bb
+++ b/meta/recipes-extended/cups/cups_2.4.12.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71"
+SRC_URI[sha256sum] = "b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59"
-- 
2.47.1


--===============1400109137979041878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cups/cups-dbg: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-dbg: PKGSIZE changed from 8821224 to 8824496 (+0%)
packages/core2-64-poky-linux/cups/cups-dbg: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-dev: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-dev: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-doc: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-doc: PKGSIZE changed from 226671 to 226805 (+0%)
packages/core2-64-poky-linux/cups/cups-doc: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-lib: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-lib: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-libimage: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-libimage: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-ca: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-cs: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-da: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-de: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-en: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-es: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-fr: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-it: PKGSIZE changed from 342316 to 382517 (+12%)
packages/core2-64-poky-linux/cups/cups-locale-it: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-ja: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-ru: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-src: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-src: PKGSIZE changed from 5976475 to 5980501 (+0%)
packages/core2-64-poky-linux/cups/cups-src: FILELIST: directory renamed /usr/src/debug/cups/2.4.11/scheduler -> /usr/src/debug/cups/2.4.12/scheduler, directory renamed /usr/src/debug/cups/2.4.11/notifier -> /usr/src/debug/cups/2.4.12/notifier, directory renamed /usr/src/debug/cups/2.4.11/tools -> /usr/src/debug/cups/2.4.12/tools, directory renamed /usr/src/debug/cups/2.4.11/filter -> /usr/src/debug/cups/2.4.12/filter, directory renamed /usr/src/debug/cups/2.4.11/backend -> /usr/src/debug/cups/2.4.12/backend, directory renamed /usr/src/debug/cups/2.4.11/ppdc -> /usr/src/debug/cups/2.4.12/ppdc, directory renamed /usr/src/debug/cups/2.4.11/systemv -> /usr/src/debug/cups/2.4.12/systemv, directory renamed /usr/src/debug/cups/2.4.11/cgi-bin -> /usr/src/debug/cups/2.4.12/cgi-bin, directory renamed /usr/src/debug/cups/2.4.11/berkeley -> /usr/src/debug/cups/2.4.12/berkeley, directory renamed /usr/src/debug/cups/2.4.11/monitor -> /usr/src/debug/cups/2.4.12/monitor, removed "/usr/src/debug/cups
 /2.4.11/cups/ipp-private.h /usr/src/debug/cups/2.4.11/cups/ppd-attr.c /usr/src/debug/cups/2.4.11/cups/ppd-emit.c /usr/src/debug/cups/2.4.11/cups/ppd-mark.c /usr/src/debug/cups/2.4.11/cups/ppd-page.c /usr/src/debug/cups/2.4.11/cups/ppd-util.c /usr/src/debug/cups/2.4.11/cups/sidechannel.c /usr/src/debug/cups/2.4.11/cups/sidechannel.h /usr/src/debug/cups/2.4.11/cups/http-support.c /usr/src/debug/cups/2.4.11/cups/http.h /usr/src/debug/cups/2.4.11/cups/dest-localization.c /usr/src/debug/cups/2.4.11/cups/http.c /usr/src/debug/cups/2.4.11/cups/ipp.c /usr/src/debug/cups/2.4.11/cups/auth.c /usr/src/debug/cups/2.4.11/cups/snmp-private.h /usr/src/debug/cups/2.4.11/cups/dest.c /usr/src/debug/cups/2.4.11/cups/ipp.h /usr/src/debug/cups/2.4.11/cups/encode.c /usr/src/debug/cups/2.4.11/cups/raster-interpret.c /usr/src/debug/cups/2.4.11/cups/raster-interstub.c /usr/src/debug/cups/2.4.11/cups/transcode.c /usr/src/debug/cups/2.4.11/cups/dest-job.c /usr/src/debug/cups/2.4.11/cups/transcode.h /usr/src/de
 bug/cups/2.4.11/cups/usersys.c /usr/src/debug/cups/2.4.11/cups/thread-private.h /usr/src/debug/cups/2.4.11/cups/pwg-private.h /usr/src/debug/cups/2.4.11/cups/md5passwd.c /usr/src/debug/cups/2.4.11/cups/ppd-conflicts.c /usr/src/debug/cups/2.4.11/cups/util.c /usr/src/debug/cups/2.4.11/cups/http-addr.c /usr/src/debug/cups/2.4.11/cups/dest-options.c /usr/src/debug/cups/2.4.11/cups/thread.c /usr/src/debug/cups/2.4.11/cups/ipp-file.c /usr/src/debug/cups/2.4.11/cups/array-private.h /usr/src/debug/cups/2.4.11/cups/ipp-vars.c /usr/src/debug/cups/2.4.11/cups/getdevices.c /usr/src/debug/cups/2.4.11/cups/string.c /usr/src/debug/cups/2.4.11/cups/adminutil.c /usr/src/debug/cups/2.4.11/cups/options.c /usr/src/debug/cups/2.4.11/cups/md5-internal.h /usr/src/debug/cups/2.4.11/cups/pwg.h /usr/src/debug/cups/2.4.11/cups/adminutil.h /usr/src/debug/cups/2.4.11/cups/tls-openssl.c /usr/src/debug/cups/2.4.11/cups/raster-stubs.c /usr/src/debug/cups/2.4.11/cups/ppd-cache.c /usr/src/debug/cups/2.4.11/cups/ppd.
 c /usr/src/debug/cups/2.4.11/cups/langprintf.c /usr/src/debug/cups/2.4.11/cups/ppd.h /usr/src/debug/cups/2.4.11/cups/backchannel.c /usr/src/debug/cups/2.4.11/cups/globals.c /usr/src/debug/cups/2.4.11/cups/raster-stream.c /usr/src/debug/cups/2.4.11/cups/file-private.h /usr/src/debug/cups/2.4.11/cups/hash.c /usr/src/debug/cups/2.4.11/cups/ipp-support.c /usr/src/debug/cups/2.4.11/cups/raster.h /usr/src/debug/cups/2.4.11/cups/http-addrlist.c /usr/src/debug/cups/2.4.11/cups/cups.h /usr/src/debug/cups/2.4.11/cups/array.h /usr/src/debug/cups/2.4.11/cups/ppd-custom.c /usr/src/debug/cups/2.4.11/cups/tempfile.c /usr/src/debug/cups/2.4.11/cups/array.c /usr/src/debug/cups/2.4.11/cups/request.c /usr/src/debug/cups/2.4.11/cups/getputfile.c /usr/src/debug/cups/2.4.11/cups/backend.h /usr/src/debug/cups/2.4.11/cups/raster-private.h /usr/src/debug/cups/2.4.11/cups/backend.c /usr/src/debug/cups/2.4.11/cups/language.c /usr/src/debug/cups/2.4.11/cups/language.h /usr/src/debug/cups/2.4.11/cups/cups-priva
 te.h /usr/src/debug/cups/2.4.11/cups/ppd-private.h /usr/src/debug/cups/2.4.11/cups/raster-error.c /usr/src/debug/cups/2.4.11/cups/file.h /usr/src/debug/cups/2.4.11/cups/notify.c /usr/src/debug/cups/2.4.11/cups/file.c /usr/src/debug/cups/2.4.11/cups/ppd-localize.c /usr/src/debug/cups/2.4.11/cups/http-private.h /usr/src/debug/cups/2.4.11/cups/language-private.h /usr/src/debug/cups/2.4.11/cups/md5.c /usr/src/debug/cups/2.4.11/cups/string-private.h /usr/src/debug/cups/2.4.11/cups/pwg-media.c /usr/src/debug/cups/2.4.11/cups/snmp.c /usr/src/debug/cups/2.4.11/cups/dir.h /usr/src/debug/cups/2.4.11/cups/debug.c /usr/src/debug/cups/2.4.11/cups/dir.c", added "/usr/src/debug/cups/2.4.12/cups/ppd.c /usr/src/debug/cups/2.4.12/cups/langprintf.c /usr/src/debug/cups/2.4.12/cups/ppd.h /usr/src/debug/cups/2.4.12/cups/backchannel.c /usr/src/debug/cups/2.4.12/cups/globals.c /usr/src/debug/cups/2.4.12/cups/raster-stream.c /usr/src/debug/cups/2.4.12/cups/file-private.h /usr/src/debug/cups/2.4.12/cups/hash
 .c /usr/src/debug/cups/2.4.12/cups/ipp-support.c /usr/src/debug/cups/2.4.12/cups/raster.h /usr/src/debug/cups/2.4.12/cups/http-addrlist.c /usr/src/debug/cups/2.4.12/cups/cups.h /usr/src/debug/cups/2.4.12/cups/array.h /usr/src/debug/cups/2.4.12/cups/ppd-custom.c /usr/src/debug/cups/2.4.12/cups/tempfile.c /usr/src/debug/cups/2.4.12/cups/array.c /usr/src/debug/cups/2.4.12/cups/request.c /usr/src/debug/cups/2.4.12/cups/getputfile.c /usr/src/debug/cups/2.4.12/cups/backend.h /usr/src/debug/cups/2.4.12/cups/raster-private.h /usr/src/debug/cups/2.4.12/cups/backend.c /usr/src/debug/cups/2.4.12/cups/language.c /usr/src/debug/cups/2.4.12/cups/language.h /usr/src/debug/cups/2.4.12/cups/cups-private.h /usr/src/debug/cups/2.4.12/cups/ppd-private.h /usr/src/debug/cups/2.4.12/cups/raster-error.c /usr/src/debug/cups/2.4.12/cups/file.h /usr/src/debug/cups/2.4.12/cups/notify.c /usr/src/debug/cups/2.4.12/cups/file.c /usr/src/debug/cups/2.4.12/cups/ppd-localize.c /usr/src/debug/cups/2.4.12/cups/clock.c 
 /usr/src/debug/cups/2.4.12/cups/http-private.h /usr/src/debug/cups/2.4.12/cups/language-private.h /usr/src/debug/cups/2.4.12/cups/md5.c /usr/src/debug/cups/2.4.12/cups/string-private.h /usr/src/debug/cups/2.4.12/cups/pwg-media.c /usr/src/debug/cups/2.4.12/cups/snmp.c /usr/src/debug/cups/2.4.12/cups/dir.h /usr/src/debug/cups/2.4.12/cups/debug.c /usr/src/debug/cups/2.4.12/cups/dir.c /usr/src/debug/cups/2.4.12/cups/ipp-private.h /usr/src/debug/cups/2.4.12/cups/ppd-attr.c /usr/src/debug/cups/2.4.12/cups/ppd-emit.c /usr/src/debug/cups/2.4.12/cups/ppd-mark.c /usr/src/debug/cups/2.4.12/cups/ppd-page.c /usr/src/debug/cups/2.4.12/cups/ppd-util.c /usr/src/debug/cups/2.4.12/cups/sidechannel.c /usr/src/debug/cups/2.4.12/cups/sidechannel.h /usr/src/debug/cups/2.4.12/cups/http-support.c /usr/src/debug/cups/2.4.12/cups/http.h /usr/src/debug/cups/2.4.12/cups/dest-localization.c /usr/src/debug/cups/2.4.12/cups/http.c /usr/src/debug/cups/2.4.12/cups/ipp.c /usr/src/debug/cups/2.4.12/cups/auth.c /usr/s
 rc/debug/cups/2.4.12/cups/snmp-private.h /usr/src/debug/cups/2.4.12/cups/dest.c /usr/src/debug/cups/2.4.12/cups/ipp.h /usr/src/debug/cups/2.4.12/cups/encode.c /usr/src/debug/cups/2.4.12/cups/raster-interpret.c /usr/src/debug/cups/2.4.12/cups/raster-interstub.c /usr/src/debug/cups/2.4.12/cups/transcode.c /usr/src/debug/cups/2.4.12/cups/dest-job.c /usr/src/debug/cups/2.4.12/cups/transcode.h /usr/src/debug/cups/2.4.12/cups/usersys.c /usr/src/debug/cups/2.4.12/cups/thread-private.h /usr/src/debug/cups/2.4.12/cups/pwg-private.h /usr/src/debug/cups/2.4.12/cups/md5passwd.c /usr/src/debug/cups/2.4.12/cups/ppd-conflicts.c /usr/src/debug/cups/2.4.12/cups/util.c /usr/src/debug/cups/2.4.12/cups/http-addr.c /usr/src/debug/cups/2.4.12/cups/dest-options.c /usr/src/debug/cups/2.4.12/cups/thread.c /usr/src/debug/cups/2.4.12/cups/ipp-file.c /usr/src/debug/cups/2.4.12/cups/array-private.h /usr/src/debug/cups/2.4.12/cups/ipp-vars.c /usr/src/debug/cups/2.4.12/cups/getdevices.c /usr/src/debug/cups/2.4.12
 /cups/string.c /usr/src/debug/cups/2.4.12/cups/adminutil.c /usr/src/debug/cups/2.4.12/cups/options.c /usr/src/debug/cups/2.4.12/cups/md5-internal.h /usr/src/debug/cups/2.4.12/cups/pwg.h /usr/src/debug/cups/2.4.12/cups/adminutil.h /usr/src/debug/cups/2.4.12/cups/tls-openssl.c /usr/src/debug/cups/2.4.12/cups/raster-stubs.c /usr/src/debug/cups/2.4.12/cups/ppd-cache.c"
packages/core2-64-poky-linux/cups/cups-src: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-staticdev: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-webif: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-webif: PKGSIZE changed from 1566880 to 1567018 (+0%)
packages/core2-64-poky-linux/cups/cups-webif: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups: PKGSIZE changed from 7336700 to 7336812 (+0%)
packages/core2-64-poky-linux/cups/cups: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.11/cups-2.4.11-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.12/cups-2.4.12-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/core2-64-poky-linux/cups: PV changed from "2.4.11" to "2.4.12"

--===============1400109137979041878==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.11-2.4.12.patch"

RnJvbSBmMGNhNmQwYzFlODVmYmQyZGE2YjNmZmMzZjI1Nzc5MDZmYWE2ZTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDg6NDQ6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC4xMSAtPiAyLjQuMTIKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
Y3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoIHwgMiArLQogLi4uL2N1
cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoICAg
IHwgMiArLQogLi4uL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29u
ZmxpY3RzLnBhdGNoICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9s
aWJleGVjZGlyLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMve2N1cHNfMi40LjExLmJiID0+IGN1cHNfMi40LjEyLmJifSAgIHwgMiArLQogNSBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMve2N1cHNfMi40LjExLmJiID0+IGN1cHNfMi40LjEyLmJi
fSAoNTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAw
MS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vw
cy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoCmluZGV4IGMwY2I3ZGY1ODEu
LmU1ZmRkZDhjY2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMv
MDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gYzVmOTQzYjFhYzZlMWM4NmFlNjQ2ODZlMjllMTc4ZmVkZjkzM2U5NiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDZkMWE2NTkyN2VmYTZiOGQ5ZmFmMzgyZmM3M2Vm
ODA2ZDkxODVjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhdWwgV29sZCA8c2d3
QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFRodSwgMTMgRGVjIDIwMTIgMTk6MDM6NTIgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gdXNlIGVjaG8gb25seSBpbiBpbml0CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0
ZWQtYmluYXJpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDIt
ZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKaW5kZXggY2YyZjFhNjc0
Ny4uMTA0Y2Q2NzgxNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
cy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVy
YXRlZC1iaW5hcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGE5YTMxM2FlNWEyZDFk
YTY4M2RkNTg1NzJkZjBkN2E2NjBlYjkyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZWVkNGEwZmIyOWI3YzIzNzJiNzU1OGVhYzE5NTEyOTJmM2VkMTY4MiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtvZW4gS29vaSA8a29lbkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ+CiBE
YXRlOiBTdW4sIDMwIEphbiAyMDExIDE2OjM3OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRv
bid0IHRyeSB0byBydW4gZ2VuZXJhdGVkIGJpbmFyaWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxl
LWNvbmZsaWN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1j
dXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCmluZGV4IDMxMzM4
ODIyZTYuLmI2Yjc1MjVkZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0
aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4
ODBiYWQyYzZiMDhhZmQyZTJlMzAzYmMzY2VlYTU1OWVkYmU3NmQyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAyNmIxYTNkOWE5NjU1MzZjNjc3YTZiMDdjYjg1OGMxZTk2NmJiOTM4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBXZWQsIDMgT2N0IDIwMTggMDA6Mjc6MTEgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gY3VwczogZml4IG11bHRpbGliIGluc3RhbGwgZmlsZSBjb25mbGljdHMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaAppbmRleCA0OTNj
Nzk3MGVhLi43YWEwNzY5MDk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vw
cy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwcy9saWJleGVjZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YWU3YWQ4N2FhMDIy
ZjUxMjhiZTIyMmRmZmJmMGM1MGVjNmU4NDZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5MmUyNDE3YTViMDM3YTZiZGU2NzZmZmVkNjI1OWFmZmIyZWIwZjk2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRl
OiBUdWUsIDEzIEp1bCAyMDIxIDEyOjU2OjMwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAk
bGliZXhlY2RpciBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgJHByZWZpeC9saWIgYXMgdGhpcwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTEuYmIgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDUx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTIuYmIKaW5kZXgg
NzE1NjgyOTVjYi4uYWM3M2MyNzgwZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2N1cHMvY3Vwc18yLjQuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
c18yLjQuMTIuYmIKQEAgLTIsNCArMiw0IEBAIHJlcXVpcmUgY3Vwcy5pbmMKIAogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNj
NmJkNTciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5YTg4ZmUxZGEzYTI5YTkxN2MzZmM2N2Nl
NmViMzE3ODM5OWQ2OGUxYTU0OGM2ZDg2YzcwZDliMTM2NTFmZDcxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImIxZGRlMTkxYTRhZTI3NjBjNDcyMjBjODJjYTYxNTVhMjhjMzgyNzAxZTZjMWEwMTU5
ZDEwNTQ5OTAyMzFkNTkiCi0tIAoyLjQ3LjEKCg==

--===============1400109137979041878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cups/cups-locale-it: PKGSIZE changed from 342316 to 382517 (+12%)

--===============1400109137979041878==--

