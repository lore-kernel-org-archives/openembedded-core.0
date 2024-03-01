Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0DAC54EE0
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.36992.1709330718015098649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g3kid2w3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hrTbSrO7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dfc0cd8bf-87897a7b-e472-444b-a822-f041b28a67f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nyrnGxkfxHNgiitzet1X47YqDGB6FpSoXOWXYk4yywo=;
	b=g3kid2w3AVIDyKi4aKbI3x1gZ95r/ZFsqvc18Ex7EXMNZcWTyP3ZNZam2SqtieSL
	PuSMauL8LQJh0F/73/CJ73aD/nE0wXeYPz4YBItb/ybJJE0hbpoPq8qqZjAQZGvZYnQ
	3ozeo26+7RFW0IWd2F0CS0Ux0CX4kg/9Hkp34mJw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nyrnGxkfxHNgiitzet1X47YqDGB6FpSoXOWXYk4yywo=;
	b=hrTbSrO7+4b5l4CFKG1K8DyiqaHKpkxXOfiPFWejzXSvVjkAyiywgiws3f9l9Vq7
	EqKEw51zH/NvNhQAFV63NVjdza+2VfPIZv0eXoEC9HG8wLSYQxy1ZeXjorVu9a9fW1r
	HAuON5T0snkhMhULwgbPlQcEJHjthGTEMzTUwMPM=
Content-Type: multipart/mixed; boundary="===============8088911670732658161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 6ab022fdfcfedd28f4b5dbd8d3299414a367746f
 SUCCEEDED
Message-ID: <0101018dfc0cd8bf-87897a7b-e472-444b-a822-f041b28a67f2-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196531

--===============8088911670732658161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *6ab022fdfcfedd28f4b5dbd8d3299414a367746f* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From 560ebbbc4f44aaf2879d40b8265c7cb86b3cce5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 16:13:38 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 ...-cube-gears-Change-header-file-to-GLES3-gl3.h.patch | 10 ++++------
 meta/recipes-graphics/kmscube/kmscube_git.bb           |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
index 6843a662f4..f8608d4676 100644
--- a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
@@ -1,4 +1,4 @@
-From 0651c4edc9909832ff2acbbf170268f34e36616d Mon Sep 17 00:00:00 2001
+From 5f54f067da7ee24a61d6cb41e0636383729e2bad Mon Sep 17 00:00:00 2001
 From: Fabio Estevam <festevam@gmail.com>
 Date: Mon, 8 Jan 2024 15:00:01 -0300
 Subject: [PATCH] cube-gears: Change header file to <GLES3/gl3.h>
@@ -17,17 +17,15 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/merge_
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cube-gears.c b/cube-gears.c
-index d5b7a5f9cbef..cb538ecc4aee 100644
+index d5b7a5f..cb538ec 100644
 --- a/cube-gears.c
 +++ b/cube-gears.c
 @@ -31,7 +31,7 @@
  #include <sys/time.h>
  #include <math.h>
-
+ 
 -#include <GL/gl.h>
 +#include <GLES3/gl3.h>
-
+ 
  #include "common.h"
  #include "esUtil.h"
---
-2.34.1
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 505acb024b..19bbcd195d 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "96d63eb59e34c647cda1cbb489265f8c536ae055"
+SRCREV = "6ab022fdfcfedd28f4b5dbd8d3299414a367746f"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "
-- 
2.42.0


--===============8088911670732658161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA1NjBlYmJiYzRmNDRhYWYyODc5ZDQwYjgyNjVjN2NiODZiM2NjZTVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNjoxMzozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLi1jdWJlLWdlYXJzLUNo
YW5nZS1oZWFkZXItZmlsZS10by1HTEVTMy1nbDMuaC5wYXRjaCB8IDEwICsrKystLS0tLS0KIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiICAgICAgICAgICB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlLzAwMDEtY3Vi
ZS1nZWFycy1DaGFuZ2UtaGVhZGVyLWZpbGUtdG8tR0xFUzMtZ2wzLmgucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlLzAwMDEtY3ViZS1nZWFycy1DaGFuZ2UtaGVh
ZGVyLWZpbGUtdG8tR0xFUzMtZ2wzLmgucGF0Y2gKaW5kZXggNjg0M2E2NjJmNC4uZjg2MDhkNDY3
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZS8wMDAx
LWN1YmUtZ2VhcnMtQ2hhbmdlLWhlYWRlci1maWxlLXRvLUdMRVMzLWdsMy5oLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9rbXNjdWJlL2ttc2N1YmUvMDAwMS1jdWJlLWdlYXJzLUNo
YW5nZS1oZWFkZXItZmlsZS10by1HTEVTMy1nbDMuaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMDY1MWM0ZWRjOTkwOTgzMmZmMmFjYmJmMTcwMjY4ZjM0ZTM2NjE2ZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNWY1NGYwNjdkYTdlZTI0YTYxZDZjYjQxZTA2MzYzODM3MjllMmJh
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgOCBKYW4gMjAyNCAxNTowMDowMSAtMDMwMAogU3ViamVj
dDogW1BBVENIXSBjdWJlLWdlYXJzOiBDaGFuZ2UgaGVhZGVyIGZpbGUgdG8gPEdMRVMzL2dsMy5o
PgpAQCAtMTcsMTcgKzE3LDE1IEBAIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9rbXNjdWJlLy0vbWVyZ2VfCiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jdWJl
LWdlYXJzLmMgYi9jdWJlLWdlYXJzLmMKLWluZGV4IGQ1YjdhNWY5Y2JlZi4uY2I1MzhlY2M0YWVl
IDEwMDY0NAoraW5kZXggZDViN2E1Zi4uY2I1MzhlYyAxMDA2NDQKIC0tLSBhL2N1YmUtZ2VhcnMu
YwogKysrIGIvY3ViZS1nZWFycy5jCiBAQCAtMzEsNyArMzEsNyBAQAogICNpbmNsdWRlIDxzeXMv
dGltZS5oPgogICNpbmNsdWRlIDxtYXRoLmg+Ci0KKyAKIC0jaW5jbHVkZSA8R0wvZ2wuaD4KICsj
aW5jbHVkZSA8R0xFUzMvZ2wzLmg+Ci0KKyAKICAjaW5jbHVkZSAiY29tbW9uLmgiCiAgI2luY2x1
ZGUgImVzVXRpbC5oIgotLS0KLTIuMzQuMQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3Vi
ZS9rbXNjdWJlX2dpdC5iYgppbmRleCA1MDVhY2IwMjRiLi4xOWJiY2QxOTVkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBA
QCBERVBFTkRTID0gInZpcnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2Vn
bCBsaWJkcm0gdmlydHVhbC9saWJnYm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2tt
c2N1YmUuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTIzO21kNT04YjMwOWQ0ZWU2N2I3MzE1ZmY3Mzgx
MjcwZGQ2MzFmYiIKIAotU1JDUkVWID0gIjk2ZDYzZWI1OWUzNGM2NDdjZGExY2JiNDg5MjY1Zjhj
NTM2YWUwNTUiCitTUkNSRVYgPSAiNmFiMDIyZmRmY2ZlZGQyOGY0YjVkYmQ4ZDMyOTk0MTRhMzY3
NzQ2ZiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1
YmU7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LWN1YmUtZ2VhcnMtQ2hhbmdlLWhlYWRlci1maWxlLXRvLUdMRVMzLWdsMy5oLnBhdGNoIFwKICAg
ICAgICAgICAgIgotLSAKMi40Mi4wCgo=

--===============8088911670732658161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 351224 to 351160 (-0%)
packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-dev: RRECOMMENDS: removed "kmscube (['= 0.0.1+git0+96d63eb59e-r0'])", added "kmscube (['= 0.0.1+git0+6ab022fdfc-r0'])"
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4610163 to 4610109 (-0%)
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: RDEPENDS: removed "kmscube-dev (['= 0.0.1+git0+96d63eb59e-r0'])", added "kmscube-dev (['= 0.0.1+git0+6ab022fdfc-r0'])"
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc

--===============8088911670732658161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-14557e7c9c76976624c21f78bdd8ba02939e6bc3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:14557e7c9c76976624c21f78bdd8ba02939e6bc3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 240 Local 229 Mirrors 0 Missed 11 Current 465 (95% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1708 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: recipe kmscube-0.0.1+git-r0: task do_fetch: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 1983 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: Running task 1984 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmscube-0.0.1+git-r0: task do_unpack: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmscube-0.0.1+git-r0: task do_unpack: Succeeded
NOTE: Running task 1985 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: Running task 1986 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_collect_spdx_deps)
NOTE: recipe kmscube-0.0.1+git-r0: task do_patch: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 1987 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1988 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe kmscube-0.0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_lic: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to ee4a6b0694182171a479fd54703b0ef9511802135b0de2522097e7e7fa298689
NOTE: recipe kmscube-0.0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1989 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-0.0.1+git-r0: task do_configure: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 1990 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-0.0.1+git-r0: task do_compile: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-0.0.1+git-r0: task do_install: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1993 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_package: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot unihash changed to ca1b15c4404255b0730f8cc1091d50ba9e5e15c5bbc7dd29e60418fd5896adc0
NOTE: recipe kmscube-0.0.1+git-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2001 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-0.0.1+git-r0: task do_packagedata: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1994 tasks of which 1981 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301161005.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301161005.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-src went backwards which would break package feeds (from 0:0.0.1+git0+96d63eb59e-r0 to 0:0.0.1+git0+6ab022fdfc-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-dbg went backwards which would break package feeds (from 0:0.0.1+git0+96d63eb59e-r0 to 0:0.0.1+git0+6ab022fdfc-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-staticdev went backwards which would break package feeds (from 0:0.0.1+git0+96d63eb59e-r0 to 0:0.0.1+git0+6ab022fdfc-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-dev went backwards which would break package feeds (from 0:0.0.1+git0+96d63eb59e-r0 to 0:0.0.1+git0+6ab022fdfc-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-doc went backwards which would break package feeds (from 0:0.0.1+git0+96d63eb59e-r0 to 0:0.0.1+git0+6ab022fdfc-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-locale went backwards which would break package feeds (from 0:0.0.1+git0+96d63eb59e-r0 to 0:0.0.1+git0+6ab022fdfc-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube went backwards which would break package feeds (from 0:0.0.1+git0+96d63eb59e-r0 to 0:0.0.1+git0+6ab022fdfc-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmscube/0.0.1+git/temp/log.do_packagedata.2817949
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata) failed with exit code '1'

--===============8088911670732658161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-dev: RRECOMMENDS: removed "kmscube (['= 0.0.1+git0+96d63eb59e-r0'])", added "kmscube (['= 0.0.1+git0+6ab022fdfc-r0'])"
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: RDEPENDS: removed "kmscube-dev (['= 0.0.1+git0+96d63eb59e-r0'])", added "kmscube-dev (['= 0.0.1+git0+6ab022fdfc-r0'])"
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+96d63eb59e to 0.0.1+git0+6ab022fdfc

--===============8088911670732658161==--

