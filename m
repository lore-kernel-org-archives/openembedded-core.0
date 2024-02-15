Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868E9C54791
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.20329.1708018344921822261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YMGlq4Ti;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ivNxFo8o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd3abf8-acf21121-edf0-43c6-8453-54d9331adbfe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IN8TLPwCWDkO5E6v87aw1EgNOZ5JRhqmySTJUqDM0Kk=;
	b=YMGlq4TiIFvYyDix0ElUd/h5awd+o1yB2mcJn3szATsDPGp25BJfQtpWzCRNusoE
	2MlH0I5eUTvirnbc9eMYQck/29fevUYP2cDZfWNP8Hd7Vwpj3p9lMORzaZo71r5MAuE
	+4tThYGbc0wm3uxsuWxsFh8cnp1drzxhy4T+YTu4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IN8TLPwCWDkO5E6v87aw1EgNOZ5JRhqmySTJUqDM0Kk=;
	b=ivNxFo8oXUdrFKR0vOLsh2NRSi3nVpS3iuUVhDYUhZLn5o1p7MsKWjT0KNRTHVHY
	Um8Gm7LKDlz8P2vAK0rRQk6Vw7qtZzh5HYHBEzmLCW5r5FFzU2caT6+2C6hheluje5a
	2MozyvGfGq0+DIOBhEcXG+Ca4+8HRg5wFiBUPFDg=
Content-Type: multipart/mixed; boundary="===============2871732509611344502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.22.10 FAILED
Message-ID: <0101018dadd3abf8-acf21121-edf0-43c6-8453-54d9331adbfe-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195664

--===============2871732509611344502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0* to *1.22.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.22.9-1.22.10.patch
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
From 62d5778f340110426d5bf248d95f0c19118f6a0a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 15:21:58 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.22.9 -> 1.22.10

---
 ...spect-the-idententaion-used-in-meson.patch |  2 +-
 ...ts-add-support-for-install-the-tests.patch |  4 +-
 ...s-use-a-dictionaries-for-environment.patch | 20 +++++-----
 ...er-script-to-run-the-installed_tests.patch | 40 +++++++++----------
 ...r1.0_1.22.9.bb => gstreamer1.0_1.22.10.bb} |  2 +-
 5 files changed, 32 insertions(+), 36 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.9.bb => gstreamer1.0_1.22.10.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 1b9278db04..0d839bd6c8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 559e1dd850b2b9eb3a415aa43e932e5e48f605cd Mon Sep 17 00:00:00 2001
+From 5372cd5bf2a9dd247b9c5fc6e4fe248046dbb085 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 568e38cbf1..64717e66c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 08b1aaff972a7f6349373fc1ad4cc23081adb52c Mon Sep 17 00:00:00 2001
+From 27e977d03b0f7c1d0bf19621ef0cec0585410e7b Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -20,7 +20,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index f9f591d..3906fb3 100644
+index 60c7bec..f7650b1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -606,6 +606,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 10a6dcc619..0fd830f150 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,7 +1,7 @@
-From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17 00:00:00 2001
+From 7041bc5adf9501beb1428d8bbae6b351a6bf07f9 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
-Subject: [PATCH 3/4] tests: use a dictionaries for environment
+Subject: [PATCH] tests: use a dictionaries for environment
 
 meson environment() can't be passed to configure_file and it is needed for installed_tests,
 use a dictionary as this is simplest solution to install the environment.
@@ -9,15 +9,16 @@ use a dictionary as this is simplest solution to install the environment.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- subprojects/gstreamer/tests/check/meson.build | 21 ++++++++++++-------
+ tests/check/meson.build | 21 +++++++++++++--------
  1 file changed, 13 insertions(+), 8 deletions(-)
 
-diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
-index 00a138a568..48ec2532f8 100644
---- a/subprojects/gstreamer/tests/check/meson.build
-+++ b/subprojects/gstreamer/tests/check/meson.build
-@@ -161,14 +161,19 @@ foreach t : core_tests
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index f2d400f..50dff7f 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
+@@ -160,14 +160,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
  
@@ -45,6 +46,3 @@ index 00a138a568..48ec2532f8 100644
  
      if installed_tests_enabled
        test_conf = configuration_data()
--- 
-2.33.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index efa004f8ce..5689dc9fbb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,7 +1,7 @@
-From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17 00:00:00 2001
+From 1b1d1ce4227b6bea7c7def5dac4a663486e070c2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
-Subject: [PATCH 4/4] tests: add helper script to run the installed_tests
+Subject: [PATCH] tests: add helper script to run the installed_tests
 
 - this is a bash script that will run the installed_tests
 with some of the environment variables used in the meson
@@ -10,18 +10,19 @@ testing framework.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- subprojects/gstreamer/tests/check/meson.build   | 17 +++++++++++++++++
- .../gstreamer/tests/check/template.sh.in        |  9 +++++++++
- .../gstreamer/tests/check/template.test.in      |  2 +-
+ tests/check/meson.build      | 17 +++++++++++++++++
+ tests/check/template.sh.in   |  9 +++++++++
+ tests/check/template.test.in |  2 +-
  3 files changed, 27 insertions(+), 1 deletion(-)
- create mode 100755 subprojects/gstreamer/tests/check/template.sh.in
+ create mode 100755 tests/check/template.sh.in
 
-diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
-index 48ec2532f8..7dc4990d4e 100644
---- a/subprojects/gstreamer/tests/check/meson.build
-+++ b/subprojects/gstreamer/tests/check/meson.build
-@@ -185,6 +185,23 @@ foreach t : core_tests
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index 50dff7f..2b9e979 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
+@@ -184,6 +184,23 @@ foreach t : core_tests
          install_dir: installed_tests_metadir,
          configuration: test_conf
        )
@@ -45,11 +46,11 @@ index 48ec2532f8..7dc4990d4e 100644
      endif
  
      test(test_name, exe, env: env, timeout : 3 * 60)
-diff --git a/subprojects/gstreamer/tests/check/template.sh.in b/subprojects/gstreamer/tests/check/template.sh.in
+diff --git a/tests/check/template.sh.in b/tests/check/template.sh.in
 new file mode 100755
-index 0000000000..cf7d31b0ea
+index 0000000..cf7d31b
 --- /dev/null
-+++ b/subprojects/gstreamer/tests/check/template.sh.in
++++ b/tests/check/template.sh.in
 @@ -0,0 +1,9 @@
 +#!/bin/sh
 +
@@ -60,15 +61,12 @@ index 0000000000..cf7d31b0ea
 +GST_REGISTRY=@GST_REGISTRY@
 +GST_STATE_IGNORE_ELEMENTS="@GST_STATE_IGNORE_ELEMENTS@"
 +exec @TEST@
-diff --git a/subprojects/gstreamer/tests/check/template.test.in b/subprojects/gstreamer/tests/check/template.test.in
-index f701627f87..b74ef6ad73 100644
---- a/subprojects/gstreamer/tests/check/template.test.in
-+++ b/subprojects/gstreamer/tests/check/template.test.in
+diff --git a/tests/check/template.test.in b/tests/check/template.test.in
+index f701627..b74ef6a 100644
+--- a/tests/check/template.test.in
++++ b/tests/check/template.test.in
 @@ -1,3 +1,3 @@
  [Test]
  Type=session
 -Exec=@installed_tests_dir@/@program@
 +Exec=@installed_tests_dir@/@program@.sh
--- 
-2.33.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
index b4ab6ad10c..c715106712 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "1e7124d347e8cdc80f08ec1d370c201be513002af1102bb20e83c5279cb48ebd"
+SRC_URI[sha256sum] = "969aaef396f252ce925132a4be2aa004e0320f5c1baf0acaaae09c544a6759f4"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.42.0


--===============2871732509611344502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.22.9-1.22.10.patch"

RnJvbSA2MmQ1Nzc4ZjM0MDExMDQyNmQ1YmYyNDhkOTVmMGMxOTExOGY2YTBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTU6MjE6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjA6IHVwZ3JhZGUgMS4yMi45IC0+IDEuMjIuMTAKCi0tLQogLi4uc3BlY3QtdGhl
LWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIHwgIDIgKy0KIC4uLnRzLWFkZC1zdXBw
b3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaCB8ICA0ICstCiAuLi5zLXVzZS1hLWRpY3Rp
b25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2ggfCAyMCArKysrKy0tLS0tCiAuLi5lci1zY3Jp
cHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggfCA0MCArKysrKysrKystLS0tLS0t
LS0tCiAuLi5yMS4wXzEuMjIuOS5iYiA9PiBnc3RyZWFtZXIxLjBfMS4yMi4xMC5iYn0gfCAgMiAr
LQogNSBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMF8xLjIy
LjkuYmIgPT4gZ3N0cmVhbWVyMS4wXzEuMjIuMTAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJl
c3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhl
LWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCmluZGV4IDFiOTI3OGRiMDQuLjBkODM5
YmQ2YzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNv
bi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLzAwMDEtdGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU1OWUxZGQ4NTBiMmI5ZWIzYTQxNWFhNDNlOTMyZTVl
NDhmNjA1Y2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUzNzJjZDViZjJhOWRkMjQ3
YjljNWZjNmU0ZmUyNDgwNDZkYmIwODUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBK
b3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTEgQXBy
IDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJlc3BlY3QgdGhl
IGlkZW50ZW50YWlvbiB1c2VkIGluIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9y
LWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10
ZXN0cy5wYXRjaAppbmRleCA1NjhlMzhjYmYxLi42NDcxN2U2NmMzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRk
LXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1m
b3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4YjFhYWZm
OTcyYTdmNjM0OTM3M2ZjMWFkNGNjMjMwODFhZGI1MmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDI3ZTk3N2QwM2IwZjdjMWQwYmYxOTYyMWVmMGNlYzA1ODU0MTBlN2IgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWls
LmNvbT4KIERhdGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gdGVzdHM6IGFkZCBzdXBwb3J0IGZvciBpbnN0YWxsIHRoZSB0ZXN0cwpAQCAtMjAsNyAr
MjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWls
LmNvbT4KICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbgog
CiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggZjlmNTkxZC4u
MzkwNmZiMyAxMDA2NDQKK2luZGV4IDYwYzdiZWMuLmY3NjUwYjEgMTAwNjQ0CiAtLS0gYS9tZXNv
bi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC02MDYsNiArNjA2LDEwIEBAIGlmIGJhc2hj
b21wX2RlcC5mb3VuZCgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZp
cm9ubWVudC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNo
CmluZGV4IDEwYTZkY2M2MTkuLjBmZDgzMGYxNTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9u
YXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9y
LWVudmlyb25tZW50LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBmZTgzMGYwZjc1ZjNiNGI0
MWUzZGJlZjhkNGNmNmVlNDEwM2M5ZTA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3
MDQxYmM1YWRmOTUwMWJlYjE0MjhkOGJiYWU2YjM1MWE2YmYwN2Y5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBE
YXRlOiBTYXQsIDI0IEFwciAyMDIxIDEwOjM0OjQ3ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0ggMy80
XSB0ZXN0czogdXNlIGEgZGljdGlvbmFyaWVzIGZvciBlbnZpcm9ubWVudAorU3ViamVjdDogW1BB
VENIXSB0ZXN0czogdXNlIGEgZGljdGlvbmFyaWVzIGZvciBlbnZpcm9ubWVudAogCiBtZXNvbiBl
bnZpcm9ubWVudCgpIGNhbid0IGJlIHBhc3NlZCB0byBjb25maWd1cmVfZmlsZSBhbmQgaXQgaXMg
bmVlZGVkIGZvciBpbnN0YWxsZWRfdGVzdHMsCiB1c2UgYSBkaWN0aW9uYXJ5IGFzIHRoaXMgaXMg
c2ltcGxlc3Qgc29sdXRpb24gdG8gaW5zdGFsbCB0aGUgZW52aXJvbm1lbnQuCkBAIC05LDE1ICs5
LDE2IEBAIHVzZSBhIGRpY3Rpb25hcnkgYXMgdGhpcyBpcyBzaW1wbGVzdCBzb2x1dGlvbiB0byBp
bnN0YWxsIHRoZSBlbnZpcm9ubWVudC4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tL21lcmdlX3Jl
cXVlc3RzLzc4OV0KIAogU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9z
ZUBnbWFpbC5jb20+CisKIC0tLQotIHN1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay9t
ZXNvbi5idWlsZCB8IDIxICsrKysrKysrKysrKy0tLS0tLS0KKyB0ZXN0cy9jaGVjay9tZXNvbi5i
dWlsZCB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogCi1kaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0
cmVhbWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkIGIvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rl
c3RzL2NoZWNrL21lc29uLmJ1aWxkCi1pbmRleCAwMGExMzhhNTY4Li40OGVjMjUzMmY4IDEwMDY0
NAotLS0tIGEvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCi0r
KysgYi9zdWJwcm9qZWN0cy9nc3RyZWFtZXIvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQKLUBAIC0x
NjEsMTQgKzE2MSwxOSBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCitkaWZmIC0tZ2l0IGEvdGVz
dHMvY2hlY2svbWVzb24uYnVpbGQgYi90ZXN0cy9jaGVjay9tZXNvbi5idWlsZAoraW5kZXggZjJk
NDAwZi4uNTBkZmY3ZiAxMDA2NDQKKy0tLSBhL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCisrKysg
Yi90ZXN0cy9jaGVjay9tZXNvbi5idWlsZAorQEAgLTE2MCwxNCArMTYwLDE5IEBAIGZvcmVhY2gg
dCA6IGNvcmVfdGVzdHMKICAgICAgICBpbnN0YWxsOiBpbnN0YWxsZWRfdGVzdHNfZW5hYmxlZCwK
ICAgICAgKQogIApAQCAtNDUsNiArNDYsMyBAQCBpbmRleCAwMGExMzhhNTY4Li40OGVjMjUzMmY4
IDEwMDY0NAogIAogICAgICBpZiBpbnN0YWxsZWRfdGVzdHNfZW5hYmxlZAogICAgICAgIHRlc3Rf
Y29uZiA9IGNvbmZpZ3VyYXRpb25fZGF0YSgpCi0tLSAKLTIuMzMuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMt
YWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRk
LWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2gKaW5kZXggZWZh
MDA0ZjhjZS4uNTY4OWRjOWZiYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1
bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1y
dW4tdGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNGRjYmFi
ZWJjYTJhZDZmMWZkZDU5ZWUzNWE4NTgwODJlODdkYjdiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMWIxZDFjZTQyMjdiNmJlYTdjN2RlZjVkYWM0YTY2MzQ4NmUwNzBjMiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21h
aWwuY29tPgogRGF0ZTogU3VuLCAyIE1heSAyMDIxIDAxOjU4OjAxICswMTAwCi1TdWJqZWN0OiBb
UEFUQ0ggNC80XSB0ZXN0czogYWRkIGhlbHBlciBzY3JpcHQgdG8gcnVuIHRoZSBpbnN0YWxsZWRf
dGVzdHMKK1N1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBoZWxwZXIgc2NyaXB0IHRvIHJ1biB0
aGUgaW5zdGFsbGVkX3Rlc3RzCiAKIC0gdGhpcyBpcyBhIGJhc2ggc2NyaXB0IHRoYXQgd2lsbCBy
dW4gdGhlIGluc3RhbGxlZF90ZXN0cwogd2l0aCBzb21lIG9mIHRoZSBlbnZpcm9ubWVudCB2YXJp
YWJsZXMgdXNlZCBpbiB0aGUgbWVzb24KQEAgLTEwLDE4ICsxMCwxOSBAQCB0ZXN0aW5nIGZyYW1l
d29yay4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVlc3RzLzc4OV0KIAogU2ln
bmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CisKIC0t
LQotIHN1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay9tZXNvbi5idWlsZCAgIHwgMTcg
KysrKysrKysrKysrKysrKysKLSAuLi4vZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnNo
LmluICAgICAgICB8ICA5ICsrKysrKysrKwotIC4uLi9nc3RyZWFtZXIvdGVzdHMvY2hlY2svdGVt
cGxhdGUudGVzdC5pbiAgICAgIHwgIDIgKy0KKyB0ZXN0cy9jaGVjay9tZXNvbi5idWlsZCAgICAg
IHwgMTcgKysrKysrKysrKysrKysrKysKKyB0ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbiAgIHwg
IDkgKysrKysrKysrCisgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbiB8ICAyICstCiAgMyBm
aWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0gY3JlYXRlIG1v
ZGUgMTAwNzU1IHN1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5p
bgorIGNyZWF0ZSBtb2RlIDEwMDc1NSB0ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbgogCi1kaWZm
IC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkIGIv
c3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCi1pbmRleCA0OGVj
MjUzMmY4Li43ZGM0OTkwZDRlIDEwMDY0NAotLS0tIGEvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rl
c3RzL2NoZWNrL21lc29uLmJ1aWxkCi0rKysgYi9zdWJwcm9qZWN0cy9nc3RyZWFtZXIvdGVzdHMv
Y2hlY2svbWVzb24uYnVpbGQKLUBAIC0xODUsNiArMTg1LDIzIEBAIGZvcmVhY2ggdCA6IGNvcmVf
dGVzdHMKK2RpZmYgLS1naXQgYS90ZXN0cy9jaGVjay9tZXNvbi5idWlsZCBiL3Rlc3RzL2NoZWNr
L21lc29uLmJ1aWxkCitpbmRleCA1MGRmZjdmLi4yYjllOTc5IDEwMDY0NAorLS0tIGEvdGVzdHMv
Y2hlY2svbWVzb24uYnVpbGQKKysrKyBiL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCitAQCAtMTg0
LDYgKzE4NCwyMyBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCiAgICAgICAgICBpbnN0YWxsX2Rp
cjogaW5zdGFsbGVkX3Rlc3RzX21ldGFkaXIsCiAgICAgICAgICBjb25maWd1cmF0aW9uOiB0ZXN0
X2NvbmYKICAgICAgICApCkBAIC00NSwxMSArNDYsMTEgQEAgaW5kZXggNDhlYzI1MzJmOC4uN2Rj
NDk5MGQ0ZSAxMDA2NDQKICAgICAgZW5kaWYKICAKICAgICAgdGVzdCh0ZXN0X25hbWUsIGV4ZSwg
ZW52OiBlbnYsIHRpbWVvdXQgOiAzICogNjApCi1kaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0
cmVhbWVyL3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnNoLmluIGIvc3VicHJvamVjdHMvZ3N0cmVhbWVy
L3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnNoLmluCitkaWZmIC0tZ2l0IGEvdGVzdHMvY2hlY2svdGVt
cGxhdGUuc2guaW4gYi90ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbgogbmV3IGZpbGUgbW9kZSAx
MDA3NTUKLWluZGV4IDAwMDAwMDAwMDAuLmNmN2QzMWIwZWEKK2luZGV4IDAwMDAwMDAuLmNmN2Qz
MWIKIC0tLSAvZGV2L251bGwKLSsrKyBiL3N1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVj
ay90ZW1wbGF0ZS5zaC5pbgorKysrIGIvdGVzdHMvY2hlY2svdGVtcGxhdGUuc2guaW4KIEBAIC0w
LDAgKzEsOSBAQAogKyMhL2Jpbi9zaAogKwpAQCAtNjAsMTUgKzYxLDEyIEBAIGluZGV4IDAwMDAw
MDAwMDAuLmNmN2QzMWIwZWEKICtHU1RfUkVHSVNUUlk9QEdTVF9SRUdJU1RSWUAKICtHU1RfU1RB
VEVfSUdOT1JFX0VMRU1FTlRTPSJAR1NUX1NUQVRFX0lHTk9SRV9FTEVNRU5UU0AiCiArZXhlYyBA
VEVTVEAKLWRpZmYgLS1naXQgYS9zdWJwcm9qZWN0cy9nc3RyZWFtZXIvdGVzdHMvY2hlY2svdGVt
cGxhdGUudGVzdC5pbiBiL3N1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay90ZW1wbGF0
ZS50ZXN0LmluCi1pbmRleCBmNzAxNjI3Zjg3Li5iNzRlZjZhZDczIDEwMDY0NAotLS0tIGEvc3Vi
cHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnRlc3QuaW4KLSsrKyBiL3N1
YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay90ZW1wbGF0ZS50ZXN0LmluCitkaWZmIC0t
Z2l0IGEvdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbiBiL3Rlc3RzL2NoZWNrL3RlbXBsYXRl
LnRlc3QuaW4KK2luZGV4IGY3MDE2MjcuLmI3NGVmNmEgMTAwNjQ0CistLS0gYS90ZXN0cy9jaGVj
ay90ZW1wbGF0ZS50ZXN0LmluCisrKysgYi90ZXN0cy9jaGVjay90ZW1wbGF0ZS50ZXN0LmluCiBA
QCAtMSwzICsxLDMgQEAKICBbVGVzdF0KICBUeXBlPXNlc3Npb24KIC1FeGVjPUBpbnN0YWxsZWRf
dGVzdHNfZGlyQC9AcHJvZ3JhbUAKICtFeGVjPUBpbnN0YWxsZWRfdGVzdHNfZGlyQC9AcHJvZ3Jh
bUAuc2gKLS0tIAotMi4zMy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yMi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjIyLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTcl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjBfMS4yMi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wXzEuMjIuMTAuYmIKaW5kZXggYjRhYjZhZDEwYy4uYzcxNTEwNjcxMiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8x
LjIyLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMF8xLjIyLjEwLmJiCkBAIC0yMiw3ICsyMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3Ry
ZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3RyZWFtZXIvZ3N0cmVhbWVyLSR7UFZ9LnRhci54
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52
aXJvbm1lbnQucGF0Y2g7c3RyaXBsZXZlbD0zIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtdGVz
dHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2g7c3Ry
aXBsZXZlbD0zIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFlNzEyNGQz
NDdlOGNkYzgwZjA4ZWMxZDM3MGMyMDFiZTUxMzAwMmFmMTEwMmJiMjBlODNjNTI3OWNiNDhlYmQi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTY5YWFlZjM5NmYyNTJjZTkyNTEzMmE0YmUyYWEwMDRl
MDMyMGY1YzFiYWYwYWNhYWFlMDljNTQ0YTY3NTlmNCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9
IFwKICAgICAgICAgICAgICAgICAgICBjaGVjayBcCi0tIAoyLjQyLjAKCg==

--===============2871732509611344502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1858 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-411a75baa30b4c00336253b4ff07e7a40e707e81"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:411a75baa30b4c00336253b4ff07e7a40e707e81"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 340 Local 326 Mirrors 0 Missed 14 Current 393 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 449 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running task 807 of 2032 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_recipe_qa)
NOTE: Running task 879 of 2032 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_write_config)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_write_config: Succeeded
NOTE: Running setscene task 629 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1095 of 2032 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_fetch: Succeeded
NOTE: Running task 1096 of 2032 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_unpack: Succeeded
NOTE: Running task 1161 of 2032 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 717 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 719 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1757 of 2032 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1971 of 2032 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2014 tasks of which 2007 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215152145.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215152145.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gstreamer1.0-1.22.10-r0 do_patch: Applying patch '0003-tests-use-a-dictionaries-for-environment.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.22.10/gstreamer-1.22.10'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.22.10/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0003-tests-use-a-dictionaries-for-environment.patch
patching file meson.build
Hunk #1 FAILED at 160.
1 out of 1 hunk FAILED -- rejects in file meson.build
Patch 0003-tests-use-a-dictionaries-for-environment.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.22.10/temp/log.do_patch.401821
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_patch) failed with exit code '1'

--===============2871732509611344502==--

