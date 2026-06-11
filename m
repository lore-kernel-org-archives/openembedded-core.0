Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C13CD98EE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50416.1781195501832314968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I8ogQQVq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G/HXxL/9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb7867042-19beacf2-44ca-46cc-8aa6-e687304f6666-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q+AXSgifK/eaSzKi2WZn42l02uIZTPoTjSIyP4kR6TA=;
	b=I8ogQQVqTAoIqCI3CdF4zDUIfjd5x47t0vXHIWgqG9olzdCniv4rJURYOn7CDjZ/
	xyMZ89aIYo6xaAdJC7WqiyZUzyH65mFPEzFGPh61gti1LGUQvw7Naw5yob99ZbDY8LY
	VJQpEvMmVUASEUdAKEUqgZ0FwC+WuoTxtBC1+6hA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q+AXSgifK/eaSzKi2WZn42l02uIZTPoTjSIyP4kR6TA=;
	b=G/HXxL/9nyW3PsIkpHIsdAUEdSAKtNcysRk2AjVVru155Z76641gU3AVDhooISKI
	GPmy9ZM7ORfym9gUz8nh0g6Lr6i4jmju+h5OpvNjiDhDrJSN33EmuUfX0SP0Of7s7Y/
	IzH2+Ajc1S99vBwJlxkvsxz3aUheY3OP+AEELqDw=
Content-Type: multipart/mixed; boundary="===============8010461746723819318=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to bac66cfc3254aabcd8640c8ebbeb6d62a198d454
 SUCCEEDED
Message-ID: <0101019eb7867042-19beacf2-44ca-46cc-8aa6-e687304f6666-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238480

--===============8010461746723819318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *bac66cfc3254aabcd8640c8ebbeb6d62a198d454* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From 4d18d22c9e5707f3cbcbdd30c4b064c026e13b5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:08:23 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 .../0001-gn-fix-build-with-gcc-16-on-musl.patch      | 12 ++++--------
 meta/recipes-devtools/gn/gn_git.bb                   |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
index e933c17d8a..f894e2cc3f 100644
--- a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
+++ b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
@@ -1,4 +1,4 @@
-From 6d22f5c9e96811f1abcedd8fb1849fe72747b5c4 Mon Sep 17 00:00:00 2001
+From f497b019507aef8f6e54dd577ba67801ca146560 Mon Sep 17 00:00:00 2001
 From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
 Date: Mon, 11 May 2026 02:43:10 -0700
 Subject: [PATCH] gn: fix build with GCC 16 on musl
@@ -11,23 +11,19 @@ Fixes:
 Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]
 
 Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
 ---
  src/gn/pool.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/gn/pool.h b/src/gn/pool.h
-index e03113608..247cb6425 100644
+index 7beb5da0..c3d5883e 100644
 --- a/src/gn/pool.h
 +++ b/src/gn/pool.h
-@@ -6,6 +6,7 @@
- #define TOOLS_GN_POOL_H_
+@@ -7,6 +7,7 @@
  
+ #include <cstdint>
  #include <string>
 +#include <cstdint>
  
  #include "gn/item.h"
  
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 6047ab5e2b..a5b8a7c9db 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
            file://0001-gn-fix-build-with-gcc-16-on-musl.patch \
 "
-SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
+SRCREV = "bac66cfc3254aabcd8640c8ebbeb6d62a198d454"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============8010461746723819318==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSA0ZDE4ZDIyYzllNTcwN2YzY2JjYmRkMzBjNGIwNjRjMDI2ZTEzYjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6MDg6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uLzAwMDEtZ24tZml4LWJ1aWxk
LXdpdGgtZ2NjLTE2LW9uLW11c2wucGF0Y2ggICAgICB8IDEyICsrKystLS0tLS0tLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYiAgICAgICAgICAgICAgICAgICB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZmlsZXMvMDAwMS1nbi1maXgtYnVpbGQtd2l0
aC1nY2MtMTYtb24tbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9maWxlcy8w
MDAxLWduLWZpeC1idWlsZC13aXRoLWdjYy0xNi1vbi1tdXNsLnBhdGNoCmluZGV4IGU5MzNjMTdk
OGEuLmY4OTRlMmNjM2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9maWxl
cy8wMDAxLWduLWZpeC1idWlsZC13aXRoLWdjYy0xNi1vbi1tdXNsLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nbi9maWxlcy8wMDAxLWduLWZpeC1idWlsZC13aXRoLWdjYy0xNi1v
bi1tdXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZDIyZjVjOWU5NjgxMWYxYWJjZWRk
OGZiMTg0OWZlNzI3NDdiNWM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNDk3YjAx
OTUwN2FlZjhmNmU1NGRkNTc3YmE2NzgwMWNhMTQ2NTYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSGVtYW50aCBLdW1hciBNIEQgPEhlbWFudGguS3VtYXJNREB3aW5kcml2ZXIuY29t
PgogRGF0ZTogTW9uLCAxMSBNYXkgMjAyNiAwMjo0MzoxMCAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBnbjogZml4IGJ1aWxkIHdpdGggR0NDIDE2IG9uIG11c2wKQEAgLTExLDIzICsxMSwxOSBAQCBG
aXhlczoKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2duLXJldmlldy5nb29n
bGVzb3VyY2UuY29tL2MvZ24vKy8yMjc0MF0KIAogU2lnbmVkLW9mZi1ieTogSGVtYW50aCBLdW1h
ciBNIEQgPEhlbWFudGguS3VtYXJNREB3aW5kcml2ZXIuY29tPgotCiAtLS0KICBzcmMvZ24vcG9v
bC5oIHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQg
YS9zcmMvZ24vcG9vbC5oIGIvc3JjL2duL3Bvb2wuaAotaW5kZXggZTAzMTEzNjA4Li4yNDdjYjY0
MjUgMTAwNjQ0CitpbmRleCA3YmViNWRhMC4uYzNkNTg4M2UgMTAwNjQ0CiAtLS0gYS9zcmMvZ24v
cG9vbC5oCiArKysgYi9zcmMvZ24vcG9vbC5oCi1AQCAtNiw2ICs2LDcgQEAKLSAjZGVmaW5lIFRP
T0xTX0dOX1BPT0xfSF8KK0BAIC03LDYgKzcsNyBAQAogIAorICNpbmNsdWRlIDxjc3RkaW50Pgog
ICNpbmNsdWRlIDxzdHJpbmc+CiArI2luY2x1ZGUgPGNzdGRpbnQ+CiAgCiAgI2luY2x1ZGUgImdu
L2l0ZW0uaCIKICAKLS0tIAotMi40OS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nbi9nbl9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmlu
ZGV4IDYwNDdhYjVlMmIuLmE1YjhhN2M5ZGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nbi9nbl9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5i
YgpAQCAtOSw3ICs5LDcgQEAgVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgogU1JDX1VSSSA9
ICJnaXQ6Ly9nbi5nb29nbGVzb3VyY2UuY29tL2duO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWlu
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZ24tZml4LWJ1aWxkLXdpdGgtZ2NjLTE2LW9uLW11
c2wucGF0Y2ggXAogIgotU1JDUkVWID0gImVhYjhhOWY5MmRjYTliODU0OGE4OWQ5ZTVlYjZhZWI4
YWM2YmJhNzciCitTUkNSRVYgPSAiYmFjNjZjZmMzMjU0YWFiY2Q4NjQwYzhlYmJlYjZkNjJhMTk4
ZDQ1NCIKIFBWID0gIjArZ2l0IgogCiBCQl9HSVRfU0hBTExPVyA9ICIiCi0tIAoyLjQ3LjEKCg==

--===============8010461746723819318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 104594232 to 108546264 (+4%)
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+eab8a9f92d-r0'])", added "gn (['= 0+git0+bac66cfc32-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3214719 to 3244947 (+1%)
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+eab8a9f92d-r0'])", added "gn-dev (['= 0+git0+bac66cfc32-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 4034744 to 4161720 (+3%)

--===============8010461746723819318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0c7f9378f0d4956cd9c23711960a51d6cea67a72"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0c7f9378f0d4956cd9c23711960a51d6cea67a72"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 137 Local 125 Mirrors 0 Missed 12 Current 285 (91% match, 97% complete)
done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 959 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_fetch)
NOTE: Running task 1036 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_create_recipe_spdx)
NOTE: recipe gn-0+git-r0: task do_fetch: Started
NOTE: recipe gn-0+git-r0: task do_create_recipe_spdx: Started
NOTE: recipe gn-0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1055 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_unpack)
NOTE: Running task 1056 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gn-0+git-r0: task do_unpack: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gn-0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_patch)
NOTE: recipe gn-0+git-r0: task do_patch: Started
NOTE: recipe gn-0+git-r0: task do_patch: Succeeded
NOTE: Running task 1058 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1059 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic)
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic unihash changed to 32e669a88727ba263a70b54286ad69cf4555b4e66cecdf2c8872bb05d50a2cf6
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1060 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_configure)
NOTE: recipe gn-0+git-r0: task do_configure: Started
NOTE: recipe gn-0+git-r0: task do_configure: Succeeded
NOTE: Running task 1061 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_compile)
NOTE: recipe gn-0+git-r0: task do_compile: Started
NOTE: recipe gn-0+git-r0: task do_compile: Succeeded
NOTE: Running task 1062 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_install)
NOTE: recipe gn-0+git-r0: task do_install: Started
NOTE: recipe gn-0+git-r0: task do_install: Succeeded
NOTE: Running task 1063 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package)
NOTE: Running task 1064 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot)
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_package: Started
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot unihash changed to e3bcd6da52710ac1292cda7017aa994120618994f4676c9a4df570a180ea962d
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_package: Succeeded
NOTE: Running task 1065 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata)
NOTE: recipe gn-0+git-r0: task do_packagedata: Started
NOTE: recipe gn-0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1065 tasks of which 1052 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611090630.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611090630.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.580849
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-src went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+bac66cfc32-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dbg went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+bac66cfc32-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-staticdev went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+bac66cfc32-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dev went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+bac66cfc32-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-doc went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+bac66cfc32-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-locale went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+bac66cfc32-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+bac66cfc32-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.580849
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata) failed with exit code '1'

--===============8010461746723819318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+eab8a9f92d-r0'])", added "gn (['= 0+git0+bac66cfc32-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+eab8a9f92d-r0'])", added "gn-dev (['= 0+git0+bac66cfc32-r0'])"
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+eab8a9f92d to 0+git0+bac66cfc32

--===============8010461746723819318==--

