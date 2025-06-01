Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EE4C71130
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.27789.1748786127732932181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H5zQ89ax;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=capgyGov;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101972bc6a0aa-1614eed3-7146-4201-bf81-830d3353a4e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+AhGBYsxEodtpdokoKuJypqXu3Qe5NSVfJ3t2cIRyrI=;
	b=H5zQ89axrnWFn72tRnJ5nBo0cLZE2pqbIAly91sL8MM1cuECRO+dqEr3lH3aniKS
	UZ9ZRXmSwW8aOG7ElrZuu0V9oThFyahfDBbOxizBawyRTVsNonWtfIR69QHnDjy6wBE
	exGN5+IJyX0kkMR4oS/dEadH8hOw5jLXBS01XCGk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+AhGBYsxEodtpdokoKuJypqXu3Qe5NSVfJ3t2cIRyrI=;
	b=capgyGov20H8iBna3/JYbrrQ4Bs3GYrbG6Ec5Fs++gUy7FLS2VmK0Fc/1AvP9yPf
	RDmZkxj0ua4/sh3BQdVzpRbiNT+sZzorcqOGkVyCR21HZDGqm9VNKir3UO/p/yE/f4Q
	uBt0wVfpttKXP6A42Jt9ipA7ZJGgBTpjkyVVFhmg=
Content-Type: multipart/mixed; boundary="===============6808656983336577824=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssh: upgrading to 10.0p2 FAILED
Message-ID: <010101972bc6a0aa-1614eed3-7146-4201-bf81-830d3353a4e2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217576

--===============6808656983336577824==
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
From 9c327236b59b4b3976133b175146d178744ef308 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 08:12:33 +0000
Subject: [PATCH] openssh: upgrade 10.0p1 -> 10.0p2

---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 ...1-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 2 +-
 .../openssh/{openssh_10.0p1.bb => openssh_10.0p2.bb}            | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.0p1.bb => openssh_10.0p2.bb} (100%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..5c7b217125 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From 9c2026b581c7f7cde8190de354916124508c23b6 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index 360b62af34..6844a3b2d0 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From 9dcccafe44ea17e972e7cddea205bbe9fe71d8d6 Mon Sep 17 00:00:00 2001
+From 4bfbb5dbf42df867b399a0e9bd1d3503249afa29 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <jose.quaresma@foundries.io>
 Date: Mon, 15 Jul 2024 18:43:08 +0100
 Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
diff --git a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb b/meta/recipes-connectivity/openssh/openssh_10.0p2.bb
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh_10.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.0p2.bb
-- 
2.47.1


--===============6808656983336577824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:deb8eac0cd177711c88beb7aac6eda0f91f027ae"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 277 Local 265 Mirrors 0 Missed 12 Current 344 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1183 of 1742 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_recipe_qa)
NOTE: recipe openssh-10.0p2-r0: task do_recipe_qa: Started
NOTE: recipe openssh-10.0p2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1720 of 1742 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_fetch)
NOTE: recipe openssh-10.0p2-r0: task do_fetch: Started
NOTE: recipe openssh-10.0p2-r0: task do_fetch: Succeeded
NOTE: Running task 1721 of 1742 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_unpack)
NOTE: Running task 1722 of 1742 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssh-10.0p2-r0: task do_unpack: Started
NOTE: recipe openssh-10.0p2-r0: task do_prepare_recipe_sysroot: Started
WARNING: openssh-10.0p2-r0 do_unpack: openssh: the directory ${WORKDIR}/${BP} (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/openssh-10.0p2) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: recipe openssh-10.0p2-r0: task do_unpack: Succeeded
NOTE: Running task 1723 of 1742 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_patch)
NOTE: Running task 1724 of 1742 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_collect_spdx_deps)
NOTE: recipe openssh-10.0p2-r0: task do_patch: Started
NOTE: recipe openssh-10.0p2-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssh-10.0p2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssh-10.0p2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssh-10.0p2-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1724 tasks of which 1718 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601081221.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601081221.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/temp/log.do_patch.3344162
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: openssh-10.0p2-r0 do_patch: Applying patch '0001-regress-banner.sh-log-input-and-output-files-on-erro.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/openssh-10.0p2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
can't find file to patch at input line 49
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 9c2026b581c7f7cde8190de354916124508c23b6 Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/openssh/10.0p2/temp/log.do_patch.3344162
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssh/openssh_10.0p2.bb:do_patch) failed with exit code '1'

--===============6808656983336577824==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.0p1-10.0p2.patch"

RnJvbSA5YzMyNzIzNmI1OWI0YjM5NzYxMzNiMTc1MTQ2ZDE3ODc0NGVmMzA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwODoxMjozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2g6IHVwZ3JhZGUgMTAuMHAxIC0+IDEwLjBwMgoKLS0tCiAuLi4xLXJlZ3Jlc3MtYmFubmVy
LnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggfCAyICstCiAuLi4x
LXJlZ3Jlc3MtdGVzdC1leGVjLXVzZS10aGUtYWJzb2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0
Y2ggfCAyICstCiAuLi4vb3BlbnNzaC97b3BlbnNzaF8xMC4wcDEuYmIgPT4gb3BlbnNzaF8xMC4w
cDIuYmJ9ICAgICAgICAgICAgfCAwCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gv
e29wZW5zc2hfMTAuMHAxLmJiID0+IG9wZW5zc2hfMTAuMHAyLmJifSAoMTAwJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jl
c3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtYmFu
bmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKaW5kZXggZjQy
NDI4OGUzNy4uNWM3YjIxNzEyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91
dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRw
dXQtZmlsZXMtb24tZXJyby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWNjODk3ZmUyZWZm
ZTU0OWUxZTI4MGMyZjYwNmJjZThiNTMyYjYxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOWMyMDI2YjU4MWM3ZjdjZGU4MTkwZGUzNTQ5MTYxMjQ1MDhjMjNiNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IE1pa2tvIFJhcGVsaSA8bWlra28ucmFwZWxpQGxpbmFyby5vcmc+
CiBEYXRlOiBNb24sIDExIFNlcCAyMDIzIDA5OjU1OjIxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHJlZ3Jlc3MvYmFubmVyLnNoOiBsb2cgaW5wdXQgYW5kIG91dHB1dCBmaWxlcyBvbiBlcnJvcgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAw
MS1yZWdyZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdy
ZXNzLXRlc3QtZXhlYy11c2UtdGhlLWFic29sdXRlLXBhdGgtaW4tdGhlLVNTSC1lLnBhdGNoCmlu
ZGV4IDM2MGI2MmFmMzQuLjY4NDRhM2IyZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVncmVzcy10ZXN0LWV4ZWMtdXNlLXRoZS1h
YnNvbHV0ZS1wYXRoLWluLXRoZS1TU0gtZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jlc3MtdGVzdC1leGVjLXVzZS10aGUtYWJz
b2x1dGUtcGF0aC1pbi10aGUtU1NILWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlkY2Nj
YWZlNDRlYTE3ZTk3MmU3Y2RkZWEyMDViYmU5ZmU3MWQ4ZDYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDRiZmJiNWRiZjQyZGY4NjdiMzk5YTBlOWJkMWQzNTAzMjQ5YWZhMjkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxqb3NlLnF1YXJlc21hQGZv
dW5kcmllcy5pbz4KIERhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6NDM6MDggKzAxMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gcmVncmVzcy90ZXN0LWV4ZWM6IHVzZSB0aGUgYWJzb2x1dGUgcGF0aCBpbiB0
aGUgU1NIIGVudgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3No
L29wZW5zc2hfMTAuMHAxLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29w
ZW5zc2hfMTAuMHAyLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC4wcDEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjBwMi5iYgotLSAKMi40
Ny4xCgo=

--===============6808656983336577824==--

