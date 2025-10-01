Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D10CCD189
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17929.1759325532725308262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tA2YyjVP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OMtHi5b1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101999ff93bae-fa0f46c6-5576-4f11-855e-496a1cada092-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6J2MV9+LxMZLSVlvcNaMFCt3noj1KX8McPf0/SIEvV4=;
	b=tA2YyjVPTmMst9jCdNAH70gXW1vtLC2R6fan+Muif6HGSgvo94suKTeGyuW1Tl/G
	vGVr9lEX94kR6ylEhjGLV+ryGCxzeEF7VhrWjV2JJOhWcuBuP4C5ux5+Yd7Vim27BUW
	KGVZncHIAkiWVkFXfEq9uhb7uaF4l8CMSTLQHmWI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6J2MV9+LxMZLSVlvcNaMFCt3noj1KX8McPf0/SIEvV4=;
	b=OMtHi5b1kJF16JeETnwlt2H5SiEpWpgSMmT+OBcgmMNIeC9HgIhYF0SmXIJsRgPh
	q3wrKbfMch/hjwumYQ1x1jHFXgYl1+WDrBUamKdm1XGwkycNkRs9DqPL01Q+wL947cP
	b7ZOnG041VoqTNofWTkrJKmFtaz7wBJ0K1Phod5A=
Content-Type: multipart/mixed; boundary="===============1378018674617942351=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssl: upgrading to 3.5.4 SUCCEEDED
Message-ID: <010101999ff93bae-fa0f46c6-5576-4f11-855e-496a1cada092-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224221

--===============1378018674617942351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssl* to *3.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssl-upgrade-3.5.2-3.5.4.patch
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
From 1abf82323d9fa4e1ec7d2f2c46a77c6dfb4463ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 07:57:21 +0000
Subject: [PATCH] openssl: upgrade 3.5.2 -> 3.5.4

---
 ...-handshake-history-reporting-when-test-fails.patch | 11 ++++-------
 .../0001-Configure-do-not-tweak-mips-cflags.patch     |  4 ++--
 ...o-strip-sysroot-and-debug-prefix-map-from-co.patch |  7 +++----
 .../openssl/{openssl_3.5.2.bb => openssl_3.5.4.bb}    |  2 +-
 4 files changed, 10 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.2.bb => openssl_3.5.4.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index 5b7365a353..02cb812371 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -1,4 +1,4 @@
-From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
+From a1d4c4241436ff26bfba896cf9d5d63251f64738 Mon Sep 17 00:00:00 2001
 From: William Lyu <William.Lyu@windriver.com>
 Date: Fri, 20 Oct 2023 16:22:37 -0400
 Subject: [PATCH] Added handshake history reporting when test fails
@@ -13,7 +13,7 @@ Signed-off-by: William Lyu <William.Lyu@windriver.com>
  3 files changed, 217 insertions(+), 34 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
-index f611b3a..5703b48 100644
+index 64eb6ae..61e4b1d 100644
 --- a/test/helpers/handshake.c
 +++ b/test/helpers/handshake.c
 @@ -25,6 +25,102 @@
@@ -301,7 +301,7 @@ index 78b03f9..b9967c2 100644
 +
  #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
 diff --git a/test/ssl_test.c b/test/ssl_test.c
-index ea60851..9d6b093 100644
+index 841d229..327867a 100644
 --- a/test/ssl_test.c
 +++ b/test/ssl_test.c
 @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
@@ -361,7 +361,4 @@ index ea60851..9d6b093 100644
 +
      return ret;
  }
-
---
-2.25.1
-
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index cf5ff356ee..c121ca0594 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -1,4 +1,4 @@
-From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
+From 01dc6ae00abfb00085e3b19ebd92464c9ee278b1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
@@ -17,7 +17,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
 
 diff --git a/Configure b/Configure
-index fff97bd..5ee54c1 100755
+index 4995854..b50d780 100755
 --- a/Configure
 +++ b/Configure
 @@ -1552,16 +1552,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 687d682976..ffe4d43860 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
+From 0bebe55c00d3384727f97e442d70bb9fc5703f8c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
@@ -28,17 +28,16 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
  crypto/build.info                 |  2 +-
  2 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index 09303c4..011bda1 100644
+index 81f4992..f9dc03c 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -502,13 +502,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+@@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.4.bb
index 396e69d7e7..c222b1533b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec"
+SRC_URI[sha256sum] = "967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.47.1


--===============1378018674617942351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/openssl: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl: SRC_URI changed from "http://www.openssl.org/source/openssl-3.5.2.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch" to "http://www.openssl.org/source/openssl-3.5.4.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch"
packages/x86-64-v3-poky-linux/openssl: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/libcrypto: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/libcrypto: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/libssl: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/libssl: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-bin: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-bin: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-conf: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-conf: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-dbg: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-dbg: PKGSIZE changed from 20479384 to 20489592 (+0%)
packages/x86-64-v3-poky-linux/openssl/openssl-dbg: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-dev: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-dev: PKGSIZE changed from 2206017 to 2205925 (-0%)
packages/x86-64-v3-poky-linux/openssl/openssl-dev: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-doc: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-doc: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-engines: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-engines: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-locale: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-locale: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-misc: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-misc: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-fips: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-fips: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-legacy: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-legacy: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/recipes/90-test_sslapi_data/ssltraceref-zlib.txt /usr/lib/openssl/ptest/test/recipes/20-test_cli_list.t /usr/lib/openssl/ptest/test/recipes/90-test_threads_data/store/8489a545.0 /usr/lib/openssl/ptest/test/recipes/90-test_sslapi_data/ssltraceref.txt /usr/lib/openssl/ptest/test/recipes/95-test_external_oqsprovider_data/oqsprovider-ca.sh"
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: PKGSIZE changed from 711029933 to 711374507 (+0%)
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-src: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-src: PKGSIZE changed from 6984544 to 6984490 (-0%)
packages/x86-64-v3-poky-linux/openssl/openssl-src: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl-staticdev: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-staticdev: PKGSIZE changed from 37649294 to 37663052 (+0%)
packages/x86-64-v3-poky-linux/openssl/openssl-staticdev: PV changed from "3.5.2" to "3.5.4"
packages/x86-64-v3-poky-linux/openssl/openssl: PKGV changed from 3.5.2 [default] to 3.5.4 [default]
packages/x86-64-v3-poky-linux/openssl/openssl: PV changed from "3.5.2" to "3.5.4"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was removed

--===============1378018674617942351==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssl-upgrade-3.5.2-3.5.4.patch"

RnJvbSAxYWJmODIzMjNkOWZhNGUxZWM3ZDJmMmM0NmE3N2M2ZGZiNDQ2M2NlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwNzo1NzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2w6IHVwZ3JhZGUgMy41LjIgLT4gMy41LjQKCi0tLQogLi4uLWhhbmRzaGFrZS1oaXN0b3J5
LXJlcG9ydGluZy13aGVuLXRlc3QtZmFpbHMucGF0Y2ggfCAxMSArKysrLS0tLS0tLQogLi4uLzAw
MDEtQ29uZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRjaCAgICAgfCAgNCArKy0t
CiAuLi5vLXN0cmlwLXN5c3Jvb3QtYW5kLWRlYnVnLXByZWZpeC1tYXAtZnJvbS1jby5wYXRjaCB8
ICA3ICsrKy0tLS0KIC4uLi9vcGVuc3NsL3tvcGVuc3NsXzMuNS4yLmJiID0+IG9wZW5zc2xfMy41
LjQuYmJ9ICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL3tv
cGVuc3NsXzMuNS4yLmJiID0+IG9wZW5zc2xfMy41LjQuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1BZGRlZC1oYW5k
c2hha2UtaGlzdG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0LWZhaWxzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1BZGRlZC1oYW5kc2hha2UtaGlz
dG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0LWZhaWxzLnBhdGNoCmluZGV4IDViNzM2NWEzNTMuLjAy
Y2I4MTIzNzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9v
cGVuc3NsLzAwMDEtQWRkZWQtaGFuZHNoYWtlLWhpc3RvcnktcmVwb3J0aW5nLXdoZW4tdGVzdC1m
YWlscy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNz
bC8wMDAxLUFkZGVkLWhhbmRzaGFrZS1oaXN0b3J5LXJlcG9ydGluZy13aGVuLXRlc3QtZmFpbHMu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDViYTY1MDUxZmVhMDUxM2RiMGQ5OTdmMGFiN2Nh
ZmI5ODI2ZWQ3NGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGExZDRjNDI0MTQzNmZm
MjZiZmJhODk2Y2Y5ZDVkNjMyNTFmNjQ3MzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBXaWxsaWFtIEx5dSA8V2lsbGlhbS5MeXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMjAg
T2N0IDIwMjMgMTY6MjI6MzcgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkZWQgaGFuZHNoYWtl
IGhpc3RvcnkgcmVwb3J0aW5nIHdoZW4gdGVzdCBmYWlscwpAQCAtMTMsNyArMTMsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBXaWxsaWFtIEx5dSA8V2lsbGlhbS5MeXVAd2luZHJpdmVyLmNvbT4KICAzIGZp
bGVzIGNoYW5nZWQsIDIxNyBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3Rlc3QvaGVscGVycy9oYW5kc2hha2UuYyBiL3Rlc3QvaGVscGVycy9oYW5kc2hha2Uu
YwotaW5kZXggZjYxMWIzYS4uNTcwM2I0OCAxMDA2NDQKK2luZGV4IDY0ZWI2YWUuLjYxZTRiMWQg
MTAwNjQ0CiAtLS0gYS90ZXN0L2hlbHBlcnMvaGFuZHNoYWtlLmMKICsrKyBiL3Rlc3QvaGVscGVy
cy9oYW5kc2hha2UuYwogQEAgLTI1LDYgKzI1LDEwMiBAQApAQCAtMzAxLDcgKzMwMSw3IEBAIGlu
ZGV4IDc4YjAzZjkuLmI5OTY3YzIgMTAwNjQ0CiArCiAgI2VuZGlmICAvKiBPU1NMX1RFU1RfSEFO
RFNIQUtFX0hFTFBFUl9IICovCiBkaWZmIC0tZ2l0IGEvdGVzdC9zc2xfdGVzdC5jIGIvdGVzdC9z
c2xfdGVzdC5jCi1pbmRleCBlYTYwODUxLi45ZDZiMDkzIDEwMDY0NAoraW5kZXggODQxZDIyOS4u
MzI3ODY3YSAxMDA2NDQKIC0tLSBhL3Rlc3Qvc3NsX3Rlc3QuYwogKysrIGIvdGVzdC9zc2xfdGVz
dC5jCiBAQCAtMjYsNiArMjYsNDQgQEAgc3RhdGljIE9TU0xfTElCX0NUWCAqbGliY3R4ID0gTlVM
TDsKQEAgLTM2MSw3ICszNjEsNCBAQCBpbmRleCBlYTYwODUxLi45ZDZiMDkzIDEwMDY0NAogKwog
ICAgICByZXR1cm4gcmV0OwogIH0KLQotLS0KLTIuMjUuMQotCisgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLUNvbmZpZ3VyZS1kby1u
b3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2wvb3BlbnNzbC8wMDAxLUNvbmZpZ3VyZS1kby1ub3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0
Y2gKaW5kZXggY2Y1ZmYzNTZlZS4uYzEyMWNhMDU5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1Db25maWd1cmUtZG8tbm90LXR3ZWFr
LW1pcHMtY2ZsYWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
bC9vcGVuc3NsLzAwMDEtQ29uZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMDM3N2YwZDViNWMxMDc5ZTNiOWE4MDg4MWY0ZGNjODkxY2Jl
OWY5YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDFkYzZhZTAwYWJmYjAwMDg1ZTNi
MTllYmQ5MjQ2NGM5ZWUyNzhiMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBUdWUsIDMwIE1heSAyMDIz
IDA5OjExOjI3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIENvbmZpZ3VyZTogZG8gbm90IHR3ZWFr
IG1pcHMgY2ZsYWdzCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IFRpbSBPcmxpbmcg
PHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL0NvbmZpZ3VyZSBiL0NvbmZpZ3VyZQotaW5kZXggZmZmOTdiZC4u
NWVlNTRjMSAxMDA3NTUKK2luZGV4IDQ5OTU4NTQuLmI1MGQ3ODAgMTAwNzU1CiAtLS0gYS9Db25m
aWd1cmUKICsrKyBiL0NvbmZpZ3VyZQogQEAgLTE1NTIsMTYgKzE1NTIsNiBAQCBpZiAoJHRhcmdl
dCA9fiAvXm1pbmd3LyAmJiBgJGNvbmZpZ3tDQ30gLS10YXJnZXQtaGVscCAyPiYxYCA9fiBtLy1t
bm8tY3lnd2luL20pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2wvb3BlbnNzbC8wMDAxLWJ1aWxkaW5mby1zdHJpcC1zeXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgt
bWFwLWZyb20tY28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbC8wMDAxLWJ1aWxkaW5mby1zdHJpcC1zeXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgtbWFwLWZy
b20tY28ucGF0Y2gKaW5kZXggNjg3ZDY4Mjk3Ni4uZmZlNGQ0Mzg2MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1idWlsZGluZm8tc3Ry
aXAtc3lzcm9vdC1hbmQtZGVidWctcHJlZml4LW1hcC1mcm9tLWNvLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtYnVpbGRpbmZvLXN0cmlw
LXN5c3Jvb3QtYW5kLWRlYnVnLXByZWZpeC1tYXAtZnJvbS1jby5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNTk4NTI1M2YyYzkwMjVkN2MxMjc0NDNhM2E5OTM4OTQ2ZjgwYzJhMSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGJlYmU1NWMwMGQzMzg0NzI3Zjk3ZTQ0MmQ3MGJiOWZj
NTcwM2Y4YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9NYXJ0aW49
MjBIdW5kZWI9QzM9QjhsbD89IDxtYXJ0aW5AZ2Vhbml4LmNvbT4KIERhdGU6IFR1ZSwgNiBOb3Yg
MjAxOCAxNDo1MDo0NyArMDEwMAogU3ViamVjdDogW1BBVENIXSBidWlsZGluZm86IHN0cmlwIHN5
c3Jvb3QgYW5kIGRlYnVnLXByZWZpeC1tYXAgZnJvbSBjb21waWxlcgpAQCAtMjgsMTcgKzI4LDE2
IEBAIFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogVXBk
YXRlIHRvIGZpeCBidWlsZHBhdGhzIHFhIGlzc3VlIGZvciAnLWZmaWxlLXByZWZpeC1tYXAnLgog
CiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotCiAtLS0KICBD
b25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwgfCAxNiArKysrKysrKysrKysrKystCiAg
Y3J5cHRvL2J1aWxkLmluZm8gICAgICAgICAgICAgICAgIHwgIDIgKy0KICAyIGZpbGVzIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9Db25m
aWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwgYi9Db25maWd1cmF0aW9ucy91bml4LU1ha2Vm
aWxlLnRtcGwKLWluZGV4IDA5MzAzYzQuLjAxMWJkYTEgMTAwNjQ0CitpbmRleCA4MWY0OTkyLi5m
OWRjMDNjIDEwMDY0NAogLS0tIGEvQ29uZmlndXJhdGlvbnMvdW5peC1NYWtlZmlsZS50bXBsCiAr
KysgYi9Db25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwKLUBAIC01MDIsMTMgKzUwMiwy
NyBAQCBCSU5fTERGTEFHUz17LSBqb2luKCcgJywgJHRhcmdldHtiaW5fbGZsYWdzfSB8fCAoKSwK
K0BAIC01MTMsMTMgKzUxMywyNyBAQCBCSU5fTERGTEFHUz17LSBqb2luKCcgJywgJHRhcmdldHti
aW5fbGZsYWdzfSB8fCAoKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgJyQoQ05GX0xERkxB
R1MpJywgJyQoTERGTEFHUyknKSAtfQogIEJJTl9FWF9MSUJTPSQoQ05GX0VYX0xJQlMpICQoRVhf
TElCUykKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9v
cGVuc3NsXzMuNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5z
c2xfMy41LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMy41LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNS40LmJiCmluZGV4IDM5NmU2OWQ3
ZTcuLmMyMjJiMTUzM2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsXzMuNS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsXzMuNS40LmJiCkBAIC0xOCw3ICsxOCw3IEBAIFNSQ19VUkk6YXBwZW5kOmNs
YXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1vcGVu
c3NsLnNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzUzYTQ3ZTVl
NDQxYzkzMGMzOTI4Y2Y3YmY2ZmIwMGU1ZDEyOWI2MzBlMGFhODczYjA4MjU4NjU2ZTczNDVlYyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NjczMTFmODQ5NTUzMTY5NjliZGIxZDhkNGI5ODM3MThl
ZjQyMzM4NjM5YzYyMWVjNGMzNGZkZGVmMzU1ZTk5IgogCiBpbmhlcml0IGxpYl9wYWNrYWdlIG11
bHRpbGliX2hlYWRlciBtdWx0aWxpYl9zY3JpcHQgcHRlc3QgcGVybG5hdGl2ZSBtYW5wYWdlcwog
TVVMVElMSUJfU0NSSVBUUyA9ICIke1BOfS1iaW46JHtiaW5kaXJ9L2NfcmVoYXNoIgotLSAKMi40
Ny4xCgo=

--===============1378018674617942351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/recipes/90-test_sslapi_data/ssltraceref.txt /usr/lib/openssl/ptest/test/recipes/20-test_cli_list.t /usr/lib/openssl/ptest/test/recipes/90-test_sslapi_data/ssltraceref-zlib.txt /usr/lib/openssl/ptest/test/recipes/90-test_threads_data/store/8489a545.0 /usr/lib/openssl/ptest/test/recipes/95-test_external_oqsprovider_data/oqsprovider-ca.sh"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was removed

--===============1378018674617942351==--

