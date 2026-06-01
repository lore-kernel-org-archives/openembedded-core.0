Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C1CD98DA
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1569.1780328135766942518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MI87Tny2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z/EA2RW9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e83d3c0ae-287e568f-d8aa-4b1f-b4be-5de8fc8e5bde-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GC/1RA8vsOTSX8DC2qEcUP7680KRAToqveUxj7tWY6U=;
	b=MI87Tny282jXJD+Zppo/i+FZIOJtddhUxZZwHWUAyGShv4dMWzMEgnxQSAfynm1M
	rJBrDxkStr6quumjJPPoBMIUqJYdckuhQfsjMQB35UYosQn++rGoPBuIML5T0AwY6lZ
	8+AkzUsG/iamymV1ZbdU1k2IBbZqdLj8SxgQkV8M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GC/1RA8vsOTSX8DC2qEcUP7680KRAToqveUxj7tWY6U=;
	b=Z/EA2RW98G478BtFLJ7/pQn19CH97xH2bn/WBvfKJuo2y9KGsfweH7rvZ3rtstqr
	8FErYff8pR1qDMGK05ky1n2DU0/qO63CmenUyhv/Ex1LU6HdlaexTrN1fN1EDplcpBJ
	ihtVOGX6UOkrtzGP+o8foHMCagYFhJuEi5RTRd0w=
Content-Type: multipart/mixed; boundary="===============1841190236625404908=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0: upgrading to 1.28.3 SUCCEEDED
Message-ID: <0101019e83d3c0ae-287e568f-d8aa-4b1f-b4be-5de8fc8e5bde-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237942

--===============1841190236625404908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.28.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.28.2-1.28.3.patch
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
From 2611329a23a5510809db6b80c335ce9996405ba2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 12:45:49 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.28.2 -> 1.28.3

---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch      | 6 +++---
 .../0003-tests-use-a-dictionaries-for-environment.patch     | 2 +-
 ...tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.3.bb}      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b040..e9598d2e07 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From 4821a6696f42934772a5dd4f710810a8546a8a7a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 720a6f0c97..6b0de96b7c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
+From f97566ad336525069e821784d2ffb35126692e52 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 8adc055..b5c9e5b 100644
+index db74bdc..3c8df4d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -667,6 +667,10 @@ if bashcomp_dep.found()
+@@ -661,6 +661,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b..017be5ffb7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From a352feca3150af1a876f09ebc0e62c7acbcefefa Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445..596300ab98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From 7a5044ee70b74c6c16aaf5ee1bd44cfab3b63459 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.3.bb
index b727783746..97bb7e8920 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "ce5cd44d4ffeafdcc3dddaa072b2179c0b7cb1abf4e6c5d18d4375f8a39fe491"
+SRC_URI[sha256sum] = "5e84ecb942e136944eb9812f19cff7bcf05a85637482a32da55b892914c397d1"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============1841190236625404908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstbase-1.0.so.0.2802.0 /usr/lib/libgstnet-1.0.so.0.2802.0 /usr/lib/libgstcontroller-1.0.so.0.2802.0 /usr/lib/libgstreamer-1.0.so.0.2802.0 /usr/lib/libgstcheck-1.0.so.0.2802.0", added "/usr/lib/libgstcheck-1.0.so.0.2803.0 /usr/lib/libgstnet-1.0.so.0.2803.0 /usr/lib/libgstcontroller-1.0.so.0.2803.0 /usr/lib/libgstbase-1.0.so.0.2803.0 /usr/lib/libgstreamer-1.0.so.0.2803.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2802.0 to libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2802.0 to libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2802.0 to libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2802.0 to libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2802.0 to libgstreamer-1.0.so.0.2803.0
  /usr/lib/libgstbase-1.0.so.0.2802.0 moved to /usr/lib/libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0.2802.0 moved to /usr/lib/libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0.2802.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0.2802.0 moved to /usr/lib/libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0.2802.0 moved to /usr/lib/libgstreamer-1.0.so.0.2803.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2802.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2803.0-gdb.py

--===============1841190236625404908==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.28.2-1.28.3.patch"

RnJvbSAyNjExMzI5YTIzYTU1MTA4MDlkYjZiODBjMzM1Y2U5OTk2NDA1YmEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMjo0NTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMDogdXBncmFkZSAxLjI4LjIgLT4gMS4yOC4zCgotLS0KIC4uLi8wMDAxLXRlc3Rz
LXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIHwgMiArLQogLi4u
LzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBhdGNoICAgICAg
fCA2ICsrKy0tLQogLi4uLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9u
bWVudC5wYXRjaCAgICAgfCAyICstCiAuLi50ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4t
dGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaCB8IDIgKy0KIC4uLi97Z3N0cmVhbWVyMS4wXzEuMjgu
Mi5iYiA9PiBnc3RyZWFtZXIxLjBfMS4yOC4zLmJifSAgICAgIHwgMiArLQogNSBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjBfMS4yOC4yLmJiID0+IGdzdHJlYW1l
cjEuMF8xLjI4LjMuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50
YWlvbi11c2VkLWluLW1lc29uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2Vk
LWluLW1lc29uLnBhdGNoCmluZGV4IGUxZDg3MGIwNDAuLmU5NTk4ZDJlMDcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMS10ZXN0
cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEtdGVzdHMtcmVz
cGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGFkNGM1NzdmZjhkMjlmNmRiYWY1Y2EyZDAxM2U5ZDIxYzQ0ZjkxMjIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDQ4MjFhNjY5NmY0MjkzNDc3MmE1ZGQ0ZjcxMDgxMGE4NTQ2
YThhN2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFy
ZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTEgQXByIDIwMjEgMTk6NDg6MTMgKzAx
MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHJlc3BlY3QgdGhlIGlkZW50ZW50YWlvbiB1c2Vk
IGluIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3Rz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8w
MDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaAppbmRleCA3
MjBhNmYwYzk3Li42YjBkZTk2YjdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3Rh
bGwtdGhlLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFsbC10aGUtdGVz
dHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkyZTdkNDA5MGZhNDU4YmYwMmQzNDE4Y2Qw
MWM5NjA5ODI4MjFlOTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY5NzU2NmFkMzM2
NTI1MDY5ZTgyMTc4NGQyZmZiMzUxMjY2OTJlNTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwg
MTEgQXByIDIwMjEgMTk6NDg6MTMgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBz
dXBwb3J0IGZvciBpbnN0YWxsIHRoZSB0ZXN0cwpAQCAtMTksMTAgKzE5LDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0ZXN0cy9jaGVjay90ZW1wbGF0ZS50ZXN0LmluCiAKIGRpZmYgLS1naXQgYS9t
ZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCA4YWRjMDU1Li5iNWM5ZTViIDEwMDY0NAor
aW5kZXggZGI3NGJkYy4uM2M4ZGY0ZCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9t
ZXNvbi5idWlsZAotQEAgLTY2Nyw2ICs2NjcsMTAgQEAgaWYgYmFzaGNvbXBfZGVwLmZvdW5kKCkK
K0BAIC02NjEsNiArNjYxLDEwIEBAIGlmIGJhc2hjb21wX2RlcC5mb3VuZCgpCiAgICBlbmRpZgog
IGVuZGlmCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDMtdGVzdHMtdXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVu
dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAv
MDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoCmluZGV4
IDEyMzYyOTBlMmIuLjAxN2JlNWZmYjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMt
Zm9yLWVudmlyb25tZW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmly
b25tZW50LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNzRjNmFjZTgzZTk2OTdhYWUwYjIx
YmEyNmYzMTZiNzkyNzljMzljIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMzUyZmVj
YTMxNTBhZjFhODc2ZjA5ZWJjMGU2MmM3YWNiY2VmZWZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBT
YXQsIDI0IEFwciAyMDIxIDEwOjM0OjQ3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiB1
c2UgYSBkaWN0aW9uYXJpZXMgZm9yIGVudmlyb25tZW50CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBl
ci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1z
Y3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMucGF0Y2gKaW5kZXggZGYzODJhNDQ0NS4u
NTk2MzAwYWI5OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5z
dGFsbGVkX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNjcmlwdC10by1ydW4tdGhlLWlu
c3RhbGxlZF90ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTMxYWI0NzdlZWQwNjFj
YzcyZWQ2Nzk1YjQ4Mzc5NWQ1M2FmNmRmYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
N2E1MDQ0ZWU3MGI3NGM2YzE2YWFmNWVlMWJkNDRjZmFiM2I2MzQ1OSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgog
RGF0ZTogU3VuLCAyIE1heSAyMDIxIDAxOjU4OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRl
c3RzOiBhZGQgaGVscGVyIHNjcmlwdCB0byBydW4gdGhlIGluc3RhbGxlZF90ZXN0cwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4
LjIuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEu
MjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjguMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4LjMuYmIKaW5kZXgg
YjcyNzc4Mzc0Ni4uOTdiYjdlODkyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI4LjMuYmIKQEAgLTIyLDcgKzIyLDcg
QEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdHJl
YW1lci9nc3RyZWFtZXItJHtQVn0udGFyLngKICAgICAgICAgICAgZmlsZTovLzAwMDMtdGVzdHMt
dXNlLWEtZGljdGlvbmFyaWVzLWZvci1lbnZpcm9ubWVudC5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rl
c3RzLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNlNWNkNDRk
NGZmZWFmZGNjM2RkZGFhMDcyYjIxNzljMGI3Y2IxYWJmNGU2YzVkMThkNDM3NWY4YTM5ZmU0OTEi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWU4NGVjYjk0MmUxMzY5NDRlYjk4MTJmMTljZmY3YmNm
MDVhODU2Mzc0ODJhMzJkYTU1Yjg5MjkxNGMzOTdkMSIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9
IFwKICAgICAgICAgICAgICAgICAgICBjaGVjayBcCi0tIAoyLjQ3LjEKCg==

--===============1841190236625404908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 19074935 to 19108543 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstcontroller-1.0.so.0.2802.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2802.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2802.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2802.0 /usr/lib/.debug/libgstbase-1.0.so.0.2802.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2802.0", added "/usr/lib/.debug/libgstcontroller-1.0.so.0.2803.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2803.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2803.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2803.0 /usr/lib/.debug/libgstbase-1.0.so.0.2803.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2803.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6778466 to 6781722 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ar: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ar: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-kk: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-kk: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGSIZE changed from 4218467 to 4222563 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 10023669 to 10028786 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/gst -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/gst, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/validate -> /usr/src/debug/gstreamer1.0/1.28.3/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/gst -> /usr/src/debug/gstreamer1.0/1.28.3/gst, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/elements, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/pipelines, directory renamed /usr/src/debug/gstrea
 mer1.0/1.28.2/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.28.3/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tools -> /usr/src/debug/gstreamer1.0/1.28.3/tools, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/gst/printf -> /usr/src/debug/gstreamer1.0/1.28.3/gst/printf, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/gst/parse -> /usr/src/debug/gstreamer1.0/1.28.3/gst/parse, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/plugins/elements -> /usr/src/debug/gstreamer1.0/1.28.3/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/libs/gst/helpers -> /usr/src/debug/gstrea
 mer1.0/1.28.3/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.28.2/tests/check/generic -> /usr/src/debug/gstreamer1.0/1.28.3/tests/check/generic
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstreamer-1.0.so.0.2802.0 /usr/lib/libgstbase-1.0.so.0.2802.0 /usr/lib/libgstcontroller-1.0.so.0.2802.0 /usr/lib/libgstnet-1.0.so.0.2802.0 /usr/lib/libgstcheck-1.0.so.0.2802.0", added "/usr/lib/libgstcheck-1.0.so.0.2803.0 /usr/lib/libgstreamer-1.0.so.0.2803.0 /usr/lib/libgstcontroller-1.0.so.0.2803.0 /usr/lib/libgstbase-1.0.so.0.2803.0 /usr/lib/libgstnet-1.0.so.0.2803.0"
packages/x86-64-v3-poky-linux/gstreamer1.0: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.2.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.3.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0: PV changed from "1.28.2" to "1.28.3"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2802.0 to libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2802.0 to libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2802.0 to libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2802.0 to libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2802.0 to libgstreamer-1.0.so.0.2803.0
  /usr/lib/libgstbase-1.0.so.0.2802.0 moved to /usr/lib/libgstbase-1.0.so.0.2803.0
  /usr/lib/libgstcheck-1.0.so.0.2802.0 moved to /usr/lib/libgstcheck-1.0.so.0.2803.0
  /usr/lib/libgstcontroller-1.0.so.0.2802.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2803.0
  /usr/lib/libgstnet-1.0.so.0.2802.0 moved to /usr/lib/libgstnet-1.0.so.0.2803.0
  /usr/lib/libgstreamer-1.0.so.0.2802.0 moved to /usr/lib/libgstreamer-1.0.so.0.2803.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2802.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2803.0-gdb.py

--===============1841190236625404908==--

