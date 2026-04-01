Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C981076386
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14741.1775054156498712645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1uQxzig7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uqDM6jwD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d4978fb6c-b32c470f-a9ad-4190-956c-a99c006bae64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+gATEXnvE2UV5m+8dbKnVGAd1BXz5pS/abEYOgGBRjM=;
	b=1uQxzig7+TI/3FM1JxKSxUmOpFrSuyhGp76PD8loLB2fJsMMhjF8GLuKwMC3t4s3
	XhlZVJN6FunzmEFuAqsQ1OUtH+z8PiOl1rnBNLeV7PKo3t10F2bHPpQKS/gm31GQMFU
	Mcj3NdicWvqvnBSbvdf3MFxkZOjx2ke0Vs5zC6vk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+gATEXnvE2UV5m+8dbKnVGAd1BXz5pS/abEYOgGBRjM=;
	b=uqDM6jwDI4ACvNtIvalvnw7xASN1Si+/rpwOun5tMhJnWGU0FORC+ogHelq1bZKy
	4FXbtOR+I/DaLE9M5qyElOsEPviXuU4U04Zkr/HJFTLPuOnts46oQjXDisyQBB/mU9y
	ap+sIF1s8Z0TNPZSKUG3u4x6Nk9Oj3PLPeciePfw=
Content-Type: multipart/mixed; boundary="===============6425404298014059388=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] createrepo-c: upgrading to 1.2.3 SUCCEEDED
Message-ID: <0101019d4978fb6c-b32c470f-a9ad-4190-956c-a99c006bae64-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234371

--===============6425404298014059388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *createrepo-c* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.2.2-1.2.3.patch
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
From 7f520431e096e45f63ed26b964dfb8c1668e7c9f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 08:51:11 +0000
Subject: [PATCH] createrepo-c: upgrade 1.2.2 -> 1.2.3

---
 .../0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch  | 2 +-
 .../{createrepo-c_1.2.2.bb => createrepo-c_1.2.3.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.2.bb => createrepo-c_1.2.3.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index ca3f0782a8..b5d4ab3538 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 20aec3f83a7ab6ebb89f40ee8c5df1af65eba32b Mon Sep 17 00:00:00 2001
+From 5b8f1ef6b0e36ba5246072f18b373f066baeaa17 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
index 1dd5165260..a5c1a9dd44 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "46b86c9b14bd724cb6bec0bfa81a7b179847f3db"
+SRCREV = "5ecca5e6c85cca1399378af5756344eb1c7448a1"
 
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
-- 
2.47.1


--===============6425404298014059388==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.2.2-1.2.3.patch"

RnJvbSA3ZjUyMDQzMWUwOTZlNDVmNjNlZDI2Yjk2NGRmYjhjMTY2OGU3YzlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwODo1MToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
ZWF0ZXJlcG8tYzogdXBncmFkZSAxLjIuMiAtPiAxLjIuMwoKLS0tCiAuLi4vMDAwMS1Eby1ub3Qt
c2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCAgfCAyICstCiAu
Li4ve2NyZWF0ZXJlcG8tY18xLjIuMi5iYiA9PiBjcmVhdGVyZXBvLWNfMS4yLjMuYmJ9ICAgICAg
ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL3tjcmVhdGVy
ZXBvLWNfMS4yLjIuYmIgPT4gY3JlYXRlcmVwby1jXzEuMi4zLmJifSAoOTYlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEt
RG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLURvLW5v
dC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCmluZGV4IGNh
M2YwNzgyYTguLmI1ZDRhYjM1MzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
cmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9E
SVItYnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ny
ZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJ
Ui1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjBhZWMzZjgz
YTdhYjZlYmI4OWY0MGVlOGM1ZGYxYWY2NWViYTMyYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNWI4ZjFlZjZiMGUzNmJhNTI0NjA3MmYxOGIzNzNmMDY2YmFlYWExNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAxNiAxODozMTowMiArMDIwMAogU3ViamVjdDog
W1BBVENIXSBEbyBub3Qgc2V0IFBZVEhPTl9JTlNUQUxMX0RJUiBieSBydW5uaW5nIHB5dGhvbgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBv
LWNfMS4yLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJl
cG8tY18xLjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjIuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4yLjMuYmIK
aW5kZXggMWRkNTE2NTI2MC4uYTVjMWE5ZGQ0NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4yLjIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4yLjMuYmIKQEAgLTgsNyAr
OCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVu
dC9jcmVhdGVyZXBvX2M7YnJhbmNoPW1hc3RlcjtwCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURv
LW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIFwKICAg
ICAgICAgICAgIgogCi1TUkNSRVYgPSAiNDZiODZjOWIxNGJkNzI0Y2I2YmVjMGJmYTgxYTdiMTc5
ODQ3ZjNkYiIKK1NSQ1JFViA9ICI1ZWNjYTVlNmM4NWNjYTEzOTkzNzhhZjU3NTYzNDRlYjFjNzQ0
OGExIgogCiBERVBFTkRTID0gImV4cGF0IGN1cmwgZ2xpYi0yLjAgbGlieG1sMiBvcGVuc3NsIGJ6
aXAyIHpsaWIgZmlsZSBzcWxpdGUzIHh6IHJwbSIKIERFUEVORFM6YXBwZW5kOmNsYXNzLW5hdGl2
ZSA9ICIgZmlsZS1yZXBsYWNlbWVudC1uYXRpdmUiCi0tIAoyLjQ3LjEKCg==

--===============6425404298014059388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.2.2", added "/usr/lib/libcreaterepo_c.so.1.2.3"
Changes to packages/x86-64-v3-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.2 to libcreaterepo_c.so.1.2.3
  /usr/lib/libcreaterepo_c.so.1.2.2 moved to /usr/lib/libcreaterepo_c.so.1.2.3

--===============6425404298014059388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-4793beb1b10bd10d7dddd2c9fa83ad71a48bed5e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:4793beb1b10bd10d7dddd2c9fa83ad71a48bed5e"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 613 Local 518 Mirrors 0 Missed 95 Current 265 (84% match, 89% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 266 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 272 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 283 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 309 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 315 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 335 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 362 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-native-5.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 409 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-native-5.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 428 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 429 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_recipe_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 438 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 439 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 443 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 450 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 453 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe openssl-native-3.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 454 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 455 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 460 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 461 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 464 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 470 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 472 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 473 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 475 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 476 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-native-5.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-native-3.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 479 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_spdx_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 480 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe file-native-5.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 485 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 486 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 491 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 493 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 494 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 500 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 504 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 505 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 508 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 509 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 510 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 512 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 514 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 515 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 519 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 524 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 525 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 526 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 528 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 529 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 537 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 539 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 540 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 542 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 558 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 561 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 566 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 573 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 575 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 579 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe meson-native-1.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 582 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 583 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 592 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 618 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 624 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 630 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_package_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.10.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe meson-native-1.10.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_setscene)
NOTE: Running setscene task 646 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_create_spdx_setscene)
NOTE: Running setscene task 652 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 654 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-native-2.72-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 348 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_fetch)
NOTE: Running task 362 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_recipe_qa)
NOTE: Running task 371 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_write_config)
NOTE: Running task 379 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 380 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch)
NOTE: Running task 383 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 384 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa)
NOTE: Running task 385 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa)
NOTE: Running task 387 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 398 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: Running task 402 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: Running task 408 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_recipe_qa)
NOTE: Running task 419 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe autoconf-native-2.72-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 666 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lua-5.5.0-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 438 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_unpack)
NOTE: Running task 464 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe autoconf-native-2.72-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_package_setscene: Started
NOTE: Running task 495 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe autoconf-native-2.72-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Started
NOTE: Running task 496 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 563 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: Running task 564 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: recipe createrepo-c-1.2.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 579 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_create_recipe_spdx)
NOTE: Running task 581 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_recipe_spdx)
NOTE: Running task 585 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_create_recipe_spdx)
NOTE: Running task 586 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_recipe_spdx)
NOTE: Running task 587 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_fetch)
NOTE: recipe rpm-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_fetch: Started
NOTE: Running task 588 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe libxml2-2.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 590 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.59-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 591 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_recipe_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe file-5.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: Running task 592 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_recipe_spdx)
NOTE: recipe libarchive-3.8.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_fetch: Started
NOTE: Running task 596 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_recipe_spdx)
NOTE: recipe rpm-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 599 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_recipe_spdx)
NOTE: recipe json-c-0.18-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgpg-error-1.59-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe file-5.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 600 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_create_recipe_spdx)
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Started
NOTE: Running task 601 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_create_recipe_spdx)
NOTE: Running task 602 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: Running task 603 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx)
NOTE: Running task 605 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx)
NOTE: recipe createrepo-c-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 606 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_unpack)
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-c-0.18-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 607 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_create_recipe_spdx)
NOTE: recipe createrepo-c-1.2.3-r0: task do_unpack: Started
NOTE: recipe lua-5.5.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 608 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 609 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnutls-3.8.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 610 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_recipe_spdx)
NOTE: Running setscene task 673 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 611 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe rpm-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 674 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 612 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_create_recipe_spdx)
NOTE: recipe createrepo-c-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_create_recipe_spdx: Started
NOTE: recipe elfutils-0.194-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 615 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_create_recipe_spdx)
NOTE: recipe rpm-1_4.20.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 616 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_create_recipe_spdx)
NOTE: recipe createrepo-c-1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe elfutils-0.194-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 675 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: recipe createrepo-c-1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 690 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_package_setscene)
NOTE: Running setscene task 695 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package_setscene)
NOTE: Running setscene task 701 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_package_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 620 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_fetch: Started
NOTE: recipe elfutils-0.194-r0: task do_fetch: Succeeded
NOTE: Running task 625 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 705 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 707 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.194-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 708 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 717 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 718 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 722 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 723 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_package_setscene)
NOTE: Running task 627 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 629 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 631 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe file-5.47-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_package_setscene: Started
NOTE: Running task 633 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_package_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: Running task 635 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 636 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 637 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.12-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: Running task 638 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: Running task 639 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 640 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe file-5.47-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 727 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 728 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 730 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe file-5.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 737 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_package_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 740 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_package_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 742 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe file-5.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 647 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_fetch)
NOTE: Running setscene task 750 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 756 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 762 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.47-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 764 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 652 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_fetch)
NOTE: Running setscene task 766 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 769 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_package_setscene)
NOTE: Running task 659 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_fetch: Succeeded
NOTE: Running task 663 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_unpack)
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_unpack: Started
NOTE: Running task 665 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.59-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 774 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 668 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 673 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe libgcrypt-1.12.1-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 674 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: recipe file-5.47-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 775 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/openssl/3.5.5/temp/log.do_packagedata_setscene.1030007
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 788 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_package_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 789 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 679 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.19.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 791 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 793 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 800 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 801 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 803 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package_setscene)
NOTE: Running task 685 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_fetch)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_package_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 806 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.59-r0: task do_fetch: Succeeded
NOTE: Running task 688 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_unpack)
NOTE: recipe nettle-3.10.2-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 690 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_fetch)
NOTE: recipe meson-native-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.12-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.12-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 808 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 809 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 810 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 812 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running task 700 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: Running setscene task 813 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 705 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe nettle-3.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 814 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 815 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 707 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 817 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 820 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 712 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 824 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 714 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 723 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 725 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 729 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 830 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 831 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 832 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 739 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 743 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 835 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe automake-native-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe automake-native-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 878 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-native-2.72-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-native-2.72-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_recipe_qa_setscene)
NOTE: recipe autoconf-native-2.72-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-native-2.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1269 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1270 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_patch)
NOTE: Running task 1273 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: Running task 1274 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_patch)
NOTE: Running task 1275 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_patch)
NOTE: Running task 1321 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1331 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: Running task 1354 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_unpack)
NOTE: Running task 1369 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: Running task 1382 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_patch)
NOTE: Running task 1393 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_patch)
NOTE: Running task 1397 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: Running task 1398 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_unpack)
NOTE: Running task 1408 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_unpack)
NOTE: Running task 1503 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: Running task 1505 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.47-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe nettle-3.10.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.59-r0: task do_patch: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe curl-8.19.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.6-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.12-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe file-5.47-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1516 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: Running task 1522 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe libarchive-3.8.6-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: Running task 1529 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1530 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: Running task 1542 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.59-r0: task do_patch: Succeeded
NOTE: recipe file-5.47-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1559 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_patch)
NOTE: Running task 1578 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: Running task 1598 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: recipe nettle-3.10.2-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: Running task 1600 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: Running task 1601 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.194-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1616 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe lua-5.5.0-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: Running task 1622 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_unpack: Started
NOTE: Running task 1639 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1640 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1641 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1662 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1663 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_patch)
NOTE: Running task 1665 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1685 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe libgcrypt-1.12.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1726 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_patch)
NOTE: recipe curl-8.19.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata: Started
NOTE: recipe lua-5.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch unihash changed to d8c9b1de2cc9629a79c715707cc15560ed717caaa86a835532d6045ee48b6536
NOTE: recipe rpm-1_4.20.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_patch: Started
NOTE: recipe curl-8.19.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1727 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_configure)
NOTE: Running task 1728 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_patch)
NOTE: Running task 1737 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: Running task 1790 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxml2-2.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1809 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx)
NOTE: Running task 1818 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch unihash changed to fda6fd7fc71dcd19b52729fb5b9917f783601fd945e0279b9066dad9aaf33efe
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch unihash changed to d726715f8cc609892fb385923eccdbe651c0d3f45ffc29e69333f531f839d088
NOTE: recipe libpcre2-10.47-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1819 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1820 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure)
NOTE: Running task 1826 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1827 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_generate_toolchain_file)
NOTE: Running task 1833 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 1834 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: Running task 1835 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_create_spdx: Started
NOTE: Running task 1872 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx)
NOTE: recipe libxml2-2.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1873 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1874 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.194-r0: task do_patch: Succeeded
NOTE: Running task 1877 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_create_spdx)
NOTE: recipe libxml2-2.15.2-r0: task do_patch: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1882 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.16-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_configure: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_patch: Succeeded
NOTE: Running task 1883 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure_ptest_base)
NOTE: Running task 1884 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1887 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.59-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1922 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch unihash changed to 732724e51121d45b7847f28ba61659bc914c70ac67894fa8818fa82c3af7be7b
NOTE: recipe createrepo-c-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.47-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe lua-5.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1944 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1945 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1946 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile)
NOTE: Running task 1947 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1994 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx)
NOTE: Running task 1995 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx)
NOTE: Running task 1998 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx)
NOTE: recipe libxml2-2.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe file-5.47-r0: task do_create_spdx: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx: Started
NOTE: Running task 1999 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Started
NOTE: Running task 2000 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2001 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2002 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2003 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: Running task 2004 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_configure)
NOTE: recipe libgpg-error-1.59-r0: task do_create_spdx: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2005 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_create_spdx)
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxml2-2.15.2-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2006 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2007 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2017 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_rpm)
NOTE: Running task 2021 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch unihash changed to 2d0cb9546a7a064cb561bb968521cac8e0600b8b897e218fa04d35b7fe6e20c3
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.18-r0: task do_create_spdx: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_create_spdx: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2026 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.12-r0: task do_create_spdx: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2027 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe gnutls-3.8.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 2034 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_rpm unihash changed to 33ae4703797824439c8d0e16e0904a4ffdf0a3a43abb7a48892561025f4eaf60
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2035 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_create_spdx)
NOTE: recipe elfutils-0.194-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.194-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2036 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2037 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe libpcre2-10.47-r0: task do_configure: Succeeded
NOTE: Running task 2038 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2039 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_compile)
NOTE: recipe libxml2-2.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2040 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_configure_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_compile: Started
NOTE: recipe libxml2-2.15.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.15.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2041 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_compile)
NOTE: recipe libxml2-2.15.2-r0: task do_compile: Started
NOTE: recipe lua-5.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile_ptest_base)
NOTE: recipe lua-5.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2043 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_install)
NOTE: recipe lua-5.5.0-r0: task do_install: Started
NOTE: recipe lua-5.5.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_install_ptest_base)
NOTE: recipe lua-5.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2045 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_populate_sysroot)
NOTE: Running task 2046 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_package)
NOTE: recipe lua-5.5.0-r0: task do_package: Started
NOTE: recipe lua-5.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2051 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe lua-5.5.0-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_packagedata)
NOTE: recipe lua-5.5.0-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2053 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2054 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_create_spdx)
NOTE: recipe lua-5.5.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2055 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: recipe rpm-1_4.20.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2056 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2057 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2058 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe rpm-1_4.20.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2059 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-1_4.20.1-r0: task do_install: Started
NOTE: recipe libxml2-2.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2060 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.15.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.15.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2061 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_install)
NOTE: recipe rpm-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 2062 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package)
NOTE: Running task 2063 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.15.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.15.2-r0: task do_install: Succeeded
NOTE: Running task 2064 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_install_ptest_base)
NOTE: recipe rpm-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_install_ptest_base: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package: Succeeded
NOTE: Running task 2065 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2066 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_create_spdx)
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2067 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_package)
NOTE: Running task 2068 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.15.2-r0: task do_package: Started
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_compile: Succeeded
NOTE: Running task 2069 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_compile_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2070 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_install)
NOTE: recipe libpcre2-10.47-r0: task do_install: Started
NOTE: recipe libpcre2-10.47-r0: task do_install: Succeeded
NOTE: Running task 2071 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre2-10.47-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2072 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot)
NOTE: Running task 2073 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_package)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.47-r0: task do_package: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2074 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2075 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.47-r0: task do_package: Succeeded
NOTE: Running task 2076 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata)
NOTE: recipe libxml2-2.15.2-r0: task do_package: Succeeded
NOTE: Running task 2077 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata: Succeeded
NOTE: Running task 2078 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx)
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2079 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx)
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure: Succeeded
NOTE: Running task 2080 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2081 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile: Succeeded
NOTE: Running task 2082 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2083 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install: Succeeded
NOTE: Running task 2084 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2085 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2086 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2087 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2088 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2089 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2091 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2092 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2093 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Running task 2095 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2096 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure: Succeeded
NOTE: Running task 2097 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2098 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2100 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install: Succeeded
NOTE: Running task 2101 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2102 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package)
NOTE: Running task 2103 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2104 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2105 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_configure)
NOTE: recipe createrepo-c-1.2.3-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2106 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_compile)
NOTE: recipe createrepo-c-1.2.3-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2107 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_install)
NOTE: recipe createrepo-c-1.2.3-r0: task do_install: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2108 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2110 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_package)
NOTE: Running task 2111 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.2.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_packagedata)
NOTE: recipe createrepo-c-1.2.3-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2113 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_create_spdx)
NOTE: Running task 2114 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_package_write_ipk)
NOTE: Running task 2115 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_package_write_deb)
NOTE: Running task 2116 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_package_write_rpm)
NOTE: Running task 2117 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_package_qa)
NOTE: recipe createrepo-c-1.2.3-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_write_ipk: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_write_deb: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2118 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_create_package_spdx)
NOTE: recipe createrepo-c-1.2.3-r0: task do_create_package_spdx: Started
NOTE: recipe createrepo-c-1.2.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-1.2.3-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2119 of 2119 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2119 tasks of which 1876 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-fips went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.6.1-r0 to 0:3.5.5-r0) [version-going-backwards]
ERROR: openssl-3.5.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6425404298014059388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGSIZE changed from 5318 to 5545 (+4%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1658560 to 1593112 (-4%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.2.2", added "/usr/lib/.debug/libcreaterepo_c.so.1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 146862 to 147161 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 16346 to 16360 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1287715 to 1289053 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: FILELIST: directory renamed /usr/src/debug/createrepo-c/1.2.2/src/python -> /usr/src/debug/createrepo-c/1.2.3/src/python, directory renamed /usr/src/debug/createrepo-c/1.2.2/src -> /usr/src/debug/createrepo-c/1.2.3/src
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 563391 to 563783 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.2.2", added "/usr/lib/libcreaterepo_c.so.1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/x86-64-v3-poky-linux/createrepo-c: PV changed from "1.2.2" to "1.2.3"
packages/x86-64-v3-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https;tag=1.2.2 file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https;tag=1.2.3 file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch"
Changes to packages/x86-64-v3-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.2 to libcreaterepo_c.so.1.2.3
  /usr/lib/libcreaterepo_c.so.1.2.2 moved to /usr/lib/libcreaterepo_c.so.1.2.3

--===============6425404298014059388==--

