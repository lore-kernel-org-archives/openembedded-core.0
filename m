Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12058.1795238992620605017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=agz04/Va;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XuLibf0V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1fc95174b-32be7ef7-c029-4afa-80cf-44286a769ea3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795238991;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=d+3UYV2s02l6qZzB3I+yrSbVBv6LME9INKUSRrqpfVI=;
	b=agz04/VaW/RNe/QGxgFEePOCjjvfEg/zeZdVP8DQ0noG4ZsZ2tWfIoWZK/K1Ak/m
	oJAs7VQ+PTUSVXiOdRFtHP1OnIjZlEQ+34/i4aVjhkZxY3JjMBZ6hWM/sP0YyYIi1EB
	MT8XFwGSIHPIcaeTFUHz/fZKl1tSC5fiblfRHiqo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795238991;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=d+3UYV2s02l6qZzB3I+yrSbVBv6LME9INKUSRrqpfVI=;
	b=XuLibf0VseZemrrzPq7oMCEwqwW6VGjUvcVdtBhcKNxb37KJHJ4NyeWinempNXEy
	uD8vsL9dl2drp0u47RxpSiPXCBcdnxD8pzU1Xwa+X9dYFUYa5818ja2IjlWD8bteGUI
	XHoappD/rEHnrElrO044H5qARvGBpVEn+T5Brj+w=
Content-Type: multipart/mixed; boundary="===============5730479182693052166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 616da16f25da428ccda805536209095bd062676e
 SUCCEEDED
Message-ID: <010101a1fc95174b-32be7ef7-c029-4afa-80cf-44286a769ea3-000000@us-west-2.amazonses.com>
Date: Sat, 21 Nov 2026 05:29:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.21-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250832

--===============5730479182693052166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *616da16f25da428ccda805536209095bd062676e* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From 0f85bfa11ad9d02f8ed377c332d60a5827cf5c3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 21 Nov 2026 05:19:06 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

Mines: add a user preference for question marks.
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index d707cdb0c2..b8d1fa4886 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "ea09098d71db949351437eba1920033d3a08f491"
+SRCREV = "616da16f25da428ccda805536209095bd062676e"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.47.1


--===============5730479182693052166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+ea09098d71-r0'])", added "puzzles (['= 2:0.0+git0+616da16f25-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+ea09098d71-r0'])", added "puzzles-dev (['= 2:0.0+git0+616da16f25-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25

--===============5730479182693052166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="puzzles-changelog.txt"

Mines: add a user preference for question marks.

--===============5730479182693052166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 24208664 to 24210176 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+ea09098d71-r0'])", added "puzzles (['= 2:0.0+git0+616da16f25-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3987240 to 3989741 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+ea09098d71-r0'])", added "puzzles-dev (['= 2:0.0+git0+616da16f25-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+ea09098d71 to 0.0+git0+616da16f25

--===============5730479182693052166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 963 .bb files complete (0 cached, 963 parsed). 2014 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-33644fb7ed7a55c4713bb94427a42087818ce6b4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:33644fb7ed7a55c4713bb94427a42087818ce6b4"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 500 Local 489 Mirrors 0 Missed 11 Current 907 (97% match, 99% complete)
done.
Removing 10 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2955 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 3304 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 3305 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 3306 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 3307 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3308 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 3309 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to f2aa94df4601f692903a172b2aa609d9504a764089411efc4a365613646dde10
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch unihash changed to ec0a8758b6bb7b53d648565d9291e391142b69dd3997d4f0dca088443bf7cef8
NOTE: Setscene tasks completed
NOTE: Running task 3310 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 3311 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 3313 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3314 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to 320cb02f04a780e791e49555187db89d107c99f7118cc58a8fcdefe0f7b33590
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 3315 of 3322 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3315 tasks of which 3302 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261121051740.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261121051740.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.859462
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+ea09098d71-r0 to 2:0.0+git0+616da16f25-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+ea09098d71-r0 to 2:0.0+git0+616da16f25-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+ea09098d71-r0 to 2:0.0+git0+616da16f25-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+ea09098d71-r0 to 2:0.0+git0+616da16f25-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+ea09098d71-r0 to 2:0.0+git0+616da16f25-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+ea09098d71-r0 to 2:0.0+git0+616da16f25-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+ea09098d71-r0 to 2:0.0+git0+616da16f25-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.859462
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============5730479182693052166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAwZjg1YmZhMTFhZDlkMDJmOGVkMzc3YzMzMmQ2MGE1ODI3Y2Y1YzNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjEgTm92IDIwMjYgMDU6MTk6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKTWluZXM6IGFkZCBhIHVzZXIgcHJl
ZmVyZW5jZSBmb3IgcXVlc3Rpb24gbWFya3MuCi0tLQogbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxl
cy9wdXp6bGVzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6
emxlc19naXQuYmIgYi9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCmlu
ZGV4IGQ3MDdjZGIwYzIuLmI4ZDFmYTQ4ODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9w
dXp6bGVzX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBAQCBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMg
PSAieDExIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXQudGFydGFydXMub3JnL3NpbW9uL3B1enpsZXMu
Z2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzIgogCiBVUFNUUkVBTV9DSEVDS19DT01NSVRT
ID0gIjEiCi1TUkNSRVYgPSAiZWEwOTA5OGQ3MWRiOTQ5MzUxNDM3ZWJhMTkyMDAzM2QzYTA4ZjQ5
MSIKK1NSQ1JFViA9ICI2MTZkYTE2ZjI1ZGE0MjhjY2RhODA1NTM2MjA5MDk1YmQwNjI2NzZlIgog
UEUgPSAiMiIKIFBWID0gIjAuMCtnaXQiCiAKLS0gCjIuNDcuMQoK

--===============5730479182693052166==--
