Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE67CC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11029.1747312308185867686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FmJ8OVgw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=grJ2NvPK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010196d3ee2273-15b1308b-5862-482f-94a0-9b1b7439095a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3qbCr6OLWf38j6LyvoUUAZcjEvzUeCiaKmLMSHbvkBo=;
	b=FmJ8OVgwbQhlS9xuK1MElq2T3VlDh3uhy/gWDHOdmeJLlGXHm5YszJrWmlwNnFXO
	MkfMAAXeuKXqj7OGdKZaVY70aD/0+ofC3Rmbn6nLjEBk7X3Rvbkx+p64RLLxAiWqMrU
	DhGnIZOfcu38iRqO82ypVK06pTvAoQFCETKcxDKk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3qbCr6OLWf38j6LyvoUUAZcjEvzUeCiaKmLMSHbvkBo=;
	b=grJ2NvPKvfvIqvHTav+dOD9xsHA3274qPaP7THXFFqdTfNmgfFwemyLjlhRu+dCx
	KZvSA7azhG+3GX8OKW/XMLykfvnEcRliTZhF3RdEYtvA7kV6daYkw3VV8bapWkd4KPG
	sGrMFgqLGPM+M6lQ+GGnTtX0VFgheywBrSLIStNI=
Content-Type: multipart/mixed; boundary="===============4575420755030699664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffutils: upgrading to 3.12 FAILED
Message-ID: <01010196d3ee2273-15b1308b-5862-482f-94a0-9b1b7439095a-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216635

--===============4575420755030699664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffutils* to *3.12* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-diffutils-upgrade-3.11-3.12.patch
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
From b93549f4933228ed7ec191b97c5afcac5f80b57a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 09:16:12 +0000
Subject: [PATCH] diffutils: upgrade 3.11 -> 3.12

---
 .../diffutils/0001-Skip-strip-trailing-cr-test-case.patch  | 7 +++----
 .../diffutils/{diffutils_3.11.bb => diffutils_3.12.bb}     | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.11.bb => diffutils_3.12.bb} (93%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
index 32793233f9..4afe674054 100644
--- a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
+++ b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
@@ -1,4 +1,4 @@
-From f31395c931bc633206eccfcfaaaa5d15021a3e86 Mon Sep 17 00:00:00 2001
+From 411296c9ea94686bb9a233f75337bcbd48506c3a Mon Sep 17 00:00:00 2001
 From: Peiran Hong <peiran.hong@windriver.com>
 Date: Thu, 5 Sep 2019 15:42:22 -0400
 Subject: [PATCH] Skip strip-trailing-cr test case
@@ -10,16 +10,15 @@ package.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
-
 ---
  tests/Makefile.am | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 79bacfb..4adb4d7 100644
+index 47449fc..718e976 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -22,7 +22,6 @@ TESTS = \
+@@ -30,7 +30,6 @@ TESTS = \
    stdin \
    strcoll-0-names \
    filename-quoting \
diff --git a/meta/recipes-extended/diffutils/diffutils_3.11.bb b/meta/recipes-extended/diffutils/diffutils_3.12.bb
similarity index 93%
rename from meta/recipes-extended/diffutils/diffutils_3.11.bb
rename to meta/recipes-extended/diffutils/diffutils_3.12.bb
index a4badc044e..67233d1634 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.11.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.12.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
            "
 
-SRC_URI[sha256sum] = "a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e"
+SRC_URI[sha256sum] = "7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
2.47.1


--===============4575420755030699664==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffutils-upgrade-3.11-3.12.patch"

RnJvbSBiOTM1NDlmNDkzMzIyOGVkN2VjMTkxYjk3YzVhZmNhYzVmODBiNTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDk6MTY6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmdXRpbHM6IHVwZ3JhZGUgMy4xMSAtPiAzLjEyCgotLS0KIC4uLi9kaWZmdXRpbHMvMDAwMS1T
a2lwLXN0cmlwLXRyYWlsaW5nLWNyLXRlc3QtY2FzZS5wYXRjaCAgfCA3ICsrKy0tLS0KIC4uLi9k
aWZmdXRpbHMve2RpZmZ1dGlsc18zLjExLmJiID0+IGRpZmZ1dGlsc18zLjEyLmJifSAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL3tkaWZmdXRpbHNfMy4xMS5iYiA9
PiBkaWZmdXRpbHNfMy4xMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlscy8wMDAxLVNraXAtc3RyaXAtdHJhaWxpbmctY3ItdGVz
dC1jYXNlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy9kaWZmdXRpbHMv
MDAwMS1Ta2lwLXN0cmlwLXRyYWlsaW5nLWNyLXRlc3QtY2FzZS5wYXRjaAppbmRleCAzMjc5MzIz
M2Y5Li40YWZlNjc0MDU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0
aWxzL2RpZmZ1dGlscy8wMDAxLVNraXAtc3RyaXAtdHJhaWxpbmctY3ItdGVzdC1jYXNlLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRpbHMvZGlmZnV0aWxzLzAwMDEtU2tp
cC1zdHJpcC10cmFpbGluZy1jci10ZXN0LWNhc2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGYzMTM5NWM5MzFiYzYzMzIwNmVjY2ZjZmFhYWE1ZDE1MDIxYTNlODYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDQxMTI5NmM5ZWE5NDY4NmJiOWEyMzNmNzUzMzdiY2JkNDg1MDZjM2Eg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQZWlyYW4gSG9uZyA8cGVpcmFuLmhvbmdA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgNSBTZXAgMjAxOSAxNTo0MjoyMiAtMDQwMAogU3Vi
amVjdDogW1BBVENIXSBTa2lwIHN0cmlwLXRyYWlsaW5nLWNyIHRlc3QgY2FzZQpAQCAtMTAsMTYg
KzEwLDE1IEBAIHBhY2thZ2UuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVk
ZGVkIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBQZWlyYW4gSG9uZyA8cGVpcmFuLmhvbmdA
d2luZHJpdmVyLmNvbT4KLQogLS0tCiAgdGVzdHMvTWFrZWZpbGUuYW0gfCAxIC0KICAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUuYW0g
Yi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggNzliYWNmYi4uNGFkYjRkNyAxMDA2NDQKK2luZGV4
IDQ3NDQ5ZmMuLjcxOGU5NzYgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQogKysrIGIv
dGVzdHMvTWFrZWZpbGUuYW0KLUBAIC0yMiw3ICsyMiw2IEBAIFRFU1RTID0gXAorQEAgLTMwLDcg
KzMwLDYgQEAgVEVTVFMgPSBcCiAgICBzdGRpbiBcCiAgICBzdHJjb2xsLTAtbmFtZXMgXAogICAg
ZmlsZW5hbWUtcXVvdGluZyBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlm
ZnV0aWxzL2RpZmZ1dGlsc18zLjExLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGls
cy9kaWZmdXRpbHNfMy4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlsc18zLjExLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlsc18zLjEyLmJiCmluZGV4IGE0
YmFkYzA0NGUuLjY3MjMzZDE2MzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9k
aWZmdXRpbHMvZGlmZnV0aWxzXzMuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Rp
ZmZ1dGlscy9kaWZmdXRpbHNfMy4xMi5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICIke0dO
VV9NSVJST1J9L2RpZmZ1dGlscy9kaWZmdXRpbHMtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtU2tpcC1zdHJpcC10cmFpbGluZy1jci10ZXN0LWNhc2UucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhNzNlZjA1ZmUzN2RkNTg1ZjdkODcw
NjhlNGEwNjM5NzYwNDE5ZjgxMDEzOGJkNzVjNjFkZGFhMWY5ZTIxMzFlIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjdjOGI3ZjlmYzg2MDkxNDFmZGVhOWNlY2U4NTI0OWQzMDg2MjQzOTFmZjYxZGVk
YWY1MjhmY2IzMzc3MjdkZmQiCiAKIEVYVFJBX09FQ09ORiArPSAiYWNfY3ZfcGF0aF9QUl9QUk9H
UkFNPSR7YmluZGlyfS9wciAtLXdpdGhvdXQtbGlic2lnc2Vndi1wcmVmaXgiCiAKLS0gCjIuNDcu
MQoK

--===============4575420755030699664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8051a96396e33d85e5e22b8d92c1863f9f9366a3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 316 Local 304 Mirrors 0 Missed 12 Current 397 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 574 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1311 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_recipe_qa)
NOTE: recipe diffutils-3.12-r0: task do_recipe_qa: Started
NOTE: recipe diffutils-3.12-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_recipe_qa unihash changed to b7c39dcaf731243e26542685210af1ea3c9e6a24f2830e499016d854bb3a1d4c
NOTE: Setscene tasks completed
NOTE: Running task 1758 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_fetch)
NOTE: recipe diffutils-3.12-r0: task do_fetch: Started
NOTE: recipe diffutils-3.12-r0: task do_fetch: Succeeded
NOTE: Running task 1961 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_unpack)
NOTE: Running task 1962 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.12-r0: task do_unpack: Started
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.12-r0: task do_unpack: Succeeded
NOTE: Running task 2000 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_patch)
NOTE: Running task 2001 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_patch: Started
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_patch: Succeeded
NOTE: Running task 2002 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2003 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_populate_lic)
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.12-r0: task do_populate_lic: Started
NOTE: recipe diffutils-3.12-r0: task do_populate_lic: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_populate_lic unihash changed to bc2d7595ff182050847e348f9ad68ef444aac2bf2d53e731e43125f318a6972d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_deploy_source_date_epoch unihash changed to 1fd50e4ba914078486b4057ae33923ff7845585cf613b0c56827cc55654cadad
NOTE: Setscene tasks completed
NOTE: Running task 2004 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure)
NOTE: recipe diffutils-3.12-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/g
 ettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'gettext-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Removing existing aclocal.m4
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot-native/usr/bin/autoconf --force
| configure.ac:42: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../autoconf-2.72/lib/autoconf/general.m4:2979: AC_RUN_IFELSE is expanded from...
| ../autoconf-2.72/lib/m4sugar/m4sh.m4:690: _AS_IF_ELSE is expanded from...
| ../autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded from...
| ../autoconf-2.72/lib/autoconf/general.m4:2249: AC_CACHE_VAL is expanded from...
| ../autoconf-2.72/lib/autoconf/general.m4:2270: AC_CACHE_CHECK is expanded from...
| m4/getopt.m4:52: gl_GETOPT_CHECK_HEADERS is expanded from...
| m4/getopt.m4:10: gl_FUNC_GETOPT_POSIX is expanded from...
| m4/gnulib-comp.m4:720: gl_INIT is expanded from...
| configure.ac:42: the top level
| configure.ac:42: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../autoconf-2.72/lib/autoconf/general.m4:2979: AC_RUN_IFELSE is expanded from...
| ../autoconf-2.72/lib/m4sugar/m4sh.m4:690: _AS_IF_ELSE is expanded from...
| ../autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded from...
| ../autoconf-2.72/lib/autoconf/general.m4:2249: AC_CACHE_VAL is expanded from...
| ../autoconf-2.72/lib/autoconf/general.m4:2270: AC_CACHE_CHECK is expanded from...
| m4/strcasecmp.m4:24: gl_STRCASECMP_WORKS is expanded from...
| m4/strcasecmp.m4:9: gl_FUNC_STRCASECMP is expanded from...
| m4/gnulib-comp.m4:720: gl_INIT is expanded from...
| configure.ac:42: the top level
| configure.ac:42: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../autoconf-2.72/lib/autoconf/general.m4:2979: AC_RUN_IFELSE is expanded from...
| ../autoconf-2.72/lib/m4sugar/m4sh.m4:690: _AS_IF_ELSE is expanded from...
| ../autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded from...
| ../autoconf-2.72/lib/autoconf/general.m4:2249: AC_CACHE_VAL is expanded from...
| ../autoconf-2.72/lib/autoconf/general.m4:2270: AC_CACHE_CHECK is expanded from...
| m4/strcasecmp.m4:24: gl_STRCASECMP_WORKS is expanded from...
| m4/strncasecmp.m4:9: gl_FUNC_STRNCASECMP is expanded from...
| m4/gnulib-comp.m4:720: gl_INIT is expanded from...
| configure.ac:42: the top level
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot-native/usr/bin/autoheader --force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../diffutils-3.12/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  ac_cv_path_PR_PROGRAM=/usr/bin/pr --without-libsigsegv-prefix --disable-static  --enable-nls
| configure: WARNING: unrecognized options: --disable-static
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking for gawk... (cached) gawk
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot understands -c and -o together... yes
| checking whether the compiler is clang... no
| checking for compiler option needed when checking for declarations... none
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot... none
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking for stdbool.h... yes
| checking for uchar.h... yes
| checking for sys/param.h... yes
| checking for sys/socket.h... yes
| checking for dirent.h... yes
| checking for error.h... yes
| checking for fnmatch.h... yes
| checking for getopt.h... yes
| checking for sys/time.h... yes
| checking for threads.h... yes
| checking for limits.h... yes
| checking for crtdefs.h... no
| checking for wctype.h... yes
| checking for langinfo.h... yes
| checking for xlocale.h... no
| checking for sys/mman.h... yes
| checking for pthread.h... yes
| checking for malloc.h... yes
| checking for stdbit.h... yes
| checking for stdckdint.h... yes
| checking for sys/random.h... yes
| checking for sys/wait.h... yes
| checking for features.h... yes
| checking for arpa/inet.h... yes
| checking for netdb.h... yes
| checking for netinet/in.h... yes
| checking for math.h... yes
| checking for priv.h... no
| checking for sys/select.h... yes
| checking for semaphore.h... yes
| checking for sys/ioctl.h... yes
| checking for sys/un.h... yes
| checking for sys/uio.h... yes
| checking for vfork.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for egrep -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for Minix Amsterdam compiler... no
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot option to support large files... none needed
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot option to support timestamps after 2038... none needed
| checking for size_t... yes
| checking for working alloca.h... yes
| checking for alloca... yes
| checking whether the preprocessor supports include_next... yes
| checking whether source code line length is unlimited... yes
| checking for wint_t... yes
| checking whether wint_t is large enough... yes
| checking whether <wchar.h> uses 'inline' correctly... yes
| checking for btowc... yes
| checking for mbrtowc... yes
| checking for mbsinit... yes
| checking for _set_invalid_parameter_handler... no
| checking for fchdir... yes
| checking for fcntl... yes
| checking for symlink... yes
| checking for fdopendir... yes
| checking for fnmatch... yes
| checking for mbsrtowcs... yes
| checking for fstatat... yes
| checking for getdtablesize... yes
| checking for getexecname... no
| checking for gettimeofday... yes
| checking for isblank... yes
| checking for iswcntrl... yes
| checking for lstat... yes
| checking for mprotect... yes
| checking for mkstemp... yes
| checking for strftime_z... no
| checking for openat... yes
| checking for pclose... yes
| checking for popen... yes
| checking for readlink... yes
| checking for iswctype... yes
| checking for setenv... yes
| checking for sigaction... yes
| checking for sigaltstack... yes
| checking for siginterrupt... yes
| checking for setrlimit... yes
| checking for getrlimit... yes
| checking for __xpg_strerror_r... yes
| checking for strptime... yes
| checking for strtoimax... yes
| checking for localtime_r... yes
| checking for wcrtomb... yes
| checking for wcwidth... yes
| checking for pipe... yes
| checking for pselect... yes
| checking for pthread_sigmask... yes
| checking for sleep... yes
| checking for snprintf... yes
| checking for shutdown... yes
| checking for unlinkat... yes
| checking for vasnprintf... no
| checking for wctob... yes
| checking for sigprocmask... yes
| checking for fork... yes
| checking for vfork... yes
| checking for nl_langinfo and CODESET... yes
| checking for a traditional french locale... (cached) fr_FR
| checking for ld... x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot  ) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... no
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib,lib64
| checking whether char8_t is correctly defined... yes
| checking whether char16_t is correctly defined... yes
| checking whether char32_t is correctly defined... yes
| checking for bit size of wchar_t... 32
| checking for mbstate_t... yes
| checking for a traditional japanese locale... none
| checking for an english Unicode locale... none
| checking for a transitional chinese locale... none
| checking whether mbrtowc handles incomplete characters... (cached) yes
| checking whether mbrtowc works as well as mbtowc... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/recipe-sysroot options needed to detect all undeclared functions... none needed
| checking whether mbrtoc32 is declared... yes
| checking for mbrtoc32... yes
| checking whether mbrtoc32 works as well as mbrtowc... guessing yes
| checking whether c32rtomb is declared... yes
| checking for c32rtomb... yes
| checking whether c32rtomb works as well as wcrtomb... guessing yes
| checking whether malloc is ptrdiff_t safe... yes
| checking whether malloc, realloc, calloc set errno on failure... yes
| checking for C/C++ restrict keyword... __restrict__
| checking if environ is properly declared... yes
| checking for complete errno.h... yes
| checking for error... yes
| checking whether error_at_line is declared... yes
| checking for error_at_line... yes
| checking for working error function... guessing yes
| checking whether strerror_r is declared... yes
| checking whether strerror_r returns char *... yes
| checking whether ctype.h defines __header_inline... no
| checking whether fchdir is declared... yes
| checking for working fcntl.h... (cached) yes
| checking for pid_t... yes
| checking for mode_t... yes
| checking for mempcpy... yes
| checking whether fopen recognizes a trailing slash... guessing yes
| checking whether fflush works on input streams... cross
| checking whether stat file-mode macros are broken... no
| checking for nlink_t... yes
| checking whether lstat correctly handles trailing slash... guessing yes
| checking whether getcwd (NULL, 0) allocates memory for result... (cached) yes
| checking for getcwd with POSIX signature... yes
| checking whether getdtablesize is declared... yes
| checking for getopt.h... (cached) yes
| checking for getopt_long_only... yes
| checking whether getopt is POSIX compatible... guessing yes
| checking for working GNU getopt function... guessing no
| checking for glibc-compatible sys/cdefs.h... yes
| checking whether timespec_get is declared... yes
| checking for timespec_get... yes
| checking for struct timeval... yes
| checking for wide-enough struct timeval.tv_sec member... yes
| checking for pthread.h... (cached) yes
| checking for pthread_kill in -lpthread... yes
| checking whether POSIX threads API is available... yes
| checking whether setlocale (LC_ALL, NULL) is multithread-safe... yes
| checking whether setlocale (category, NULL) is multithread-safe... yes
| checking host CPU and C ABI... x86_64
| checking for inline... inline
| checking whether limits.h has WORD_BIT, BOOL_WIDTH etc.... yes
| checking whether limits.h has SSIZE_MAX... yes
| checking whether the compiler produces multi-arch binaries... no
| checking whether stdint.h conforms to C99... guessing yes
| checking whether stdint.h works without ISO C predefines... yes
| checking whether stdint.h has UINTMAX_WIDTH etc.... yes
| checking whether INT32_MAX < INTMAX_MAX... yes
| checking whether INT64_MAX == LONG_MAX... yes
| checking whether UINT32_MAX < UINTMAX_MAX... yes
| checking whether UINT64_MAX == ULONG_MAX... yes
| checking whether iswcntrl works... guessing yes
| checking for towlower... yes
| checking for wctype_t... yes
| checking for wctrans_t... yes
| checking whether wctype supports the "blank" and "punct" character classes... guessing yes
| checking whether langinfo.h defines CODESET... yes
| checking whether langinfo.h defines T_FMT_AMPM... yes
| checking whether langinfo.h defines ALTMON_1... yes
| checking whether langinfo.h defines ABALTMON_1... no
| checking whether langinfo.h defines ERA... yes
| checking whether langinfo.h defines YESEXPR... yes
| checking for good max_align_t... yes
| checking whether NULL can be used in arbitrary expressions... yes
| checking for unreachable... yes
| checking whether nullptr_t needs <stddef.h>... yes
| checking for clean definition of __STDC_VERSION_STDDEF_H__... no
| checking whether locale.h defines locale_t... yes
| checking whether locale.h defines _locale_t... no
| checking whether locale.h conforms to POSIX:2001... yes
| checking whether struct lconv is properly defined... yes
| checking for LC_MESSAGES... yes
| checking whether imported symbols can be declared weak... guessing yes
| checking for multithread API to use... posix
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking whether malloc (0) returns nonnull... (cached) yes
| checking for mmap... yes
| checking for MAP_ANONYMOUS... yes
| checking whether memchr works... guessing no
| checking whether memrchr is declared... yes
| checking whether <limits.h> defines MIN and MAX... no
| checking whether <sys/param.h> defines MIN and MAX... yes
| checking whether time_t is signed... yes
| checking whether alarm is declared... yes
| checking for working mktime... (cached) yes
| checking for struct tm.tm_gmtoff... yes
| checking for struct tm.tm_zone... yes
| checking for O_CLOEXEC... yes
| checking for promoted mode_t type... mode_t
| checking for pthread_t... yes
| checking for pthread_spinlock_t... yes
| checking for pthread_spin_init... yes
| checking for sigset_t... yes
| checking whether realloc should abort upon undefined behaviour... no
| checking for sched.h... yes
| checking for struct sched_param... yes
| checking whether setenv is declared... yes
| checking whether _putenv is declared... no
| checking for search.h... yes
| checking for tsearch... yes
| checking for uid_t... yes
| checking for gid_t... yes
| checking for volatile sig_atomic_t... yes
| checking for sighandler_t... yes
| checking whether byte ordering is bigendian... (cached) no
| checking whether fcloseall is declared... yes
| checking whether getw is declared... yes
| checking whether putw is declared... yes
| checking which flavor of printf attribute matches inttypes macros... system
| checking whether ecvt is declared... yes
| checking whether fcvt is declared... yes
| checking whether gcvt is declared... yes
| checking whether MB_CUR_MAX is correct... guessing yes
| checking whether strdup is declared... yes
| checking whether strerror(0) succeeds... guessing yes
| checking for strerror_r... yes
| checking for strerror_r with POSIX signature... no
| checking whether __xpg_strerror_r works... guessing no
| checking whether strnlen is declared... yes
| checking whether strtoimax is declared... yes
| checking for off64_t... yes
| checking for blksize_t... yes
| checking for blkcnt_t... yes
| checking for struct timespec in <time.h>... yes
| checking for TIME_UTC in <time.h>... yes
| checking whether execvpe is declared... yes
| checking whether clearerr_unlocked is declared... yes
| checking whether feof_unlocked is declared... yes
| checking whether ferror_unlocked is declared... yes
| checking whether fflush_unlocked is declared... yes
| checking whether fgets_unlocked is declared... yes
| checking whether fputc_unlocked is declared... yes
| checking whether fputs_unlocked is declared... yes
| checking whether fread_unlocked is declared... yes
| checking whether fwrite_unlocked is declared... yes
| checking whether getc_unlocked is declared... yes
| checking whether getchar_unlocked is declared... yes
| checking whether putc_unlocked is declared... yes
| checking whether putchar_unlocked is declared... yes
| checking whether unsetenv is declared... yes
| checking whether wcsdup is declared... yes
| checking for C compiler option to allow warnings... -Wno-error
| checking for C++ compiler option to allow warnings... -Wno-error
| checking whether <sys/socket.h> is self-contained... yes
| checking for shutdown... (cached) yes
| checking whether <sys/socket.h> defines the SHUT_* macros... yes
| checking for struct sockaddr_storage... yes
| checking for sa_family_t... yes
| checking for struct sockaddr_storage.ss_family... yes
| checking for a french Unicode locale... none
| checking for a turkish Unicode locale... none
| checking for IPv4 sockets... yes
| checking for IPv6 sockets... yes
| checking for off_t... yes
| checking where to find the exponent in a 'double'... (cached) word 1 bit 20
| checking where to find the exponent in a 'float'... word 0 bit 23
| checking whether long double and double are the same... no
| checking where to find the exponent in a 'long double'... unknown
| checking whether NAN macro works... yes
| checking whether HUGE_VAL works... yes
| checking whether <sys/select.h> is self-contained... yes
| checking for library needed for semaphore functions... none
| checking whether initstate is declared... yes
| checking whether setstate is declared... yes
| checking for library containing setsockopt... none needed
| checking whether snprintf returns a byte count as in C99... guessing yes
| checking whether printf supports POSIX/XSI format strings with positions... guessing yes
| checking whether snprintf is declared... yes
| checking whether <sys/ioctl.h> declares ioctl... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for intmax_t... yes
| checking whether snprintf truncates the result as in C99... guessing yes
| checking for wcslen... yes
| checking for snprintf... (cached) yes
| checking for strnlen... yes
| checking for wcrtomb... (cached) yes
| checking whether _snprintf is declared... no
| checking for alloca as a compiler built-in... yes
| checking for static_assert... yes, a keyword
| checking for bool, true, false... yes
| checking whether btowc(0) is correct... guessing yes
| checking whether btowc(EOF) is correct... (cached) yes
| checking whether btowc is consistent with mbrtowc in the C locale... guessing yes
| checking whether the C locale is free of encoding errors... guessing no
| checking for __builtin_expect... yes
| checking whether calloc (0, n) and calloc (n, 0) return nonnull... guessing yes
| checking for readlinkat... yes
| checking whether this system supports file names of any length... no
| checking for library containing clock_gettime... none required
| checking for clock_getres... yes
| checking for clock_gettime... yes
| checking for clock_settime... yes
| checking for closedir... yes
| checking for d_type member in directory struct... yes
| checking for dirfd... yes
| checking whether dirfd is declared... yes
| checking whether dirfd is a macro... no
| checking whether // is distinct from /... unknown, assuming no
| checking whether dup works... guessing yes
| checking whether dup2 works... guessing yes
| checking whether fcntl handles F_DUPFD correctly... guessing yes
| checking whether fcntl understands F_DUPFD_CLOEXEC... guessing no
| checking whether fdopendir is declared... yes
| checking whether fdopendir works... guessing yes
| checking for struct stat.st_blocks... yes
| checking for mempcpy... (cached) yes
| checking for flexible array member... yes
| checking for working GNU fnmatch... guessing no
| checking whether fopen supports the mode character 'x'... guessing yes
| checking whether fopen supports the mode character 'e'... guessing yes
| checking whether free is known to preserve errno... yes
| checking whether freopen works on closed fds... guessing no
| checking whether fstatat (..., 0) works... (cached) yes
| checking whether getdtablesize works... guessing yes
| checking for getpagesize... yes
| checking whether getpagesize is declared... yes
| checking for getprogname... no
| checking whether program_invocation_name is declared... yes
| checking whether program_invocation_name is declared... (cached) yes
| checking whether program_invocation_short_name is declared... yes
| checking whether __argv is declared... no
| checking for getrandom... yes
| checking whether getrandom is compatible with its GNU+BSD signature... yes
| checking for gettimeofday with POSIX signature... yes
| checking whether the compiler generally respects inline... yes
| checking for iswblank... yes
| checking whether iswblank is declared... yes
| checking whether iswdigit is ISO C compliant... guessing yes
| checking whether iswpunct is consistent with ispunct... guessing yes
| checking whether iswxdigit is ISO C compliant... guessing yes
| checking whether the compiler supports the __inline keyword... yes
| checking whether localeconv works... guessing yes
| checking for pthread_rwlock_t... yes
| checking whether pthread_rwlock_rdlock prefers a writer to a reader... guessing no
| checking whether mbrtoc32 works on empty input... guessing no
| checking whether the C locale is free of encoding errors... guessing no
| checking whether mbrtoc32 works in an UTF-8 locale... guessing no
| checking whether mbrtowc handles a NULL pwc argument... guessing yes
| checking whether mbrtowc handles a NULL string argument... guessing yes
| checking whether mbrtowc has a correct return value... (cached) yes
| checking whether mbrtowc returns 0 when parsing a NUL character... (cached) yes
| checking whether mbrtowc stores incomplete characters... guessing no
| checking whether mbrtowc works on empty input... guessing no
| checking whether the C locale is free of encoding errors... (cached) guessing no
| checking whether mbsrtowcs works... guessing yes
| checking whether the C locale is free of encoding errors... (cached) guessing no
| checking for mbtowc... yes
| checking for bp-sym.h... no
| checking for mempcpy... (cached) yes
| checking for memrchr... yes
| checking whether mkdir handles trailing slash... guessing yes
| checking whether mkdir handles trailing dot... guessing yes
| checking for working mkstemp... (cached) yes
| checking for __mktime_internal... no
| checking for nl_langinfo... yes
| checking whether YESEXPR works... guessing yes
| checking for C nullptr... yes
| checking whether open recognizes a trailing slash... guessing yes
| checking for opendir... yes
| checking for Perl 5.005 or newer... perl
| checking whether popen works with closed stdin... guessing yes
| checking whether program_invocation_name is declared... (cached) yes
| checking whether program_invocation_short_name is declared... (cached) yes
| checking for PTHREAD_CREATE_DETACHED... yes
| checking for PTHREAD_MUTEX_RECURSIVE... yes
| checking for PTHREAD_MUTEX_ROBUST... yes
| checking for PTHREAD_PROCESS_SHARED... yes
| checking whether pthread_once works... yes
| checking for raise... yes
| checking for sigprocmask... (cached) yes
| checking for rawmemchr... yes
| checking for readdir... yes
| checking whether readlink signature is correct... yes
| checking whether readlink handles trailing slash correctly... guessing yes
| checking whether readlink truncates results correctly... guessing yes
| checking for readlinkat... (cached) yes
| checking whether readlinkat signature is correct... yes
| checking whether realloc (..., 0) returns nonnull... guessing no
| checking for reallocarray... yes
| checking for working re_compile_pattern... guessing no
| checking for libintl.h... yes
| checking whether isblank is declared... yes
| checking whether setenv validates arguments... guessing yes
| checking for struct sigaction.sa_sigaction... yes
| checking for sigprocmask... (cached) yes
| checking for stack direction... grows down
| checking for stack_t... yes
| checking for working sigaltstack... guessing yes
| checking for correct stack_t interpretation... guessing yes
| checking for ssize_t... yes
| checking whether stat handles trailing slashes on files... guessing yes
| checking for struct stat.st_atim.tv_nsec... yes
| checking whether struct stat.st_atim is of type struct timespec... yes
| checking for struct stat.st_birthtimespec.tv_nsec... no
| checking for struct stat.st_birthtimensec... no
| checking for struct stat.st_birthtim.tv_nsec... no
| checking for va_copy... yes
| checking for stpcpy... yes
| checking for strcasecmp... yes
| checking whether strcasecmp works... configure: error: in '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/build':
| configure: error: cannot run test program while cross compiling
| See 'config.log' for more details
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.3102473:268 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.3102473, line 268
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.3102473, line 244
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.3102473, line 217
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.3102473, line 152
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.3102473, line 272
NOTE: recipe diffutils-3.12-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2004 tasks of which 1995 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515091533.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515091533.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/log.do_configure.3102473
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: diffutils-3.12-r0 do_configure: configure failed
ERROR: diffutils-3.12-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.3102473' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/log.do_configure.3102473
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure) failed with exit code '1'

--===============4575420755030699664==--

