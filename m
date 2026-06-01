Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9785CD6E6F
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1549.1780328126343726066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=u2IwJq3e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=X1ZjT7L2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d379c5-6b25eead-0fe9-4383-8633-8c99c1c8681a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N7jhqdCCotlrUc/AyZqUb81sBekAxF5wEudAf1y9A7U=;
	b=u2IwJq3eFctc8unphgIr0eP2P85iL5ajNptrTvgbtqR5mMY+kjhl4fdo4t97FWcf
	/PfC+oi+4NrqcrPayEOOvvkv8cXU2nY5AesMk/ycYnS3ZC1YeZGpG2i1fZllUHM+8+S
	o5+v4y/XGrNAv+3VMcB16FiXfPWusnRycXud8S+Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N7jhqdCCotlrUc/AyZqUb81sBekAxF5wEudAf1y9A7U=;
	b=X1ZjT7L2p6PkFr0nFv03G6plnURIBNlB8tot53cw5LV1vfnMGSQ8cBCjy4x/VbON
	TrLSV4KMynEwqQH9SF0kw8VlvQHhA8/3dsgH4oij2ixtMHUjTMLM/SnJgw4SODPEHQn
	U1LuQJCIndHuVWtWR/DtODTv8UHDrJawWDtkPEdM=
Content-Type: multipart/mixed; boundary="===============2583855852482647749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 3357c4f51b1a9e676378c695dd9c7e9911c35ee6
 SUCCEEDED
Message-ID: <0101019e83d379c5-6b25eead-0fe9-4383-8633-8c99c1c8681a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237869

--===============2583855852482647749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *3357c4f51b1a9e676378c695dd9c7e9911c35ee6* has Succeeded.

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
From 13dd3bb13b7f9349a1c28ff3c64af876f2f2f011 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:53:03 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 .../0001-gn-fix-build-with-gcc-16-on-musl.patch      | 12 ++++--------
 meta/recipes-devtools/gn/gn_git.bb                   |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
index e933c17d8a..791b967d3f 100644
--- a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
+++ b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
@@ -1,4 +1,4 @@
-From 6d22f5c9e96811f1abcedd8fb1849fe72747b5c4 Mon Sep 17 00:00:00 2001
+From 7f6e5e9e91f59c1b177e649cc2386f2de5096326 Mon Sep 17 00:00:00 2001
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
index 6047ab5e2b..238f991b3c 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
            file://0001-gn-fix-build-with-gcc-16-on-musl.patch \
 "
-SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
+SRCREV = "3357c4f51b1a9e676378c695dd9c7e9911c35ee6"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============2583855852482647749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+eab8a9f92d-r0'])", added "gn (['= 0+git0+3357c4f51b-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+eab8a9f92d-r0'])", added "gn-dev (['= 0+git0+3357c4f51b-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b

--===============2583855852482647749==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSAxM2RkM2JiMTNiN2Y5MzQ5YTFjMjhmZjNjNjRhZjg3NmYyZjJmMDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzo1MzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiAuLi4vMDAwMS1nbi1maXgtYnVpbGQt
d2l0aC1nY2MtMTYtb24tbXVzbC5wYXRjaCAgICAgIHwgMTIgKysrKy0tLS0tLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9maWxlcy8wMDAxLWduLWZpeC1idWlsZC13aXRo
LWdjYy0xNi1vbi1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2ZpbGVzLzAw
MDEtZ24tZml4LWJ1aWxkLXdpdGgtZ2NjLTE2LW9uLW11c2wucGF0Y2gKaW5kZXggZTkzM2MxN2Q4
YS4uNzkxYjk2N2QzZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2ZpbGVz
LzAwMDEtZ24tZml4LWJ1aWxkLXdpdGgtZ2NjLTE2LW9uLW11c2wucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2duL2ZpbGVzLzAwMDEtZ24tZml4LWJ1aWxkLXdpdGgtZ2NjLTE2LW9u
LW11c2wucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZkMjJmNWM5ZTk2ODExZjFhYmNlZGQ4
ZmIxODQ5ZmU3Mjc0N2I1YzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdmNmU1ZTll
OTFmNTljMWIxNzdlNjQ5Y2MyMzg2ZjJkZTUwOTYzMjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBIZW1hbnRoIEt1bWFyIE0gRCA8SGVtYW50aC5LdW1hck1EQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBNb24sIDExIE1heSAyMDI2IDAyOjQzOjEwIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGduOiBmaXggYnVpbGQgd2l0aCBHQ0MgMTYgb24gbXVzbApAQCAtMTEsMjMgKzExLDE5IEBAIEZp
eGVzOgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ24tcmV2aWV3Lmdvb2ds
ZXNvdXJjZS5jb20vYy9nbi8rLzIyNzQwXQogCiBTaWduZWQtb2ZmLWJ5OiBIZW1hbnRoIEt1bWFy
IE0gRCA8SGVtYW50aC5LdW1hck1EQHdpbmRyaXZlci5jb20+Ci0KIC0tLQogIHNyYy9nbi9wb29s
LmggfCAxICsKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBh
L3NyYy9nbi9wb29sLmggYi9zcmMvZ24vcG9vbC5oCi1pbmRleCBlMDMxMTM2MDguLjI0N2NiNjQy
NSAxMDA2NDQKK2luZGV4IDdiZWI1ZGEwLi5jM2Q1ODgzZSAxMDA2NDQKIC0tLSBhL3NyYy9nbi9w
b29sLmgKICsrKyBiL3NyYy9nbi9wb29sLmgKLUBAIC02LDYgKzYsNyBAQAotICNkZWZpbmUgVE9P
TFNfR05fUE9PTF9IXworQEAgLTcsNiArNyw3IEBACiAgCisgI2luY2x1ZGUgPGNzdGRpbnQ+CiAg
I2luY2x1ZGUgPHN0cmluZz4KICsjaW5jbHVkZSA8Y3N0ZGludD4KICAKICAjaW5jbHVkZSAiZ24v
aXRlbS5oIgogIAotLS0gCi0yLjQ5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2duL2duX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIKaW5k
ZXggNjA0N2FiNWUyYi4uMjM4Zjk5MWIzYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2duL2duX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJi
CkBAIC05LDcgKzksNyBAQCBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiBTUkNfVVJJID0g
ImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4g
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nbi1maXgtYnVpbGQtd2l0aC1nY2MtMTYtb24tbXVz
bC5wYXRjaCBcCiAiCi1TUkNSRVYgPSAiZWFiOGE5ZjkyZGNhOWI4NTQ4YTg5ZDllNWViNmFlYjhh
YzZiYmE3NyIKK1NSQ1JFViA9ICIzMzU3YzRmNTFiMWE5ZTY3NjM3OGM2OTVkZDljN2U5OTExYzM1
ZWU2IgogUFYgPSAiMCtnaXQiCiAKIEJCX0dJVF9TSEFMTE9XID0gIiIKLS0gCjIuNDcuMQoK

--===============2583855852482647749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-574899c18d003fc8706f4eec66b8230feaf6c550"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:574899c18d003fc8706f4eec66b8230feaf6c550"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 119 Local 107 Mirrors 0 Missed 12 Current 303 (89% match, 97% complete)
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
NOTE: recipe gn-0+git-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gn-0+git-r0: task do_unpack: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Started
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
NOTE: recipe gn-0+git-r0: task do_package: Started
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot unihash changed to e3bcd6da52710ac1292cda7017aa994120618994f4676c9a4df570a180ea962d
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_package: Succeeded
NOTE: Running task 1065 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata)
NOTE: recipe gn-0+git-r0: task do_packagedata: Started
NOTE: recipe gn-0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1065 tasks of which 1052 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601075116.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601075116.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.189902
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-src went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+3357c4f51b-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dbg went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+3357c4f51b-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-staticdev went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+3357c4f51b-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dev went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+3357c4f51b-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-doc went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+3357c4f51b-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-locale went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+3357c4f51b-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+3357c4f51b-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.189902
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata) failed with exit code '1'

--===============2583855852482647749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 104594232 to 108430064 (+4%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+eab8a9f92d-r0'])", added "gn (['= 0+git0+3357c4f51b-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3214719 to 3240106 (+1%)
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+eab8a9f92d-r0'])", added "gn-dev (['= 0+git0+3357c4f51b-r0'])"
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+eab8a9f92d to 0+git0+3357c4f51b
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 4034744 to 4157624 (+3%)

--===============2583855852482647749==--

