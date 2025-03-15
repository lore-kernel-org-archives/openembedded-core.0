Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A72C369C7
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10337.1742048299938570352
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IsMkwS0u;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fSI/YdL6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101959a2bcee5-6a9f20e0-bf7a-446f-8d16-347f944753f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9p/q84N13OJTlgjOAZFI8sgQGKpIWnM+aohZiiC5Z4E=;
	b=IsMkwS0uzzXufWCSeBX87dHGotsvlmEfkvGkCdrVXFQAN6juEfaDOpSYJqs9Av8U
	asNo2Pu1cDjORz0ztgsskh7KidpACC9gPFRkSiFzwn4HKikghp9x5SXjRq9vvpUUej4
	55ULbmOsC2rtc/LyEWZ8XNZ7lcyhW5UCwppySz3c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9p/q84N13OJTlgjOAZFI8sgQGKpIWnM+aohZiiC5Z4E=;
	b=fSI/YdL6CWhGXIzTnf/kyzag3I4UFMzdXoVxWigr5b1tEBKjsAQXjIUpLWVaxsom
	yBb0X4UL1Rez1wV0GSpR3bqoU9LJKmUiHlznxMfmMxTwNc66paiDTzwi7VmooXvImT7
	9i2cwUWdAW+XCiTCbsCFuQzR67O2KqMDyyErNtv0=
Content-Type: multipart/mixed; boundary="===============0101197873065087647=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.26.0 SUCCEEDED
Message-ID: <010101959a2bcee5-6a9f20e0-bf7a-446f-8d16-347f944753f4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212969

--===============0101197873065087647==
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
From 1d3874103752a0d9f15ba6b45dd52d825c7addab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:43:53 +0000
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
index 0dd96bef01..e2d32e3a2a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From a9d99eea162dfb6dcd5cb90adb7dd9261ec676bc Mon Sep 17 00:00:00 2001
+From 14286b328df105b00606452375c98005fdbcdeab Mon Sep 17 00:00:00 2001
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
index 01d9535eb8..48a783fa15 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From f0076c5801bd847c464e31ab11fdb06f1ad0fccd Mon Sep 17 00:00:00 2001
+From 58ebd5b5db6ea5e7dc19256871f6c347411b4df4 Mon Sep 17 00:00:00 2001
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
index 861046d2db..7e6cbcec82 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From f9544b0e2d35bf9f9a89cff42bb741bc16e37cc8 Mon Sep 17 00:00:00 2001
+From c68d45f80217231d7570df028240404f9fd31ad7 Mon Sep 17 00:00:00 2001
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
index cb47f7244f..2a6e4a1fe1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 39764bd2b9f9da4a07079f76a2f68baf40c143b9 Mon Sep 17 00:00:00 2001
+From d1fd668db3453f63402cc30eab5bc2177228b3b0 Mon Sep 17 00:00:00 2001
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
2.44.1


--===============0101197873065087647==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.24.12-1.26.0.patch"

RnJvbSAxZDM4NzQxMDM3NTJhMGQ5ZjE1YmE2YjQ1ZGQ1MmQ4MjVjN2FkZGFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6NDM6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjA6IHVwZ3JhZGUgMS4yNC4xMiAtPiAxLjI2LjAKCi0tLQogLi4uLXJlc3BlY3Qt
dGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIHwgIDYgKysrLS0tCiAuLi50ZXN0
cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2ggfCAxNiArKysrKysrKy0t
LS0tLS0tCiAuLi5lc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2gg
fCAgNiArKystLS0KIC4uLmVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3RhbGxlZF90ZXN0cy5w
YXRjaCB8ICA2ICsrKy0tLQogLi4uYW1lcjEuMF8xLjI0LjEyLmJiID0+IGdzdHJlYW1lcjEuMF8x
LjI2LjAuYmJ9IHwgIDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tn
c3RyZWFtZXIxLjBfMS4yNC4xMi5iYiA9PiBnc3RyZWFtZXIxLjBfMS4yNi4wLmJifSAoOTclKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMS10
ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaAppbmRleCAw
ZGQ5NmJlZjAxLi5lMmQzMmUzYTJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEtdGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRh
aW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11
c2VkLWluLW1lc29uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhOWQ5OWVlYTE2MmRmYjZk
Y2Q1Y2I5MGFkYjdkZDkyNjFlYzY3NmJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAx
NDI4NmIzMjhkZjEwNWIwMDYwNjQ1MjM3NWM5ODAwNWZkYmNkZWFiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBE
YXRlOiBTdW4sIDExIEFwciAyMDIxIDE5OjQ4OjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRl
c3RzOiByZXNwZWN0IHRoZSBpZGVudGVudGFpb24gdXNlZCBpbiBtZXNvbgpAQCAtMTEsMTAgKzEx
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS90ZXN0cy9jaGVjay9tZXNvbi5idWlsZCBiL3Rlc3RzL2NoZWNrL21lc29u
LmJ1aWxkCi1pbmRleCA3ZDY4MjEyLi5iZjAwMjFmIDEwMDY0NAoraW5kZXggZTg0MTlmYy4uNGNj
NDYxOCAxMDA2NDQKIC0tLSBhL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCiArKysgYi90ZXN0cy9j
aGVjay9tZXNvbi5idWlsZAotQEAgLTE0NiwxMSArMTQ2LDExIEBAIGZvcmVhY2ggdCA6IGNvcmVf
dGVzdHMKK0BAIC0xNDksMTEgKzE0OSwxMSBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCiAgCiAg
ICBpZiBub3Qgc2tpcF90ZXN0CiAgICAgIGV4ZSA9IGV4ZWN1dGFibGUodGVzdF9uYW1lLCBmbmFt
ZSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVz
dHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoCmluZGV4IDAxZDk1MzVl
YjguLjQ4YTc4M2ZhMTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUt
dGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjAwNzZjNTgwMWJkODQ3YzQ2NGUzMWFiMTFmZGIwNmYx
YWQwZmNjZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNThlYmQ1YjVkYjZlYTVlN2Rj
MTkyNTY4NzFmNmMzNDc0MTFiNGRmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpv
c2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU3VuLCAxMSBBcHIg
MjAyMSAxOTo0ODoxMyArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogYWRkIHN1cHBvcnQg
Zm9yIGluc3RhbGwgdGhlIHRlc3RzCkBAIC0xOSwxMCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTog
Sm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL2NoZWNrL3RlbXBsYXRlLnRlc3QuaW4KIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1
aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IGRjOWRiZTIuLjU1ZTg1YjMgMTAwNjQ0CitpbmRleCBm
MWJlNTBjLi5mNGMxNDZkIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1
aWxkCi1AQCAtNjQ1LDYgKzY0NSwxMCBAQCBpZiBiYXNoY29tcF9kZXAuZm91bmQoKQorQEAgLTY1
Nyw2ICs2NTcsMTAgQEAgaWYgYmFzaGNvbXBfZGVwLmZvdW5kKCkKICAgIGVuZGlmCiAgZW5kaWYK
ICAKQEAgLTM0LDcgKzM0LDcgQEAgaW5kZXggZGM5ZGJlMi4uNTVlODViMyAxMDA2NDQKICAKICBw
a2djb25maWcgPSBpbXBvcnQoJ3BrZ2NvbmZpZycpCiBkaWZmIC0tZ2l0IGEvbWVzb25fb3B0aW9u
cy50eHQgYi9tZXNvbl9vcHRpb25zLnR4dAotaW5kZXggMzQwZmI1OC4uNWI4N2Y2OCAxMDA2NDQK
K2luZGV4IDM5MjU1Y2YuLjc4YWY1NTIgMTAwNjQ0CiAtLS0gYS9tZXNvbl9vcHRpb25zLnR4dAog
KysrIGIvbWVzb25fb3B0aW9ucy50eHQKIEBAIC0xNiw2ICsxNiw3IEBAIG9wdGlvbigncG9pc29u
aW5nJywgdHlwZSA6ICdib29sZWFuJywgdmFsdWUgOiBmYWxzZSwgZGVzY3JpcHRpb24gOiAnRW5h
YmxlIHBvaXNvCkBAIC00NiwxMCArNDYsMTAgQEAgaW5kZXggMzQwZmI1OC4uNWI4N2Y2OCAxMDA2
NDQKICAjIEZlYXR1cmUgb3B0aW9ucwogIG9wdGlvbignY2hlY2snLCB0eXBlIDogJ2ZlYXR1cmUn
LCB2YWx1ZSA6ICdhdXRvJywgZGVzY3JpcHRpb24gOiAnQnVpbGQgdW5pdCB0ZXN0IGxpYnJhcmll
cycpCiBkaWZmIC0tZ2l0IGEvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQgYi90ZXN0cy9jaGVjay9t
ZXNvbi5idWlsZAotaW5kZXggYmYwMDIxZi4uOWE4YzQyYyAxMDA2NDQKK2luZGV4IDRjYzQ2MTgu
LmYyOTBlMmUgMTAwNjQ0CiAtLS0gYS90ZXN0cy9jaGVjay9tZXNvbi5idWlsZAogKysrIGIvdGVz
dHMvY2hlY2svbWVzb24uYnVpbGQKLUBAIC0xMjUsMTAgKzEyNSwxNiBAQCB0ZXN0X2RlZmluZXMg
PSBbCitAQCAtMTI4LDEwICsxMjgsMTYgQEAgdGVzdF9kZWZpbmVzID0gWwogICAgJy1VR19ESVNB
QkxFX0FTU0VSVCcsCiAgICAnLVVHX0RJU0FCTEVfQ0FTVF9DSEVDS1MnLAogICAgJy1ER1NUX0NI
RUNLX1RFU1RfRU5WSVJPTk1FTlRfQkVBQ09OPSJHU1RfU1RBVEVfSUdOT1JFX0VMRU1FTlRTIics
CkBAIC02Nyw3ICs2Nyw3IEBAIGluZGV4IGJmMDAyMWYuLjlhOGM0MmMgMTAwNjQ0CiAgIyBzYW5p
dHkgY2hlY2tpbmcKICBpZiBnZXRfb3B0aW9uKCdjaGVjaycpLmRpc2FibGVkKCkKICAgIGlmIGdl
dF9vcHRpb24oJ3Rlc3RzJykuZW5hYmxlZCgpCi1AQCAtMTUxLDYgKzE1Nyw4IEBAIGZvcmVhY2gg
dCA6IGNvcmVfdGVzdHMKK0BAIC0xNTQsNiArMTYwLDggQEAgZm9yZWFjaCB0IDogY29yZV90ZXN0
cwogICAgICAgIGluY2x1ZGVfZGlyZWN0b3JpZXMgOiBbY29uZmlnaW5jXSwKICAgICAgICBsaW5r
X3dpdGggOiBsaW5rX3dpdGhfbGlicywKICAgICAgICBkZXBlbmRlbmNpZXMgOiBnc3RfZGVwcyAr
IHRlc3RfZGVwcywKQEAgLTc2LDcgKzc2LDcgQEAgaW5kZXggYmYwMDIxZi4uOWE4YzQyYyAxMDA2
NDQKICAgICAgKQogIAogICAgICBlbnYgPSBlbnZpcm9ubWVudCgpCi1AQCAtMTYyLDYgKzE3MCwx
OCBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCitAQCAtMTY1LDYgKzE3MywxOCBAQCBmb3JlYWNo
IHQgOiBjb3JlX3Rlc3RzCiAgICAgIGVudi5zZXQoJ0dTVF9QTFVHSU5fU0NBTk5FUl8xXzAnLCBn
c3Rfc2Nhbm5lcl9kaXIgKyAnL2dzdC1wbHVnaW4tc2Nhbm5lcicpCiAgICAgIGVudi5zZXQoJ0dT
VF9QTFVHSU5fTE9BRElOR19XSElURUxJU1QnLCAnZ3N0cmVhbWVyJykKICAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0
cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rp
b25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2gKaW5kZXggODYxMDQ2ZDJkYi4uN2U2Y2JjZWM4
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAz
LXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGY5NTQ0YjBlMmQzNWJmOWY5YTg5Y2ZmNDJiYjc0MWJjMTZlMzdjYzggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM2OGQ0NWY4MDIxNzIzMWQ3NTcwZGYwMjgyNDA0
MDRmOWZkMzFhZDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21h
IDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMjQgQXByIDIwMjEgMTA6MzQ6
NDcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHVzZSBhIGRpY3Rpb25hcmllcyBmb3Ig
ZW52aXJvbm1lbnQKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJl
c21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL2NoZWNrL21lc29u
LmJ1aWxkIGIvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQKLWluZGV4IDlhOGM0MmMuLjZiYjM0NmEg
MTAwNjQ0CitpbmRleCBmMjkwZTJlLi5hM2ZmY2I2IDEwMDY0NAogLS0tIGEvdGVzdHMvY2hlY2sv
bWVzb24uYnVpbGQKICsrKyBiL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCi1AQCAtMTYxLDE0ICsx
NjEsMTkgQEAgZm9yZWFjaCB0IDogY29yZV90ZXN0cworQEAgLTE2NCwxNCArMTY0LDE5IEBAIGZv
cmVhY2ggdCA6IGNvcmVfdGVzdHMKICAgICAgICBpbnN0YWxsOiBpbnN0YWxsZWRfdGVzdHNfZW5h
YmxlZCwKICAgICAgKQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10
aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUt
aW5zdGFsbGVkX3Rlc3RzLnBhdGNoCmluZGV4IGNiNDdmNzI0NGYuLjJhNmU0YTFmZTEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAw
NC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3RhbGxlZF90ZXN0cy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAw
MDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM5NzY0YmQyYjlmOWRhNGEwNzA3OWY3NmEyZjY4YmFm
NDBjMTQzYjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQxZmQ2NjhkYjM0NTNmNjM0
MDJjYzMwZWFiNWJjMjE3NzIyOGIzYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBK
b3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMiBNYXkg
MjAyMSAwMTo1ODowMSArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogYWRkIGhlbHBlciBz
Y3JpcHQgdG8gcnVuIHRoZSBpbnN0YWxsZWRfdGVzdHMKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWdu
ZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBjcmVh
dGUgbW9kZSAxMDA3NTUgdGVzdHMvY2hlY2svdGVtcGxhdGUuc2guaW4KIAogZGlmZiAtLWdpdCBh
L3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkIGIvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQKLWluZGV4
IDZiYjM0NmEuLmZlNTc5MzUgMTAwNjQ0CitpbmRleCBhM2ZmY2I2Li5iOTA3ZGNmIDEwMDY0NAog
LS0tIGEvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQKICsrKyBiL3Rlc3RzL2NoZWNrL21lc29uLmJ1
aWxkCi1AQCAtMTg1LDYgKzE4NSwyMyBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCitAQCAtMTg4
LDYgKzE4OCwyMyBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCiAgICAgICAgICBpbnN0YWxsX2Rp
cjogaW5zdGFsbGVkX3Rlc3RzX21ldGFkaXIsCiAgICAgICAgICBjb25maWd1cmF0aW9uOiB0ZXN0
X2NvbmYKICAgICAgICApCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjQuMTIuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEu
MjQuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjBfMS4yNi4wLmJiCmluZGV4IGQyMjRiODBlYjMuLmFkNWM1NGZhNWQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yNC4x
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
XzEuMjYuMC5iYgpAQCAtMjIsNyArMjIsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVy
LmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0cmVhbWVyL2dzdHJlYW1lci0ke1BWfS50YXIueAogICAg
ICAgICAgICBmaWxlOi8vMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25t
ZW50LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3Jp
cHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYjM1MjJkMWI0ZmUxNzRmZmYzYjNjN2YwNjAzNDkzZTIzNjdiZDFj
NDNmNTgwNGRmMTViNjM0YmQyMmIxMDM2ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYjJlZTQw
MjgwMTBjMjViNzc2ZWZmYTdjMzk2YzdlM2UxODYxYjYwYjk0MTdlNDE2ZjQ5MTRhYmNkZmYyNzlm
IgogCiBQQUNLQUdFQ09ORklHID8/PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BURVNUX0VOQUJM
RUQnLCAnMScsICd0ZXN0cycsICcnLCBkKX0gXAogICAgICAgICAgICAgICAgICAgIGNoZWNrIFwK
LS0gCjIuNDQuMQoK

--===============0101197873065087647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstbase-1.0.so.0.2412.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2412.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2412.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2412.0 /usr/lib/.debug/libgstnet-1.0.so.0.2412.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2412.0-gdb.py", added "/usr/lib/.debug/libgstbase-1.0.so.0.2600.0 /usr/libexec/installed-tests/gstreamer/.debug/gst_gstidstr_noinline /usr/libexec/installed-tests/gstreamer/.debug/gst_gstidstr /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2600.0-gdb.py /usr/lib/.debug/libgstreamer-1.0.so.0.2600.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2600.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2600.0 /usr/lib/.debug/libgstnet-1.0.so.0.2600.0 /usr/libexec/installed-tests/gstreamer/.debug/gst_gstvecdeque"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 16839199 to 17254367 (+2%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: FILELIST: added "/usr/include/gstreamer-1.0/gst/gstvecdeque.h /usr/include/gstreamer-1.0/gst/gstidstr.h /usr/share/cmake/FindGStreamer.cmake"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6179112 to 6390946 (+3%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGSIZE changed from 24519 to 25025 (+2%)
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
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGSIZE changed from 39990 to 40384 (+1%)
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
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGSIZE changed from 51014 to 51483 (+1%)
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
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: FILELIST: added "/usr/libexec/installed-tests/gstreamer/gst_gstvecdeque.sh /usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline /usr/libexec/installed-tests/gstreamer/gst_gstidstr.sh /usr/share/installed-tests/gstreamer/gst_gstidstr_noinline.test /usr/share/installed-tests/gstreamer/gst_gstidstr.test /usr/libexec/installed-tests/gstreamer/gst_gstidstr /usr/share/installed-tests/gstreamer/gst_gstvecdeque.test /usr/libexec/installed-tests/gstreamer/gst_gstvecdeque /usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline.sh"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGSIZE changed from 3982159 to 4075533 (+2%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/gst/printf -> /usr/src/debug/gstreamer1.0/1.26.0/gst/printf, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/plugins/elements -> /usr/src/debug/gstreamer1.0/1.26.0/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.24.12
 /libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/generic -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/generic, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.26.0/tests/check/elements, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/tests/validate -> /usr/src/debug/gstreamer1.0/1.26.0/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.26.0/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.24.12/gst/parse -> /usr/src/debug/gstreamer1.0/1.26.0/gst/parse, directory renamed /usr
 /src/debug/gstreamer1.0/1.24.12/tools -> /usr/src/debug/gstreamer1.0/1.26.0/tools, removed "/usr/src/debug/gstreamer1.0/1.24.12/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerrecord.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquark.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquery.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpad.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerrecord.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststructure.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdatetime.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelementfactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpadtemplate.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpreset.c
  /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevice.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsample.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpadtemplate.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/capslist.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsample.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsystemclock.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gststream.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstparamspecs.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstelement.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstsegment.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdebugutils.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginfeature.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbus.h /u
 sr/src/debug/gstreamer1.0/1.24.12/gst/gstplugin.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdebugutils.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginfeature.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistrybinary.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreams.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmeta.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcaps.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpoll.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttask.h /usr/src/debug/gstreamer1.0/1.24.12/gst
 /gstinfo.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistrybinary.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreams.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferlist.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcpp.cc /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstiterator.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmessage.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbin.c /usr/src/debug/gstreamer1.0/
 1.24.12/tests/check/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefind.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceprovider.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefind.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceprovider.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstprintf.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstallocator.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstallocator.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/
 gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginloader.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceproviderfactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdeviceproviderfactory.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpluginloader.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbufferpool.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaglist.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttoc.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaglist.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcapsfeatures.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gst
 protection.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreamcollection.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistry.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gststreamcollection.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstenumtypes.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbytearrayinterface.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstghostpad.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpipeline.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpromise.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstenumtypes.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstabi.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpipe
 line.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstformat.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsturi.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstatomicqueue.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevicemonitor.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcompat.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstformat.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstobject.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontext.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdevicemonitor.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbin.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstatomicqueue.c /usr/src/debug
 /gstreamer1.0/1.24.12/gst/gstpreset.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracer.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerfactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstbuffer.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracer.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstcontroller.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/struct_x86_64.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/
 gstobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstdeinit.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsterror.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstparse.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquark.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstvalue.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstutils.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstclock.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsterror.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstevent.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmemory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gst_private.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdynamictypefactory.c /usr/src/debug/gstreamer1.0/1.24
 .12/gst/gstparse.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstminiobject.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstdynamictypefactory.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolbinding.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolbinding.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstchildproxy.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistrychunks.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstregistrychunks.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaskpool.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttagsetter.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttocsetter.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerutils.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.24.12/gst
 /gsttagsetter.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttaskpool.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gst.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttracerutils.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gst.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolsource.h /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefindfactory.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gstcontrolsource.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gsttypefindfactory.h /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.24.12/gst/gst.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.24.12/tests/check/gst/gsttag.c", added "/usr/src/debug/gstreamer1.0/1.26.0/gst/gststreams.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdebugutils.c /usr/src/debug/gstreamer1.0/1.26.0/tests/chec
 k/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdebugutils.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gststreams.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstidstr.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolsource.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstabi.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolsource.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstminiobject.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparamspecs.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstprotection.c /usr/src/debug/gstreamer
 1.0/1.26.0/gst/gstbufferpool.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpad.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstutils.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpipeline.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstdeinit.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gst.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gst_private.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gst.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontext.h /usr/src/debug/gstreamer1.0/1.
 26.0/gst/gstelement.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsegment.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttaglist.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstelementfactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceproviderfactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttaglist.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerrecord.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbus.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceproviderfactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerrecord.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttask.h /usr/src/debug/gstreamer1.0/1.26.0/gst/g
 stcapsfeatures.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceprovider.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginfeature.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerfactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginloader.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdeviceprovider.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginfeature.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerfactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpluginloader.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdatetime.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstprintf.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gst.c /usr/src/debug/gstreamer1.0/1.26.0/gs
 t/gstbuffer.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstchildproxy.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstatomicqueue.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttag.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstformat.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcompat.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevice.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstformat.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmemory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstobject.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstinfo.c /usr/src/debug/gstreamer1.0/
 1.26.0/gst/gsttypefind.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstinfo.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstprotection.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttypefind.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstghostpad.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstvecdeque.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsturi.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gststream.c /usr/src/debug/gstreamer1.0/1.26.0/g
 st/gstdynamictypefactory.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttoc.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdynamictypefactory.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbin.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpoll.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstiterator.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstenumtypes.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstenumtypes.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmessage.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpromise.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcpp.cc /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvecdeque.c /us
 r/src/debug/gstreamer1.0/1.26.0/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvecdeque.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/capslist.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcaps.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsample.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracer.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmeta.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstallocator.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsystemclock.
 c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstallocator.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsystemclock.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrybinary.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrychunks.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstvalue.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstclock.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsterror.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstevent.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstidstr.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparse.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstquery.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrybinary.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistrychunks.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsterror.c /usr/src/debug/gstreamer1
 .0/1.26.0/gst/gstevent.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/struct_x86_64.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstidstr.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstparse.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolbinding.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstplugin.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpreset.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbufferlist.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstsample.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracer.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstcontrolbinding.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpadtemplate.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.26.0/t
 ests/check/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstpadtemplate.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttagsetter.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttocsetter.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttypefindfactory.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttypefindfactory.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstcontroller.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerutils.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstregistry.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttracerutils.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstvalue.c /usr/src/debug/gstreame
 r1.0/1.26.0/gst/gsttaskpool.h /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gsttaskpool.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbytearrayinterface.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevicemonitor.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gstdevicemonitor.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gststructure.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gststreamcollection.c /usr/src/debug/gstreamer1.0/1.26.0/tests/check/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.26.0/gst/gststreamcollection.h /usr/src/debug/gstreamer1.0/1.26.0/gst/gstidstr-private.h"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9557226 to 9729501 (+2%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstreamer-1.0.so.0.2412.0 /usr/lib/libgstbase-1.0.so.0.2412.0 /usr/lib/libgstnet-1.0.so.0.2412.0 /usr/lib/libgstcontroller-1.0.so.0.2412.0 /usr/lib/libgstcheck-1.0.so.0.2412.0", added "/usr/lib/libgstnet-1.0.so.0.2600.0 /usr/lib/libgstreamer-1.0.so.0.2600.0 /usr/lib/libgstbase-1.0.so.0.2600.0 /usr/lib/libgstcheck-1.0.so.0.2600.0 /usr/lib/libgstcontroller-1.0.so.0.2600.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PKGSIZE changed from 3310710 to 3358366 (+1%)
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
packages/core2-64-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.12.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.0.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/core2-64-poky-linux/gstreamer1.0: PV changed from "1.24.12" to "1.26.0"
packages/core2-64-poky-linux/gstreamer1.0: PKGV changed from 1.24.12 [default] to 1.26.0 [default]
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

--===============0101197873065087647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-dev: FILELIST: added "/usr/include/gstreamer-1.0/gst/gstvecdeque.h /usr/include/gstreamer-1.0/gst/gstidstr.h /usr/share/cmake/FindGStreamer.cmake"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0-ptest: FILELIST: added "/usr/libexec/installed-tests/gstreamer/gst_gstidstr /usr/share/installed-tests/gstreamer/gst_gstidstr.test /usr/share/installed-tests/gstreamer/gst_gstidstr_noinline.test /usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline.sh /usr/libexec/installed-tests/gstreamer/gst_gstidstr_noinline /usr/libexec/installed-tests/gstreamer/gst_gstvecdeque /usr/share/installed-tests/gstreamer/gst_gstvecdeque.test /usr/libexec/installed-tests/gstreamer/gst_gstvecdeque.sh /usr/libexec/installed-tests/gstreamer/gst_gstidstr.sh"
packages/core2-64-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcheck-1.0.so.0.2412.0 /usr/lib/libgstnet-1.0.so.0.2412.0 /usr/lib/libgstbase-1.0.so.0.2412.0 /usr/lib/libgstreamer-1.0.so.0.2412.0 /usr/lib/libgstcontroller-1.0.so.0.2412.0", added "/usr/lib/libgstcheck-1.0.so.0.2600.0 /usr/lib/libgstnet-1.0.so.0.2600.0 /usr/lib/libgstreamer-1.0.so.0.2600.0 /usr/lib/libgstbase-1.0.so.0.2600.0 /usr/lib/libgstcontroller-1.0.so.0.2600.0"
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

--===============0101197873065087647==--

