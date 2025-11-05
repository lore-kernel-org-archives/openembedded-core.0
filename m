Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9245ECD3428
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2344.1762384572687340688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P3g2ZTHJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pxPnsJs/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564e7904-ece17d1b-4625-4077-983c-b89da8e33066-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tosEcVr4H2RF8oVJU6iFGMAe/psypUN2Ld8tt0kSFPc=;
	b=P3g2ZTHJ8V3iBFRAg9ZeF/CMvCzo1WR3GK/broGLG2OqaSARF+vgCgsqR6f8JP2g
	YU5xu05ijV5pliB9ZTXhSoEsmuLMItEJPvDnzHg2dfFGY27FMP2Rf9MCjcWvFQNmbT2
	ZmDXL6jvPgurjHZD8+8om5v022h5kWcDw6Xzn2JY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tosEcVr4H2RF8oVJU6iFGMAe/psypUN2Ld8tt0kSFPc=;
	b=pxPnsJs/vWH9QGskdA9ZM4IT4/zyJ57sWn3dNK+iCC8hbdT2++wYlPA1sr88B1Tf
	BJp4NXgtf5r2NrHCUUsm8rSRsVdv/2I4CPK2En8IeQgO89KaThfq8k0a+z1oEPCBZrr
	PpCMt/z+g8FxvY0PhsQwyKXRFRU1v0Nv/9SGT3vs=
Content-Type: multipart/mixed; boundary="===============8849456801471920524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kea: upgrading to 3.0.2 SUCCEEDED
Message-ID: <0101019a564e7904-ece17d1b-4625-4077-983c-b89da8e33066-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225794

--===============8849456801471920524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kea* to *3.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-3.0.1-3.0.2.patch
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
From a256643a9749a4b2a472ced8f0b0980aa1c160b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 14:36:01 +0000
Subject: [PATCH] kea: upgrade 3.0.1 -> 3.0.2

---
 .../files/0001-build-boost-1.89.0-fixes.patch | 12 +++-
 ...s-dhcpsrv-Avoid-Boost-lexical_cast-o.patch | 10 ++--
 ...se-a-runtime-safe-interpreter-string.patch | 57 +++++++++++--------
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |  2 +-
 ...er_unittest_support.cc-do-not-write-.patch |  7 ++-
 .../kea/files/fix-multilib-conflict.patch     |  8 +--
 .../kea/files/fix_pid_keactrl.patch           |  4 +-
 .../kea/{kea_3.0.1.bb => kea_3.0.2.bb}        |  2 +-
 8 files changed, 59 insertions(+), 43 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_3.0.1.bb => kea_3.0.2.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
index fba2f5a573..e2e598ebfc 100644
--- a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
@@ -1,4 +1,4 @@
-From cf6af9219ba688fcd01d73a392dd1306d2b7a9e6 Mon Sep 17 00:00:00 2001
+From 8ab42a791b8a2451ce2819b45955d58e503d07c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 27 Aug 2025 22:20:09 -0700
 Subject: [PATCH] build: boost 1.89.0 fixes
@@ -6,11 +6,13 @@ Subject: [PATCH] build: boost 1.89.0 fixes
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2771/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- meson.build                        | 2 +-
+ meson.build                        | 4 ++--
  src/lib/asiodns/io_fetch.cc        | 1 +
  src/lib/asiolink/interval_timer.cc | 1 +
- 3 files changed, 3 insertions(+), 1 deletion(-)
+ 3 files changed, 4 insertions(+), 2 deletions(-)
 
+diff --git a/meson.build b/meson.build
+index 8ed5b2d..d5723ba 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -189,7 +189,7 @@ message(f'Detected system "@SYSTEM@".')
@@ -31,6 +33,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          'No messages to generate. This is probably an error in the meson.build files.',
      )
  endif
+diff --git a/src/lib/asiodns/io_fetch.cc b/src/lib/asiodns/io_fetch.cc
+index c140676..94f46fa 100644
 --- a/src/lib/asiodns/io_fetch.cc
 +++ b/src/lib/asiodns/io_fetch.cc
 @@ -22,6 +22,7 @@
@@ -41,6 +45,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <boost/scoped_ptr.hpp>
  #include <boost/date_time/posix_time/posix_time_types.hpp>
  
+diff --git a/src/lib/asiolink/interval_timer.cc b/src/lib/asiolink/interval_timer.cc
+index fa0d9e1..1410a85 100644
 --- a/src/lib/asiolink/interval_timer.cc
 +++ b/src/lib/asiolink/interval_timer.cc
 @@ -9,6 +9,7 @@
diff --git a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
index 6facc4d32d..5fa389a95c 100644
--- a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
+++ b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
@@ -1,4 +1,4 @@
-From e3a0d181a279334c7d7a10c5b09fd1610384101c Mon Sep 17 00:00:00 2001
+From 29cdb8eae2db546cec84d8b7fb4d9ba181570fb6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Sep 2025 12:52:51 -0700
 Subject: [PATCH] d2/dhcp[46]/radius/dhcpsrv: Avoid Boost lexical_cast on enums
@@ -295,10 +295,10 @@ index 04fe4df..cefdda8 100644
                        .arg(getCurrentServer()->toText());
  
 diff --git a/src/bin/dhcp4/dhcp4_srv.cc b/src/bin/dhcp4/dhcp4_srv.cc
-index 0701ed4..471e94c 100644
+index a6be662..1de57cd 100644
 --- a/src/bin/dhcp4/dhcp4_srv.cc
 +++ b/src/bin/dhcp4/dhcp4_srv.cc
-@@ -5101,7 +5101,7 @@ Dhcpv4Srv::d2ClientErrorHandler(const
+@@ -5116,7 +5116,7 @@ Dhcpv4Srv::d2ClientErrorHandler(const
                                  dhcp_ddns::NameChangeSender::Result result,
                                  dhcp_ddns::NameChangeRequestPtr& ncr) {
      LOG_ERROR(ddns4_logger, DHCP4_DDNS_REQUEST_SEND_FAILED).
@@ -308,10 +308,10 @@ index 0701ed4..471e94c 100644
      /// @todo We may wish to revisit this, but for now we will simply turn
      /// them off.
 diff --git a/src/bin/dhcp6/dhcp6_srv.cc b/src/bin/dhcp6/dhcp6_srv.cc
-index 417960b..818046d 100644
+index f999c31..acf19d0 100644
 --- a/src/bin/dhcp6/dhcp6_srv.cc
 +++ b/src/bin/dhcp6/dhcp6_srv.cc
-@@ -5054,7 +5054,7 @@ Dhcpv6Srv::d2ClientErrorHandler(const
+@@ -5061,7 +5061,7 @@ Dhcpv6Srv::d2ClientErrorHandler(const
                                  dhcp_ddns::NameChangeSender::Result result,
                                  dhcp_ddns::NameChangeRequestPtr& ncr) {
      LOG_ERROR(ddns6_logger, DHCP6_DDNS_REQUEST_SEND_FAILED).
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
index 44fe82bce0..13aec05278 100644
--- a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
@@ -1,4 +1,4 @@
-From 5ec5e08edc059ed0c0d430dc8e02cd64bebc8d1c Mon Sep 17 00:00:00 2001
+From bddb0395e42e25b7c7bfca3b778a28571962d210 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:02:49 -0700
 Subject: [PATCH] meson: use a runtime-safe interpreter string
@@ -17,15 +17,18 @@ such as /usr/bin/env python3 (portable) or
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/4087]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- doc/sphinx/meson.build          | 8 +++++++-
- meson.build                     | 8 +++++++-
- src/bin/shell/tests/meson.build | 8 +++++++-
- src/lib/util/python/meson.build | 8 +++++++-
- 4 files changed, 28 insertions(+), 4 deletions(-)
+ doc/sphinx/meson.build          |  8 +++++++-
+ meson.build                     | 14 ++++++++++++--
+ src/bin/shell/meson.build       |  8 +++++++-
+ src/bin/shell/tests/meson.build |  8 +++++++-
+ src/lib/util/python/meson.build |  8 +++++++-
+ 5 files changed, 40 insertions(+), 6 deletions(-)
 
+diff --git a/doc/sphinx/meson.build b/doc/sphinx/meson.build
+index 74ba705..71f1c7b 100644
 --- a/doc/sphinx/meson.build
 +++ b/doc/sphinx/meson.build
-@@ -70,7 +70,13 @@ doc_conf.set('builddir', meson.current_b
+@@ -70,7 +70,13 @@ doc_conf.set('builddir', meson.current_build_dir())
  doc_conf.set('srcdir', meson.current_source_dir())
  doc_conf.set('sphinxbuilddir', sphinxbuilddir)
  doc_conf.set('abs_sphinxbuilddir', abs_sphinxbuilddir)
@@ -40,6 +43,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  doc_conf.set('TOP_SOURCE_DIR', TOP_SOURCE_DIR)
  if PDFLATEX.found()
      doc_conf.set('HAVE_PDFLATEX', 'yes')
+diff --git a/meson.build b/meson.build
+index d5723ba..3bb5185 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -638,9 +638,13 @@ link_args = []
@@ -57,7 +62,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # Add rpaths for NETCONF dependencies.
  if NETCONF_DEP.found()
-@@ -759,7 +763,13 @@ report_conf_data.set('CXX_ARGS', ' '.joi
+@@ -759,7 +763,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_args))
  report_conf_data.set('LD_ID', cpp.get_linker_id())
  link_args += get_option('cpp_link_args')
  report_conf_data.set('LD_ARGS', ' '.join(link_args))
@@ -72,6 +77,25 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  report_conf_data.set('PYTHON_VERSION', PYTHON.version())
  report_conf_data.set('PKGPYTHONDIR', PKGPYTHONDIR)
  result = cpp.run(
+diff --git a/src/bin/shell/meson.build b/src/bin/shell/meson.build
+index 273293d..846a280 100644
+--- a/src/bin/shell/meson.build
++++ b/src/bin/shell/meson.build
+@@ -1,5 +1,11 @@
+ kea_shell_conf_data = configuration_data()
+-kea_shell_conf_data.set('PYTHON', PYTHON.full_path())
++# During cross builds, avoid embedding the native Python path into target artifacts.
++# Use a runtime-safe interpreter path for the target.
++py_for_runtime = '/usr/bin/env python3'
++if not meson.is_cross_build()
++  py_for_runtime = PYTHON.full_path()
++endif
++kea_shell_conf_data.set('PYTHON', py_for_runtime)
+ kea_shell_conf_data.set('PACKAGE_VERSION', PROJECT_VERSION)
+ kea_shell_conf_data.set(
+     'EXTENDED_VERSION',
+diff --git a/src/bin/shell/tests/meson.build b/src/bin/shell/tests/meson.build
+index 18a7bc3..c5c07ad 100644
 --- a/src/bin/shell/tests/meson.build
 +++ b/src/bin/shell/tests/meson.build
 @@ -3,7 +3,13 @@ if not TESTS_OPT.enabled()
@@ -89,6 +113,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  shell_tests_conf_data.set('abs_top_builddir', TOP_BUILD_DIR)
  shell_tests_conf_data.set('abs_top_srcdir', TOP_SOURCE_DIR)
  shell_unittest = configure_file(
+diff --git a/src/lib/util/python/meson.build b/src/lib/util/python/meson.build
+index 36b4f6d..d80403a 100644
 --- a/src/lib/util/python/meson.build
 +++ b/src/lib/util/python/meson.build
 @@ -4,7 +4,13 @@ endif
@@ -106,18 +132,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure_file(
      input: 'gen_wiredata.py.in',
      output: 'gen_wiredata.py',
---- a/src/bin/shell/meson.build
-+++ b/src/bin/shell/meson.build
-@@ -1,5 +1,11 @@
- kea_shell_conf_data = configuration_data()
--kea_shell_conf_data.set('PYTHON', PYTHON.full_path())
-+# During cross builds, avoid embedding the native Python path into target artifacts.
-+# Use a runtime-safe interpreter path for the target.
-+py_for_runtime = '/usr/bin/env python3'
-+if not meson.is_cross_build()
-+  py_for_runtime = PYTHON.full_path()
-+endif
-+kea_shell_conf_data.set('PYTHON', py_for_runtime)
- kea_shell_conf_data.set('PACKAGE_VERSION', PROJECT_VERSION)
- kea_shell_conf_data.set(
-     'EXTENDED_VERSION',
diff --git a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
index 521fac4629..552081fbd6 100644
--- a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
@@ -1,4 +1,4 @@
-From c8a1f0b9c17c8485bdeac045e5afdcd4467c1c14 Mon Sep 17 00:00:00 2001
+From 19a3798cafd839315c7e6c709cf49d6f244585c1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:31:39 -0700
 Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 1ab09e39a2..5a86eae2ea 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 841924e1fe8db2bff3eab8d37634ef08f86c00ec Mon Sep 17 00:00:00 2001
+From c6f084c33bf7accdfd97217b0b5d76e7f1308395 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
@@ -8,14 +8,15 @@ This breaks reproducibility and is needed only in unit testing.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  src/lib/log/logger_unittest_support.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
+index fc01c6e..f46d17e 100644
 --- a/src/lib/log/logger_unittest_support.cc
 +++ b/src/lib/log/logger_unittest_support.cc
-@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity sever
+@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
      const char* localfile = getenv("KEA_LOGGER_LOCALMSG");
  
      // Set a directory for creating lockfiles when running tests
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 68a566773a..ea0c1cc81d 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,8 +1,7 @@
-From cdef313bd34c5abd897b80f25554b0c66737ed05 Mon Sep 17 00:00:00 2001
+From e83245c589ab3b33892a6116ecde6501683a9636 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 14 Oct 2025 01:37:35 +0000
-Subject: [PATCH] There are conflict of config files between
- kea and lib32-kea:
+Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
 
 | Error: Transaction test error:
 |  file /etc/kea/kea-ctrl-agent.conf conflicts between attempted installs of
@@ -99,6 +98,3 @@ index c69a508..2bb488f 100644
      //   }
      // ],
  
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 9cc91bdddf..3aaae40833 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From f5125725e4e2e250ccc78a17a8b77431100e7c15 Mon Sep 17 00:00:00 2001
+From 9c7599b7f9d95e6db894357185312a9467f9b5a2 Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -15,6 +15,8 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
+index da108d8..30e4832 100755
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
 @@ -157,8 +157,8 @@ check_running() {
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.2.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_3.0.1.bb
rename to meta/recipes-connectivity/kea/kea_3.0.2.bb
index 4a6623f94a..49c953877e 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
            "
-SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a24c566"
+SRC_URI[sha256sum] = "29f4e44fa48f62fe15158d17411e003496203250db7b3459c2c79c09f379a541"
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 
-- 
2.47.1


--===============8849456801471920524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.119 /usr/lib/libkea-hooks.so.119.0.0 /usr/lib/libkea-dhcpsrv.so.130.0.0 /usr/lib/libkea-dhcpsrv.so.130", added "/usr/lib/libkea-dhcpsrv.so.131.0.0 /usr/lib/libkea-hooks.so.120 /usr/lib/libkea-hooks.so.120.0.0 /usr/lib/libkea-dhcpsrv.so.131"
Changes to packages/x86-64-v3-poky-linux/kea (sysroot):
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.130 to libkea-dhcpsrv.so.131
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.119 to libkea-hooks.so.120
  /usr/lib/libkea-dhcpsrv.so.130.0.0 moved to /usr/lib/libkea-dhcpsrv.so.131.0.0
  /usr/lib/libkea-dhcpsrv.so.130 moved to /usr/lib/libkea-dhcpsrv.so.131
  /usr/lib/libkea-hooks.so.119.0.0 moved to /usr/lib/libkea-hooks.so.120.0.0
  /usr/lib/libkea-hooks.so.119 moved to /usr/lib/libkea-hooks.so.120

--===============8849456801471920524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-hooks.so.119.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.130.0.0", added "/usr/lib/.debug/libkea-dhcpsrv.so.131.0.0 /usr/lib/.debug/libkea-hooks.so.120.0.0"
packages/x86-64-v3-poky-linux/kea/kea-dbg: PKGSIZE changed from 520732072 to 520406456 (-0%)
packages/x86-64-v3-poky-linux/kea/kea-dbg: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea-dbg: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea/kea-dev: PKGSIZE changed from 4093347 to 4093978 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-dev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea-dev: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea/kea-doc: PKGSIZE changed from 1423485 to 1424692 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-doc: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea-doc: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea/kea-locale: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea-locale: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea/kea-python: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea-python: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea/kea-src: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea-src: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea/kea-staticdev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea-staticdev: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-dhcpsrv.so.130.0.0 /usr/lib/libkea-hooks.so.119.0.0 /usr/lib/libkea-dhcpsrv.so.130 /usr/lib/libkea-hooks.so.119", added "/usr/lib/libkea-dhcpsrv.so.131.0.0 /usr/lib/libkea-dhcpsrv.so.131 /usr/lib/libkea-hooks.so.120.0.0 /usr/lib/libkea-hooks.so.120"
packages/x86-64-v3-poky-linux/kea/kea: PKGSIZE changed from 26675111 to 26683383 (+0%)
packages/x86-64-v3-poky-linux/kea/kea: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea/kea: PV changed from "3.0.1" to "3.0.2"
packages/x86-64-v3-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/3.0.1/kea-3.0.1.tar.xz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch file://0001-build-boost-1.89.0-fixes.patch file://0001-meson-use-a-runtime-safe-interpreter-string.patch file://0001-mk_cfgrpt.sh-strip-prefixes.patch file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch" to "http://ftp.isc.org/isc/kea/3.0.2/kea-3.0.2.tar.xz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch file://0001-build-boost-1.89.0-fix
 es.patch file://0001-meson-use-a-runtime-safe-interpreter-string.patch file://0001-mk_cfgrpt.sh-strip-prefixes.patch file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch"
packages/x86-64-v3-poky-linux/kea: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/x86-64-v3-poky-linux/kea: PV changed from "3.0.1" to "3.0.2"
Changes to packages/x86-64-v3-poky-linux/kea (sysroot):
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.130 to libkea-dhcpsrv.so.131
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.119 to libkea-hooks.so.120
  /usr/lib/libkea-dhcpsrv.so.130.0.0 moved to /usr/lib/libkea-dhcpsrv.so.131.0.0
  /usr/lib/libkea-dhcpsrv.so.130 moved to /usr/lib/libkea-dhcpsrv.so.131
  /usr/lib/libkea-hooks.so.119.0.0 moved to /usr/lib/libkea-hooks.so.120.0.0
  /usr/lib/libkea-hooks.so.119 moved to /usr/lib/libkea-hooks.so.120

--===============8849456801471920524==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-3.0.1-3.0.2.patch"

RnJvbSBhMjU2NjQzYTk3NDlhNGIyYTQ3MmNlZDhmMGIwOTgwYWExYzE2MGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNDozNjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
YTogdXBncmFkZSAzLjAuMSAtPiAzLjAuMgoKLS0tCiAuLi4vZmlsZXMvMDAwMS1idWlsZC1ib29z
dC0xLjg5LjAtZml4ZXMucGF0Y2ggfCAxMiArKystCiAuLi5zLWRoY3BzcnYtQXZvaWQtQm9vc3Qt
bGV4aWNhbF9jYXN0LW8ucGF0Y2ggfCAxMCArKy0tCiAuLi5zZS1hLXJ1bnRpbWUtc2FmZS1pbnRl
cnByZXRlci1zdHJpbmcucGF0Y2ggfCA1NyArKysrKysrKysrKy0tLS0tLS0tCiAuLi4vMDAwMS1t
a19jZmdycHQuc2gtc3RyaXAtcHJlZml4ZXMucGF0Y2ggICAgfCAgMiArLQogLi4uZXJfdW5pdHRl
c3Rfc3VwcG9ydC5jYy1kby1ub3Qtd3JpdGUtLnBhdGNoIHwgIDcgKystCiAuLi4va2VhL2ZpbGVz
L2ZpeC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaCAgICAgfCAgOCArLS0KIC4uLi9rZWEvZmlsZXMv
Zml4X3BpZF9rZWFjdHJsLnBhdGNoICAgICAgICAgICB8ICA0ICstCiAuLi4va2VhL3trZWFfMy4w
LjEuYmIgPT4ga2VhXzMuMC4yLmJifSAgICAgICAgfCAgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCA1
OSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2tlYS97a2VhXzMuMC4xLmJiID0+IGtlYV8zLjAuMi5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLWJ1aWxkLWJv
b3N0LTEuODkuMC1maXhlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2Zp
bGVzLzAwMDEtYnVpbGQtYm9vc3QtMS44OS4wLWZpeGVzLnBhdGNoCmluZGV4IGZiYTJmNWE1NzMu
LmUyZTU5OGViZmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2Zp
bGVzLzAwMDEtYnVpbGQtYm9vc3QtMS44OS4wLWZpeGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtYnVpbGQtYm9vc3QtMS44OS4wLWZpeGVzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjZjZhZjkyMTliYTY4OGZjZDAxZDczYTM5MmRkMTMw
NmQyYjdhOWU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YWI0MmE3OTFiOGEyNDUx
Y2UyODE5YjQ1OTU1ZDU4ZTUwM2QwN2MwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjcgQXVnIDIwMjUgMjI6
MjA6MDkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gYnVpbGQ6IGJvb3N0IDEuODkuMCBmaXhlcwpA
QCAtNiwxMSArNiwxMyBAQCBTdWJqZWN0OiBbUEFUQ0hdIGJ1aWxkOiBib29zdCAxLjg5LjAgZml4
ZXMKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5pc2Mub3JnL2lz
Yy1wcm9qZWN0cy9rZWEvLS9tZXJnZV9yZXF1ZXN0cy8yNzcxL10KIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtLS0KLSBtZXNvbi5idWlsZCAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQorIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICsrLS0KICBzcmMvbGliL2FzaW9kbnMvaW9fZmV0Y2guY2MgICAgICAgIHwgMSArCiAgc3Jj
L2xpYi9hc2lvbGluay9pbnRlcnZhbF90aW1lci5jYyB8IDEgKwotIDMgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKK2RpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCitpbmRleCA4ZWQ1YjJkLi5kNTcyM2JhIDEwMDY0NAogLS0tIGEvbWVzb24uYnVp
bGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTg5LDcgKzE4OSw3IEBAIG1lc3NhZ2UoZidEZXRl
Y3RlZCBzeXN0ZW0gIkBTWVNURU1AIi4nKQpAQCAtMzEsNiArMzMsOCBAQCBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogICAgICAgICAgJ05vIG1lc3NhZ2VzIHRv
IGdlbmVyYXRlLiBUaGlzIGlzIHByb2JhYmx5IGFuIGVycm9yIGluIHRoZSBtZXNvbi5idWlsZCBm
aWxlcy4nLAogICAgICApCiAgZW5kaWYKK2RpZmYgLS1naXQgYS9zcmMvbGliL2FzaW9kbnMvaW9f
ZmV0Y2guY2MgYi9zcmMvbGliL2FzaW9kbnMvaW9fZmV0Y2guY2MKK2luZGV4IGMxNDA2NzYuLjk0
ZjQ2ZmEgMTAwNjQ0CiAtLS0gYS9zcmMvbGliL2FzaW9kbnMvaW9fZmV0Y2guY2MKICsrKyBiL3Ny
Yy9saWIvYXNpb2Rucy9pb19mZXRjaC5jYwogQEAgLTIyLDYgKzIyLDcgQEAKQEAgLTQxLDYgKzQ1
LDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAjaW5j
bHVkZSA8Ym9vc3Qvc2NvcGVkX3B0ci5ocHA+CiAgI2luY2x1ZGUgPGJvb3N0L2RhdGVfdGltZS9w
b3NpeF90aW1lL3Bvc2l4X3RpbWVfdHlwZXMuaHBwPgogIAorZGlmZiAtLWdpdCBhL3NyYy9saWIv
YXNpb2xpbmsvaW50ZXJ2YWxfdGltZXIuY2MgYi9zcmMvbGliL2FzaW9saW5rL2ludGVydmFsX3Rp
bWVyLmNjCitpbmRleCBmYTBkOWUxLi4xNDEwYTg1IDEwMDY0NAogLS0tIGEvc3JjL2xpYi9hc2lv
bGluay9pbnRlcnZhbF90aW1lci5jYwogKysrIGIvc3JjL2xpYi9hc2lvbGluay9pbnRlcnZhbF90
aW1lci5jYwogQEAgLTksNiArOSw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2tlYS9maWxlcy8wMDAxLWQyLWRoY3AtNDYtcmFkaXVzLWRoY3BzcnYtQXZvaWQtQm9v
c3QtbGV4aWNhbF9jYXN0LW8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9m
aWxlcy8wMDAxLWQyLWRoY3AtNDYtcmFkaXVzLWRoY3BzcnYtQXZvaWQtQm9vc3QtbGV4aWNhbF9j
YXN0LW8ucGF0Y2gKaW5kZXggNmZhY2M0ZDMyZC4uNWZhMzg5YTk1YyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1kMi1kaGNwLTQ2LXJhZGl1cy1k
aGNwc3J2LUF2b2lkLUJvb3N0LWxleGljYWxfY2FzdC1vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtZDItZGhjcC00Ni1yYWRpdXMtZGhjcHNydi1B
dm9pZC1Cb29zdC1sZXhpY2FsX2Nhc3Qtby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTNh
MGQxODFhMjc5MzM0YzdkN2ExMGM1YjA5ZmQxNjEwMzg0MTAxYyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMjljZGI4ZWFlMmRiNTQ2Y2VjODRkOGI3ZmI0ZDliYTE4MTU3MGZiNiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
CiBEYXRlOiBXZWQsIDMgU2VwIDIwMjUgMTI6NTI6NTEgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZDIvZGhjcFs0Nl0vcmFkaXVzL2RoY3BzcnY6IEF2b2lkIEJvb3N0IGxleGljYWxfY2FzdCBvbiBl
bnVtcwpAQCAtMjk1LDEwICsyOTUsMTAgQEAgaW5kZXggMDRmZTRkZi4uY2VmZGRhOCAxMDA2NDQK
ICAgICAgICAgICAgICAgICAgICAgICAgLmFyZyhnZXRDdXJyZW50U2VydmVyKCktPnRvVGV4dCgp
KTsKICAKIGRpZmYgLS1naXQgYS9zcmMvYmluL2RoY3A0L2RoY3A0X3Nydi5jYyBiL3NyYy9iaW4v
ZGhjcDQvZGhjcDRfc3J2LmNjCi1pbmRleCAwNzAxZWQ0Li40NzFlOTRjIDEwMDY0NAoraW5kZXgg
YTZiZTY2Mi4uMWRlNTdjZCAxMDA2NDQKIC0tLSBhL3NyYy9iaW4vZGhjcDQvZGhjcDRfc3J2LmNj
CiArKysgYi9zcmMvYmluL2RoY3A0L2RoY3A0X3Nydi5jYwotQEAgLTUxMDEsNyArNTEwMSw3IEBA
IERoY3B2NFNydjo6ZDJDbGllbnRFcnJvckhhbmRsZXIoY29uc3QKK0BAIC01MTE2LDcgKzUxMTYs
NyBAQCBEaGNwdjRTcnY6OmQyQ2xpZW50RXJyb3JIYW5kbGVyKGNvbnN0CiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkaGNwX2RkbnM6Ok5hbWVDaGFuZ2VTZW5kZXI6OlJlc3VsdCBy
ZXN1bHQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkaGNwX2RkbnM6Ok5hbWVD
aGFuZ2VSZXF1ZXN0UHRyJiBuY3IpIHsKICAgICAgTE9HX0VSUk9SKGRkbnM0X2xvZ2dlciwgREhD
UDRfREROU19SRVFVRVNUX1NFTkRfRkFJTEVEKS4KQEAgLTMwOCwxMCArMzA4LDEwIEBAIGluZGV4
IDA3MDFlZDQuLjQ3MWU5NGMgMTAwNjQ0CiAgICAgIC8vLyBAdG9kbyBXZSBtYXkgd2lzaCB0byBy
ZXZpc2l0IHRoaXMsIGJ1dCBmb3Igbm93IHdlIHdpbGwgc2ltcGx5IHR1cm4KICAgICAgLy8vIHRo
ZW0gb2ZmLgogZGlmZiAtLWdpdCBhL3NyYy9iaW4vZGhjcDYvZGhjcDZfc3J2LmNjIGIvc3JjL2Jp
bi9kaGNwNi9kaGNwNl9zcnYuY2MKLWluZGV4IDQxNzk2MGIuLjgxODA0NmQgMTAwNjQ0CitpbmRl
eCBmOTk5YzMxLi5hY2YxOWQwIDEwMDY0NAogLS0tIGEvc3JjL2Jpbi9kaGNwNi9kaGNwNl9zcnYu
Y2MKICsrKyBiL3NyYy9iaW4vZGhjcDYvZGhjcDZfc3J2LmNjCi1AQCAtNTA1NCw3ICs1MDU0LDcg
QEAgRGhjcHY2U3J2OjpkMkNsaWVudEVycm9ySGFuZGxlcihjb25zdAorQEAgLTUwNjEsNyArNTA2
MSw3IEBAIERoY3B2NlNydjo6ZDJDbGllbnRFcnJvckhhbmRsZXIoY29uc3QKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRoY3BfZGRuczo6TmFtZUNoYW5nZVNlbmRlcjo6UmVzdWx0
IHJlc3VsdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRoY3BfZGRuczo6TmFt
ZUNoYW5nZVJlcXVlc3RQdHImIG5jcikgewogICAgICBMT0dfRVJST1IoZGRuczZfbG9nZ2VyLCBE
SENQNl9ERE5TX1JFUVVFU1RfU0VORF9GQUlMRUQpLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1tZXNvbi11c2UtYS1ydW50aW1lLXNhZmUtaW50
ZXJwcmV0ZXItc3RyaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmls
ZXMvMDAwMS1tZXNvbi11c2UtYS1ydW50aW1lLXNhZmUtaW50ZXJwcmV0ZXItc3RyaW5nLnBhdGNo
CmluZGV4IDQ0ZmU4MmJjZTAuLjEzYWVjMDUyNzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtbWVzb24tdXNlLWEtcnVudGltZS1zYWZlLWludGVy
cHJldGVyLXN0cmluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9m
aWxlcy8wMDAxLW1lc29uLXVzZS1hLXJ1bnRpbWUtc2FmZS1pbnRlcnByZXRlci1zdHJpbmcucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVlYzVlMDhlZGMwNTllZDBjMGQ0MzBkYzhlMDJjZDY0
YmViYzhkMWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJkZGIwMzk1ZTQyZTI1Yjdj
N2JmY2EzYjc3OGEyODU3MTk2MmQyMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyOCBBdWcgMjAyNSAxNzow
Mjo0OSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbjogdXNlIGEgcnVudGltZS1zYWZlIGlu
dGVycHJldGVyIHN0cmluZwpAQCAtMTcsMTUgKzE3LDE4IEBAIHN1Y2ggYXMgL3Vzci9iaW4vZW52
IHB5dGhvbjMgKHBvcnRhYmxlKSBvcgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBz
Oi8vZ2l0bGFiLmlzYy5vcmcvaXNjLXByb2plY3RzL2tlYS8tL2lzc3Vlcy80MDg3XQogU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0tLQotIGRvYy9zcGhpbngv
bWVzb24uYnVpbGQgICAgICAgICAgfCA4ICsrKysrKystCi0gbWVzb24uYnVpbGQgICAgICAgICAg
ICAgICAgICAgICB8IDggKysrKysrKy0KLSBzcmMvYmluL3NoZWxsL3Rlc3RzL21lc29uLmJ1aWxk
IHwgOCArKysrKysrLQotIHNyYy9saWIvdXRpbC9weXRob24vbWVzb24uYnVpbGQgfCA4ICsrKysr
KystCi0gNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQor
IGRvYy9zcGhpbngvbWVzb24uYnVpbGQgICAgICAgICAgfCAgOCArKysrKysrLQorIG1lc29uLmJ1
aWxkICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKystLQorIHNyYy9iaW4vc2hl
bGwvbWVzb24uYnVpbGQgICAgICAgfCAgOCArKysrKysrLQorIHNyYy9iaW4vc2hlbGwvdGVzdHMv
bWVzb24uYnVpbGQgfCAgOCArKysrKysrLQorIHNyYy9saWIvdXRpbC9weXRob24vbWVzb24uYnVp
bGQgfCAgOCArKysrKysrLQorIDUgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKIAorZGlmZiAtLWdpdCBhL2RvYy9zcGhpbngvbWVzb24uYnVpbGQgYi9kb2Mv
c3BoaW54L21lc29uLmJ1aWxkCitpbmRleCA3NGJhNzA1Li43MWYxYzdiIDEwMDY0NAogLS0tIGEv
ZG9jL3NwaGlueC9tZXNvbi5idWlsZAogKysrIGIvZG9jL3NwaGlueC9tZXNvbi5idWlsZAotQEAg
LTcwLDcgKzcwLDEzIEBAIGRvY19jb25mLnNldCgnYnVpbGRkaXInLCBtZXNvbi5jdXJyZW50X2IK
K0BAIC03MCw3ICs3MCwxMyBAQCBkb2NfY29uZi5zZXQoJ2J1aWxkZGlyJywgbWVzb24uY3VycmVu
dF9idWlsZF9kaXIoKSkKICBkb2NfY29uZi5zZXQoJ3NyY2RpcicsIG1lc29uLmN1cnJlbnRfc291
cmNlX2RpcigpKQogIGRvY19jb25mLnNldCgnc3BoaW54YnVpbGRkaXInLCBzcGhpbnhidWlsZGRp
cikKICBkb2NfY29uZi5zZXQoJ2Fic19zcGhpbnhidWlsZGRpcicsIGFic19zcGhpbnhidWlsZGRp
cikKQEAgLTQwLDYgKzQzLDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KICBkb2NfY29uZi5zZXQoJ1RPUF9TT1VSQ0VfRElSJywgVE9QX1NPVVJDRV9ESVIp
CiAgaWYgUERGTEFURVguZm91bmQoKQogICAgICBkb2NfY29uZi5zZXQoJ0hBVkVfUERGTEFURVgn
LCAneWVzJykKK2RpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCitpbmRleCBk
NTcyM2JhLi4zYmI1MTg1IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1
aWxkCiBAQCAtNjM4LDkgKzYzOCwxMyBAQCBsaW5rX2FyZ3MgPSBbXQpAQCAtNTcsNyArNjIsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAogICMgQWRk
IHJwYXRocyBmb3IgTkVUQ09ORiBkZXBlbmRlbmNpZXMuCiAgaWYgTkVUQ09ORl9ERVAuZm91bmQo
KQotQEAgLTc1OSw3ICs3NjMsMTMgQEAgcmVwb3J0X2NvbmZfZGF0YS5zZXQoJ0NYWF9BUkdTJywg
JyAnLmpvaQorQEAgLTc1OSw3ICs3NjMsMTMgQEAgcmVwb3J0X2NvbmZfZGF0YS5zZXQoJ0NYWF9B
UkdTJywgJyAnLmpvaW4oY29tcGlsZV9hcmdzKSkKICByZXBvcnRfY29uZl9kYXRhLnNldCgnTERf
SUQnLCBjcHAuZ2V0X2xpbmtlcl9pZCgpKQogIGxpbmtfYXJncyArPSBnZXRfb3B0aW9uKCdjcHBf
bGlua19hcmdzJykKICByZXBvcnRfY29uZl9kYXRhLnNldCgnTERfQVJHUycsICcgJy5qb2luKGxp
bmtfYXJncykpCkBAIC03Miw2ICs3NywyNSBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogIHJlcG9ydF9jb25mX2RhdGEuc2V0KCdQWVRIT05fVkVSU0lPTics
IFBZVEhPTi52ZXJzaW9uKCkpCiAgcmVwb3J0X2NvbmZfZGF0YS5zZXQoJ1BLR1BZVEhPTkRJUics
IFBLR1BZVEhPTkRJUikKICByZXN1bHQgPSBjcHAucnVuKAorZGlmZiAtLWdpdCBhL3NyYy9iaW4v
c2hlbGwvbWVzb24uYnVpbGQgYi9zcmMvYmluL3NoZWxsL21lc29uLmJ1aWxkCitpbmRleCAyNzMy
OTNkLi44NDZhMjgwIDEwMDY0NAorLS0tIGEvc3JjL2Jpbi9zaGVsbC9tZXNvbi5idWlsZAorKysr
IGIvc3JjL2Jpbi9zaGVsbC9tZXNvbi5idWlsZAorQEAgLTEsNSArMSwxMSBAQAorIGtlYV9zaGVs
bF9jb25mX2RhdGEgPSBjb25maWd1cmF0aW9uX2RhdGEoKQorLWtlYV9zaGVsbF9jb25mX2RhdGEu
c2V0KCdQWVRIT04nLCBQWVRIT04uZnVsbF9wYXRoKCkpCisrIyBEdXJpbmcgY3Jvc3MgYnVpbGRz
LCBhdm9pZCBlbWJlZGRpbmcgdGhlIG5hdGl2ZSBQeXRob24gcGF0aCBpbnRvIHRhcmdldCBhcnRp
ZmFjdHMuCisrIyBVc2UgYSBydW50aW1lLXNhZmUgaW50ZXJwcmV0ZXIgcGF0aCBmb3IgdGhlIHRh
cmdldC4KKytweV9mb3JfcnVudGltZSA9ICcvdXNyL2Jpbi9lbnYgcHl0aG9uMycKKytpZiBub3Qg
bWVzb24uaXNfY3Jvc3NfYnVpbGQoKQorKyAgcHlfZm9yX3J1bnRpbWUgPSBQWVRIT04uZnVsbF9w
YXRoKCkKKytlbmRpZgorK2tlYV9zaGVsbF9jb25mX2RhdGEuc2V0KCdQWVRIT04nLCBweV9mb3Jf
cnVudGltZSkKKyBrZWFfc2hlbGxfY29uZl9kYXRhLnNldCgnUEFDS0FHRV9WRVJTSU9OJywgUFJP
SkVDVF9WRVJTSU9OKQorIGtlYV9zaGVsbF9jb25mX2RhdGEuc2V0KAorICAgICAnRVhURU5ERURf
VkVSU0lPTicsCitkaWZmIC0tZ2l0IGEvc3JjL2Jpbi9zaGVsbC90ZXN0cy9tZXNvbi5idWlsZCBi
L3NyYy9iaW4vc2hlbGwvdGVzdHMvbWVzb24uYnVpbGQKK2luZGV4IDE4YTdiYzMuLmM1YzA3YWQg
MTAwNjQ0CiAtLS0gYS9zcmMvYmluL3NoZWxsL3Rlc3RzL21lc29uLmJ1aWxkCiArKysgYi9zcmMv
YmluL3NoZWxsL3Rlc3RzL21lc29uLmJ1aWxkCiBAQCAtMyw3ICszLDEzIEBAIGlmIG5vdCBURVNU
U19PUFQuZW5hYmxlZCgpCkBAIC04OSw2ICsxMTMsOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIHNoZWxsX3Rlc3RzX2NvbmZfZGF0YS5zZXQoJ2Fic190
b3BfYnVpbGRkaXInLCBUT1BfQlVJTERfRElSKQogIHNoZWxsX3Rlc3RzX2NvbmZfZGF0YS5zZXQo
J2Fic190b3Bfc3JjZGlyJywgVE9QX1NPVVJDRV9ESVIpCiAgc2hlbGxfdW5pdHRlc3QgPSBjb25m
aWd1cmVfZmlsZSgKK2RpZmYgLS1naXQgYS9zcmMvbGliL3V0aWwvcHl0aG9uL21lc29uLmJ1aWxk
IGIvc3JjL2xpYi91dGlsL3B5dGhvbi9tZXNvbi5idWlsZAoraW5kZXggMzZiNGY2ZC4uZDgwNDAz
YSAxMDA2NDQKIC0tLSBhL3NyYy9saWIvdXRpbC9weXRob24vbWVzb24uYnVpbGQKICsrKyBiL3Ny
Yy9saWIvdXRpbC9weXRob24vbWVzb24uYnVpbGQKIEBAIC00LDcgKzQsMTMgQEAgZW5kaWYKQEAg
LTEwNiwxOCArMTMyLDMgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KICBjb25maWd1cmVfZmlsZSgKICAgICAgaW5wdXQ6ICdnZW5fd2lyZWRhdGEucHkuaW4n
LAogICAgICBvdXRwdXQ6ICdnZW5fd2lyZWRhdGEucHknLAotLS0tIGEvc3JjL2Jpbi9zaGVsbC9t
ZXNvbi5idWlsZAotKysrIGIvc3JjL2Jpbi9zaGVsbC9tZXNvbi5idWlsZAotQEAgLTEsNSArMSwx
MSBAQAotIGtlYV9zaGVsbF9jb25mX2RhdGEgPSBjb25maWd1cmF0aW9uX2RhdGEoKQotLWtlYV9z
aGVsbF9jb25mX2RhdGEuc2V0KCdQWVRIT04nLCBQWVRIT04uZnVsbF9wYXRoKCkpCi0rIyBEdXJp
bmcgY3Jvc3MgYnVpbGRzLCBhdm9pZCBlbWJlZGRpbmcgdGhlIG5hdGl2ZSBQeXRob24gcGF0aCBp
bnRvIHRhcmdldCBhcnRpZmFjdHMuCi0rIyBVc2UgYSBydW50aW1lLXNhZmUgaW50ZXJwcmV0ZXIg
cGF0aCBmb3IgdGhlIHRhcmdldC4KLStweV9mb3JfcnVudGltZSA9ICcvdXNyL2Jpbi9lbnYgcHl0
aG9uMycKLStpZiBub3QgbWVzb24uaXNfY3Jvc3NfYnVpbGQoKQotKyAgcHlfZm9yX3J1bnRpbWUg
PSBQWVRIT04uZnVsbF9wYXRoKCkKLStlbmRpZgotK2tlYV9zaGVsbF9jb25mX2RhdGEuc2V0KCdQ
WVRIT04nLCBweV9mb3JfcnVudGltZSkKLSBrZWFfc2hlbGxfY29uZl9kYXRhLnNldCgnUEFDS0FH
RV9WRVJTSU9OJywgUFJPSkVDVF9WRVJTSU9OKQotIGtlYV9zaGVsbF9jb25mX2RhdGEuc2V0KAot
ICAgICAnRVhURU5ERURfVkVSU0lPTicsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2tlYS9maWxlcy8wMDAxLW1rX2NmZ3JwdC5zaC1zdHJpcC1wcmVmaXhlcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtbWtfY2ZncnB0LnNoLXN0
cmlwLXByZWZpeGVzLnBhdGNoCmluZGV4IDUyMWZhYzQ2MjkuLjU1MjA4MWZiZDYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtbWtfY2ZncnB0LnNo
LXN0cmlwLXByZWZpeGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2Vh
L2ZpbGVzLzAwMDEtbWtfY2ZncnB0LnNoLXN0cmlwLXByZWZpeGVzLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBjOGExZjBiOWMxN2M4NDg1YmRlYWMwNDVlNWFmZGNkNDQ2N2MxYzE0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxOWEzNzk4Y2FmZDgzOTMxNWM3ZTZjNzA5Y2Y0OWQ2
ZjI0NDU4NWMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjggQXVnIDIwMjUgMTc6MzE6MzkgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gbWtfY2ZncnB0LnNoOiBzdHJpcCBwcmVmaXhlcwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dn
ZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYy1kby1ub3Qtd3JpdGUtLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfdW5pdHRlc3Rf
c3VwcG9ydC5jYy1kby1ub3Qtd3JpdGUtLnBhdGNoCmluZGV4IDFhYjA5ZTM5YTIuLjVhODZlYWUy
ZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEt
c3JjLWxpYi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLXNyYy1saWIt
bG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5vdC13cml0ZS0ucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDg0MTkyNGUxZmU4ZGIyYmZmM2VhYjhkMzc2MzRlZjA4Zjg2YzAwZWMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM2ZjA4NGMzM2JmN2FjY2RmZDk3MjE3YjBi
NWQ3NmU3ZjEzMDgzOTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTAgTm92IDIwMjAg
MTU6NTc6MDMgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL2xpYi9sb2cvbG9nZ2VyX3VuaXR0
ZXN0X3N1cHBvcnQuY2M6IGRvIG5vdCB3cml0ZSBidWlsZApAQCAtOCwxNCArOCwxNSBAQCBUaGlz
IGJyZWFrcyByZXByb2R1Y2liaWxpdHkgYW5kIGlzIG5lZWRlZCBvbmx5IGluIHVuaXQgdGVzdGlu
Zy4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQog
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
Ci0KIC0tLQogIHNyYy9saWIvbG9nL2xvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjIHwgMiArLQog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCitkaWZmIC0t
Z2l0IGEvc3JjL2xpYi9sb2cvbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MgYi9zcmMvbGliL2xv
Zy9sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYworaW5kZXggZmMwMWM2ZS4uZjQ2ZDE3ZSAxMDA2
NDQKIC0tLSBhL3NyYy9saWIvbG9nL2xvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjCiArKysgYi9z
cmMvbGliL2xvZy9sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYwotQEAgLTg0LDcgKzg0LDcgQEAg
dm9pZCBpbml0TG9nZ2VyKGlzYzo6bG9nOjpTZXZlcml0eSBzZXZlcgorQEAgLTg0LDcgKzg0LDcg
QEAgdm9pZCBpbml0TG9nZ2VyKGlzYzo6bG9nOjpTZXZlcml0eSBzZXZlcml0eSwgaW50IGRiZ2xl
dmVsKSB7CiAgICAgIGNvbnN0IGNoYXIqIGxvY2FsZmlsZSA9IGdldGVudigiS0VBX0xPR0dFUl9M
T0NBTE1TRyIpOwogIAogICAgICAvLyBTZXQgYSBkaXJlY3RvcnkgZm9yIGNyZWF0aW5nIGxvY2tm
aWxlcyB3aGVuIHJ1bm5pbmcgdGVzdHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkva2VhL2ZpbGVzL2ZpeC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaAppbmRl
eCA2OGE1NjY3NzNhLi5lYTBjMWNjODFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2tlYS9maWxlcy9maXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4LW11bHRpbGliLWNvbmZsaWN0LnBhdGNo
CkBAIC0xLDggKzEsNyBAQAotRnJvbSBjZGVmMzEzYmQzNGM1YWJkODk3YjgwZjI1NTU0YjBjNjY3
MzdlZDA1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlODMyNDVjNTg5YWIzYjMzODky
YTYxMTZlY2RlNjUwMTY4M2E5NjM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2Fp
IEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE0IE9jdCAyMDI1IDAx
OjM3OjM1ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIFRoZXJlIGFyZSBjb25mbGljdCBvZiBjb25m
aWcgZmlsZXMgYmV0d2VlbgotIGtlYSBhbmQgbGliMzIta2VhOgorU3ViamVjdDogW1BBVENIXSBU
aGVyZSBhcmUgY29uZmxpY3Qgb2YgY29uZmlnIGZpbGVzIGJldHdlZW4ga2VhIGFuZCBsaWIzMi1r
ZWE6CiAKIHwgRXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJyb3I6CiB8ICBmaWxlIC9ldGMva2Vh
L2tlYS1jdHJsLWFnZW50LmNvbmYgY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGluc3RhbGxz
IG9mCkBAIC05OSw2ICs5OCwzIEBAIGluZGV4IGM2OWE1MDguLjJiYjQ4OGYgMTAwNjQ0CiAgICAg
IC8vICAgfQogICAgICAvLyBdLAogIAotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4X3BpZF9rZWFjdHJsLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4X3BpZF9rZWFjdHJsLnBhdGNoCmlu
ZGV4IDljYzkxYmRkZGYuLjNhYWFlNDA4MzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeF9waWRfa2VhY3RybC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXhfcGlkX2tlYWN0cmwucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGY1MTI1NzI1ZTRlMmUyNTBjY2M3OGExN2E4Yjc3NDMxMTAwZTdjMTUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDljNzU5OWI3ZjlkOTVlNmRiODk0MzU3MTg1MzEy
YTk0NjdmOWI1YTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBcm1pbiBrdXN0ZXIg
PGFrdXN0ZXI4MDhAZ21haWwuY29tPgogRGF0ZTogV2VkLCAxNCBPY3QgMjAyMCAyMjo0ODozMSAt
MDcwMAogU3ViamVjdDogW1BBVENIXSBCdXN5Ym94IGRvZXMgbm90IHN1cHBvcnQgcHMgLXAgc28g
dXNlIHBncmVwCkBAIC0xNSw2ICsxNSw4IEBAIFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGlu
IDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiAgc3JjL2Jpbi9rZWFjdHJsL2tlYWN0cmwuaW4gfCA0
ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
CitkaWZmIC0tZ2l0IGEvc3JjL2Jpbi9rZWFjdHJsL2tlYWN0cmwuaW4gYi9zcmMvYmluL2tlYWN0
cmwva2VhY3RybC5pbgoraW5kZXggZGExMDhkOC4uMzBlNDgzMiAxMDA3NTUKIC0tLSBhL3NyYy9i
aW4va2VhY3RybC9rZWFjdHJsLmluCiArKysgYi9zcmMvYmluL2tlYWN0cmwva2VhY3RybC5pbgog
QEAgLTE1Nyw4ICsxNTcsOCBAQCBjaGVja19ydW5uaW5nKCkgewpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzMuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9rZWEva2VhXzMuMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8zLjAuMS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzMuMC4yLmJiCmluZGV4IDRhNjYyM2Y5NGEu
LjQ5Yzk1Mzg3N2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tl
YV8zLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9rZWFfMy4wLjIu
YmIKQEAgLTIyLDcgKzIyLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vZnRwLmlzYy5vcmcvaXNjL2tl
YS8ke1BWfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1ta19jZmdycHQu
c2gtc3RyaXAtcHJlZml4ZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1kMi1kaGNw
LTQ2LXJhZGl1cy1kaGNwc3J2LUF2b2lkLUJvb3N0LWxleGljYWxfY2FzdC1vLnBhdGNoIFwKICAg
ICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVjODRmZWM0YmI3ZjZiOWQxNWE4MmU3
NTVhNTcxZTkzNDhlYjRkNmZiYzYyYmIzZjZmMTI5NmNkN2EyNGM1NjYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMjlmNGU0NGZhNDhmNjJmZTE1MTU4ZDE3NDExZTAwMzQ5NjIwMzI1MGRiN2IzNDU5
YzJjNzljMDlmMzc5YTU0MSIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgc3lzdGVtZCB1cGRh
dGUtcmMuZCB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4KIAotLSAKMi40Ny4xCgo=

--===============8849456801471920524==--

