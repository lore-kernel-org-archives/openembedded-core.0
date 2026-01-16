Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB64D489BC
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:04 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1434.1768526747487332367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3YstWdon;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UONZ0GMN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019bc468bd05-8282c1e6-a969-4705-8b57-2b2a69a44992-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DFTaMO82QsdLOc5o4jmyfHf7yh9DjBdyXgpQlFLjzn8=;
	b=3YstWdonGyUkTwhKHoB/UFXX9Rd/DJeV88B8OdtwmOu80IStmAodcbp5D7QVwYc3
	raDuTZ2xKqscPlBGaq016PHTjvXAbGUV8OEwqw9CadX1fEwd3RsYhn7NeK27TC4fJgV
	B8MfvcQ+Wckai87NTAPpQdsGJmBgNf59dXxeTGd8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DFTaMO82QsdLOc5o4jmyfHf7yh9DjBdyXgpQlFLjzn8=;
	b=UONZ0GMNvVH3ZrdzbvL8yL5g259Wlle/WLVLd971rLw6nOVOIs88IM+KTWGEXbmL
	R0Sqc5JxohBz0hQdnOErtdIOnLMpmwXTW/YXfYkUZWi1toaRyZ5HYbhfKw6GD8ahSjT
	+Rhv5vVPknkOxeCM1DUJWwmKbfvI8LJKuXAiXxHc=
Content-Type: multipart/mixed; boundary="===============4744494412110227876=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0: upgrading to 1.26.10 SUCCEEDED
Message-ID: <0101019bc468bd05-8282c1e6-a969-4705-8b57-2b2a69a44992-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229505

--===============4744494412110227876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0* to *1.26.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.26.9-1.26.10.patch
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
From 09c619df3cc6a4b9bc48f8f69bc27d08335ac4e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:44:30 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.26.9 -> 1.26.10

---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.26.9.bb => gstreamer1.0_1.26.10.bb}       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb => gstreamer1.0_1.26.10.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b040..00687c24f0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From ee43d452bb639b76361ac54b96b247e94a1e63d9 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index ccfc869813..f47073ce6b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
+From c810feaabd1508f563e04e55d3d08db561860d74 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 0a77e90..cadfaeb 100644
+index 82cfdd8..fe6774c 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -664,6 +664,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b..6dae5d8f76 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From 5a64a02a1a4441275575dfac3971f6b2cc6317e4 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445..50ccdcfc9a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From 8f17a154f7a84ce1ae4e75ce4fb78f516138add6 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.10.bb
index c66f614629..e31e0f4086 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.10.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff23aecde80670c8"
+SRC_URI[sha256sum] = "d7f20bec75edeb8677662926c33e987da64a42616c24fc3353b9ad44ed750cd6"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.47.1


--===============4744494412110227876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstbase-1.0.so.0.2609.0 /usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstnet-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0 /usr/lib/libgstreamer-1.0.so.0.2609.0", added "/usr/lib/libgstcontroller-1.0.so.0.2610.0 /usr/lib/libgstnet-1.0.so.0.2610.0 /usr/lib/libgstbase-1.0.so.0.2610.0 /usr/lib/libgstreamer-1.0.so.0.2610.0 /usr/lib/libgstcheck-1.0.so.0.2610.0"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2609.0 to libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2609.0 to libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2609.0 to libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2609.0 to libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2609.0 to libgstreamer-1.0.so.0.2610.0
  /usr/lib/libgstbase-1.0.so.0.2609.0 moved to /usr/lib/libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0.2609.0 moved to /usr/lib/libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0.2609.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0.2609.0 moved to /usr/lib/libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0.2609.0 moved to /usr/lib/libgstreamer-1.0.so.0.2610.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2610.0-gdb.py

--===============4744494412110227876==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.26.9-1.26.10.patch"

RnJvbSAwOWM2MTlkZjNjYzZhNGI5YmM0OGY4ZjY5YmMyN2QwODMzNWFjNGU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6NDQ6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjA6IHVwZ3JhZGUgMS4yNi45IC0+IDEuMjYuMTAKCi0tLQogLi4uLzAwMDEtdGVz
dHMtcmVzcGVjdC10aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2ggICB8IDIgKy0K
IC4uLi8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0YWxsLXRoZS10ZXN0cy5wYXRjaCAg
ICAgICAgfCA0ICsrLS0KIC4uLi8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52
aXJvbm1lbnQucGF0Y2ggICAgICAgfCAyICstCiAuLi40LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0
LXRvLXJ1bi10aGUtaW5zdGFsbGVkX3Rlc3RzLnBhdGNoIHwgMiArLQogLi4uL3tnc3RyZWFtZXIx
LjBfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMF8xLjI2LjEwLmJifSAgICAgICB8IDIgKy0KIDUg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wXzEuMjYuOS5iYiA9
PiBnc3RyZWFtZXIxLjBfMS4yNi4xMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEtdGVzdHMtcmVzcGVjdC10
aGUtaWRlbnRlbnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLzAwMDEtdGVzdHMtcmVzcGVjdC10aGUtaWRlbnRl
bnRhaW9uLXVzZWQtaW4tbWVzb24ucGF0Y2gKaW5kZXggZTFkODcwYjA0MC4uMDA2ODdjMjRmMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC8wMDAxLXRlc3RzLXJlc3BlY3QtdGhlLWlkZW50ZW50YWlvbi11c2VkLWluLW1lc29uLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAw
MS10ZXN0cy1yZXNwZWN0LXRoZS1pZGVudGVudGFpb24tdXNlZC1pbi1tZXNvbi5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYWQ0YzU3N2ZmOGQyOWY2ZGJhZjVjYTJkMDEzZTlkMjFjNDRmOTEy
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWU0M2Q0NTJiYjYzOWI3NjM2MWFjNTRi
OTZiMjQ3ZTk0YTFlNjNkOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVh
cmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU3VuLCAxMSBBcHIgMjAyMSAx
OTo0ODoxMyArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogcmVzcGVjdCB0aGUgaWRlbnRl
bnRhaW9uIHVzZWQgaW4gbWVzb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9ydC1mb3ItaW5zdGFs
bC10aGUtdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLzAwMDItdGVzdHMtYWRkLXN1cHBvcnQtZm9yLWluc3RhbGwtdGhlLXRlc3RzLnBh
dGNoCmluZGV4IGNjZmM4Njk4MTMuLmY0NzA3M2NlNmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwMi10ZXN0cy1hZGQtc3VwcG9y
dC1mb3ItaW5zdGFsbC10aGUtdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAyLXRlc3RzLWFkZC1zdXBwb3J0LWZvci1pbnN0
YWxsLXRoZS10ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzMzMDYzMzYwNzkxZTE3
OGRlMTM4MzA0ZTI5YWIyMjY0NTgyZDkxNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YzgxMGZlYWFiZDE1MDhmNTYzZTA0ZTU1ZDNkMDhkYjU2MTg2MGQ3NCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgog
RGF0ZTogU3VuLCAxMSBBcHIgMjAyMSAxOTo0ODoxMyArMDEwMAogU3ViamVjdDogW1BBVENIXSB0
ZXN0czogYWRkIHN1cHBvcnQgZm9yIGluc3RhbGwgdGhlIHRlc3RzCkBAIC0xOSw3ICsxOSw3IEBA
IFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgog
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9jaGVjay90ZW1wbGF0ZS50ZXN0LmluCiAKIGRpZmYg
LS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAwYTc3ZTkwLi5jYWRmYWVi
IDEwMDY0NAoraW5kZXggODJjZmRkOC4uZmU2Nzc0YyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxk
CiArKysgYi9tZXNvbi5idWlsZAogQEAgLTY2NCw2ICs2NjQsMTAgQEAgaWYgYmFzaGNvbXBfZGVw
LmZvdW5kKCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAvMDAwMy10ZXN0cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8w
MDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJvbm1lbnQucGF0Y2gKaW5kZXgg
MTIzNjI5MGUyYi4uNmRhZTVkOGY3NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1m
b3ItZW52aXJvbm1lbnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmllcy1mb3ItZW52aXJv
bm1lbnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM3NGM2YWNlODNlOTY5N2FhZTBiMjFi
YTI2ZjMxNmI3OTI3OWMzOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVhNjRhMDJh
MWE0NDQxMjc1NTc1ZGZhYzM5NzFmNmIyY2M2MzE3ZTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNh
dCwgMjQgQXByIDIwMjEgMTA6MzQ6NDcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IHVz
ZSBhIGRpY3Rpb25hcmllcyBmb3IgZW52aXJvbm1lbnQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVy
LXNjcmlwdC10by1ydW4tdGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAvMDAwNC10ZXN0cy1hZGQtaGVscGVyLXNj
cmlwdC10by1ydW4tdGhlLWluc3RhbGxlZF90ZXN0cy5wYXRjaAppbmRleCBkZjM4MmE0NDQ1Li41
MGNjZGNmYzlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0
YWxsZWRfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC8wMDA0LXRlc3RzLWFkZC1oZWxwZXItc2NyaXB0LXRvLXJ1bi10aGUtaW5z
dGFsbGVkX3Rlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMzFhYjQ3N2VlZDA2MWNj
NzJlZDY3OTViNDgzNzk1ZDUzYWY2ZGZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4
ZjE3YTE1NGY3YTg0Y2UxYWU0ZTc1Y2U0ZmI3OGY1MTYxMzhhZGQ2IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBE
YXRlOiBTdW4sIDIgTWF5IDIwMjEgMDE6NTg6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVz
dHM6IGFkZCBoZWxwZXIgc2NyaXB0IHRvIHJ1biB0aGUgaW5zdGFsbGVkX3Rlc3RzCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjYu
OS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4y
Ni4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMjYuOS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjI2LjEwLmJiCmluZGV4
IGM2NmY2MTQ2MjkuLmUzMWUwZjQwODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yNi4xMC5iYgpAQCAtMjIsNyArMjIs
NyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0
cmVhbWVyL2dzdHJlYW1lci0ke1BWfS50YXIueAogICAgICAgICAgICBmaWxlOi8vMDAwMy10ZXN0
cy11c2UtYS1kaWN0aW9uYXJpZXMtZm9yLWVudmlyb25tZW50LnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRf
dGVzdHMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGVlODc3
MmU0NjgxMDJlYmU4NmQ0MTRkOGM0Yzc0NDBkZDkxZDlmM2U5Mzk2OTUyZmYyM2FlY2RlODA2NzBj
OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkN2YyMGJlYzc1ZWRlYjg2Nzc2NjI5MjZjMzNlOTg3
ZGE2NGE0MjYxNmMyNGZjMzM1M2I5YWQ0NGVkNzUwY2Q2IgogCiBQQUNLQUdFQ09ORklHID8/PSAi
JHtAYmIudXRpbHMuY29udGFpbnMoJ1BURVNUX0VOQUJMRUQnLCAnMScsICd0ZXN0cycsICcnLCBk
KX0gXAogICAgICAgICAgICAgICAgICAgIGNoZWNrIFwKLS0gCjIuNDcuMQoK

--===============4744494412110227876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2609.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2609.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2609.0 /usr/lib/.debug/libgstbase-1.0.so.0.2609.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2609.0", added "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2610.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2610.0 /usr/lib/.debug/libgstbase-1.0.so.0.2610.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2610.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2610.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 17631839 to 17633831 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6481612 to 6481616 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-lv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/pipelines -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/pipelines, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/validate -> /usr/src/debug/gstreamer1.0/1.26.10/tests/validate, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/base -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/base, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/check/libcheck -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/check/libcheck, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/tools -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/plugins/elements -> /usr/src/debug/gstreamer1.0/1.26.10/plugins/elements, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/gst/printf -> /usr/src/debug/gstreamer1.0/1.26.10/gst/printf, directory renamed /usr/src/debug/g
 streamer1.0/1.26.9/libs/gst/check -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/check, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/gst -> /usr/src/debug/gstreamer1.0/1.26.10/gst, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/helpers -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/helpers, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/libs -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/libs, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/gst -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/gst, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/net -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/net, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/gst/parse -> /usr/src/debug/gstreamer1.0/1.26.10/gst/parse, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tools -> /usr/src/debug/gstreamer1.0/1.26.10/tools, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/generic -> /usr/src/debug/
 gstreamer1.0/1.26.10/tests/check/generic, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/libs/gst/controller -> /usr/src/debug/gstreamer1.0/1.26.10/libs/gst/controller, directory renamed /usr/src/debug/gstreamer1.0/1.26.9/tests/check/elements -> /usr/src/debug/gstreamer1.0/1.26.10/tests/check/elements
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9738771 to 9739171 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcontroller-1.0.so.0.2609.0 /usr/lib/libgstcheck-1.0.so.0.2609.0 /usr/lib/libgstbase-1.0.so.0.2609.0 /usr/lib/libgstnet-1.0.so.0.2609.0 /usr/lib/libgstreamer-1.0.so.0.2609.0", added "/usr/lib/libgstcontroller-1.0.so.0.2610.0 /usr/lib/libgstcheck-1.0.so.0.2610.0 /usr/lib/libgstnet-1.0.so.0.2610.0 /usr/lib/libgstreamer-1.0.so.0.2610.0 /usr/lib/libgstbase-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.9.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.26.10.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch file://0004-tests-add-helper-script-to-run-the-installed_tests.patch"
packages/x86-64-v3-poky-linux/gstreamer1.0: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0: PV changed from "1.26.9" to "1.26.10"
Changes to packages/x86-64-v3-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2609.0 to libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2609.0 to libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2609.0 to libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2609.0 to libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2609.0 to libgstreamer-1.0.so.0.2610.0
  /usr/lib/libgstbase-1.0.so.0.2609.0 moved to /usr/lib/libgstbase-1.0.so.0.2610.0
  /usr/lib/libgstcheck-1.0.so.0.2609.0 moved to /usr/lib/libgstcheck-1.0.so.0.2610.0
  /usr/lib/libgstcontroller-1.0.so.0.2609.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2610.0
  /usr/lib/libgstnet-1.0.so.0.2609.0 moved to /usr/lib/libgstnet-1.0.so.0.2610.0
  /usr/lib/libgstreamer-1.0.so.0.2609.0 moved to /usr/lib/libgstreamer-1.0.so.0.2610.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2609.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2610.0-gdb.py

--===============4744494412110227876==--

