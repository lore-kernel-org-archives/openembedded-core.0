Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A83C48BEE
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2101.1706810405467394132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OCWha7IT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NobDjvzR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d65d3fb99-4edff220-1b66-4d43-91e2-66fe658bd530-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xFvssyyidHAUyaXaA8qEYQsVz+TXiXu+6LEy8DdgJJc=;
	b=OCWha7IT7QoVRLScsZbCfAAlYIPjajyECCR6J7Vg5hfUx9xytnKO5L5N50w91osh
	uhaX68Q5r9Wttlnqf2oIrluHqT/KY4P4PPndw1kd7GbbZPKh1gdrpWO9r1VYlQtYxW+
	dqw5dX70TdwpcSsOWL9qenQbO/fMwcygKLpJW4k0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xFvssyyidHAUyaXaA8qEYQsVz+TXiXu+6LEy8DdgJJc=;
	b=NobDjvzRI9YyYy1kEElVL8nzTtlylnzjvLBRdVk4WAmWwAN2Br3GQkISGnLxayAL
	Vyh80/2TNnZEFx+/2kUPQG3wUDrFSMbrUov+PC44t24WhFQZQyYtIUViT5/vC8mz9HV
	9QGyusrF09+f/mavyTmEc8RHO+gQUNP8XPZIVWkQ=
Content-Type: multipart/mixed; boundary="===============8628977920723697720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.22.9 FAILED
Message-ID: <0101018d65d3fb99-4edff220-1b66-4d43-91e2-66fe658bd530-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194700

--===============8628977920723697720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0* to *1.22.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.22.8-1.22.9.patch
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
From 9cb548b78e4cc16b43fde4c34e02d56f81dd7ba5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 15:18:14 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.22.8 -> 1.22.9

---
 ...spect-the-idententaion-used-in-meson.patch |  2 +-
 ...ts-add-support-for-install-the-tests.patch |  4 +-
 ...s-use-a-dictionaries-for-environment.patch | 20 +++++-----
 ...er-script-to-run-the-installed_tests.patch | 40 +++++++++----------
 ...er1.0_1.22.8.bb => gstreamer1.0_1.22.9.bb} |  2 +-
 5 files changed, 32 insertions(+), 36 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.8.bb => gstreamer1.0_1.22.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 1b9278db04..3834efb941 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 559e1dd850b2b9eb3a415aa43e932e5e48f605cd Mon Sep 17 00:00:00 2001
+From c07dfa7d4c335f9ba61dde5744fbe02d98790bd5 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 568e38cbf1..309058a6db 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 08b1aaff972a7f6349373fc1ad4cc23081adb52c Mon Sep 17 00:00:00 2001
+From 336ea25ad91d58f2d4d52606d454c1a90e92c894 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -20,7 +20,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index f9f591d..3906fb3 100644
+index dd7de5c..a1ad40b 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -606,6 +606,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 10a6dcc619..b765fd185a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,7 +1,7 @@
-From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17 00:00:00 2001
+From 07ce61fead441c0f747da17de35378b9433e7ec6 Mon Sep 17 00:00:00 2001
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
index efa004f8ce..9ee7cbf80d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,7 +1,7 @@
-From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17 00:00:00 2001
+From aefde86bc1e3bb1a998aa928628f101041b4daf8 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
index 374a32ef96..b4ab6ad10c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "ad4e3db1771139b1db17b1afa7c05db083ae0100bd4da244b71f162dcce41bfc"
+SRC_URI[sha256sum] = "1e7124d347e8cdc80f08ec1d370c201be513002af1102bb20e83c5279cb48ebd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.42.0


--===============8628977920723697720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.22.8-1.22.9.patch"

RnJvbSA5Y2I1NDhiNzhlNGNjMTZiNDNmZGU0YzM0ZTAyZDU2ZjgxZGQ3YmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNToxODoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMDogdXBncmFkZSAxLjIyLjggLT4gMS4yMi45CgotLS0KIC4uLnNwZWN0LXRoZS1p
ZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaCB8ICAyICstCiAuLi50cy1hZGQtc3VwcG9y
dC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2ggfCAgNCArLQogLi4ucy11c2UtYS1kaWN0aW9u
YXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoIHwgMjAgKysrKystLS0tLQogLi4uZXItc2NyaXB0
LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoIHwgNDAgKysrKysrKysrLS0tLS0tLS0t
LQogLi4uZXIxLjBfMS4yMi44LmJiID0+IGdzdHJlYW1lcjEuMF8xLjIyLjkuYmJ9IHwgIDIgKy0K
IDUgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjBfMS4yMi44
LmJiID0+IGdzdHJlYW1lcjEuMF8xLjIyLjkuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3Bl
Y3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlk
ZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCmluZGV4IDFiOTI3OGRiMDQuLjM4MzRlZmI5
NDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LzAwMDEtdGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDU1OWUxZGQ4NTBiMmI5ZWIzYTQxNWFhNDNlOTMyZTVlNDhm
NjA1Y2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGMwN2RmYTdkNGMzMzVmOWJhNjFk
ZGU1NzQ0ZmJlMDJkOTg3OTBiZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3Nl
IFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTEgQXByIDIw
MjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJlc3BlY3QgdGhlIGlk
ZW50ZW50YWlvbiB1c2VkIGluIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWlu
c3RhbGwtdGhlLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0
cy5wYXRjaAppbmRleCA1NjhlMzhjYmYxLi4zMDkwNThhNmRiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1
cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3It
aW5zdGFsbC10aGUtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA4YjFhYWZmOTcy
YTdmNjM0OTM3M2ZjMWFkNGNjMjMwODFhZGI1MmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDMzNmVhMjVhZDkxZDU4ZjJkNGQ1MjYwNmQ0NTRjMWE5MGU5MmM4OTQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNv
bT4KIERhdGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gdGVzdHM6IGFkZCBzdXBwb3J0IGZvciBpbnN0YWxsIHRoZSB0ZXN0cwpAQCAtMjAsNyArMjAs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNv
bT4KICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbgogCiBk
aWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggZjlmNTkxZC4uMzkw
NmZiMyAxMDA2NDQKK2luZGV4IGRkN2RlNWMuLmExYWQ0MGIgMTAwNjQ0CiAtLS0gYS9tZXNvbi5i
dWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC02MDYsNiArNjA2LDEwIEBAIGlmIGJhc2hjb21w
X2RlcC5mb3VuZCgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9u
bWVudC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoCmlu
ZGV4IDEwYTZkY2M2MTkuLmI3NjVmZDE4NWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJp
ZXMtZm9yLWVudmlyb25tZW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVu
dmlyb25tZW50LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBmZTgzMGYwZjc1ZjNiNGI0MWUz
ZGJlZjhkNGNmNmVlNDEwM2M5ZTA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwN2Nl
NjFmZWFkNDQxYzBmNzQ3ZGExN2RlMzUzNzhiOTQzM2U3ZWM2IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRl
OiBTYXQsIDI0IEFwciAyMDIxIDEwOjM0OjQ3ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0ggMy80XSB0
ZXN0czogdXNlIGEgZGljdGlvbmFyaWVzIGZvciBlbnZpcm9ubWVudAorU3ViamVjdDogW1BBVENI
XSB0ZXN0czogdXNlIGEgZGljdGlvbmFyaWVzIGZvciBlbnZpcm9ubWVudAogCiBtZXNvbiBlbnZp
cm9ubWVudCgpIGNhbid0IGJlIHBhc3NlZCB0byBjb25maWd1cmVfZmlsZSBhbmQgaXQgaXMgbmVl
ZGVkIGZvciBpbnN0YWxsZWRfdGVzdHMsCiB1c2UgYSBkaWN0aW9uYXJ5IGFzIHRoaXMgaXMgc2lt
cGxlc3Qgc29sdXRpb24gdG8gaW5zdGFsbCB0aGUgZW52aXJvbm1lbnQuCkBAIC05LDE1ICs5LDE2
IEBAIHVzZSBhIGRpY3Rpb25hcnkgYXMgdGhpcyBpcyBzaW1wbGVzdCBzb2x1dGlvbiB0byBpbnN0
YWxsIHRoZSBlbnZpcm9ubWVudC4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVl
c3RzLzc4OV0KIAogU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBn
bWFpbC5jb20+CisKIC0tLQotIHN1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay9tZXNv
bi5idWlsZCB8IDIxICsrKysrKysrKysrKy0tLS0tLS0KKyB0ZXN0cy9jaGVjay9tZXNvbi5idWls
ZCB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQogCi1kaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0cmVh
bWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkIGIvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3Rz
L2NoZWNrL21lc29uLmJ1aWxkCi1pbmRleCAwMGExMzhhNTY4Li40OGVjMjUzMmY4IDEwMDY0NAot
LS0tIGEvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCi0rKysg
Yi9zdWJwcm9qZWN0cy9nc3RyZWFtZXIvdGVzdHMvY2hlY2svbWVzb24uYnVpbGQKLUBAIC0xNjEs
MTQgKzE2MSwxOSBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCitkaWZmIC0tZ2l0IGEvdGVzdHMv
Y2hlY2svbWVzb24uYnVpbGQgYi90ZXN0cy9jaGVjay9tZXNvbi5idWlsZAoraW5kZXggZjJkNDAw
Zi4uNTBkZmY3ZiAxMDA2NDQKKy0tLSBhL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCisrKysgYi90
ZXN0cy9jaGVjay9tZXNvbi5idWlsZAorQEAgLTE2MCwxNCArMTYwLDE5IEBAIGZvcmVhY2ggdCA6
IGNvcmVfdGVzdHMKICAgICAgICBpbnN0YWxsOiBpbnN0YWxsZWRfdGVzdHNfZW5hYmxlZCwKICAg
ICAgKQogIApAQCAtNDUsNiArNDYsMyBAQCBpbmRleCAwMGExMzhhNTY4Li40OGVjMjUzMmY4IDEw
MDY0NAogIAogICAgICBpZiBpbnN0YWxsZWRfdGVzdHNfZW5hYmxlZAogICAgICAgIHRlc3RfY29u
ZiA9IGNvbmZpZ3VyYXRpb25fZGF0YSgpCi0tLSAKLTIuMzMuMQotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRk
LWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhl
bHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2gKaW5kZXggZWZhMDA0
ZjhjZS4uOWVlN2NiZjgwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10
aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4t
dGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNGRjYmFiZWJj
YTJhZDZmMWZkZDU5ZWUzNWE4NTgwODJlODdkYjdiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYWVmZGU4NmJjMWUzYmIxYTk5OGFhOTI4NjI4ZjEwMTA0MWI0ZGFmOCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwu
Y29tPgogRGF0ZTogU3VuLCAyIE1heSAyMDIxIDAxOjU4OjAxICswMTAwCi1TdWJqZWN0OiBbUEFU
Q0ggNC80XSB0ZXN0czogYWRkIGhlbHBlciBzY3JpcHQgdG8gcnVuIHRoZSBpbnN0YWxsZWRfdGVz
dHMKK1N1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBoZWxwZXIgc2NyaXB0IHRvIHJ1biB0aGUg
aW5zdGFsbGVkX3Rlc3RzCiAKIC0gdGhpcyBpcyBhIGJhc2ggc2NyaXB0IHRoYXQgd2lsbCBydW4g
dGhlIGluc3RhbGxlZF90ZXN0cwogd2l0aCBzb21lIG9mIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMgdXNlZCBpbiB0aGUgbWVzb24KQEAgLTEwLDE4ICsxMCwxOSBAQCB0ZXN0aW5nIGZyYW1ld29y
ay4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVlc3RzLzc4OV0KIAogU2lnbmVk
LW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CisKIC0tLQot
IHN1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay9tZXNvbi5idWlsZCAgIHwgMTcgKysr
KysrKysrKysrKysrKysKLSAuLi4vZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnNoLmlu
ICAgICAgICB8ICA5ICsrKysrKysrKwotIC4uLi9nc3RyZWFtZXIvdGVzdHMvY2hlY2svdGVtcGxh
dGUudGVzdC5pbiAgICAgIHwgIDIgKy0KKyB0ZXN0cy9jaGVjay9tZXNvbi5idWlsZCAgICAgIHwg
MTcgKysrKysrKysrKysrKysrKysKKyB0ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbiAgIHwgIDkg
KysrKysrKysrCisgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbiB8ICAyICstCiAgMyBmaWxl
cyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0gY3JlYXRlIG1vZGUg
MTAwNzU1IHN1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbgor
IGNyZWF0ZSBtb2RlIDEwMDc1NSB0ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbgogCi1kaWZmIC0t
Z2l0IGEvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkIGIvc3Vi
cHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCi1pbmRleCA0OGVjMjUz
MmY4Li43ZGM0OTkwZDRlIDEwMDY0NAotLS0tIGEvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rlc3Rz
L2NoZWNrL21lc29uLmJ1aWxkCi0rKysgYi9zdWJwcm9qZWN0cy9nc3RyZWFtZXIvdGVzdHMvY2hl
Y2svbWVzb24uYnVpbGQKLUBAIC0xODUsNiArMTg1LDIzIEBAIGZvcmVhY2ggdCA6IGNvcmVfdGVz
dHMKK2RpZmYgLS1naXQgYS90ZXN0cy9jaGVjay9tZXNvbi5idWlsZCBiL3Rlc3RzL2NoZWNrL21l
c29uLmJ1aWxkCitpbmRleCA1MGRmZjdmLi4yYjllOTc5IDEwMDY0NAorLS0tIGEvdGVzdHMvY2hl
Y2svbWVzb24uYnVpbGQKKysrKyBiL3Rlc3RzL2NoZWNrL21lc29uLmJ1aWxkCitAQCAtMTg0LDYg
KzE4NCwyMyBAQCBmb3JlYWNoIHQgOiBjb3JlX3Rlc3RzCiAgICAgICAgICBpbnN0YWxsX2Rpcjog
aW5zdGFsbGVkX3Rlc3RzX21ldGFkaXIsCiAgICAgICAgICBjb25maWd1cmF0aW9uOiB0ZXN0X2Nv
bmYKICAgICAgICApCkBAIC00NSwxMSArNDYsMTEgQEAgaW5kZXggNDhlYzI1MzJmOC4uN2RjNDk5
MGQ0ZSAxMDA2NDQKICAgICAgZW5kaWYKICAKICAgICAgdGVzdCh0ZXN0X25hbWUsIGV4ZSwgZW52
OiBlbnYsIHRpbWVvdXQgOiAzICogNjApCi1kaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0cmVh
bWVyL3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnNoLmluIGIvc3VicHJvamVjdHMvZ3N0cmVhbWVyL3Rl
c3RzL2NoZWNrL3RlbXBsYXRlLnNoLmluCitkaWZmIC0tZ2l0IGEvdGVzdHMvY2hlY2svdGVtcGxh
dGUuc2guaW4gYi90ZXN0cy9jaGVjay90ZW1wbGF0ZS5zaC5pbgogbmV3IGZpbGUgbW9kZSAxMDA3
NTUKLWluZGV4IDAwMDAwMDAwMDAuLmNmN2QzMWIwZWEKK2luZGV4IDAwMDAwMDAuLmNmN2QzMWIK
IC0tLSAvZGV2L251bGwKLSsrKyBiL3N1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay90
ZW1wbGF0ZS5zaC5pbgorKysrIGIvdGVzdHMvY2hlY2svdGVtcGxhdGUuc2guaW4KIEBAIC0wLDAg
KzEsOSBAQAogKyMhL2Jpbi9zaAogKwpAQCAtNjAsMTUgKzYxLDEyIEBAIGluZGV4IDAwMDAwMDAw
MDAuLmNmN2QzMWIwZWEKICtHU1RfUkVHSVNUUlk9QEdTVF9SRUdJU1RSWUAKICtHU1RfU1RBVEVf
SUdOT1JFX0VMRU1FTlRTPSJAR1NUX1NUQVRFX0lHTk9SRV9FTEVNRU5UU0AiCiArZXhlYyBAVEVT
VEAKLWRpZmYgLS1naXQgYS9zdWJwcm9qZWN0cy9nc3RyZWFtZXIvdGVzdHMvY2hlY2svdGVtcGxh
dGUudGVzdC5pbiBiL3N1YnByb2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay90ZW1wbGF0ZS50
ZXN0LmluCi1pbmRleCBmNzAxNjI3Zjg3Li5iNzRlZjZhZDczIDEwMDY0NAotLS0tIGEvc3VicHJv
amVjdHMvZ3N0cmVhbWVyL3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnRlc3QuaW4KLSsrKyBiL3N1YnBy
b2plY3RzL2dzdHJlYW1lci90ZXN0cy9jaGVjay90ZW1wbGF0ZS50ZXN0LmluCitkaWZmIC0tZ2l0
IGEvdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbiBiL3Rlc3RzL2NoZWNrL3RlbXBsYXRlLnRl
c3QuaW4KK2luZGV4IGY3MDE2MjcuLmI3NGVmNmEgMTAwNjQ0CistLS0gYS90ZXN0cy9jaGVjay90
ZW1wbGF0ZS50ZXN0LmluCisrKysgYi90ZXN0cy9jaGVjay90ZW1wbGF0ZS50ZXN0LmluCiBAQCAt
MSwzICsxLDMgQEAKICBbVGVzdF0KICBUeXBlPXNlc3Npb24KIC1FeGVjPUBpbnN0YWxsZWRfdGVz
dHNfZGlyQC9AcHJvZ3JhbUAKICtFeGVjPUBpbnN0YWxsZWRfdGVzdHNfZGlyQC9AcHJvZ3JhbUAu
c2gKLS0tIAotMi4zMy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yMi44LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjIyLjkuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8x
LjIyLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjBfMS4yMi45LmJiCmluZGV4IDM3NGEzMmVmOTYuLmI0YWI2YWQxMGMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yMi44
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBf
MS4yMi45LmJiCkBAIC0yMiw3ICsyMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIu
ZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3RyZWFtZXIvZ3N0cmVhbWVyLSR7UFZ9LnRhci54CiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1l
bnQucGF0Y2g7c3RyaXBsZXZlbD0zIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtdGVzdHMtYWRk
LWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2g7c3RyaXBsZXZl
bD0zIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFkNGUzZGIxNzcxMTM5
YjFkYjE3YjFhZmE3YzA1ZGIwODNhZTAxMDBiZDRkYTI0NGI3MWYxNjJkY2NlNDFiZmMiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMWU3MTI0ZDM0N2U4Y2RjODBmMDhlYzFkMzcwYzIwMWJlNTEzMDAy
YWYxMTAyYmIyMGU4M2M1Mjc5Y2I0OGViZCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0
aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9IFwKICAg
ICAgICAgICAgICAgICAgICBjaGVjayBcCi0tIAoyLjQyLjAKCg==

--===============8628977920723697720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-5e56aaba3688157630fcdee18a20008bf9296ed1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5e56aaba3688157630fcdee18a20008bf9296ed1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 317 Local 303 Mirrors 0 Missed 14 Current 413 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 469 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 470 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running task 927 of 2022 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_recipe_qa)
NOTE: Running task 1006 of 2022 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_write_config)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 627 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1277 of 2022 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_fetch: Started
NOTE: Running setscene task 695 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_fetch: Succeeded
NOTE: Running task 1340 of 2022 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 2022 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 717 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 730 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1747 of 2022 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1961 of 2022 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.9-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2004 tasks of which 1997 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201151756.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201151756.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gstreamer1.0-1.22.9-r0 do_patch: Applying patch '0003-tests-use-a-dictionaries-for-environment.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.22.9/gstreamer-1.22.9'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.22.9/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0003-tests-use-a-dictionaries-for-environment.patch
patching file meson.build
Hunk #1 FAILED at 160.
1 out of 1 hunk FAILED -- rejects in file meson.build
Patch 0003-tests-use-a-dictionaries-for-environment.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.22.9/temp/log.do_patch.2040811
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb:do_patch) failed with exit code '1'

--===============8628977920723697720==--

