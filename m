Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C35CEEE276
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102972.1767267475144214666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hdBIFqL1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nDcbxgkp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b7959b68a-c3987ff5-1478-4a3e-871e-c0828907ef66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w1l9UlDeLjsWRbXhTUVQ+JJhsZ7neb4rALvQpV0ZYxs=;
	b=hdBIFqL1+N4MGCfA9lG3XYwcx32WjxQvGBKU4ss6dllBbe/+0W6NLyER6uuA/i9/
	rcrIvOosHEkulRNAjOrERViiBefuG0CoOJ41NjnJ2AXmsskYB0lsZVd3BtTUrC2LWv/
	JTrBfuoqpRUJTnduV+/ZoiGxgYc9Y0Dc6GA6PJKs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w1l9UlDeLjsWRbXhTUVQ+JJhsZ7neb4rALvQpV0ZYxs=;
	b=nDcbxgkpEKEYXNveubN5/Pwvu2eRTNp10z8mFDU/LxpPzr6RuPdBWqant5zsfoKt
	WO2IYQO/O3gNt1gA472XEw4meVYTjwCdS59GM2hpZjsxi3WKO5pGQa/21Ncua/rkNFT
	hI6eLIQyGG1KX/AwF/ELkbFkwZoKMoUF9CjdleKg=
Content-Type: multipart/mixed; boundary="===============5451264959060991295=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.26.10 FAILED
Message-ID: <0101019b7959b68a-c3987ff5-1478-4a3e-871e-c0828907ef66-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228801

--===============5451264959060991295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.26.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.26.9-1.26.10.patch
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
From b07646dac1e8b373149c7f1eceeded1aedc17c70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 10:58:38 +0000
Subject: [PATCH] gst-examples: upgrade 1.26.9 -> 1.26.10

---
 ...001-Make-player-examples-installable.patch | 25 +++++++++----------
 ...ples_1.26.9.bb => gst-examples_1.26.10.bb} |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.9.bb => gst-examples_1.26.10.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e12ca0b613..2bb2de9d0e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From 33474c0340b061b9c7dfff8c64bc7b8bdb8636b1 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -7,16 +7,15 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Denied [Upstream considers these code examples, for now a least]
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
-
 ---
- playback/player/gst-play/meson.build | 1 +
- playback/player/gtk/meson.build      | 1 +
+ subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
+ subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
-Index: gst-examples/playback/player/gst-play/meson.build
-===================================================================
---- gst-examples.orig/playback/player/gst-play/meson.build
-+++ gst-examples/playback/player/gst-play/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
+index 5e80ca8dd4..129e5bdcbe 100644
+--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
++++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
@@ -24,11 +23,11 @@ Index: gst-examples/playback/player/gst-play/meson.build
 +    install: true,
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-Index: gst-examples/playback/player/gtk/meson.build
-===================================================================
---- gst-examples.orig/playback/player/gtk/meson.build
-+++ gst-examples/playback/player/gtk/meson.build
-@@ -20,5 +20,6 @@ if gtk_dep.found()
+diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
+index 6892f15254..20d7505877 100644
+--- a/subprojects/gst-examples/playback/player/gtk/meson.build
++++ b/subprojects/gst-examples/playback/player/gtk/meson.build
+@@ -21,5 +21,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
        c_args :  extra_c_args,
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb
index febfd6736f..c70c5b32b8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "f313fae193089408e278c0dd3450145e5a12307b"
+SRCREV = "bfdc62185e243d3633aa916187a566d03a587792"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.47.1


--===============5451264959060991295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-8432349c672f0762da54e5b7099e2a3ec21082c0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8432349c672f0762da54e5b7099e2a3ec21082c0"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 425 Local 412 Mirrors 0 Missed 13 Current 1167 (96% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3813 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_recipe_qa)
NOTE: Running task 4113 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_write_config)
NOTE: recipe gst-examples-1.26.10-r0: task do_recipe_qa: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.26.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4294 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_fetch)
NOTE: recipe gst-examples-1.26.10-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_fetch: Succeeded
NOTE: Running task 4295 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_unpack)
NOTE: Running task 4296 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.26.10-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.26.10-r0: task do_unpack: Succeeded
NOTE: Running task 4297 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_patch)
NOTE: Running task 4298 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_collect_spdx_deps)
NOTE: recipe gst-examples-1.26.10-r0: task do_patch: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-examples-1.26.10-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4298 tasks of which 4291 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101105823.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101105823.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/temp/log.do_patch.1854544
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.26.10-r0 do_patch: Applying patch '0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/sources/gst-examples-1.26.10/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 33474c0340b061b9c7dfff8c64bc7b8bdb8636b1 Mon Sep 17 00:00:00 2001
|From: Jussi Kukkonen <jussi.kukkonen@intel.com>
|Date: Thu, 17 Aug 2017 11:07:02 +0300
|Subject: [PATCH] Make player examples installable
|
|Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
|Upstream-Status: Denied [Upstream considers these code examples, for now a least]
|
|https://bugzilla.gnome.org/show_bug.cgi?id=777827
|---
| subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
| subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
| 2 files changed, 2 insertions(+)
|
|diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
|index 5e80ca8dd4..129e5bdcbe 100644
|--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
|+++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 30
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
|index 6892f15254..20d7505877 100644
|--- a/subprojects/gst-examples/playback/player/gtk/meson.build
|+++ b/subprojects/gst-examples/playback/player/gtk/meson.build
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-Make-player-examples-installable.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/temp/log.do_patch.1854544
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_patch) failed with exit code '1'

--===============5451264959060991295==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.26.9-1.26.10.patch"

RnJvbSBiMDc2NDZkYWMxZThiMzczMTQ5YzdmMWVjZWVkZWQxYWVkYzE3YzcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMDo1ODozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1leGFtcGxlczogdXBncmFkZSAxLjI2LjkgLT4gMS4yNi4xMAoKLS0tCiAuLi4wMDEtTWFrZS1w
bGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2ggfCAyNSArKysrKysrKystLS0tLS0tLS0t
CiAuLi5wbGVzXzEuMjYuOS5iYiA9PiBnc3QtZXhhbXBsZXNfMS4yNi4xMC5iYn0gfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1leGFtcGxlc18xLjI2Ljku
YmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjYuMTAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVy
LWV4YW1wbGVzLWluc3RhbGxhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4YW1wbGVzLWluc3RhbGxhYmxl
LnBhdGNoCmluZGV4IGUxMmNhMGI2MTMuLjJiYjJkZTlkMGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1l
eGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFi
bGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc5MjQwMTZmY2UyZDBiNDM1ODkxYTMzNWNk
YWU1MmZjOTM5YzdlM2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDMzNDc0YzAzNDBi
MDYxYjljN2RmZmY4YzY0YmM3YjhiZGI4NjM2YjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogRGF0ZTogVGh1
LCAxNyBBdWcgMjAxNyAxMTowNzowMiArMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIHBsYXll
ciBleGFtcGxlcyBpbnN0YWxsYWJsZQpAQCAtNywxNiArNywxNSBAQCBTaWduZWQtb2ZmLWJ5OiBK
dXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPgogVXBzdHJlYW0tU3RhdHVz
OiBEZW5pZWQgW1Vwc3RyZWFtIGNvbnNpZGVycyB0aGVzZSBjb2RlIGV4YW1wbGVzLCBmb3Igbm93
IGEgbGVhc3RdCiAKIGh0dHBzOi8vYnVnemlsbGEuZ25vbWUub3JnL3Nob3dfYnVnLmNnaT9pZD03
Nzc4MjcKLQogLS0tCi0gcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkIHwgMSAr
Ci0gcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5idWlsZCAgICAgIHwgMSArCisgc3VicHJvamVj
dHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZCB8IDEg
KworIHN1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29uLmJ1
aWxkICAgICAgfCAxICsKICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCi1JbmRl
eDogZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZAotPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQotLS0tIGdzdC1leGFtcGxlcy5vcmlnL3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9t
ZXNvbi5idWlsZAotKysrIGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVz
b24uYnVpbGQKK2RpZmYgLS1naXQgYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2sv
cGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkIGIvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3Bs
YXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZAoraW5kZXggNWU4MGNhOGRkNC4uMTI5
ZTViZGNiZSAxMDA2NDQKKy0tLSBhL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9w
bGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKKysrKyBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxl
cy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKIEBAIC0yLDUgKzIsNiBAQCBl
eGVjdXRhYmxlKCdnc3QtcGxheScsCiAgICAgIFsnZ3N0LXBsYXkuYycsCiAgICAgICAnZ3N0LXBs
YXkta2IuYycsCkBAIC0yNCwxMSArMjMsMTEgQEAgSW5kZXg6IGdzdC1leGFtcGxlcy9wbGF5YmFj
ay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKICsgICAgaW5zdGFsbDogdHJ1ZSwKICAgICAg
ZGVwZW5kZW5jaWVzIDogW2dzdF9kZXAsIGRlcGVuZGVuY3koJ2dzdHJlYW1lci1wbGF5LTEuMCcp
LCBtX2RlcF0pCiAgCi1JbmRleDogZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVz
b24uYnVpbGQKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KLS0tLSBnc3QtZXhhbXBsZXMub3JpZy9wbGF5YmFjay9wbGF5
ZXIvZ3RrL21lc29uLmJ1aWxkCi0rKysgZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsv
bWVzb24uYnVpbGQKLUBAIC0yMCw1ICsyMCw2IEBAIGlmIGd0a19kZXAuZm91bmQoKQorZGlmZiAt
LWdpdCBhL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29u
LmJ1aWxkIGIvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVz
b24uYnVpbGQKK2luZGV4IDY4OTJmMTUyNTQuLjIwZDc1MDU4NzcgMTAwNjQ0CistLS0gYS9zdWJw
cm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5idWlsZAorKysr
IGIvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVp
bGQKK0BAIC0yMSw1ICsyMSw2IEBAIGlmIGd0a19kZXAuZm91bmQoKQogICAgICAgICAnZ3RrLXZp
ZGVvLXJlbmRlcmVyLmgnLAogICAgICAgICAnZ3RrLXZpZGVvLXJlbmRlcmVyLmMnXSwKICAgICAg
ICBjX2FyZ3MgOiAgZXh0cmFfY19hcmdzLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzXzEuMjYuMTAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1l
eGFtcGxlc18xLjI2LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3QtZXhhbXBsZXNfMS4yNi4xMC5iYgppbmRleCBmZWJmZDY3MzZmLi5jNzBjNWIzMmI4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1w
bGVzXzEuMjYuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
LWV4YW1wbGVzXzEuMjYuMTAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIuZ2l0O3Byb3RvY29sPWh0
dHBzO2IKICAgICAgICAgICAgZmlsZTovL2dzdC1wbGF5ZXIuZGVza3RvcCBcCiAgICAgICAgICAg
ICIKIAotU1JDUkVWID0gImYzMTNmYWUxOTMwODk0MDhlMjc4YzBkZDM0NTAxNDVlNWExMjMwN2Ii
CitTUkNSRVYgPSAiYmZkYzYyMTg1ZTI0M2QzNjMzYWE5MTYxODdhNTY2ZDAzYTU4Nzc5MiIKIAog
UyA9ICIke1VOUEFDS0RJUn0vJHtCUH0vc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzIgogCi0tIAoy
LjQ3LjEKCg==

--===============5451264959060991295==--

