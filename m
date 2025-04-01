Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6031CC369A4
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.18034.1743511384586739636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BZ9Mvxn7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=B3mlTvoT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f160dbaf-c864d1a3-7298-43fb-9b82-87648bb25255-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TARms5oely0Fyg3MIxEj1RMiNDhwHuMutRtwuUYjsI0=;
	b=BZ9Mvxn7RnMxrEITFuPvWihzRAlD4mhMLaiMEiMQUVWtp+w8TdDz3WW5ONMpzBA1
	MNDru+oje3WGzqi2SIXYmFpLWuJsdg5fwFQsWc6+VM+S8llHfMkBvwfs7upJFf/fCL5
	rx/01ZH0ev/WChQdiRo1Bl84zJVYpdgFCXX8NZis=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TARms5oely0Fyg3MIxEj1RMiNDhwHuMutRtwuUYjsI0=;
	b=B3mlTvoTbjhrDxE0HRACJSvxWm2uTkqbq7YdMyqu3uho8ZrvkwrQ43/hfsDxCcMY
	iBEvQ2q/UwtvroF2MKukZQOjB6rpyBl6I0Kcpwhism0hDa3tshfrHKoy3b/rSV4skxK
	XosuB+NC0Ymb/gXSMsOY0i66L8I9gO2FdVq2fwoY=
Content-Type: multipart/mixed; boundary="===============0922414671825650441=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.26.0 SUCCEEDED
Message-ID: <01010195f160dbaf-c864d1a3-7298-43fb-9b82-87648bb25255-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214113

--===============0922414671825650441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.24.12-1.26.0.patch
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
From b4e5717e119a8f14b872f261a53398b57fe2ea66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 12:02:40 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.24.12 -> 1.26.0

---
 ...-respect-the-idententaion-used-in-meson.patch |  6 +++---
 ...tests-add-support-for-install-the-tests.patch | 16 ++++++++--------
 ...ests-use-a-dictionaries-for-environment.patch |  6 +++---
 ...elper-script-to-run-the-installed_tests.patch |  6 +++---
 ...amer1.0_1.24.12.bb => gstreamer1.0_1.26.0.bb} |  2 +-
 5 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.12.bb => gstreamer1.0_1.26.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 0dd96bef01..5b3ca70882 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From a9d99eea162dfb6dcd5cb90adb7dd9261ec676bc Mon Sep 17 00:00:00 2001
+From 42b57106bd59cf25c6b6a5cc4fc97f5a21aa9de1 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
@@ -11,10 +11,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 7d68212..bf0021f 100644
+index e8419fc..4cc4618 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -146,11 +146,11 @@ foreach t : core_tests
+@@ -149,11 +149,11 @@ foreach t : core_tests
  
    if not skip_test
      exe = executable(test_name, fname,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 01d9535eb8..3e3a7735cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From f0076c5801bd847c464e31ab11fdb06f1ad0fccd Mon Sep 17 00:00:00 2001
+From 29aaee472459d78bd863c0ae7e45923c75e19cb8 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index dc9dbe2..55e85b3 100644
+index f1be50c..f4c146d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -645,6 +645,10 @@ if bashcomp_dep.found()
+@@ -657,6 +657,10 @@ if bashcomp_dep.found()
    endif
  endif
  
@@ -34,7 +34,7 @@ index dc9dbe2..55e85b3 100644
  
  pkgconfig = import('pkgconfig')
 diff --git a/meson_options.txt b/meson_options.txt
-index 340fb58..5b87f68 100644
+index 39255cf..78af552 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
@@ -46,10 +46,10 @@ index 340fb58..5b87f68 100644
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index bf0021f..9a8c42c 100644
+index 4cc4618..f290e2e 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -125,10 +125,16 @@ test_defines = [
+@@ -128,10 +128,16 @@ test_defines = [
    '-UG_DISABLE_ASSERT',
    '-UG_DISABLE_CAST_CHECKS',
    '-DGST_CHECK_TEST_ENVIRONMENT_BEACON="GST_STATE_IGNORE_ELEMENTS"',
@@ -67,7 +67,7 @@ index bf0021f..9a8c42c 100644
  # sanity checking
  if get_option('check').disabled()
    if get_option('tests').enabled()
-@@ -151,6 +157,8 @@ foreach t : core_tests
+@@ -154,6 +160,8 @@ foreach t : core_tests
        include_directories : [configinc],
        link_with : link_with_libs,
        dependencies : gst_deps + test_deps,
@@ -76,7 +76,7 @@ index bf0021f..9a8c42c 100644
      )
  
      env = environment()
-@@ -162,6 +170,18 @@ foreach t : core_tests
+@@ -165,6 +173,18 @@ foreach t : core_tests
      env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-scanner')
      env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 861046d2db..ea3d70e0f7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From f9544b0e2d35bf9f9a89cff42bb741bc16e37cc8 Mon Sep 17 00:00:00 2001
+From bfbe4ef92acff79ce0d79fd4238141e0b3a3515a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
@@ -14,10 +14,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 13 insertions(+), 8 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 9a8c42c..6bb346a 100644
+index f290e2e..a3ffcb6 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -161,14 +161,19 @@ foreach t : core_tests
+@@ -164,14 +164,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index cb47f7244f..a791cad8b5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 39764bd2b9f9da4a07079f76a2f68baf40c143b9 Mon Sep 17 00:00:00 2001
+From dee85dc24f5cb5ab31009085c66038f303482c44 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
@@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100755 tests/check/template.sh.in
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 6bb346a..fe57935 100644
+index a3ffcb6..b907dcf 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -185,6 +185,23 @@ foreach t : core_tests
+@@ -188,6 +188,23 @@ foreach t : core_tests
          install_dir: installed_tests_metadir,
          configuration: test_conf
        )
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
index d224b80eb3..ad5c54fa5d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "b3522d1b4fe174fff3b3c7f0603493e2367bd1c43f5804df15b634bd22b1036f"
+SRC_URI[sha256sum] = "1b2ee4028010c25b776effa7c396c7e3e1861b60b9417e416f4914abcdff279f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============0922414671825650441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: FILELIST: added "/usr/share/cmake/FindGStreamer.cmake /usr/include/gstreamer-1.0/gst/gstidstr.h /usr/include/gstreamer-1.0/gst/gstvecdeque.h"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: FILELIST: added "/usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline.sh /usr/libexec/installed-tests/gstreamer/gst_gstidstr.sh /usr/libexec/installed-tests/gstreamer/gst_gstvecdeque /usr/share/installed-tests/gstreamer/gst_gstvecdeque.test /usr/share/installed-tests/gstreamer/gst_gstidstr_noinline.test /usr/share/installed-tests/gstreamer/gst_gstidstr.test /usr/libexec/installed-tests/gstreamer/gst_gstidstr /usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline /usr/libexec/installed-tests/gstreamer/gst_gstvecdeque.sh"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcheck-1.0.so.0.2412.0 /usr/lib/libgstbase-1.0.so.0.2412.0 /usr/lib/libgstcontroller-1.0.so.0.2412.0 /usr/lib/libgstnet-1.0.so.0.2412.0 /usr/lib/libgstreamer-1.0.so.0.2412.0", added "/usr/lib/libgstcontroller-1.0.so.0.2600.0 /usr/lib/libgstcheck-1.0.so.0.2600.0 /usr/lib/libgstbase-1.0.so.0.2600.0 /usr/lib/libgstreamer-1.0.so.0.2600.0 /usr/lib/libgstnet-1.0.so.0.2600.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2412.0 to libgstbase-1.0.so.0.2600.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2412.0 to libgstcheck-1.0.so.0.2600.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2412.0 to libgstcontroller-1.0.so.0.2600.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2412.0 to libgstnet-1.0.so.0.2600.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2412.0 to libgstreamer-1.0.so.0.2600.0
  /usr/lib/libgstbase-1.0.so.0.2412.0 moved to /usr/lib/libgstbase-1.0.so.0.2600.0
  /usr/lib/libgstcheck-1.0.so.0.2412.0 moved to /usr/lib/libgstcheck-1.0.so.0.2600.0
  /usr/lib/libgstcontroller-1.0.so.0.2412.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2600.0
  /usr/lib/libgstnet-1.0.so.0.2412.0 moved to /usr/lib/libgstnet-1.0.so.0.2600.0
  /usr/lib/libgstreamer-1.0.so.0.2412.0 moved to /usr/lib/libgstreamer-1.0.so.0.2600.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2412.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2600.0-gdb.py
  /usr/include/gstreamer-1.0/gst/gstidstr.h was added
  /usr/include/gstreamer-1.0/gst/gstvecdeque.h was added
  /usr/share/cmake was added
  /usr/share/cmake/FindGStreamer.cmake was added

--===============0922414671825650441==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.24.12-1.26.0.patch"

RnJvbSBiNGU1NzE3ZTExOWE4ZjE0Yjg3MmYyNjFhNTMzOThiNTdmZTJlYTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMjowMjo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMDogdXBncmFkZSAxLjI0LjEyIC0+IDEuMjYuMAoKLS0tCiAuLi4tcmVzcGVjdC10
aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2ggfCAgNiArKystLS0KIC4uLnRlc3Rz
LWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaCB8IDE2ICsrKysrKysrLS0t
LS0tLS0KIC4uLmVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaCB8
ICA2ICsrKy0tLQogLi4uZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBh
dGNoIHwgIDYgKysrLS0tCiAuLi5hbWVyMS4wXzEuMjQuMTIuYmIgPT4gZ3N0cmVhbWVyMS4wXzEu
MjYuMC5iYn0gfCAgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOCBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dz
dHJlYW1lcjEuMF8xLjI0LjEyLmJiID0+IGdzdHJlYW1lcjEuMF8xLjI2LjAuYmJ9ICg5NyUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRl
c3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCmluZGV4IDBk
ZDk2YmVmMDEuLjViM2NhNzA4ODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFp
b24tdXNlZC1pbi1tZXNvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEtdGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVz
ZWQtaW4tbWVzb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE5ZDk5ZWVhMTYyZGZiNmRj
ZDVjYjkwYWRiN2RkOTI2MWVjNjc2YmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQy
YjU3MTA2YmQ1OWNmMjVjNmI2YTVjYzRmYzk3ZjVhMjFhYTlkZTEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERh
dGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVz
dHM6IHJlc3BlY3QgdGhlIGlkZW50ZW50YWlvbiB1c2VkIGluIG1lc29uCkBAIC0xMSwxMCArMTEs
MTAgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkIGIvdGVzdHMvY2hlY2svbWVzb24u
YnVpbGQKLWluZGV4IDdkNjgyMTIuLmJmMDAyMWYgMTAwNjQ0CitpbmRleCBlODQxOWZjLi40Y2M0
NjE4IDEwMDY0NAogLS0tIGEvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQKICsrKyBiL3Rlc3RzL2No
ZWNrL21lc29uLmJ1aWxkCi1AQCAtMTQ2LDExICsxNDYsMTEgQEAgZm9yZWFjaCB0IDogY29yZV90
ZXN0cworQEAgLTE0OSwxMSArMTQ5LDExIEBAIGZvcmVhY2ggdCA6IGNvcmVfdGVzdHMKICAKICAg
IGlmIG5vdCBza2lwX3Rlc3QKICAgICAgZXhlID0gZXhlY3V0YWJsZSh0ZXN0X25hbWUsIGZuYW1l
LApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0
cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2gKaW5kZXggMDFkOTUzNWVi
OC4uM2UzYTc3MzVjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10
ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMDA3NmM1ODAxYmQ4NDdjNDY0ZTMxYWIxMWZkYjA2ZjFh
ZDBmY2NkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyOWFhZWU0NzI0NTlkNzhiZDg2
M2MwYWU3ZTQ1OTIzYzc1ZTE5Y2I4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9z
ZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDExIEFwciAy
MDIxIDE5OjQ4OjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBhZGQgc3VwcG9ydCBm
b3IgaW5zdGFsbCB0aGUgdGVzdHMKQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBK
b3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBjcmVhdGUgbW9kZSAxMDA2
NDQgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbgogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVp
bGQgYi9tZXNvbi5idWlsZAotaW5kZXggZGM5ZGJlMi4uNTVlODViMyAxMDA2NDQKK2luZGV4IGYx
YmU1MGMuLmY0YzE0NmQgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVp
bGQKLUBAIC02NDUsNiArNjQ1LDEwIEBAIGlmIGJhc2hjb21wX2RlcC5mb3VuZCgpCitAQCAtNjU3
LDYgKzY1NywxMCBAQCBpZiBiYXNoY29tcF9kZXAuZm91bmQoKQogICAgZW5kaWYKICBlbmRpZgog
IApAQCAtMzQsNyArMzQsNyBAQCBpbmRleCBkYzlkYmUyLi41NWU4NWIzIDEwMDY0NAogIAogIHBr
Z2NvbmZpZyA9IGltcG9ydCgncGtnY29uZmlnJykKIGRpZmYgLS1naXQgYS9tZXNvbl9vcHRpb25z
LnR4dCBiL21lc29uX29wdGlvbnMudHh0Ci1pbmRleCAzNDBmYjU4Li41Yjg3ZjY4IDEwMDY0NAor
aW5kZXggMzkyNTVjZi4uNzhhZjU1MiAxMDA2NDQKIC0tLSBhL21lc29uX29wdGlvbnMudHh0CiAr
KysgYi9tZXNvbl9vcHRpb25zLnR4dAogQEAgLTE2LDYgKzE2LDcgQEAgb3B0aW9uKCdwb2lzb25p
bmcnLCB0eXBlIDogJ2Jvb2xlYW4nLCB2YWx1ZSA6IGZhbHNlLCBkZXNjcmlwdGlvbiA6ICdFbmFi
bGUgcG9pc28KQEAgLTQ2LDEwICs0NiwxMCBAQCBpbmRleCAzNDBmYjU4Li41Yjg3ZjY4IDEwMDY0
NAogICMgRmVhdHVyZSBvcHRpb25zCiAgb3B0aW9uKCdjaGVjaycsIHR5cGUgOiAnZmVhdHVyZScs
IHZhbHVlIDogJ2F1dG8nLCBkZXNjcmlwdGlvbiA6ICdCdWlsZCB1bml0IHRlc3QgbGlicmFyaWVz
JykKIGRpZmYgLS1naXQgYS90ZXN0cy9jaGVjay9tZXNvbi5idWlsZCBiL3Rlc3RzL2NoZWNrL21l
c29uLmJ1aWxkCi1pbmRleCBiZjAwMjFmLi45YThjNDJjIDEwMDY0NAoraW5kZXggNGNjNDYxOC4u
ZjI5MGUyZSAxMDA2NDQKIC0tLSBhL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCiArKysgYi90ZXN0
cy9jaGVjay9tZXNvbi5idWlsZAotQEAgLTEyNSwxMCArMTI1LDE2IEBAIHRlc3RfZGVmaW5lcyA9
IFsKK0BAIC0xMjgsMTAgKzEyOCwxNiBAQCB0ZXN0X2RlZmluZXMgPSBbCiAgICAnLVVHX0RJU0FC
TEVfQVNTRVJUJywKICAgICctVUdfRElTQUJMRV9DQVNUX0NIRUNLUycsCiAgICAnLURHU1RfQ0hF
Q0tfVEVTVF9FTlZJUk9OTUVOVF9CRUFDT049IkdTVF9TVEFURV9JR05PUkVfRUxFTUVOVFMiJywK
QEAgLTY3LDcgKzY3LDcgQEAgaW5kZXggYmYwMDIxZi4uOWE4YzQyYyAxMDA2NDQKICAjIHNhbml0
eSBjaGVja2luZwogIGlmIGdldF9vcHRpb24oJ2NoZWNrJykuZGlzYWJsZWQoKQogICAgaWYgZ2V0
X29wdGlvbigndGVzdHMnKS5lbmFibGVkKCkKLUBAIC0xNTEsNiArMTU3LDggQEAgZm9yZWFjaCB0
IDogY29yZV90ZXN0cworQEAgLTE1NCw2ICsxNjAsOCBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3Rz
CiAgICAgICAgaW5jbHVkZV9kaXJlY3RvcmllcyA6IFtjb25maWdpbmNdLAogICAgICAgIGxpbmtf
d2l0aCA6IGxpbmtfd2l0aF9saWJzLAogICAgICAgIGRlcGVuZGVuY2llcyA6IGdzdF9kZXBzICsg
dGVzdF9kZXBzLApAQCAtNzYsNyArNzYsNyBAQCBpbmRleCBiZjAwMjFmLi45YThjNDJjIDEwMDY0
NAogICAgICApCiAgCiAgICAgIGVudiA9IGVudmlyb25tZW50KCkKLUBAIC0xNjIsNiArMTcwLDE4
IEBAIGZvcmVhY2ggdCA6IGNvcmVfdGVzdHMKK0BAIC0xNjUsNiArMTczLDE4IEBAIGZvcmVhY2gg
dCA6IGNvcmVfdGVzdHMKICAgICAgZW52LnNldCgnR1NUX1BMVUdJTl9TQ0FOTkVSXzFfMCcsIGdz
dF9zY2FubmVyX2RpciArICcvZ3N0LXBsdWdpbi1zY2FubmVyJykKICAgICAgZW52LnNldCgnR1NU
X1BMVUdJTl9MT0FESU5HX1dISVRFTElTVCcsICdnc3RyZWFtZXInKQogIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAzLXRlc3Rz
LXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlv
bmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaAppbmRleCA4NjEwNDZkMmRiLi5lYTNkNzBlMGY3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMt
dGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZjk1NDRiMGUyZDM1YmY5ZjlhODljZmY0MmJiNzQxYmMxNmUzN2NjOCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmZiZTRlZjkyYWNmZjc5Y2UwZDc5ZmQ0MjM4MTQx
ZTBiM2EzNTE1YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEg
PHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAyNCBBcHIgMjAyMSAxMDozNDo0
NyArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogdXNlIGEgZGljdGlvbmFyaWVzIGZvciBl
bnZpcm9ubWVudApAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVz
bWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvY2hlY2svbWVzb24u
YnVpbGQgYi90ZXN0cy9jaGVjay9tZXNvbi5idWlsZAotaW5kZXggOWE4YzQyYy4uNmJiMzQ2YSAx
MDA2NDQKK2luZGV4IGYyOTBlMmUuLmEzZmZjYjYgMTAwNjQ0CiAtLS0gYS90ZXN0cy9jaGVjay9t
ZXNvbi5idWlsZAogKysrIGIvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQKLUBAIC0xNjEsMTQgKzE2
MSwxOSBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCitAQCAtMTY0LDE0ICsxNjQsMTkgQEAgZm9y
ZWFjaCB0IDogY29yZV90ZXN0cwogICAgICAgIGluc3RhbGw6IGluc3RhbGxlZF90ZXN0c19lbmFi
bGVkLAogICAgICApCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRo
ZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1p
bnN0YWxsZWRfdGVzdHMucGF0Y2gKaW5kZXggY2I0N2Y3MjQ0Zi4uYTc5MWNhZDhiNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0
LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAw
NC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3RhbGxlZF90ZXN0cy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzk3NjRiZDJiOWY5ZGE0YTA3MDc5Zjc2YTJmNjhiYWY0
MGMxNDNiOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGVlODVkYzI0ZjVjYjVhYjMx
MDA5MDg1YzY2MDM4ZjMwMzQ4MmM0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpv
c2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU3VuLCAyIE1heSAy
MDIxIDAxOjU4OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBhZGQgaGVscGVyIHNj
cmlwdCB0byBydW4gdGhlIGluc3RhbGxlZF90ZXN0cwpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIGNyZWF0
ZSBtb2RlIDEwMDc1NSB0ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbgogCiBkaWZmIC0tZ2l0IGEv
dGVzdHMvY2hlY2svbWVzb24uYnVpbGQgYi90ZXN0cy9jaGVjay9tZXNvbi5idWlsZAotaW5kZXgg
NmJiMzQ2YS4uZmU1NzkzNSAxMDA2NDQKK2luZGV4IGEzZmZjYjYuLmI5MDdkY2YgMTAwNjQ0CiAt
LS0gYS90ZXN0cy9jaGVjay9tZXNvbi5idWlsZAogKysrIGIvdGVzdHMvY2hlY2svbWVzb24uYnVp
bGQKLUBAIC0xODUsNiArMTg1LDIzIEBAIGZvcmVhY2ggdCA6IGNvcmVfdGVzdHMKK0BAIC0xODgs
NiArMTg4LDIzIEBAIGZvcmVhY2ggdCA6IGNvcmVfdGVzdHMKICAgICAgICAgIGluc3RhbGxfZGly
OiBpbnN0YWxsZWRfdGVzdHNfbWV0YWRpciwKICAgICAgICAgIGNvbmZpZ3VyYXRpb246IHRlc3Rf
Y29uZgogICAgICAgICkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjBfMS4yNC4xMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4y
NC4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMF8xLjI2LjAuYmIKaW5kZXggZDIyNGI4MGViMy4uYWQ1YzU0ZmE1ZCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI0LjEy
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBf
MS4yNi4wLmJiCkBAIC0yMiw3ICsyMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIu
ZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3RyZWFtZXIvZ3N0cmVhbWVyLSR7UFZ9LnRhci54CiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1l
bnQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlw
dC10by1ydW4tdGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiMzUyMmQxYjRmZTE3NGZmZjNiM2M3ZjA2MDM0OTNlMjM2N2JkMWM0
M2Y1ODA0ZGYxNWI2MzRiZDIyYjEwMzZmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFiMmVlNDAy
ODAxMGMyNWI3NzZlZmZhN2MzOTZjN2UzZTE4NjFiNjBiOTQxN2U0MTZmNDkxNGFiY2RmZjI3OWYi
CiAKIFBBQ0tBR0VDT05GSUcgPz89ICIke0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxF
RCcsICcxJywgJ3Rlc3RzJywgJycsIGQpfSBcCiAgICAgICAgICAgICAgICAgICAgY2hlY2sgXAot
LSAKMi40Ny4xCgo=

--===============0922414671825650441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstreamer-1.0.so.0.2412.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2412.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2412.0-gdb.py /usr/lib/.debug/libgstbase-1.0.so.0.2412.0 /usr/lib/.debug/libgstnet-1.0.so.0.2412.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2412.0", added "/usr/libexec/installed-tests/gstreamer/.debug/gst_gstidstr_noinline /usr/lib/.debug/libgstreamer-1.0.so.0.2600.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2600.0 /usr/libexec/installed-tests/gstreamer/.debug/gst_gstvecdeque /usr/libexec/installed-tests/gstreamer/.debug/gst_gstidstr /usr/lib/.debug/libgstbase-1.0.so.0.2600.0 /usr/lib/.debug/libgstnet-1.0.so.0.2600.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2600.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2600.0-gdb.py"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 17045487 to 17464207 (+2%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: FILELIST: added "/usr/share/cmake/FindGStreamer.cmake /usr/include/gstreamer-1.0/gst/gstidstr.h /usr/include/gstreamer-1.0/gst/gstvecdeque.h"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6179592 to 6391426 (+3%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGSIZE changed from 24519 to 25025 (+2%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGSIZE changed from 39990 to 40384 (+1%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGSIZE changed from 51014 to 51483 (+1%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: FILELIST: added "/usr/libexec/installed-tests/gstreamer/gst_gstidstr.sh /usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline /usr/share/installed-tests/gstreamer/gst_gstidstr_noinline.test /usr/libexec/installed-tests/gstreamer/gst_gstidstr /usr/share/installed-tests/gstreamer/gst_gstidstr.test /usr/share/installed-tests/gstreamer/gst_gstvecdeque.test /usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline.sh /usr/libexec/installed-tests/gstreamer/gst_gstvecdeque.sh /usr/libexec/installed-tests/gstreamer/gst_gstvecdeque"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGSIZE changed from 3982159 to 4075533 (+2%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.24.12/plugins/elements -> /usr/src/debug/gstreamer1.0/1.26.0/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/gst/parse -> /usr/src/debug/gstreamer1.0/1.26.0/gst/parse, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/gst/printf -> /usr/src/debug/gstreamer1.0/1.26.0/gst/printf, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/c
 heck/generic -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/generic, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tools -> /usr/src/debug/gstreamer1.0/1.26.0/tools, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/validate -> /usr/src/debug/gstreamer1.0/1.26.0/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.24.1
 2/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/elements, removed "/usr/src/debug/gstreamer1.0/1.24.12/gst/gstenumtypes.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelementfactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstenumtypes.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmemory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstghostpad.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpad.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcaps.h /usr/src/debug/gstreamer1.0/1.24.12/gst/
 gstinfo.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolsource.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbin.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gst.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmeta.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpoll.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolsource.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstminiobject.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gst.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefind.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.24.1
 2/tests/check/gst/gstdeinit.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefind.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevice.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsample.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginloader.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdebugutils.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsample.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdebugutils.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginloader.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbytearrayinterface.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttoc.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstchildproxy.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstchildproxy.c /usr/src/de
 bug/gstreamer1.0/1.24.12/tests/check/gst/gstcontroller.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstprintf.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gststream.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceprovider.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/capslist.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceprovider.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferlist.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gst.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstiterator.h /usr/src/debug/gstr
 eamer1.0/1.24.12/gst/gstmessage.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginfeature.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginfeature.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstplugin.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcapsfeatures.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpipeline.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpadtemplate.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.
 24.12/gst/gstpadtemplate.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontext.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceproviderfactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstparamspecs.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceproviderfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistrybinary.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelement.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistrybinary.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsegment.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstclock.c /usr/src/debug/gst
 reamer1.0/1.24.12/gst/gsttracerrecord.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerrecord.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstatomicqueue.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferpool.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistrychunks.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaglist.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttagsetter.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttocsetter.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/struct_x86_64.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaglist.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferpool.c /usr/
 src/debug/gstreamer1.0/1.24.12/gst/gstregistrychunks.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreams.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdatetime.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreams.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevicemonitor.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevicemonitor.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistry.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreamcollection.c /usr
 /src/debug/gstreamer1.0/1.24.12/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreamcollection.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gststructure.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttask.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpromise.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbus.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsystemclock.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gst_private.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcompat.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstformat.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstobject.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpreset.h /us
 r/src/debug/gstreamer1.0/1.24.12/gst/gstformat.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstclock.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsterror.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstevent.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstparse.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquark.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquery.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsturi.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstutils.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstvalue.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsterror.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstparse.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquark.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.24
 .12/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttag.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaskpool.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcpp.cc /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstabi.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaskpool.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstprotection.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolbinding.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerutils.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolbinding.c /usr/src/debug/gstreamer1
 .0/1.24.12/gst/gsttracerutils.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracer.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerfactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstallocator.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbuffer.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracer.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstallocator.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdynamictypefactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefindfactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefindfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdynamictypefactory.c", added "/usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstclock.c /usr/src/debug/gstreamer1.0
 /1.26.0/tests/check/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstidstr-private.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevicemonitor.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstminiobject.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttaglist.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevicemonitor.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolbinding.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolbinding.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstprintf.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gststreamcollection.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrybinary.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrychunks.c 
 /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gststreamcollection.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrybinary.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrychunks.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstidstr.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstallocator.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstformat.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstallocator.h /usr/src/deb
 ug/gstreamer1.0/1.26.0/tests/check/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmeta.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbufferpool.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolsource.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolsource.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmessage.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpromise.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerrecord.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerrecord.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.26
 .0/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsample.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracer.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/capslist.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttypefindfactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstplugin.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpreset.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsample.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracer.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcompat.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevice.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstformat.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmemory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstobject.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttypefindfactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistry.h /usr/src/debug/gstreamer1.0/1
 .26.0/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstabi.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsturi.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gststreams.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstclock.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsterror.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstevent.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstidstr.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparse.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstquery.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gststreams.c /usr/src/debug/gstreamer1.0/1.26.0/
 gst/gstutils.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvalue.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstenumtypes.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsterror.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstghostpad.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstidstr.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparse.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginfeature.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginloader.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerfactory.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/struct_x86_64.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginfeature.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerfactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginloader.
 c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdynamictypefactory.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdynamictypefactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbus.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttoc.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbytearrayinterface.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvecdeque.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstchildproxy.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcontext.c /usr/src/d
 ebug/gstreamer1.0/1.26.0/gst/gstcaps.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvecdeque.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcpp.cc /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gst.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttag.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparamspecs.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsystemclock.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpoll.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstatomicqueue.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttask.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstinfo.c /usr/src/debug/gstreamer1.
 0/1.26.0/tests/check/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstinfo.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gst_private.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpadtemplate.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceproviderfactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gststream.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpipeline.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceproviderfactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpadtemplate.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstvecdeque.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gst.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstiterator.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstdeinit.c /us
 r/src/debug/gstreamer1.0/1.26.0/gst/gst.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstelementfactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttaglist.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcontroller.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcapsfeatures.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstprotection.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontext.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstelement.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbin.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstprotection.c /usr/src/debug/gstream
 er1.0/1.26.0/gst/gstsegment.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttagsetter.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttocsetter.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceprovider.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceprovider.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdatetime.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttaskpool.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttaskpool.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gststructure.h /usr/src/debug/gstreamer1.0/1.2
 6.0/gst/gsttracerutils.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdebugutils.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerutils.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdebugutils.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbufferlist.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstenumtypes.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttypefind.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpad.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttypefind.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpad.c"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9557226 to 9729501 (+2%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcontroller-1.0.so.0.2412.0 /usr/lib/libgstbase-1.0.so.0.2412.0 /usr/lib/libgstnet-1.0.so.0.2412.0 /usr/lib/libgstreamer-1.0.so.0.2412.0 /usr/lib/libgstcheck-1.0.so.0.2412.0", added "/usr/lib/libgstcontroller-1.0.so.0.2600.0 /usr/lib/libgstreamer-1.0.so.0.2600.0 /usr/lib/libgstnet-1.0.so.0.2600.0 /usr/lib/libgstcheck-1.0.so.0.2600.0 /usr/lib/libgstbase-1.0.so.0.2600.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PKGSIZE changed from 3306614 to 3354270 (+1%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.12.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.0.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/core2-64-poky-linux/gstreamer1.0: PV changed from "1.24.12" to "1.26.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2412.0 to libgstbase-1.0.so.0.2600.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2412.0 to libgstcheck-1.0.so.0.2600.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2412.0 to libgstcontroller-1.0.so.0.2600.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2412.0 to libgstnet-1.0.so.0.2600.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2412.0 to libgstreamer-1.0.so.0.2600.0
  /usr/lib/libgstbase-1.0.so.0.2412.0 moved to /usr/lib/libgstbase-1.0.so.0.2600.0
  /usr/lib/libgstcheck-1.0.so.0.2412.0 moved to /usr/lib/libgstcheck-1.0.so.0.2600.0
  /usr/lib/libgstcontroller-1.0.so.0.2412.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2600.0
  /usr/lib/libgstnet-1.0.so.0.2412.0 moved to /usr/lib/libgstnet-1.0.so.0.2600.0
  /usr/lib/libgstreamer-1.0.so.0.2412.0 moved to /usr/lib/libgstreamer-1.0.so.0.2600.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2412.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2600.0-gdb.py
  /usr/include/gstreamer-1.0/gst/gstidstr.h was added
  /usr/include/gstreamer-1.0/gst/gstvecdeque.h was added
  /usr/share/cmake was added
  /usr/share/cmake/FindGStreamer.cmake was added

--===============0922414671825650441==--

