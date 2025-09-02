Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F10CAC5A1
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.90008.1756850199230490797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=G2LZpwB9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=H713XoUc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101990c6ea529-984cc051-0107-4ce8-a7e0-25c024fcd2c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v1EM7u5hqAHYEg7vKGjLWzpyLs6ksy+GZlqladofubM=;
	b=G2LZpwB9lHfzAcCfiOv0ah7s0MjFgp8UVpTqj2t/ZijXVuHlW9uiGLTgHW2XhEDM
	YJn3cWbYiEtKXhn+A3nvvxVHIWN/nrqgojBCMxttomZfVuUyECoyMq/5f8crUj97tVb
	IloOiTbMf+utaP+jKEIJAlKMNhM8yl+sbQoB5MXw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v1EM7u5hqAHYEg7vKGjLWzpyLs6ksy+GZlqladofubM=;
	b=H713XoUcEey+V9CiA9cgtDJ3M3nlHMDhpyDPvnLtRPTdCUdlQciL1drdRwN0fj+3
	COPGw7gmaS7TTwX0eCedK+qf9cWtGrekwhAk3KBrdwIbYCxW7oUV5GjnJPrLAxUrXrC
	1MmqtV1iUx4qBPnY3qBlp7IoiwEsNleuJXBwHHCk=
Content-Type: multipart/mixed; boundary="===============2440822062484242975=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.2 SUCCEEDED
Message-ID: <010101990c6ea529-984cc051-0107-4ce8-a7e0-25c024fcd2c5-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222817

--===============2440822062484242975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *babeltrace2* to *2.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-babeltrace2-upgrade-2.1.1-2.1.2.patch
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
From 956693ef3e28bb5b8d917a0912e3f1ba9a881af4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 20:57:39 +0000
Subject: [PATCH] babeltrace2: upgrade 2.1.1 -> 2.1.2

---
 ...ob_get_length-return-size_t-instead-.patch |  4 ++--
 ...001-Make-manpages-multilib-identical.patch |  6 ++----
 ...explicitly-only-build-shared-plugins.patch | 17 +++++++---------
 ...-fix-test-applications-in-cpp-common.patch |  5 +----
 ...sts-set-the-correct-plugin-directory.patch | 11 ++++------
 .../babeltrace2/external-python-tests.patch   | 20 ++++++++-----------
 ...eltrace2_2.1.1.bb => babeltrace2_2.1.2.bb} |  2 +-
 7 files changed, 25 insertions(+), 40 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.1.1.bb => babeltrace2_2.1.2.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
index 4dffa7bfa5..51013802aa 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -1,4 +1,4 @@
-From a73cef80a0d4129f74ab2e160a15693235aad4d1 Mon Sep 17 00:00:00 2001
+From fc8b3c757b4ecefbf66bd71123fcdbb3fd935df0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Mar 2025 18:10:08 -0700
 Subject: [PATCH] Cast result of bt_field_blob_get_length to size_t in
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/cpp-common/bt2/field.hpp b/src/cpp-common/bt2/field.hpp
-index 8b291f7a..3a7d30a4 100644
+index 8b291f7a1..3a7d30a4f 100644
 --- a/src/cpp-common/bt2/field.hpp
 +++ b/src/cpp-common/bt2/field.hpp
 @@ -1136,7 +1136,7 @@ public:
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
index c2b76b1ed5..61ac065a9d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From 395f7577e58592a9536712fedcbe74f754b7ce5c Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Mon, 9 Mar 2020 21:10:35 +0000
 Subject: [PATCH] Make manpages multilib identical
@@ -16,7 +16,7 @@ index 88fb13ce2..27858b720 100644
 --- a/doc/man/asciidoc-attrs.conf.in
 +++ b/doc/man/asciidoc-attrs.conf.in
 @@ -4,8 +4,8 @@
-
+ 
  [attributes]
  # default values
 -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
@@ -26,5 +26,3 @@ index 88fb13ce2..27858b720 100644
  babeltrace_version="@PACKAGE_VERSION@"
  enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
  defrdport=5344
--- 
-2.34.1
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-only-build-shared-plugins.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-only-build-shared-plugins.patch
index 7f8d5c7df3..1c8f323142 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-only-build-shared-plugins.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-only-build-shared-plugins.patch
@@ -1,4 +1,4 @@
-From 3f43a0554c73287973047b44ae5e196b7c995c60 Mon Sep 17 00:00:00 2001
+From 970166e6091ab48b15e13440a315b09b94218b76 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 21 Aug 2025 12:42:20 +0100
 Subject: [PATCH] src: explicitly only build shared plugins
@@ -17,10 +17,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 0567131b..7aa46b20 100644
+index e527c6817..b5d8758b0 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -619,7 +619,7 @@ nodist_EXTRA_python_plugin_provider_babeltrace2_python_plugin_provider_la_SOURCE
+@@ -614,7 +614,7 @@ nodist_EXTRA_python_plugin_provider_babeltrace2_python_plugin_provider_la_SOURCE
  python_plugin_provider_babeltrace2_python_plugin_provider_la_LDFLAGS = \
  	$(AM_LDFLAGS) \
  	$(LT_NO_UNDEFINED) \
@@ -29,7 +29,7 @@ index 0567131b..7aa46b20 100644
  	$(PYTHON_LDFLAGS)
  
  python_plugin_provider_babeltrace2_python_plugin_provider_la_CPPFLAGS = \
-@@ -669,7 +669,7 @@ plugins_utils_babeltrace_plugin_utils_la_SOURCES = \
+@@ -664,7 +664,7 @@ plugins_utils_babeltrace_plugin_utils_la_SOURCES = \
  plugins_utils_babeltrace_plugin_utils_la_LDFLAGS = \
  	$(AM_LDFLAGS) \
  	$(LT_NO_UNDEFINED) \
@@ -38,7 +38,7 @@ index 0567131b..7aa46b20 100644
  
  plugins_utils_babeltrace_plugin_utils_la_LIBADD = \
  	plugins/common/muxing/libmuxing.la
-@@ -775,7 +775,7 @@ plugins_ctf_babeltrace_plugin_ctf_la_SOURCES = \
+@@ -770,7 +770,7 @@ plugins_ctf_babeltrace_plugin_ctf_la_SOURCES = \
  plugins_ctf_babeltrace_plugin_ctf_la_LDFLAGS = \
  	$(AM_LDFLAGS) \
  	$(LT_NO_UNDEFINED) \
@@ -47,7 +47,7 @@ index 0567131b..7aa46b20 100644
  
  plugins_ctf_babeltrace_plugin_ctf_la_LIBADD = \
  	plugins/ctf/common/metadata/libctf-parser.la \
-@@ -816,7 +816,7 @@ plugins_text_babeltrace_plugin_text_la_SOURCES = \
+@@ -811,7 +811,7 @@ plugins_text_babeltrace_plugin_text_la_SOURCES = \
  plugins_text_babeltrace_plugin_text_la_LDFLAGS = \
  	$(AM_LDFLAGS) \
  	$(LT_NO_UNDEFINED) \
@@ -56,7 +56,7 @@ index 0567131b..7aa46b20 100644
  
  plugins_text_babeltrace_plugin_text_la_LIBADD =
  
-@@ -840,7 +840,7 @@ plugins_lttng_utils_babeltrace_plugin_lttng_utils_la_SOURCES = \
+@@ -835,7 +835,7 @@ plugins_lttng_utils_babeltrace_plugin_lttng_utils_la_SOURCES = \
  plugins_lttng_utils_babeltrace_plugin_lttng_utils_la_LDFLAGS = \
  	$(AM_LDFLAGS) \
  	$(LT_NO_UNDEFINED) \
@@ -65,6 +65,3 @@ index 0567131b..7aa46b20 100644
  	$(ELFUTILS_LIBS)
  
  plugins_lttng_utils_babeltrace_plugin_lttng_utils_la_LIBADD = \
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
index 87f94fb087..b99dd86f25 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -1,4 +1,4 @@
-From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From a22bb31e3db4bf29be11d5c49e47b8a94ecb03be Mon Sep 17 00:00:00 2001
 From: Bin Lan <bin.lan.cn@windriver.com>
 Date: Tue, 11 Mar 2025 17:19:11 +0800
 Subject: [PATCH] Tests: fix test applications in cpp-common are needed to
@@ -124,6 +124,3 @@ index 000000000..8c65daa94
 +source "$UTILSSH"
 +
 +"${BT_TESTS_BUILDDIR}/cpp-common/test-uuid" "$BT_TESTS_BT2_BIN"
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
index 7ac7582ad7..eb28697b94 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -1,11 +1,11 @@
-From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From 96e9604ef38d7e30b0bb3d289744fbd18275be1c Mon Sep 17 00:00:00 2001
 From: Bin Lan <bin.lan.cn@windriver.com>
 Date: Wed, 5 Mar 2025 10:51:11 +0800
 Subject: [PATCH] tests: set the correct directory of plugin shared library
 
-The plugin shared libraries are put in test-plugins-plugins/.libs when 
-building in a host. test-plugins-plugins/.libs is not exist when cross 
-build. The plugin shared libraries are put in test-plugins-plugins 
+The plugin shared libraries are put in test-plugins-plugins/.libs when
+building in a host. test-plugins-plugins/.libs is not exist when cross
+build. The plugin shared libraries are put in test-plugins-plugins
 directory when cross build.
 
 Upstream-Status: Inappropriate [oe specific]
@@ -25,6 +25,3 @@ index f83e42baa..939236393 100755
  
 -"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
 +"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
index 960b33d959..3c88dd3ad2 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
@@ -1,7 +1,7 @@
-From d2f528aa09a9001e63710470f6b700d122494961 Mon Sep 17 00:00:00 2001
+From 8571cb1ddcc66310f8cc2290290b67d4bb908a09 Mon Sep 17 00:00:00 2001
 From: Michael Jeanson <mjeanson@efficios.com>
 Date: Thu, 14 Aug 2025 12:27:16 -0400
-Subject: [PATCH babeltrace] bindings/python: Allow tests to be run externally
+Subject: [PATCH] bindings/python: Allow tests to be run externally
 
 Upstream doesn't officially support running their tests externally. The python
 bindings need some tweaks to work in this configuration.
@@ -13,13 +13,12 @@ Upstream-Status: Inappropriate [oe specific]
 
 Change-Id: I89555a3fbd821baa7088acc154e81665102286b8
 ---
- .../python/bt2/test_component_descriptor.py   |   2 +-
- tests/bindings/python/bt2/test_graph.py       |   2 +-
- tests/bindings/python/bt2/test_plugin.py      |  10 +-
- .../python/bt2/test_query_executor.py         |   2 +-
- tests/utils/utils.sh                          |   2 +-
- 6 files changed, 117 insertions(+), 9 deletions(-)
- create mode 100644 tests/0001-wip-tests-yocto.patch
+ tests/bindings/python/bt2/test_component_descriptor.py |  2 +-
+ tests/bindings/python/bt2/test_graph.py                |  2 +-
+ tests/bindings/python/bt2/test_plugin.py               | 10 +++++-----
+ tests/bindings/python/bt2/test_query_executor.py       |  2 +-
+ tests/utils/utils.sh                                   |  2 +-
+ 5 files changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/tests/bindings/python/bt2/test_component_descriptor.py b/tests/bindings/python/bt2/test_component_descriptor.py
 index dcad514eb..49a3c054d 100644
@@ -121,6 +120,3 @@ index 28db595d1..05b87f64e 100644
  
  # Colon-separated list of project plugin paths, if not set
  _bt_tests_set_var_def BT_TESTS_BABELTRACE_PLUGIN_PATH \
--- 
-2.47.2
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
index 945f82ef34..b0cd6efde1 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
            file://external-python-tests.patch \
            file://0001-src-explicitly-only-build-shared-plugins.patch \
            "
-SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
+SRCREV = "d0e946a71faf5f0c2d7f1fb5b92a369983e9cf10"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 inherit autotools pkgconfig ptest setuptools3-base
-- 
2.47.1


--===============2440822062484242975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 76776664 to 76779104 (+0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 424839 to 425589 (+0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2 /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 25535983 to 25532017 (-0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2: PKGSIZE changed from 5005556 to 4984886 (-0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2: SRC_URI changed from "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.1 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch file://external-python-tests.patch file://0001-src-explicitly-only-build-shared-plugins.patch" to "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.2 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch file://external-python-tests.patch file://0001-src-explicitly-only-build-shared-plugins.patch"
Changes to packages/x86-64-v3-poky-linux/babeltrace2 (sysroot):
  /usr/lib/python3.13/site-packages/bt2-2.1.1-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/bt2-2.1.2-py3.13.egg-info

--===============2440822062484242975==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.1.1-2.1.2.patch"

RnJvbSA5NTY2OTNlZjNlMjhiYjViOGQ5MTdhMDkxMmUzZjFiYTlhODgxYWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMDo1NzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
YmVsdHJhY2UyOiB1cGdyYWRlIDIuMS4xIC0+IDIuMS4yCgotLS0KIC4uLm9iX2dldF9sZW5ndGgt
cmV0dXJuLXNpemVfdC1pbnN0ZWFkLS5wYXRjaCB8ICA0ICsrLS0KIC4uLjAwMS1NYWtlLW1hbnBh
Z2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaCB8ICA2ICsrLS0tLQogLi4uZXhwbGljaXRseS1v
bmx5LWJ1aWxkLXNoYXJlZC1wbHVnaW5zLnBhdGNoIHwgMTcgKysrKysrKy0tLS0tLS0tLQogLi4u
LWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoIHwgIDUgKy0tLS0KIC4u
LnN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVjdG9yeS5wYXRjaCB8IDExICsrKystLS0t
LS0KIC4uLi9iYWJlbHRyYWNlMi9leHRlcm5hbC1weXRob24tdGVzdHMucGF0Y2ggICB8IDIwICsr
KysrKysrLS0tLS0tLS0tLS0KIC4uLmVsdHJhY2UyXzIuMS4xLmJiID0+IGJhYmVsdHJhY2UyXzIu
MS4yLmJifSB8ICAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQwIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcve2JhYmVsdHJhY2Uy
XzIuMS4xLmJiID0+IGJhYmVsdHJhY2UyXzIuMS4yLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtlLWJ0X2ZpZWxkX2Js
b2JfZ2V0X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQtLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtYnRfZmllbGRfYmxvYl9nZXRfbGVu
Z3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2gKaW5kZXggNGRmZmE3YmZhNS4uNTEwMTM4
MDJhYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8w
MDAxLU1ha2UtYnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1h
a2UtYnRfZmllbGRfYmxvYl9nZXRfbGVuZ3RoLXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGE3M2NlZjgwYTBkNDEyOWY3NGFiMmUxNjBhMTU2OTMyMzVh
YWQ0ZDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZjOGIzYzc1N2I0ZWNlZmJmNjZi
ZDcxMTIzZmNkYmIzZmQ5MzVkZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBNYXIgMjAyNSAxODoxMDow
OCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBDYXN0IHJlc3VsdCBvZiBidF9maWVsZF9ibG9iX2dl
dF9sZW5ndGggdG8gc2l6ZV90IGluCkBAIC0yNCw3ICsyNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvY3BwLWNvbW1vbi9idDIvZmll
bGQuaHBwIGIvc3JjL2NwcC1jb21tb24vYnQyL2ZpZWxkLmhwcAotaW5kZXggOGIyOTFmN2EuLjNh
N2QzMGE0IDEwMDY0NAoraW5kZXggOGIyOTFmN2ExLi4zYTdkMzBhNGYgMTAwNjQ0CiAtLS0gYS9z
cmMvY3BwLWNvbW1vbi9idDIvZmllbGQuaHBwCiArKysgYi9zcmMvY3BwLWNvbW1vbi9idDIvZmll
bGQuaHBwCiBAQCAtMTEzNiw3ICsxMTM2LDcgQEAgcHVibGljOgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFucGFnZXMtbXVsdGls
aWItaWRlbnRpY2FsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNl
Mi8wMDAxLU1ha2UtbWFucGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoCmluZGV4IGMyYjc2
YjFlZDUuLjYxYWMwNjVhOWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
YmFiZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1tYW5w
YWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2OTg2
MTkwZTRiMGMxMDk0NWNlNmFhYTdjYTEwZDZiZDhhMjZhMzkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDM5NWY3NTc3ZTU4NTkyYTk1MzY3MTJmZWRjYmU3NGY3NTRiN2NlNWMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3Rh
LmNvbT4KIERhdGU6IE1vbiwgOSBNYXIgMjAyMCAyMToxMDozNSArMDAwMAogU3ViamVjdDogW1BB
VENIXSBNYWtlIG1hbnBhZ2VzIG11bHRpbGliIGlkZW50aWNhbApAQCAtMTYsNyArMTYsNyBAQCBp
bmRleCA4OGZiMTNjZTIuLjI3ODU4YjcyMCAxMDA2NDQKIC0tLSBhL2RvYy9tYW4vYXNjaWlkb2Mt
YXR0cnMuY29uZi5pbgogKysrIGIvZG9jL21hbi9hc2NpaWRvYy1hdHRycy5jb25mLmluCiBAQCAt
NCw4ICs0LDggQEAKLQorIAogIFthdHRyaWJ1dGVzXQogICMgZGVmYXVsdCB2YWx1ZXMKIC1zeXN0
ZW1fcGx1Z2luX3BhdGg9IkBMSUJESVJAL2JhYmVsdHJhY2UyL3BsdWdpbnMiCkBAIC0yNiw1ICsy
NiwzIEBAIGluZGV4IDg4ZmIxM2NlMi4uMjc4NThiNzIwIDEwMDY0NAogIGJhYmVsdHJhY2VfdmVy
c2lvbj0iQFBBQ0tBR0VfVkVSU0lPTkAiCiAgZW5hYmxlX2RlYnVnX2luZm89IkBFTkFCTEVfREVC
VUdfSU5GT19WQUxAIgogIGRlZnJkcG9ydD01MzQ0Ci0tLSAKLTIuMzQuMQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXNyYy1leHBsaWNpdGx5
LW9ubHktYnVpbGQtc2hhcmVkLXBsdWdpbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2JhYmVsdHJhY2UyLzAwMDEtc3JjLWV4cGxpY2l0bHktb25seS1idWlsZC1zaGFyZWQtcGx1
Z2lucy5wYXRjaAppbmRleCA3ZjhkNWM3ZGYzLi4xYzhmMzIzMTQyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtc3JjLWV4cGxpY2l0bHktb25s
eS1idWlsZC1zaGFyZWQtcGx1Z2lucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2JhYmVsdHJhY2UyLzAwMDEtc3JjLWV4cGxpY2l0bHktb25seS1idWlsZC1zaGFyZWQtcGx1
Z2lucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2Y0M2EwNTU0YzczMjg3OTczMDQ3YjQ0
YWU1ZTE5NmI3Yzk5NWM2MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTcwMTY2ZTYw
OTFhYjQ4YjE1ZTEzNDQwYTMxNWIwOWI5NDIxOGI3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVGh1LCAyMSBB
dWcgMjAyNSAxMjo0MjoyMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBzcmM6IGV4cGxpY2l0bHkg
b25seSBidWlsZCBzaGFyZWQgcGx1Z2lucwpAQCAtMTcsMTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvTWFrZWZp
bGUuYW0gYi9zcmMvTWFrZWZpbGUuYW0KLWluZGV4IDA1NjcxMzFiLi43YWE0NmIyMCAxMDA2NDQK
K2luZGV4IGU1MjdjNjgxNy4uYjVkODc1OGIwIDEwMDY0NAogLS0tIGEvc3JjL01ha2VmaWxlLmFt
CiArKysgYi9zcmMvTWFrZWZpbGUuYW0KLUBAIC02MTksNyArNjE5LDcgQEAgbm9kaXN0X0VYVFJB
X3B5dGhvbl9wbHVnaW5fcHJvdmlkZXJfYmFiZWx0cmFjZTJfcHl0aG9uX3BsdWdpbl9wcm92aWRl
cl9sYV9TT1VSQ0UKK0BAIC02MTQsNyArNjE0LDcgQEAgbm9kaXN0X0VYVFJBX3B5dGhvbl9wbHVn
aW5fcHJvdmlkZXJfYmFiZWx0cmFjZTJfcHl0aG9uX3BsdWdpbl9wcm92aWRlcl9sYV9TT1VSQ0UK
ICBweXRob25fcGx1Z2luX3Byb3ZpZGVyX2JhYmVsdHJhY2UyX3B5dGhvbl9wbHVnaW5fcHJvdmlk
ZXJfbGFfTERGTEFHUyA9IFwKICAJJChBTV9MREZMQUdTKSBcCiAgCSQoTFRfTk9fVU5ERUZJTkVE
KSBcCkBAIC0yOSw3ICsyOSw3IEBAIGluZGV4IDA1NjcxMzFiLi43YWE0NmIyMCAxMDA2NDQKICAJ
JChQWVRIT05fTERGTEFHUykKICAKICBweXRob25fcGx1Z2luX3Byb3ZpZGVyX2JhYmVsdHJhY2Uy
X3B5dGhvbl9wbHVnaW5fcHJvdmlkZXJfbGFfQ1BQRkxBR1MgPSBcCi1AQCAtNjY5LDcgKzY2OSw3
IEBAIHBsdWdpbnNfdXRpbHNfYmFiZWx0cmFjZV9wbHVnaW5fdXRpbHNfbGFfU09VUkNFUyA9IFwK
K0BAIC02NjQsNyArNjY0LDcgQEAgcGx1Z2luc191dGlsc19iYWJlbHRyYWNlX3BsdWdpbl91dGls
c19sYV9TT1VSQ0VTID0gXAogIHBsdWdpbnNfdXRpbHNfYmFiZWx0cmFjZV9wbHVnaW5fdXRpbHNf
bGFfTERGTEFHUyA9IFwKICAJJChBTV9MREZMQUdTKSBcCiAgCSQoTFRfTk9fVU5ERUZJTkVEKSBc
CkBAIC0zOCw3ICszOCw3IEBAIGluZGV4IDA1NjcxMzFiLi43YWE0NmIyMCAxMDA2NDQKICAKICBw
bHVnaW5zX3V0aWxzX2JhYmVsdHJhY2VfcGx1Z2luX3V0aWxzX2xhX0xJQkFERCA9IFwKICAJcGx1
Z2lucy9jb21tb24vbXV4aW5nL2xpYm11eGluZy5sYQotQEAgLTc3NSw3ICs3NzUsNyBAQCBwbHVn
aW5zX2N0Zl9iYWJlbHRyYWNlX3BsdWdpbl9jdGZfbGFfU09VUkNFUyA9IFwKK0BAIC03NzAsNyAr
NzcwLDcgQEAgcGx1Z2luc19jdGZfYmFiZWx0cmFjZV9wbHVnaW5fY3RmX2xhX1NPVVJDRVMgPSBc
CiAgcGx1Z2luc19jdGZfYmFiZWx0cmFjZV9wbHVnaW5fY3RmX2xhX0xERkxBR1MgPSBcCiAgCSQo
QU1fTERGTEFHUykgXAogIAkkKExUX05PX1VOREVGSU5FRCkgXApAQCAtNDcsNyArNDcsNyBAQCBp
bmRleCAwNTY3MTMxYi4uN2FhNDZiMjAgMTAwNjQ0CiAgCiAgcGx1Z2luc19jdGZfYmFiZWx0cmFj
ZV9wbHVnaW5fY3RmX2xhX0xJQkFERCA9IFwKICAJcGx1Z2lucy9jdGYvY29tbW9uL21ldGFkYXRh
L2xpYmN0Zi1wYXJzZXIubGEgXAotQEAgLTgxNiw3ICs4MTYsNyBAQCBwbHVnaW5zX3RleHRfYmFi
ZWx0cmFjZV9wbHVnaW5fdGV4dF9sYV9TT1VSQ0VTID0gXAorQEAgLTgxMSw3ICs4MTEsNyBAQCBw
bHVnaW5zX3RleHRfYmFiZWx0cmFjZV9wbHVnaW5fdGV4dF9sYV9TT1VSQ0VTID0gXAogIHBsdWdp
bnNfdGV4dF9iYWJlbHRyYWNlX3BsdWdpbl90ZXh0X2xhX0xERkxBR1MgPSBcCiAgCSQoQU1fTERG
TEFHUykgXAogIAkkKExUX05PX1VOREVGSU5FRCkgXApAQCAtNTYsNyArNTYsNyBAQCBpbmRleCAw
NTY3MTMxYi4uN2FhNDZiMjAgMTAwNjQ0CiAgCiAgcGx1Z2luc190ZXh0X2JhYmVsdHJhY2VfcGx1
Z2luX3RleHRfbGFfTElCQUREID0KICAKLUBAIC04NDAsNyArODQwLDcgQEAgcGx1Z2luc19sdHRu
Z191dGlsc19iYWJlbHRyYWNlX3BsdWdpbl9sdHRuZ191dGlsc19sYV9TT1VSQ0VTID0gXAorQEAg
LTgzNSw3ICs4MzUsNyBAQCBwbHVnaW5zX2x0dG5nX3V0aWxzX2JhYmVsdHJhY2VfcGx1Z2luX2x0
dG5nX3V0aWxzX2xhX1NPVVJDRVMgPSBcCiAgcGx1Z2luc19sdHRuZ191dGlsc19iYWJlbHRyYWNl
X3BsdWdpbl9sdHRuZ191dGlsc19sYV9MREZMQUdTID0gXAogIAkkKEFNX0xERkxBR1MpIFwKICAJ
JChMVF9OT19VTkRFRklORUQpIFwKQEAgLTY1LDYgKzY1LDMgQEAgaW5kZXggMDU2NzEzMWIuLjdh
YTQ2YjIwIDEwMDY0NAogIAkkKEVMRlVUSUxTX0xJQlMpCiAgCiAgcGx1Z2luc19sdHRuZ191dGls
c19iYWJlbHRyYWNlX3BsdWdpbl9sdHRuZ191dGlsc19sYV9MSUJBREQgPSBcCi0tLSAKLTIuNDMu
MAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAw
MDEtdGVzdHMtZml4LXRlc3QtYXBwbGljYXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2ggYi9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZml4LXRlc3QtYXBw
bGljYXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2gKaW5kZXggODdmOTRmYjA4Ny4uYjk5ZGQ4NmYy
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAx
LXRlc3RzLWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1maXgtdGVzdC1h
cHBsaWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWRj
ODFmMjcyODU1ZDk0ZTZhNzhmN2QxMGVhOTUyNzQ1ZDk5MWFhOSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gYTIyYmIzMWUzZGI0YmYyOWJlMTFkNWM0OWU0N2I4YTk0ZWNiMDNiZSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEJpbiBMYW4gPGJpbi5sYW4uY25Ad2luZHJpdmVy
LmNvbT4KIERhdGU6IFR1ZSwgMTEgTWFyIDIwMjUgMTc6MTk6MTEgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gVGVzdHM6IGZpeCB0ZXN0IGFwcGxpY2F0aW9ucyBpbiBjcHAtY29tbW9uIGFyZSBuZWVk
ZWQgdG8KQEAgLTEyNCw2ICsxMjQsMyBAQCBpbmRleCAwMDAwMDAwMDAuLjhjNjVkYWE5NAogK3Nv
dXJjZSAiJFVUSUxTU0giCiArCiArIiR7QlRfVEVTVFNfQlVJTERESVJ9L2NwcC1jb21tb24vdGVz
dC11dWlkIiAiJEJUX1RFU1RTX0JUMl9CSU4iCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtc2V0LXRoZS1j
b3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5n
L2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtc2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3Rvcnku
cGF0Y2gKaW5kZXggN2FjNzU4MmFkNy4uZWIyODY5N2I5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLXNldC10aGUtY29ycmVjdC1w
bHVnaW4tZGlyZWN0b3J5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFi
ZWx0cmFjZTIvMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3QtcGx1Z2luLWRpcmVjdG9yeS5wYXRj
aApAQCAtMSwxMSArMSwxMSBAQAotRnJvbSAzMjQ5NGIxNzI2YTg4MTg4M2NiNmQzMTdhYjc2ZDFl
YzNmMWZhNzQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NmU5NjA0ZWYzOGQ3ZTMw
YjBiYjNkMjg5NzQ0ZmJkMTgyNzViZTFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QmluIExhbiA8YmluLmxhbi5jbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA1IE1hciAyMDI1
IDEwOjUxOjExICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBzZXQgdGhlIGNvcnJlY3Qg
ZGlyZWN0b3J5IG9mIHBsdWdpbiBzaGFyZWQgbGlicmFyeQogCi1UaGUgcGx1Z2luIHNoYXJlZCBs
aWJyYXJpZXMgYXJlIHB1dCBpbiB0ZXN0LXBsdWdpbnMtcGx1Z2lucy8ubGlicyB3aGVuIAotYnVp
bGRpbmcgaW4gYSBob3N0LiB0ZXN0LXBsdWdpbnMtcGx1Z2lucy8ubGlicyBpcyBub3QgZXhpc3Qg
d2hlbiBjcm9zcyAKLWJ1aWxkLiBUaGUgcGx1Z2luIHNoYXJlZCBsaWJyYXJpZXMgYXJlIHB1dCBp
biB0ZXN0LXBsdWdpbnMtcGx1Z2lucyAKK1RoZSBwbHVnaW4gc2hhcmVkIGxpYnJhcmllcyBhcmUg
cHV0IGluIHRlc3QtcGx1Z2lucy1wbHVnaW5zLy5saWJzIHdoZW4KK2J1aWxkaW5nIGluIGEgaG9z
dC4gdGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgaXMgbm90IGV4aXN0IHdoZW4gY3Jvc3MKK2J1
aWxkLiBUaGUgcGx1Z2luIHNoYXJlZCBsaWJyYXJpZXMgYXJlIHB1dCBpbiB0ZXN0LXBsdWdpbnMt
cGx1Z2lucwogZGlyZWN0b3J5IHdoZW4gY3Jvc3MgYnVpbGQuCiAKIFVwc3RyZWFtLVN0YXR1czog
SW5hcHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNdCkBAIC0yNSw2ICsyNSwzIEBAIGluZGV4IGY4M2U0
MmJhYS4uOTM5MjM2MzkzIDEwMDc1NQogIAogLSIke0JUX1RFU1RTX0JVSUxERElSfS9saWIvdGVz
dC1wbHVnaW5zIiAiJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucy1wbHVnaW5z
Ly5saWJzIgogKyIke0JUX1RFU1RTX0JVSUxERElSfS9saWIvdGVzdC1wbHVnaW5zIiAiJHtCVF9U
RVNUU19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucy1wbHVnaW5zIgotLS0gCi0yLjM0LjEKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi9leHRlcm5h
bC1weXRob24tdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJh
Y2UyL2V4dGVybmFsLXB5dGhvbi10ZXN0cy5wYXRjaAppbmRleCA5NjBiMzNkOTU5Li4zYzg4ZGQz
YWQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyL2V4
dGVybmFsLXB5dGhvbi10ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5n
L2JhYmVsdHJhY2UyL2V4dGVybmFsLXB5dGhvbi10ZXN0cy5wYXRjaApAQCAtMSw3ICsxLDcgQEAK
LUZyb20gZDJmNTI4YWEwOWE5MDAxZTYzNzEwNDcwZjZiNzAwZDEyMjQ5NDk2MSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gODU3MWNiMWRkY2M2NjMxMGY4Y2MyMjkwMjkwYjY3ZDRiYjkw
OGEwOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pY2hhZWwgSmVhbnNvbiA8bWpl
YW5zb25AZWZmaWNpb3MuY29tPgogRGF0ZTogVGh1LCAxNCBBdWcgMjAyNSAxMjoyNzoxNiAtMDQw
MAotU3ViamVjdDogW1BBVENIIGJhYmVsdHJhY2VdIGJpbmRpbmdzL3B5dGhvbjogQWxsb3cgdGVz
dHMgdG8gYmUgcnVuIGV4dGVybmFsbHkKK1N1YmplY3Q6IFtQQVRDSF0gYmluZGluZ3MvcHl0aG9u
OiBBbGxvdyB0ZXN0cyB0byBiZSBydW4gZXh0ZXJuYWxseQogCiBVcHN0cmVhbSBkb2Vzbid0IG9m
ZmljaWFsbHkgc3VwcG9ydCBydW5uaW5nIHRoZWlyIHRlc3RzIGV4dGVybmFsbHkuIFRoZSBweXRo
b24KIGJpbmRpbmdzIG5lZWQgc29tZSB0d2Vha3MgdG8gd29yayBpbiB0aGlzIGNvbmZpZ3VyYXRp
b24uCkBAIC0xMywxMyArMTMsMTIgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtv
ZSBzcGVjaWZpY10KIAogQ2hhbmdlLUlkOiBJODk1NTVhM2ZiZDgyMWJhYTcwODhhY2MxNTRlODE2
NjUxMDIyODZiOAogLS0tCi0gLi4uL3B5dGhvbi9idDIvdGVzdF9jb21wb25lbnRfZGVzY3JpcHRv
ci5weSAgIHwgICAyICstCi0gdGVzdHMvYmluZGluZ3MvcHl0aG9uL2J0Mi90ZXN0X2dyYXBoLnB5
ICAgICAgIHwgICAyICstCi0gdGVzdHMvYmluZGluZ3MvcHl0aG9uL2J0Mi90ZXN0X3BsdWdpbi5w
eSAgICAgIHwgIDEwICstCi0gLi4uL3B5dGhvbi9idDIvdGVzdF9xdWVyeV9leGVjdXRvci5weSAg
ICAgICAgIHwgICAyICstCi0gdGVzdHMvdXRpbHMvdXRpbHMuc2ggICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICstCi0gNiBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKLSBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvMDAwMS13aXAtdGVzdHMteW9j
dG8ucGF0Y2gKKyB0ZXN0cy9iaW5kaW5ncy9weXRob24vYnQyL3Rlc3RfY29tcG9uZW50X2Rlc2Ny
aXB0b3IucHkgfCAgMiArLQorIHRlc3RzL2JpbmRpbmdzL3B5dGhvbi9idDIvdGVzdF9ncmFwaC5w
eSAgICAgICAgICAgICAgICB8ICAyICstCisgdGVzdHMvYmluZGluZ3MvcHl0aG9uL2J0Mi90ZXN0
X3BsdWdpbi5weSAgICAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQorIHRlc3RzL2JpbmRpbmdz
L3B5dGhvbi9idDIvdGVzdF9xdWVyeV9leGVjdXRvci5weSAgICAgICB8ICAyICstCisgdGVzdHMv
dXRpbHMvdXRpbHMuc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
KyA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL3Rlc3RzL2JpbmRpbmdzL3B5dGhvbi9idDIvdGVzdF9jb21wb25lbnRfZGVzY3Jp
cHRvci5weSBiL3Rlc3RzL2JpbmRpbmdzL3B5dGhvbi9idDIvdGVzdF9jb21wb25lbnRfZGVzY3Jp
cHRvci5weQogaW5kZXggZGNhZDUxNGViLi40OWEzYzA1NGQgMTAwNjQ0CkBAIC0xMjEsNiArMTIw
LDMgQEAgaW5kZXggMjhkYjU5NWQxLi4wNWI4N2Y2NGUgMTAwNjQ0CiAgCiAgIyBDb2xvbi1zZXBh
cmF0ZWQgbGlzdCBvZiBwcm9qZWN0IHBsdWdpbiBwYXRocywgaWYgbm90IHNldAogIF9idF90ZXN0
c19zZXRfdmFyX2RlZiBCVF9URVNUU19CQUJFTFRSQUNFX1BMVUdJTl9QQVRIIFwKLS0tIAotMi40
Ny4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJf
Mi4xLjEuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcvYmFiZWx0cmFjZTJfMi4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcvYmFiZWx0cmFjZTJfMi4xLjIuYmIKaW5kZXggOTQ1ZjgyZWYzNC4uYjBjZDZlZmRlMSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjEuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIuMS4yLmJiCkBAIC0x
Niw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LmVmZmljaW9zLmNvbS9iYWJlbHRyYWNl
LmdpdDticmFuY2g9c3RhYmxlLTIuMTtwcm90b2NvbD1odHRwCiAgICAgICAgICAgIGZpbGU6Ly9l
eHRlcm5hbC1weXRob24tdGVzdHMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1zcmMt
ZXhwbGljaXRseS1vbmx5LWJ1aWxkLXNoYXJlZC1wbHVnaW5zLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDUkVWID0gIjdmMmY4Y2Q2ZGFjNDk3Y2JiNDY2ZWZiMzEyMTliNTMxYzYyMDEzZjUiCitT
UkNSRVYgPSAiZDBlOTQ2YTcxZmFmNWYwYzJkN2YxZmI1YjkyYTM2OTk4M2U5Y2YxMCIKIFVQU1RS
RUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj4yKFwuXGQrKSspJCIKIAogaW5oZXJp
dCBhdXRvdG9vbHMgcGtnY29uZmlnIHB0ZXN0IHNldHVwdG9vbHMzLWJhc2UKLS0gCjIuNDcuMQoK

--===============2440822062484242975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2 /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx"
Changes to packages/x86-64-v3-poky-linux/babeltrace2 (sysroot):
  /usr/lib/python3.13/site-packages/bt2-2.1.1-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/bt2-2.1.2-py3.13.egg-info

--===============2440822062484242975==--

