Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF3BCA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.89785.1756850180049651740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IyWjc9fU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JFrNG9AW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101990c6e4c74-df5f247d-3ea5-45ff-b80f-bf2751635dd6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fXnMtXeAk8TVxWlyZhneWSqh+f5/4sclfnnyfcvOJeo=;
	b=IyWjc9fUsrMWreJv5EvnK8E7livZ9Qma6gfSWZvXPyXTQq2MnegerAwYk6H08irn
	6NvHAoKtxUMN5u3lUa942RPFYAdl4I6e9JJZ5aBEDMPloPnOYn/a+dfugNd9EObe3rr
	Y870yGuuA4pEnrFCeXCJE5z7yPilIPx6rQUaKg+I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fXnMtXeAk8TVxWlyZhneWSqh+f5/4sclfnnyfcvOJeo=;
	b=JFrNG9AWCvfoH3DCbQa6URq7g+wmg+x2SlVlYGP5em+Fsr+gZM2+nP+UKFac/Zkr
	8kaOrlOjy0vTkK8yXwQEG38WRqBFjgEBRapcqV0H3xngVuTYFAaorf3wPh1XANcY0KI
	Xj50fM3W+kRA+FVsvp6fF08QyTul0z8ntwniskRc=
Content-Type: multipart/mixed; boundary="===============6839018780954949813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 4.1.1,4.1.1 SUCCEEDED
Message-ID: <010101990c6e4c74-df5f247d-3ea5-45ff-b80f-bf2751635dd6-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222753

--===============6839018780954949813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.1.1,4.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-4.1.0-4.1.1-4.1.0-4.1.1.patch
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
From d1d00ea1545a7125176849b70099733edaac7d1c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 14:57:23 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 4.1.0 -> 4.1.1,4.1.0 -> 4.1.1

---
 .../cmake/{cmake-native_4.1.0.bb => cmake-native_4.1.1.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...isable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 6 +++---
 .../cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch     | 6 +++---
 .../cmake/{cmake_4.1.0.bb => cmake_4.1.1.bb}                | 0
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.1.0.bb => cmake-native_4.1.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.1.0.bb => cmake_4.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.1.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index cbeeb31520..e0458cc491 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "81ee8170028865581a8e10eaf055afb620fa4baa0beb6387241241a975033508"
+SRC_URI[sha256sum] = "b29f6f19733aa224b7763507a108a427ed48c688e1faf22b29c44e1c30549282"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index f31dce5644..4710f1d6b1 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
+From 28f22966117690235bf19896843420a96aea4fe1 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7cf3aeeaeb36bcdbc 100644
+index e6ab5de9..913887b5 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -720,12 +720,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 158eea2c3e..39bc43f7ad 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
+From e8769980bd5248ff2315869294b6cf8788bad851 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753f47c47b12aeec85b 100644
+index ddc975c2..cf60a43e 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -105,7 +105,7 @@ set(USE_ECH OFF)
+@@ -110,7 +110,7 @@ set(USE_ECH OFF)
  set(USE_HTTPSRR OFF)
  set(USE_LIBIDN2 ON)
  set(USE_LIBRTMP OFF)
diff --git a/meta/recipes-devtools/cmake/cmake_4.1.0.bb b/meta/recipes-devtools/cmake/cmake_4.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.1.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.1.1.bb
-- 
2.47.1


--===============6839018780954949813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1137452960 to 1137380096 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10216894 to 10217311 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 45151449 to 45160138 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.1/cmake-4.1.0.tar.gz" to "https://cmake.org/files/v4.1/cmake-4.1.1.tar.gz"
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.1.0" to "4.1.1"

--===============6839018780954949813==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-4.1.0-4.1.1-4.1.0-4.1.1.patch"

RnJvbSBkMWQwMGVhMTU0NWE3MTI1MTc2ODQ5YjcwMDk5NzMzZWRhYWM3ZDFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNDo1NzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLW5hdGl2ZSxjbWFrZTogdXBncmFkZSA0LjEuMCAtPiA0LjEuMSw0LjEuMCAtPiA0LjEuMQoK
LS0tCiAuLi4vY21ha2Uve2NtYWtlLW5hdGl2ZV80LjEuMC5iYiA9PiBjbWFrZS1uYXRpdmVfNC4x
LjEuYmJ9ICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgMiArLQogLi4uaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5o
LWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0Y2ggfCA2ICsrKy0tLQogLi4uL2NtYWtlLzAwMDItQ01h
a2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCAgICAgfCA2ICsrKy0tLQogLi4u
L2NtYWtlL3tjbWFrZV80LjEuMC5iYiA9PiBjbWFrZV80LjEuMS5iYn0gICAgICAgICAgICAgICAg
fCAwCiA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlLW5hdGl2ZV80LjEuMC5iYiA9
PiBjbWFrZS1uYXRpdmVfNC4xLjEuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS97Y21ha2VfNC4xLjAuYmIgPT4gY21ha2VfNC4xLjEuYmJ9ICgxMDAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC4xLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMS4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2UvY21ha2UtbmF0aXZlXzQuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UtbmF0aXZlXzQuMS4xLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LmluYwppbmRleCBjYmVlYjMxNTIwLi5lMDQ1OGNjNDkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMKQEAgLTE5LDcgKzE5LDcgQEAgQ01BS0VfTUFKT1JfVkVSU0lPTiA9ICIk
e0AnLicuam9pbihkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzA6Ml0pfSIKIFNSQ19VUkkgPSAi
aHR0cHM6Ly9jbWFrZS5vcmcvZmlsZXMvdiR7Q01BS0VfTUFKT1JfVkVSU0lPTn0vY21ha2UtJHtQ
Vn0udGFyLmd6IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODFlZTgx
NzAwMjg4NjU1ODFhOGUxMGVhZjA1NWFmYjYyMGZhNGJhYTBiZWI2Mzg3MjQxMjQxYTk3NTAzMzUw
OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMjlmNmYxOTczM2FhMjI0Yjc3NjM1MDdhMTA4YTQy
N2VkNDhjNjg4ZTFmYWYyMmIyOWM0NGUxYzMwNTQ5MjgyIgogCiBVUFNUUkVBTV9DSEVDS19SRUdF
WCA9ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtRGlzYWJsZS11c2Utb2YtZXh0MmZz
LWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLzAwMDEtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1j
bWFrZS1zLWludGVybmFsLnBhdGNoCmluZGV4IGYzMWRjZTU2NDQuLjQ3MTBmMWQ2YjEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLURpc2FibGUtdXNl
LW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1EaXNhYmxlLXVzZS1vZi1leHQyZnMt
ZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGNmODIxMDY5NmViYmFmZjE0NjEyZDg0NWJjOThmYWM0NDdjMGU2ZjUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDI4ZjIyOTY2MTE3NjkwMjM1YmYxOTg5Njg0MzQyMGE5NmFlYTRmZTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bv
c3N5c3RlbXMuY29tLmJyPgogRGF0ZTogVGh1LCA1IEp1bCAyMDE4IDEwOjI4OjA0IC0wMzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgdXNlIG9mIGV4dDJmcy9leHQyX2ZzLmggYnkgY21ha2Un
cyBpbnRlcm5hbApAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25lZC1vZmYtYnk6IE90YXZpbyBTYWx2
YWRvciA8b3RhdmlvQG9zc3lzdGVtcy5jb20uYnI+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL1V0aWxpdGllcy9jbWxpYmFy
Y2hpdmUvQ01ha2VMaXN0cy50eHQgYi9VdGlsaXRpZXMvY21saWJhcmNoaXZlL0NNYWtlTGlzdHMu
dHh0Ci1pbmRleCAwNGQ5ODZiNmVhN2Q4ZGMwYmQ3ZTkwOWQ0ZTdiNGU3M2M5ZTM1NDM3Li4wMTRm
ZTc4MDYzZjdkMzBjOWE0OTcwYjdjZjNhZWVhZWIzNmJjZGJjIDEwMDY0NAoraW5kZXggZTZhYjVk
ZTkuLjkxMzg4N2I1IDEwMDY0NAogLS0tIGEvVXRpbGl0aWVzL2NtbGliYXJjaGl2ZS9DTWFrZUxp
c3RzLnR4dAogKysrIGIvVXRpbGl0aWVzL2NtbGliYXJjaGl2ZS9DTWFrZUxpc3RzLnR4dAotQEAg
LTc0NSwxMiArNzQ1LDggQEAgTEFfQ0hFQ0tfSU5DTFVERV9GSUxFKCJjb3B5ZmlsZS5oIiBIQVZF
X0NPUFlGSUxFX0gpCitAQCAtNzIwLDEyICs3MjAsOCBAQCBMQV9DSEVDS19JTkNMVURFX0ZJTEUo
ImNvcHlmaWxlLmgiIEhBVkVfQ09QWUZJTEVfSCkKICBMQV9DSEVDS19JTkNMVURFX0ZJTEUoImRp
cmVjdC5oIiBIQVZFX0RJUkVDVF9IKQogIExBX0NIRUNLX0lOQ0xVREVfRklMRSgiZGxmY24uaCIg
SEFWRV9ETEZDTl9IKQogIExBX0NIRUNLX0lOQ0xVREVfRklMRSgiZXJybm8uaCIgSEFWRV9FUlJO
T19IKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDIt
Q01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAyLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRU
UDIucGF0Y2gKaW5kZXggMTU4ZWVhMmMzZS4uMzliYzQzZjdhZCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDItQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1V
U0VfTkdIVFRQMi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Uv
MDAwMi1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBlMGExOTk2YTg1ZGNiNDNkNjlkM2M3ZGFlY2FiNGRhNzQ1OTllNWJhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlODc2OTk4MGJkNTI0OGZmMjMxNTg2OTI5NGI2Y2Y4
Nzg4YmFkODUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxj
aGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjggRGVjIDIwMjIgMTc6NTE6
MjcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ01ha2VMaXN0cy50eHQ6IGRpc2FibGUgVVNFX05H
SFRUUDIKQEAgLTIyLDEwICsyMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8
dGdhbWJsaW5AYmF5bGlicmUuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvVXRpbGl0aWVzL2NtY3VybC9DTWFrZUxpc3Rz
LnR4dCBiL1V0aWxpdGllcy9jbWN1cmwvQ01ha2VMaXN0cy50eHQKLWluZGV4IDc1YjUxMDIwNTk4
NDg5NGZmYTExNDYxZTdhYTA0ZDNjNDc5NzA5YjQuLjgzNDYzMDQyZDgyZDljN2YxNzkzMjc1M2Y0
N2M0N2IxMmFlZWM4NWIgMTAwNjQ0CitpbmRleCBkZGM5NzVjMi4uY2Y2MGE0M2UgMTAwNjQ0CiAt
LS0gYS9VdGlsaXRpZXMvY21jdXJsL0NNYWtlTGlzdHMudHh0CiArKysgYi9VdGlsaXRpZXMvY21j
dXJsL0NNYWtlTGlzdHMudHh0Ci1AQCAtMTA1LDcgKzEwNSw3IEBAIHNldChVU0VfRUNIIE9GRikK
K0BAIC0xMTAsNyArMTEwLDcgQEAgc2V0KFVTRV9FQ0ggT0ZGKQogIHNldChVU0VfSFRUUFNSUiBP
RkYpCiAgc2V0KFVTRV9MSUJJRE4yIE9OKQogIHNldChVU0VfTElCUlRNUCBPRkYpCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC4xLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80LjEuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuMS4xLmJiCi0tIAoy
LjQ3LjEKCg==

--===============6839018780954949813==--

