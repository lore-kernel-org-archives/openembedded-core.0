Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070B9107639D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14639.1775054152486170389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T7i4E6+5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YgGc9SqM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d49793be2-772d32bf-ac6f-4c30-aad3-8c6531eba90b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VO1n+blQtQ8lFR3emT+C5eaWXOoXK5TByJCzVjTkN0I=;
	b=T7i4E6+5E7oD3qljpd9kpsHH2bq1D2lfsOO2Dr4QYqMcHW0rNf9uQ7JqRkPGr1rd
	Tti2q7KXatsQJFXqx/GgGlkecwIADi3I0JqSdaj38WdgUsB0vkhVLSqnCL2hyAx8wtZ
	zQ/HRXLw1VVP/HWQtVlIG4ZCEz0v0Oe5nOFT/bI8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VO1n+blQtQ8lFR3emT+C5eaWXOoXK5TByJCzVjTkN0I=;
	b=YgGc9SqMoDw5xZEPYofjTRsay1pBpayeLkafgR1bEEZRoF8l7I6kI/GleKKStQ4O
	7n/jt+lElrgB5qF34ImkJIvQvyH+G95iA3YVDOxn9T9Ys4VOv7dKRKDRWCW5B9qlIgT
	89OijPYfySuzYqo/pRY2+GjYzhCWmNE/NfBJTD08=
Content-Type: multipart/mixed; boundary="===============3730943947805889383=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0: upgrading to 1.28.1 SUCCEEDED
Message-ID: <0101019d49793be2-772d32bf-ac6f-4c30-aad3-8c6531eba90b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234431

--===============3730943947805889383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.28.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.26.9-1.28.1.patch
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
From 1d3ee4c2ee6b710dfbed2bbe89cb5ed81ed66751 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 13:56:58 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.26.9 -> 1.28.1

---
 ...ts-respect-the-idententaion-used-in-meson.patch |  2 +-
 ...2-tests-add-support-for-install-the-tests.patch | 14 +++++++-------
 ...-tests-use-a-dictionaries-for-environment.patch |  2 +-
 ...-helper-script-to-run-the-installed_tests.patch |  2 +-
 ...treamer1.0_1.26.9.bb => gstreamer1.0_1.28.1.bb} |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb => gstreamer1.0_1.28.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b040..3576187ff0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From 7b0df1fab5165ae84b7ffeb2e9315164afd62a2f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index ccfc869813..4d67b172d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
+From aec359fe8640cce9118072f3f8e6ba6c5c6b8461 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -12,17 +12,17 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
  meson.build                  |  4 ++++
- meson_options.txt            |  1 +
+ meson.options                |  1 +
  tests/check/meson.build      | 22 +++++++++++++++++++++-
  tests/check/template.test.in |  3 +++
  4 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 0a77e90..cadfaeb 100644
+index 955857e..8a5c5ea 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -664,6 +664,10 @@ if bashcomp_dep.found()
+@@ -660,6 +660,10 @@ if bashcomp_dep.found()
    endif
  endif
  
@@ -33,10 +33,10 @@ index 0a77e90..cadfaeb 100644
  plugins_install_dir = join_paths(get_option('libdir'), 'gstreamer-1.0')
  
  pkgconfig = import('pkgconfig')
-diff --git a/meson_options.txt b/meson_options.txt
+diff --git a/meson.options b/meson.options
 index 39255cf..78af552 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
+--- a/meson.options
++++ b/meson.options
 @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b..cb85fc2017 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From b69b72607ad8881ae7220b69cd2d748ae524a176 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445..fc5445e782 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From 209895ce7d90f85bf564ff3c66b51f1c0aa62c43 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.1.bb
index c66f614629..14d0e776b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff23aecde80670c8"
+SRC_URI[sha256sum] = "b65e2ffa35bdbf8798cb75c23ffc3d05e484e48346ff7546844ba85217664504"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============3730943947805889383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: FILELIST: added "/usr/include/gstreamer-1.0/gst/gstmetafactory.h /usr/include/gstreamer-1.0/gst/gstcpuid.h"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstbase-1.0.so.0.2609.0 /usr/lib/libgstreamer-1.0.so.0.2609.0 /usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstnet-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0", added "/usr/lib/libgstcheck-1.0.so.0.2801.0 /usr/lib/libgstbase-1.0.so.0.2801.0 /usr/lib/libgstreamer-1.0.so.0.2801.0 /usr/lib/libgstcontroller-1.0.so.0.2801.0 /usr/lib/libgstnet-1.0.so.0.2801.0"
packages/x86-64-v3-poky-linux/gstreamer1.0: PACKAGES: added "gstreamer1.0-locale-ar"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2609.0 to libgstbase-1.0.so.0.2801.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2609.0 to libgstcheck-1.0.so.0.2801.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2609.0 to libgstcontroller-1.0.so.0.2801.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2609.0 to libgstnet-1.0.so.0.2801.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2609.0 to libgstreamer-1.0.so.0.2801.0
  /usr/lib/libgstbase-1.0.so.0.2609.0 moved to /usr/lib/libgstbase-1.0.so.0.2801.0
  /usr/lib/libgstcheck-1.0.so.0.2609.0 moved to /usr/lib/libgstcheck-1.0.so.0.2801.0
  /usr/lib/libgstcontroller-1.0.so.0.2609.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2801.0
  /usr/lib/libgstnet-1.0.so.0.2609.0 moved to /usr/lib/libgstnet-1.0.so.0.2801.0
  /usr/lib/libgstreamer-1.0.so.0.2609.0 moved to /usr/lib/libgstreamer-1.0.so.0.2801.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2801.0-gdb.py
  /usr/include/gstreamer-1.0/gst/gstcpuid.h was added
  /usr/include/gstreamer-1.0/gst/gstmetafactory.h was added

--===============3730943947805889383==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.26.9-1.28.1.patch"

RnJvbSAxZDNlZTRjMmVlNmI3MTBkZmJlZDJiYmU4OWNiNWVkODFlZDY2NzUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMzo1Njo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMDogdXBncmFkZSAxLjI2LjkgLT4gMS4yOC4xCgotLS0KIC4uLnRzLXJlc3BlY3Qt
dGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIHwgIDIgKy0KIC4uLjItdGVzdHMt
YWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoIHwgMTQgKysrKysrKy0tLS0t
LS0KIC4uLi10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoIHwg
IDIgKy0KIC4uLi1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNo
IHwgIDIgKy0KIC4uLnRyZWFtZXIxLjBfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMF8xLjI4LjEu
YmJ9IHwgIDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFt
ZXIxLjBfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMF8xLjI4LjEuYmJ9ICg5NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAx
LXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJl
c3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCmluZGV4IGUxZDg3MGIw
NDAuLjM1NzYxODdmZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNl
ZC1pbi1tZXNvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDEtdGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4t
bWVzb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFkNGM1NzdmZjhkMjlmNmRiYWY1Y2Ey
ZDAxM2U5ZDIxYzQ0ZjkxMjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdiMGRmMWZh
YjUxNjVhZTg0YjdmZmViMmU5MzE1MTY0YWZkNjJhMmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1
biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJl
c3BlY3QgdGhlIGlkZW50ZW50YWlvbiB1c2VkIGluIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1
cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0
YWxsLXRoZS10ZXN0cy5wYXRjaAppbmRleCBjY2ZjODY5ODEzLi40ZDY3YjE3MmQ2IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDIt
dGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQt
c3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGMzMzA2MzM2MDc5MWUxNzhkZTEzODMwNGUyOWFiMjI2NDU4MmQ5MTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGFlYzM1OWZlODY0MGNjZTkxMTgwNzJmM2Y4ZTZiYTZjNWM2Yjg0NjEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5q
b3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBzdXBwb3J0IGZvciBpbnN0YWxsIHRoZSB0ZXN0cwpA
QCAtMTIsMTcgKzEyLDE3IEBAIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tCiBTaWduZWQtb2ZmLWJ5
OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIC0tLQogIG1lc29uLmJ1
aWxkICAgICAgICAgICAgICAgICAgfCAgNCArKysrCi0gbWVzb25fb3B0aW9ucy50eHQgICAgICAg
ICAgICB8ICAxICsKKyBtZXNvbi5vcHRpb25zICAgICAgICAgICAgICAgIHwgIDEgKwogIHRlc3Rz
L2NoZWNrL21lc29uLmJ1aWxkICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKystCiAgdGVz
dHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbiB8ICAzICsrKwogIDQgZmlsZXMgY2hhbmdlZCwgMjkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9j
aGVjay90ZW1wbGF0ZS50ZXN0LmluCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29u
LmJ1aWxkCi1pbmRleCAwYTc3ZTkwLi5jYWRmYWViIDEwMDY0NAoraW5kZXggOTU1ODU3ZS4uOGE1
YzVlYSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTY2
NCw2ICs2NjQsMTAgQEAgaWYgYmFzaGNvbXBfZGVwLmZvdW5kKCkKK0BAIC02NjAsNiArNjYwLDEw
IEBAIGlmIGJhc2hjb21wX2RlcC5mb3VuZCgpCiAgICBlbmRpZgogIGVuZGlmCiAgCkBAIC0zMywx
MCArMzMsMTAgQEAgaW5kZXggMGE3N2U5MC4uY2FkZmFlYiAxMDA2NDQKICBwbHVnaW5zX2luc3Rh
bGxfZGlyID0gam9pbl9wYXRocyhnZXRfb3B0aW9uKCdsaWJkaXInKSwgJ2dzdHJlYW1lci0xLjAn
KQogIAogIHBrZ2NvbmZpZyA9IGltcG9ydCgncGtnY29uZmlnJykKLWRpZmYgLS1naXQgYS9tZXNv
bl9vcHRpb25zLnR4dCBiL21lc29uX29wdGlvbnMudHh0CitkaWZmIC0tZ2l0IGEvbWVzb24ub3B0
aW9ucyBiL21lc29uLm9wdGlvbnMKIGluZGV4IDM5MjU1Y2YuLjc4YWY1NTIgMTAwNjQ0Ci0tLS0g
YS9tZXNvbl9vcHRpb25zLnR4dAotKysrIGIvbWVzb25fb3B0aW9ucy50eHQKKy0tLSBhL21lc29u
Lm9wdGlvbnMKKysrKyBiL21lc29uLm9wdGlvbnMKIEBAIC0xNiw2ICsxNiw3IEBAIG9wdGlvbign
cG9pc29uaW5nJywgdHlwZSA6ICdib29sZWFuJywgdmFsdWUgOiBmYWxzZSwgZGVzY3JpcHRpb24g
OiAnRW5hYmxlIHBvaXNvCiAgb3B0aW9uKCdtZW1vcnktYWxpZ25tZW50JywgdHlwZTogJ2NvbWJv
JywKICAgICAgICAgY2hvaWNlcyA6IFsnMScsICcyJywgJzQnLCAnOCcsICcxNicsICczMicsICc2
NCcsICcxMjgnLCAnMjU2JywgJzUxMicsICcxMDI0JywgJzIwNDgnLCAnNDA5NicsICc4MTkyJywg
J21hbGxvYycsICdwYWdlc2l6ZSddLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1m
b3ItZW52aXJvbm1lbnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVu
dC5wYXRjaAppbmRleCAxMjM2MjkwZTJiLi5jYjg1ZmMyMDE3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEt
ZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFy
aWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzc0YzZhY2U4
M2U5Njk3YWFlMGIyMWJhMjZmMzE2Yjc5Mjc5YzM5YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYjY5YjcyNjA3YWQ4ODgxYWU3MjIwYjY5Y2QyZDc0OGFlNTI0YTE3NiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwu
Y29tPgogRGF0ZTogU2F0LCAyNCBBcHIgMjAyMSAxMDozNDo0NyArMDEwMAogU3ViamVjdDogW1BB
VENIXSB0ZXN0czogdXNlIGEgZGljdGlvbmFyaWVzIGZvciBlbnZpcm9ubWVudApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRl
c3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDA0LXRlc3Rz
LWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoCmluZGV4
IGRmMzgyYTQ0NDUuLmZjNTQ0NWU3ODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10
by1ydW4tdGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQt
dG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUz
MWFiNDc3ZWVkMDYxY2M3MmVkNjc5NWI0ODM3OTVkNTNhZjZkZmMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDIwOTg5NWNlN2Q5MGY4NWJmNTY0ZmYzYzY2YjUxZjFjMGFhNjJjNDMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3Nl
QGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMiBNYXkgMjAyMSAwMTo1ODowMSArMDEwMAogU3ViamVj
dDogW1BBVENIXSB0ZXN0czogYWRkIGhlbHBlciBzY3JpcHQgdG8gcnVuIHRoZSBpbnN0YWxsZWRf
dGVzdHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjBfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMF8xLjI4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2LjkuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4y
OC4xLmJiCmluZGV4IGM2NmY2MTQ2MjkuLjE0ZDBlNzc2YjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yNi45LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yOC4xLmJiCkBA
IC0yMiw3ICsyMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Au
b3JnL3NyYy9nc3RyZWFtZXIvZ3N0cmVhbWVyLSR7UFZ9LnRhci54CiAgICAgICAgICAgIGZpbGU6
Ly8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhl
LWluc3RhbGxlZF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4ZWU4NzcyZTQ2ODEwMmViZTg2ZDQxNGQ4YzRjNzQ0MGRkOTFkOWYzZTkzOTY5NTJmZjIz
YWVjZGU4MDY3MGM4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI2NWUyZmZhMzViZGJmODc5OGNi
NzVjMjNmZmMzZDA1ZTQ4NGU0ODM0NmZmNzU0Njg0NGJhODUyMTc2NjQ1MDQiCiAKIFBBQ0tBR0VD
T05GSUcgPz89ICIke0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJ3Rl
c3RzJywgJycsIGQpfSBcCiAgICAgICAgICAgICAgICAgICAgY2hlY2sgXAotLSAKMi40Ny4xCgo=

--===============3730943947805889383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstcheck-1.0.so.0.2609.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2609.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2609.0 /usr/lib/.debug/libgstbase-1.0.so.0.2609.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2609.0", added "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2801.0-gdb.py /usr/lib/.debug/libgstreamer-1.0.so.0.2801.0 /usr/lib/.debug/libgstnet-1.0.so.0.2801.0 /usr/lib/.debug/libgstbase-1.0.so.0.2801.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2801.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2801.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 18365039 to 18715879 (+2%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: FILELIST: added "/usr/include/gstreamer-1.0/gst/gstcpuid.h /usr/include/gstreamer-1.0/gst/gstmetafactory.h"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6481612 to 6778557 (+5%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGSIZE changed from 13998 to 13883 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGSIZE changed from 28463 to 28344 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGSIZE changed from 52434 to 53090 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGSIZE changed from 32510 to 32380 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGSIZE changed from 37787 to 37646 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGSIZE changed from 36788 to 36675 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGSIZE changed from 40955 to 41391 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGSIZE changed from 42423 to 42275 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGSIZE changed from 10731 to 10631 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGSIZE changed from 38113 to 37954 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGSIZE changed from 41069 to 41556 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGSIZE changed from 28283 to 28177 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGSIZE changed from 31282 to 31147 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGSIZE changed from 41210 to 41083 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGSIZE changed from 39467 to 39363 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGSIZE changed from 34099 to 33960 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGSIZE changed from 39747 to 40234 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGSIZE changed from 40656 to 40490 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGSIZE changed from 38549 to 38435 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGSIZE changed from 38503 to 38376 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGSIZE changed from 14226 to 14167 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGSIZE changed from 30112 to 29953 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGSIZE changed from 40384 to 40265 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGSIZE changed from 38482 to 38371 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGSIZE changed from 39768 to 40280 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGSIZE changed from 40186 to 40651 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGSIZE changed from 40910 to 40787 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGSIZE changed from 42137 to 42628 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGSIZE changed from 51483 to 51307 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGSIZE changed from 36462 to 36331 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGSIZE changed from 39168 to 39697 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGSIZE changed from 12676 to 12556 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGSIZE changed from 51119 to 51655 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGSIZE changed from 39682 to 39566 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGSIZE changed from 39130 to 39012 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGSIZE changed from 52692 to 53258 (+1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGSIZE changed from 41106 to 40863 (-1%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGSIZE changed from 36044 to 35944 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGSIZE changed from 33144 to 33044 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGSIZE changed from 4152939 to 4222563 (+2%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.28.1/tests/check/elements, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.28.1/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.28.1/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/validate -> /usr/src/debug/gstreamer1.0/1.28.1/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tools -> /usr/src/debug/gstreamer1.0/1.28.1/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.28.1/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/generic -> /usr/src/debug/gstreamer1.0/1.28.1/tests/check/generic, directory renamed /usr/src/debug/gstreamer1.0/1
 .26.9/plugins/elements -> /usr/src/debug/gstreamer1.0/1.28.1/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.28.1/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.28.1/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/gst/printf -> /usr/src/debug/gstreamer1.0/1.28.1/gst/printf, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/gst -> /usr/src/debug/gstreamer1.0/1.28.1/tests/check/gst, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.28.1/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.28.1/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.28.1/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/
 1.26.9/libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.28.1/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/gst/parse -> /usr/src/debug/gstreamer1.0/1.28.1/gst/parse, removed "/usr/src/debug/gstreamer1.0/1.26.9/gst/gstdatetime.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdebugutils.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdebugutils.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsturi.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstghostpad.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttoc.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttoc.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstmeta.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbufferlist.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstsystemclock.h /usr/src/debug/gst
 reamer1.0/1.26.9/gst/gstregistrybinary.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstregistrychunks.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstregistrybinary.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstregistrychunks.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcontrolbinding.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcontrolbinding.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gststructure.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttypefindfactory.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttypefindfactory.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbufferpool.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstenumtypes.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttagsetter.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstenumtypes.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbus.h /usr/src/
 debug/gstreamer1.0/1.26.9/gst/gsttracerutils.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdevicemonitor.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbytearrayinterface.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdevicemonitor.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttracerutils.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gststreams.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gststreams.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstvecdeque.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttracerrecord.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstinfo.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstvecdeque.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttracerrecord.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpipeline.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcontrolsource.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstiterator.h /usr/src/debug/gstreame
 r1.0/1.26.9/gst/gstcontrolsource.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdeviceprovider.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdeviceprovider.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstsample.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttracer.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstformat.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbuffer.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcaps.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcompat.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdevice.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstformat.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstmemory.h /usr/src/debug/gstreamer1.0/1.26
 .9/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstallocator.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gststreamcollection.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstobject.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstchildproxy.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpadtemplate.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstallocator.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstidstr-private.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpadtemplate.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstplugin.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpoll.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpreset.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstsample.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gststreamcollection.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttracer.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gst.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpad.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstprotection.h /usr/src/debug/gst
 reamer1.0/1.26.9/gst/gst.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstelementfactory.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttaglist.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttypefind.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttypefind.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstelement.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcontext.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstsegment.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttaglist.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttask.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstidstr.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstclock.h /usr/src/debug/gstreamer1.0/1
 .26.9/gst/gstparse.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstmessage.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpromise.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstquery.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstutils.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstvalue.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsterror.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpluginloader.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttaskpool.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstregistry.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstidstr.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstparse.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpluginloader.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttaskpool.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gst
 utils.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsterror.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcapsfeatures.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpluginfeature.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttracerfactory.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstbin.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstpluginfeature.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttracerfactory.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstminiobject.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstminiobject.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gst_private.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstparamspecs.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdeviceproviderfactory.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstatomicqueue.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstparamspec
 s.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdeviceproviderfactory.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdynamictypefactory.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.26.9/gst/gstevent.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gsttocsetter.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstdynamictypefactory.h /usr/src/debug/gstreamer1.0/1.26.9/gst/gstevent.c", added "/usr/src/debug/gstreamer1.0/1.28.1/gst/gstdatetime.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsturi.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdebugutils.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdatetime.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdebugutils.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsturi.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstghostpad.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstghostpad.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmeta.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttoc.c /usr/src/debug/
 gstreamer1.0/1.28.1/gst/gsttoc.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmeta.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstclock.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstparse.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstquery.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstutils.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstvalue.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsterror.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstidstr.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbufferlist.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbufferlist.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstidstr.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstclock.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstparse.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstquery.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstutils.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstvalue.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsterror.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcpuid.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstsystemclock.h
  /usr/src/debug/gstreamer1.0/1.28.1/gst/gstregistrybinary.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstregistrychunks.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstregistrybinary.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstregistrychunks.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstsystemclock.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcontrolbinding.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcontrolbinding.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gststructure.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttypefindfactory.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gststructure.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttypefindfactory.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbufferpool.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstenumtypes.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbus.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstenumtypes.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbufferpool.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbus.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttr
 acerutils.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdevicemonitor.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbytearrayinterface.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdevicemonitor.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttracerutils.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gststreams.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gststreams.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstvecdeque.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstinfo.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpipeline.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttracerrecord.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstinfo.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstvecdeque.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttracerrecord.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstiterator.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpipeline.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcontrolsource.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstiterator.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcontrolsource.c 
 /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdeviceprovider.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdeviceprovider.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcaps.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstplugin.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpreset.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstobject.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstsample.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbuffer.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdevice.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstformat.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmemory.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttracer.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstformat.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmemory.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbuffer.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcaps.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcompat.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdevice.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstobject.h /usr/src/debug/g
 streamer1.0/1.28.1/gst/gstallocator.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstplugin.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpoll.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gststreamcollection.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstchildproxy.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpadtemplate.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstallocator.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstidstr-private.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpadtemplate.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstchildproxy.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpoll.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gststreamcollection.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gst.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpad.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstprotection.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gst.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcontext.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstelement.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstelementfactory.
 h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpad.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstprotection.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstsegment.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttaglist.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttask.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttypefind.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstelementfactory.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttypefind.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstelement.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcontext.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstsegment.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttaglist.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttask.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmessage.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpromise.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttagsetter.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmessage.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpromise.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpluginloader.
 h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttaskpool.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstregistry.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstregistry.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpreset.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpluginloader.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstsample.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttaskpool.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttracer.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcapsfeatures.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstcapsfeatures.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpluginfeature.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbin.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttracerfactory.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstbin.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstpluginfeature.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttracerfactory.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstminiobject.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstminiobject.c /usr/src/debug/gstrea
 mer1.0/1.28.1/gst/gst_private.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstatomicqueue.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstparamspecs.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdeviceproviderfactory.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstatomicqueue.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstparamspecs.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdeviceproviderfactory.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmetafactory.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdynamictypefactory.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttagsetter.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttocsetter.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstevent.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gsttocsetter.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstdynamictypefactory.h /usr/src/debug/gstreamer1.0/1.28.1/gst/gstmetafactory.c /usr/src/debug/gstreamer1.0/1.28.1/gst/gstevent.c"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9738771 to 10022785 (+3%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstreamer-1.0.so.0.2609.0 /usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0 /usr/lib/libgstnet-1.0.so.0.2609.0 /usr/lib/libgstbase-1.0.so.0.2609.0", added "/usr/lib/libgstcontroller-1.0.so.0.2801.0 /usr/lib/libgstreamer-1.0.so.0.2801.0 /usr/lib/libgstnet-1.0.so.0.2801.0 /usr/lib/libgstcheck-1.0.so.0.2801.0 /usr/lib/libgstbase-1.0.so.0.2801.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGSIZE changed from 3356046 to 3409318 (+2%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: PV changed from "1.26.9" to "1.28.1"
packages/x86-64-v3-poky-linux/gstreamer1.0: PKGV changed from 1.26.9 [default] to 1.28.1 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.9.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.1.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0: PACKAGES: added "gstreamer1.0-locale-ar"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2609.0 to libgstbase-1.0.so.0.2801.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2609.0 to libgstcheck-1.0.so.0.2801.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2609.0 to libgstcontroller-1.0.so.0.2801.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2609.0 to libgstnet-1.0.so.0.2801.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2609.0 to libgstreamer-1.0.so.0.2801.0
  /usr/lib/libgstbase-1.0.so.0.2609.0 moved to /usr/lib/libgstbase-1.0.so.0.2801.0
  /usr/lib/libgstcheck-1.0.so.0.2609.0 moved to /usr/lib/libgstcheck-1.0.so.0.2801.0
  /usr/lib/libgstcontroller-1.0.so.0.2609.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2801.0
  /usr/lib/libgstnet-1.0.so.0.2609.0 moved to /usr/lib/libgstnet-1.0.so.0.2801.0
  /usr/lib/libgstreamer-1.0.so.0.2609.0 moved to /usr/lib/libgstreamer-1.0.so.0.2801.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2801.0-gdb.py
  /usr/include/gstreamer-1.0/gst/gstcpuid.h was added
  /usr/include/gstreamer-1.0/gst/gstmetafactory.h was added

--===============3730943947805889383==--

