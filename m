Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16567.1792647344679356144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WhPtoVA+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uaPcZqny;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1621bb5ec-5ebf74ae-c348-409c-8b7e-2d8d0c0cde17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gHMSQA15HpQrb5zoCsHp5ndvK3tIy2WmE+5BLGr5Lag=;
	b=WhPtoVA+5FNNa4JgBQUdzHnL7UpsLSNSwC+229n1QU/eyChTLrQs1DOkkfknYFLi
	a7Sx1Qs7U/V4+sejTCJ7lsn6ubKCKKpoQmD4+uWctk6EaErMAcDSWEXXCDonuX2vPVk
	f1Vf3jtv2lm8Q0guv1BULw1l54wRPEmZphY1aL2g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gHMSQA15HpQrb5zoCsHp5ndvK3tIy2WmE+5BLGr5Lag=;
	b=uaPcZqnyoGFi/PIHz/FL4JR5g6G8Mxj+Buv/6HBxMMh34lqYJw/fPc3CcY74FoU6
	/qw400sJpCBMgi2kkXy2WFvx1+GbP+VckyPtrW1+xxLgBxA7T6kauSnMfS14lf6iCVN
	zABuUI7tvqH6k01nOk+zK5vyvXmhSEfPW3OVHJxA=
Content-Type: multipart/mixed; boundary="===============7331164198452677928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtracefs: upgrading to 1.8.4 SUCCEEDED
Message-ID: <010101a1621bb5ec-5ebf74ae-c348-409c-8b7e-2d8d0c0cde17-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248419

--===============7331164198452677928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtracefs* to *1.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtracefs-upgrade-1.8.3-1.8.4.patch
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
From 84a629178bd70010ca757cec9db3a7baef906122 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 22 Oct 2026 05:35:36 +0000
Subject: [PATCH] libtracefs: upgrade 1.8.3 -> 1.8.4

libtracefs: version 1.8.4
libtracefs: Support EXTRA_LIBS for utest
libtracefs: Use LIBTRACEFS_STATIC for utest
libtracefs utest: Only use online CPUs during tests
libtracefs: Fix memory leak in tracefs_tracing_dir_is_mounted()
libtracefs utest: Update kprobe test to use filename_mkdirat
libtracefs .gitignore: Only ignore patches/ at top level
libtracefs utest: Add tests for clearing kprobes with
tracefs_dynevent_destroy_all()
libtracefs: Fix tracefs_dynevent_destroy_all()
---
 .../libtracefs/{libtracefs_1.8.3.bb => libtracefs_1.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtracefs/{libtracefs_1.8.3.bb => libtracefs_1.8.4.bb} (93%)

diff --git a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb
similarity index 93%
rename from meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
rename to meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb
index e499e975fc..740f5c8bbf 100644
--- a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
+++ b/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
+SRCREV = "85030efcf90a775f07453d7eab835681c0ad7187"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https;tag=${BPN}-${PV}"
 
 PACKAGECONFIG ??= ""
-- 
2.47.1


--===============7331164198452677928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtracefs: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs: SRC_URI changed from "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=libtracefs;protocol=https;tag=libtracefs-1.8.3" to "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=libtracefs;protocol=https;tag=libtracefs-1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-bash-completion: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-bash-completion: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-dbg: FILELIST: removed "/usr/lib/.debug/libtracefs.so.1.8.3", added "/usr/lib/.debug/libtracefs.so.1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-dbg: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-dbg: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-dbg: PKGSIZE changed from 499368 to 499416 (+0%)
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-dev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-dev: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-doc: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-doc: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-locale: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-locale: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-src: FILELIST: directory renamed /usr/src/debug/libtracefs/1.8.3/src/libtracefs.so.1.8.3.p -> /usr/src/debug/libtracefs/1.8.4/src/libtracefs.so.1.8.4.p, directory renamed /usr/src/debug/libtracefs/1.8.3/include -> /usr/src/debug/libtracefs/1.8.4/include, directory renamed /usr/src/debug/libtracefs/1.8.3/src -> /usr/src/debug/libtracefs/1.8.4/src
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-src: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-src: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-src: PKGSIZE changed from 482255 to 482603 (+0%)
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-staticdev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-staticdev: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs-staticdev: PKGSIZE changed from 895370 to 895594 (+0%)
packages/x86-64-v3-poky-linux/libtracefs/libtracefs: FILELIST: removed "/usr/lib/libtracefs.so.1.8.3", added "/usr/lib/libtracefs.so.1.8.4"
packages/x86-64-v3-poky-linux/libtracefs/libtracefs: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libtracefs/libtracefs: PV changed from "1.8.3" to "1.8.4"
Changes to packages/x86-64-v3-poky-linux/libtracefs (sysroot):
  /usr/lib/libtracefs.so.1 changed symlink target from libtracefs.so.1.8.3 to libtracefs.so.1.8.4
  /usr/lib/libtracefs.so.1.8.3 moved to /usr/lib/libtracefs.so.1.8.4

--===============7331164198452677928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtracefs-upgrade-1.8.3-1.8.4.patch"

RnJvbSA4NGE2MjkxNzhiZDcwMDEwY2E3NTdjZWM5ZGIzYTdiYWVmOTA2MTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjIgT2N0IDIwMjYgMDU6MzU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWZzOiB1cGdyYWRlIDEuOC4zIC0+IDEuOC40CgpsaWJ0cmFjZWZzOiB2ZXJzaW9uIDEu
OC40CmxpYnRyYWNlZnM6IFN1cHBvcnQgRVhUUkFfTElCUyBmb3IgdXRlc3QKbGlidHJhY2Vmczog
VXNlIExJQlRSQUNFRlNfU1RBVElDIGZvciB1dGVzdApsaWJ0cmFjZWZzIHV0ZXN0OiBPbmx5IHVz
ZSBvbmxpbmUgQ1BVcyBkdXJpbmcgdGVzdHMKbGlidHJhY2VmczogRml4IG1lbW9yeSBsZWFrIGlu
IHRyYWNlZnNfdHJhY2luZ19kaXJfaXNfbW91bnRlZCgpCmxpYnRyYWNlZnMgdXRlc3Q6IFVwZGF0
ZSBrcHJvYmUgdGVzdCB0byB1c2UgZmlsZW5hbWVfbWtkaXJhdApsaWJ0cmFjZWZzIC5naXRpZ25v
cmU6IE9ubHkgaWdub3JlIHBhdGNoZXMvIGF0IHRvcCBsZXZlbApsaWJ0cmFjZWZzIHV0ZXN0OiBB
ZGQgdGVzdHMgZm9yIGNsZWFyaW5nIGtwcm9iZXMgd2l0aAp0cmFjZWZzX2R5bmV2ZW50X2Rlc3Ry
b3lfYWxsKCkKbGlidHJhY2VmczogRml4IHRyYWNlZnNfZHluZXZlbnRfZGVzdHJveV9hbGwoKQot
LS0KIC4uLi9saWJ0cmFjZWZzL3tsaWJ0cmFjZWZzXzEuOC4zLmJiID0+IGxpYnRyYWNlZnNfMS44
LjQuYmJ9ICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2Vmcy97bGlidHJhY2Vm
c18xLjguMy5iYiA9PiBsaWJ0cmFjZWZzXzEuOC40LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2Vmcy9saWJ0cmFjZWZzXzEuOC4zLmJiIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWZzL2xpYnRyYWNlZnNfMS44LjQuYmIKc2ltaWxhcml0eSBp
bmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWZzL2xpYnRy
YWNlZnNfMS44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2Vmcy9s
aWJ0cmFjZWZzXzEuOC40LmJiCmluZGV4IGU0OTllOTc1ZmMuLjc0MGY1YzhiYmYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2Vmcy9saWJ0cmFjZWZzXzEuOC4zLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2Vmcy9saWJ0cmFjZWZzXzEuOC40LmJiCkBA
IC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4w
O21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIxNWQxM2Y5NwogU0VDVElPTiA9ICJsaWJzIgog
REVQRU5EUyA9ICJsaWJ0cmFjZWV2ZW50IGJpc29uLW5hdGl2ZSBmbGV4LW5hdGl2ZSIKIAotU1JD
UkVWID0gIjZmYWQ2YTE0YmEwZDRjNGI0MzdkOWU0ZWVkNzA5OGQ0YmIwN2I0ZmMiCitTUkNSRVYg
PSAiODUwMzBlZmNmOTBhNzc1ZjA3NDUzZDdlYWI4MzU2ODFjMGFkNzE4NyIKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saWJzL2xpYnRyYWNlL2xpYnRyYWNlZnMuZ2l0
O2JyYW5jaD0ke0JQTn07cHJvdG9jb2w9aHR0cHM7dGFnPSR7QlBOfS0ke1BWfSIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiIKLS0gCjIuNDcuMQoK

--===============7331164198452677928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libtracefs/libtracefs: FILELIST: removed "/usr/lib/libtracefs.so.1.8.3", added "/usr/lib/libtracefs.so.1.8.4"
Changes to packages/x86-64-v3-poky-linux/libtracefs (sysroot):
  /usr/lib/libtracefs.so.1 changed symlink target from libtracefs.so.1.8.3 to libtracefs.so.1.8.4
  /usr/lib/libtracefs.so.1.8.3 moved to /usr/lib/libtracefs.so.1.8.4

--===============7331164198452677928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-3ca4aa9496fba3ff2de93b7850f51174496f6139"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:3ca4aa9496fba3ff2de93b7850f51174496f6139"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 276 Local 258 Mirrors 0 Missed 18 Current 181 (93% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 211 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 212 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 243 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 246 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 291 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_recipe_qa_setscene)
NOTE: Running task 417 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_write_config)
NOTE: Running task 418 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_write_config)
NOTE: recipe libtracefs-1.8.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_write_config: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_write_config: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libtraceevent-1.9.0-r0: task do_write_config: Succeeded
NOTE: recipe libtracefs-1.8.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libtracefs-1.8.4-r0: task do_write_config: Succeeded
NOTE: Running task 434 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_recipe_qa)
NOTE: recipe libtraceevent-1.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 436 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_fetch)
NOTE: Running setscene task 352 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 354 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 355 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libtracefs-1.8.4-r0: task do_recipe_qa: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 360 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtracefs-1.8.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 437 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 438 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_unpack)
NOTE: recipe libtracefs-1.8.4-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 388 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 390 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtraceevent-1.9.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtracefs-1.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 939 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_unpack)
NOTE: Running task 954 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtracefs-1.8.4-r0: task do_unpack: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtraceevent-1.9.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 971 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_patch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtraceevent-1.9.0-r0: task do_patch: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 973 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 420 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 421 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtracefs-1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 974 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_patch)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libtraceevent-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtracefs-1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 977 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libtraceevent-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_deploy_source_date_epoch unihash changed to 7d6c619c7ef2b5031c6c5a5b3e43d3636cc5938b8e42871381cc8761c7cf7e30
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 417 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libtracefs-1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtracefs-1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 457 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1109 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtraceevent-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1142 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_configure)
NOTE: recipe libtraceevent-1.9.0-r0: task do_configure: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_compile)
NOTE: recipe libtraceevent-1.9.0-r0: task do_compile: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1144 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_install)
NOTE: recipe libtraceevent-1.9.0-r0: task do_install: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 1145 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_package)
NOTE: Running task 1146 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_populate_sysroot)
NOTE: recipe libtraceevent-1.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_package: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1147 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtracefs-1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1148 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_configure)
NOTE: recipe libtracefs-1.8.4-r0: task do_configure: Started
NOTE: recipe libtraceevent-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 1149 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_packagedata)
NOTE: recipe libtraceevent-1.9.0-r0: task do_packagedata: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1150 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_compile)
NOTE: recipe libtracefs-1.8.4-r0: task do_compile: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1151 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_install)
NOTE: recipe libtracefs-1.8.4-r0: task do_install: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1152 of 1162 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtracefs/libtracefs_1.8.4.bb:do_populate_sysroot)
NOTE: recipe libtracefs-1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libtracefs-1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtraceevent-1.9.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1152 tasks of which 1127 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261022053514.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261022053514.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libtraceevent/1.9.0/temp/log.do_packagedata.1273138
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent-src went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent-dbg went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent-staticdev went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent-dev went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent-doc went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent-locale went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: QA Issue: Package version for package libtraceevent-plugins went backwards which would break package feeds (from 0:1.9.1-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: libtraceevent-1.9.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libtraceevent/1.9.0/temp/log.do_packagedata.1273138
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb:do_packagedata) failed with exit code '1'

--===============7331164198452677928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libtracefs-changelog.txt"

libtracefs: version 1.8.4
libtracefs: Support EXTRA_LIBS for utest
libtracefs: Use LIBTRACEFS_STATIC for utest
libtracefs utest: Only use online CPUs during tests
libtracefs: Fix memory leak in tracefs_tracing_dir_is_mounted()
libtracefs utest: Update kprobe test to use filename_mkdirat
libtracefs .gitignore: Only ignore patches/ at top level
libtracefs utest: Add tests for clearing kprobes with
tracefs_dynevent_destroy_all()
libtracefs: Fix tracefs_dynevent_destroy_all()

--===============7331164198452677928==--
