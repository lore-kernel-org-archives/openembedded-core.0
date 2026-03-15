Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B3AF3026B
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28975.1773582120340123242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jpjmCCgb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mc/kEiu6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf1bb9546-29a9a035-b4fe-4e0f-86b9-14e2951b0c4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=POfAYOjlJ9SRdYhMbwMnsCVgJ331/b6lL41+JUYYGCQ=;
	b=jpjmCCgbAUIIZ9rPiLI1j8jh8YbRAyEYNfzSjKFUVccgkKbu4dBFm6242svQnChJ
	unT/um45sikHuF5A/goP7NAmGwt6vQyPLeKg6Y9X4sclLIMMFcFvn2DLLwY5jsf3q4X
	M7Pio7V8z3N2QV9xX7EyNzoKiY1reGMdpHEo6w1g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=POfAYOjlJ9SRdYhMbwMnsCVgJ331/b6lL41+JUYYGCQ=;
	b=mc/kEiu6WkoLNL6cT1Hz+S5QGU+d4c04OAyYOub+0ZArLD0FFNBpu1MTIp6GVW2S
	MAUwm7jcVBZQmX74xuEhaMJuRTA/IhHp9MynK9kNOEA1Jupip5OV5ZTIzVV5YOTGFOU
	qYetlqsyv8VPOpRRnRxlGW0rpzapXMdQGksTKNMU=
Content-Type: multipart/mixed; boundary="===============4866808969962070388=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.51.3 FAILED
Message-ID: <0101019cf1bb9546-29a9a035-b4fe-4e0f-86b9-14e2951b0c4f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233196

--===============4866808969962070388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.51.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.51.2-3.51.3.patch
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
From beea6d3f75014b1b81a4495f8a8fec2ae3fbb91f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 13:32:49 +0000
Subject: [PATCH] sqlite3: upgrade 3.51.2 -> 3.51.3

---
 .../sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch      | 4 ++--
 .../sqlite/{sqlite3_3.51.2.bb => sqlite3_3.51.3.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.51.2.bb => sqlite3_3.51.3.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 77181fe4df..635690ca67 100644
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -1,4 +1,4 @@
-From f98a739032dd863ba8dd315729ded7ad0c86473c Mon Sep 17 00:00:00 2001
+From 06ca40f1241fd07cf07487ef52f15e18912b2bc2 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Sun, 12 Oct 2025 23:32:46 +0200
 Subject: [PATCH] Add option to disable zlib
@@ -29,7 +29,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index 85fe414382..77190a7053 100644
+index 7c798b3..2ae5171 100644
 --- a/autosetup/sqlite-config.tcl
 +++ b/autosetup/sqlite-config.tcl
 @@ -287,6 +287,14 @@ proc sqlite-configure {buildMode configScript} {
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.51.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 6837293f6a..ea583e4a42 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -4,6 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb"
+SRC_URI[sha256sum] = "81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.47.1


--===============4866808969962070388==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.51.2-3.51.3.patch"

RnJvbSBiZWVhNmQzZjc1MDE0YjFiODFhNDQ5NWY4YThmZWMyYWUzZmJiOTFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTM6MzI6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNTEuMiAtPiAzLjUxLjMKCi0tLQogLi4uL3NxbGl0ZS9zcWxpdGUz
LzAwMDEtQWRkLW9wdGlvbi10by1kaXNhYmxlLXpsaWIucGF0Y2ggICAgICB8IDQgKystLQogLi4u
L3NxbGl0ZS97c3FsaXRlM18zLjUxLjIuYmIgPT4gc3FsaXRlM18zLjUxLjMuYmJ9ICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS97c3FsaXRlM18zLjUxLjIuYmIg
PT4gc3FsaXRlM18zLjUxLjMuYmJ9ICg3NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9uLXRvLWRpc2FibGUtemxpYi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzLzAwMDEtQWRkLW9wdGlvbi10
by1kaXNhYmxlLXpsaWIucGF0Y2gKaW5kZXggNzcxODFmZTRkZi4uNjM1NjkwY2E2NyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTMvMDAwMS1BZGQtb3B0aW9u
LXRvLWRpc2FibGUtemxpYi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUv
c3FsaXRlMy8wMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGliLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBmOThhNzM5MDMyZGQ4NjNiYThkZDMxNTcyOWRlZDdhZDBjODY0NzNjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNmNhNDBmMTI0MWZkMDdjZjA3NDg3ZWY1MmYxNWUx
ODkxMmIyYmMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgTWFya28gPHBl
dGVyLm1hcmtvQHNpZW1lbnMuY29tPgogRGF0ZTogU3VuLCAxMiBPY3QgMjAyNSAyMzozMjo0NiAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBBZGQgb3B0aW9uIHRvIGRpc2FibGUgemxpYgpAQCAtMjks
NyArMjksNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQog
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2F1dG9zZXR1cC9zcWxpdGUtY29uZmlnLnRjbCBiL2F1dG9zZXR1cC9zcWxpdGUtY29u
ZmlnLnRjbAotaW5kZXggODVmZTQxNDM4Mi4uNzcxOTBhNzA1MyAxMDA2NDQKK2luZGV4IDdjNzk4
YjMuLjJhZTUxNzEgMTAwNjQ0CiAtLS0gYS9hdXRvc2V0dXAvc3FsaXRlLWNvbmZpZy50Y2wKICsr
KyBiL2F1dG9zZXR1cC9zcWxpdGUtY29uZmlnLnRjbAogQEAgLTI4Nyw2ICsyODcsMTQgQEAgcHJv
YyBzcWxpdGUtY29uZmlndXJlIHtidWlsZE1vZGUgY29uZmlnU2NyaXB0fSB7CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUxLjIuYmIgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUxLjMuYmIKc2ltaWxhcml0eSBpbmRleCA3
NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41MS4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUxLjMu
YmIKaW5kZXggNjgzNzI5M2Y2YS4uZWE1ODNlNGE0MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41MS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTEuMy5iYgpAQCAtNCw2ICs0LDYgQEAgTElDRU5TRSA9ICJQ
RCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NxbGl0ZTMuaDtlbmRsaW5lPTExO21kNT03
ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIKIAogU1JDX1VSSSA9ICJodHRwOi8vd3d3
LnNxbGl0ZS5vcmcvMjAyNi9zcWxpdGUtYXV0b2NvbmYtJHtTUUxJVEVfUFZ9LnRhci5neiIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJmYmQ4OWY4NjZiMTQwM2JiNjZhMTQzMDY1NDQwMDg5ZGQ3NjEw
MGYyMjM4MzE0ZDkyMjc0YTA4MmQ0ZjJiN2JiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxZjVi
ZTM5NzA0OWIwY2FlMWIxNjdmMjIyNWFmNzY0NmZjMGY4MmU0YTliM2M0OGM5ZWEzYTUzM2UyMWQ3
N2EiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1vcHRpb24tdG8tZGlzYWJsZS16bGli
LnBhdGNoIgotLSAKMi40Ny4xCgo=

--===============4866808969962070388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c1d773bad8446000ec6a4ec6148f1f4967f8c609"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c1d773bad8446000ec6a4ec6148f1f4967f8c609"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 133 Local 64 Mirrors 0 Missed 69 Current 223 (48% match, 80% complete)
done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 31 stale sstate objects for arch x86_64...done.
Removing 7 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 310 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 347 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_create_spdx_setscene)
NOTE: Running task 168 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa)
NOTE: Running noexec task 525 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_fetch)
NOTE: Running task 745 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa)
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_recipe_qa: Started
NOTE: Running task 818 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-native-2.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 820 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_fetch)
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 821 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_fetch)
NOTE: recipe expat-native-2.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 834 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_fetch)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_fetch: Succeeded
NOTE: Running task 835 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_unpack)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_fetch: Succeeded
NOTE: Running task 837 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_unpack)
NOTE: Running task 838 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_unpack: Succeeded
NOTE: Running task 840 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_patch)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_patch)
NOTE: Running task 842 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_patch: Succeeded
NOTE: Running task 844 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 845 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_lic)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_patch: Succeeded
NOTE: Running task 846 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_lic: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_unpack)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_lic: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 848 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_configure)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_configure: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_unpack: Succeeded
NOTE: Running task 849 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_patch)
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_patch: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_configure: Succeeded
NOTE: Running task 851 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_compile)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_compile: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_compile: Succeeded
NOTE: Running task 852 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_install)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_install: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_install: Succeeded
NOTE: Running task 853 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 854 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 855 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 856 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_spdx)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_create_spdx: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 857 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_configure)
NOTE: recipe python3-native-3.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_configure: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_configure: Succeeded
NOTE: Running task 858 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_compile)
NOTE: recipe sqlite3-native-3_3.51.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 859 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_collect_spdx_deps)
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_compile: Started
NOTE: recipe python3-native-3.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 860 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_configure)
NOTE: recipe python3-native-3.14.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-native-3.14.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-native-3.14.3-r0: task do_configure: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_compile: Succeeded
NOTE: Running task 861 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_install)
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_install: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_install: Succeeded
NOTE: Running task 862 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot)
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_populate_sysroot: Started
NOTE: recipe pseudo-native-1.9.3+git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 863 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 864 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 865 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 866 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: Running task 867 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot unihash changed to a38b9be2283dade30eae45467d04c7e74ea5501b494d3bc53bdfb67a52377ace
NOTE: Setscene tasks completed
NOTE: Running task 874 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 875 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_configure)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 876 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_compile)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_compile: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 877 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_install)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_install: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 878 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_multilib_install)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 879 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 880 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot unihash changed to 1dba141319a5a66347247d8644d762a97aaa8e2d6eb6bb9a41ab4737d1595f25
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx became valid
NOTE: Running setscene task 354 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-native-3.14.3-r0: task do_configure: Succeeded
NOTE: Running task 881 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_compile)
NOTE: recipe python3-native-3.14.3-r0: task do_compile: Started
NOTE: recipe python3-native-3.14.3-r0: task do_compile: Succeeded
NOTE: Running task 882 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_install)
NOTE: recipe python3-native-3.14.3-r0: task do_install: Started
NOTE: recipe python3-native-3.14.3-r0: task do_install: Succeeded
NOTE: Running task 883 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot)
NOTE: recipe python3-native-3.14.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-native-3.14.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 884 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 885 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 886 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 887 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 888 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-native-3.14.3-r0: task do_create_spdx: Started
NOTE: recipe python3-native-3.14.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_collect_spdx_deps)
NOTE: Running task 890 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_collect_spdx_deps)
NOTE: Running task 891 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_configure)
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-native-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 892 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: Running task 893 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: Running task 894 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_configure: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_configure: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_configure: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 895 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_compile)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_compile: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_compile: Succeeded
NOTE: Running task 896 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_install)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_install: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_install: Succeeded
NOTE: Running task 897 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 898 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 899 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 900 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 901 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_configure)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_configure: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 902 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_compile)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_compile: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 903 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_install)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_install: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 904 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 905 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 906 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 907 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-native-26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 908 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 909 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_configure)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-packaging-native-26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 910 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_configure)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_configure: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 911 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_compile)
NOTE: recipe python3-packaging-native-26.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-native-26.0-r0: task do_configure: Succeeded
NOTE: Running task 912 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_compile)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-native-26.0-r0: task do_compile: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 913 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_install)
NOTE: recipe python3-packaging-native-26.0-r0: task do_compile: Succeeded
NOTE: Running task 914 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_install)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_install: Started
NOTE: recipe python3-packaging-native-26.0-r0: task do_install: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 915 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-native-26.0-r0: task do_install: Succeeded
NOTE: Running task 916 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-packaging-native-26.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 917 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 918 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_spdx)
NOTE: recipe python3-packaging-native-26.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 919 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-build-native-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-build-native-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 920 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_configure)
NOTE: recipe python3-build-native-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-build-native-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 921 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_compile)
NOTE: recipe python3-build-native-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 922 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_install)
NOTE: recipe python3-build-native-1.4.0-r0: task do_install: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 923 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 924 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 925 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 926 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_create_spdx)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 927 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_collect_spdx_deps)
NOTE: Running task 928 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 929 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 930 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_configure)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Succeeded
NOTE: Running task 931 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_configure: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_configure: Succeeded
NOTE: Running task 932 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_compile)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_compile: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Succeeded
NOTE: Running task 933 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_install: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_compile: Succeeded
NOTE: Running task 934 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_install)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_install: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_install: Succeeded
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_install: Succeeded
NOTE: Running task 935 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_populate_sysroot)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 936 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 937 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_create_spdx)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 938 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 939 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_configure)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_configure: Succeeded
NOTE: Running task 940 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_compile)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_compile: Succeeded
NOTE: Running task 941 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_install)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_install: Succeeded
NOTE: Running task 942 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 943 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 944 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 945 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe meson-native-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-native-82.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 946 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_configure)
NOTE: Running task 947 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_collect_spdx_deps)
NOTE: Running task 948 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure)
NOTE: recipe meson-native-1.10.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-native-1.10.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_configure: Started
NOTE: recipe meson-native-1.10.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_configure: Succeeded
NOTE: Running task 949 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_compile)
NOTE: Running task 950 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile)
NOTE: recipe meson-native-1.10.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_compile: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_configure: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 951 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: Running task 952 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_compile)
NOTE: recipe libidn2-native-2.3.8-r0: task do_compile: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 287, in __setitem__
|     current_value = getattr(target_obj, option_name)
| AttributeError: 'MinimalDistribution' object has no attribute 'entry_points'
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 34, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 114, in setup
|     _install_setup_requires(attrs)
|     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 85, in _install_setup_requires
|     dist.parse_config_files(ignore_option_errors=True)
|     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 758, in parse_config_files
|     setupcfg.parse_configuration(
|     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
|         self, self.command_options, ignore_option_errors=ignore_option_errors
|         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|     )
|     ^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 177, in parse_configuration
|     options.parse()
|     ~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 504, in parse
|     section_parser_method(section_options)
|     ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 719, in parse_section_entry_points
|     self['entry_points'] = parsed
|     ~~~~^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 289, in __setitem__
|     raise KeyError(option_name) from e
| KeyError: 'entry_points'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.2024282:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/sources/meson-1.10.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.2024282, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.2024282, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.2024282, line 158
NOTE: recipe meson-native-1.10.1-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| usage: _in_process.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
|    or: _in_process.py --help [cmd1 cmd2 ...]
|    or: _in_process.py --help-commands
|    or: _in_process.py cmd --help
| 
| error: invalid command 'egg_info'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.2024315:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/sources/markupsafe-3.0.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.2024315, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.2024315, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.2024315, line 158
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_compile: Failed
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-native-4.21.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 952 tasks of which 835 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315132840.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315132840.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/log.do_compile.2024282
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/log.do_compile.2024315
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: meson-native-1.10.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.2024282' failed with exit code 1
ERROR: python3-markupsafe-native-3.0.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.2024315' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/log.do_compile.2024282
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/log.do_compile.2024315
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile) failed with exit code '1'

--===============4866808969962070388==--

