Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EA7C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:56:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12925.1786600551455038707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HGqss9v5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yzykBhJf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ff9b0efd6-0aea7680-e6bf-4f06-90b9-f7d68ad767e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786600550;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xmUe1wB7QlpPNiBfULKv0GMj9sHhYhaEoWQadBG1t70=;
	b=HGqss9v56+kyKovFwe9t40XOtAcUj56xflwEyUmcQHVcaJWQWYNrCSj0zcPOIfC8
	DNAG2Sm6PgIPB+80f7xk1HfpGKbCO81GD2Bo0EVO6GrjRJUSTdhVOpxg7S+nTeEOP2P
	1c1+/aMQueNOuM3gtlNAGVB3PC7kCYGAzqToPCN4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786600550;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xmUe1wB7QlpPNiBfULKv0GMj9sHhYhaEoWQadBG1t70=;
	b=yzykBhJfhwdhuPR9PR+eIYOAFD/pzOLCX5eC12I5EbtZDfLYDW0CHCr6UAgpbLCs
	LfG+9B2KkLMf2tRemsFJennlLUJDOcFT1VrNt6xIg0mMoekroDu61Rd6A5wxqh0kDY/
	1zvzItq4UX350VNtBuziEQtEOpDKHDugNI/FDz/Y=
Content-Type: multipart/mixed; boundary="===============8844708177804683923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] procps: upgrading to 4.0.7 FAILED
Message-ID: <0101019ff9b0efd6-0aea7680-e6bf-4f06-90b9-f7d68ad767e0-000000@us-west-2.amazonses.com>
Date: Thu, 13 Aug 2026 05:55:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.13-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 05:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243325

--===============8844708177804683923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *procps* to *4.0.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-procps-upgrade-4.0.6-4.0.7.patch
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
From eb20026bae828c2760baad53a52dd393e6cf46c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 13 Aug 2026 05:18:58 +0000
Subject: [PATCH] procps: upgrade 4.0.6 -> 4.0.7

Source: NEWS

procps-ng-4.0.7
---------------
  * library
    version: inc revision to 2 now 1:2:0
    internal: procps_pids_length off by one                issue #412
    external: fix slabinfo header extern 'C' declaration   issue #415
    internal: fix file descriptor leaks in <pids> api      issue #421
    internal: strv items are now escaped in <pids> api     issue #429
    internal: fix output if on seconds edge values         merge !246 RHEL-60825
  * pidof: Add -d aliased option                           issue #418
  * pgrep: Don't treat empty list as 0                     issue #427
  * pmap: Fix testsuite for Alpha                          Debian #1141465
  * ps: correct 'environ' output when file unavailable
  * ps: minimize potential EACCES with 'environ' files     issue #431
  * top: avoid batch mode segfault with maximum width      issue #422
  * w: Correctly check for end of tty using utmp           issue #430
  * watch: Dont remove 2 lines when using -t option        issue #413
  * watch: Handle resizing better                          issue #417
  * watch: Restore LINES and COLUMNS env variables         issue #432
---
 .../procps/{procps_4.0.6.bb => procps_4.0.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/procps/{procps_4.0.6.bb => procps_4.0.7.bb} (99%)

diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-extended/procps/procps_4.0.7.bb
similarity index 99%
rename from meta/recipes-extended/procps/procps_4.0.6.bb
rename to meta/recipes-extended/procps/procps_4.0.7.bb
index 2437be1c3a..dcfee6d063 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.7.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;ta
            file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
            file://run-ptest \
            "
-SRCREV = "4dafddf4c3f4646caa517f039a2307e92657ec93"
+SRCREV = "66b48a3720d46f304f0fa76f720ca925fa48d97e"
 
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
-- 
2.47.1


--===============8844708177804683923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e4c0a8e93fe407b600df18809e891325e6353b01"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e4c0a8e93fe407b600df18809e891325e6353b01"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 455 Local 441 Mirrors 0 Missed 14 Current 385 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 428 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_261.2.bb:do_create_spdx_setscene)
NOTE: Running task 425 of 2020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_recipe_qa)
NOTE: recipe dejagnu-1.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.7-r0: task do_recipe_qa: Started
NOTE: recipe systemd-1_261.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dejagnu-1.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_261.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_261.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 655 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe systemd-1_261.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_261.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 817 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 818 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 820 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 825 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 826 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1259 of 2020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe procps-4.0.7-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 830 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1415 of 2020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_unpack)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: recipe procps-4.0.7-r0: task do_unpack: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1784 of 2020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1997 of 2020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_create_recipe_spdx)
NOTE: recipe procps-4.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe procps-4.0.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2002 of 2020 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_patch)
NOTE: recipe procps-4.0.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2002 tasks of which 1996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260813051841.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260813051841.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/procps/4.0.7/temp/log.do_patch.1013444
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: procps-4.0.7-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/procps/4.0.7/sources/procps-4.0.7'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/procps/4.0.7/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Applying patch 0001-tests-Disable-twice-total-pmap-X-tests.patch
patching file testsuite/pmap.test/pmap.exp
Hunk #1 FAILED at 93.
1 out of 1 hunk FAILED -- rejects in file testsuite/pmap.test/pmap.exp
Patch 0001-tests-Disable-twice-total-pmap-X-tests.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/procps/4.0.7/temp/log.do_patch.1013444
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_patch) failed with exit code '1'

--===============8844708177804683923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="procps-changelog.txt"

Changelog for procps: 4.0.6 -> 4.0.7
Source: NEWS

procps-ng-4.0.7
---------------
  * library
    version: inc revision to 2 now 1:2:0
    internal: procps_pids_length off by one                issue #412
    external: fix slabinfo header extern 'C' declaration   issue #415
    internal: fix file descriptor leaks in <pids> api      issue #421
    internal: strv items are now escaped in <pids> api     issue #429
    internal: fix output if on seconds edge values         merge !246 RHEL-60825
  * pidof: Add -d aliased option                           issue #418
  * pgrep: Don't treat empty list as 0                     issue #427
  * pmap: Fix testsuite for Alpha                          Debian #1141465
  * ps: correct 'environ' output when file unavailable
  * ps: minimize potential EACCES with 'environ' files     issue #431
  * top: avoid batch mode segfault with maximum width      issue #422
  * w: Correctly check for end of tty using utmp           issue #430
  * watch: Dont remove 2 lines when using -t option        issue #413
  * watch: Handle resizing better                          issue #417
  * watch: Restore LINES and COLUMNS env variables         issue #432

--===============8844708177804683923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-procps-upgrade-4.0.6-4.0.7.patch"

RnJvbSBlYjIwMDI2YmFlODI4YzI3NjBiYWFkNTNhNTJkZDM5M2U2Y2Y0NmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTMgQXVnIDIwMjYgMDU6MTg6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
cm9jcHM6IHVwZ3JhZGUgNC4wLjYgLT4gNC4wLjcKClNvdXJjZTogTkVXUwoKcHJvY3BzLW5nLTQu
MC43Ci0tLS0tLS0tLS0tLS0tLQogICogbGlicmFyeQogICAgdmVyc2lvbjogaW5jIHJldmlzaW9u
IHRvIDIgbm93IDE6MjowCiAgICBpbnRlcm5hbDogcHJvY3BzX3BpZHNfbGVuZ3RoIG9mZiBieSBv
bmUgICAgICAgICAgICAgICAgaXNzdWUgIzQxMgogICAgZXh0ZXJuYWw6IGZpeCBzbGFiaW5mbyBo
ZWFkZXIgZXh0ZXJuICdDJyBkZWNsYXJhdGlvbiAgIGlzc3VlICM0MTUKICAgIGludGVybmFsOiBm
aXggZmlsZSBkZXNjcmlwdG9yIGxlYWtzIGluIDxwaWRzPiBhcGkgICAgICBpc3N1ZSAjNDIxCiAg
ICBpbnRlcm5hbDogc3RydiBpdGVtcyBhcmUgbm93IGVzY2FwZWQgaW4gPHBpZHM+IGFwaSAgICAg
aXNzdWUgIzQyOQogICAgaW50ZXJuYWw6IGZpeCBvdXRwdXQgaWYgb24gc2Vjb25kcyBlZGdlIHZh
bHVlcyAgICAgICAgIG1lcmdlICEyNDYgUkhFTC02MDgyNQogICogcGlkb2Y6IEFkZCAtZCBhbGlh
c2VkIG9wdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzc3VlICM0MTgKICAqIHBncmVw
OiBEb24ndCB0cmVhdCBlbXB0eSBsaXN0IGFzIDAgICAgICAgICAgICAgICAgICAgICBpc3N1ZSAj
NDI3CiAgKiBwbWFwOiBGaXggdGVzdHN1aXRlIGZvciBBbHBoYSAgICAgICAgICAgICAgICAgICAg
ICAgICAgRGViaWFuICMxMTQxNDY1CiAgKiBwczogY29ycmVjdCAnZW52aXJvbicgb3V0cHV0IHdo
ZW4gZmlsZSB1bmF2YWlsYWJsZQogICogcHM6IG1pbmltaXplIHBvdGVudGlhbCBFQUNDRVMgd2l0
aCAnZW52aXJvbicgZmlsZXMgICAgIGlzc3VlICM0MzEKICAqIHRvcDogYXZvaWQgYmF0Y2ggbW9k
ZSBzZWdmYXVsdCB3aXRoIG1heGltdW0gd2lkdGggICAgICBpc3N1ZSAjNDIyCiAgKiB3OiBDb3Jy
ZWN0bHkgY2hlY2sgZm9yIGVuZCBvZiB0dHkgdXNpbmcgdXRtcCAgICAgICAgICAgaXNzdWUgIzQz
MAogICogd2F0Y2g6IERvbnQgcmVtb3ZlIDIgbGluZXMgd2hlbiB1c2luZyAtdCBvcHRpb24gICAg
ICAgIGlzc3VlICM0MTMKICAqIHdhdGNoOiBIYW5kbGUgcmVzaXppbmcgYmV0dGVyICAgICAgICAg
ICAgICAgICAgICAgICAgICBpc3N1ZSAjNDE3CiAgKiB3YXRjaDogUmVzdG9yZSBMSU5FUyBhbmQg
Q09MVU1OUyBlbnYgdmFyaWFibGVzICAgICAgICAgaXNzdWUgIzQzMgotLS0KIC4uLi9wcm9jcHMv
e3Byb2Nwc180LjAuNi5iYiA9PiBwcm9jcHNfNC4wLjcuYmJ9ICAgICAgICAgICAgICAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wcm9jcHMve3Byb2Nwc180LjAuNi5iYiA9PiBwcm9jcHNf
NC4wLjcuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nw
cy9wcm9jcHNfNC4wLjYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHJvY3BzL3Byb2Nwc180
LjAuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvcHJvY3BzL3Byb2Nwc180LjAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjcuYmIKaW5kZXggMjQzN2JlMWMzYS4uZGNmZWU2ZDA2MyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjYuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjcuYmIKQEAgLTE3
LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuY29tL3Byb2Nwcy1uZy9wcm9jcHMu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGEKICAgICAgICAgICAgZmlsZTovLzAw
MDEtdGVzdHMtRGlzYWJsZS10d2ljZS10b3RhbC1wbWFwLVgtdGVzdHMucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjRkYWZkZGY0
YzNmNDY0NmNhYTUxN2YwMzlhMjMwN2U5MjY1N2VjOTMiCitTUkNSRVYgPSAiNjZiNDhhMzcyMGQ0
NmYzMDRmMGZhNzZmNzIwY2E5MjVmYTQ4ZDk3ZSIKIAogIyBVcHN0cmVhbSBoYXMgYSBjdXN0b20g
YXV0b2dlbi5zaCB3aGljaCBpbnZva2VzIHBvL3VwZGF0ZS1wb3RmaWxlcyBhcyB0aGV5CiAjIGRv
bid0IHNoaXAgYSBwby9QT1RGSUxFUy5pbiAod2hpY2ggaXMgc2lsbHkpLiAgV2l0aG91dCB0aGF0
IGZpbGUgZ2V0dGV4dAotLSAKMi40Ny4xCgo=

--===============8844708177804683923==--

