Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EC2C54E71
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1816.1746113628549843091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZB6ulc6L;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=s08K5+aW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b875b-ca412c82-f254-4cf1-a917-ccf8bac5f1c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=luVvEW1egqfhPw29NW66M2GyfcekOtL3uTCCDnipkt8=;
	b=ZB6ulc6LogWJ//YWmOwn9ljXRcGEwGVem9sr+set42+SE9BQKpNAdl6ZciyGZB5S
	4LzkFBwYijgAYN5Sm9GopOCIOhl8rHaVE8TsTyzbPbiJ9AgaLF3DHsukiNNQb3Na/WM
	M/1WYbxuRhTICYjs+4EK+jlX4QFHJGq0CuIL9LwE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=luVvEW1egqfhPw29NW66M2GyfcekOtL3uTCCDnipkt8=;
	b=s08K5+aWppLZRKIYHkGfR7PeeXzv9nkHWooz+pcmZXDrdip6L5E5mDW4Kf2macI1
	k0/ZhRDs+uXG8FeI5GJil+5ELmFrzT8Z/14FhyI4lGc5RiPyc7q3J25DIrR/0k4vCKr
	z7hmzOUqh0RWA/GgRkswaCJOwclvvG2vWNS9e5C4=
Content-Type: multipart/mixed; boundary="===============0328751384745991293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffutils: upgrading to 3.12 FAILED
Message-ID: <010101968c7b875b-ca412c82-f254-4cf1-a917-ccf8bac5f1c3-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215848

--===============0328751384745991293==
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
From 86a39a7a13e9d34697a5bbd062313da25b2f5b13 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:32:58 +0000
Subject: [PATCH] diffutils: upgrade 3.11 -> 3.12

---
 .../diffutils/0001-Skip-strip-trailing-cr-test-case.patch  | 7 +++----
 .../diffutils/{diffutils_3.11.bb => diffutils_3.12.bb}     | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.11.bb => diffutils_3.12.bb} (93%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
index 32793233f9..3dda96f862 100644
--- a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
+++ b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
@@ -1,4 +1,4 @@
-From f31395c931bc633206eccfcfaaaa5d15021a3e86 Mon Sep 17 00:00:00 2001
+From 52c064d0420b284dd4a5fc7b36c1cea7b8a419cb Mon Sep 17 00:00:00 2001
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


--===============0328751384745991293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffutils-upgrade-3.11-3.12.patch"

RnJvbSA4NmEzOWE3YTEzZTlkMzQ2OTdhNWJiZDA2MjMxM2RhMjViMmY1YjEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDozMjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZ1dGlsczogdXBncmFkZSAzLjExIC0+IDMuMTIKCi0tLQogLi4uL2RpZmZ1dGlscy8wMDAxLVNr
aXAtc3RyaXAtdHJhaWxpbmctY3ItdGVzdC1jYXNlLnBhdGNoICB8IDcgKysrLS0tLQogLi4uL2Rp
ZmZ1dGlscy97ZGlmZnV0aWxzXzMuMTEuYmIgPT4gZGlmZnV0aWxzXzMuMTIuYmJ9ICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRpbHMve2RpZmZ1dGlsc18zLjExLmJiID0+
IGRpZmZ1dGlsc18zLjEyLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9kaWZmdXRpbHMvZGlmZnV0aWxzLzAwMDEtU2tpcC1zdHJpcC10cmFpbGluZy1jci10ZXN0
LWNhc2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlscy8w
MDAxLVNraXAtc3RyaXAtdHJhaWxpbmctY3ItdGVzdC1jYXNlLnBhdGNoCmluZGV4IDMyNzkzMjMz
ZjkuLjNkZGE5NmY4NjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRp
bHMvZGlmZnV0aWxzLzAwMDEtU2tpcC1zdHJpcC10cmFpbGluZy1jci10ZXN0LWNhc2UucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy9kaWZmdXRpbHMvMDAwMS1Ta2lw
LXN0cmlwLXRyYWlsaW5nLWNyLXRlc3QtY2FzZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZjMxMzk1YzkzMWJjNjMzMjA2ZWNjZmNmYWFhYTVkMTUwMjFhM2U4NiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNTJjMDY0ZDA0MjBiMjg0ZGQ0YTVmYzdiMzZjMWNlYTdiOGE0MTljYiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBlaXJhbiBIb25nIDxwZWlyYW4uaG9uZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCA1IFNlcCAyMDE5IDE1OjQyOjIyIC0wNDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIFNraXAgc3RyaXAtdHJhaWxpbmctY3IgdGVzdCBjYXNlCkBAIC0xMCwxNiAr
MTAsMTUgQEAgcGFja2FnZS4KIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbZW1iZWRk
ZWQgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IFBlaXJhbiBIb25nIDxwZWlyYW4uaG9uZ0B3
aW5kcml2ZXIuY29tPgotCiAtLS0KICB0ZXN0cy9NYWtlZmlsZS5hbSB8IDEgLQogIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBi
L3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCA3OWJhY2ZiLi40YWRiNGQ3IDEwMDY0NAoraW5kZXgg
NDc0NDlmYy4uNzE4ZTk3NiAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi90
ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTIyLDcgKzIyLDYgQEAgVEVTVFMgPSBcCitAQCAtMzAsNyAr
MzAsNiBAQCBURVNUUyA9IFwKICAgIHN0ZGluIFwKICAgIHN0cmNvbGwtMC1uYW1lcyBcCiAgICBm
aWxlbmFtZS1xdW90aW5nIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZm
dXRpbHMvZGlmZnV0aWxzXzMuMTEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxz
L2RpZmZ1dGlsc18zLjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9kaWZmdXRpbHMvZGlmZnV0aWxzXzMuMTEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRpbHMvZGlmZnV0aWxzXzMuMTIuYmIKaW5kZXggYTRi
YWRjMDQ0ZS4uNjcyMzNkMTYzNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Rp
ZmZ1dGlscy9kaWZmdXRpbHNfMy4xMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlm
ZnV0aWxzL2RpZmZ1dGlsc18zLjEyLmJiCkBAIC04LDcgKzgsNyBAQCBTUkNfVVJJID0gIiR7R05V
X01JUlJPUn0vZGlmZnV0aWxzL2RpZmZ1dGlscy0ke1BWfS50YXIueHogXAogICAgICAgICAgICBm
aWxlOi8vMDAwMS1Ta2lwLXN0cmlwLXRyYWlsaW5nLWNyLXRlc3QtY2FzZS5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE3M2VmMDVmZTM3ZGQ1ODVmN2Q4NzA2
OGU0YTA2Mzk3NjA0MTlmODEwMTM4YmQ3NWM2MWRkYWExZjllMjEzMWUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiN2M4YjdmOWZjODYwOTE0MWZkZWE5Y2VjZTg1MjQ5ZDMwODYyNDM5MWZmNjFkZWRh
ZjUyOGZjYjMzNzcyN2RmZCIKIAogRVhUUkFfT0VDT05GICs9ICJhY19jdl9wYXRoX1BSX1BST0dS
QU09JHtiaW5kaXJ9L3ByIC0td2l0aG91dC1saWJzaWdzZWd2LXByZWZpeCIKIAotLSAKMi40Ny4x
Cgo=

--===============0328751384745991293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:bc5e2cc6eeb72ab46bde2f1e93cf1ffd8c35220f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 347 Local 336 Mirrors 0 Missed 11 Current 366 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 427 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1079 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 691 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe diffutils-3.12-r0: task do_fetch: Started
NOTE: recipe diffutils-3.12-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1210 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.12-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_patch: Started
NOTE: recipe diffutils-3.12-r0: task do_patch: Succeeded
NOTE: Running task 1466 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1467 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_populate_lic)
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.12-r0: task do_populate_lic: Started
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_deploy_source_date_epoch unihash changed to 1fd50e4ba914078486b4057ae33923ff7845585cf613b0c56827cc55654cadad
NOTE: recipe diffutils-3.12-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_populate_lic unihash changed to bc2d7595ff182050847e348f9ad68ef444aac2bf2d53e731e43125f318a6972d
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1709 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1969 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2004 of 2019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure)
NOTE: recipe diffutils-3.12-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/g
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
| checking for unreachable... no
| checking whether nullptr_t needs <stddef.h>... no
| checking for clean definition of __STDC_VERSION_STDDEF_H__... yes
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
| checking for static_assert... yes, an <assert.h> macro
| checking for bool, true, false... no
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
| checking for C nullptr... no
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.1818821:268 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.1818821, line 268
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.1818821, line 244
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.1818821, line 217
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.1818821, line 152
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.1818821, line 272
NOTE: recipe diffutils-3.12-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2004 tasks of which 1996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501103217.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501103217.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/log.do_configure.1818821
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: diffutils-3.12-r0 do_configure: configure failed
ERROR: diffutils-3.12-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/run.do_configure.1818821' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/diffutils/3.12/temp/log.do_configure.1818821
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure) failed with exit code '1'

--===============0328751384745991293==--

