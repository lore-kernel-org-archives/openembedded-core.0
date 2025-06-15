Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1C4C83010
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8889.1749993282768626427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IuPBqi/0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KQa1MGxX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019773ba59a0-67cd6f38-0ee7-42d6-a51d-368d6176b928-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=swC/X/PRuHUyE6XgjNVWhYrcNaITctlK9qfvefQ0pag=;
	b=IuPBqi/0jZt7Jv1eWho8tFPYicBXynFfRiNrwrK1OToLnIzQ5q4b8pG78ItTkWAC
	wZjWu9rGqMkG2jF8Z9U7bLptB8WuPT3AIqt2+k7xSsiqO96NFAnPHctlw1+Cgm9w7Zm
	iAiPiqhMzJi4eRkyHqD+Tx2J5Xjl08HefO/mv3oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=swC/X/PRuHUyE6XgjNVWhYrcNaITctlK9qfvefQ0pag=;
	b=KQa1MGxXpKiHedUiOX0K/tTrga/ylluSvB4nPDGyT/CryByFE4Q9Xy32gQtaB+IR
	XholPUsC/ooVxAEvIILXlMwXMebK4cL96wQd+iy0MPQsVj2zfYooevSxPVIiDJj2O11
	QBvUI3EmLwYEFbwPU+LWXzBtUK5tthJLbQoQp6lo=
Content-Type: multipart/mixed; boundary="===============2028734711479198382=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssh: upgrading to 10.0p2 FAILED
Message-ID: <0101019773ba59a0-67cd6f38-0ee7-42d6-a51d-368d6176b928-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218662

--===============2028734711479198382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.0p2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-openssh-upgrade-10.0p1-10.0p2.patch
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
From 3949e052eb77de7bce0908fccd92466c249b2843 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 07:13:22 +0000
Subject: [PATCH] openssh: upgrade 10.0p1 -> 10.0p2

---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 ...1-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 2 +-
 .../openssh/{openssh_10.0p1.bb => openssh_10.0p2.bb}            | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.0p1.bb => openssh_10.0p2.bb} (100%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..b3dd7424d4 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From 2a7fad489ad16839fb424e62c346d6e4cd7c67fb Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index 360b62af34..679b6a8c85 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From 9dcccafe44ea17e972e7cddea205bbe9fe71d8d6 Mon Sep 17 00:00:00 2001
+From 9cfb6a96da39254f4d6d7428190db9fd1885c5fa Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <jose.quaresma@foundries.io>
 Date: Mon, 15 Jul 2024 18:43:08 +0100
 Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
diff --git a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb b/meta/recipes-connectivity/openssh/openssh_10.0p2.bb
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh_10.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.0p2.bb
-- 
2.47.1


--===============2028734711479198382==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.0p1-10.0p2.patch"

RnJvbSAzOTQ5ZTA1MmViNzdkZTdiY2UwOTA4ZmNjZDkyNDY2YzI0OWIyODQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDc6MTM6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NoOiB1cGdyYWRlIDEwLjBwMSAtPiAxMC4wcDIKCi0tLQogLi4uMS1yZWdyZXNzLWJhbm5l
ci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIHwgMiArLQogLi4u
MS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBh
dGNoIHwgMiArLQogLi4uL29wZW5zc2gve29wZW5zc2hfMTAuMHAxLmJiID0+IG9wZW5zc2hfMTAu
MHAyLmJifSAgICAgICAgICAgIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L3tvcGVuc3NoXzEwLjBwMS5iYiA9PiBvcGVuc3NoXzEwLjBwMi5iYn0gKDEwMCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdy
ZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJh
bm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoCmluZGV4IGY0
MjQyODhlMzcuLmIzZGQ3NDI0ZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1v
dXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0
cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVjYzg5N2ZlMmVm
ZmU1NDllMWUyODBjMmY2MDZiY2U4YjUzMmI2MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDJhN2ZhZDQ4OWFkMTY4MzlmYjQyNGU2MmMzNDZkNmU0Y2Q3YzY3ZmIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5hcm8ub3Jn
PgogRGF0ZTogTW9uLCAxMSBTZXAgMjAyMyAwOTo1NToyMSArMDEwMAogU3ViamVjdDogW1BBVENI
XSByZWdyZXNzL2Jhbm5lci5zaDogbG9nIGlucHV0IGFuZCBvdXRwdXQgZmlsZXMgb24gZXJyb3IK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAw
MDEtcmVncmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVn
cmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1hYnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRjaApp
bmRleCAzNjBiNjJhZjM0Li42NzliNmE4Yzg1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtdGVzdC1leGVjLXVzZS10aGUt
YWJzb2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFi
c29sdXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZGNj
Y2FmZTQ0ZWExN2U5NzJlN2NkZGVhMjA1YmJlOWZlNzFkOGQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA5Y2ZiNmE5NmRhMzkyNTRmNGQ2ZDc0MjgxOTBkYjlmZDE4ODVjNWZhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBm
b3VuZHJpZXMuaW8+CiBEYXRlOiBNb24sIDE1IEp1bCAyMDI0IDE4OjQzOjA4ICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHJlZ3Jlc3MvdGVzdC1leGVjOiB1c2UgdGhlIGFic29sdXRlIHBhdGggaW4g
dGhlIFNTSCBlbnYKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoXzEwLjBwMS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9v
cGVuc3NoXzEwLjBwMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuMHAxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4wcDIuYmIKLS0gCjIu
NDcuMQoK

--===============2028734711479198382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1911 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:0ffc4ea21e88d41d96ebcba23ed252d98a27ac60"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 260 Local 248 Mirrors 0 Missed 12 Current 343 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1159 of 1694 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_recipe_qa)
NOTE: recipe openssh-10.0p2-r0: task do_recipe_qa: Started
NOTE: recipe openssh-10.0p2-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_recipe_qa unihash changed to b09c20e3ab2d0f7e4eda4e5ffa73e0c5fb9e20f74a77441b189987769b1fbd77
NOTE: Setscene tasks completed
NOTE: Running task 1655 of 1694 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_fetch)
NOTE: recipe openssh-10.0p2-r0: task do_fetch: Started
NOTE: recipe openssh-10.0p2-r0: task do_fetch: Succeeded
NOTE: Running task 1673 of 1694 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_unpack)
NOTE: Running task 1674 of 1694 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-10.0p2-r0: task do_unpack: Started
NOTE: recipe openssh-10.0p2-r0: task do_prepare_recipe_sysroot: Started
WARNING: openssh-10.0p2-r0 do_unpack: openssh: the directory ${WORKDIR}/${BP} (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/openssh-10.0p2) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: recipe openssh-10.0p2-r0: task do_unpack: Succeeded
NOTE: Running task 1675 of 1694 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_patch)
NOTE: Running task 1676 of 1694 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_collect_spdx_deps)
NOTE: recipe openssh-10.0p2-r0: task do_patch: Started
NOTE: recipe openssh-10.0p2-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssh-10.0p2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssh-10.0p2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssh-10.0p2-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1676 tasks of which 1670 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615071309.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615071309.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/temp/log.do_patch.382382
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: openssh-10.0p2-r0 do_patch: Applying patch '0001-regress-banner.sh-log-input-and-output-files-on-erro.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/openssh-10.0p2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
can't find file to patch at input line 49
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 2a7fad489ad16839fb424e62c346d6e4cd7c67fb Mon Sep 17 00:00:00 2001
|From: Mikko Rapeli <mikko.rapeli@linaro.org>
|Date: Mon, 11 Sep 2023 09:55:21 +0100
|Subject: [PATCH] regress/banner.sh: log input and output files on error
|
|Some test environments like yocto with qemu are seeing these
|tests failing. There may be additional error messages in the
|stderr of ssh cloent command. busybox cmp shows this error when
|first input file has less new line characters then second
|input file:
|
|cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
|
|Logging the full banner.out will show what other error messages
|are captured in addition of the expected banner.
|
|Full log of a failing banner test runs is:
|
|run test banner.sh ...
|test banner: missing banner file
|test banner: size 0
|cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
|banner size 0 mismatch
|test banner: size 10
|test banner: size 100
|cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
|banner size 100 mismatch
|test banner: size 1000
|test banner: size 10000
|test banner: size 100000
|test banner: suppress banner (-q)
|FAIL:  banner
|return value: 1
|
|See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
|
|Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
|
|Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
|Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
|---
| regress/banner.sh | 4 +++-
| 1 file changed, 3 insertions(+), 1 deletion(-)
|
|diff --git a/regress/banner.sh b/regress/banner.sh
|index a84feb5..de84957 100644
|--- a/regress/banner.sh
|+++ b/regress/banner.sh
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/temp/log.do_patch.382382
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_patch) failed with exit code '1'

--===============2028734711479198382==--

