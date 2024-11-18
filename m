Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5703DD60CF4
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4900.1731964690584546966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Yqc/Je11;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gwVEsKXK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101934123de58-ca442c1b-57ad-4417-970b-72bb6167ee70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=02xu2awjJzyjBPgpZI3jU/LuRsFkilxnY+lD9Lu0LB8=;
	b=Yqc/Je11rN/74M5Mtp8r3LtV2hxb/2WS4+XFaU0824nQP3XNUdRh33miidy5tZKv
	Vz1J2i6eZrcQqeV+kz/2o4srS0AUfzgs8FPnbfpuyieZ2G2L+VD2wce45HI74qwr1TU
	GMiRWwTkYCeSPte7g54pMTAKWQinuWasGcWnYo1M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=02xu2awjJzyjBPgpZI3jU/LuRsFkilxnY+lD9Lu0LB8=;
	b=gwVEsKXKSgDKrkCY2pgIyNp+swVTlXmuRhPCizApe84FMeSuC8tVKNy4Wncilq61
	EKDMfg3ekCkw+oFJl/b+XdCwLEwlA5SfTdBFn/QM5OHP6R3AJ/tBdoaTaNb5NUWXRG2
	BvDw63VEDM9WmfYbDzEqIm78ASE5IMwhMZDstueU=
Content-Type: multipart/mixed; boundary="===============0352945731956562619=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.72 SUCCEEDED
Message-ID: <010101934123de58-ca442c1b-57ad-4417-970b-72bb6167ee70-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207363

--===============0352945731956562619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap* to *2.72* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-upgrade-2.70-2.72.patch
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
From 4a85a5b1988c929a88d43bd5618f38ad9989e8be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 13:44:27 +0000
Subject: [PATCH] libcap: upgrade 2.70 -> 2.72

---
 ...sure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch | 2 +-
 ...tivesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 .../files/0002-tests-do-not-run-target-executables.patch    | 6 +++---
 .../libcap/{libcap_2.70.bb => libcap_2.72.bb}               | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.70.bb => libcap_2.72.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
index e77d0c8c51..4cffcc418e 100644
--- a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
+++ b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
@@ -1,4 +1,4 @@
-From 2261f47bac78aa77934ca03980ed54d1d86116b9 Mon Sep 17 00:00:00 2001
+From d47dc93c6212b06958a9b74c4452658feff1487c Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 23 Jun 2016 16:26:43 +0800
 Subject: [PATCH] Ensure the XATTR_NAME_CAPS is defined when it is used
diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index ecbdd22099..fb32989c7d 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From fcb0166c5e991fcf62797b19bea39983214289cb Mon Sep 17 00:00:00 2001
+From 4c06176871ce20d5e6b9f4cae2304fcf4ea891a0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index 31f27e914f..c4099520c1 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From a3368b38abfb703e730fc5462f42cc5d177d864d Mon Sep 17 00:00:00 2001
+From f1ca0c976eec4c683cd75db82796e08cb304fed4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index ecb7d1b..8950c73 100644
+index 3d03721..fbb1d78 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -61,13 +61,11 @@ endif
+@@ -69,13 +69,11 @@ endif
  
  # unprivileged
  run_psx_test: psx_test
diff --git a/meta/recipes-support/libcap/libcap_2.70.bb b/meta/recipes-support/libcap/libcap_2.72.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.70.bb
rename to meta/recipes-support/libcap/libcap_2.72.bb
index 6e2fd728e2..979f5b47d4 100644
--- a/meta/recipes-support/libcap/libcap_2.70.bb
+++ b/meta/recipes-support/libcap/libcap_2.72.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f"
+SRC_URI[sha256sum] = "0274f5a15a5205f656d8f0169eef711dd29158ba8ad3b240618b342b2460175b"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.44.1


--===============0352945731956562619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libcap.so.2.70 /usr/lib/libpsx.so.2.70", added "/usr/lib/libpsx.so.2.72 /usr/lib/libcap.so.2.72"
Changes to packages/core2-64-poky-linux/libcap (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.70 to libcap.so.2.72
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.70 to libpsx.so.2.72
  /usr/lib/libcap.so.2.70 moved to /usr/lib/libcap.so.2.72
  /usr/lib/libpsx.so.2.70 moved to /usr/lib/libpsx.so.2.72
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.70 to libcap.so.2.72
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.70 to libpsx.so.2.72
  /lib/libcap.so.2.70 moved to /lib/libcap.so.2.72
  /usr/lib/libpsx.so.2.70 moved to /usr/lib/libpsx.so.2.72

--===============0352945731956562619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9422342 to 9620507 (+2%)
packages/core2-64-poky-linux/libcap: SRC_URI changed from "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.70.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch" to "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.72.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch"
packages/core2-64-poky-linux/libcap: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap-bin: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap-bin: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap-dbg: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap-dbg: PKGSIZE changed from 318448 to 314816 (-1%)
packages/core2-64-poky-linux/libcap/libcap-dbg: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap-dbg: FILELIST: removed "/usr/lib/.debug/libcap.so.2.70 /usr/lib/.debug/libpsx.so.2.70", added "/usr/lib/.debug/libcap.so.2.72 /usr/lib/.debug/libpsx.so.2.72"
packages/core2-64-poky-linux/libcap/libcap-dev: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap-dev: PKGSIZE changed from 12677 to 13691 (+8%)
packages/core2-64-poky-linux/libcap/libcap-dev: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap-doc: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap-doc: PKGSIZE changed from 85139 to 85692 (+1%)
packages/core2-64-poky-linux/libcap/libcap-doc: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap-locale: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap-locale: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap-src: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap-src: PKGSIZE changed from 219945 to 219190 (-0%)
packages/core2-64-poky-linux/libcap/libcap-src: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap-src: FILELIST: directory renamed /usr/src/debug/libcap/2.70/libcap/include/sys -> /usr/src/debug/libcap/2.72/libcap/include/sys, directory renamed /usr/src/debug/libcap/2.70/psx -> /usr/src/debug/libcap/2.72/psx, directory renamed /usr/src/debug/libcap/2.70/pam_cap -> /usr/src/debug/libcap/2.72/pam_cap, directory renamed /usr/src/debug/libcap/2.70/libcap/include/uapi/linux -> /usr/src/debug/libcap/2.72/libcap/include/uapi/linux, directory renamed /usr/src/debug/libcap/2.70/progs -> /usr/src/debug/libcap/2.72/progs, removed "/usr/src/debug/libcap/2.70/libcap/execable.h /usr/src/debug/libcap/2.70/libcap/psx_exec.c /usr/src/debug/libcap/2.70/libcap/cap_file.c /usr/src/debug/libcap/2.70/libcap/libcap.h /usr/src/debug/libcap/2.70/libcap/execable.c /usr/src/debug/libcap/2.70/libcap/cap_text.c /usr/src/debug/libcap/2.70/libcap/cap_proc.c /usr/src/debug/libcap/2.70/libcap/_caps_output.gperf /usr/src/debug/libcap/2.70/libcap/cap_extint.c /usr/src/deb
 ug/libcap/2.70/libcap/cap_flag.c /usr/src/debug/libcap/2.70/libcap/cap_alloc.c", added "/usr/src/debug/libcap/2.72/libcap/execable.h /usr/src/debug/libcap/2.72/libcap/psx_exec.c /usr/src/debug/libcap/2.72/libcap/cap_syscalls.c /usr/src/debug/libcap/2.72/libcap/cap_file.c /usr/src/debug/libcap/2.72/libcap/execable.c /usr/src/debug/libcap/2.72/libcap/libcap.h /usr/src/debug/libcap/2.72/libcap/cap_text.c /usr/src/debug/libcap/2.72/psx/wrap/psx_wrap.c /usr/src/debug/libcap/2.72/libcap/cap_proc.c /usr/src/debug/libcap/2.72/libcap/_caps_output.gperf /usr/src/debug/libcap/2.72/libcap/cap_extint.c /usr/src/debug/libcap/2.72/libcap/cap_flag.c /usr/src/debug/libcap/2.72/libcap/cap_alloc.c"
packages/core2-64-poky-linux/libcap/libcap-staticdev: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap-staticdev: PKGSIZE changed from 232196 to 229552 (-1%)
packages/core2-64-poky-linux/libcap/libcap-staticdev: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap: PKGV changed from 2.70 [default] to 2.72 [default]
packages/core2-64-poky-linux/libcap/libcap: PKGSIZE changed from 83996 to 79900 (-5%)
packages/core2-64-poky-linux/libcap/libcap: PV changed from "2.70" to "2.72"
packages/core2-64-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libcap.so.2.70 /usr/lib/libpsx.so.2.70", added "/usr/lib/libcap.so.2.72 /usr/lib/libpsx.so.2.72"
Changes to packages/core2-64-poky-linux/libcap (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.70 to libcap.so.2.72
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.70 to libpsx.so.2.72
  /usr/lib/libcap.so.2.70 moved to /usr/lib/libcap.so.2.72
  /usr/lib/libpsx.so.2.70 moved to /usr/lib/libpsx.so.2.72
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.70 to libcap.so.2.72
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.70 to libpsx.so.2.72
  /lib/libcap.so.2.70 moved to /lib/libcap.so.2.72
  /usr/lib/libpsx.so.2.70 moved to /usr/lib/libpsx.so.2.72

--===============0352945731956562619==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-upgrade-2.70-2.72.patch"

RnJvbSA0YTg1YTViMTk4OGM5MjlhODhkNDNiZDU2MThmMzhhZDk5ODllOGJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMTM6NDQ6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXA6IHVwZ3JhZGUgMi43MCAtPiAyLjcyCgotLS0KIC4uLnN1cmUtdGhlLVhBVFRSX05BTUVf
Q0FQUy1pcy1kZWZpbmVkLXdoZW4taXQtaXMtdXNlLnBhdGNoIHwgMiArLQogLi4udGl2ZXNkay1s
aWJjYXAtUmFpc2UtdGhlLXNpemUtb2YtYXJyYXlzLWNvbnRhaW5pbmcucGF0Y2ggfCAyICstCiAu
Li4vZmlsZXMvMDAwMi10ZXN0cy1kby1ub3QtcnVuLXRhcmdldC1leGVjdXRhYmxlcy5wYXRjaCAg
ICB8IDYgKysrLS0tCiAuLi4vbGliY2FwL3tsaWJjYXBfMi43MC5iYiA9PiBsaWJjYXBfMi43Mi5i
Yn0gICAgICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC97bGli
Y2FwXzIuNzAuYmIgPT4gbGliY2FwXzIuNzIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEtZW5zdXJlLXRoZS1YQVRUUl9OQU1FX0NB
UFMtaXMtZGVmaW5lZC13aGVuLWl0LWlzLXVzZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC9maWxlcy8wMDAxLWVuc3VyZS10aGUtWEFUVFJfTkFNRV9DQVBTLWlzLWRlZmluZWQt
d2hlbi1pdC1pcy11c2UucGF0Y2gKaW5kZXggZTc3ZDBjOGM1MS4uNGNmZmNjNDE4ZSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEtZW5zdXJlLXRoZS1Y
QVRUUl9OQU1FX0NBUFMtaXMtZGVmaW5lZC13aGVuLWl0LWlzLXVzZS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvZmlsZXMvMDAwMS1lbnN1cmUtdGhlLVhBVFRSX05BTUVf
Q0FQUy1pcy1kZWZpbmVkLXdoZW4taXQtaXMtdXNlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAyMjYxZjQ3YmFjNzhhYTc3OTM0Y2EwMzk4MGVkNTRkMWQ4NjExNmI5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBkNDdkYzkzYzYyMTJiMDY5NThhOWI3NGM0NDUyNjU4ZmVmZjE0ODdj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5saUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogVGh1LCAyMyBKdW4gMjAxNiAxNjoyNjo0MyArMDgwMAogU3ViamVj
dDogW1BBVENIXSBFbnN1cmUgdGhlIFhBVFRSX05BTUVfQ0FQUyBpcyBkZWZpbmVkIHdoZW4gaXQg
aXMgdXNlZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAw
MDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMtY29udGFpbmluZy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9maWxlcy8wMDAxLW5hdGl2ZXNkay1s
aWJjYXAtUmFpc2UtdGhlLXNpemUtb2YtYXJyYXlzLWNvbnRhaW5pbmcucGF0Y2gKaW5kZXggZWNi
ZGQyMjA5OS4uZmIzMjk4OWM3ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Y2FwL2ZpbGVzLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMt
Y29udGFpbmluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvZmlsZXMv
MDAwMS1uYXRpdmVzZGstbGliY2FwLVJhaXNlLXRoZS1zaXplLW9mLWFycmF5cy1jb250YWluaW5n
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmY2IwMTY2YzVlOTkxZmNmNjI3OTdiMTliZWEz
OTk4MzIxNDI4OWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0YzA2MTc2ODcxY2Uy
MGQ1ZTZiOWY0Y2FlMjMwNGZjZjRlYTg5MWEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNCBP
Y3QgMjAyMSAxNTo1NzozNiArMDgwMAogU3ViamVjdDogW1BBVENIXSBuYXRpdmVzZGstbGliY2Fw
OiBSYWlzZSB0aGUgc2l6ZSBvZiBhcnJheXMgY29udGFpbmluZyBkbApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDItdGVzdHMtZG8tbm90LXJ1bi10YXJn
ZXQtZXhlY3V0YWJsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvZmlsZXMv
MDAwMi10ZXN0cy1kby1ub3QtcnVuLXRhcmdldC1leGVjdXRhYmxlcy5wYXRjaAppbmRleCAzMWYy
N2U5MTRmLi5jNDA5OTUyMGMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAvZmlsZXMvMDAwMi10ZXN0cy1kby1ub3QtcnVuLXRhcmdldC1leGVjdXRhYmxlcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvZmlsZXMvMDAwMi10ZXN0cy1kby1ub3Qt
cnVuLXRhcmdldC1leGVjdXRhYmxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTMzNjhi
MzhhYmZiNzAzZTczMGZjNTQ2MmY0MmNjNWQxNzdkODY0ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZjFjYTBjOTc2ZWVjNGM2ODNjZDc1ZGI4Mjc5NmUwOGNiMzA0ZmVkNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogRnJpLCAyMCBEZWMgMjAxOSAxNjo1NDowNSArMDEwMAogU3ViamVj
dDogW1BBVENIXSB0ZXN0czogZG8gbm90IHJ1biB0YXJnZXQgZXhlY3V0YWJsZXMKQEAgLTEwLDEw
ICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL3Rlc3RzL01ha2VmaWxlIGIvdGVzdHMvTWFrZWZpbGUKLWluZGV4IGVjYjdkMWIuLjg5NTBj
NzMgMTAwNjQ0CitpbmRleCAzZDAzNzIxLi5mYmIxZDc4IDEwMDY0NAogLS0tIGEvdGVzdHMvTWFr
ZWZpbGUKICsrKyBiL3Rlc3RzL01ha2VmaWxlCi1AQCAtNjEsMTMgKzYxLDExIEBAIGVuZGlmCitA
QCAtNjksMTMgKzY5LDExIEBAIGVuZGlmCiAgCiAgIyB1bnByaXZpbGVnZWQKICBydW5fcHN4X3Rl
c3Q6IHBzeF90ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvbGli
Y2FwXzIuNzAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvbGliY2FwXzIuNzIuYmIK
c2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Y2FwL2xpYmNhcF8yLjcwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAv
bGliY2FwXzIuNzIuYmIKaW5kZXggNmUyZmQ3MjhlMi4uOTc5ZjViNDdkNCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2xpYmNhcF8yLjcwLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmNhcC9saWJjYXBfMi43Mi5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNf
VVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbGlicy9zZWN1cml0eS9saW51eC1wcml2
cy8ke0JQTn0yLyR7QlBOfS0kewogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW5hdGl2ZXNkay1saWJjYXAtUmFpc2UtdGhlLXNpemUt
b2YtYXJyYXlzLWNvbnRhaW5pbmcucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMjNhNmVmOGFhZGFmMWUzZTg3NWY2MzNiYjJkMTE2Y2ZlZjg5NTJkYmE3YmM3YzU2
OWIxMzQ1OGUxOTUyYjMwZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMjc0ZjVhMTVhNTIwNWY2
NTZkOGYwMTY5ZWVmNzExZGQyOTE1OGJhOGFkM2IyNDA2MThiMzQyYjI0NjAxNzViIgogCiBVUFNU
UkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvbGlicy9z
ZWN1cml0eS9saW51eC1wcml2cy8ke0JQTn0yLyIKIAotLSAKMi40NC4xCgo=

--===============0352945731956562619==--

