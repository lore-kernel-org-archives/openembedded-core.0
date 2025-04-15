Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F75C3ABAF
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20177.1744723977284157943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YM25phId;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=irrK0nfD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019639a75c18-3c0d3771-6a20-40cf-b9a6-9112a2bac147-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tVAUhjSIXkbzkU8+VYwStpwmh6zFftjh80lDErd108Q=;
	b=YM25phId6hx8O+k/aF1GGr+2eT7fZIWfFsCqqHI1HcZKlBof9Cdl08ByqXaFh4Zn
	HEgac4J+5koUvzugMuX1SEQjh+k+4m5IAx+A2kEqgYJsONX2T+ieGVVk/4StMTzNdcq
	N7/91bf/RMjeF1LypHeqcF+onEKEj0+t13pPBVkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tVAUhjSIXkbzkU8+VYwStpwmh6zFftjh80lDErd108Q=;
	b=irrK0nfDt/bOw+aP3jWjUljg4BIGFr5v/nfAbZI3kYlANLB5ku1bAzxKm31u+/AX
	EOw6nqDb1NqxRa1HTDFeqbm12fcugX7FDYDXbjmO2WKt452b9omcy7kh+MVCBIHXRO6
	nIi2VBnd2rHzDh2HsiFntmPujgm8CXQriQghhadk=
Content-Type: multipart/mixed; boundary="===============6556068500887917992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost: upgrading to 1.88.0 SUCCEEDED
Message-ID: <0101019639a75c18-3c0d3771-6a20-40cf-b9a6-9112a2bac147-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214930

--===============6556068500887917992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost* to *1.88.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-upgrade-1.87.0-1.88.0.patch
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
From 13346df1fcf7b76c67af2c73d9fa12a822ccbcbe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 12:33:51 +0000
Subject: [PATCH] boost: upgrade 1.87.0 -> 1.88.0

---
 .../boost/{boost-1.87.0.inc => boost-1.88.0.inc}                | 2 +-
 ...1-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch | 2 +-
 .../boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch    | 2 +-
 .../boost/boost/boost-math-disable-pch-for-gcc.patch            | 2 +-
 meta/recipes-support/boost/{boost_1.87.0.bb => boost_1.88.0.bb} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/boost/{boost-1.87.0.inc => boost-1.88.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.87.0.bb => boost_1.88.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.87.0.inc b/meta/recipes-support/boost/boost-1.88.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.87.0.inc
rename to meta/recipes-support/boost/boost-1.88.0.inc
index c6e55b239e..917f1a9600 100644
--- a/meta/recipes-support/boost/boost-1.87.0.inc
+++ b/meta/recipes-support/boost/boost-1.88.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89"
+SRC_URI[sha256sum] = "46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5b12f7b"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 04bede4578..e175be648e 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From e2cc24d6d8b7b24a6d0a30c52c7ad69a001a0ad5 Mon Sep 17 00:00:00 2001
+From 42e895c8bfc64b4fbea1038a42183ef896cbbdda Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index db1ee03898..ab39e0cf45 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -1,4 +1,4 @@
-From b0728812241c048907e6f1ba168292cd9948347d Mon Sep 17 00:00:00 2001
+From 910a7b19301e788535c591a0fe2aadd2780058c0 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index ad90d96ddd..82782cf1f1 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From e7491f9874411fd9855957812ba9bac948a61356 Mon Sep 17 00:00:00 2001
+From d331f8be81135c46479cc141afeb30444998aadf Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
diff --git a/meta/recipes-support/boost/boost_1.87.0.bb b/meta/recipes-support/boost/boost_1.88.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.87.0.bb
rename to meta/recipes-support/boost/boost_1.88.0.bb
-- 
2.47.1


--===============6556068500887917992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/boost/boost-atomic: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-atomic: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.87.0", added "/usr/lib/libboost_atomic.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.87.0 to libboost-atomic1.88.0
packages/core2-64-poky-linux/boost/boost-charconv: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-charconv: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-charconv: FILELIST: removed "/usr/lib/libboost_charconv.so.1.87.0", added "/usr/lib/libboost_charconv.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-charconv: PKG changed from libboost-charconv1.87.0 to libboost-charconv1.88.0
packages/core2-64-poky-linux/boost/boost-chrono: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-chrono: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.87.0", added "/usr/lib/libboost_chrono.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.87.0 to libboost-chrono1.88.0
packages/core2-64-poky-linux/boost/boost-container: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-container: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.87.0", added "/usr/lib/libboost_container.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-container: PKG changed from libboost-container1.87.0 to libboost-container1.88.0
packages/core2-64-poky-linux/boost/boost-context: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-context: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.87.0", added "/usr/lib/libboost_context.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-context: PKG changed from libboost-context1.87.0 to libboost-context1.88.0
packages/core2-64-poky-linux/boost/boost-contract: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-contract: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.87.0", added "/usr/lib/libboost_contract.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.87.0 to libboost-contract1.88.0
packages/core2-64-poky-linux/boost/boost-coroutine: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-coroutine: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.87.0", added "/usr/lib/libboost_coroutine.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.87.0 to libboost-coroutine1.88.0
packages/core2-64-poky-linux/boost/boost-date-time: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-date-time: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.87.0", added "/usr/lib/libboost_date_time.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.87.0 to libboost-date-time1.88.0
packages/core2-64-poky-linux/boost/boost-dbg: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-dbg: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-dbg: FILELIST: removed "/usr/lib/.debug/libboost_math_tr1.so.1.87.0 /usr/lib/.debug/libboost_filesystem.so.1.87.0 /usr/lib/.debug/libboost_iostreams.so.1.87.0 /usr/lib/.debug/libboost_date_time.so.1.87.0 /usr/lib/.debug/libboost_serialization.so.1.87.0 /usr/lib/.debug/libboost_charconv.so.1.87.0 /usr/lib/.debug/libboost_math_tr1f.so.1.87.0 /usr/lib/.debug/libboost_math_tr1l.so.1.87.0 /usr/lib/.debug/libboost_python313.so.1.87.0 /usr/lib/.debug/libboost_json.so.1.87.0 /usr/lib/.debug/libboost_wave.so.1.87.0 /usr/lib/.debug/libboost_atomic.so.1.87.0 /usr/lib/.debug/libboost_chrono.so.1.87.0 /usr/lib/.debug/libboost_locale.so.1.87.0 /usr/lib/.debug/libboost_coroutine.so.1.87.0 /usr/lib/.debug/libboost_random.so.1.87.0 /usr/lib/.debug/libboost_system.so.1.87.0 /usr/lib/.debug/libboost_contract.so.1.87.0 /usr/lib/.debug/libboost_thread.so.1.87.0 /usr/lib/.debug/libboost_log_setup.so.1.87.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.87.0 /usr/li
 b/.debug/libboost_math_c99.so.1.87.0 /usr/lib/.debug/libboost_log.so.1.87.0 /usr/lib/.debug/libboost_url.so.1.87.0 /usr/lib/.debug/libboost_math_c99f.so.1.87.0 /usr/lib/.debug/libboost_math_c99l.so.1.87.0 /usr/lib/.debug/libboost_unit_test_framework.so.1.87.0 /usr/lib/.debug/libboost_context.so.1.87.0 /usr/lib/.debug/libboost_fiber.so.1.87.0 /usr/lib/.debug/libboost_graph.so.1.87.0 /usr/lib/.debug/libboost_regex.so.1.87.0 /usr/lib/.debug/libboost_timer.so.1.87.0 /usr/lib/.debug/libboost_wserialization.so.1.87.0 /usr/lib/.debug/libboost_type_erasure.so.1.87.0 /usr/lib/.debug/libboost_container.so.1.87.0 /usr/lib/.debug/libboost_program_options.so.1.87.0", added "/usr/lib/.debug/libboost_wave.so.1.88.0 /usr/lib/.debug/libboost_json.so.1.88.0 /usr/lib/.debug/libboost_math_tr1.so.1.88.0 /usr/lib/.debug/libboost_coroutine.so.1.88.0 /usr/lib/.debug/libboost_math_tr1l.so.1.88.0 /usr/lib/.debug/libboost_python313.so.1.88.0 /usr/lib/.debug/libboost_program_options.so.1.88.0 /usr/lib/.debug/l
 ibboost_math_tr1f.so.1.88.0 /usr/lib/.debug/libboost_serialization.so.1.88.0 /usr/lib/.debug/libboost_unit_test_framework.so.1.88.0 /usr/lib/.debug/libboost_iostreams.so.1.88.0 /usr/lib/.debug/libboost_atomic.so.1.88.0 /usr/lib/.debug/libboost_chrono.so.1.88.0 /usr/lib/.debug/libboost_locale.so.1.88.0 /usr/lib/.debug/libboost_random.so.1.88.0 /usr/lib/.debug/libboost_fiber.so.1.88.0 /usr/lib/.debug/libboost_contract.so.1.88.0 /usr/lib/.debug/libboost_graph.so.1.88.0 /usr/lib/.debug/libboost_regex.so.1.88.0 /usr/lib/.debug/libboost_system.so.1.88.0 /usr/lib/.debug/libboost_thread.so.1.88.0 /usr/lib/.debug/libboost_timer.so.1.88.0 /usr/lib/.debug/libboost_filesystem.so.1.88.0 /usr/lib/.debug/libboost_log.so.1.88.0 /usr/lib/.debug/libboost_url.so.1.88.0 /usr/lib/.debug/libboost_charconv.so.1.88.0 /usr/lib/.debug/libboost_log_setup.so.1.88.0 /usr/lib/.debug/libboost_prg_exec_monitor.so.1.88.0 /usr/lib/.debug/libboost_context.so.1.88.0 /usr/lib/.debug/libboost_type_erasure.so.1.88.0 /usr
 /lib/.debug/libboost_wserialization.so.1.88.0 /usr/lib/.debug/libboost_math_c99f.so.1.88.0 /usr/lib/.debug/libboost_math_c99l.so.1.88.0 /usr/lib/.debug/libboost_date_time.so.1.88.0 /usr/lib/.debug/libboost_math_c99.so.1.88.0 /usr/lib/.debug/libboost_container.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-dbg: PKGSIZE changed from 155653544 to 155799440 (+0%)
packages/core2-64-poky-linux/boost/boost-dev: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-dev: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_atomic-1.87.0 -> /usr/lib/cmake/boost_atomic-1.88.0, directory renamed /usr/lib/cmake/boost_contract-1.87.0 -> /usr/lib/cmake/boost_contract-1.88.0, directory renamed /usr/lib/cmake/boost_iostreams-1.87.0 -> /usr/lib/cmake/boost_iostreams-1.88.0, directory renamed /usr/lib/cmake/boost_container-1.87.0 -> /usr/lib/cmake/boost_container-1.88.0, directory renamed /usr/lib/cmake/boost_headers-1.87.0 -> /usr/lib/cmake/boost_headers-1.88.0, directory renamed /usr/lib/cmake/boost_date_time-1.87.0 -> /usr/lib/cmake/boost_date_time-1.88.0, directory renamed /usr/lib/cmake/boost_regex-1.87.0 -> /usr/lib/cmake/boost_regex-1.88.0, directory renamed /usr/lib/cmake/boost_charconv-1.87.0 -> /usr/lib/cmake/boost_charconv-1.88.0, directory renamed /usr/lib/cmake/boost_fiber-1.87.0 -> /usr/lib/cmake/boost_fiber-1.88.0, directory renamed /usr/lib/cmake/boost_math-1.87.0 -> /usr/lib/cmake/boost_math-1.88.0, di
 rectory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.87.0 -> /usr/lib/cmake/boost_prg_exec_monitor-1.88.0, directory renamed /usr/lib/cmake/boost_program_options-1.87.0 -> /usr/lib/cmake/boost_program_options-1.88.0, directory renamed /usr/lib/cmake/boost_timer-1.87.0 -> /usr/lib/cmake/boost_timer-1.88.0, directory renamed /usr/lib/cmake/boost_exception-1.87.0 -> /usr/lib/cmake/boost_exception-1.88.0, directory renamed /usr/lib/cmake/Boost-1.87.0 -> /usr/lib/cmake/Boost-1.88.0, directory renamed /usr/lib/cmake/boost_filesystem-1.87.0 -> /usr/lib/cmake/boost_filesystem-1.88.0, directory renamed /usr/lib/cmake/boost_random-1.87.0 -> /usr/lib/cmake/boost_random-1.88.0, directory renamed /usr/lib/cmake/boost_context-1.87.0 -> /usr/lib/cmake/boost_context-1.88.0, directory renamed /usr/lib/cmake/boost_chrono-1.87.0 -> /usr/lib/cmake/boost_chrono-1.88.0, directory renamed /usr/lib/cmake/boost_locale-1.87.0 -> /usr/lib/cmake/boost_locale-1.88.0, directory renamed /usr/lib/cmake/boost_py
 thon-1.87.0 -> /usr/lib/cmake/boost_python-1.88.0, directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.87.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.88.0, directory renamed /usr/lib/cmake/boost_log_setup-1.87.0 -> /usr/lib/cmake/boost_log_setup-1.88.0, directory renamed /usr/lib/cmake/boost_serialization-1.87.0 -> /usr/lib/cmake/boost_serialization-1.88.0, directory renamed /usr/lib/cmake/boost_log-1.87.0 -> /usr/lib/cmake/boost_log-1.88.0, directory renamed /usr/lib/cmake/boost_url-1.87.0 -> /usr/lib/cmake/boost_url-1.88.0, directory renamed /usr/lib/cmake/boost_system-1.87.0 -> /usr/lib/cmake/boost_system-1.88.0, directory renamed /usr/lib/cmake/boost_thread-1.87.0 -> /usr/lib/cmake/boost_thread-1.88.0, directory renamed /usr/lib/cmake/boost_coroutine-1.87.0 -> /usr/lib/cmake/boost_coroutine-1.88.0, directory renamed /usr/lib/cmake/boost_json-1.87.0 -> /usr/lib/cmake/boost_json-1.88.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.87.0 -> /usr/lib/cmake/bo
 ost_unit_test_framework-1.88.0, directory renamed /usr/lib/cmake/boost_type_erasure-1.87.0 -> /usr/lib/cmake/boost_type_erasure-1.88.0, directory renamed /usr/lib/cmake/boost_math_c99-1.87.0 -> /usr/lib/cmake/boost_math_c99-1.88.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.87.0 -> /usr/lib/cmake/boost_math_tr1-1.88.0, directory renamed /usr/lib/cmake/boost_graph-1.87.0 -> /usr/lib/cmake/boost_graph-1.88.0, directory renamed /usr/lib/cmake/boost_wave-1.87.0 -> /usr/lib/cmake/boost_wave-1.88.0, directory renamed /usr/lib/cmake/boost_numpy-1.87.0 -> /usr/lib/cmake/boost_numpy-1.88.0, directory renamed /usr/lib/cmake/boost_math_c99f-1.87.0 -> /usr/lib/cmake/boost_math_c99f-1.88.0, directory renamed /usr/lib/cmake/boost_wserialization-1.87.0 -> /usr/lib/cmake/boost_wserialization-1.88.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.87.0 -> /usr/lib/cmake/boost_math_c99l-1.88.0, directory renamed /usr/lib/cmake/boost_math_tr1f-1.87.0 -> /usr/lib/cmake/boost_math_tr1f-1.88.0,
  directory renamed /usr/lib/cmake/boost_math_tr1l-1.87.0 -> /usr/lib/cmake/boost_math_tr1l-1.88.0, removed "/usr/include/boost/process/async_system.hpp /usr/include/boost/redis/detail/handshaker.hpp /usr/include/boost/iterator/detail/enable_if.hpp /usr/include/boost/redis/detail/connection_base.hpp /usr/include/boost/process/windows.hpp /usr/include/boost/process/async.hpp /usr/include/boost/process/child.hpp /usr/include/boost/process/group.hpp /usr/include/boost/process/posix.hpp /usr/include/boost/process/spawn.hpp /usr/include/boost/process/handles.hpp /usr/include/boost/process/exe.hpp /usr/include/boost/process/env.hpp /usr/include/boost/process/cmd.hpp /usr/include/boost/process/system.hpp /usr/include/boost/process/filesystem.hpp /usr/include/boost/redis/impl/runner.ipp /usr/include/boost/process/locale.hpp /usr/include/boost/process/exception.hpp /usr/include/boost/iterator/detail/minimum_category.hpp /usr/include/boost/process/args.hpp /usr/include/boost/process/pipe.hpp /
 usr/include/boost/process/search_path.hpp /usr/include/boost/process/v1.hpp /usr/include/boost/process/v2.hpp /usr/include/boost/process/io.hpp /usr/include/boost/process/async_pipe.hpp /usr/include/boost/cobalt/detail/leaf.hpp /usr/include/boost/iterator/detail/any_conversion_eater.hpp /usr/include/boost/process/extend.hpp /usr/lib/cmake/BoostDetectToolset-1.87.0.cmake /usr/include/boost/cobalt/leaf.hpp", added "/usr/include/boost/redis/detail/resp3_handshaker.hpp /usr/include/boost/mqtt5.hpp /usr/include/boost/mqtt5/detail/async_mutex.hpp /usr/include/boost/mqtt5/websocket.hpp /usr/include/boost/mqtt5/detail/shutdown.hpp /usr/include/boost/process/process_handle.hpp /usr/include/boost/core/detail/assert.hpp /usr/include/boost/hash2/detail/rot.hpp /usr/include/boost/mqtt5/impl/publish_rec_op.hpp /usr/include/boost/hash2/fnv1a.hpp /usr/include/boost/mqtt5/types.hpp /usr/include/boost/hash2/detail/write.hpp /usr/include/boost/mqtt5/detail/cancellable_handler.hpp /usr/include/boost/pr
 ocess/pid.hpp /usr/include/boost/process/ext.hpp /usr/include/boost/poly_collection/variant_collection.hpp /usr/include/boost/random/generalized_inverse_gaussian_distribution.hpp /usr/include/boost/iterator/detail/eval_if_default.hpp /usr/include/boost/process/posix/default_launcher.hpp /usr/include/boost/stacktrace/detail/addr_base_msvc.hpp /usr/include/boost/process/ext/env.hpp /usr/lib/cmake/BoostDetectToolset-1.88.0.cmake /usr/include/boost/poly_collection/detail/fixed_variant.hpp /usr/include/boost/mqtt5/detail/utf8_mqtt.hpp /usr/include/boost/poly_collection/detail/is_closed_collection.hpp /usr/include/boost/mqtt5/impl/reconnect_op.hpp /usr/include/boost/iterator/detail/type_traits/disjunction.hpp /usr/include/boost/poly_collection/detail/size_t_map.hpp /usr/include/boost/mqtt5/property_types.hpp /usr/include/boost/mqtt5/detail/internal_types.hpp /usr/include/boost/mqtt5/impl/subscribe_op.hpp /usr/include/boost/hash2/hmac.hpp /usr/include/boost/mqtt5/detail/topic_validation.hp
 p /usr/include/boost/hash2/xxhash.hpp /usr/include/boost/hash2/ripemd.hpp /usr/include/boost/mqtt5/logger.hpp /usr/include/boost/hash2/flavor.hpp /usr/include/boost/hash2/digest.hpp /usr/include/boost/mqtt5/impl/codecs/base_decoders.hpp /usr/include/boost/mqtt5/impl/codecs/base_encoders.hpp /usr/include/boost/mqtt5/impl/publish_send_op.hpp /usr/include/boost/mqtt5/detail/channel_traits.hpp /usr/include/boost/hash2/is_endian_independent.hpp /usr/include/boost/process/windows/with_logon_launcher.hpp /usr/include/boost/hash2/detail/memcmp.hpp /usr/include/boost/hash2/detail/memcpy.hpp /usr/include/boost/hash2/detail/memset.hpp /usr/include/boost/mqtt5/impl/disconnect_op.hpp /usr/include/boost/mqtt5/detail/async_traits.hpp /usr/include/boost/process/posix/vfork_launcher.hpp /usr/include/boost/mqtt5/impl/run_op.hpp /usr/include/boost/hash2/legacy/spooky2.hpp /usr/include/boost/mqtt5/detail/control_packet.hpp /usr/include/boost/mqtt5/impl/read_op.hpp /usr/include/boost/mqtt5/impl/write_op
 .hpp /usr/include/boost/process/windows/as_user_launcher.hpp /usr/include/boost/iterator/detail/type_traits/conjunction.hpp /usr/include/boost/process/posix/fork_and_forget_launcher.hpp /usr/include/boost/mqtt5/impl/read_message_op.hpp /usr/include/boost/mqtt5/ssl.hpp /usr/include/boost/process/windows/show_window.hpp /usr/include/boost/process/default_launcher.hpp /usr/include/boost/spirit/home/x3/support/expectation.hpp /usr/include/boost/mqtt5/detail/rebind_executor.hpp /usr/include/boost/mqtt5/websocket_ssl.hpp /usr/include/boost/hash2/detail/is_constant_evaluated.hpp /usr/include/boost/mqtt5/impl/autoconnect_stream.hpp /usr/include/boost/iterator/detail/if_default.hpp /usr/include/boost/poly_collection/detail/copyable.hpp /usr/include/boost/hash2/siphash.hpp /usr/include/boost/mqtt5/reason_codes.hpp /usr/include/boost/mqtt5/impl/connect_op.hpp /usr/include/boost/random/inverse_gaussian_distribution.hpp /usr/include/boost/hash2/is_trivially_equality_comparable.hpp /usr/include/b
 oost/lockfree/spsc_value.hpp /usr/include/boost/mqtt5/impl/async_sender.hpp /usr/include/boost/hash2/detail/config.hpp /usr/include/boost/iterator/detail/type_traits/negation.hpp /usr/include/boost/process/ext/exe.hpp /usr/include/boost/iterator/detail/type_traits/type_identity.hpp /usr/include/boost/process/windows/creation_flags.hpp /usr/include/boost/random/detail/xoshiro_base.hpp /usr/include/boost/mqtt5/error.hpp /usr/include/boost/process/popen.hpp /usr/include/boost/process/stdio.hpp /usr/include/boost/poly_collection/detail/end_no_sanitize.hpp /usr/include/boost/mqtt5/impl/replies.hpp /usr/include/boost/mqtt5/impl/assemble_op.hpp /usr/include/boost/mqtt5/impl/client_service.hpp /usr/include/boost/mqtt5/impl/endpoints.hpp /usr/include/boost/process/windows/with_token_launcher.hpp /usr/include/boost/hash2/detail/bit_cast.hpp /usr/include/boost/process/exit_code.hpp /usr/include/boost/process/cstring_ref.hpp /usr/include/boost/iterator/shared_container_iterator.hpp /usr/include
 /boost/mqtt5/impl/codecs/message_decoders.hpp /usr/include/boost/mqtt5/impl/codecs/message_encoders.hpp /usr/include/boost/redis/adapter/any_adapter.hpp /usr/include/boost/hash2/hash_append_fwd.hpp /usr/include/boost/hash2/detail/read.hpp /usr/include/boost/iterator/min_category.hpp /usr/include/boost/poly_collection/detail/begin_no_sanitize.hpp /usr/include/boost/mqtt5/impl/re_auth_op.hpp /usr/include/boost/process/process.hpp /usr/include/boost/mqtt5/mqtt_client.hpp /usr/include/boost/process/posix/pdfork_launcher.hpp /usr/include/boost/process/ext/cwd.hpp /usr/include/boost/hash2/sha1.hpp /usr/include/boost/hash2/sha2.hpp /usr/include/boost/hash2/sha3.hpp /usr/include/boost/hash2/endian.hpp /usr/include/boost/hash2/detail/keccak.hpp /usr/include/boost/process/posix/bind_fd.hpp /usr/include/boost/mqtt5/detail/any_authenticator.hpp /usr/include/boost/process/bind_launcher.hpp /usr/include/boost/poly_collection/detail/variant_model.hpp /usr/include/boost/random/xoshiro.hpp /usr/incl
 ude/boost/mqtt5/impl/unsubscribe_op.hpp /usr/include/boost/mqtt5/logger_traits.hpp /usr/include/boost/mqtt5/detail/traits.hpp /usr/include/boost/random/detail/size.hpp /usr/include/boost/hash2/get_integral_result.hpp /usr/include/boost/iterator/enable_if_convertible.hpp /usr/include/boost/mqtt5/detail/log_invoke.hpp /usr/include/boost/hash2/is_contiguously_hashable.hpp /usr/include/boost/process/ext/cmd.hpp /usr/include/boost/hash2/hash_append.hpp /usr/include/boost/mqtt5/impl/sentry_op.hpp /usr/include/boost/iterator/generator_iterator.hpp /usr/include/boost/poly_collection/detail/is_moveable.hpp /usr/include/boost/hash2/md5.hpp /usr/include/boost/hash2/detail/has_tag_invoke.hpp /usr/include/boost/hash2/has_constant_size.hpp /usr/include/boost/redis/impl/resp3_handshaker.ipp /usr/include/boost/poly_collection/detail/segment_map.hpp /usr/include/boost/geometry/algorithms/detail/overlay/debug_traverse.hpp /usr/include/boost/hash2/legacy/murmur3.hpp /usr/include/boost/mqtt5/impl/ping_
 op.hpp /usr/include/boost/mqtt5/impl/shutdown_op.hpp /usr/include/boost/poly_collection/variant_collection_fwd.hpp /usr/include/boost/process/windows/default_launcher.hpp /usr/include/boost/process/execute.hpp /usr/include/boost/poly_collection/detail/fixed_variant_iterator.hpp"
packages/core2-64-poky-linux/boost/boost-dev: PKGSIZE changed from 149909165 to 150707030 (+1%)
packages/core2-64-poky-linux/boost/boost-exception: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-exception: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-fiber: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-fiber: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-fiber: FILELIST: removed "/usr/lib/libboost_fiber.so.1.87.0", added "/usr/lib/libboost_fiber.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-fiber: PKG changed from libboost-fiber1.87.0 to libboost-fiber1.88.0
packages/core2-64-poky-linux/boost/boost-filesystem: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-filesystem: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.87.0", added "/usr/lib/libboost_filesystem.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.87.0 to libboost-filesystem1.88.0
packages/core2-64-poky-linux/boost/boost-graph: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-graph: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.87.0", added "/usr/lib/libboost_graph.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.87.0 to libboost-graph1.88.0
packages/core2-64-poky-linux/boost/boost-headers: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-headers: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-iostreams: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-iostreams: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.87.0", added "/usr/lib/libboost_iostreams.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.87.0 to libboost-iostreams1.88.0
packages/core2-64-poky-linux/boost/boost-json: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-json: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.87.0", added "/usr/lib/libboost_json.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-json: PKG changed from libboost-json1.87.0 to libboost-json1.88.0
packages/core2-64-poky-linux/boost/boost-locale: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-locale: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.87.0", added "/usr/lib/libboost_locale.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-locale: PKGSIZE changed from 912232 to 928616 (+2%)
packages/core2-64-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.87.0 to libboost-locale1.88.0
packages/core2-64-poky-linux/boost/boost-log: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-log: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log.so.1.87.0 /usr/lib/libboost_log_setup.so.1.87.0", added "/usr/lib/libboost_log_setup.so.1.88.0 /usr/lib/libboost_log.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-math: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-math: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_c99.so.1.87.0 /usr/lib/libboost_math_c99f.so.1.87.0 /usr/lib/libboost_math_c99l.so.1.87.0 /usr/lib/libboost_math_tr1f.so.1.87.0 /usr/lib/libboost_math_tr1l.so.1.87.0 /usr/lib/libboost_math_tr1.so.1.87.0", added "/usr/lib/libboost_math_tr1l.so.1.88.0 /usr/lib/libboost_math_tr1f.so.1.88.0 /usr/lib/libboost_math_c99l.so.1.88.0 /usr/lib/libboost_math_c99f.so.1.88.0 /usr/lib/libboost_math_c99.so.1.88.0 /usr/lib/libboost_math_tr1.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-program-options: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-program-options: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.87.0", added "/usr/lib/libboost_program_options.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.87.0 to libboost-program-options1.88.0
packages/core2-64-poky-linux/boost/boost-python: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-python: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python313.so.1.87.0", added "/usr/lib/libboost_python313.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-python: PKG changed from libboost-python313-1.87.0 to libboost-python313-1.88.0
packages/core2-64-poky-linux/boost/boost-random: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-random: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.87.0", added "/usr/lib/libboost_random.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-random: PKG changed from libboost-random1.87.0 to libboost-random1.88.0
packages/core2-64-poky-linux/boost/boost-regex: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-regex: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.87.0", added "/usr/lib/libboost_regex.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.87.0 to libboost-regex1.88.0
packages/core2-64-poky-linux/boost/boost-serialization: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-serialization: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_serialization.so.1.87.0 /usr/lib/libboost_wserialization.so.1.87.0", added "/usr/lib/libboost_serialization.so.1.88.0 /usr/lib/libboost_wserialization.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-src: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-src: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-src: FILELIST: directory renamed /usr/src/debug/boost/1.87.0/boost/atomic -> /usr/src/debug/boost/1.88.0/boost/atomic, directory renamed /usr/src/debug/boost/1.87.0/boost/graph/detail -> /usr/src/debug/boost/1.88.0/boost/graph/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/proto/detail -> /usr/src/debug/boost/1.88.0/boost/proto/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/align/detail -> /usr/src/debug/boost/1.88.0/boost/align/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/fiber/detail -> /usr/src/debug/boost/1.88.0/boost/fiber/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/range/detail -> /usr/src/debug/boost/1.88.0/boost/range/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/ratio/detail -> /usr/src/debug/boost/1.88.0/boost/ratio/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/scope/detail -> /usr/src/debug/boost/1.88.0/boost/scope/detail, directory renamed /usr/src
 /debug/boost/1.87.0/boost/smart_ptr/detail -> /usr/src/debug/boost/1.88.0/boost/smart_ptr/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/tuple/detail -> /usr/src/debug/boost/1.88.0/boost/tuple/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/exception -> /usr/src/debug/boost/1.88.0/boost/exception, directory renamed /usr/src/debug/boost/1.87.0/boost/python/object -> /usr/src/debug/boost/1.88.0/boost/python/object, directory renamed /usr/src/debug/boost/1.87.0/boost/log/utility/setup -> /usr/src/debug/boost/1.88.0/boost/log/utility/setup, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/meta/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/meta/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/test -> /usr/src/debug/boost/1.88.0/boost/test, directory renamed /usr/src/debug/boost/1.87.0/boost/thread/futures -> /usr/src/debug/boost/1.88.0/boost/thread/futures, directory renamed /usr/src/debug/boost/1.87.0/libs/python/s
 rc/converter -> /usr/src/debug/boost/1.88.0/libs/python/src/converter, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/iterator -> /usr/src/debug/boost/1.88.0/boost/fusion/iterator, directory renamed /usr/src/debug/boost/1.87.0/boost/date_time/gregorian -> /usr/src/debug/boost/1.88.0/boost/date_time/gregorian, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/container/vector -> /usr/src/debug/boost/1.88.0/boost/fusion/container/vector, directory renamed /usr/src/debug/boost/1.87.0/boost/variant2 -> /usr/src/debug/boost/1.88.0/boost/variant2, directory renamed /usr/src/debug/boost/1.87.0/boost/filesystem/detail/type_traits -> /usr/src/debug/boost/1.88.0/boost/filesystem/detail/type_traits, directory renamed /usr/src/debug/boost/1.87.0/boost/archive/impl -> /usr/src/debug/boost/1.88.0/boost/archive/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/numeric -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi/numeric, directory renamed /usr/src
 /debug/boost/1.87.0/boost/algorithm/cxx11 -> /usr/src/debug/boost/1.88.0/boost/algorithm/cxx11, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/bind -> /usr/src/debug/boost/1.88.0/boost/phoenix/bind, directory renamed /usr/src/debug/boost/1.87.0/boost/endian -> /usr/src/debug/boost/1.88.0/boost/endian, directory renamed /usr/src/debug/boost/1.87.0/boost/contract -> /usr/src/debug/boost/1.88.0/boost/contract/detail/inlined, directory renamed /usr/src/debug/boost/1.87.0/boost/core -> /usr/src/debug/boost/1.88.0/boost/core, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/container/list -> /usr/src/debug/boost/1.88.0/boost/fusion/container/list, directory renamed /usr/src/debug/boost/1.87.0/boost/proto/functional/fusion -> /usr/src/debug/boost/1.88.0/boost/proto/functional/fusion, directory renamed /usr/src/debug/boost/1.87.0/boost/wave/cpplexer/re2clex -> /usr/src/debug/boost/1.88.0/boost/wave/cpplexer/re2clex, directory renamed /usr/src/debug/boost/1.87.0/boost/
 range -> /usr/src/debug/boost/1.88.0/boost/range, directory renamed /usr/src/debug/boost/1.87.0/boost/type_traits/detail -> /usr/src/debug/boost/1.88.0/boost/type_traits/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/ratio -> /usr/src/debug/boost/1.88.0/boost/ratio, directory renamed /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/posix -> /usr/src/debug/boost/1.88.0/libs/locale/src/posix, directory renamed /usr/src/debug/boost/1.87.0/boost/charconv/detail/dragonbox -> /usr/src/debug/boost/1.88.0/boost/charconv/detail/dragonbox, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/ryu/impl -> /usr/src/debug/boost/1.88.0/boost/json/detail/ryu/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/chrono -> /usr/src/debug/boost/1.88.0/boost/chrono, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/algorithm/iteration/detail -> /usr/src/debug/boost/1.88.0/boost/fusion/algorithm/iteration, directory renamed /usr/src/debug/boost/1.87.0/boost/u
 nordered/detail -> /usr/src/debug/boost/1.88.0/boost/unordered/detail, directory renamed /usr/src/debug/boost/1.87.0/libs/graph/src -> /usr/src/debug/boost/1.88.0/libs/graph/src, directory renamed /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/encoding -> /usr/src/debug/boost/1.88.0/libs/locale/src/encoding, directory renamed /usr/src/debug/boost/1.87.0/boost/thread/pthread -> /usr/src/debug/boost/1.88.0/boost/thread/pthread, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/char -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi/char, directory renamed /usr/src/debug/boost/1.87.0/boost/mpl/aux_/preprocessed/gcc -> /usr/src/debug/boost/1.88.0/boost/mpl/aux_/preprocessed/gcc, directory renamed /usr/src/debug/boost/1.87.0/boost/algorithm/string -> /usr/src/debug/boost/1.88.0/boost/algorithm/string, directory renamed /usr/src/debug/boost/1.87.0/boost/math/constants -> /usr/src/debug/boost/1.88.0/boost/math/constants, directory renamed /usr/src/debug/boost/1.
 87.0/boost/url/impl -> /usr/src/debug/boost/1.88.0/boost/url/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/utility/impl/chset -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/utility/impl/chset, directory renamed /usr/src/debug/boost/1.87.0/boost/test/output -> /usr/src/debug/boost/1.88.0/boost/test/output, directory renamed /usr/src/debug/boost/1.87.0/boost/iostreams/detail -> /usr/src/debug/boost/1.88.0/boost/iostreams/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/mpl -> /usr/src/debug/boost/1.88.0/boost/mpl, directory renamed /usr/src/debug/boost/1.87.0/libs/log/src/posix -> /usr/src/debug/boost/1.88.0/libs/log/src/posix, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/non_terminal/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/non_terminal/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/contract/detail/inlined/core -> /usr/src/debug/boost/1.88.0/boost/contract/detail/
 inlined/core, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/action -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi/action, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/support/char_set -> /usr/src/debug/boost/1.88.0/boost/spirit/home/support/char_set, directory renamed /usr/src/debug/boost/1.87.0/libs/log/src -> /usr/src/debug/boost/1.88.0/libs/log/src, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/traits -> /usr/src/debug/boost/1.88.0/boost/asio/traits, directory renamed /usr/src/debug/boost/1.87.0/boost/charconv/detail/fast_float -> /usr/src/debug/boost/1.88.0/boost/json/detail/charconv/detail/fast_float, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/execution/impl -> /usr/src/debug/boost/1.88.0/boost/asio/execution/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive/detail/core/matcher -> /usr/src/debug/boost/1.88.0/boost/xpressive/detail/core/matcher, directory renamed /usr/src/debug/boost/1.87.0/l
 ibs/math/src/tr1 -> /usr/src/debug/boost/1.88.0/libs/math/src/tr1, directory renamed /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/shared -> /usr/src/debug/boost/1.88.0/libs/locale/src/shared, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/support/iterators/detail -> /usr/src/debug/boost/1.88.0/boost/spirit/home/support/iterators/detail, directory renamed /usr/src/debug/boost/1.87.0/libs/random/src -> /usr/src/debug/boost/1.88.0/libs/random/src, directory renamed /usr/src/debug/boost/1.87.0/boost/filesystem/detail -> /usr/src/debug/boost/1.88.0/boost/filesystem/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/test/utils/runtime/cla -> /usr/src/debug/boost/1.88.0/boost/test/utils/runtime/cla, directory renamed /usr/src/debug/boost/1.87.0/libs/coroutine/src/posix -> /usr/src/debug/boost/1.88.0/libs/context/src/posix, directory renamed /usr/src/debug/boost/1.87.0/boost/charconv/detail -> /usr/src/debug/boost/1.88.0/boost/charconv/detail, directory
  renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/dynamic -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/dynamic, directory renamed /usr/src/debug/boost/1.87.0/boost/url/grammar/impl -> /usr/src/debug/boost/1.88.0/boost/url/grammar/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/random/detail -> /usr/src/debug/boost/1.88.0/boost/random/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/system/detail -> /usr/src/debug/boost/1.88.0/boost/system/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/thread/detail -> /usr/src/debug/boost/1.88.0/boost/thread/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/atomic/detail -> /usr/src/debug/boost/1.88.0/boost/atomic/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/chrono/detail -> /usr/src/debug/boost/1.88.0/boost/chrono/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/config/detail -> /usr/src/debug/boost/1.88.0/boost/config/detail, directory renamed /usr/src/d
 ebug/boost/1.87.0/boost/endian/detail -> /usr/src/debug/boost/1.88.0/boost/endian/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/locale/detail -> /usr/src/debug/boost/1.88.0/boost/locale/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/python/detail -> /usr/src/debug/boost/1.88.0/boost/python/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/describe/detail -> /usr/src/debug/boost/1.88.0/boost/describe/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/thread/csbl/memory -> /usr/src/debug/boost/1.88.0/boost/thread/csbl/memory, directory renamed /usr/src/debug/boost/1.87.0/boost/parameter/aux_ -> /usr/src/debug/boost/1.88.0/boost/parameter/aux_, directory renamed /usr/src/debug/boost/1.87.0/boost/numeric/conversion -> /usr/src/debug/boost/1.88.0/boost/numeric/conversion, directory renamed /usr/src/debug/boost/1.87.0/boost/contract/detail/inlined/detail -> /usr/src/debug/boost/1.88.0/boost/contract/detail/inlined/detail, directory renamed /us
 r/src/debug/boost/1.87.0/libs/fiber/src -> /usr/src/debug/boost/1.88.0/libs/fiber/src, directory renamed /usr/src/debug/boost/1.87.0/boost/multi_index/detail -> /usr/src/debug/boost/1.88.0/boost/multi_index/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/detail/impl -> /usr/src/debug/boost/1.88.0/boost/asio/detail/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/impl -> /usr/src/debug/boost/1.88.0/boost/json/detail/impl, directory renamed /usr/src/debug/boost/1.87.0/libs/fiber/src/algo -> /usr/src/debug/boost/1.88.0/libs/fiber/src/algo, directory renamed /usr/src/debug/boost/1.87.0/boost/lexical_cast/detail -> /usr/src/debug/boost/1.88.0/boost/lexical_cast/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core, directory renamed /usr/src
 /debug/boost/1.87.0/boost/asio/impl -> /usr/src/debug/boost/1.88.0/boost/asio/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/json/impl -> /usr/src/debug/boost/1.88.0/boost/json/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/test/impl -> /usr/src/debug/boost/1.88.0/boost/test/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/mpl/list/aux_ -> /usr/src/debug/boost/1.88.0/boost/mpl/list/aux_, directory renamed /usr/src/debug/boost/1.87.0/boost/log/utility/functional -> /usr/src/debug/boost/1.88.0/boost/log/utility/functional, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/utility -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/utility, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/scope/detail -> /usr/src/debug/boost/1.88.0/boost/phoenix/scope, directory renamed /usr/src/debug/boost/1.87.0/boost/serialization -> /usr/src/debug/boost/1.88.0/boost/serialization, directory renamed /usr/src/debug/boost/1.87.0/libs
 /url/src/grammar/detail -> /usr/src/debug/boost/1.88.0/libs/url/src/grammar/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/karma/detail -> /usr/src/debug/boost/1.88.0/boost/spirit/home/karma/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/algorithm/iteration -> /usr/src/debug/boost/1.88.0/boost/fusion/algorithm/iteration/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/log/keywords -> /usr/src/debug/boost/1.88.0/boost/log/keywords, directory renamed /usr/src/debug/boost/1.87.0/libs/container/src -> /usr/src/debug/boost/1.88.0/libs/container/src, directory renamed /usr/src/debug/boost/1.87.0/boost/wave/util -> /usr/src/debug/boost/1.88.0/boost/wave/util, directory renamed /usr/src/debug/boost/1.87.0/boost/container_hash/detail -> /usr/src/debug/boost/1.88.0/boost/container_hash/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/composite/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/class
 ic/core/composite/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/math/tools -> /usr/src/debug/boost/1.88.0/boost/math/tools, directory renamed /usr/src/debug/boost/1.87.0/boost/test/tools -> /usr/src/debug/boost/1.88.0/boost/test/tools, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/dynamic/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/dynamic/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/mpl/vector/aux_/preprocessed/typeof_based -> /usr/src/debug/boost/1.88.0/boost/mpl/vector/aux_/preprocessed/typeof_based, directory renamed /usr/src/debug/boost/1.87.0/libs/filesystem/src -> /usr/src/debug/boost/1.88.0/libs/filesystem/src, directory renamed /usr/src/debug/boost/1.87.0/boost/test/utils -> /usr/src/debug/boost/1.88.0/boost/test/utils, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/attribute -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/attribute, directory renamed /usr/src/debug/boost/
 1.87.0/boost/json -> /usr/src/debug/boost/1.88.0/boost/json, directory renamed /usr/src/debug/boost/1.87.0/boost/url/rfc/impl -> /usr/src/debug/boost/1.88.0/boost/url/rfc/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/scope -> /usr/src/debug/boost/1.88.0/boost/scope, directory renamed /usr/src/debug/boost/1.87.0/boost/describe -> /usr/src/debug/boost/1.88.0/boost/describe, directory renamed /usr/src/debug/boost/1.87.0/boost/type_erasure -> /usr/src/debug/boost/1.88.0/boost/type_erasure, directory renamed /usr/src/debug/boost/1.87.0/boost/wave -> /usr/src/debug/boost/1.88.0/boost/wave, directory renamed /usr/src/debug/boost/1.87.0/boost/contract/detail/inlined -> /usr/src/debug/boost/1.88.0/boost/contract, directory renamed /usr/src/debug/boost/1.87.0/boost/date_time/posix_time -> /usr/src/debug/boost/1.88.0/boost/date_time/posix_time, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/ip/detail/impl -> /usr/src/debug/boost/1.88.0/boost/asio/ip/detail/impl, directory
  renamed /usr/src/debug/boost/1.87.0/boost/url/detail/impl -> /usr/src/debug/boost/1.88.0/boost/url/detail/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/proto -> /usr/src/debug/boost/1.88.0/boost/proto, directory renamed /usr/src/debug/boost/1.87.0/boost/graph -> /usr/src/debug/boost/1.88.0/boost/graph, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/execution -> /usr/src/debug/boost/1.88.0/boost/asio/execution, directory renamed /usr/src/debug/boost/1.87.0/boost/math/special_functions -> /usr/src/debug/boost/1.88.0/boost/math/special_functions, directory renamed /usr/src/debug/boost/1.87.0/boost/optional -> /usr/src/debug/boost/1.88.0/boost/optional, directory renamed /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/std -> /usr/src/debug/boost/1.88.0/libs/locale/src/std, directory renamed /usr/src/debug/boost/1.87.0/boost -> /usr/src/debug/boost/1.88.0/boost, directory renamed /usr/src/debug/boost/1.87.0/libs/url/src/grammar -> /usr/src/debug/boost/1.88
 .0/libs/url/src/grammar, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/scanner -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/scanner, directory renamed /usr/src/debug/boost/1.87.0/boost/iostreams -> /usr/src/debug/boost/1.88.0/boost/iostreams, directory renamed /usr/src/debug/boost/1.87.0/boost/locale/boundary -> /usr/src/debug/boost/1.88.0/boost/locale/boundary, directory renamed /usr/src/debug/boost/1.87.0/boost/io -> /usr/src/debug/boost/1.88.0/boost/io, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/adapted/struct/detail -> /usr/src/debug/boost/1.88.0/boost/fusion/adapted/struct/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive/detail -> /usr/src/debug/boost/1.88.0/boost/xpressive/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/coroutine/detail -> /usr/src/debug/boost/1.88.0/boost/coroutine/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/atomic/detail/type_traits -> /usr/src/de
 bug/boost/1.88.0/boost/atomic/detail/type_traits, directory renamed /usr/src/debug/boost/1.87.0/boost/intrusive/detail -> /usr/src/debug/boost/1.88.0/boost/intrusive/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/log/utility/type_dispatch -> /usr/src/debug/boost/1.88.0/boost/log/utility/type_dispatch, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/sequence/intrinsic -> /usr/src/debug/boost/1.88.0/boost/fusion/sequence/intrinsic, directory renamed /usr/src/debug/boost/1.87.0/libs/thread/src -> /usr/src/debug/boost/1.88.0/libs/thread/src, directory renamed /usr/src/debug/boost/1.87.0/boost/property_map -> /usr/src/debug/boost/1.88.0/boost/property_map, directory renamed /usr/src/debug/boost/1.87.0/libs/serialization/src -> /usr/src/debug/boost/1.88.0/libs/serialization/src, directory renamed /usr/src/debug/boost/1.87.0/boost/python -> /usr/src/debug/boost/1.88.0/boost/python, directory renamed /usr/src/debug/boost/1.87.0/boost/numeric/conversion/detail -> /usr
 /src/debug/boost/1.88.0/boost/numeric/conversion/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/asio -> /usr/src/debug/boost/1.88.0/boost/asio, directory renamed /usr/src/debug/boost/1.87.0/libs/context/src/posix -> /usr/src/debug/boost/1.88.0/libs/coroutine/src/posix, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/charconv -> /usr/src/debug/boost/1.88.0/boost/json/detail/charconv, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/scope -> /usr/src/debug/boost/1.88.0/boost/phoenix/scope/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/url -> /usr/src/debug/boost/1.88.0/boost/url, directory renamed /usr/src/debug/boost/1.87.0/libs/timer/src -> /usr/src/debug/boost/1.88.0/libs/timer/src, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/support/char_encoding -> /usr/src/debug/boost/1.88.0/boost/spirit/home/support/char_encoding, directory renamed /usr/src/debug/boost/1.87.0/boost/interprocess -> /usr/src/debug/boost/1.88
 .0/boost/interprocess, directory renamed /usr/src/debug/boost/1.87.0/boost/move -> /usr/src/debug/boost/1.88.0/boost/move, directory renamed /usr/src/debug/boost/1.87.0/boost/log -> /usr/src/debug/boost/1.88.0/boost/log, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/primitives/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/primitives/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/ip/detail -> /usr/src/debug/boost/1.88.0/boost/asio/ip/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/container -> /usr/src/debug/boost/1.88.0/boost/container, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/core -> /usr/src/debug/boost/1.88.0/boost/phoenix/core, directory renamed /usr/src/debug/boost/1.87.0/boost/type_erasure/detail -> /usr/src/debug/boost/1.88.0/boost/type_erasure/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/support/detail -> /usr/src/debug/boost/1.88.0/boost/spirit/home/
 support/detail, directory renamed /usr/src/debug/boost/1.87.0/libs/url/src/rfc/detail -> /usr/src/debug/boost/1.88.0/libs/url/src/rfc/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/wave/grammars -> /usr/src/debug/boost/1.88.0/boost/wave/grammars, directory renamed /usr/src/debug/boost/1.87.0/boost/function_types/detail -> /usr/src/debug/boost/1.88.0/boost/function_types/detail, directory renamed /usr/src/debug/boost/1.87.0/libs/wave/src/cpplexer/re2clex -> /usr/src/debug/boost/1.88.0/libs/wave/src/cpplexer/re2clex, directory renamed /usr/src/debug/boost/1.87.0/boost/io/detail -> /usr/src/debug/boost/1.88.0/boost/io/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/actor -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/actor, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/adapted/boost_tuple/detail -> /usr/src/debug/boost/1.88.0/boost/fusion/adapted/boost_tuple/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/t
 uple -> /usr/src/debug/boost/1.88.0/boost/tuple, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/meta -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/meta, directory renamed /usr/src/debug/boost/1.87.0/boost/property_tree/detail -> /usr/src/debug/boost/1.88.0/boost/property_tree/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/math/tools/detail -> /usr/src/debug/boost/1.88.0/boost/math/tools/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/test/tools/detail -> /usr/src/debug/boost/1.88.0/boost/test/tools/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive/detail/static/transforms -> /usr/src/debug/boost/1.88.0/boost/xpressive/detail/static/transforms, directory renamed /usr/src/debug/boost/1.87.0/boost/exception/detail -> /usr/src/debug/boost/1.88.0/boost/exception/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/mpl/vector/aux_ -> /usr/src/debug/boost/1.88.0/boost/mpl/vector/aux_, directory renamed 
 /usr/src/debug/boost/1.87.0/libs/type_erasure/src -> /usr/src/debug/boost/1.88.0/libs/type_erasure/src, directory renamed /usr/src/debug/boost/1.87.0/boost/bind -> /usr/src/debug/boost/1.88.0/boost/bind, directory renamed /usr/src/debug/boost/1.87.0/boost/charconv/detail/ryu -> /usr/src/debug/boost/1.88.0/boost/charconv/detail/ryu, directory renamed /usr/src/debug/boost/1.87.0/boost/date_time -> /usr/src/debug/boost/1.88.0/boost/date_time, directory renamed /usr/src/debug/boost/1.87.0/boost/test/utils/iterator -> /usr/src/debug/boost/1.88.0/boost/test/utils/iterator, directory renamed /usr/src/debug/boost/1.87.0/libs/atomic/src -> /usr/src/debug/boost/1.88.0/libs/atomic/src, directory renamed /usr/src/debug/boost/1.87.0/boost/contract/detail -> /usr/src/debug/boost/1.88.0/boost/contract/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/type_index -> /usr/src/debug/boost/1.88.0/boost/type_index, directory renamed /usr/src/debug/boost/1.87.0/boost/intrusive -> /usr/src/debug
 /boost/1.88.0/boost/intrusive, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive/detail/core -> /usr/src/debug/boost/1.88.0/boost/xpressive/detail/core, directory renamed /usr/src/debug/boost/1.87.0/boost/test/utils/runtime -> /usr/src/debug/boost/1.88.0/boost/test/utils/runtime, directory renamed /usr/src/debug/boost/1.87.0/boost/random -> /usr/src/debug/boost/1.88.0/boost/random, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive -> /usr/src/debug/boost/1.88.0/boost/xpressive, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/ip -> /usr/src/debug/boost/1.88.0/boost/asio/ip, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/core/detail -> /usr/src/debug/boost/1.88.0/boost/phoenix/core/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/integer -> /usr/src/debug/boost/1.88.0/boost/integer, directory renamed /usr/src/debug/boost/1.87.0/boost/context -> /usr/src/debug/boost/1.88.0/boost/context, directory renamed /usr/src/debug/boost/1.8
 7.0/boost/spirit/home/karma/numeric -> /usr/src/debug/boost/1.88.0/boost/spirit/home/karma/numeric, directory renamed /usr/src/debug/boost/1.87.0/boost/math -> /usr/src/debug/boost/1.88.0/boost/math, directory renamed /usr/src/debug/boost/1.87.0/boost/variant -> /usr/src/debug/boost/1.88.0/boost/variant, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/directive -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi/directive, directory renamed /usr/src/debug/boost/1.87.0/boost/lexical_cast -> /usr/src/debug/boost/1.88.0/boost/lexical_cast, directory renamed /usr/src/debug/boost/1.87.0/boost/url/rfc -> /usr/src/debug/boost/1.88.0/boost/url/rfc, directory renamed /usr/src/debug/boost/1.87.0/boost/archive -> /usr/src/debug/boost/1.88.0/boost/archive, directory renamed /usr/src/debug/boost/1.87.0/boost/iostreams/device -> /usr/src/debug/boost/1.88.0/boost/iostreams/device, directory renamed /usr/src/debug/boost/1.87.0/boost/pending -> /usr/src/debug/boost/1.88.0/boost/pe
 nding, directory renamed /usr/src/debug/boost/1.87.0/boost/log/support -> /usr/src/debug/boost/1.88.0/boost/log/support, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/iterator -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/iterator, directory renamed /usr/src/debug/boost/1.87.0/boost/test/tree -> /usr/src/debug/boost/1.88.0/boost/test/tree, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/support/iterators -> /usr/src/debug/boost/1.88.0/boost/spirit/home/support/iterators, directory renamed /usr/src/debug/boost/1.87.0/boost/log/utility/ipc -> /usr/src/debug/boost/1.88.0/boost/log/utility/ipc, directory renamed /usr/src/debug/boost/1.87.0/boost/program_options -> /usr/src/debug/boost/1.88.0/boost/program_options, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/composite -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/composite, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/algor
 ithm/query/detail -> /usr/src/debug/boost/1.88.0/boost/fusion/algorithm/query/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/system -> /usr/src/debug/boost/1.88.0/boost/system, directory renamed /usr/src/debug/boost/1.87.0/boost/date_time/local_time -> /usr/src/debug/boost/1.88.0/boost/date_time/local_time, directory renamed /usr/src/debug/boost/1.87.0/boost/thread -> /usr/src/debug/boost/1.88.0/boost/thread, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive/traits -> /usr/src/debug/boost/1.88.0/boost/xpressive/traits, directory renamed /usr/src/debug/boost/1.87.0/boost/locale/util -> /usr/src/debug/boost/1.88.0/boost/locale/util, directory renamed /usr/src/debug/boost/1.87.0/boost/test/utils/runtime/env -> /usr/src/debug/boost/1.88.0/boost/test/utils/runtime/env, directory renamed /usr/src/debug/boost/1.87.0/boost/preprocessor/iteration/detail/limits -> /usr/src/debug/boost/1.88.0/boost/preprocessor/iteration/detail/limits, directory renamed /usr/src/debug/
 boost/1.87.0/boost/test/utils/basic_cstring -> /usr/src/debug/boost/1.88.0/boost/test/utils/basic_cstring, directory renamed /usr/src/debug/boost/1.87.0/boost/container_hash -> /usr/src/debug/boost/1.88.0/boost/container_hash, directory renamed /usr/src/debug/boost/1.87.0/libs/coroutine/src -> /usr/src/debug/boost/1.88.0/libs/coroutine/src, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/support -> /usr/src/debug/boost/1.88.0/boost/spirit/home/support, directory renamed /usr/src/debug/boost/1.87.0/libs/thread/src/pthread -> /usr/src/debug/boost/1.88.0/libs/thread/src/pthread, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/archive/iterators -> /usr/src/debug/boost/1.88.0/boost/archive/iterators, directory renamed /usr/src/debug/boost/1.87.0/boost/container/pmr -> /usr/src/debug/boost/1.88.0/boost/container/pmr, dire
 ctory renamed /usr/src/debug/boost/1.87.0/libs/date_time/src/gregorian -> /usr/src/debug/boost/1.88.0/libs/date_time/src/gregorian, directory renamed /usr/src/debug/boost/1.87.0/boost/multi_index -> /usr/src/debug/boost/1.88.0/boost/multi_index, directory renamed /usr/src/debug/boost/1.87.0/boost/log/utility -> /usr/src/debug/boost/1.88.0/boost/log/utility, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/detail -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/function -> /usr/src/debug/boost/1.88.0/boost/function, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/algorithm/query -> /usr/src/debug/boost/1.88.0/boost/fusion/algorithm/query, directory renamed /usr/src/debug/boost/1.87.0/boost/regex/v5 -> /usr/src/debug/boost/1.88.0/boost/regex/v5, directory renamed /usr/src/debug/boost/1.87.0/boost/test/tools/old -> /usr/src/debug/boost/1.88.0/boost/test/tools/old, directory renamed /usr/src/debu
 g/boost/1.87.0/boost/program_options/detail -> /usr/src/debug/boost/1.88.0/boost/program_options/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/log/attributes -> /usr/src/debug/boost/1.88.0/boost/log/attributes, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/karma/numeric/detail -> /usr/src/debug/boost/1.88.0/boost/spirit/home/karma/numeric/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/primitives -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/primitives, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/support/nonterminal -> /usr/src/debug/boost/1.88.0/boost/spirit/home/support/nonterminal, directory renamed /usr/src/debug/boost/1.87.0/boost/url/rfc/detail -> /usr/src/debug/boost/1.88.0/boost/url/rfc/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/numeric/detail -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi/numeric/detail, directory renamed /usr/src/deb
 ug/boost/1.87.0/boost/math/policies -> /usr/src/debug/boost/1.88.0/boost/math/policies, directory renamed /usr/src/debug/boost/1.87.0/boost/property_tree -> /usr/src/debug/boost/1.88.0/boost/property_tree, directory renamed /usr/src/debug/boost/1.87.0/boost/concept/detail -> /usr/src/debug/boost/1.88.0/boost/concept/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/context/detail -> /usr/src/debug/boost/1.88.0/boost/context/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/variant/detail -> /usr/src/debug/boost/1.88.0/boost/variant/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/support -> /usr/src/debug/boost/1.88.0/boost/fusion/support, directory renamed /usr/src/debug/boost/1.87.0/boost/log/sources -> /usr/src/debug/boost/1.88.0/boost/log/sources, directory renamed /usr/src/debug/boost/1.87.0/libs/url/src/rfc -> /usr/src/debug/boost/1.88.0/libs/url/src/rfc, directory renamed /usr/src/debug/boost/1.87.0/libs/regex/src -> /usr/src/debug/boost/
 1.88.0/libs/regex/src, directory renamed /usr/src/debug/boost/1.87.0/boost/any -> /usr/src/debug/boost/1.88.0/boost/any, directory renamed /usr/src/debug/boost/1.87.0/libs/context/src -> /usr/src/debug/boost/1.88.0/libs/context/src, directory renamed /usr/src/debug/boost/1.87.0/libs/wave/src -> /usr/src/debug/boost/1.88.0/libs/wave/src, directory renamed /usr/src/debug/boost/1.87.0/boost/locale -> /usr/src/debug/boost/1.88.0/boost/locale, directory renamed /usr/src/debug/boost/1.87.0/boost/container/detail -> /usr/src/debug/boost/1.88.0/boost/container/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/archive/detail -> /usr/src/debug/boost/1.88.0/boost/archive/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/tree -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/tree, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/scanner/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/scanner/impl, dire
 ctory renamed /usr/src/debug/boost/1.87.0/libs/coroutine/src/detail -> /usr/src/debug/boost/1.88.0/libs/coroutine/src/detail, directory renamed /usr/src/debug/boost/1.87.0/libs/iostreams/src -> /usr/src/debug/boost/1.88.0/libs/iostreams/src, directory renamed /usr/src/debug/boost/1.87.0/boost/proto/transform -> /usr/src/debug/boost/1.88.0/boost/proto/transform, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/charconv/impl -> /usr/src/debug/boost/1.88.0/boost/json/detail/charconv/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/ryu -> /usr/src/debug/boost/1.88.0/boost/json/detail/ryu, directory renamed /usr/src/debug/boost/1.87.0/boost/algorithm/string/detail -> /usr/src/debug/boost/1.88.0/boost/algorithm/string/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/interprocess/detail -> /usr/src/debug/boost/1.88.0/boost/interprocess/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/wave/cpplexer -> /usr/src/debug/boost/1.88.0/boos
 t/wave/cpplexer, directory renamed /usr/src/debug/boost/1.87.0/libs/program_options/src -> /usr/src/debug/boost/1.88.0/libs/program_options/src, directory renamed /usr/src/debug/boost/1.87.0/boost/iostreams/filter -> /usr/src/debug/boost/1.88.0/boost/iostreams/filter, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/ip/impl -> /usr/src/debug/boost/1.88.0/boost/asio/ip/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/chrono/detail/inlined/posix -> /usr/src/debug/boost/1.88.0/boost/chrono/detail/inlined/posix, directory renamed /usr/src/debug/boost/1.87.0/boost/url/grammar/detail -> /usr/src/debug/boost/1.88.0/boost/url/grammar/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/sequence -> /usr/src/debug/boost/1.88.0/boost/fusion/sequence, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/charconv/detail -> /usr/src/debug/boost/1.88.0/boost/json/detail/charconv/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/karma 
 -> /usr/src/debug/boost/1.88.0/boost/spirit/home/karma, directory renamed /usr/src/debug/boost/1.87.0/boost/python/converter -> /usr/src/debug/boost/1.88.0/boost/python/converter, directory renamed /usr/src/debug/boost/1.87.0/boost/pool -> /usr/src/debug/boost/1.88.0/boost/pool, directory renamed /usr/src/debug/boost/1.87.0/boost/parameter -> /usr/src/debug/boost/1.88.0/boost/parameter, directory renamed /usr/src/debug/boost/1.87.0/boost/log/sinks -> /usr/src/debug/boost/1.88.0/boost/log/sinks, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/support/detail -> /usr/src/debug/boost/1.88.0/boost/fusion/support/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/utility/impl -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/utility/impl, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/phoenix -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/phoenix, directory renamed /usr/src/debug/boost/1.87.0/libs/system/src
  -> /usr/src/debug/boost/1.88.0/libs/system/src, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/operator -> /usr/src/debug/boost/1.88.0/boost/phoenix/operator, directory renamed /usr/src/debug/boost/1.87.0/boost/math/special_functions/detail -> /usr/src/debug/boost/1.88.0/boost/math/special_functions/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/log/core -> /usr/src/debug/boost/1.88.0/boost/log/core, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/charconv/detail/fast_float -> /usr/src/debug/boost/1.88.0/boost/charconv/detail/fast_float, directory renamed /usr/src/debug/boost/1.87.0/boost/function_types -> /usr/src/debug/boost/1.88.0/boost/function_types, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/container/set/detail -> /usr/src/debug/boost/1.88.0/boost/fusion/container/set/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/log/expressions/predicates -> /usr/src/debug/boost/1.88.0/boost/log/expressions/predicates, 
 directory renamed /usr/src/debug/boost/1.87.0/boost/detail -> /usr/src/debug/boost/1.88.0/boost/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/contract/core -> /usr/src/debug/boost/1.88.0/boost/contract/core, directory renamed /usr/src/debug/boost/1.87.0/boost/coroutine -> /usr/src/debug/boost/1.88.0/boost/coroutine, directory renamed /usr/src/debug/boost/1.87.0/boost/log/utility/manipulators -> /usr/src/debug/boost/1.88.0/boost/log/utility/manipulators, directory renamed /usr/src/debug/boost/1.87.0/libs/url/src/detail -> /usr/src/debug/boost/1.88.0/libs/url/src/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/classic/core/non_terminal -> /usr/src/debug/boost/1.88.0/boost/spirit/home/classic/core/non_terminal, directory renamed /usr/src/debug/boost/1.87.0/boost/proto/detail/preprocessed -> /usr/src/debug/boost/1.88.0/boost/proto/detail/preprocessed, directory renamed /usr/src/debug/boost/1.87.0/boost/fiber/algo -> /usr/src/debug/boost/1.88.0/boost
 /fiber/algo, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/container/vector/detail -> /usr/src/debug/boost/1.88.0/boost/fusion/container/vector/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/filesystem -> /usr/src/debug/boost/1.88.0/boost/filesystem, directory renamed /usr/src/debug/boost/1.87.0/boost/mpl/aux_ -> /usr/src/debug/boost/1.88.0/boost/mpl/aux_, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/nonterminal -> /usr/src/debug/boost/1.88.0/boost/spirit/home/qi/nonterminal, directory renamed /usr/src/debug/boost/1.87.0/boost/optional/detail -> /usr/src/debug/boost/1.88.0/boost/optional/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail/ryu/detail -> /usr/src/debug/boost/1.88.0/boost/json/detail/ryu/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/log/expressions -> /usr/src/debug/boost/1.88.0/boost/log/expressions, directory renamed /usr/src/debug/boost/1.87.0/boost/smart_ptr -> /usr/src/debug/boost/1.
 88.0/boost/smart_ptr, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/support/preprocessed -> /usr/src/debug/boost/1.88.0/boost/phoenix/support/preprocessed, directory renamed /usr/src/debug/boost/1.87.0/boost/phoenix/core/detail/cpp03/preprocessed -> /usr/src/debug/boost/1.88.0/boost/phoenix/core/detail/cpp03/preprocessed, directory renamed /usr/src/debug/boost/1.87.0/boost/utility/detail -> /usr/src/debug/boost/1.88.0/boost/utility/detail, directory renamed /usr/src/debug/boost/1.87.0/libs/exception/src -> /usr/src/debug/boost/1.88.0/libs/exception/src, directory renamed /usr/src/debug/boost/1.87.0/boost/asio/detail -> /usr/src/debug/boost/1.88.0/boost/asio/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/bind/detail -> /usr/src/debug/boost/1.88.0/boost/bind/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/core/detail -> /usr/src/debug/boost/1.88.0/boost/core/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/json/detail -> /usr/src/debug
 /boost/1.88.0/boost/json/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/move/detail -> /usr/src/debug/boost/1.88.0/boost/move/detail, directory renamed /usr/src/debug/boost/1.87.0/libs/charconv/src -> /usr/src/debug/boost/1.88.0/libs/charconv/src, directory renamed /usr/src/debug/boost/1.87.0/boost/mp11/detail -> /usr/src/debug/boost/1.88.0/boost/mp11/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/pool/detail -> /usr/src/debug/boost/1.88.0/boost/pool/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/test/detail -> /usr/src/debug/boost/1.88.0/boost/test/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/any/detail -> /usr/src/debug/boost/1.88.0/boost/any/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/log/detail -> /usr/src/debug/boost/1.88.0/boost/log/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/url/detail -> /usr/src/debug/boost/1.88.0/boost/url/detail, directory renamed /usr/src/debug/boost/1.87.0/boost/timer 
 -> /usr/src/debug/boost/1.88.0/boost/timer, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive/detail/static -> /usr/src/debug/boost/1.88.0/boost/xpressive/detail/static, directory renamed /usr/src/debug/boost/1.87.0/boost/xpressive/detail/utility -> /usr/src/debug/boost/1.88.0/boost/xpressive/detail/utility, directory renamed /usr/src/debug/boost/1.87.0/libs/python/src/object -> /usr/src/debug/boost/1.88.0/libs/python/src/object, directory renamed /usr/src/debug/boost/1.87.0/boost/align -> /usr/src/debug/boost/1.88.0/boost/align, directory renamed /usr/src/debug/boost/1.87.0/libs/python/src -> /usr/src/debug/boost/1.88.0/libs/python/src, directory renamed /usr/src/debug/boost/1.87.0/libs/log/src/setup -> /usr/src/debug/boost/1.88.0/libs/log/src/setup, directory renamed /usr/src/debug/boost/1.87.0/boost/fusion/container/set -> /usr/src/debug/boost/1.88.0/boost/fusion/container/set, directory renamed /usr/src/debug/boost/1.87.0/boost/spirit/home/qi/string -> /usr/src/debug
 /boost/1.88.0/boost/spirit/home/qi/string, directory renamed /usr/src/debug/boost/1.87.0/boost/proto/transform/detail/preprocessed -> /usr/src/debug/boost/1.88.0/boost/proto/transform/detail/preprocessed, directory renamed /usr/src/debug/boost/1.87.0/boost/assert -> /usr/src/debug/boost/1.88.0/boost/assert, directory renamed /usr/src/debug/boost/1.87.0/boost/fiber -> /usr/src/debug/boost/1.88.0/boost/fiber, removed "/usr/src/debug/boost/1.87.0/boost/iterator/reverse_iterator.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/digit_chars.hpp /usr/src/debug/boost/1.87.0/boost/iterator/iterator_adaptor.hpp /usr/src/debug/boost/1.87.0/boost/iterator/interoperable.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/optional_rule.hpp /usr/src/debug/boost/1.87.0/libs/url/src/scheme.cpp /usr/src/debug/boost/1.87.0/boost/iterator/transform_iterator.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/codecvt.hpp /usr/src/debug/boost/1.87.0/boost/iterator/advance.hpp /usr/src/debug/b
 oost/1.87.0/libs/url/src/segments_encoded_base.cpp /usr/src/debug/boost/1.87.0/libs/url/src/segments_encoded_view.cpp /usr/src/debug/boost/1.87.0/boost/utility/in_place_factory.hpp /usr/src/debug/boost/1.87.0/libs/url/src/ipv4_address.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/string_view_base.hpp /usr/src/debug/boost/1.87.0/libs/url/src/ipv6_address.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/string_token.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_same.hpp /usr/src/debug/boost/1.87.0/boost/utility/string_view_fwd.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/make_std_unique.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/conversion.cpp /usr/src/debug/boost/1.87.0/libs/url/src/params_encoded_base.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/type_with_alignment.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/icu_backend.hpp /usr/src/debug/boost/1.87.0/libs/url/src/params_encoded_ref.cpp /usr/src/debug/b
 oost/1.87.0/libs/url/src/parse.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/gregorian.hpp /usr/src/debug/boost/1.87.0/boost/charconv/chars_format.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/integral_constant.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/numeric.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/icu_util.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/codecvt.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_noncopyable.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/type_traits.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/gregorian.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_abstract.hpp /usr/src/debug/boost/1.87.0/boost/iterator/distance.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/add_const.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/integral_promotion.hpp /usr/src/debug/boost/1.87.0/boost/utility/value_init.hpp /usr/src/debug/boost/1.87.0/li
 bs/url/src/static_url.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/numeric.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/collator.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/conditional.hpp /usr/src/debug/boost/1.87.0/boost/iterator/detail/enable_if.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_base_and_derived.hpp /usr/src/debug/boost/1.87.0/boost/mp11/algorithm.hpp /usr/src/debug/boost/1.87.0/boost/mp11/tuple.hpp /usr/src/debug/boost/1.87.0/libs/url/src/authority_view.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/vchars.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/alignment_of.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/iconv.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/encoding.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/encoding.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/cdata.hpp /usr/src/debug/boost/1.87.0/boost/iterator/iterator_f
 acade.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/info.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/ci_string.hpp /usr/src/debug/boost/1.87.0/boost/iterator/detail/facade_iterator_category.hpp /usr/src/debug/boost/1.87.0/boost/iterator/is_iterator.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/add_pointer.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/default_locale.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/make_unsigned.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/codecvt_converter.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/uconv.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/decay.hpp /usr/src/debug/boost/1.87.0/boost/mp11/integer_sequence.hpp /usr/src/debug/boost/1.87.0/libs/url/src/url_view.cpp /usr/src/debug/boost/1.87.0/libs/url/src/parse_query.cpp /usr/src/debug/boost/1.87.0/libs/url/src/pct_string_view.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/boundar
 y.cpp /usr/src/debug/boost/1.87.0/boost/mp11/integral.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/icu_backend.cpp /usr/src/debug/boost/1.87.0/libs/url/src/url_view_base.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_signed.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/charset.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/delim_rule.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/formatters_cache.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/formatters_cache.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/aligned_storage.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/unsigned_rule.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/locale_data.cpp /usr/src/debug/boost/1.87.0/libs/url/src/params_ref.cpp /usr/src/debug/boost/1.87.0/libs/url/src/decode_view.cpp /usr/src/debug/boost/1.87.0/libs/url/src/params_view.cpp /usr/src/debug/boost/1.87.0/libs/url/src/segments_encoded_ref.cpp /usr/src/debug/b
 oost/1.87.0/boost/url/grammar/hexdig_chars.hpp /usr/src/debug/boost/1.87.0/libs/url/src/error.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_array.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_const.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_pod.hpp /usr/src/debug/boost/1.87.0/boost/iterator/iterator_categories.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/error.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/remove_const.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/dec_octet_rule.hpp /usr/src/debug/boost/1.87.0/libs/url/src/segments_base.cpp /usr/src/debug/boost/1.87.0/libs/url/src/segments_view.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_arithmetic.hpp /usr/src/debug/boost/1.87.0/boost/iterator/iterator_concepts.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/alpha_chars.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/alnum_chars.hpp /usr/src/debug/boost/1.87.0/libs/url/src/segments_ref.cpp /usr/src/debug/boost/1.87.0/boost/type_trait
 s/remove_reference.hpp /usr/src/debug/boost/1.87.0/boost/type_traits/add_reference.hpp /usr/src/debug/boost/1.87.0/boost/mp11/list.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/lut_chars.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/formatter.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/formatter.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/util/timezone.hpp /usr/src/debug/boost/1.87.0/libs/url/src/url.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/is_convertible.hpp /usr/src/debug/boost/1.87.0/libs/url/src/params_encoded_view.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/date_time.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/range_rule.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/time_zone.cpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/time_zone.hpp /usr/src/debug/boost/1.87.0/libs/url/src/parse_path.cpp /usr/src/debug/boost/1.87.0/boost/type_traits/remove_cv.
 hpp /usr/src/debug/boost/1.87.0/boost/type_traits/add_rvalue_reference.hpp /usr/src/debug/boost/1.87.0/libs/locale/src/boost/locale/icu/all_generator.hpp /usr/src/debug/boost/1.87.0/libs/url/src/encoding_opts.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/tuple_rule.hpp /usr/src/debug/boost/1.87.0/boost/utility/string_view.hpp /usr/src/debug/boost/1.87.0/libs/url/src/url_base.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/literal_rule.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/token_rule.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/variant_rule.hpp /usr/src/debug/boost/1.87.0/libs/url/src/params_base.cpp /usr/src/debug/boost/1.87.0/boost/url/grammar/parse.hpp /usr/src/debug/boost/1.87.0/boost/utility/base_from_member.hpp /usr/src/debug/boost/1.87.0/boost/iterator/iterator_traits.hpp /usr/src/debug/boost/1.87.0/boost/url/grammar/all_chars.hpp", added "/usr/src/debug/boost/1.88.0/libs/url/src/authority_view.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/token_rule
 .hpp /usr/src/debug/boost/1.88.0/libs/url/src/decode_view.cpp /usr/src/debug/boost/1.88.0/libs/url/src/params_view.cpp /usr/src/debug/boost/1.88.0/libs/url/src/segments_ref.cpp /usr/src/debug/boost/1.88.0/boost/iterator/iterator_traits.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/iconv.hpp /usr/src/debug/boost/1.88.0/libs/url/src/segments_encoded_ref.cpp /usr/src/debug/boost/1.88.0/boost/charconv/chars_format.hpp /usr/src/debug/boost/1.88.0/libs/url/src/static_url.cpp /usr/src/debug/boost/1.88.0/boost/iterator/iterator_categories.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/encoding.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/literal_rule.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/info.cpp /usr/src/debug/boost/1.88.0/boost/type_traits/aligned_storage.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/variant_rule.hpp /usr/src/debug/boost/1.88.0/boost/iterator/iterator_facade.hpp /usr/src/debug/boost/1.88.0/libs/url/src/error.cpp /usr/src/debug/boost/1.
 88.0/boost/url/grammar/error.hpp /usr/src/debug/boost/1.88.0/boost/iterator/is_iterator.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/remove_const.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/charset.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/remove_reference.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/boundary.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/string_view_base.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/vchars.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/formatters_cache.hpp /usr/src/debug/boost/1.88.0/libs/url/src/params_base.cpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/time_zone.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/cdata.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/add_reference.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/formatters_cache.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/unsigned_rule.hpp /usr/src/debug/boost/1.88.0/boost/utility/value_init.hpp /usr/src/debug/boost/1.88.0/boos
 t/type_traits/is_same.hpp /usr/src/debug/boost/1.88.0/libs/url/src/params_ref.cpp /usr/src/debug/boost/1.88.0/boost/mp11/tuple.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/numeric.cpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/icu_util.hpp /usr/src/debug/boost/1.88.0/boost/charconv/to_chars.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/locale_data.cpp /usr/src/debug/boost/1.88.0/boost/iterator/iterator_adaptor.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/alnum_chars.hpp /usr/src/debug/boost/1.88.0/boost/iterator/transform_iterator.hpp /usr/src/debug/boost/1.88.0/boost/iterator/detail/type_traits/disjunction.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/add_const.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/codecvt_converter.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/alpha_chars.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/conditional.hpp /usr/src/debug/boost/1.88.0/boost/iterator/iterator_concepts.hpp /usr/src/debug/boost/1.88.0/boost/
 type_traits/is_array.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/is_const.hpp /usr/src/debug/boost/1.88.0/libs/url/src/parse_query.cpp /usr/src/debug/boost/1.88.0/libs/url/src/url_base.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/lut_chars.hpp /usr/src/debug/boost/1.88.0/libs/url/src/pct_string_view.cpp /usr/src/debug/boost/1.88.0/boost/mp11/utility.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/gregorian.cpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/icu_backend.cpp /usr/src/debug/boost/1.88.0/boost/mp11/integer_sequence.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/make_unsigned.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/codecvt.hpp /usr/src/debug/boost/1.88.0/libs/url/src/scheme.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/optional_rule.hpp /usr/src/debug/boost/1.88.0/libs/url/src/url_view.cpp /usr/src/debug/boost/1.88.0/boost/type_traits/integral_constant.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/formatter.hpp /usr/src/debug/boos
 t/1.88.0/libs/locale/src/icu/collator.cpp /usr/src/debug/boost/1.88.0/boost/iterator/distance.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/all_generator.hpp /usr/src/debug/boost/1.88.0/libs/url/src/url.cpp /usr/src/debug/boost/1.88.0/libs/url/src/parse.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/all_chars.hpp /usr/src/debug/boost/1.88.0/libs/url/src/params_encoded_ref.cpp /usr/src/debug/boost/1.88.0/boost/iterator/detail/type_traits/conjunction.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/ci_string.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/is_arithmetic.hpp /usr/src/debug/boost/1.88.0/libs/url/src/params_encoded_view.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/string_token.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/conversion.cpp /usr/src/debug/boost/1.88.0/boost/type_traits/decay.hpp /usr/src/debug/boost/1.88.0/libs/url/src/parse_path.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/digit_chars.hpp /usr/src/debug/boost/1.88.0/libs/url/src/s
 egments_encoded_base.cpp /usr/src/debug/boost/1.88.0/libs/url/src/segments_encoded_view.cpp /usr/src/debug/boost/1.88.0/boost/utility/base_from_member.hpp /usr/src/debug/boost/1.88.0/libs/url/src/ipv4_address.cpp /usr/src/debug/boost/1.88.0/libs/url/src/ipv6_address.cpp /usr/src/debug/boost/1.88.0/boost/mp11/list.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/add_pointer.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/default_locale.cpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/icu_backend.hpp /usr/src/debug/boost/1.88.0/boost/utility/in_place_factory.hpp /usr/src/debug/boost/1.88.0/boost/iterator/reverse_iterator.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/enable_if.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/encoding.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/numeric_conversion.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/codecvt.cpp /usr/src/debug/boost/1.88.0/libs/url/src/params_encoded_base.cpp /usr/src/debug/boost/1.88.0/boost/mp11
 /integral.hpp /usr/src/debug/boost/1.88.0/libs/url/src/segments_base.cpp /usr/src/debug/boost/1.88.0/libs/url/src/segments_view.cpp /usr/src/debug/boost/1.88.0/boost/type_traits/add_rvalue_reference.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/date_time.cpp /usr/src/debug/boost/1.88.0/boost/type_traits/alignment_of.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/is_abstract.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/tuple_rule.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/numeric.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/type_with_alignment.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/is_signed.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/is_base_and_derived.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/range_rule.hpp /usr/src/debug/boost/1.88.0/libs/url/src/url_view_base.cpp /usr/src/debug/boost/1.88.0/boost/url/grammar/delim_rule.hpp /usr/src/debug/boost/1.88.0/boost/iterator/advance.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/
 gregorian.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/remove_cv.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/dec_octet_rule.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/type_traits.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/uconv.hpp /usr/src/debug/boost/1.88.0/boost/url/grammar/hexdig_chars.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/make_std_unique.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/is_noncopyable.hpp /usr/src/debug/boost/1.88.0/boost/iterator/detail/facade_iterator_category.hpp /usr/src/debug/boost/1.88.0/libs/locale/src/icu/formatter.cpp /usr/src/debug/boost/1.88.0/libs/locale/src/util/timezone.hpp /usr/src/debug/boost/1.88.0/boost/mp11/algorithm.hpp /usr/src/debug/boost/1.88.0/boost/type_traits/integral_promotion.hpp /usr/src/debug/boost/1.88.0/boost/charconv/from_chars.hpp"
packages/core2-64-poky-linux/boost/boost-src: PKGSIZE changed from 20728243 to 20713440 (-0%)
packages/core2-64-poky-linux/boost/boost-staticdev: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-staticdev: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-staticdev: PKGSIZE changed from 229518388 to 229763160 (+0%)
packages/core2-64-poky-linux/boost/boost-system: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-system: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.87.0", added "/usr/lib/libboost_system.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-system: PKG changed from libboost-system1.87.0 to libboost-system1.88.0
packages/core2-64-poky-linux/boost/boost-test: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-test: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_prg_exec_monitor.so.1.87.0 /usr/lib/libboost_unit_test_framework.so.1.87.0", added "/usr/lib/libboost_prg_exec_monitor.so.1.88.0 /usr/lib/libboost_unit_test_framework.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-thread: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-thread: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.87.0", added "/usr/lib/libboost_thread.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.87.0 to libboost-thread1.88.0
packages/core2-64-poky-linux/boost/boost-timer: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-timer: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.87.0", added "/usr/lib/libboost_timer.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.87.0 to libboost-timer1.88.0
packages/core2-64-poky-linux/boost/boost-type-erasure: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-type-erasure: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.87.0", added "/usr/lib/libboost_type_erasure.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.87.0 to libboost-type-erasure1.88.0
packages/core2-64-poky-linux/boost/boost-url: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-url: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-url: FILELIST: removed "/usr/lib/libboost_url.so.1.87.0", added "/usr/lib/libboost_url.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-url: PKGSIZE changed from 375176 to 366984 (-2%)
packages/core2-64-poky-linux/boost/boost-url: PKG changed from libboost-url1.87.0 to libboost-url1.88.0
packages/core2-64-poky-linux/boost/boost-wave: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost-wave: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.87.0", added "/usr/lib/libboost_wave.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.87.0 to libboost-wave1.88.0
packages/core2-64-poky-linux/boost/boost: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost/boost: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost: PKGV changed from 1.87.0 [default] to 1.88.0 [default]
packages/core2-64-poky-linux/boost: PV changed from "1.87.0" to "1.88.0"
packages/core2-64-poky-linux/boost: SRC_URI changed from "https://archives.boost.io/release/1.87.0/source/boost_1_87_0.tar.bz2 file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch" to "https://archives.boost.io/release/1.88.0/source/boost_1_88_0.tar.bz2 file://boost-math-disable-pch-for-gcc.patch file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch file://0001-dont-setup-compiler-flags-m32-m64.patch"
Changes to packages/core2-64-poky-linux/boost (sysroot):
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.87.0 to libboost_atomic.so.1.88.0
  /usr/lib/libboost_charconv.so changed symlink target from libboost_charconv.so.1.87.0 to libboost_charconv.so.1.88.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.87.0 to libboost_chrono.so.1.88.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.87.0 to libboost_container.so.1.88.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.87.0 to libboost_context.so.1.88.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.87.0 to libboost_contract.so.1.88.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.87.0 to libboost_coroutine.so.1.88.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.87.0 to libboost_date_time.so.1.88.0
  /usr/lib/libboost_fiber.so changed symlink target from libboost_fiber.so.1.87.0 to libboost_fiber.so.1.88.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.87.0 to libboost_filesystem.so.1.88.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.87.0 to libboost_graph.so.1.88.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.87.0 to libboost_iostreams.so.1.88.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.87.0 to libboost_json.so.1.88.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.87.0 to libboost_locale.so.1.88.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.87.0 to libboost_log_setup.so.1.88.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.87.0 to libboost_log.so.1.88.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.87.0 to libboost_math_c99f.so.1.88.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.87.0 to libboost_math_c99l.so.1.88.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.87.0 to libboost_math_c99.so.1.88.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.87.0 to libboost_math_tr1f.so.1.88.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.87.0 to libboost_math_tr1l.so.1.88.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.87.0 to libboost_math_tr1.so.1.88.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.87.0 to libboost_prg_exec_monitor.so.1.88.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.87.0 to libboost_program_options.so.1.88.0
  /usr/lib/libboost_python313.so changed symlink target from libboost_python313.so.1.87.0 to libboost_python313.so.1.88.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.87.0 to libboost_random.so.1.88.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.87.0 to libboost_regex.so.1.88.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.87.0 to libboost_serialization.so.1.88.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.87.0 to libboost_system.so.1.88.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.87.0 to libboost_thread.so.1.88.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.87.0 to libboost_timer.so.1.88.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.87.0 to libboost_type_erasure.so.1.88.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.87.0 to libboost_unit_test_framework.so.1.88.0
  /usr/lib/libboost_url.so changed symlink target from libboost_url.so.1.87.0 to libboost_url.so.1.88.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.87.0 to libboost_wave.so.1.88.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.87.0 to libboost_wserialization.so.1.88.0
  /usr/lib/cmake/Boost-1.87.0 moved to /usr/lib/cmake/Boost-1.88.0
  /usr/lib/cmake/boost_atomic-1.87.0 moved to /usr/lib/cmake/boost_atomic-1.88.0
  /usr/lib/cmake/boost_charconv-1.87.0 moved to /usr/lib/cmake/boost_charconv-1.88.0
  /usr/lib/cmake/boost_chrono-1.87.0 moved to /usr/lib/cmake/boost_chrono-1.88.0
  /usr/lib/cmake/boost_container-1.87.0 moved to /usr/lib/cmake/boost_container-1.88.0
  /usr/lib/cmake/boost_context-1.87.0 moved to /usr/lib/cmake/boost_context-1.88.0
  /usr/lib/cmake/boost_contract-1.87.0 moved to /usr/lib/cmake/boost_contract-1.88.0
  /usr/lib/cmake/boost_coroutine-1.87.0 moved to /usr/lib/cmake/boost_coroutine-1.88.0
  /usr/lib/cmake/boost_date_time-1.87.0 moved to /usr/lib/cmake/boost_date_time-1.88.0
  /usr/lib/cmake/BoostDetectToolset-1.87.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.88.0.cmake
  /usr/lib/cmake/boost_exception-1.87.0 moved to /usr/lib/cmake/boost_exception-1.88.0
  /usr/lib/cmake/boost_fiber-1.87.0 moved to /usr/lib/cmake/boost_fiber-1.88.0
  /usr/lib/cmake/boost_filesystem-1.87.0 moved to /usr/lib/cmake/boost_filesystem-1.88.0
  /usr/lib/cmake/boost_graph-1.87.0 moved to /usr/lib/cmake/boost_graph-1.88.0
  /usr/lib/cmake/boost_headers-1.87.0 moved to /usr/lib/cmake/boost_headers-1.88.0
  /usr/lib/cmake/boost_iostreams-1.87.0 moved to /usr/lib/cmake/boost_iostreams-1.88.0
  /usr/lib/cmake/boost_json-1.87.0 moved to /usr/lib/cmake/boost_json-1.88.0
  /usr/lib/cmake/boost_locale-1.87.0 moved to /usr/lib/cmake/boost_locale-1.88.0
  /usr/lib/cmake/boost_log-1.87.0 moved to /usr/lib/cmake/boost_log-1.88.0
  /usr/lib/cmake/boost_log_setup-1.87.0 moved to /usr/lib/cmake/boost_log_setup-1.88.0
  /usr/lib/cmake/boost_math-1.87.0 moved to /usr/lib/cmake/boost_math-1.88.0
  /usr/lib/cmake/boost_math_c99-1.87.0 moved to /usr/lib/cmake/boost_math_c99-1.88.0
  /usr/lib/cmake/boost_math_c99f-1.87.0 moved to /usr/lib/cmake/boost_math_c99f-1.88.0
  /usr/lib/cmake/boost_math_c99l-1.87.0 moved to /usr/lib/cmake/boost_math_c99l-1.88.0
  /usr/lib/cmake/boost_math_tr1-1.87.0 moved to /usr/lib/cmake/boost_math_tr1-1.88.0
  /usr/lib/cmake/boost_math_tr1f-1.87.0 moved to /usr/lib/cmake/boost_math_tr1f-1.88.0
  /usr/lib/cmake/boost_math_tr1l-1.87.0 moved to /usr/lib/cmake/boost_math_tr1l-1.88.0
  /usr/lib/cmake/boost_numpy-1.87.0 moved to /usr/lib/cmake/boost_numpy-1.88.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.87.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.88.0
  /usr/lib/cmake/boost_program_options-1.87.0 moved to /usr/lib/cmake/boost_program_options-1.88.0
  /usr/lib/cmake/boost_python-1.87.0 moved to /usr/lib/cmake/boost_python-1.88.0
  /usr/lib/cmake/boost_random-1.87.0 moved to /usr/lib/cmake/boost_random-1.88.0
  /usr/lib/cmake/boost_regex-1.87.0 moved to /usr/lib/cmake/boost_regex-1.88.0
  /usr/lib/cmake/boost_serialization-1.87.0 moved to /usr/lib/cmake/boost_serialization-1.88.0
  /usr/lib/cmake/boost_system-1.87.0 moved to /usr/lib/cmake/boost_system-1.88.0
  /usr/lib/cmake/boost_test_exec_monitor-1.87.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.88.0
  /usr/lib/cmake/boost_thread-1.87.0 moved to /usr/lib/cmake/boost_thread-1.88.0
  /usr/lib/cmake/boost_timer-1.87.0 moved to /usr/lib/cmake/boost_timer-1.88.0
  /usr/lib/cmake/boost_type_erasure-1.87.0 moved to /usr/lib/cmake/boost_type_erasure-1.88.0
  /usr/lib/cmake/boost_unit_test_framework-1.87.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.88.0
  /usr/lib/cmake/boost_url-1.87.0 moved to /usr/lib/cmake/boost_url-1.88.0
  /usr/lib/cmake/boost_wave-1.87.0 moved to /usr/lib/cmake/boost_wave-1.88.0
  /usr/lib/cmake/boost_wserialization-1.87.0 moved to /usr/lib/cmake/boost_wserialization-1.88.0
  /usr/lib/libboost_atomic.so.1.87.0 moved to /usr/lib/libboost_atomic.so.1.88.0
  /usr/lib/libboost_charconv.so.1.87.0 moved to /usr/lib/libboost_charconv.so.1.88.0
  /usr/lib/libboost_chrono.so.1.87.0 moved to /usr/lib/libboost_chrono.so.1.88.0
  /usr/lib/libboost_container.so.1.87.0 moved to /usr/lib/libboost_container.so.1.88.0
  /usr/lib/libboost_context.so.1.87.0 moved to /usr/lib/libboost_context.so.1.88.0
  /usr/lib/libboost_contract.so.1.87.0 moved to /usr/lib/libboost_contract.so.1.88.0
  /usr/lib/libboost_coroutine.so.1.87.0 moved to /usr/lib/libboost_coroutine.so.1.88.0
  /usr/lib/libboost_date_time.so.1.87.0 moved to /usr/lib/libboost_date_time.so.1.88.0
  /usr/lib/libboost_fiber.so.1.87.0 moved to /usr/lib/libboost_fiber.so.1.88.0
  /usr/lib/libboost_filesystem.so.1.87.0 moved to /usr/lib/libboost_filesystem.so.1.88.0
  /usr/lib/libboost_graph.so.1.87.0 moved to /usr/lib/libboost_graph.so.1.88.0
  /usr/lib/libboost_iostreams.so.1.87.0 moved to /usr/lib/libboost_iostreams.so.1.88.0
  /usr/lib/libboost_json.so.1.87.0 moved to /usr/lib/libboost_json.so.1.88.0
  /usr/lib/libboost_locale.so.1.87.0 moved to /usr/lib/libboost_locale.so.1.88.0
  /usr/lib/libboost_log_setup.so.1.87.0 moved to /usr/lib/libboost_log_setup.so.1.88.0
  /usr/lib/libboost_log.so.1.87.0 moved to /usr/lib/libboost_log.so.1.88.0
  /usr/lib/libboost_math_c99f.so.1.87.0 moved to /usr/lib/libboost_math_c99f.so.1.88.0
  /usr/lib/libboost_math_c99l.so.1.87.0 moved to /usr/lib/libboost_math_c99l.so.1.88.0
  /usr/lib/libboost_math_c99.so.1.87.0 moved to /usr/lib/libboost_math_c99.so.1.88.0
  /usr/lib/libboost_math_tr1f.so.1.87.0 moved to /usr/lib/libboost_math_tr1f.so.1.88.0
  /usr/lib/libboost_math_tr1l.so.1.87.0 moved to /usr/lib/libboost_math_tr1l.so.1.88.0
  /usr/lib/libboost_math_tr1.so.1.87.0 moved to /usr/lib/libboost_math_tr1.so.1.88.0
  /usr/lib/libboost_prg_exec_monitor.so.1.87.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.88.0
  /usr/lib/libboost_program_options.so.1.87.0 moved to /usr/lib/libboost_program_options.so.1.88.0
  /usr/lib/libboost_python313.so.1.87.0 moved to /usr/lib/libboost_python313.so.1.88.0
  /usr/lib/libboost_random.so.1.87.0 moved to /usr/lib/libboost_random.so.1.88.0
  /usr/lib/libboost_regex.so.1.87.0 moved to /usr/lib/libboost_regex.so.1.88.0
  /usr/lib/libboost_serialization.so.1.87.0 moved to /usr/lib/libboost_serialization.so.1.88.0
  /usr/lib/libboost_system.so.1.87.0 moved to /usr/lib/libboost_system.so.1.88.0
  /usr/lib/libboost_thread.so.1.87.0 moved to /usr/lib/libboost_thread.so.1.88.0
  /usr/lib/libboost_timer.so.1.87.0 moved to /usr/lib/libboost_timer.so.1.88.0
  /usr/lib/libboost_type_erasure.so.1.87.0 moved to /usr/lib/libboost_type_erasure.so.1.88.0
  /usr/lib/libboost_unit_test_framework.so.1.87.0 moved to /usr/lib/libboost_unit_test_framework.so.1.88.0
  /usr/lib/libboost_url.so.1.87.0 moved to /usr/lib/libboost_url.so.1.88.0
  /usr/lib/libboost_wave.so.1.87.0 moved to /usr/lib/libboost_wave.so.1.88.0
  /usr/lib/libboost_wserialization.so.1.87.0 moved to /usr/lib/libboost_wserialization.so.1.88.0
  /usr/include/boost/core/detail/assert.hpp was added
  /usr/include/boost/geometry/algorithms/detail/overlay/debug_traverse.hpp was added
  /usr/include/boost/hash2 was added
  /usr/include/boost/hash2/detail was added
  /usr/include/boost/hash2/detail/bit_cast.hpp was added
  /usr/include/boost/hash2/detail/config.hpp was added
  /usr/include/boost/hash2/detail/has_tag_invoke.hpp was added
  /usr/include/boost/hash2/detail/is_constant_evaluated.hpp was added
  /usr/include/boost/hash2/detail/keccak.hpp was added
  /usr/include/boost/hash2/detail/memcmp.hpp was added
  /usr/include/boost/hash2/detail/memcpy.hpp was added
  /usr/include/boost/hash2/detail/memset.hpp was added
  /usr/include/boost/hash2/detail/read.hpp was added
  /usr/include/boost/hash2/detail/rot.hpp was added
  /usr/include/boost/hash2/detail/write.hpp was added
  /usr/include/boost/hash2/digest.hpp was added
  /usr/include/boost/hash2/endian.hpp was added
  /usr/include/boost/hash2/flavor.hpp was added
  /usr/include/boost/hash2/fnv1a.hpp was added
  /usr/include/boost/hash2/get_integral_result.hpp was added
  /usr/include/boost/hash2/has_constant_size.hpp was added
  /usr/include/boost/hash2/hash_append_fwd.hpp was added
  /usr/include/boost/hash2/hash_append.hpp was added
  /usr/include/boost/hash2/hmac.hpp was added
  /usr/include/boost/hash2/is_contiguously_hashable.hpp was added
  /usr/include/boost/hash2/is_endian_independent.hpp was added
  /usr/include/boost/hash2/is_trivially_equality_comparable.hpp was added
  /usr/include/boost/hash2/legacy was added
  /usr/include/boost/hash2/legacy/murmur3.hpp was added
  /usr/include/boost/hash2/legacy/spooky2.hpp was added
  /usr/include/boost/hash2/md5.hpp was added
  /usr/include/boost/hash2/ripemd.hpp was added
  /usr/include/boost/hash2/sha1.hpp was added
  /usr/include/boost/hash2/sha2.hpp was added
  /usr/include/boost/hash2/sha3.hpp was added
  /usr/include/boost/hash2/siphash.hpp was added
  /usr/include/boost/hash2/xxhash.hpp was added
  /usr/include/boost/iterator/detail/eval_if_default.hpp was added
  /usr/include/boost/iterator/detail/if_default.hpp was added
  /usr/include/boost/iterator/detail/type_traits was added
  /usr/include/boost/iterator/detail/type_traits/conjunction.hpp was added
  /usr/include/boost/iterator/detail/type_traits/disjunction.hpp was added
  /usr/include/boost/iterator/detail/type_traits/negation.hpp was added
  /usr/include/boost/iterator/detail/type_traits/type_identity.hpp was added
  /usr/include/boost/iterator/enable_if_convertible.hpp was added
  /usr/include/boost/iterator/generator_iterator.hpp was added
  /usr/include/boost/iterator/min_category.hpp was added
  /usr/include/boost/iterator/shared_container_iterator.hpp was added
  /usr/include/boost/lockfree/spsc_value.hpp was added
  /usr/include/boost/mqtt5 was added
  /usr/include/boost/mqtt5/detail was added
  /usr/include/boost/mqtt5/detail/any_authenticator.hpp was added
  /usr/include/boost/mqtt5/detail/async_mutex.hpp was added
  /usr/include/boost/mqtt5/detail/async_traits.hpp was added
  /usr/include/boost/mqtt5/detail/cancellable_handler.hpp was added
  /usr/include/boost/mqtt5/detail/channel_traits.hpp was added
  /usr/include/boost/mqtt5/detail/control_packet.hpp was added
  /usr/include/boost/mqtt5/detail/internal_types.hpp was added
  /usr/include/boost/mqtt5/detail/log_invoke.hpp was added
  /usr/include/boost/mqtt5/detail/rebind_executor.hpp was added
  /usr/include/boost/mqtt5/detail/shutdown.hpp was added
  /usr/include/boost/mqtt5/detail/topic_validation.hpp was added
  /usr/include/boost/mqtt5/detail/traits.hpp was added
  /usr/include/boost/mqtt5/detail/utf8_mqtt.hpp was added
  /usr/include/boost/mqtt5/error.hpp was added
  /usr/include/boost/mqtt5.hpp was added
  /usr/include/boost/mqtt5/impl was added
  /usr/include/boost/mqtt5/impl/assemble_op.hpp was added
  /usr/include/boost/mqtt5/impl/async_sender.hpp was added
  /usr/include/boost/mqtt5/impl/autoconnect_stream.hpp was added
  /usr/include/boost/mqtt5/impl/client_service.hpp was added
  /usr/include/boost/mqtt5/impl/codecs was added
  /usr/include/boost/mqtt5/impl/codecs/base_decoders.hpp was added
  /usr/include/boost/mqtt5/impl/codecs/base_encoders.hpp was added
  /usr/include/boost/mqtt5/impl/codecs/message_decoders.hpp was added
  /usr/include/boost/mqtt5/impl/codecs/message_encoders.hpp was added
  /usr/include/boost/mqtt5/impl/connect_op.hpp was added
  /usr/include/boost/mqtt5/impl/disconnect_op.hpp was added
  /usr/include/boost/mqtt5/impl/endpoints.hpp was added
  /usr/include/boost/mqtt5/impl/ping_op.hpp was added
  /usr/include/boost/mqtt5/impl/publish_rec_op.hpp was added
  /usr/include/boost/mqtt5/impl/publish_send_op.hpp was added
  /usr/include/boost/mqtt5/impl/read_message_op.hpp was added
  /usr/include/boost/mqtt5/impl/read_op.hpp was added
  /usr/include/boost/mqtt5/impl/re_auth_op.hpp was added
  /usr/include/boost/mqtt5/impl/reconnect_op.hpp was added
  /usr/include/boost/mqtt5/impl/replies.hpp was added
  /usr/include/boost/mqtt5/impl/run_op.hpp was added
  /usr/include/boost/mqtt5/impl/sentry_op.hpp was added
  /usr/include/boost/mqtt5/impl/shutdown_op.hpp was added
  /usr/include/boost/mqtt5/impl/subscribe_op.hpp was added
  /usr/include/boost/mqtt5/impl/unsubscribe_op.hpp was added
  /usr/include/boost/mqtt5/impl/write_op.hpp was added
  /usr/include/boost/mqtt5/logger.hpp was added
  /usr/include/boost/mqtt5/logger_traits.hpp was added
  /usr/include/boost/mqtt5/mqtt_client.hpp was added
  /usr/include/boost/mqtt5/property_types.hpp was added
  /usr/include/boost/mqtt5/reason_codes.hpp was added
  /usr/include/boost/mqtt5/ssl.hpp was added
  /usr/include/boost/mqtt5/types.hpp was added
  /usr/include/boost/mqtt5/websocket.hpp was added
  /usr/include/boost/mqtt5/websocket_ssl.hpp was added
  /usr/include/boost/poly_collection/detail/begin_no_sanitize.hpp was added
  /usr/include/boost/poly_collection/detail/copyable.hpp was added
  /usr/include/boost/poly_collection/detail/end_no_sanitize.hpp was added
  /usr/include/boost/poly_collection/detail/fixed_variant.hpp was added
  /usr/include/boost/poly_collection/detail/fixed_variant_iterator.hpp was added
  /usr/include/boost/poly_collection/detail/is_closed_collection.hpp was added
  /usr/include/boost/poly_collection/detail/is_moveable.hpp was added
  /usr/include/boost/poly_collection/detail/segment_map.hpp was added
  /usr/include/boost/poly_collection/detail/size_t_map.hpp was added
  /usr/include/boost/poly_collection/detail/variant_model.hpp was added
  /usr/include/boost/poly_collection/variant_collection_fwd.hpp was added
  /usr/include/boost/poly_collection/variant_collection.hpp was added
  /usr/include/boost/process/bind_launcher.hpp was added
  /usr/include/boost/process/cstring_ref.hpp was added
  /usr/include/boost/process/default_launcher.hpp was added
  /usr/include/boost/process/execute.hpp was added
  /usr/include/boost/process/exit_code.hpp was added
  /usr/include/boost/process/ext was added
  /usr/include/boost/process/ext/cmd.hpp was added
  /usr/include/boost/process/ext/cwd.hpp was added
  /usr/include/boost/process/ext/env.hpp was added
  /usr/include/boost/process/ext/exe.hpp was added
  /usr/include/boost/process/ext.hpp was added
  /usr/include/boost/process/pid.hpp was added
  /usr/include/boost/process/popen.hpp was added
  /usr/include/boost/process/posix was added
  /usr/include/boost/process/posix/bind_fd.hpp was added
  /usr/include/boost/process/posix/default_launcher.hpp was added
  /usr/include/boost/process/posix/fork_and_forget_launcher.hpp was added
  /usr/include/boost/process/posix/pdfork_launcher.hpp was added
  /usr/include/boost/process/posix/vfork_launcher.hpp was added
  /usr/include/boost/process/process_handle.hpp was added
  /usr/include/boost/process/process.hpp was added
  /usr/include/boost/process/stdio.hpp was added
  /usr/include/boost/process/windows was added
  /usr/include/boost/process/windows/as_user_launcher.hpp was added
  /usr/include/boost/process/windows/creation_flags.hpp was added
  /usr/include/boost/process/windows/default_launcher.hpp was added
  /usr/include/boost/process/windows/show_window.hpp was added
  /usr/include/boost/process/windows/with_logon_launcher.hpp was added
  /usr/include/boost/process/windows/with_token_launcher.hpp was added
  /usr/include/boost/random/detail/size.hpp was added
  /usr/include/boost/random/detail/xoshiro_base.hpp was added
  /usr/include/boost/random/generalized_inverse_gaussian_distribution.hpp was added
  /usr/include/boost/random/inverse_gaussian_distribution.hpp was added
  /usr/include/boost/random/xoshiro.hpp was added
  /usr/include/boost/redis/adapter/any_adapter.hpp was added
  /usr/include/boost/redis/detail/resp3_handshaker.hpp was added
  /usr/include/boost/redis/impl/resp3_handshaker.ipp was added
  /usr/include/boost/spirit/home/x3/support/expectation.hpp was added
  /usr/include/boost/stacktrace/detail/addr_base_msvc.hpp was added
  /usr/include/boost/cobalt/detail/leaf.hpp was removed
  /usr/include/boost/cobalt/leaf.hpp was removed
  /usr/include/boost/iterator/detail/any_conversion_eater.hpp was removed
  /usr/include/boost/iterator/detail/enable_if.hpp was removed
  /usr/include/boost/iterator/detail/minimum_category.hpp was removed
  /usr/include/boost/process/args.hpp was removed
  /usr/include/boost/process/async.hpp was removed
  /usr/include/boost/process/async_pipe.hpp was removed
  /usr/include/boost/process/async_system.hpp was removed
  /usr/include/boost/process/child.hpp was removed
  /usr/include/boost/process/cmd.hpp was removed
  /usr/include/boost/process/env.hpp was removed
  /usr/include/boost/process/exception.hpp was removed
  /usr/include/boost/process/exe.hpp was removed
  /usr/include/boost/process/extend.hpp was removed
  /usr/include/boost/process/filesystem.hpp was removed
  /usr/include/boost/process/group.hpp was removed
  /usr/include/boost/process/handles.hpp was removed
  /usr/include/boost/process/io.hpp was removed
  /usr/include/boost/process/locale.hpp was removed
  /usr/include/boost/process/pipe.hpp was removed
  /usr/include/boost/process/posix.hpp was removed
  /usr/include/boost/process/search_path.hpp was removed
  /usr/include/boost/process/spawn.hpp was removed
  /usr/include/boost/process/system.hpp was removed
  /usr/include/boost/process/v1.hpp was removed
  /usr/include/boost/process/v2.hpp was removed
  /usr/include/boost/process/windows.hpp was removed
  /usr/include/boost/redis/detail/connection_base.hpp was removed
  /usr/include/boost/redis/detail/handshaker.hpp was removed
  /usr/include/boost/redis/impl/runner.ipp was removed

--===============6556068500887917992==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-upgrade-1.87.0-1.88.0.patch"

RnJvbSAxMzM0NmRmMWZjZjdiNzZjNjdhZjJjNzNkOWZhMTJhODIyY2NiY2JlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTI6MzM6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdDogdXBncmFkZSAxLjg3LjAgLT4gMS44OC4wCgotLS0KIC4uLi9ib29zdC97Ym9vc3QtMS44
Ny4wLmluYyA9PiBib29zdC0xLjg4LjAuaW5jfSAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLjEt
RG9uLXQtc2V0LXVwLWFyY2gtaW5zdHJ1Y3Rpb24tc2V0LWZsYWdzLXdlLWRvLXRoYXQtby5wYXRj
aCB8IDIgKy0KIC4uLi9ib29zdC9ib29zdC8wMDAxLWRvbnQtc2V0dXAtY29tcGlsZXItZmxhZ3Mt
bTMyLW02NC5wYXRjaCAgICB8IDIgKy0KIC4uLi9ib29zdC9ib29zdC9ib29zdC1tYXRoLWRpc2Fi
bGUtcGNoLWZvci1nY2MucGF0Y2ggICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2Jvb3N0L3tib29zdF8xLjg3LjAuYmIgPT4gYm9vc3RfMS44OC4wLmJifSB8IDAKIDUgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2Jvb3N0L3tib29zdC0xLjg3LjAuaW5jID0+IGJvb3N0LTEuODguMC5p
bmN9ICg5MCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3Qve2Jvb3N0XzEuODcu
MC5iYiA9PiBib29zdF8xLjg4LjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LTEuODcuMC5pbmMgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9i
b29zdC9ib29zdC0xLjg4LjAuaW5jCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LTEuODcuMC5pbmMKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LTEuODguMC5pbmMKaW5kZXggYzZlNTViMjM5ZS4u
OTE3ZjFhOTYwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3Qt
MS44Ny4wLmluYworKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjg4LjAu
aW5jCkBAIC0xMiw3ICsxMiw3IEBAIEJPT1NUX01BSiA9ICIke0AiXyIuam9pbihkLmdldFZhcigi
UFYiKS5zcGxpdCgiLiIpWzA6Ml0pfSIKIEJPT1NUX1AgPSAiYm9vc3RfJHtCT09TVF9WRVJ9Igog
CiBTUkNfVVJJID0gImh0dHBzOi8vYXJjaGl2ZXMuYm9vc3QuaW8vcmVsZWFzZS8ke1BWfS9zb3Vy
Y2UvJHtCT09TVF9QfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFmNTdiZTI1Y2I0
YzRmNGI0MTNlZDY5MmZlMzc4YWZmYjQzNTJlYTUwZmJlMjk0YTExZWY1NDhmNGQ1MjdkODkiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNDZkOWQyYzA2NjM3YjIxOTI3MDg3N2M5ZTE2MTU1Y2JkMDE1
YjZkYzg0MzQ5YWYwNjRjMDg4ZTliNWIxMmY3YiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0
dHA6Ly93d3cuYm9vc3Qub3JnL3VzZXJzL2Rvd25sb2FkLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gInJlbGVhc2UvKD9QPHB2ZXI+LiopL3NvdXJjZS8iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ib29zdC9ib29zdC8wMDAxLURvbi10LXNldC11cC1hcmNoLWluc3RydWN0aW9u
LXNldC1mbGFncy13ZS1kby10aGF0LW8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29z
dC9ib29zdC8wMDAxLURvbi10LXNldC11cC1hcmNoLWluc3RydWN0aW9uLXNldC1mbGFncy13ZS1k
by10aGF0LW8ucGF0Y2gKaW5kZXggMDRiZWRlNDU3OC4uZTE3NWJlNjQ4ZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QvMDAwMS1Eb24tdC1zZXQtdXAtYXJjaC1p
bnN0cnVjdGlvbi1zZXQtZmxhZ3Mtd2UtZG8tdGhhdC1vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LzAwMDEtRG9uLXQtc2V0LXVwLWFyY2gtaW5zdHJ1Y3Rpb24t
c2V0LWZsYWdzLXdlLWRvLXRoYXQtby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTJjYzI0
ZDZkOGI3YjI0YTZkMGEzMGM1MmM3YWQ2OWEwMDFhMGFkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNDJlODk1YzhiZmM2NGI0ZmJlYTEwMzhhNDIxODNlZjg5NmNiYmRkYSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogVHVlLCAxOCBEZWMgMjAxOCAxNTo0Mjo1NyArMDEwMAogU3ViamVj
dDogW1BBVENIXSBEb24ndCBzZXQgdXAgYXJjaC9pbnN0cnVjdGlvbi1zZXQgZmxhZ3MsIHdlIGRv
IHRoYXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LzAwMDEt
ZG9udC1zZXR1cC1jb21waWxlci1mbGFncy1tMzItbTY0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvYm9vc3QvYm9vc3QvMDAwMS1kb250LXNldHVwLWNvbXBpbGVyLWZsYWdzLW0zMi1tNjQu
cGF0Y2gKaW5kZXggZGIxZWUwMzg5OC4uYWIzOWUwY2Y0NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QvMDAwMS1kb250LXNldHVwLWNvbXBpbGVyLWZsYWdzLW0z
Mi1tNjQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QvMDAwMS1k
b250LXNldHVwLWNvbXBpbGVyLWZsYWdzLW0zMi1tNjQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGIwNzI4ODEyMjQxYzA0ODkwN2U2ZjFiYTE2ODI5MmNkOTk0ODM0N2QgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDkxMGE3YjE5MzAxZTc4ODUzNWM1OTFhMGZlMmFhZGQyNzgwMDU4
YzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbnVqIE1pdHRhbCA8YW51ai5taXR0
YWxAaW50ZWwuY29tPgogRGF0ZTogVGh1LCAxNCBOb3YgMjAxOSAxMDoxMzo1MyArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBkb250IHNldHVwIGNvbXBpbGVyIGZsYWdzIC1tMzIvLW02NApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QvYm9vc3QtbWF0aC1kaXNhYmxl
LXBjaC1mb3ItZ2NjLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QvYm9v
c3QtbWF0aC1kaXNhYmxlLXBjaC1mb3ItZ2NjLnBhdGNoCmluZGV4IGFkOTBkOTZkZGQuLjgyNzgy
Y2YxZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0L2Jvb3N0
LW1hdGgtZGlzYWJsZS1wY2gtZm9yLWdjYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9ib29zdC9ib29zdC9ib29zdC1tYXRoLWRpc2FibGUtcGNoLWZvci1nY2MucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGU3NDkxZjk4NzQ0MTFmZDk4NTU5NTc4MTJiYTliYWM5NDhhNjEzNTYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQzMzFmOGJlODExMzVjNDY0NzljYzE0MWFm
ZWIzMDQ0NDk5OGFhZGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKYWNraWUgSHVh
bmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAyMyBTZXAgMjAxNiAw
MTowNDo1MCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBib29zdC1tYXRoOiBkaXNhYmxlIHBjaCBm
b3IgZ2NjCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdF8xLjg3
LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdF8xLjg4LjAuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jv
b3N0XzEuODcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3Rf
MS44OC4wLmJiCi0tIAoyLjQ3LjEKCg==

--===============6556068500887917992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/boost/boost-atomic: FILELIST: removed "/usr/lib/libboost_atomic.so.1.87.0", added "/usr/lib/libboost_atomic.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-atomic: PKG changed from libboost-atomic1.87.0 to libboost-atomic1.88.0
packages/core2-64-poky-linux/boost/boost-charconv: FILELIST: removed "/usr/lib/libboost_charconv.so.1.87.0", added "/usr/lib/libboost_charconv.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-charconv: PKG changed from libboost-charconv1.87.0 to libboost-charconv1.88.0
packages/core2-64-poky-linux/boost/boost-chrono: FILELIST: removed "/usr/lib/libboost_chrono.so.1.87.0", added "/usr/lib/libboost_chrono.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-chrono: PKG changed from libboost-chrono1.87.0 to libboost-chrono1.88.0
packages/core2-64-poky-linux/boost/boost-container: FILELIST: removed "/usr/lib/libboost_container.so.1.87.0", added "/usr/lib/libboost_container.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-container: PKG changed from libboost-container1.87.0 to libboost-container1.88.0
packages/core2-64-poky-linux/boost/boost-context: FILELIST: removed "/usr/lib/libboost_context.so.1.87.0", added "/usr/lib/libboost_context.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-context: PKG changed from libboost-context1.87.0 to libboost-context1.88.0
packages/core2-64-poky-linux/boost/boost-contract: FILELIST: removed "/usr/lib/libboost_contract.so.1.87.0", added "/usr/lib/libboost_contract.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-contract: PKG changed from libboost-contract1.87.0 to libboost-contract1.88.0
packages/core2-64-poky-linux/boost/boost-coroutine: FILELIST: removed "/usr/lib/libboost_coroutine.so.1.87.0", added "/usr/lib/libboost_coroutine.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-coroutine: PKG changed from libboost-coroutine1.87.0 to libboost-coroutine1.88.0
packages/core2-64-poky-linux/boost/boost-date-time: FILELIST: removed "/usr/lib/libboost_date_time.so.1.87.0", added "/usr/lib/libboost_date_time.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-date-time: PKG changed from libboost-date-time1.87.0 to libboost-date-time1.88.0
packages/core2-64-poky-linux/boost/boost-dev: FILELIST: directory renamed /usr/lib/cmake/boost_log-1.87.0 -> /usr/lib/cmake/boost_log-1.88.0, directory renamed /usr/lib/cmake/boost_url-1.87.0 -> /usr/lib/cmake/boost_url-1.88.0, directory renamed /usr/lib/cmake/boost_date_time-1.87.0 -> /usr/lib/cmake/boost_date_time-1.88.0, directory renamed /usr/lib/cmake/boost_exception-1.87.0 -> /usr/lib/cmake/boost_exception-1.88.0, directory renamed /usr/lib/cmake/boost_random-1.87.0 -> /usr/lib/cmake/boost_random-1.88.0, directory renamed /usr/lib/cmake/boost_math-1.87.0 -> /usr/lib/cmake/boost_math-1.88.0, directory renamed /usr/lib/cmake/boost_log_setup-1.87.0 -> /usr/lib/cmake/boost_log_setup-1.88.0, directory renamed /usr/lib/cmake/boost_thread-1.87.0 -> /usr/lib/cmake/boost_thread-1.88.0, directory renamed /usr/lib/cmake/boost_numpy-1.87.0 -> /usr/lib/cmake/boost_numpy-1.88.0, directory renamed /usr/lib/cmake/boost_graph-1.87.0 -> /usr/lib/cmake/boost_graph-1.88.0, directory renamed /usr/l
 ib/cmake/boost_wserialization-1.87.0 -> /usr/lib/cmake/boost_wserialization-1.88.0, directory renamed /usr/lib/cmake/boost_locale-1.87.0 -> /usr/lib/cmake/boost_locale-1.88.0, directory renamed /usr/lib/cmake/boost_filesystem-1.87.0 -> /usr/lib/cmake/boost_filesystem-1.88.0, directory renamed /usr/lib/cmake/boost_wave-1.87.0 -> /usr/lib/cmake/boost_wave-1.88.0, directory renamed /usr/lib/cmake/boost_headers-1.87.0 -> /usr/lib/cmake/boost_headers-1.88.0, directory renamed /usr/lib/cmake/boost_chrono-1.87.0 -> /usr/lib/cmake/boost_chrono-1.88.0, directory renamed /usr/lib/cmake/boost_type_erasure-1.87.0 -> /usr/lib/cmake/boost_type_erasure-1.88.0, directory renamed /usr/lib/cmake/boost_json-1.87.0 -> /usr/lib/cmake/boost_json-1.88.0, directory renamed /usr/lib/cmake/boost_serialization-1.87.0 -> /usr/lib/cmake/boost_serialization-1.88.0, directory renamed /usr/lib/cmake/boost_context-1.87.0 -> /usr/lib/cmake/boost_context-1.88.0, directory renamed /usr/lib/cmake/boost_container-1.87.0
  -> /usr/lib/cmake/boost_container-1.88.0, directory renamed /usr/lib/cmake/boost_iostreams-1.87.0 -> /usr/lib/cmake/boost_iostreams-1.88.0, directory renamed /usr/lib/cmake/boost_python-1.87.0 -> /usr/lib/cmake/boost_python-1.88.0, directory renamed /usr/lib/cmake/boost_test_exec_monitor-1.87.0 -> /usr/lib/cmake/boost_test_exec_monitor-1.88.0, directory renamed /usr/lib/cmake/boost_coroutine-1.87.0 -> /usr/lib/cmake/boost_coroutine-1.88.0, directory renamed /usr/lib/cmake/boost_math_c99-1.87.0 -> /usr/lib/cmake/boost_math_c99-1.88.0, directory renamed /usr/lib/cmake/boost_math_tr1-1.87.0 -> /usr/lib/cmake/boost_math_tr1-1.88.0, directory renamed /usr/lib/cmake/boost_prg_exec_monitor-1.87.0 -> /usr/lib/cmake/boost_prg_exec_monitor-1.88.0, directory renamed /usr/lib/cmake/boost_unit_test_framework-1.87.0 -> /usr/lib/cmake/boost_unit_test_framework-1.88.0, directory renamed /usr/lib/cmake/boost_program_options-1.87.0 -> /usr/lib/cmake/boost_program_options-1.88.0, directory renamed /u
 sr/lib/cmake/Boost-1.87.0 -> /usr/lib/cmake/Boost-1.88.0, directory renamed /usr/lib/cmake/boost_system-1.87.0 -> /usr/lib/cmake/boost_system-1.88.0, directory renamed /usr/lib/cmake/boost_math_c99f-1.87.0 -> /usr/lib/cmake/boost_math_c99f-1.88.0, directory renamed /usr/lib/cmake/boost_math_c99l-1.87.0 -> /usr/lib/cmake/boost_math_c99l-1.88.0, directory renamed /usr/lib/cmake/boost_math_tr1f-1.87.0 -> /usr/lib/cmake/boost_math_tr1f-1.88.0, directory renamed /usr/lib/cmake/boost_math_tr1l-1.87.0 -> /usr/lib/cmake/boost_math_tr1l-1.88.0, directory renamed /usr/lib/cmake/boost_charconv-1.87.0 -> /usr/lib/cmake/boost_charconv-1.88.0, directory renamed /usr/lib/cmake/boost_fiber-1.87.0 -> /usr/lib/cmake/boost_fiber-1.88.0, directory renamed /usr/lib/cmake/boost_timer-1.87.0 -> /usr/lib/cmake/boost_timer-1.88.0, directory renamed /usr/lib/cmake/boost_regex-1.87.0 -> /usr/lib/cmake/boost_regex-1.88.0, directory renamed /usr/lib/cmake/boost_contract-1.87.0 -> /usr/lib/cmake/boost_contract-1
 .88.0, directory renamed /usr/lib/cmake/boost_atomic-1.87.0 -> /usr/lib/cmake/boost_atomic-1.88.0, removed "/usr/include/boost/process/search_path.hpp /usr/lib/cmake/BoostDetectToolset-1.87.0.cmake /usr/include/boost/process/args.hpp /usr/include/boost/process/pipe.hpp /usr/include/boost/process/handles.hpp /usr/include/boost/process/env.hpp /usr/include/boost/process/exe.hpp /usr/include/boost/process/cmd.hpp /usr/include/boost/process/exception.hpp /usr/include/boost/process/locale.hpp /usr/include/boost/process/windows.hpp /usr/include/boost/iterator/detail/any_conversion_eater.hpp /usr/include/boost/iterator/detail/minimum_category.hpp /usr/include/boost/process/async_pipe.hpp /usr/include/boost/process/system.hpp /usr/include/boost/redis/impl/runner.ipp /usr/include/boost/process/filesystem.hpp /usr/include/boost/redis/detail/connection_base.hpp /usr/include/boost/process/spawn.hpp /usr/include/boost/process/async.hpp /usr/include/boost/process/child.hpp /usr/include/boost/proc
 ess/group.hpp /usr/include/boost/process/posix.hpp /usr/include/boost/cobalt/leaf.hpp /usr/include/boost/process/io.hpp /usr/include/boost/process/v1.hpp /usr/include/boost/process/extend.hpp /usr/include/boost/process/v2.hpp /usr/include/boost/cobalt/detail/leaf.hpp /usr/include/boost/process/async_system.hpp /usr/include/boost/redis/detail/handshaker.hpp /usr/include/boost/iterator/detail/enable_if.hpp", added "/usr/include/boost/process/posix/vfork_launcher.hpp /usr/include/boost/hash2/is_endian_independent.hpp /usr/include/boost/iterator/detail/type_traits/negation.hpp /usr/include/boost/random/inverse_gaussian_distribution.hpp /usr/include/boost/mqtt5/impl/read_message_op.hpp /usr/include/boost/process/posix/pdfork_launcher.hpp /usr/include/boost/redis/adapter/any_adapter.hpp /usr/include/boost/mqtt5/detail/log_invoke.hpp /usr/include/boost/poly_collection/detail/copyable.hpp /usr/include/boost/mqtt5/detail/control_packet.hpp /usr/include/boost/hash2/sha1.hpp /usr/include/boost
 /hash2/sha2.hpp /usr/include/boost/hash2/sha3.hpp /usr/include/boost/process/bind_launcher.hpp /usr/include/boost/mqtt5/impl/subscribe_op.hpp /usr/include/boost/core/detail/assert.hpp /usr/include/boost/hash2/hash_append.hpp /usr/include/boost/mqtt5/impl/write_op.hpp /usr/include/boost/hash2/endian.hpp /usr/include/boost/process/process_handle.hpp /usr/include/boost/random/detail/xoshiro_base.hpp /usr/include/boost/process/windows/with_logon_launcher.hpp /usr/include/boost/process/cstring_ref.hpp /usr/include/boost/iterator/enable_if_convertible.hpp /usr/include/boost/mqtt5/impl/autoconnect_stream.hpp /usr/include/boost/poly_collection/detail/end_no_sanitize.hpp /usr/include/boost/hash2/legacy/spooky2.hpp /usr/include/boost/poly_collection/variant_collection.hpp /usr/include/boost/hash2/is_trivially_equality_comparable.hpp /usr/include/boost/mqtt5/detail/topic_validation.hpp /usr/include/boost/mqtt5/detail/utf8_mqtt.hpp /usr/include/boost/mqtt5/impl/codecs/base_decoders.hpp /usr/inc
 lude/boost/mqtt5/impl/codecs/base_encoders.hpp /usr/include/boost/mqtt5/error.hpp /usr/include/boost/process/ext.hpp /usr/include/boost/process/pid.hpp /usr/include/boost/mqtt5/impl/replies.hpp /usr/include/boost/iterator/shared_container_iterator.hpp /usr/include/boost/geometry/algorithms/detail/overlay/debug_traverse.hpp /usr/include/boost/mqtt5/impl/disconnect_op.hpp /usr/include/boost/poly_collection/detail/fixed_variant_iterator.hpp /usr/include/boost/mqtt5/impl/ping_op.hpp /usr/include/boost/process/ext/env.hpp /usr/include/boost/iterator/generator_iterator.hpp /usr/include/boost/mqtt5/impl/reconnect_op.hpp /usr/include/boost/hash2/detail/write.hpp /usr/include/boost/mqtt5/impl/run_op.hpp /usr/include/boost/process/ext/exe.hpp /usr/include/boost/poly_collection/detail/size_t_map.hpp /usr/include/boost/process/windows/creation_flags.hpp /usr/include/boost/random/xoshiro.hpp /usr/include/boost/process/posix/bind_fd.hpp /usr/include/boost/hash2/legacy/murmur3.hpp /usr/include/boo
 st/mqtt5/impl/shutdown_op.hpp /usr/include/boost/hash2/detail/memset.hpp /usr/include/boost/hash2/detail/memcmp.hpp /usr/include/boost/hash2/detail/memcpy.hpp /usr/include/boost/mqtt5.hpp /usr/include/boost/mqtt5/reason_codes.hpp /usr/include/boost/poly_collection/detail/is_moveable.hpp /usr/include/boost/iterator/min_category.hpp /usr/include/boost/mqtt5/impl/assemble_op.hpp /usr/include/boost/mqtt5/detail/channel_traits.hpp /usr/include/boost/mqtt5/property_types.hpp /usr/include/boost/mqtt5/impl/endpoints.hpp /usr/include/boost/mqtt5/impl/publish_rec_op.hpp /usr/include/boost/mqtt5/websocket_ssl.hpp /usr/include/boost/mqtt5/impl/sentry_op.hpp /usr/include/boost/mqtt5/mqtt_client.hpp /usr/include/boost/mqtt5/detail/cancellable_handler.hpp /usr/include/boost/process/execute.hpp /usr/include/boost/mqtt5/detail/async_traits.hpp /usr/lib/cmake/BoostDetectToolset-1.88.0.cmake /usr/include/boost/redis/detail/resp3_handshaker.hpp /usr/include/boost/mqtt5/detail/any_authenticator.hpp /usr
 /include/boost/hash2/detail/has_tag_invoke.hpp /usr/include/boost/poly_collection/detail/begin_no_sanitize.hpp /usr/include/boost/mqtt5/impl/codecs/message_decoders.hpp /usr/include/boost/mqtt5/impl/codecs/message_encoders.hpp /usr/include/boost/mqtt5/ssl.hpp /usr/include/boost/process/windows/show_window.hpp /usr/include/boost/hash2/hash_append_fwd.hpp /usr/include/boost/lockfree/spsc_value.hpp /usr/include/boost/hash2/hmac.hpp /usr/include/boost/hash2/md5.hpp /usr/include/boost/process/windows/default_launcher.hpp /usr/include/boost/hash2/detail/bit_cast.hpp /usr/include/boost/mqtt5/impl/connect_op.hpp /usr/include/boost/process/ext/cmd.hpp /usr/include/boost/hash2/siphash.hpp /usr/include/boost/hash2/ripemd.hpp /usr/include/boost/hash2/xxhash.hpp /usr/include/boost/hash2/flavor.hpp /usr/include/boost/mqtt5/impl/async_sender.hpp /usr/include/boost/mqtt5/logger.hpp /usr/include/boost/hash2/has_constant_size.hpp /usr/include/boost/random/generalized_inverse_gaussian_distribution.hpp
  /usr/include/boost/hash2/digest.hpp /usr/include/boost/poly_collection/detail/fixed_variant.hpp /usr/include/boost/mqtt5/detail/internal_types.hpp /usr/include/boost/iterator/detail/type_traits/conjunction.hpp /usr/include/boost/mqtt5/impl/unsubscribe_op.hpp /usr/include/boost/hash2/detail/is_constant_evaluated.hpp /usr/include/boost/iterator/detail/type_traits/type_identity.hpp /usr/include/boost/poly_collection/detail/segment_map.hpp /usr/include/boost/poly_collection/detail/variant_model.hpp /usr/include/boost/poly_collection/detail/is_closed_collection.hpp /usr/include/boost/process/posix/fork_and_forget_launcher.hpp /usr/include/boost/process/windows/as_user_launcher.hpp /usr/include/boost/hash2/detail/rot.hpp /usr/include/boost/mqtt5/impl/read_op.hpp /usr/include/boost/hash2/is_contiguously_hashable.hpp /usr/include/boost/mqtt5/detail/traits.hpp /usr/include/boost/mqtt5/logger_traits.hpp /usr/include/boost/process/default_launcher.hpp /usr/include/boost/hash2/detail/read.hpp 
 /usr/include/boost/hash2/detail/config.hpp /usr/include/boost/random/detail/size.hpp /usr/include/boost/process/ext/cwd.hpp /usr/include/boost/mqtt5/types.hpp /usr/include/boost/hash2/fnv1a.hpp /usr/include/boost/process/exit_code.hpp /usr/include/boost/iterator/detail/if_default.hpp /usr/include/boost/iterator/detail/type_traits/disjunction.hpp /usr/include/boost/stacktrace/detail/addr_base_msvc.hpp /usr/include/boost/spirit/home/x3/support/expectation.hpp /usr/include/boost/poly_collection/variant_collection_fwd.hpp /usr/include/boost/process/windows/with_token_launcher.hpp /usr/include/boost/iterator/detail/eval_if_default.hpp /usr/include/boost/mqtt5/detail/async_mutex.hpp /usr/include/boost/process/posix/default_launcher.hpp /usr/include/boost/mqtt5/detail/shutdown.hpp /usr/include/boost/mqtt5/websocket.hpp /usr/include/boost/mqtt5/impl/publish_send_op.hpp /usr/include/boost/mqtt5/impl/re_auth_op.hpp /usr/include/boost/process/process.hpp /usr/include/boost/process/popen.hpp /u
 sr/include/boost/process/stdio.hpp /usr/include/boost/mqtt5/impl/client_service.hpp /usr/include/boost/hash2/detail/keccak.hpp /usr/include/boost/redis/impl/resp3_handshaker.ipp /usr/include/boost/mqtt5/detail/rebind_executor.hpp /usr/include/boost/hash2/get_integral_result.hpp"
packages/core2-64-poky-linux/boost/boost-fiber: FILELIST: removed "/usr/lib/libboost_fiber.so.1.87.0", added "/usr/lib/libboost_fiber.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-fiber: PKG changed from libboost-fiber1.87.0 to libboost-fiber1.88.0
packages/core2-64-poky-linux/boost/boost-filesystem: FILELIST: removed "/usr/lib/libboost_filesystem.so.1.87.0", added "/usr/lib/libboost_filesystem.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-filesystem: PKG changed from libboost-filesystem1.87.0 to libboost-filesystem1.88.0
packages/core2-64-poky-linux/boost/boost-graph: FILELIST: removed "/usr/lib/libboost_graph.so.1.87.0", added "/usr/lib/libboost_graph.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-graph: PKG changed from libboost-graph1.87.0 to libboost-graph1.88.0
packages/core2-64-poky-linux/boost/boost-iostreams: FILELIST: removed "/usr/lib/libboost_iostreams.so.1.87.0", added "/usr/lib/libboost_iostreams.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-iostreams: PKG changed from libboost-iostreams1.87.0 to libboost-iostreams1.88.0
packages/core2-64-poky-linux/boost/boost-json: FILELIST: removed "/usr/lib/libboost_json.so.1.87.0", added "/usr/lib/libboost_json.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-json: PKG changed from libboost-json1.87.0 to libboost-json1.88.0
packages/core2-64-poky-linux/boost/boost-locale: FILELIST: removed "/usr/lib/libboost_locale.so.1.87.0", added "/usr/lib/libboost_locale.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-locale: PKG changed from libboost-locale1.87.0 to libboost-locale1.88.0
packages/core2-64-poky-linux/boost/boost-log: FILELIST: removed "/usr/lib/libboost_log_setup.so.1.87.0 /usr/lib/libboost_log.so.1.87.0", added "/usr/lib/libboost_log.so.1.88.0 /usr/lib/libboost_log_setup.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-math: FILELIST: removed "/usr/lib/libboost_math_tr1l.so.1.87.0 /usr/lib/libboost_math_tr1f.so.1.87.0 /usr/lib/libboost_math_c99f.so.1.87.0 /usr/lib/libboost_math_c99l.so.1.87.0 /usr/lib/libboost_math_c99.so.1.87.0 /usr/lib/libboost_math_tr1.so.1.87.0", added "/usr/lib/libboost_math_c99f.so.1.88.0 /usr/lib/libboost_math_c99.so.1.88.0 /usr/lib/libboost_math_tr1f.so.1.88.0 /usr/lib/libboost_math_tr1l.so.1.88.0 /usr/lib/libboost_math_tr1.so.1.88.0 /usr/lib/libboost_math_c99l.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-program-options: FILELIST: removed "/usr/lib/libboost_program_options.so.1.87.0", added "/usr/lib/libboost_program_options.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-program-options: PKG changed from libboost-program-options1.87.0 to libboost-program-options1.88.0
packages/core2-64-poky-linux/boost/boost-python: FILELIST: removed "/usr/lib/libboost_python313.so.1.87.0", added "/usr/lib/libboost_python313.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-python: PKG changed from libboost-python313-1.87.0 to libboost-python313-1.88.0
packages/core2-64-poky-linux/boost/boost-random: FILELIST: removed "/usr/lib/libboost_random.so.1.87.0", added "/usr/lib/libboost_random.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-random: PKG changed from libboost-random1.87.0 to libboost-random1.88.0
packages/core2-64-poky-linux/boost/boost-regex: FILELIST: removed "/usr/lib/libboost_regex.so.1.87.0", added "/usr/lib/libboost_regex.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-regex: PKG changed from libboost-regex1.87.0 to libboost-regex1.88.0
packages/core2-64-poky-linux/boost/boost-serialization: FILELIST: removed "/usr/lib/libboost_wserialization.so.1.87.0 /usr/lib/libboost_serialization.so.1.87.0", added "/usr/lib/libboost_wserialization.so.1.88.0 /usr/lib/libboost_serialization.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-system: FILELIST: removed "/usr/lib/libboost_system.so.1.87.0", added "/usr/lib/libboost_system.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-system: PKG changed from libboost-system1.87.0 to libboost-system1.88.0
packages/core2-64-poky-linux/boost/boost-test: FILELIST: removed "/usr/lib/libboost_unit_test_framework.so.1.87.0 /usr/lib/libboost_prg_exec_monitor.so.1.87.0", added "/usr/lib/libboost_prg_exec_monitor.so.1.88.0 /usr/lib/libboost_unit_test_framework.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-thread: FILELIST: removed "/usr/lib/libboost_thread.so.1.87.0", added "/usr/lib/libboost_thread.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-thread: PKG changed from libboost-thread1.87.0 to libboost-thread1.88.0
packages/core2-64-poky-linux/boost/boost-timer: FILELIST: removed "/usr/lib/libboost_timer.so.1.87.0", added "/usr/lib/libboost_timer.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-timer: PKG changed from libboost-timer1.87.0 to libboost-timer1.88.0
packages/core2-64-poky-linux/boost/boost-type-erasure: FILELIST: removed "/usr/lib/libboost_type_erasure.so.1.87.0", added "/usr/lib/libboost_type_erasure.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-type-erasure: PKG changed from libboost-type-erasure1.87.0 to libboost-type-erasure1.88.0
packages/core2-64-poky-linux/boost/boost-url: FILELIST: removed "/usr/lib/libboost_url.so.1.87.0", added "/usr/lib/libboost_url.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-url: PKG changed from libboost-url1.87.0 to libboost-url1.88.0
packages/core2-64-poky-linux/boost/boost-wave: FILELIST: removed "/usr/lib/libboost_wave.so.1.87.0", added "/usr/lib/libboost_wave.so.1.88.0"
packages/core2-64-poky-linux/boost/boost-wave: PKG changed from libboost-wave1.87.0 to libboost-wave1.88.0
Changes to packages/core2-64-poky-linux/boost (sysroot):
  /usr/lib/libboost_atomic.so changed symlink target from libboost_atomic.so.1.87.0 to libboost_atomic.so.1.88.0
  /usr/lib/libboost_charconv.so changed symlink target from libboost_charconv.so.1.87.0 to libboost_charconv.so.1.88.0
  /usr/lib/libboost_chrono.so changed symlink target from libboost_chrono.so.1.87.0 to libboost_chrono.so.1.88.0
  /usr/lib/libboost_container.so changed symlink target from libboost_container.so.1.87.0 to libboost_container.so.1.88.0
  /usr/lib/libboost_context.so changed symlink target from libboost_context.so.1.87.0 to libboost_context.so.1.88.0
  /usr/lib/libboost_contract.so changed symlink target from libboost_contract.so.1.87.0 to libboost_contract.so.1.88.0
  /usr/lib/libboost_coroutine.so changed symlink target from libboost_coroutine.so.1.87.0 to libboost_coroutine.so.1.88.0
  /usr/lib/libboost_date_time.so changed symlink target from libboost_date_time.so.1.87.0 to libboost_date_time.so.1.88.0
  /usr/lib/libboost_fiber.so changed symlink target from libboost_fiber.so.1.87.0 to libboost_fiber.so.1.88.0
  /usr/lib/libboost_filesystem.so changed symlink target from libboost_filesystem.so.1.87.0 to libboost_filesystem.so.1.88.0
  /usr/lib/libboost_graph.so changed symlink target from libboost_graph.so.1.87.0 to libboost_graph.so.1.88.0
  /usr/lib/libboost_iostreams.so changed symlink target from libboost_iostreams.so.1.87.0 to libboost_iostreams.so.1.88.0
  /usr/lib/libboost_json.so changed symlink target from libboost_json.so.1.87.0 to libboost_json.so.1.88.0
  /usr/lib/libboost_locale.so changed symlink target from libboost_locale.so.1.87.0 to libboost_locale.so.1.88.0
  /usr/lib/libboost_log_setup.so changed symlink target from libboost_log_setup.so.1.87.0 to libboost_log_setup.so.1.88.0
  /usr/lib/libboost_log.so changed symlink target from libboost_log.so.1.87.0 to libboost_log.so.1.88.0
  /usr/lib/libboost_math_c99f.so changed symlink target from libboost_math_c99f.so.1.87.0 to libboost_math_c99f.so.1.88.0
  /usr/lib/libboost_math_c99l.so changed symlink target from libboost_math_c99l.so.1.87.0 to libboost_math_c99l.so.1.88.0
  /usr/lib/libboost_math_c99.so changed symlink target from libboost_math_c99.so.1.87.0 to libboost_math_c99.so.1.88.0
  /usr/lib/libboost_math_tr1f.so changed symlink target from libboost_math_tr1f.so.1.87.0 to libboost_math_tr1f.so.1.88.0
  /usr/lib/libboost_math_tr1l.so changed symlink target from libboost_math_tr1l.so.1.87.0 to libboost_math_tr1l.so.1.88.0
  /usr/lib/libboost_math_tr1.so changed symlink target from libboost_math_tr1.so.1.87.0 to libboost_math_tr1.so.1.88.0
  /usr/lib/libboost_prg_exec_monitor.so changed symlink target from libboost_prg_exec_monitor.so.1.87.0 to libboost_prg_exec_monitor.so.1.88.0
  /usr/lib/libboost_program_options.so changed symlink target from libboost_program_options.so.1.87.0 to libboost_program_options.so.1.88.0
  /usr/lib/libboost_python313.so changed symlink target from libboost_python313.so.1.87.0 to libboost_python313.so.1.88.0
  /usr/lib/libboost_random.so changed symlink target from libboost_random.so.1.87.0 to libboost_random.so.1.88.0
  /usr/lib/libboost_regex.so changed symlink target from libboost_regex.so.1.87.0 to libboost_regex.so.1.88.0
  /usr/lib/libboost_serialization.so changed symlink target from libboost_serialization.so.1.87.0 to libboost_serialization.so.1.88.0
  /usr/lib/libboost_system.so changed symlink target from libboost_system.so.1.87.0 to libboost_system.so.1.88.0
  /usr/lib/libboost_thread.so changed symlink target from libboost_thread.so.1.87.0 to libboost_thread.so.1.88.0
  /usr/lib/libboost_timer.so changed symlink target from libboost_timer.so.1.87.0 to libboost_timer.so.1.88.0
  /usr/lib/libboost_type_erasure.so changed symlink target from libboost_type_erasure.so.1.87.0 to libboost_type_erasure.so.1.88.0
  /usr/lib/libboost_unit_test_framework.so changed symlink target from libboost_unit_test_framework.so.1.87.0 to libboost_unit_test_framework.so.1.88.0
  /usr/lib/libboost_url.so changed symlink target from libboost_url.so.1.87.0 to libboost_url.so.1.88.0
  /usr/lib/libboost_wave.so changed symlink target from libboost_wave.so.1.87.0 to libboost_wave.so.1.88.0
  /usr/lib/libboost_wserialization.so changed symlink target from libboost_wserialization.so.1.87.0 to libboost_wserialization.so.1.88.0
  /usr/lib/cmake/Boost-1.87.0 moved to /usr/lib/cmake/Boost-1.88.0
  /usr/lib/cmake/boost_atomic-1.87.0 moved to /usr/lib/cmake/boost_atomic-1.88.0
  /usr/lib/cmake/boost_charconv-1.87.0 moved to /usr/lib/cmake/boost_charconv-1.88.0
  /usr/lib/cmake/boost_chrono-1.87.0 moved to /usr/lib/cmake/boost_chrono-1.88.0
  /usr/lib/cmake/boost_container-1.87.0 moved to /usr/lib/cmake/boost_container-1.88.0
  /usr/lib/cmake/boost_context-1.87.0 moved to /usr/lib/cmake/boost_context-1.88.0
  /usr/lib/cmake/boost_contract-1.87.0 moved to /usr/lib/cmake/boost_contract-1.88.0
  /usr/lib/cmake/boost_coroutine-1.87.0 moved to /usr/lib/cmake/boost_coroutine-1.88.0
  /usr/lib/cmake/boost_date_time-1.87.0 moved to /usr/lib/cmake/boost_date_time-1.88.0
  /usr/lib/cmake/BoostDetectToolset-1.87.0.cmake moved to /usr/lib/cmake/BoostDetectToolset-1.88.0.cmake
  /usr/lib/cmake/boost_exception-1.87.0 moved to /usr/lib/cmake/boost_exception-1.88.0
  /usr/lib/cmake/boost_fiber-1.87.0 moved to /usr/lib/cmake/boost_fiber-1.88.0
  /usr/lib/cmake/boost_filesystem-1.87.0 moved to /usr/lib/cmake/boost_filesystem-1.88.0
  /usr/lib/cmake/boost_graph-1.87.0 moved to /usr/lib/cmake/boost_graph-1.88.0
  /usr/lib/cmake/boost_headers-1.87.0 moved to /usr/lib/cmake/boost_headers-1.88.0
  /usr/lib/cmake/boost_iostreams-1.87.0 moved to /usr/lib/cmake/boost_iostreams-1.88.0
  /usr/lib/cmake/boost_json-1.87.0 moved to /usr/lib/cmake/boost_json-1.88.0
  /usr/lib/cmake/boost_locale-1.87.0 moved to /usr/lib/cmake/boost_locale-1.88.0
  /usr/lib/cmake/boost_log-1.87.0 moved to /usr/lib/cmake/boost_log-1.88.0
  /usr/lib/cmake/boost_log_setup-1.87.0 moved to /usr/lib/cmake/boost_log_setup-1.88.0
  /usr/lib/cmake/boost_math-1.87.0 moved to /usr/lib/cmake/boost_math-1.88.0
  /usr/lib/cmake/boost_math_c99-1.87.0 moved to /usr/lib/cmake/boost_math_c99-1.88.0
  /usr/lib/cmake/boost_math_c99f-1.87.0 moved to /usr/lib/cmake/boost_math_c99f-1.88.0
  /usr/lib/cmake/boost_math_c99l-1.87.0 moved to /usr/lib/cmake/boost_math_c99l-1.88.0
  /usr/lib/cmake/boost_math_tr1-1.87.0 moved to /usr/lib/cmake/boost_math_tr1-1.88.0
  /usr/lib/cmake/boost_math_tr1f-1.87.0 moved to /usr/lib/cmake/boost_math_tr1f-1.88.0
  /usr/lib/cmake/boost_math_tr1l-1.87.0 moved to /usr/lib/cmake/boost_math_tr1l-1.88.0
  /usr/lib/cmake/boost_numpy-1.87.0 moved to /usr/lib/cmake/boost_numpy-1.88.0
  /usr/lib/cmake/boost_prg_exec_monitor-1.87.0 moved to /usr/lib/cmake/boost_prg_exec_monitor-1.88.0
  /usr/lib/cmake/boost_program_options-1.87.0 moved to /usr/lib/cmake/boost_program_options-1.88.0
  /usr/lib/cmake/boost_python-1.87.0 moved to /usr/lib/cmake/boost_python-1.88.0
  /usr/lib/cmake/boost_random-1.87.0 moved to /usr/lib/cmake/boost_random-1.88.0
  /usr/lib/cmake/boost_regex-1.87.0 moved to /usr/lib/cmake/boost_regex-1.88.0
  /usr/lib/cmake/boost_serialization-1.87.0 moved to /usr/lib/cmake/boost_serialization-1.88.0
  /usr/lib/cmake/boost_system-1.87.0 moved to /usr/lib/cmake/boost_system-1.88.0
  /usr/lib/cmake/boost_test_exec_monitor-1.87.0 moved to /usr/lib/cmake/boost_test_exec_monitor-1.88.0
  /usr/lib/cmake/boost_thread-1.87.0 moved to /usr/lib/cmake/boost_thread-1.88.0
  /usr/lib/cmake/boost_timer-1.87.0 moved to /usr/lib/cmake/boost_timer-1.88.0
  /usr/lib/cmake/boost_type_erasure-1.87.0 moved to /usr/lib/cmake/boost_type_erasure-1.88.0
  /usr/lib/cmake/boost_unit_test_framework-1.87.0 moved to /usr/lib/cmake/boost_unit_test_framework-1.88.0
  /usr/lib/cmake/boost_url-1.87.0 moved to /usr/lib/cmake/boost_url-1.88.0
  /usr/lib/cmake/boost_wave-1.87.0 moved to /usr/lib/cmake/boost_wave-1.88.0
  /usr/lib/cmake/boost_wserialization-1.87.0 moved to /usr/lib/cmake/boost_wserialization-1.88.0
  /usr/lib/libboost_atomic.so.1.87.0 moved to /usr/lib/libboost_atomic.so.1.88.0
  /usr/lib/libboost_charconv.so.1.87.0 moved to /usr/lib/libboost_charconv.so.1.88.0
  /usr/lib/libboost_chrono.so.1.87.0 moved to /usr/lib/libboost_chrono.so.1.88.0
  /usr/lib/libboost_container.so.1.87.0 moved to /usr/lib/libboost_container.so.1.88.0
  /usr/lib/libboost_context.so.1.87.0 moved to /usr/lib/libboost_context.so.1.88.0
  /usr/lib/libboost_contract.so.1.87.0 moved to /usr/lib/libboost_contract.so.1.88.0
  /usr/lib/libboost_coroutine.so.1.87.0 moved to /usr/lib/libboost_coroutine.so.1.88.0
  /usr/lib/libboost_date_time.so.1.87.0 moved to /usr/lib/libboost_date_time.so.1.88.0
  /usr/lib/libboost_fiber.so.1.87.0 moved to /usr/lib/libboost_fiber.so.1.88.0
  /usr/lib/libboost_filesystem.so.1.87.0 moved to /usr/lib/libboost_filesystem.so.1.88.0
  /usr/lib/libboost_graph.so.1.87.0 moved to /usr/lib/libboost_graph.so.1.88.0
  /usr/lib/libboost_iostreams.so.1.87.0 moved to /usr/lib/libboost_iostreams.so.1.88.0
  /usr/lib/libboost_json.so.1.87.0 moved to /usr/lib/libboost_json.so.1.88.0
  /usr/lib/libboost_locale.so.1.87.0 moved to /usr/lib/libboost_locale.so.1.88.0
  /usr/lib/libboost_log_setup.so.1.87.0 moved to /usr/lib/libboost_log_setup.so.1.88.0
  /usr/lib/libboost_log.so.1.87.0 moved to /usr/lib/libboost_log.so.1.88.0
  /usr/lib/libboost_math_c99f.so.1.87.0 moved to /usr/lib/libboost_math_c99f.so.1.88.0
  /usr/lib/libboost_math_c99l.so.1.87.0 moved to /usr/lib/libboost_math_c99l.so.1.88.0
  /usr/lib/libboost_math_c99.so.1.87.0 moved to /usr/lib/libboost_math_c99.so.1.88.0
  /usr/lib/libboost_math_tr1f.so.1.87.0 moved to /usr/lib/libboost_math_tr1f.so.1.88.0
  /usr/lib/libboost_math_tr1l.so.1.87.0 moved to /usr/lib/libboost_math_tr1l.so.1.88.0
  /usr/lib/libboost_math_tr1.so.1.87.0 moved to /usr/lib/libboost_math_tr1.so.1.88.0
  /usr/lib/libboost_prg_exec_monitor.so.1.87.0 moved to /usr/lib/libboost_prg_exec_monitor.so.1.88.0
  /usr/lib/libboost_program_options.so.1.87.0 moved to /usr/lib/libboost_program_options.so.1.88.0
  /usr/lib/libboost_python313.so.1.87.0 moved to /usr/lib/libboost_python313.so.1.88.0
  /usr/lib/libboost_random.so.1.87.0 moved to /usr/lib/libboost_random.so.1.88.0
  /usr/lib/libboost_regex.so.1.87.0 moved to /usr/lib/libboost_regex.so.1.88.0
  /usr/lib/libboost_serialization.so.1.87.0 moved to /usr/lib/libboost_serialization.so.1.88.0
  /usr/lib/libboost_system.so.1.87.0 moved to /usr/lib/libboost_system.so.1.88.0
  /usr/lib/libboost_thread.so.1.87.0 moved to /usr/lib/libboost_thread.so.1.88.0
  /usr/lib/libboost_timer.so.1.87.0 moved to /usr/lib/libboost_timer.so.1.88.0
  /usr/lib/libboost_type_erasure.so.1.87.0 moved to /usr/lib/libboost_type_erasure.so.1.88.0
  /usr/lib/libboost_unit_test_framework.so.1.87.0 moved to /usr/lib/libboost_unit_test_framework.so.1.88.0
  /usr/lib/libboost_url.so.1.87.0 moved to /usr/lib/libboost_url.so.1.88.0
  /usr/lib/libboost_wave.so.1.87.0 moved to /usr/lib/libboost_wave.so.1.88.0
  /usr/lib/libboost_wserialization.so.1.87.0 moved to /usr/lib/libboost_wserialization.so.1.88.0
  /usr/include/boost/core/detail/assert.hpp was added
  /usr/include/boost/geometry/algorithms/detail/overlay/debug_traverse.hpp was added
  /usr/include/boost/hash2 was added
  /usr/include/boost/hash2/detail was added
  /usr/include/boost/hash2/detail/bit_cast.hpp was added
  /usr/include/boost/hash2/detail/config.hpp was added
  /usr/include/boost/hash2/detail/has_tag_invoke.hpp was added
  /usr/include/boost/hash2/detail/is_constant_evaluated.hpp was added
  /usr/include/boost/hash2/detail/keccak.hpp was added
  /usr/include/boost/hash2/detail/memcmp.hpp was added
  /usr/include/boost/hash2/detail/memcpy.hpp was added
  /usr/include/boost/hash2/detail/memset.hpp was added
  /usr/include/boost/hash2/detail/read.hpp was added
  /usr/include/boost/hash2/detail/rot.hpp was added
  /usr/include/boost/hash2/detail/write.hpp was added
  /usr/include/boost/hash2/digest.hpp was added
  /usr/include/boost/hash2/endian.hpp was added
  /usr/include/boost/hash2/flavor.hpp was added
  /usr/include/boost/hash2/fnv1a.hpp was added
  /usr/include/boost/hash2/get_integral_result.hpp was added
  /usr/include/boost/hash2/has_constant_size.hpp was added
  /usr/include/boost/hash2/hash_append_fwd.hpp was added
  /usr/include/boost/hash2/hash_append.hpp was added
  /usr/include/boost/hash2/hmac.hpp was added
  /usr/include/boost/hash2/is_contiguously_hashable.hpp was added
  /usr/include/boost/hash2/is_endian_independent.hpp was added
  /usr/include/boost/hash2/is_trivially_equality_comparable.hpp was added
  /usr/include/boost/hash2/legacy was added
  /usr/include/boost/hash2/legacy/murmur3.hpp was added
  /usr/include/boost/hash2/legacy/spooky2.hpp was added
  /usr/include/boost/hash2/md5.hpp was added
  /usr/include/boost/hash2/ripemd.hpp was added
  /usr/include/boost/hash2/sha1.hpp was added
  /usr/include/boost/hash2/sha2.hpp was added
  /usr/include/boost/hash2/sha3.hpp was added
  /usr/include/boost/hash2/siphash.hpp was added
  /usr/include/boost/hash2/xxhash.hpp was added
  /usr/include/boost/iterator/detail/eval_if_default.hpp was added
  /usr/include/boost/iterator/detail/if_default.hpp was added
  /usr/include/boost/iterator/detail/type_traits was added
  /usr/include/boost/iterator/detail/type_traits/conjunction.hpp was added
  /usr/include/boost/iterator/detail/type_traits/disjunction.hpp was added
  /usr/include/boost/iterator/detail/type_traits/negation.hpp was added
  /usr/include/boost/iterator/detail/type_traits/type_identity.hpp was added
  /usr/include/boost/iterator/enable_if_convertible.hpp was added
  /usr/include/boost/iterator/generator_iterator.hpp was added
  /usr/include/boost/iterator/min_category.hpp was added
  /usr/include/boost/iterator/shared_container_iterator.hpp was added
  /usr/include/boost/lockfree/spsc_value.hpp was added
  /usr/include/boost/mqtt5 was added
  /usr/include/boost/mqtt5/detail was added
  /usr/include/boost/mqtt5/detail/any_authenticator.hpp was added
  /usr/include/boost/mqtt5/detail/async_mutex.hpp was added
  /usr/include/boost/mqtt5/detail/async_traits.hpp was added
  /usr/include/boost/mqtt5/detail/cancellable_handler.hpp was added
  /usr/include/boost/mqtt5/detail/channel_traits.hpp was added
  /usr/include/boost/mqtt5/detail/control_packet.hpp was added
  /usr/include/boost/mqtt5/detail/internal_types.hpp was added
  /usr/include/boost/mqtt5/detail/log_invoke.hpp was added
  /usr/include/boost/mqtt5/detail/rebind_executor.hpp was added
  /usr/include/boost/mqtt5/detail/shutdown.hpp was added
  /usr/include/boost/mqtt5/detail/topic_validation.hpp was added
  /usr/include/boost/mqtt5/detail/traits.hpp was added
  /usr/include/boost/mqtt5/detail/utf8_mqtt.hpp was added
  /usr/include/boost/mqtt5/error.hpp was added
  /usr/include/boost/mqtt5.hpp was added
  /usr/include/boost/mqtt5/impl was added
  /usr/include/boost/mqtt5/impl/assemble_op.hpp was added
  /usr/include/boost/mqtt5/impl/async_sender.hpp was added
  /usr/include/boost/mqtt5/impl/autoconnect_stream.hpp was added
  /usr/include/boost/mqtt5/impl/client_service.hpp was added
  /usr/include/boost/mqtt5/impl/codecs was added
  /usr/include/boost/mqtt5/impl/codecs/base_decoders.hpp was added
  /usr/include/boost/mqtt5/impl/codecs/base_encoders.hpp was added
  /usr/include/boost/mqtt5/impl/codecs/message_decoders.hpp was added
  /usr/include/boost/mqtt5/impl/codecs/message_encoders.hpp was added
  /usr/include/boost/mqtt5/impl/connect_op.hpp was added
  /usr/include/boost/mqtt5/impl/disconnect_op.hpp was added
  /usr/include/boost/mqtt5/impl/endpoints.hpp was added
  /usr/include/boost/mqtt5/impl/ping_op.hpp was added
  /usr/include/boost/mqtt5/impl/publish_rec_op.hpp was added
  /usr/include/boost/mqtt5/impl/publish_send_op.hpp was added
  /usr/include/boost/mqtt5/impl/read_message_op.hpp was added
  /usr/include/boost/mqtt5/impl/read_op.hpp was added
  /usr/include/boost/mqtt5/impl/re_auth_op.hpp was added
  /usr/include/boost/mqtt5/impl/reconnect_op.hpp was added
  /usr/include/boost/mqtt5/impl/replies.hpp was added
  /usr/include/boost/mqtt5/impl/run_op.hpp was added
  /usr/include/boost/mqtt5/impl/sentry_op.hpp was added
  /usr/include/boost/mqtt5/impl/shutdown_op.hpp was added
  /usr/include/boost/mqtt5/impl/subscribe_op.hpp was added
  /usr/include/boost/mqtt5/impl/unsubscribe_op.hpp was added
  /usr/include/boost/mqtt5/impl/write_op.hpp was added
  /usr/include/boost/mqtt5/logger.hpp was added
  /usr/include/boost/mqtt5/logger_traits.hpp was added
  /usr/include/boost/mqtt5/mqtt_client.hpp was added
  /usr/include/boost/mqtt5/property_types.hpp was added
  /usr/include/boost/mqtt5/reason_codes.hpp was added
  /usr/include/boost/mqtt5/ssl.hpp was added
  /usr/include/boost/mqtt5/types.hpp was added
  /usr/include/boost/mqtt5/websocket.hpp was added
  /usr/include/boost/mqtt5/websocket_ssl.hpp was added
  /usr/include/boost/poly_collection/detail/begin_no_sanitize.hpp was added
  /usr/include/boost/poly_collection/detail/copyable.hpp was added
  /usr/include/boost/poly_collection/detail/end_no_sanitize.hpp was added
  /usr/include/boost/poly_collection/detail/fixed_variant.hpp was added
  /usr/include/boost/poly_collection/detail/fixed_variant_iterator.hpp was added
  /usr/include/boost/poly_collection/detail/is_closed_collection.hpp was added
  /usr/include/boost/poly_collection/detail/is_moveable.hpp was added
  /usr/include/boost/poly_collection/detail/segment_map.hpp was added
  /usr/include/boost/poly_collection/detail/size_t_map.hpp was added
  /usr/include/boost/poly_collection/detail/variant_model.hpp was added
  /usr/include/boost/poly_collection/variant_collection_fwd.hpp was added
  /usr/include/boost/poly_collection/variant_collection.hpp was added
  /usr/include/boost/process/bind_launcher.hpp was added
  /usr/include/boost/process/cstring_ref.hpp was added
  /usr/include/boost/process/default_launcher.hpp was added
  /usr/include/boost/process/execute.hpp was added
  /usr/include/boost/process/exit_code.hpp was added
  /usr/include/boost/process/ext was added
  /usr/include/boost/process/ext/cmd.hpp was added
  /usr/include/boost/process/ext/cwd.hpp was added
  /usr/include/boost/process/ext/env.hpp was added
  /usr/include/boost/process/ext/exe.hpp was added
  /usr/include/boost/process/ext.hpp was added
  /usr/include/boost/process/pid.hpp was added
  /usr/include/boost/process/popen.hpp was added
  /usr/include/boost/process/posix was added
  /usr/include/boost/process/posix/bind_fd.hpp was added
  /usr/include/boost/process/posix/default_launcher.hpp was added
  /usr/include/boost/process/posix/fork_and_forget_launcher.hpp was added
  /usr/include/boost/process/posix/pdfork_launcher.hpp was added
  /usr/include/boost/process/posix/vfork_launcher.hpp was added
  /usr/include/boost/process/process_handle.hpp was added
  /usr/include/boost/process/process.hpp was added
  /usr/include/boost/process/stdio.hpp was added
  /usr/include/boost/process/windows was added
  /usr/include/boost/process/windows/as_user_launcher.hpp was added
  /usr/include/boost/process/windows/creation_flags.hpp was added
  /usr/include/boost/process/windows/default_launcher.hpp was added
  /usr/include/boost/process/windows/show_window.hpp was added
  /usr/include/boost/process/windows/with_logon_launcher.hpp was added
  /usr/include/boost/process/windows/with_token_launcher.hpp was added
  /usr/include/boost/random/detail/size.hpp was added
  /usr/include/boost/random/detail/xoshiro_base.hpp was added
  /usr/include/boost/random/generalized_inverse_gaussian_distribution.hpp was added
  /usr/include/boost/random/inverse_gaussian_distribution.hpp was added
  /usr/include/boost/random/xoshiro.hpp was added
  /usr/include/boost/redis/adapter/any_adapter.hpp was added
  /usr/include/boost/redis/detail/resp3_handshaker.hpp was added
  /usr/include/boost/redis/impl/resp3_handshaker.ipp was added
  /usr/include/boost/spirit/home/x3/support/expectation.hpp was added
  /usr/include/boost/stacktrace/detail/addr_base_msvc.hpp was added
  /usr/include/boost/cobalt/detail/leaf.hpp was removed
  /usr/include/boost/cobalt/leaf.hpp was removed
  /usr/include/boost/iterator/detail/any_conversion_eater.hpp was removed
  /usr/include/boost/iterator/detail/enable_if.hpp was removed
  /usr/include/boost/iterator/detail/minimum_category.hpp was removed
  /usr/include/boost/process/args.hpp was removed
  /usr/include/boost/process/async.hpp was removed
  /usr/include/boost/process/async_pipe.hpp was removed
  /usr/include/boost/process/async_system.hpp was removed
  /usr/include/boost/process/child.hpp was removed
  /usr/include/boost/process/cmd.hpp was removed
  /usr/include/boost/process/env.hpp was removed
  /usr/include/boost/process/exception.hpp was removed
  /usr/include/boost/process/exe.hpp was removed
  /usr/include/boost/process/extend.hpp was removed
  /usr/include/boost/process/filesystem.hpp was removed
  /usr/include/boost/process/group.hpp was removed
  /usr/include/boost/process/handles.hpp was removed
  /usr/include/boost/process/io.hpp was removed
  /usr/include/boost/process/locale.hpp was removed
  /usr/include/boost/process/pipe.hpp was removed
  /usr/include/boost/process/posix.hpp was removed
  /usr/include/boost/process/search_path.hpp was removed
  /usr/include/boost/process/spawn.hpp was removed
  /usr/include/boost/process/system.hpp was removed
  /usr/include/boost/process/v1.hpp was removed
  /usr/include/boost/process/v2.hpp was removed
  /usr/include/boost/process/windows.hpp was removed
  /usr/include/boost/redis/detail/connection_base.hpp was removed
  /usr/include/boost/redis/detail/handshaker.hpp was removed
  /usr/include/boost/redis/impl/runner.ipp was removed

--===============6556068500887917992==--

