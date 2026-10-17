Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFAFCC6B2A
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 05:59:44 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1558.1792216782426355016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 22:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tuk/V+Q6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CT/FVyRE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a14871d1c2-207f1b1e-3d62-4bdd-9059-14085a2f84ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792216781;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/l/hO2nMHGZwzlwOP47t5s13Tllh8nPBlevyeJSbcyI=;
	b=tuk/V+Q6/gFmLXmizvXRqwPPOOwSj5DQSjs7putqBUKXrBTbAr5hOxM32nJZ8f+H
	a9+LCiuWgbEGpjX/wgshVyF+g4WhKLScHxV4d9ASzTgP37mByQeQrs4QAT9el2Fx1cR
	60XwLQofvQfQOP48u8Bj45w1ck2+9x9X+/QP7ocM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792216781;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/l/hO2nMHGZwzlwOP47t5s13Tllh8nPBlevyeJSbcyI=;
	b=CT/FVyRE+H3ngpS5P/KysYP/oCOqvQuxWo+eR5Urg5NPRTBPhE7f+CMn8OTm2vT2
	kCl52zdeWh1UNqXWIlLEaOAPt4NVPBLGxSkGrUM4S6pdCK1CfmjWFpq9+0/yD1DxXSM
	Vdhs30/ahLl6uKLxchCnWkMI3yJBgyG8q62RXay8=
Content-Type: multipart/mixed; boundary="===============2738628185683685401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sai Sireesha T <saisireesha.t@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Sai Sireesha T <saisireesha.t@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot,systemd-tools-native,systemd-boot-native,systemd:
 upgrading to 262.1 FAILED
Message-ID: <010101a14871d1c2-207f1b1e-3d62-4bdd-9059-14085a2f84ee-000000@us-west-2.amazonses.com>
Date: Sat, 17 Oct 2026 05:59:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.17-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 05:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248071

--===============2738628185683685401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot,systemd-tools-native,systemd-boot-native,systemd* to *262.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemd-boot-systemd-tools-native-systemd-boot-nativ.patch
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
From 5f66fdeb2a5896ab7df1cab80192b402beb744d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 17 Oct 2026 05:13:53 +0000
Subject: [PATCH] 
 systemd-boot,systemd-tools-native,systemd-boot-native,systemd: upgrade 262 ->
 262.1

kernel command line, version, firmware properties and machine tags).
---
 ...temd-boot-native_262.bb => systemd-boot-native_262.1.bb} | 0
 .../systemd/{systemd-boot_262.bb => systemd-boot_262.1.bb}  | 0
 ...md-tools-native_262.bb => systemd-tools-native_262.1.bb} | 0
 meta/recipes-core/systemd/systemd.inc                       | 2 +-
 ...nfmt-Don-t-install-dependency-links-at-install-tim.patch | 2 +-
 .../systemd/systemd/0003-Do-not-create-var-log-README.patch | 2 +-
 .../Handle-missing-STATX_MNT_ID-on-older-kernels.patch      | 6 +++---
 .../systemd/{systemd_262.bb => systemd_262.1.bb}            | 0
 8 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_262.bb => systemd-boot-native_262.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_262.bb => systemd-boot_262.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_262.bb => systemd-tools-native_262.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_262.bb => systemd_262.1.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_262.bb b/meta/recipes-core/systemd/systemd-boot-native_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_262.bb
rename to meta/recipes-core/systemd/systemd-boot-native_262.1.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_262.bb b/meta/recipes-core/systemd/systemd-boot_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_262.bb
rename to meta/recipes-core/systemd/systemd-boot_262.1.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_262.bb b/meta/recipes-core/systemd/systemd-tools-native_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-tools-native_262.bb
rename to meta/recipes-core/systemd/systemd-tools-native_262.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3efc48f65b..1098dc521e 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -13,7 +13,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-SRCREV = "8cc40e0c5e9234bf45084751ac53b1fbfe70b492"
+SRCREV = "73612ea502d53baf9b0df4336cfc296a7ee0d524"
 SRCBRANCH = "v262-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 0b9eb4ac3c..31aaa9d1f1 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 4793a67d3d738520f0193a9edff491989e8d77bc Mon Sep 17 00:00:00 2001
+From 40a7e68660d7c295a851b7f3c32650ca8223dad1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
index c64bfa8249..ee5fc2fd98 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
@@ -1,4 +1,4 @@
-From e36f6fc852f8331791f391a216885b9bea543aff Mon Sep 17 00:00:00 2001
+From 7359147bca7d72f97cf0b1f5dc2305894d64e524 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
 Subject: [PATCH] Do not create /var/log/README
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
index 7e96550dd3..eb4399cfed 100644
--- a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
+++ b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
@@ -1,4 +1,4 @@
-From 4f04acacb42d410d7002cae3e2bb6c51d47331d6 Mon Sep 17 00:00:00 2001
+From ca3997b157d681dd92d091be7b31f6ffe632bbd2 Mon Sep 17 00:00:00 2001
 From: Daniel Turull <daniel.turull@ericsson.com>
 Date: Tue, 23 Jun 2026 12:00:00 +0200
 Subject: [PATCH] Handle missing STATX_MNT_ID on older kernels
@@ -28,7 +28,7 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
  3 files changed, 80 insertions(+), 3 deletions(-)
 
 diff --git a/src/basic/chase.c b/src/basic/chase.c
-index 23a523798e..08ef95b3dd 100644
+index c07e8f6d92..20ea6ec649 100644
 --- a/src/basic/chase.c
 +++ b/src/basic/chase.c
 @@ -40,7 +40,9 @@
@@ -153,7 +153,7 @@ index c6e78c59b6..7f33d900e5 100644
  
          r = statx_mount_same(&sx1, &sx2);
 diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
-index 86bddb6dac..34370c8943 100644
+index 999b49ab03..c2f877d764 100644
 --- a/src/basic/fd-util.h
 +++ b/src/basic/fd-util.h
 @@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(int dir_fd) {
diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_262.bb
rename to meta/recipes-core/systemd/systemd_262.1.bb
-- 
2.47.1


--===============2738628185683685401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-boot-native-changelog.txt"

kernel command line, version, firmware properties and machine tags).

--===============2738628185683685401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-changelog.txt"

kernel command line, version, firmware properties and machine tags).

--===============2738628185683685401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd'
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'usrmerge systemd'
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'usrmerge systemd'

--===============2738628185683685401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-systemd-tools-native-systemd-boot-nativ.patch"

RnJvbSA1ZjY2ZmRlYjJhNTg5NmFiN2RmMWNhYjgwMTkyYjQwMmJlYjc0NGQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTcgT2N0IDIwMjYgMDU6MTM6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IHN5c3RlbWQtYm9vdCxzeXN0ZW1kLXRvb2xzLW5hdGl2ZSxzeXN0ZW1kLWJvb3QtbmF0aXZlLHN5
c3RlbWQ6IHVwZ3JhZGUgMjYyIC0+CiAyNjIuMQoKa2VybmVsIGNvbW1hbmQgbGluZSwgdmVyc2lv
biwgZmlybXdhcmUgcHJvcGVydGllcyBhbmQgbWFjaGluZSB0YWdzKS4KLS0tCiAuLi50ZW1kLWJv
b3QtbmF0aXZlXzI2Mi5iYiA9PiBzeXN0ZW1kLWJvb3QtbmF0aXZlXzI2Mi4xLmJifSB8IDAKIC4u
Li9zeXN0ZW1kL3tzeXN0ZW1kLWJvb3RfMjYyLmJiID0+IHN5c3RlbWQtYm9vdF8yNjIuMS5iYn0g
IHwgMAogLi4ubWQtdG9vbHMtbmF0aXZlXzI2Mi5iYiA9PiBzeXN0ZW1kLXRvb2xzLW5hdGl2ZV8y
NjIuMS5iYn0gfCAwCiBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLm5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRlbmN5
LWxpbmtzLWF0LWluc3RhbGwtdGltLnBhdGNoIHwgMiArLQogLi4uL3N5c3RlbWQvc3lzdGVtZC8w
MDAzLURvLW5vdC1jcmVhdGUtdmFyLWxvZy1SRUFETUUucGF0Y2ggfCAyICstCiAuLi4vSGFuZGxl
LW1pc3NpbmctU1RBVFhfTU5UX0lELW9uLW9sZGVyLWtlcm5lbHMucGF0Y2ggICAgICB8IDYgKysr
LS0tCiAuLi4vc3lzdGVtZC97c3lzdGVtZF8yNjIuYmIgPT4gc3lzdGVtZF8yNjIuMS5iYn0gICAg
ICAgICAgICB8IDAKIDggZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdC1uYXRp
dmVfMjYyLmJiID0+IHN5c3RlbWQtYm9vdC1uYXRpdmVfMjYyLjEuYmJ9ICgxMDAlKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNjIuYmIgPT4gc3lzdGVt
ZC1ib290XzI2Mi4xLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1k
L3tzeXN0ZW1kLXRvb2xzLW5hdGl2ZV8yNjIuYmIgPT4gc3lzdGVtZC10b29scy1uYXRpdmVfMjYy
LjEuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWRf
MjYyLmJiID0+IHN5c3RlbWRfMjYyLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290LW5hdGl2ZV8yNjIuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdC1uYXRpdmVfMjYyLjEuYmIKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1i
b290LW5hdGl2ZV8yNjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC1ib290LW5hdGl2ZV8yNjIuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
c3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjYyLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLWJvb3RfMjYyLjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI2Mi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjYyLjEuYmIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC10b29scy1uYXRpdmVfMjYyLmJiIGIv
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLXRvb2xzLW5hdGl2ZV8yNjIuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kLXRvb2xzLW5hdGl2ZV8yNjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3Jl
L3N5c3RlbWQvc3lzdGVtZC10b29scy1uYXRpdmVfMjYyLjEuYmIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQuaW5jCmluZGV4IDNlZmM0OGY2NWIuLjEwOThkYzUyMWUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwpAQCAtMTMsNyArMTMsNyBAQCBMSUNFTlNFOmxpYnN5
c3RlbWQgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLkdQTDI7bWQ1PWMwOTc4NjM2MzUwMGE5YWNjMjliMTQ3ZTZlNzJkMmM2IFwKICAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UuTEdQTDIuMTttZDU9YmUwYWFmNGEzODBmNzNm
N2UwMGI0MjBhMDA3MzY4ZjIiCiAKLVNSQ1JFViA9ICI4Y2M0MGUwYzVlOTIzNGJmNDUwODQ3NTFh
YzUzYjFmYmZlNzBiNDkyIgorU1JDUkVWID0gIjczNjEyZWE1MDJkNTNiYWY5YjBkZjQzMzZjZmMy
OTZhN2VlMGQ1MjQiCiBTUkNCUkFOQ0ggPSAidjI2Mi1zdGFibGUiCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9JHtT
UkNCUkFOQ0h9O3RhZz12JHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5
c3RlbWQvc3lzdGVtZC8wMDAxLWJpbmZtdC1Eb24tdC1pbnN0YWxsLWRlcGVuZGVuY3ktbGlua3Mt
YXQtaW5zdGFsbC10aW0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQv
MDAwMS1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0LWluc3RhbGwtdGlt
LnBhdGNoCmluZGV4IDBiOWViNGFjM2MuLjMxYWFhOWQxZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAxLWJpbmZtdC1Eb24tdC1pbnN0YWxsLWRlcGVu
ZGVuY3ktbGlua3MtYXQtaW5zdGFsbC10aW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
c3lzdGVtZC9zeXN0ZW1kLzAwMDEtYmluZm10LURvbi10LWluc3RhbGwtZGVwZW5kZW5jeS1saW5r
cy1hdC1pbnN0YWxsLXRpbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDc5M2E2N2QzZDcz
ODUyMGYwMTkzYTllZGZmNDkxOTg5ZThkNzdiYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNDBhN2U2ODY2MGQ3YzI5NWE4NTFiN2YzYzMyNjUwY2E4MjIzZGFkMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6
IFRodSwgMjEgRmViIDIwMTkgMTY6MjM6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmluZm10
OiBEb24ndCBpbnN0YWxsIGRlcGVuZGVuY3kgbGlua3MgYXQgaW5zdGFsbCB0aW1lIGZvcgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDMtRG8tbm90LWNy
ZWF0ZS12YXItbG9nLVJFQURNRS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC8wMDAzLURvLW5vdC1jcmVhdGUtdmFyLWxvZy1SRUFETUUucGF0Y2gKaW5kZXggYzY0YmZh
ODI0OS4uZWU1ZmMyZmQ5OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLzAwMDMtRG8tbm90LWNyZWF0ZS12YXItbG9nLVJFQURNRS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMy1Eby1ub3QtY3JlYXRlLXZhci1sb2ct
UkVBRE1FLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMzZmNmZjODUyZjgzMzE3OTFmMzkx
YTIxNjg4NWI5YmVhNTQzYWZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MzU5MTQ3
YmNhN2Q3MmY5N2NmMGIxZjVkYzIzMDU4OTRkNjRlNTI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRlOiBUdWUsIDIx
IEphbiAyMDI1IDA1OjAyOjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBjcmVhdGUg
L3Zhci9sb2cvUkVBRE1FCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvSGFuZGxlLW1pc3NpbmctU1RBVFhfTU5UX0lELW9uLW9sZGVyLWtlcm5lbHMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvSGFuZGxlLW1pc3NpbmctU1RBVFhf
TU5UX0lELW9uLW9sZGVyLWtlcm5lbHMucGF0Y2gKaW5kZXggN2U5NjU1MGRkMy4uZWI0Mzk5Y2Zl
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kL0hhbmRsZS1t
aXNzaW5nLVNUQVRYX01OVF9JRC1vbi1vbGRlci1rZXJuZWxzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC9IYW5kbGUtbWlzc2luZy1TVEFUWF9NTlRfSUQtb24t
b2xkZXIta2VybmVscy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGYwNGFjYWNiNDJkNDEw
ZDcwMDJjYWUzZTJiYjZjNTFkNDczMzFkNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
Y2EzOTk3YjE1N2Q2ODFkZDkyZDA5MWJlN2IzMWY2ZmZlNjMyYmJkMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29t
PgogRGF0ZTogVHVlLCAyMyBKdW4gMjAyNiAxMjowMDowMCArMDIwMAogU3ViamVjdDogW1BBVENI
XSBIYW5kbGUgbWlzc2luZyBTVEFUWF9NTlRfSUQgb24gb2xkZXIga2VybmVscwpAQCAtMjgsNyAr
MjgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNz
c29uLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvYmFzaWMvY2hhc2UuYyBiL3NyYy9iYXNpYy9jaGFzZS5j
Ci1pbmRleCAyM2E1MjM3OThlLi4wOGVmOTViM2RkIDEwMDY0NAoraW5kZXggYzA3ZThmNmQ5Mi4u
MjBlYTZlYzY0OSAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9jaGFzZS5jCiArKysgYi9zcmMvYmFz
aWMvY2hhc2UuYwogQEAgLTQwLDcgKzQwLDkgQEAKQEAgLTE1Myw3ICsxNTMsNyBAQCBpbmRleCBj
NmU3OGM1OWI2Li43ZjMzZDkwMGU1IDEwMDY0NAogIAogICAgICAgICAgciA9IHN0YXR4X21vdW50
X3NhbWUoJnN4MSwgJnN4Mik7CiBkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL2ZkLXV0aWwuaCBiL3Ny
Yy9iYXNpYy9mZC11dGlsLmgKLWluZGV4IDg2YmRkYjZkYWMuLjM0MzcwYzg5NDMgMTAwNjQ0Citp
bmRleCA5OTliNDlhYjAzLi5jMmY4NzdkNzY0IDEwMDY0NAogLS0tIGEvc3JjL2Jhc2ljL2ZkLXV0
aWwuaAogKysrIGIvc3JjL2Jhc2ljL2ZkLXV0aWwuaAogQEAgLTE4OCw2ICsxODgsNyBAQCBzdGF0
aWMgaW5saW5lIGludCBkaXJfZmRfaXNfcm9vdF9vcl9jd2QoaW50IGRpcl9mZCkgewpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI2Mi5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZF8yNjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI2Mi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI2Mi4xLmJiCi0tIAoyLjQ3
LjEKCg==

--===============2738628185683685401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-boot-changelog.txt"

kernel command line, version, firmware properties and machine tags).

--===============2738628185683685401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/systemd-boot: SRC_URI changed from "git://github.com/systemd/systemd.git;protocol=https;branch=v262-stable;tag=v262" to "git://github.com/systemd/systemd.git;protocol=https;branch=v262-stable;tag=v262.1"
packages/qemux86_64-poky-linux/systemd-boot: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot: PV changed from "262" to "262.1"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "262" to "262.1"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "262" to "262.1"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "262" to "262.1"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "262" to "262.1"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "262" to "262.1"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "262" to "262.1"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 262 [default] to 262.1 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd: SRC_URI changed from "git://github.com/systemd/systemd.git;protocol=https;branch=v262-stable;tag=v262 file://touchscreen.rules file://00-create-volatile.conf file://org.freedesktop.hostname1_no_polkit.conf file://00-hostnamed-network-user.conf file://init file://99-default.preset file://systemd-pager.sh file://coredumpd-kernel-version.conf file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch file://0003-Do-not-create-var-log-README.patch" to "git://github.com/systemd/systemd.git;protocol=https;branch=v262-stable;tag=v262.1 file://touchscreen.rules file://00-create-volatile.conf file://org.freedesktop.hostname1_no_polkit.conf file://00-hostnamed-network-user.conf file://init file://99-default.preset file://systemd-pager.sh file://coredumpd-kernel-version.conf file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch file://0003-Do-not-create-var-log-README.patch"
packages/x86-64-v3-poky-linux/systemd: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/libnss-myhostname: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-myhostname: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/libnss-mymachines: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-mymachines: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/libnss-resolve: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-resolve: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/libnss-systemd: PKGSIZE changed from 641960 to 646056 (+1%)
packages/x86-64-v3-poky-linux/systemd/libnss-systemd: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-systemd: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/libsystemd-shared: PKGSIZE changed from 5439824 to 5448016 (+0%)
packages/x86-64-v3-poky-linux/systemd/libsystemd-shared: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/libsystemd-shared: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/libsystemd: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/libsystemd: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/libudev: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/libudev: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-analyze: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-analyze: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-bash-completion: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-bash-completion: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-binfmt: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-binfmt: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-container: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-container: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-crypt: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-crypt: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-dbg: PKGSIZE changed from 106950720 to 107038824 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-dbg: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-dbg: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-dev: PKGSIZE changed from 271402 to 271726 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-dev: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-dev: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-doc: PKGSIZE changed from 1467543 to 1467277 (-0%)
packages/x86-64-v3-poky-linux/systemd/systemd-doc: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-doc: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-extra-utils: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-extra-utils: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-gui: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-gui: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-initramfs: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-initramfs: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-journal-gatewayd: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-journal-gatewayd: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-journal-remote: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-journal-remote: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-journal-upload: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-journal-upload: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-kernel-install: PKGSIZE changed from 83999 to 84124 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-kernel-install: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-kernel-install: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ar: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ar: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be+latin: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be+latin: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bg: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bg: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bo: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bo: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ca: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ca: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-cs: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-cs: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-da: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-da: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-de: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-de: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-el: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-el: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eo: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eo: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-es: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-es: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-et: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-et: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eu: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eu: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fi: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fi: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fr: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fr: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-gl: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-gl: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-he: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-he: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hi: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hi: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hr: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hr: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hu: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hu: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ia: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ia: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-id: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-id: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-it: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-it: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ja: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ja: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ka: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ka: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kab: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kab: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kk: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kk: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-km: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-km: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kn: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kn: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ko: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ko: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kw: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kw: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lo: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lo: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lt: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lt: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nb-no: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nb-no: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nl: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nl: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pa: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pa: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pl: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pl: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt-br: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt-br: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ro: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ro: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ru: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ru: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-si: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-si: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sk: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sk: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sl: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sl: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr+latin: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr+latin: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sv: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sv: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-tr: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-tr: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ug: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ug: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-uk: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-uk: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-cn: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-cn: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-tw: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-tw: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-mime: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-mime: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-networkd: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-networkd: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-rpm-macros: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-rpm-macros: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-src: PKGSIZE changed from 32213643 to 32254167 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-src: FILELIST: directory renamed /usr/src/debug/systemd/262/src/udev -> /usr/src/debug/systemd/262.1/src/udev, directory renamed /usr/src/debug/systemd/262/src/basic -> /usr/src/debug/systemd/262.1/src/basic, directory renamed /usr/src/debug/systemd/262/src/udev/cdrom_id -> /usr/src/debug/systemd/262.1/src/udev/cdrom_id, directory renamed /usr/src/debug/systemd/262/src/battery-check -> /usr/src/debug/systemd/262.1/src/battery-check, directory renamed /usr/src/debug/systemd/262/src/journal-remote -> /usr/src/debug/systemd/262.1/src/journal-remote, directory renamed /usr/src/debug/systemd/262/src/update-done -> /usr/src/debug/systemd/262.1/src/update-done, directory renamed /usr/src/debug/systemd/262/src/ptyfwd -> /usr/src/debug/systemd/262.1/src/ptyfwd, directory renamed /usr/src/debug/systemd/262/src/sulogin-shell -> /usr/src/debug/systemd/262.1/src/sulogin-shell, directory renamed /usr/src/debug/systemd/262/src/vconsole -> /usr/src/debug
 /systemd/262.1/src/vconsole, directory renamed /usr/src/debug/systemd/262/src/shutdown -> /usr/src/debug/systemd/262.1/src/shutdown, directory renamed /usr/src/debug/systemd/262/src/tty-ask-password-agent -> /usr/src/debug/systemd/262.1/src/tty-ask-password-agent, directory renamed /usr/src/debug/systemd/262/src/tmpfiles -> /usr/src/debug/systemd/262.1/src/tmpfiles, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-bus -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-bus, directory renamed /usr/src/debug/systemd/262/src/nspawn -> /usr/src/debug/systemd/262.1/src/nspawn, directory renamed /usr/src/debug/systemd/262/src/network/generator -> /usr/src/debug/systemd/262.1/src/network/generator, directory renamed /usr/src/debug/systemd/262/src/ask-password -> /usr/src/debug/systemd/262.1/src/ask-password, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-network -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-network, directory renamed /usr/src/debug/systemd/2
 62/src/include/override/netinet -> /usr/src/debug/systemd/262.1/src/include/override/netinet, directory renamed /usr/src/debug/systemd/262/src/debug-generator -> /usr/src/debug/systemd/262.1/src/debug-generator, directory renamed /usr/src/debug/systemd/262/src/fsck -> /usr/src/debug/systemd/262.1/src/fsck, directory renamed /usr/src/debug/systemd/262/src/getty-generator -> /usr/src/debug/systemd/262.1/src/getty-generator, directory renamed /usr/src/debug/systemd/262/src/locale -> /usr/src/debug/systemd/262.1/src/locale, directory renamed /usr/src/debug/systemd/262/src/dissect -> /usr/src/debug/systemd/262.1/src/dissect, directory renamed /usr/src/debug/systemd/262/src/detect-virt -> /usr/src/debug/systemd/262.1/src/detect-virt, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-netlink -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-netlink, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-varlink -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-varlink,
  directory renamed /usr/src/debug/systemd/262/src/resolve -> /usr/src/debug/systemd/262.1/src/resolve, directory renamed /usr/src/debug/systemd/262/src/network -> /usr/src/debug/systemd/262.1/src/network, directory renamed /usr/src/debug/systemd/262/src/libsystemd-network -> /usr/src/debug/systemd/262.1/src/libsystemd-network, directory renamed /usr/src/debug/systemd/262/src/hostname -> /usr/src/debug/systemd/262.1/src/hostname, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-path -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-path, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-json -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-json, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-hwdb -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-hwdb, directory renamed /usr/src/debug/systemd/262/src/clonesetup -> /usr/src/debug/systemd/262.1/src/clonesetup, directory renamed /usr/src/debug/systemd/262/src/udev/dmi_memory_id -> /usr/src/debu
 g/systemd/262.1/src/udev/dmi_memory_id, directory renamed /usr/src/debug/systemd/262/src/hwdb -> /usr/src/debug/systemd/262.1/src/hwdb, directory renamed /usr/src/debug/systemd/262/src/bless-boot -> /usr/src/debug/systemd/262.1/src/bless-boot, directory renamed /usr/src/debug/systemd/262/src/include/uapi/linux/can -> /usr/src/debug/systemd/262.1/src/include/uapi/linux/can, directory renamed /usr/src/debug/systemd/262/src/udev/mtd_probe -> /usr/src/debug/systemd/262.1/src/udev/mtd_probe, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-device -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-device, directory renamed /usr/src/debug/systemd/262/src/reply-password -> /usr/src/debug/systemd/262.1/src/reply-password, directory renamed /usr/src/debug/systemd/262/src/sleep -> /usr/src/debug/systemd/262.1/src/sleep, directory renamed /usr/src/debug/systemd/262/src/udev/v4l_id -> /usr/src/debug/systemd/262.1/src/udev/v4l_id, directory renamed /usr/src/debug/systemd/262/src/netw
 ork/netdev -> /usr/src/debug/systemd/262.1/src/network/netdev, directory renamed /usr/src/debug/systemd/262/src/udev/ata_id -> /usr/src/debug/systemd/262.1/src/udev/ata_id, directory renamed /usr/src/debug/systemd/262/src/varlinkctl -> /usr/src/debug/systemd/262.1/src/varlinkctl, directory renamed /usr/src/debug/systemd/262/src/storagetm -> /usr/src/debug/systemd/262.1/src/storagetm, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-future -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-future, directory renamed /usr/src/debug/systemd/262/src/include/override/net -> /usr/src/debug/systemd/262.1/src/include/override/net, directory renamed /usr/src/debug/systemd/262/src/include/uapi/linux/sched -> /usr/src/debug/systemd/262.1/src/include/uapi/linux/sched, directory renamed /usr/src/debug/systemd/262/src/remount-fs -> /usr/src/debug/systemd/262.1/src/remount-fs, directory renamed /usr/src/debug/systemd/262/src/bootctl -> /usr/src/debug/systemd/262.1/src/bootctl, director
 y renamed /usr/src/debug/systemd/262/src/validatefs -> /usr/src/debug/systemd/262.1/src/validatefs, directory renamed /usr/src/debug/systemd/262/src/timedate -> /usr/src/debug/systemd/262.1/src/timedate, directory renamed /usr/src/debug/systemd/262/src/growfs -> /usr/src/debug/systemd/262.1/src/growfs, directory renamed /usr/src/debug/systemd/262/src/machine -> /usr/src/debug/systemd/262.1/src/machine, directory renamed /usr/src/debug/systemd/262/src/quotacheck -> /usr/src/debug/systemd/262.1/src/quotacheck, directory renamed /usr/src/debug/systemd/262/src/core -> /usr/src/debug/systemd/262.1/src/core, directory renamed /usr/src/debug/systemd/262/src/libsystemd -> /usr/src/debug/systemd/262.1/src/libsystemd, directory renamed /usr/src/debug/systemd/262/src/random-seed -> /usr/src/debug/systemd/262.1/src/random-seed, directory renamed /usr/src/debug/systemd/262/src/socket-activate -> /usr/src/debug/systemd/262.1/src/socket-activate, directory renamed /usr/src/debug/systemd/262/src/fs
 tab-generator -> /usr/src/debug/systemd/262.1/src/fstab-generator, directory renamed /usr/src/debug/systemd/262/src/nss-resolve -> /usr/src/debug/systemd/262.1/src/nss-resolve, directory renamed /usr/src/debug/systemd/262/src/libc -> /usr/src/debug/systemd/262.1/src/libc, directory renamed /usr/src/debug/systemd/262/src/stdio-bridge -> /usr/src/debug/systemd/262.1/src/stdio-bridge, directory renamed /usr/src/debug/systemd/262/src/hibernate-resume -> /usr/src/debug/systemd/262.1/src/hibernate-resume, directory renamed /usr/src/debug/systemd/262/src/include/override -> /usr/src/debug/systemd/262.1/src/include/override, directory renamed /usr/src/debug/systemd/262/src/backlight -> /usr/src/debug/systemd/262.1/src/backlight, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-resolve -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-resolve, directory renamed /usr/src/debug/systemd/262/src/ssh-generator -> /usr/src/debug/systemd/262.1/src/ssh-generator, directory renamed /usr
 /src/debug/systemd/262/src/udev/fido_id -> /usr/src/debug/systemd/262.1/src/udev/fido_id, directory renamed /usr/src/debug/systemd/262/src/udev/scsi_id -> /usr/src/debug/systemd/262.1/src/udev/scsi_id, directory renamed /usr/src/debug/systemd/262/src/libudev -> /usr/src/debug/systemd/262.1/src/libudev, directory renamed /usr/src/debug/systemd/262/src/ac-power -> /usr/src/debug/systemd/262.1/src/ac-power, directory renamed /usr/src/debug/systemd/262/src/sysctl -> /usr/src/debug/systemd/262.1/src/sysctl, directory renamed /usr/src/debug/systemd/262/src/creds -> /usr/src/debug/systemd/262.1/src/creds, directory renamed /usr/src/debug/systemd/262/src/userdb -> /usr/src/debug/systemd/262.1/src/userdb, directory renamed /usr/src/debug/systemd/262/src/rfkill -> /usr/src/debug/systemd/262.1/src/rfkill, directory renamed /usr/src/debug/systemd/262/src/mstack -> /usr/src/debug/systemd/262.1/src/mstack, directory renamed /usr/src/debug/systemd/262/src/busctl -> /usr/src/debug/systemd/262.1/src
 /busctl, directory renamed /usr/src/debug/systemd/262/src/network/wait-online -> /usr/src/debug/systemd/262.1/src/network/wait-online, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-daemon -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-daemon, directory renamed /usr/src/debug/systemd/262/src/path -> /usr/src/debug/systemd/262.1/src/path, directory renamed /usr/src/debug/systemd/262/src/vpick -> /usr/src/debug/systemd/262.1/src/vpick, directory renamed /usr/src/debug/systemd/262/src/nss-systemd -> /usr/src/debug/systemd/262.1/src/nss-systemd, directory renamed /usr/src/debug/systemd/262/src/notify -> /usr/src/debug/systemd/262.1/src/notify, directory renamed /usr/src/debug/systemd/262/src/update-utmp -> /usr/src/debug/systemd/262.1/src/update-utmp, directory renamed /usr/src/debug/systemd/262/src/nss-myhostname -> /usr/src/debug/systemd/262.1/src/nss-myhostname, directory renamed /usr/src/debug/systemd/262/src/include/uapi/linux -> /usr/src/debug/systemd/262.1/src/
 include/uapi/linux, directory renamed /usr/src/debug/systemd/262/src/run-generator -> /usr/src/debug/systemd/262.1/src/run-generator, directory renamed /usr/src/debug/systemd/262/src/udev/net -> /usr/src/debug/systemd/262.1/src/udev/net, directory renamed /usr/src/debug/systemd/262/src/include/uapi/linux/hdlc -> /usr/src/debug/systemd/262.1/src/include/uapi/linux/hdlc, directory renamed /usr/src/debug/systemd/262/src/id128 -> /usr/src/debug/systemd/262.1/src/id128, directory renamed /usr/src/debug/systemd/262/src/analyze -> /usr/src/debug/systemd/262.1/src/analyze, directory renamed /usr/src/debug/systemd/262/src/systemd -> /usr/src/debug/systemd/262.1/src/systemd, directory renamed /usr/src/debug/systemd/262/src/include/uapi/linux/netfilter -> /usr/src/debug/systemd/262.1/src/include/uapi/linux/netfilter, directory renamed /usr/src/debug/systemd/262/src/sysinstall -> /usr/src/debug/systemd/262.1/src/sysinstall, directory renamed /usr/src/debug/systemd/262/src/modules-load -> /usr/s
 rc/debug/systemd/262.1/src/modules-load, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-id128 -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-id128, directory renamed /usr/src/debug/systemd/262/src/systemctl -> /usr/src/debug/systemd/262.1/src/systemctl, directory renamed /usr/src/debug/systemd/262/src/escape -> /usr/src/debug/systemd/262.1/src/escape, directory renamed /usr/src/debug/systemd/262/src/environment-d-generator -> /usr/src/debug/systemd/262.1/src/environment-d-generator, directory renamed /usr/src/debug/systemd/262/src/shared -> /usr/src/debug/systemd/262.1/src/shared, directory renamed /usr/src/debug/systemd/262/src/login -> /usr/src/debug/systemd/262.1/src/login, directory renamed /usr/src/debug/systemd/262/src/system-update-generator -> /usr/src/debug/systemd/262.1/src/system-update-generator, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-journal -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-journal, directory renamed /usr/src/d
 ebug/systemd/262/src/kernel-install -> /usr/src/debug/systemd/262.1/src/kernel-install, directory renamed /usr/src/debug/systemd/262/src/mount -> /usr/src/debug/systemd/262.1/src/mount, directory renamed /usr/src/debug/systemd/262/src/factory-reset -> /usr/src/debug/systemd/262.1/src/factory-reset, directory renamed /usr/src/debug/systemd/262/src/coredump -> /usr/src/debug/systemd/262.1/src/coredump, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-event -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-event, directory renamed /usr/src/debug/systemd/262/src/network/tc -> /usr/src/debug/systemd/262.1/src/network/tc, directory renamed /usr/src/debug/systemd/262/src/volatile-root -> /usr/src/debug/systemd/262.1/src/volatile-root, directory renamed /usr/src/debug/systemd/262/src/udev/iocost -> /usr/src/debug/systemd/262.1/src/udev/iocost, directory renamed /usr/src/debug/systemd/262/src/mute-console -> /usr/src/debug/systemd/262.1/src/mute-console, directory renamed /usr/
 src/debug/systemd/262/src/run -> /usr/src/debug/systemd/262.1/src/run, directory renamed /usr/src/debug/systemd/262/src/sysusers -> /usr/src/debug/systemd/262.1/src/sysusers, directory renamed /usr/src/debug/systemd/262/src/gpt-auto-generator -> /usr/src/debug/systemd/262.1/src/gpt-auto-generator, directory renamed /usr/src/debug/systemd/262/src/machine-id-setup -> /usr/src/debug/systemd/262.1/src/machine-id-setup, directory renamed /usr/src/debug/systemd/262/src/cgls -> /usr/src/debug/systemd/262.1/src/cgls, directory renamed /usr/src/debug/systemd/262/src/libsystemd/sd-login -> /usr/src/debug/systemd/262.1/src/libsystemd/sd-login, directory renamed /usr/src/debug/systemd/262/src/delta -> /usr/src/debug/systemd/262.1/src/delta, directory renamed /usr/src/debug/systemd/262/src/journal -> /usr/src/debug/systemd/262.1/src/journal, directory renamed /usr/src/debug/systemd/262/src/nss-mymachines -> /usr/src/debug/systemd/262.1/src/nss-mymachines, directory renamed /usr/src/debug/systemd
 /262/src/storage -> /usr/src/debug/systemd/262.1/src/storage, directory renamed /usr/src/debug/systemd/262/src/timesync -> /usr/src/debug/systemd/262.1/src/timesync, directory renamed /usr/src/debug/systemd/262/src/fundamental -> /usr/src/debug/systemd/262.1/src/fundamental, directory renamed /usr/src/debug/systemd/262/src/socket-proxy -> /usr/src/debug/systemd/262.1/src/socket-proxy, directory renamed /usr/src/debug/systemd/262/src/user-sessions -> /usr/src/debug/systemd/262.1/src/user-sessions, directory renamed /usr/src/debug/systemd/262/src/cgtop -> /usr/src/debug/systemd/262.1/src/cgtop, directory renamed /usr/src/debug/systemd/262/src/include/override/linux -> /usr/src/debug/systemd/262.1/src/include/override/linux, directory renamed /usr/src/debug/systemd/262/src/binfmt -> /usr/src/debug/systemd/262.1/src/binfmt, directory renamed /usr/src/debug/systemd/262/src/include/override/sys -> /usr/src/debug/systemd/262.1/src/include/override/sys, directory renamed /usr/src/debug/syst
 emd/262/src/report -> /usr/src/debug/systemd/262.1/src/report
packages/x86-64-v3-poky-linux/systemd/systemd-src: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-src: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-staticdev: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-staticdev: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-udev-rules: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-udev-rules: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-ukify: PKGSIZE changed from 97366 to 97955 (+1%)
packages/x86-64-v3-poky-linux/systemd/systemd-ukify: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-ukify: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-vconsole-setup: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-vconsole-setup: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd-zsh-completion: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-zsh-completion: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/systemd: PKGSIZE changed from 9412075 to 9405455 (-0%)
packages/x86-64-v3-poky-linux/systemd/systemd: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/systemd: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/udev-bash-completion: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/udev-bash-completion: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/udev-hwdb: PKGSIZE changed from 9636015 to 9638550 (+0%)
packages/x86-64-v3-poky-linux/systemd/udev-hwdb: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/udev-hwdb: PV changed from "262" to "262.1"
packages/x86-64-v3-poky-linux/systemd/udev: PKGV changed from 262 [default] to 262.1 [default]
packages/x86-64-v3-poky-linux/systemd/udev: PV changed from "262" to "262.1"

--===============2738628185683685401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-tools-native-changelog.txt"

kernel command line, version, firmware properties and machine tags).

--===============2738628185683685401==--

