Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB47CCD18E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30912.1757937272588024136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=msIekYSY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YznVdo5n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101994d3a530b-a6228801-2661-4b12-8201-9d83722cbfa3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AgTmzVqSZHlbFc8dzmnOL1X18bsEJ8xZmeNRvNx7XpM=;
	b=msIekYSYYabVe+7rYeBSikSzrnCZWJyY4YVRNGcFfiLwlZJOvlnw9dfQT7amDtQt
	HRZ6mZ0Il82pZKidKnOJLFxg3GsJUmGoRTxRvroc+bnA2e7yvmRhQUqmTFAB4JWWWfn
	SwepiNh0/ydGtgnvs3t+d9l8/ra8bUoTbbw3P9iE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AgTmzVqSZHlbFc8dzmnOL1X18bsEJ8xZmeNRvNx7XpM=;
	b=YznVdo5nGB9rYt0vIxSs8HAfdRkBeNWAdyD4oLmRQIx2KqH+QzW35wVLlq4YxAfd
	T8X11kx991fFcHQ/9HdkpZgE/WVGpemtKqIRRFgYt6VqOO9LRSdDhbFm9m8wgOa2fiD
	W6tguj2g4Y2G+PkOpZ3pN7PS79r1/0jDaJ8hErus=
Content-Type: multipart/mixed; boundary="===============4398412015168819950=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.2 SUCCEEDED
Message-ID: <010101994d3a530b-a6228801-2661-4b12-8201-9d83722cbfa3-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223460

--===============4398412015168819950==
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
From a055416f1e953538501509b701a2a67f0f53417a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 10:49:30 +0000
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
index 4dffa7bfa5..dcab6e101c 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -1,4 +1,4 @@
-From a73cef80a0d4129f74ab2e160a15693235aad4d1 Mon Sep 17 00:00:00 2001
+From a35a3bec93e05aa4850a1d718ee93a869acb6b4c Mon Sep 17 00:00:00 2001
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
index c2b76b1ed5..a6e4663f11 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -1,4 +1,4 @@
-From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From d10e2748492e294a9238cc3bd9cf8c398e8df020 Mon Sep 17 00:00:00 2001
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
index 7f8d5c7df3..cf25165a79 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-only-build-shared-plugins.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-src-explicitly-only-build-shared-plugins.patch
@@ -1,4 +1,4 @@
-From 3f43a0554c73287973047b44ae5e196b7c995c60 Mon Sep 17 00:00:00 2001
+From f272cffc672e5503b74984a272fac051ee2ef09b Mon Sep 17 00:00:00 2001
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
index 87f94fb087..8ca88b7521 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
@@ -1,4 +1,4 @@
-From 1dc81f272855d94e6a78f7d10ea952745d991aa9 Mon Sep 17 00:00:00 2001
+From 2e733901de561f2de7af811b44e4fe467a4698c1 Mon Sep 17 00:00:00 2001
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
index 7ac7582ad7..aa6fa38064 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
@@ -1,11 +1,11 @@
-From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
+From 7f6e5f2b30501732bcbc5ccdc3a60520594fb82e Mon Sep 17 00:00:00 2001
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
index 960b33d959..e9368467d5 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
@@ -1,7 +1,7 @@
-From d2f528aa09a9001e63710470f6b700d122494961 Mon Sep 17 00:00:00 2001
+From 7f86ecb43b521f477900f3e988a9a1e625200e86 Mon Sep 17 00:00:00 2001
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


--===============4398412015168819950==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.1.1-2.1.2.patch"

RnJvbSBhMDU1NDE2ZjFlOTUzNTM4NTAxNTA5YjcwMWEyYTY3ZjBmNTM0MTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTA6NDk6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YWJlbHRyYWNlMjogdXBncmFkZSAyLjEuMSAtPiAyLjEuMgoKLS0tCiAuLi5vYl9nZXRfbGVuZ3Ro
LXJldHVybi1zaXplX3QtaW5zdGVhZC0ucGF0Y2ggfCAgNCArKy0tCiAuLi4wMDEtTWFrZS1tYW5w
YWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2ggfCAgNiArKy0tLS0KIC4uLmV4cGxpY2l0bHkt
b25seS1idWlsZC1zaGFyZWQtcGx1Z2lucy5wYXRjaCB8IDE3ICsrKysrKystLS0tLS0tLS0KIC4u
Li1maXgtdGVzdC1hcHBsaWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaCB8ICA1ICstLS0tCiAu
Li5zdHMtc2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0Y2ggfCAxMSArKysrLS0t
LS0tCiAuLi4vYmFiZWx0cmFjZTIvZXh0ZXJuYWwtcHl0aG9uLXRlc3RzLnBhdGNoICAgfCAyMCAr
KysrKysrKy0tLS0tLS0tLS0tCiAuLi5lbHRyYWNlMl8yLjEuMS5iYiA9PiBiYWJlbHRyYWNlMl8y
LjEuMi5iYn0gfCAgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA0MCBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL3tiYWJlbHRyYWNl
Ml8yLjEuMS5iYiA9PiBiYWJlbHRyYWNlMl8yLjEuMi5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1idF9maWVsZF9i
bG9iX2dldF9sZW5ndGgtcmV0dXJuLXNpemVfdC1pbnN0ZWFkLS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtlLWJ0X2ZpZWxkX2Jsb2JfZ2V0X2xl
bmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQtLnBhdGNoCmluZGV4IDRkZmZhN2JmYTUuLmRjYWI2
ZTEwMWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIv
MDAwMS1NYWtlLWJ0X2ZpZWxkX2Jsb2JfZ2V0X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQt
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1N
YWtlLWJ0X2ZpZWxkX2Jsb2JfZ2V0X2xlbmd0aC1yZXR1cm4tc2l6ZV90LWluc3RlYWQtLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNzNjZWY4MGEwZDQxMjlmNzRhYjJlMTYwYTE1NjkzMjM1
YWFkNGQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMzVhM2JlYzkzZTA1YWE0ODUw
YTFkNzE4ZWU5M2E4NjlhY2I2YjRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjAgTWFyIDIwMjUgMTg6MTA6
MDggLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ2FzdCByZXN1bHQgb2YgYnRfZmllbGRfYmxvYl9n
ZXRfbGVuZ3RoIHRvIHNpemVfdCBpbgpAQCAtMjQsNyArMjQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2NwcC1jb21tb24vYnQyL2Zp
ZWxkLmhwcCBiL3NyYy9jcHAtY29tbW9uL2J0Mi9maWVsZC5ocHAKLWluZGV4IDhiMjkxZjdhLi4z
YTdkMzBhNCAxMDA2NDQKK2luZGV4IDhiMjkxZjdhMS4uM2E3ZDMwYTRmIDEwMDY0NAogLS0tIGEv
c3JjL2NwcC1jb21tb24vYnQyL2ZpZWxkLmhwcAogKysrIGIvc3JjL2NwcC1jb21tb24vYnQyL2Zp
ZWxkLmhwcAogQEAgLTExMzYsNyArMTEzNiw3IEBAIHB1YmxpYzoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRp
bGliLWlkZW50aWNhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFj
ZTIvMDAwMS1NYWtlLW1hbnBhZ2VzLW11bHRpbGliLWlkZW50aWNhbC5wYXRjaAppbmRleCBjMmI3
NmIxZWQ1Li5hNmU0NjYzZjExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5n
L2JhYmVsdHJhY2UyLzAwMDEtTWFrZS1tYW5wYWdlcy1tdWx0aWxpYi1pZGVudGljYWwucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLU1ha2UtbWFu
cGFnZXMtbXVsdGlsaWItaWRlbnRpY2FsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1Njk4
NjE5MGU0YjBjMTA5NDVjZTZhYWE3Y2ExMGQ2YmQ4YTI2YTM5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBkMTBlMjc0ODQ5MmUyOTRhOTIzOGNjM2JkOWNmOGMzOThlOGRmMDIwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0
YS5jb20+CiBEYXRlOiBNb24sIDkgTWFyIDIwMjAgMjE6MTA6MzUgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gTWFrZSBtYW5wYWdlcyBtdWx0aWxpYiBpZGVudGljYWwKQEAgLTE2LDcgKzE2LDcgQEAg
aW5kZXggODhmYjEzY2UyLi4yNzg1OGI3MjAgMTAwNjQ0CiAtLS0gYS9kb2MvbWFuL2FzY2lpZG9j
LWF0dHJzLmNvbmYuaW4KICsrKyBiL2RvYy9tYW4vYXNjaWlkb2MtYXR0cnMuY29uZi5pbgogQEAg
LTQsOCArNCw4IEBACi0KKyAKICBbYXR0cmlidXRlc10KICAjIGRlZmF1bHQgdmFsdWVzCiAtc3lz
dGVtX3BsdWdpbl9wYXRoPSJATElCRElSQC9iYWJlbHRyYWNlMi9wbHVnaW5zIgpAQCAtMjYsNSAr
MjYsMyBAQCBpbmRleCA4OGZiMTNjZTIuLjI3ODU4YjcyMCAxMDA2NDQKICBiYWJlbHRyYWNlX3Zl
cnNpb249IkBQQUNLQUdFX1ZFUlNJT05AIgogIGVuYWJsZV9kZWJ1Z19pbmZvPSJARU5BQkxFX0RF
QlVHX0lORk9fVkFMQCIKICBkZWZyZHBvcnQ9NTM0NAotLS0gCi0yLjM0LjEKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS1zcmMtZXhwbGljaXRs
eS1vbmx5LWJ1aWxkLXNoYXJlZC1wbHVnaW5zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9iYWJlbHRyYWNlMi8wMDAxLXNyYy1leHBsaWNpdGx5LW9ubHktYnVpbGQtc2hhcmVkLXBs
dWdpbnMucGF0Y2gKaW5kZXggN2Y4ZDVjN2RmMy4uY2YyNTE2NWE3OSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXNyYy1leHBsaWNpdGx5LW9u
bHktYnVpbGQtc2hhcmVkLXBsdWdpbnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9iYWJlbHRyYWNlMi8wMDAxLXNyYy1leHBsaWNpdGx5LW9ubHktYnVpbGQtc2hhcmVkLXBs
dWdpbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNmNDNhMDU1NGM3MzI4Nzk3MzA0N2I0
NGFlNWUxOTZiN2M5OTVjNjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYyNzJjZmZj
NjcyZTU1MDNiNzQ5ODRhMjcyZmFjMDUxZWUyZWYwOWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IFRodSwgMjEg
QXVnIDIwMjUgMTI6NDI6MjAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjOiBleHBsaWNpdGx5
IG9ubHkgYnVpbGQgc2hhcmVkIHBsdWdpbnMKQEAgLTE3LDEwICsxNywxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL01ha2Vm
aWxlLmFtIGIvc3JjL01ha2VmaWxlLmFtCi1pbmRleCAwNTY3MTMxYi4uN2FhNDZiMjAgMTAwNjQ0
CitpbmRleCBlNTI3YzY4MTcuLmI1ZDg3NThiMCAxMDA2NDQKIC0tLSBhL3NyYy9NYWtlZmlsZS5h
bQogKysrIGIvc3JjL01ha2VmaWxlLmFtCi1AQCAtNjE5LDcgKzYxOSw3IEBAIG5vZGlzdF9FWFRS
QV9weXRob25fcGx1Z2luX3Byb3ZpZGVyX2JhYmVsdHJhY2UyX3B5dGhvbl9wbHVnaW5fcHJvdmlk
ZXJfbGFfU09VUkNFCitAQCAtNjE0LDcgKzYxNCw3IEBAIG5vZGlzdF9FWFRSQV9weXRob25fcGx1
Z2luX3Byb3ZpZGVyX2JhYmVsdHJhY2UyX3B5dGhvbl9wbHVnaW5fcHJvdmlkZXJfbGFfU09VUkNF
CiAgcHl0aG9uX3BsdWdpbl9wcm92aWRlcl9iYWJlbHRyYWNlMl9weXRob25fcGx1Z2luX3Byb3Zp
ZGVyX2xhX0xERkxBR1MgPSBcCiAgCSQoQU1fTERGTEFHUykgXAogIAkkKExUX05PX1VOREVGSU5F
RCkgXApAQCAtMjksNyArMjksNyBAQCBpbmRleCAwNTY3MTMxYi4uN2FhNDZiMjAgMTAwNjQ0CiAg
CSQoUFlUSE9OX0xERkxBR1MpCiAgCiAgcHl0aG9uX3BsdWdpbl9wcm92aWRlcl9iYWJlbHRyYWNl
Ml9weXRob25fcGx1Z2luX3Byb3ZpZGVyX2xhX0NQUEZMQUdTID0gXAotQEAgLTY2OSw3ICs2Njks
NyBAQCBwbHVnaW5zX3V0aWxzX2JhYmVsdHJhY2VfcGx1Z2luX3V0aWxzX2xhX1NPVVJDRVMgPSBc
CitAQCAtNjY0LDcgKzY2NCw3IEBAIHBsdWdpbnNfdXRpbHNfYmFiZWx0cmFjZV9wbHVnaW5fdXRp
bHNfbGFfU09VUkNFUyA9IFwKICBwbHVnaW5zX3V0aWxzX2JhYmVsdHJhY2VfcGx1Z2luX3V0aWxz
X2xhX0xERkxBR1MgPSBcCiAgCSQoQU1fTERGTEFHUykgXAogIAkkKExUX05PX1VOREVGSU5FRCkg
XApAQCAtMzgsNyArMzgsNyBAQCBpbmRleCAwNTY3MTMxYi4uN2FhNDZiMjAgMTAwNjQ0CiAgCiAg
cGx1Z2luc191dGlsc19iYWJlbHRyYWNlX3BsdWdpbl91dGlsc19sYV9MSUJBREQgPSBcCiAgCXBs
dWdpbnMvY29tbW9uL211eGluZy9saWJtdXhpbmcubGEKLUBAIC03NzUsNyArNzc1LDcgQEAgcGx1
Z2luc19jdGZfYmFiZWx0cmFjZV9wbHVnaW5fY3RmX2xhX1NPVVJDRVMgPSBcCitAQCAtNzcwLDcg
Kzc3MCw3IEBAIHBsdWdpbnNfY3RmX2JhYmVsdHJhY2VfcGx1Z2luX2N0Zl9sYV9TT1VSQ0VTID0g
XAogIHBsdWdpbnNfY3RmX2JhYmVsdHJhY2VfcGx1Z2luX2N0Zl9sYV9MREZMQUdTID0gXAogIAkk
KEFNX0xERkxBR1MpIFwKICAJJChMVF9OT19VTkRFRklORUQpIFwKQEAgLTQ3LDcgKzQ3LDcgQEAg
aW5kZXggMDU2NzEzMWIuLjdhYTQ2YjIwIDEwMDY0NAogIAogIHBsdWdpbnNfY3RmX2JhYmVsdHJh
Y2VfcGx1Z2luX2N0Zl9sYV9MSUJBREQgPSBcCiAgCXBsdWdpbnMvY3RmL2NvbW1vbi9tZXRhZGF0
YS9saWJjdGYtcGFyc2VyLmxhIFwKLUBAIC04MTYsNyArODE2LDcgQEAgcGx1Z2luc190ZXh0X2Jh
YmVsdHJhY2VfcGx1Z2luX3RleHRfbGFfU09VUkNFUyA9IFwKK0BAIC04MTEsNyArODExLDcgQEAg
cGx1Z2luc190ZXh0X2JhYmVsdHJhY2VfcGx1Z2luX3RleHRfbGFfU09VUkNFUyA9IFwKICBwbHVn
aW5zX3RleHRfYmFiZWx0cmFjZV9wbHVnaW5fdGV4dF9sYV9MREZMQUdTID0gXAogIAkkKEFNX0xE
RkxBR1MpIFwKICAJJChMVF9OT19VTkRFRklORUQpIFwKQEAgLTU2LDcgKzU2LDcgQEAgaW5kZXgg
MDU2NzEzMWIuLjdhYTQ2YjIwIDEwMDY0NAogIAogIHBsdWdpbnNfdGV4dF9iYWJlbHRyYWNlX3Bs
dWdpbl90ZXh0X2xhX0xJQkFERCA9CiAgCi1AQCAtODQwLDcgKzg0MCw3IEBAIHBsdWdpbnNfbHR0
bmdfdXRpbHNfYmFiZWx0cmFjZV9wbHVnaW5fbHR0bmdfdXRpbHNfbGFfU09VUkNFUyA9IFwKK0BA
IC04MzUsNyArODM1LDcgQEAgcGx1Z2luc19sdHRuZ191dGlsc19iYWJlbHRyYWNlX3BsdWdpbl9s
dHRuZ191dGlsc19sYV9TT1VSQ0VTID0gXAogIHBsdWdpbnNfbHR0bmdfdXRpbHNfYmFiZWx0cmFj
ZV9wbHVnaW5fbHR0bmdfdXRpbHNfbGFfTERGTEFHUyA9IFwKICAJJChBTV9MREZMQUdTKSBcCiAg
CSQoTFRfTk9fVU5ERUZJTkVEKSBcCkBAIC02NSw2ICs2NSwzIEBAIGluZGV4IDA1NjcxMzFiLi43
YWE0NmIyMCAxMDA2NDQKICAJJChFTEZVVElMU19MSUJTKQogIAogIHBsdWdpbnNfbHR0bmdfdXRp
bHNfYmFiZWx0cmFjZV9wbHVnaW5fbHR0bmdfdXRpbHNfbGFfTElCQUREID0gXAotLS0gCi0yLjQz
LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8w
MDAxLXRlc3RzLWZpeC10ZXN0LWFwcGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLWZpeC10ZXN0LWFw
cGxpY2F0aW9ucy1pbi1jcHAtY29tbW9uLnBhdGNoCmluZGV4IDg3Zjk0ZmIwODcuLjhjYTg4Yjc1
MjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAw
MS10ZXN0cy1maXgtdGVzdC1hcHBsaWNhdGlvbnMtaW4tY3BwLWNvbW1vbi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyLzAwMDEtdGVzdHMtZml4LXRlc3Qt
YXBwbGljYXRpb25zLWluLWNwcC1jb21tb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFk
YzgxZjI3Mjg1NWQ5NGU2YTc4ZjdkMTBlYTk1Mjc0NWQ5OTFhYTkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDJlNzMzOTAxZGU1NjFmMmRlN2FmODExYjQ0ZTRmZTQ2N2E0Njk4YzEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCaW4gTGFuIDxiaW4ubGFuLmNuQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUdWUsIDExIE1hciAyMDI1IDE3OjE5OjExICswODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIFRlc3RzOiBmaXggdGVzdCBhcHBsaWNhdGlvbnMgaW4gY3BwLWNvbW1vbiBhcmUgbmVl
ZGVkIHRvCkBAIC0xMjQsNiArMTI0LDMgQEAgaW5kZXggMDAwMDAwMDAwLi44YzY1ZGFhOTQKICtz
b3VyY2UgIiRVVElMU1NIIgogKwogKyIke0JUX1RFU1RTX0JVSUxERElSfS9jcHAtY29tbW9uL3Rl
c3QtdXVpZCIgIiRCVF9URVNUU19CVDJfQklOIgotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLXNldC10aGUt
Y29ycmVjdC1wbHVnaW4tZGlyZWN0b3J5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9iYWJlbHRyYWNlMi8wMDAxLXRlc3RzLXNldC10aGUtY29ycmVjdC1wbHVnaW4tZGlyZWN0b3J5
LnBhdGNoCmluZGV4IDdhYzc1ODJhZDcuLmFhNmZhMzgwNjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvMDAwMS10ZXN0cy1zZXQtdGhlLWNvcnJlY3Qt
cGx1Z2luLWRpcmVjdG9yeS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2Jh
YmVsdHJhY2UyLzAwMDEtdGVzdHMtc2V0LXRoZS1jb3JyZWN0LXBsdWdpbi1kaXJlY3RvcnkucGF0
Y2gKQEAgLTEsMTEgKzEsMTEgQEAKLUZyb20gMzI0OTRiMTcyNmE4ODE4ODNjYjZkMzE3YWI3NmQx
ZWMzZjFmYTc0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2Y2ZTVmMmIzMDUwMTcz
MmJjYmM1Y2NkYzNhNjA1MjA1OTRmYjgyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEJpbiBMYW4gPGJpbi5sYW4uY25Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgNSBNYXIgMjAy
NSAxMDo1MToxMSArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogc2V0IHRoZSBjb3JyZWN0
IGRpcmVjdG9yeSBvZiBwbHVnaW4gc2hhcmVkIGxpYnJhcnkKIAotVGhlIHBsdWdpbiBzaGFyZWQg
bGlicmFyaWVzIGFyZSBwdXQgaW4gdGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgd2hlbiAKLWJ1
aWxkaW5nIGluIGEgaG9zdC4gdGVzdC1wbHVnaW5zLXBsdWdpbnMvLmxpYnMgaXMgbm90IGV4aXN0
IHdoZW4gY3Jvc3MgCi1idWlsZC4gVGhlIHBsdWdpbiBzaGFyZWQgbGlicmFyaWVzIGFyZSBwdXQg
aW4gdGVzdC1wbHVnaW5zLXBsdWdpbnMgCitUaGUgcGx1Z2luIHNoYXJlZCBsaWJyYXJpZXMgYXJl
IHB1dCBpbiB0ZXN0LXBsdWdpbnMtcGx1Z2lucy8ubGlicyB3aGVuCitidWlsZGluZyBpbiBhIGhv
c3QuIHRlc3QtcGx1Z2lucy1wbHVnaW5zLy5saWJzIGlzIG5vdCBleGlzdCB3aGVuIGNyb3NzCiti
dWlsZC4gVGhlIHBsdWdpbiBzaGFyZWQgbGlicmFyaWVzIGFyZSBwdXQgaW4gdGVzdC1wbHVnaW5z
LXBsdWdpbnMKIGRpcmVjdG9yeSB3aGVuIGNyb3NzIGJ1aWxkLgogCiBVcHN0cmVhbS1TdGF0dXM6
IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQpAQCAtMjUsNiArMjUsMyBAQCBpbmRleCBmODNl
NDJiYWEuLjkzOTIzNjM5MyAxMDA3NTUKICAKIC0iJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3Rl
c3QtcGx1Z2lucyIgIiR7QlRfVEVTVFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbnMtcGx1Z2lu
cy8ubGlicyIKICsiJHtCVF9URVNUU19CVUlMRERJUn0vbGliL3Rlc3QtcGx1Z2lucyIgIiR7QlRf
VEVTVFNfQlVJTERESVJ9L2xpYi90ZXN0LXBsdWdpbnMtcGx1Z2lucyIKLS0tIAotMi4zNC4xCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTIvZXh0ZXJu
YWwtcHl0aG9uLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRy
YWNlMi9leHRlcm5hbC1weXRob24tdGVzdHMucGF0Y2gKaW5kZXggOTYwYjMzZDk1OS4uZTkzNjg0
NjdkNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMi9l
eHRlcm5hbC1weXRob24tdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRu
Zy9iYWJlbHRyYWNlMi9leHRlcm5hbC1weXRob24tdGVzdHMucGF0Y2gKQEAgLTEsNyArMSw3IEBA
Ci1Gcm9tIGQyZjUyOGFhMDlhOTAwMWU2MzcxMDQ3MGY2YjcwMGQxMjI0OTQ5NjEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDdmODZlY2I0M2I1MjFmNDc3OTAwZjNlOTg4YTlhMWU2MjUy
MDBlODYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaWNoYWVsIEplYW5zb24gPG1q
ZWFuc29uQGVmZmljaW9zLmNvbT4KIERhdGU6IFRodSwgMTQgQXVnIDIwMjUgMTI6Mjc6MTYgLTA0
MDAKLVN1YmplY3Q6IFtQQVRDSCBiYWJlbHRyYWNlXSBiaW5kaW5ncy9weXRob246IEFsbG93IHRl
c3RzIHRvIGJlIHJ1biBleHRlcm5hbGx5CitTdWJqZWN0OiBbUEFUQ0hdIGJpbmRpbmdzL3B5dGhv
bjogQWxsb3cgdGVzdHMgdG8gYmUgcnVuIGV4dGVybmFsbHkKIAogVXBzdHJlYW0gZG9lc24ndCBv
ZmZpY2lhbGx5IHN1cHBvcnQgcnVubmluZyB0aGVpciB0ZXN0cyBleHRlcm5hbGx5LiBUaGUgcHl0
aG9uCiBiaW5kaW5ncyBuZWVkIHNvbWUgdHdlYWtzIHRvIHdvcmsgaW4gdGhpcyBjb25maWd1cmF0
aW9uLgpAQCAtMTMsMTMgKzEzLDEyIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
b2Ugc3BlY2lmaWNdCiAKIENoYW5nZS1JZDogSTg5NTU1YTNmYmQ4MjFiYWE3MDg4YWNjMTU0ZTgx
NjY1MTAyMjg2YjgKIC0tLQotIC4uLi9weXRob24vYnQyL3Rlc3RfY29tcG9uZW50X2Rlc2NyaXB0
b3IucHkgICB8ICAgMiArLQotIHRlc3RzL2JpbmRpbmdzL3B5dGhvbi9idDIvdGVzdF9ncmFwaC5w
eSAgICAgICB8ICAgMiArLQotIHRlc3RzL2JpbmRpbmdzL3B5dGhvbi9idDIvdGVzdF9wbHVnaW4u
cHkgICAgICB8ICAxMCArLQotIC4uLi9weXRob24vYnQyL3Rlc3RfcXVlcnlfZXhlY3V0b3IucHkg
ICAgICAgICB8ICAgMiArLQotIHRlc3RzL3V0aWxzL3V0aWxzLnNoICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQotIDYgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCi0gY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzLzAwMDEtd2lwLXRlc3RzLXlv
Y3RvLnBhdGNoCisgdGVzdHMvYmluZGluZ3MvcHl0aG9uL2J0Mi90ZXN0X2NvbXBvbmVudF9kZXNj
cmlwdG9yLnB5IHwgIDIgKy0KKyB0ZXN0cy9iaW5kaW5ncy9weXRob24vYnQyL3Rlc3RfZ3JhcGgu
cHkgICAgICAgICAgICAgICAgfCAgMiArLQorIHRlc3RzL2JpbmRpbmdzL3B5dGhvbi9idDIvdGVz
dF9wbHVnaW4ucHkgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KKyB0ZXN0cy9iaW5kaW5n
cy9weXRob24vYnQyL3Rlc3RfcXVlcnlfZXhlY3V0b3IucHkgICAgICAgfCAgMiArLQorIHRlc3Rz
L3V0aWxzL3V0aWxzLnNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
CisgNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiAKIGRp
ZmYgLS1naXQgYS90ZXN0cy9iaW5kaW5ncy9weXRob24vYnQyL3Rlc3RfY29tcG9uZW50X2Rlc2Ny
aXB0b3IucHkgYi90ZXN0cy9iaW5kaW5ncy9weXRob24vYnQyL3Rlc3RfY29tcG9uZW50X2Rlc2Ny
aXB0b3IucHkKIGluZGV4IGRjYWQ1MTRlYi4uNDlhM2MwNTRkIDEwMDY0NApAQCAtMTIxLDYgKzEy
MCwzIEBAIGluZGV4IDI4ZGI1OTVkMS4uMDViODdmNjRlIDEwMDY0NAogIAogICMgQ29sb24tc2Vw
YXJhdGVkIGxpc3Qgb2YgcHJvamVjdCBwbHVnaW4gcGF0aHMsIGlmIG5vdCBzZXQKICBfYnRfdGVz
dHNfc2V0X3Zhcl9kZWYgQlRfVEVTVFNfQkFCRUxUUkFDRV9QTFVHSU5fUEFUSCBcCi0tLSAKLTIu
NDcuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2Uy
XzIuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjEuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2JhYmVsdHJhY2UyXzIuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2JhYmVsdHJhY2UyXzIuMS4yLmJiCmluZGV4IDk0NWY4MmVmMzQuLmIwY2Q2ZWZkZTEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4xLjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlMl8yLjEuMi5iYgpAQCAt
MTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdC5lZmZpY2lvcy5jb20vYmFiZWx0cmFj
ZS5naXQ7YnJhbmNoPXN0YWJsZS0yLjE7cHJvdG9jb2w9aHR0cAogICAgICAgICAgICBmaWxlOi8v
ZXh0ZXJuYWwtcHl0aG9uLXRlc3RzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc3Jj
LWV4cGxpY2l0bHktb25seS1idWlsZC1zaGFyZWQtcGx1Z2lucy5wYXRjaCBcCiAgICAgICAgICAg
ICIKLVNSQ1JFViA9ICI3ZjJmOGNkNmRhYzQ5N2NiYjQ2NmVmYjMxMjE5YjUzMWM2MjAxM2Y1Igor
U1JDUkVWID0gImQwZTk0NmE3MWZhZjVmMGMyZDdmMWZiNWI5MmEzNjk5ODNlOWNmMTAiCiBVUFNU
UkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+MihcLlxkKykrKSQiCiAKIGluaGVy
aXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBwdGVzdCBzZXR1cHRvb2xzMy1iYXNlCi0tIAoyLjQ3LjEK
Cg==

--===============4398412015168819950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 76776544 to 76778976 (+0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 424839 to 425589 (+0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 25536033 to 25532067 (-0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2 /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2: PKGSIZE changed from 5005556 to 4984886 (-0%)
packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2: PV changed from "2.1.1" to "2.1.2"
packages/x86-64-v3-poky-linux/babeltrace2: PKGV changed from 2.1.1 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/babeltrace2: SRC_URI changed from "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.1 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch file://external-python-tests.patch file://0001-src-explicitly-only-build-shared-plugins.patch" to "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v2.1.2 file://run-ptest file://0001-Make-manpages-multilib-identical.patch file://0001-tests-fix-test-applications-in-cpp-common.patch file://0001-tests-set-the-correct-plugin-directory.patch file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch file://external-python-tests.patch file://0001-src-explicitly-only-build-shared-plugins.patch"
packages/x86-64-v3-poky-linux/babeltrace2: PV changed from "2.1.1" to "2.1.2"
Changes to packages/x86-64-v3-poky-linux/babeltrace2 (sysroot):
  /usr/lib/python3.13/site-packages/bt2-2.1.1-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/bt2-2.1.2-py3.13.egg-info

--===============4398412015168819950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/channel0_2 /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/1/succeed/meta-trailing-byte/index/channel0_2.idx"
Changes to packages/x86-64-v3-poky-linux/babeltrace2 (sysroot):
  /usr/lib/python3.13/site-packages/bt2-2.1.1-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/bt2-2.1.2-py3.13.egg-info

--===============4398412015168819950==--

