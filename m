Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A97D5E15E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17420.1765872166883494933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kZlunTPr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=g159YGeU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262ee5db-5fd38018-91b3-4033-b63a-27c77f3cd315-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sJnu5VdII6KBheuGQ8ckP5xUvAa7TfpKVHO85N7VPso=;
	b=kZlunTPrC6wolFAdqt0Sti0c4eEmA4iALF1x6RX6pK92JIFq+y93sHR3RUFadgON
	023oDfVk1k3jwtECpRU7s7AB/UzllWnJUhv+OVBHLrWF4V88SbZOorynqq8LvUnqnKy
	Fjgt1cBegilImhlVqQ3KHYktiuBh5HQkdaDcPaZ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sJnu5VdII6KBheuGQ8ckP5xUvAa7TfpKVHO85N7VPso=;
	b=g159YGeUM0vZGsEfcFLLXe0b8hWmCu61gPkcrl3RaeZZ7pxlqkccACUHaQkvipfw
	abd9v+1eZzkc39siXF+5BrgFPnfmSSaIbXkEZ0XR+H+kpzhfByonFpohpDhubcBIgfb
	bLj0dR7TRuWgdG1in5qXGc8ED6vnDedix7lKJNpA=
Content-Type: multipart/mixed; boundary="===============3137040131663594665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0: upgrading to 1.26.9 SUCCEEDED
Message-ID: <0101019b262ee5db-5fd38018-91b3-4033-b63a-27c77f3cd315-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227901

--===============3137040131663594665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.26.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.26.7-1.26.9.patch
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
From 4f0b4dd5a71b53d10781e4b5f05428ea75cae1b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:17:12 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.26.7 -> 1.26.9

---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.26.7.bb => gstreamer1.0_1.26.9.bb}        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.7.bb => gstreamer1.0_1.26.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b040..50a4199d5a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From 4e11f7081484004ea7e353b483c50cdfd4c7f662 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index ccfc869813..d627bbc01d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
+From c3db314c0b230eebd4e3486fef29f569ed99b5e8 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 0a77e90..cadfaeb 100644
+index 864526f..4076a33 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -664,6 +664,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b..c06970e56b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From b25021638416607e4a744998d0286703903f00c8 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445..f475fc3214 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From 68a6ddb73dfbc08514c24c98d85661cf799fac47 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
index 444165a869..c66f614629 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
+SRC_URI[sha256sum] = "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff23aecde80670c8"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============3137040131663594665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstbase-1.0.so.0.2607.0 /usr/lib/libgstnet-1.0.so.0.2607.0 /usr/lib/libgstcontroller-1.0.so.0.2607.0 /usr/lib/libgstreamer-1.0.so.0.2607.0 /usr/lib/libgstcheck-1.0.so.0.2607.0", added "/usr/lib/libgstnet-1.0.so.0.2609.0 /usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstbase-1.0.so.0.2609.0 /usr/lib/libgstreamer-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2607.0 to libgstbase-1.0.so.0.2609.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2607.0 to libgstcheck-1.0.so.0.2609.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2607.0 to libgstcontroller-1.0.so.0.2609.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2607.0 to libgstnet-1.0.so.0.2609.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2607.0 to libgstreamer-1.0.so.0.2609.0
  /usr/lib/libgstbase-1.0.so.0.2607.0 moved to /usr/lib/libgstbase-1.0.so.0.2609.0
  /usr/lib/libgstcheck-1.0.so.0.2607.0 moved to /usr/lib/libgstcheck-1.0.so.0.2609.0
  /usr/lib/libgstcontroller-1.0.so.0.2607.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2609.0
  /usr/lib/libgstnet-1.0.so.0.2607.0 moved to /usr/lib/libgstnet-1.0.so.0.2609.0
  /usr/lib/libgstreamer-1.0.so.0.2607.0 moved to /usr/lib/libgstreamer-1.0.so.0.2609.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2607.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py

--===============3137040131663594665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.26.7-1.26.9.patch"

RnJvbSA0ZjBiNGRkNWE3MWI1M2QxMDc4MWU0YjVmMDU0MjhlYTc1Y2FlMWIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6MTc6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjA6IHVwZ3JhZGUgMS4yNi43IC0+IDEuMjYuOQoKLS0tCiAuLi4vMDAwMS10ZXN0
cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaCAgIHwgMiArLQog
Li4uLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoICAg
ICAgICB8IDQgKystLQogLi4uLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZp
cm9ubWVudC5wYXRjaCAgICAgICB8IDIgKy0KIC4uLjQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQt
dG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggfCAyICstCiAuLi4ve2dzdHJlYW1lcjEu
MF8xLjI2LjcuYmIgPT4gZ3N0cmVhbWVyMS4wXzEuMjYuOS5iYn0gICAgICAgIHwgMiArLQogNSBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjBfMS4yNi43LmJiID0+
IGdzdHJlYW1lcjEuMF8xLjI2LjkuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhl
LWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50
YWlvbi11c2VkLWluLW1lc29uLnBhdGNoCmluZGV4IGUxZDg3MGIwNDAuLjUwYTQxOTlkNWEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAv
MDAwMS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEt
dGVzdHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGFkNGM1NzdmZjhkMjlmNmRiYWY1Y2EyZDAxM2U5ZDIxYzQ0ZjkxMjIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRlMTFmNzA4MTQ4NDAwNGVhN2UzNTNiNDgz
YzUwY2RmZDRjN2Y2NjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJl
c21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTEgQXByIDIwMjEgMTk6
NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJlc3BlY3QgdGhlIGlkZW50ZW50
YWlvbiB1c2VkIGluIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwt
dGhlLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRj
aAppbmRleCBjY2ZjODY5ODEzLi5kNjI3YmJjMDFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQt
Zm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFs
bC10aGUtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMzMzA2MzM2MDc5MWUxNzhk
ZTEzODMwNGUyOWFiMjI2NDU4MmQ5MTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGMz
ZGIzMTRjMGIyMzBlZWJkNGUzNDg2ZmVmMjlmNTY5ZWQ5OWI1ZTggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERh
dGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVz
dHM6IGFkZCBzdXBwb3J0IGZvciBpbnN0YWxsIHRoZSB0ZXN0cwpAQCAtMTksNyArMTksNyBAQCBT
aWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBj
cmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvY2hlY2svdGVtcGxhdGUudGVzdC5pbgogCiBkaWZmIC0t
Z2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMGE3N2U5MC4uY2FkZmFlYiAx
MDA2NDQKK2luZGV4IDg2NDUyNmYuLjQwNzZhMzMgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAog
KysrIGIvbWVzb24uYnVpbGQKIEBAIC02NjQsNiArNjY0LDEwIEBAIGlmIGJhc2hjb21wX2RlcC5m
b3VuZCgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAw
My10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoCmluZGV4IDEy
MzYyOTBlMmIuLmMwNjk3MGU1NmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9y
LWVudmlyb25tZW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25t
ZW50LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNzRjNmFjZTgzZTk2OTdhYWUwYjIxYmEy
NmYzMTZiNzkyNzljMzljIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMjUwMjE2Mzg0
MTY2MDdlNGE3NDQ5OThkMDI4NjcwMzkwM2YwMGM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQs
IDI0IEFwciAyMDIxIDEwOjM0OjQ3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiB1c2Ug
YSBkaWN0aW9uYXJpZXMgZm9yIGVudmlyb25tZW50CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1z
Y3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3Jp
cHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2gKaW5kZXggZGYzODJhNDQ0NS4uZjQ3
NWZjMzIxNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFs
bGVkX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWluc3Rh
bGxlZF90ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTMxYWI0NzdlZWQwNjFjYzcy
ZWQ2Nzk1YjQ4Mzc5NWQ1M2FmNmRmYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjhh
NmRkYjczZGZiYzA4NTE0YzI0Yzk4ZDg1NjYxY2Y3OTlmYWM0NyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0
ZTogU3VuLCAyIE1heSAyMDIxIDAxOjU4OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3Rz
OiBhZGQgaGVscGVyIHNjcmlwdCB0byBydW4gdGhlIGluc3RhbGxlZF90ZXN0cwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2Ljcu
YmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjYu
OS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjYuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2LjkuYmIKaW5kZXggNDQ0
MTY1YTg2OS4uYzY2ZjYxNDYyOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2LjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2LjkuYmIKQEAgLTIyLDcgKzIyLDcgQEAg
U1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdHJlYW1l
ci9nc3RyZWFtZXItJHtQVn0udGFyLngKICAgICAgICAgICAgZmlsZTovLzAwMDMtdGVzdHMtdXNl
LWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3Rz
LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE4YTVlMjE0MTE0
ZGM1MDE0MDc2OTdkZDQ1ODUxNGJiYTYyY2FkZDU0MTRjNjBmNzkzY2Y3MDE0MWE0ZDBiYjMiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOGVlODc3MmU0NjgxMDJlYmU4NmQ0MTRkOGM0Yzc0NDBkZDkx
ZDlmM2U5Mzk2OTUyZmYyM2FlY2RlODA2NzBjOCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJi
LnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9IFwK
ICAgICAgICAgICAgICAgICAgICBjaGVjayBcCi0tIAoyLjQ3LjEKCg==

--===============3137040131663594665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstcontroller-1.0.so.0.2607.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2607.0-gdb.py /usr/lib/.debug/libgstreamer-1.0.so.0.2607.0 /usr/lib/.debug/libgstbase-1.0.so.0.2607.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2607.0 /usr/lib/.debug/libgstnet-1.0.so.0.2607.0", added "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py /usr/lib/.debug/libgstcontroller-1.0.so.0.2609.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2609.0 /usr/lib/.debug/libgstbase-1.0.so.0.2609.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2609.0 /usr/lib/.debug/libgstnet-1.0.so.0.2609.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 17629567 to 17631839 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6481508 to 6481612 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.26.9/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tools -> /usr/src/debug/gstreamer1.0/1.26.9/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.26.9/tests/check/elements, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/gst -> /usr/src/debug/gstreamer1.0/1.26.9/gst, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tests/vali
 date -> /usr/src/debug/gstreamer1.0/1.26.9/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tests/check/gst -> /usr/src/debug/gstreamer1.0/1.26.9/tests/check/gst, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.26.9/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tests/check/generic -> /usr/src/debug/gstreamer1.0/1.26.9/tests/check/generic, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.26.9/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/plugins/elements -> /usr/src/debug/gstreamer1.0/1.26.9/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/gst/parse -> /usr/src/debug/gstreamer1.0/1.26.9/gst/parse, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/libs/gst/ba
 se -> /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.26.7/gst/printf -> /usr/src/debug/gstreamer1.0/1.26.9/gst/printf
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9738032 to 9738771 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcontroller-1.0.so.0.2607.0 /usr/lib/libgstbase-1.0.so.0.2607.0 /usr/lib/libgstreamer-1.0.so.0.2607.0 /usr/lib/libgstcheck-1.0.so.0.2607.0 /usr/lib/libgstnet-1.0.so.0.2607.0", added "/usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0 /usr/lib/libgstbase-1.0.so.0.2609.0 /usr/lib/libgstreamer-1.0.so.0.2609.0 /usr/lib/libgstnet-1.0.so.0.2609.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.7.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.9.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0: PV changed from "1.26.7" to "1.26.9"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2607.0 to libgstbase-1.0.so.0.2609.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2607.0 to libgstcheck-1.0.so.0.2609.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2607.0 to libgstcontroller-1.0.so.0.2609.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2607.0 to libgstnet-1.0.so.0.2609.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2607.0 to libgstreamer-1.0.so.0.2609.0
  /usr/lib/libgstbase-1.0.so.0.2607.0 moved to /usr/lib/libgstbase-1.0.so.0.2609.0
  /usr/lib/libgstcheck-1.0.so.0.2607.0 moved to /usr/lib/libgstcheck-1.0.so.0.2609.0
  /usr/lib/libgstcontroller-1.0.so.0.2607.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2609.0
  /usr/lib/libgstnet-1.0.so.0.2607.0 moved to /usr/lib/libgstnet-1.0.so.0.2609.0
  /usr/lib/libgstreamer-1.0.so.0.2607.0 moved to /usr/lib/libgstreamer-1.0.so.0.2609.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2607.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py

--===============3137040131663594665==--

