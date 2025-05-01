Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53FFC54F2E
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1799.1746113609915206846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fpo/Tdzq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KC83Ylry;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b8640-6f092e14-155e-4b0f-8448-8987af99517d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ww3oQmeCOG2eLTdYPWQwSFwRGaLRhXVWXAPp5Qks0w4=;
	b=Fpo/TdzqXm+QRrE//oMKfhdllS1wRlR7DYMzf5E7wJe/Ep7tXfRfmxRrY9XZ8J4p
	sCxLhbXsbNihpj/kxWyKO8cF4kzaEQlLD+YsKj5QNjdjdrZPf0jqH2dTv233Kj3buzW
	cVbvGafkSy2aPuvaGlz+YBCeYKki2VRUZjb1WB+I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ww3oQmeCOG2eLTdYPWQwSFwRGaLRhXVWXAPp5Qks0w4=;
	b=KC83YlrydBdQmzqbrQaRpoRNF2PobJNlTCyJC2Ewv5ko6mwTVL0yCW8/6aohFv9W
	obdIAJjxbEgVMok4CBjliIw/F3BUc8m9TedEKYcKEh1oSK2t483aUO/gG5JY7OuWOGP
	IQnCfJUaVT+tkBv25ckT0zvWFqWQXhvhIEb0EkD8=
Content-Type: multipart/mixed; boundary="===============0628310955890442074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.12 SUCCEEDED
Message-ID: <010101968c7b8640-6f092e14-155e-4b0f-8448-8987af99517d-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215846

--===============0628310955890442074==
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
From 10d8d3467703ec49e6e31a346583bafd338b78d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:30:41 +0000
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
index c0cb7df581..e2eb1f7401 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
+From c13deafcb05d23edb8d1af09557f791cf0b6e13f Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index cf2f1a6747..0c0365c232 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
+From 8ba153bd122a990a312398aca573caf11e24e485 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 31338822e6..7d76f8cee2 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
+From 4d420e5b6f8530f746749b61264425469d70f01c Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 493c7970ea..51a634844b 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
+From 071d05cad38af2eb64b828ec9b292ac311704497 Mon Sep 17 00:00:00 2001
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


--===============0628310955890442074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cups/cups-dbg: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-dbg: PKGSIZE changed from 8813488 to 8816784 (+0%)
packages/core2-64-poky-linux/cups/cups-dbg: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-dev: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-dev: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-doc: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-doc: PKGSIZE changed from 226671 to 226805 (+0%)
packages/core2-64-poky-linux/cups/cups-doc: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-lib: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-lib: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-libimage: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-libimage: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-ca: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-cs: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-da: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-de: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-en: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-es: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-fr: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-it: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-it: PKGSIZE changed from 342316 to 382517 (+12%)
packages/core2-64-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-ja: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-ru: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-src: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-src: PKGSIZE changed from 5976475 to 5980501 (+0%)
packages/core2-64-poky-linux/cups/cups-src: FILELIST: directory renamed /usr/src/debug/cups/2.4.11/ppdc -> /usr/src/debug/cups/2.4.12/ppdc, directory renamed /usr/src/debug/cups/2.4.11/notifier -> /usr/src/debug/cups/2.4.12/notifier, directory renamed /usr/src/debug/cups/2.4.11/filter -> /usr/src/debug/cups/2.4.12/filter, directory renamed /usr/src/debug/cups/2.4.11/cgi-bin -> /usr/src/debug/cups/2.4.12/cgi-bin, directory renamed /usr/src/debug/cups/2.4.11/berkeley -> /usr/src/debug/cups/2.4.12/berkeley, directory renamed /usr/src/debug/cups/2.4.11/scheduler -> /usr/src/debug/cups/2.4.12/scheduler, directory renamed /usr/src/debug/cups/2.4.11/backend -> /usr/src/debug/cups/2.4.12/backend, directory renamed /usr/src/debug/cups/2.4.11/tools -> /usr/src/debug/cups/2.4.12/tools, directory renamed /usr/src/debug/cups/2.4.11/systemv -> /usr/src/debug/cups/2.4.12/systemv, directory renamed /usr/src/debug/cups/2.4.11/monitor -> /usr/src/debug/cups/2.4.12/monitor, removed "/usr/src/debug/cups
 /2.4.11/cups/raster-private.h /usr/src/debug/cups/2.4.11/cups/raster.h /usr/src/debug/cups/2.4.11/cups/array.h /usr/src/debug/cups/2.4.11/cups/thread.c /usr/src/debug/cups/2.4.11/cups/cups-private.h /usr/src/debug/cups/2.4.11/cups/globals.c /usr/src/debug/cups/2.4.11/cups/array.c /usr/src/debug/cups/2.4.11/cups/ipp-private.h /usr/src/debug/cups/2.4.11/cups/options.c /usr/src/debug/cups/2.4.11/cups/http.c /usr/src/debug/cups/2.4.11/cups/notify.c /usr/src/debug/cups/2.4.11/cups/request.c /usr/src/debug/cups/2.4.11/cups/http.h /usr/src/debug/cups/2.4.11/cups/tls-openssl.c /usr/src/debug/cups/2.4.11/cups/backend.h /usr/src/debug/cups/2.4.11/cups/usersys.c /usr/src/debug/cups/2.4.11/cups/backend.c /usr/src/debug/cups/2.4.11/cups/adminutil.c /usr/src/debug/cups/2.4.11/cups/adminutil.h /usr/src/debug/cups/2.4.11/cups/md5.c /usr/src/debug/cups/2.4.11/cups/file-private.h /usr/src/debug/cups/2.4.11/cups/debug.c /usr/src/debug/cups/2.4.11/cups/dir.h /usr/src/debug/cups/2.4.11/cups/getputfile.c
  /usr/src/debug/cups/2.4.11/cups/ipp-support.c /usr/src/debug/cups/2.4.11/cups/pwg.h /usr/src/debug/cups/2.4.11/cups/http-support.c /usr/src/debug/cups/2.4.11/cups/dir.c /usr/src/debug/cups/2.4.11/cups/raster-interpret.c /usr/src/debug/cups/2.4.11/cups/raster-interstub.c /usr/src/debug/cups/2.4.11/cups/ppd-private.h /usr/src/debug/cups/2.4.11/cups/encode.c /usr/src/debug/cups/2.4.11/cups/file.c /usr/src/debug/cups/2.4.11/cups/file.h /usr/src/debug/cups/2.4.11/cups/raster-stubs.c /usr/src/debug/cups/2.4.11/cups/array-private.h /usr/src/debug/cups/2.4.11/cups/tempfile.c /usr/src/debug/cups/2.4.11/cups/transcode.h /usr/src/debug/cups/2.4.11/cups/transcode.c /usr/src/debug/cups/2.4.11/cups/http-private.h /usr/src/debug/cups/2.4.11/cups/string-private.h /usr/src/debug/cups/2.4.11/cups/backchannel.c /usr/src/debug/cups/2.4.11/cups/ppd-conflicts.c /usr/src/debug/cups/2.4.11/cups/md5-internal.h /usr/src/debug/cups/2.4.11/cups/dest-job.c /usr/src/debug/cups/2.4.11/cups/ipp.h /usr/src/debug/c
 ups/2.4.11/cups/pwg-media.c /usr/src/debug/cups/2.4.11/cups/ipp-file.c /usr/src/debug/cups/2.4.11/cups/ipp-vars.c /usr/src/debug/cups/2.4.11/cups/ipp.c /usr/src/debug/cups/2.4.11/cups/md5passwd.c /usr/src/debug/cups/2.4.11/cups/hash.c /usr/src/debug/cups/2.4.11/cups/auth.c /usr/src/debug/cups/2.4.11/cups/cups.h /usr/src/debug/cups/2.4.11/cups/dest.c /usr/src/debug/cups/2.4.11/cups/snmp.c /usr/src/debug/cups/2.4.11/cups/util.c /usr/src/debug/cups/2.4.11/cups/ppd.h /usr/src/debug/cups/2.4.11/cups/language.c /usr/src/debug/cups/2.4.11/cups/ppd.c /usr/src/debug/cups/2.4.11/cups/snmp-private.h /usr/src/debug/cups/2.4.11/cups/language.h /usr/src/debug/cups/2.4.11/cups/langprintf.c /usr/src/debug/cups/2.4.11/cups/thread-private.h /usr/src/debug/cups/2.4.11/cups/sidechannel.c /usr/src/debug/cups/2.4.11/cups/pwg-private.h /usr/src/debug/cups/2.4.11/cups/getdevices.c /usr/src/debug/cups/2.4.11/cups/sidechannel.h /usr/src/debug/cups/2.4.11/cups/ppd-localize.c /usr/src/debug/cups/2.4.11/cups/ra
 ster-error.c /usr/src/debug/cups/2.4.11/cups/dest-localization.c /usr/src/debug/cups/2.4.11/cups/ppd-attr.c /usr/src/debug/cups/2.4.11/cups/ppd-emit.c /usr/src/debug/cups/2.4.11/cups/ppd-mark.c /usr/src/debug/cups/2.4.11/cups/ppd-page.c /usr/src/debug/cups/2.4.11/cups/ppd-util.c /usr/src/debug/cups/2.4.11/cups/raster-stream.c /usr/src/debug/cups/2.4.11/cups/string.c /usr/src/debug/cups/2.4.11/cups/ppd-cache.c /usr/src/debug/cups/2.4.11/cups/dest-options.c /usr/src/debug/cups/2.4.11/cups/http-addr.c /usr/src/debug/cups/2.4.11/cups/language-private.h /usr/src/debug/cups/2.4.11/cups/ppd-custom.c /usr/src/debug/cups/2.4.11/cups/http-addrlist.c", added "/usr/src/debug/cups/2.4.12/cups/http-private.h /usr/src/debug/cups/2.4.12/cups/string-private.h /usr/src/debug/cups/2.4.12/cups/backchannel.c /usr/src/debug/cups/2.4.12/cups/ppd-conflicts.c /usr/src/debug/cups/2.4.12/cups/md5-internal.h /usr/src/debug/cups/2.4.12/cups/dest-job.c /usr/src/debug/cups/2.4.12/cups/ipp.h /usr/src/debug/cups/2.
 4.12/cups/pwg-media.c /usr/src/debug/cups/2.4.12/cups/ipp-file.c /usr/src/debug/cups/2.4.12/cups/ipp-vars.c /usr/src/debug/cups/2.4.12/cups/ipp.c /usr/src/debug/cups/2.4.12/cups/md5passwd.c /usr/src/debug/cups/2.4.12/cups/hash.c /usr/src/debug/cups/2.4.12/cups/auth.c /usr/src/debug/cups/2.4.12/cups/cups.h /usr/src/debug/cups/2.4.12/cups/dest.c /usr/src/debug/cups/2.4.12/cups/snmp.c /usr/src/debug/cups/2.4.12/cups/util.c /usr/src/debug/cups/2.4.12/cups/ppd.h /usr/src/debug/cups/2.4.12/cups/language.c /usr/src/debug/cups/2.4.12/cups/ppd.c /usr/src/debug/cups/2.4.12/cups/snmp-private.h /usr/src/debug/cups/2.4.12/cups/language.h /usr/src/debug/cups/2.4.12/cups/langprintf.c /usr/src/debug/cups/2.4.12/cups/thread-private.h /usr/src/debug/cups/2.4.12/cups/clock.c /usr/src/debug/cups/2.4.12/cups/sidechannel.c /usr/src/debug/cups/2.4.12/cups/sidechannel.h /usr/src/debug/cups/2.4.12/cups/getdevices.c /usr/src/debug/cups/2.4.12/cups/pwg-private.h /usr/src/debug/cups/2.4.12/cups/ppd-localize.c 
 /usr/src/debug/cups/2.4.12/cups/raster-error.c /usr/src/debug/cups/2.4.12/cups/dest-localization.c /usr/src/debug/cups/2.4.12/cups/ppd-attr.c /usr/src/debug/cups/2.4.12/cups/ppd-emit.c /usr/src/debug/cups/2.4.12/cups/ppd-mark.c /usr/src/debug/cups/2.4.12/cups/ppd-page.c /usr/src/debug/cups/2.4.12/cups/ppd-util.c /usr/src/debug/cups/2.4.12/cups/raster-stream.c /usr/src/debug/cups/2.4.12/cups/string.c /usr/src/debug/cups/2.4.12/cups/ppd-cache.c /usr/src/debug/cups/2.4.12/cups/dest-options.c /usr/src/debug/cups/2.4.12/cups/http-addr.c /usr/src/debug/cups/2.4.12/cups/language-private.h /usr/src/debug/cups/2.4.12/cups/ppd-custom.c /usr/src/debug/cups/2.4.12/cups/http-addrlist.c /usr/src/debug/cups/2.4.12/cups/raster-private.h /usr/src/debug/cups/2.4.12/cups/raster.h /usr/src/debug/cups/2.4.12/cups/array.h /usr/src/debug/cups/2.4.12/cups/thread.c /usr/src/debug/cups/2.4.12/cups/cups-private.h /usr/src/debug/cups/2.4.12/cups/array.c /usr/src/debug/cups/2.4.12/cups/globals.c /usr/src/debug/
 cups/2.4.12/cups/ipp-private.h /usr/src/debug/cups/2.4.12/cups/options.c /usr/src/debug/cups/2.4.12/cups/http.c /usr/src/debug/cups/2.4.12/cups/notify.c /usr/src/debug/cups/2.4.12/cups/request.c /usr/src/debug/cups/2.4.12/cups/http.h /usr/src/debug/cups/2.4.12/cups/tls-openssl.c /usr/src/debug/cups/2.4.12/cups/backend.h /usr/src/debug/cups/2.4.12/cups/usersys.c /usr/src/debug/cups/2.4.12/cups/backend.c /usr/src/debug/cups/2.4.12/cups/adminutil.c /usr/src/debug/cups/2.4.12/cups/adminutil.h /usr/src/debug/cups/2.4.12/cups/md5.c /usr/src/debug/cups/2.4.12/cups/file-private.h /usr/src/debug/cups/2.4.12/cups/debug.c /usr/src/debug/cups/2.4.12/cups/dir.h /usr/src/debug/cups/2.4.12/cups/getputfile.c /usr/src/debug/cups/2.4.12/cups/ipp-support.c /usr/src/debug/cups/2.4.12/cups/pwg.h /usr/src/debug/cups/2.4.12/cups/http-support.c /usr/src/debug/cups/2.4.12/cups/dir.c /usr/src/debug/cups/2.4.12/cups/raster-interpret.c /usr/src/debug/cups/2.4.12/cups/raster-interstub.c /usr/src/debug/cups/2.4.
 12/cups/ppd-private.h /usr/src/debug/cups/2.4.12/cups/encode.c /usr/src/debug/cups/2.4.12/cups/file.c /usr/src/debug/cups/2.4.12/cups/file.h /usr/src/debug/cups/2.4.12/cups/raster-stubs.c /usr/src/debug/cups/2.4.12/cups/array-private.h /usr/src/debug/cups/2.4.12/cups/tempfile.c /usr/src/debug/cups/2.4.12/cups/transcode.h /usr/src/debug/cups/2.4.12/cups/transcode.c"
packages/core2-64-poky-linux/cups/cups-src: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-staticdev: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups-webif: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups-webif: PKGSIZE changed from 1566880 to 1567018 (+0%)
packages/core2-64-poky-linux/cups/cups-webif: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups/cups: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups/cups: PKGSIZE changed from 7336700 to 7336812 (+0%)
packages/core2-64-poky-linux/cups/cups: PKGV changed from 2.4.11 [default] to 2.4.12 [default]
packages/core2-64-poky-linux/cups: PV changed from "2.4.11" to "2.4.12"
packages/core2-64-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.11/cups-2.4.11-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.12/cups-2.4.12-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/core2-64-poky-linux/cups: PKGV changed from 2.4.11 [default] to 2.4.12 [default]

--===============0628310955890442074==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.11-2.4.12.patch"

RnJvbSAxMGQ4ZDM0Njc3MDNlYzQ5ZTZlMzFhMzQ2NTgzYmFmZDMzOGI3OGQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDozMDo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cHM6IHVwZ3JhZGUgMi40LjExIC0+IDIuNC4xMgoKLS0tCiAuLi4vcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHMvMDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2ggfCAyICstCiAuLi4vY3Vw
cy9jdXBzLzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2ggICAg
fCAyICstCiAuLi4vY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25m
bGljdHMucGF0Y2ggICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xp
YmV4ZWNkaXIucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvY3Vwcy97Y3Vwc18yLjQuMTEuYmIgPT4gY3Vwc18yLjQuMTIuYmJ9ICAgfCAyICstCiA1IGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy97Y3Vwc18yLjQuMTEuYmIgPT4gY3Vwc18yLjQuMTIuYmJ9
ICg1MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAx
LXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHMvMDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2gKaW5kZXggYzBjYjdkZjU4MS4u
ZTJlYjFmNzQwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8w
MDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBjNWY5NDNiMWFjNmUxYzg2YWU2NDY4NmUyOWUxNzhmZWRmOTMzZTk2IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMTNkZWFmY2IwNWQyM2VkYjhkMWFmMDk1NTdmNzkx
Y2YwYjZlMTNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU2F1bCBXb2xkIDxzZ3dA
bGludXguaW50ZWwuY29tPgogRGF0ZTogVGh1LCAxMyBEZWMgMjAxMiAxOTowMzo1MiAtMDgwMAog
U3ViamVjdDogW1BBVENIXSB1c2UgZWNobyBvbmx5IGluIGluaXQKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRl
ZC1iaW5hcmllcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1k
b24tdC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAppbmRleCBjZjJmMWE2NzQ3
Li4wYzAzNjVjMjMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
LzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJh
dGVkLWJpbmFyaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYTlhMzEzYWU1YTJkMWRh
NjgzZGQ1ODU3MmRmMGQ3YTY2MGViOTIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4
YmExNTNiZDEyMmE5OTBhMzEyMzk4YWNhNTczY2FmMTFlMjRlNDg1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS29lbiBLb29pIDxrb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4KIERh
dGU6IFN1biwgMzAgSmFuIDIwMTEgMTY6Mzc6MjcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZG9u
J3QgdHJ5IHRvIHJ1biBnZW5lcmF0ZWQgYmluYXJpZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUt
Y29uZmxpY3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1
cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKaW5kZXggMzEzMzg4
MjJlNi4uN2Q3NmY4Y2VlMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRp
bGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg4
MGJhZDJjNmIwOGFmZDJlMmUzMDNiYzNjZWVhNTU5ZWRiZTc2ZDIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDRkNDIwZTViNmY4NTMwZjc0Njc0OWI2MTI2NDQyNTQ2OWQ3MGYwMWMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVy
LmNvbT4KIERhdGU6IFdlZCwgMyBPY3QgMjAxOCAwMDoyNzoxMSArMDgwMAogU3ViamVjdDogW1BB
VENIXSBjdXBzOiBmaXggbXVsdGlsaWIgaW5zdGFsbCBmaWxlIGNvbmZsaWN0cwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoCmluZGV4IDQ5M2M3
OTcwZWEuLjUxYTYzNDg0NGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHMvbGliZXhlY2Rpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9j
dXBzL2xpYmV4ZWNkaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDRhZTdhZDg3YWEwMjJm
NTEyOGJlMjIyZGZmYmYwYzUwZWM2ZTg0NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDA3MWQwNWNhZDM4YWYyZWI2NGI4MjhlYzliMjkyYWMzMTE3MDQ0OTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6
IFR1ZSwgMTMgSnVsIDIwMjEgMTI6NTY6MzAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gVXNlICRs
aWJleGVjZGlyIGluc3RlYWQgb2YgaGFyZGNvZGluZyAkcHJlZml4L2xpYiBhcyB0aGlzCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMS5iYiBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggNTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjExLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMi5iYgppbmRleCA3
MTU2ODI5NWNiLi5hYzczYzI3ODBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
Y3Vwcy9jdXBzXzIuNC4xMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
XzIuNC4xMi5iYgpAQCAtMiw0ICsyLDQgQEAgcmVxdWlyZSBjdXBzLmluYwogCiBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2
YmQ1NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhODhmZTFkYTNhMjlhOTE3YzNmYzY3Y2U2
ZWIzMTc4Mzk5ZDY4ZTFhNTQ4YzZkODZjNzBkOWIxMzY1MWZkNzEiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYjFkZGUxOTFhNGFlMjc2MGM0NzIyMGM4MmNhNjE1NWEyOGMzODI3MDFlNmMxYTAxNTlk
MTA1NDk5MDIzMWQ1OSIKLS0gCjIuNDcuMQoK

--===============0628310955890442074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cups/cups-locale-it: PKGSIZE changed from 342316 to 382517 (+12%)

--===============0628310955890442074==--

