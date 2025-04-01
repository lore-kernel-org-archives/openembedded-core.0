Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B764C369D2
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18047.1743511393838442158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Z19DIGqe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Nuymkkbe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f160dc7a-ad8bf735-9d48-4405-906f-e965d2543c50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mwRt56MezpLCw9+DWJXbjmAvdP0pQCyUp0uhvnOX+K0=;
	b=Z19DIGqeS4wbJQy6UQSAz0NfGYw/GFZlAKpl9rnxtuCeNTXWSImYjhAkMQdRSDnv
	0AEU8fxZy/0xpvpPnPYfYNGPCTaz6AWMIcqh9qlQPeOeERBtXc49l2YF1UT2cVSiHw8
	QMhpP6ghclfEnrgnvQQ4aMqiBcW5CwqOQNPo9eDM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mwRt56MezpLCw9+DWJXbjmAvdP0pQCyUp0uhvnOX+K0=;
	b=NuymkkbepEyhcVpk1H0uZpi2lTywhREVvgkhE7atqY0GPuv0LhK7HzgTdbylS9uN
	cEQjdCQhey4lu7vSj1hN+hE0aERCugT8nNo6v/TQMtrqExV3F4CkZEfsYekKra/qt+p
	s0qxdC8+CoCzOsMBBc4fbZWlO9PKhy8Sj1hDj3CE=
Content-Type: multipart/mixed; boundary="===============8492609158311057974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bmaptool: upgrading to 3.9.0 FAILED
Message-ID: <01010195f160dc7a-ad8bf735-9d48-4405-906f-e965d2543c50-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214115

--===============8492609158311057974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bmaptool* to *3.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bmaptool-upgrade-3.8.0-3.9.0.patch
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
From 271315d1f4e8dab1bd6dbbb22327b06a18fe1829 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 12:10:49 +0000
Subject: [PATCH] bmaptool: upgrade 3.8.0 -> 3.9.0

---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
index c38f05e1a1..ec5e99916b 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -10,10 +10,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https"
-SRCREV = "2ff5750b8a3e0b36a9993c20e2ea10a07bc62085"
+SRCREV = "618a7316102f6f81faa60537503012a419eafa06"
 S = "${WORKDIR}/git"
 BASEVER = "3.8.0"
-PV = "${BASEVER}+git"
+PV = "3.9.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============8492609158311057974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1887 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8f2eaf75bcc5e8a31bff19cb9e590a97a7e09922"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 325 Local 313 Mirrors 0 Missed 12 Current 388 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1544 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_recipe_qa)
NOTE: recipe bmaptool-3.9.0-r0: task do_recipe_qa: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1984 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_fetch)
NOTE: recipe bmaptool-3.9.0-r0: task do_fetch: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_unpack)
NOTE: Running task 1986 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe bmaptool-3.9.0-r0: task do_unpack: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1987 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_patch)
NOTE: Running task 1988 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_collect_spdx_deps)
NOTE: recipe bmaptool-3.9.0-r0: task do_patch: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bmaptool-3.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1989 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1990 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_check_backend)
NOTE: Running task 1991 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_populate_lic)
NOTE: recipe bmaptool-3.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bmaptool-3.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_check_backend: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_populate_lic: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_check_backend: Succeeded
NOTE: recipe bmaptool-3.9.0-r0: task do_populate_lic: Succeeded
NOTE: recipe bmaptool-3.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1992 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_configure)
NOTE: recipe bmaptool-3.9.0-r0: task do_configure: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1993 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_compile)
NOTE: recipe bmaptool-3.9.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/git/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2545079:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2545079, line 181
| 	#2: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2545079, line 171
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2545079, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2545079, line 185
NOTE: recipe bmaptool-3.9.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1993 tasks of which 1982 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401121035.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401121035.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/log.do_compile.2545079
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: bmaptool-3.9.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: bmaptool-3.9.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2545079' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/log.do_compile.2545079
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_compile) failed with exit code '1'

--===============8492609158311057974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bmaptool-upgrade-3.8.0-3.9.0.patch"

RnJvbSAyNzEzMTVkMWY0ZThkYWIxYmQ2ZGJiYjIyMzI3YjA2YTE4ZmUxODI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMjoxMDo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJt
YXB0b29sOiB1cGdyYWRlIDMuOC4wIC0+IDMuOS4wCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2JtYXB0b29sL2JtYXB0b29sX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9ibWFwdG9vbC9ibWFwdG9vbF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ibWFw
dG9vbC9ibWFwdG9vbF9naXQuYmIKaW5kZXggYzM4ZjA1ZTFhMS4uZWM1ZTk5OTE2YiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm1hcHRvb2wvYm1hcHRvb2xfZ2l0LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2JtYXB0b29sL2JtYXB0b29sX2dpdC5iYgpAQCAtMTAsMTAg
KzEwLDEwIEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS95b2N0b3Byb2plY3QvJHtCUE59O2JyYW5jaD1tYWlu
O3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjJmZjU3NTBiOGEzZTBiMzZhOTk5M2MyMGUyZWEx
MGEwN2JjNjIwODUiCitTUkNSRVYgPSAiNjE4YTczMTYxMDJmNmY4MWZhYTYwNTM3NTAzMDEyYTQx
OWVhZmEwNiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiBCQVNFVkVSID0gIjMuOC4wIgotUFYgPSAi
JHtCQVNFVkVSfStnaXQiCitQViA9ICIzLjkuMCIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVH
RVggPSAidig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAKMi40Ny4xCgo=

--===============8492609158311057974==--

