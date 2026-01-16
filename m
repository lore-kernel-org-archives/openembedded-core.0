Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E88ED47CD3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1472.1768526746499768659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zFHQjTqB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dh4+dFZx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc468b796-04379845-a10f-4976-83df-27964902a662-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6zmlI52hMemTPTz6Jqg674H0b83jm/Q3SLNirOtJ0n8=;
	b=zFHQjTqBVt6xPlrWZrl3vD6cArQ9BBXHgdRA2/yjBLHwT0DyxaxbC8km4Yo2QEK3
	SNN8LuFhOFMv/YQJzwNelN1LbjxAA7p8Na87sp7tM16iqQxgXcc8obAjmcIwiR4OMHU
	2AXUNNaIeLImstjD8Mz9o+Jslw1oQ7vIoHPRxya0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6zmlI52hMemTPTz6Jqg674H0b83jm/Q3SLNirOtJ0n8=;
	b=dh4+dFZxYEuXkYH4JliLWMcDrjJuGbi0ioCNQD4FNcL4xDWR+dCw5KXTIhV6dDnJ
	xpt2eLS+hx+Z3w6Yo44i5QEqd4PPnSkyxR1CmSF/aM832IxC5qppgvuIrXY2CVA3Wd5
	NwuRtGsTyrro5Sd9SeOWfE0rGquZgifdmRi13hig=
Content-Type: multipart/mixed; boundary="===============1959955833478817137=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.26.10 FAILED
Message-ID: <0101019bc468b796-04379845-a10f-4976-83df-27964902a662-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229498

--===============1959955833478817137==
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
From 35f0edc49a88eccd7b954050e155dacc041e6499 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:30:18 +0000
Subject: [PATCH] gst-examples: upgrade 1.26.9 -> 1.26.10

---
 ...001-Make-player-examples-installable.patch | 25 +++++++++----------
 ...ples_1.26.9.bb => gst-examples_1.26.10.bb} |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.9.bb => gst-examples_1.26.10.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e12ca0b613..6b47ed28fb 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From 783f6f6904f408f87f29c88172c5729669619b02 Mon Sep 17 00:00:00 2001
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


--===============1959955833478817137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-11e3e5e664a315456b93bc46036f5ff7f9f15240"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:11e3e5e664a315456b93bc46036f5ff7f9f15240"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 413 Local 401 Mirrors 0 Missed 12 Current 1179 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1592 of 1592 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_recipe_qa_setscene)
NOTE: recipe gst-examples-1.26.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3816 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_fetch)
NOTE: recipe gst-examples-1.26.10-r0: task do_fetch: Started
NOTE: Running task 4114 of 4313 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_write_config)
NOTE: recipe gst-examples-1.26.10-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.26.10-r0: task do_write_config: Succeeded
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
NOTE: Tasks Summary: Attempted 4298 tasks of which 4292 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260116003003.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260116003003.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/temp/log.do_patch.2851669
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.26.10-r0 do_patch: Applying patch '0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/sources/gst-examples-1.26.10/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 783f6f6904f408f87f29c88172c5729669619b02 Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.10/temp/log.do_patch.2851669
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.10.bb:do_patch) failed with exit code '1'

--===============1959955833478817137==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.26.9-1.26.10.patch"

RnJvbSAzNWYwZWRjNDlhODhlY2NkN2I5NTQwNTBlMTU1ZGFjYzA0MWU2NDk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MzA6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZXhhbXBsZXM6IHVwZ3JhZGUgMS4yNi45IC0+IDEuMjYuMTAKCi0tLQogLi4uMDAxLU1ha2Ut
cGxheWVyLWV4YW1wbGVzLWluc3RhbGxhYmxlLnBhdGNoIHwgMjUgKysrKysrKysrLS0tLS0tLS0t
LQogLi4ucGxlc18xLjI2LjkuYmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjYuMTAuYmJ9IHwgIDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3QtZXhhbXBsZXNfMS4yNi45
LmJiID0+IGdzdC1leGFtcGxlc18xLjI2LjEwLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXll
ci1leGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1leGFtcGxlcy1pbnN0YWxsYWJs
ZS5wYXRjaAppbmRleCBlMTJjYTBiNjEzLi42YjQ3ZWQyOGZiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXIt
ZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4YW1wbGVzLWluc3RhbGxh
YmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3OTI0MDE2ZmNlMmQwYjQzNTg5MWEzMzVj
ZGFlNTJmYzkzOWM3ZTNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ODNmNmY2OTA0
ZjQwOGY4N2YyOWM4ODE3MmM1NzI5NjY5NjE5YjAyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIERhdGU6IFRo
dSwgMTcgQXVnIDIwMTcgMTE6MDc6MDIgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBwbGF5
ZXIgZXhhbXBsZXMgaW5zdGFsbGFibGUKQEAgLTcsMTYgKzcsMTUgQEAgU2lnbmVkLW9mZi1ieTog
SnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIFVwc3RyZWFtLVN0YXR1
czogRGVuaWVkIFtVcHN0cmVhbSBjb25zaWRlcnMgdGhlc2UgY29kZSBleGFtcGxlcywgZm9yIG5v
dyBhIGxlYXN0XQogCiBodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
Nzc3ODI3Ci0KIC0tLQotIHBsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZCB8IDEg
KwotIHBsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQgICAgICB8IDEgKworIHN1YnByb2pl
Y3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgfCAx
ICsKKyBzdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5i
dWlsZCAgICAgIHwgMSArCiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAotSW5k
ZXg6IGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKLT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KLS0tLSBnc3QtZXhhbXBsZXMub3JpZy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkv
bWVzb24uYnVpbGQKLSsrKyBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21l
c29uLmJ1aWxkCitkaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNr
L3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZCBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9w
bGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKK2luZGV4IDVlODBjYThkZDQuLjEy
OWU1YmRjYmUgMTAwNjQ0CistLS0gYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2sv
cGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCisrKysgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBs
ZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCiBAQCAtMiw1ICsyLDYgQEAg
ZXhlY3V0YWJsZSgnZ3N0LXBsYXknLAogICAgICBbJ2dzdC1wbGF5LmMnLAogICAgICAgJ2dzdC1w
bGF5LWtiLmMnLApAQCAtMjQsMTEgKzIzLDExIEBAIEluZGV4OiBnc3QtZXhhbXBsZXMvcGxheWJh
Y2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCiArICAgIGluc3RhbGw6IHRydWUsCiAgICAg
IGRlcGVuZGVuY2llcyA6IFtnc3RfZGVwLCBkZXBlbmRlbmN5KCdnc3RyZWFtZXItcGxheS0xLjAn
KSwgbV9kZXBdKQogIAotSW5kZXg6IGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21l
c29uLmJ1aWxkCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gZ3N0LWV4YW1wbGVzLm9yaWcvcGxheWJhY2svcGxh
eWVyL2d0ay9tZXNvbi5idWlsZAotKysrIGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3Rr
L21lc29uLmJ1aWxkCi1AQCAtMjAsNSArMjAsNiBAQCBpZiBndGtfZGVwLmZvdW5kKCkKK2RpZmYg
LS1naXQgYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNv
bi5idWlsZCBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21l
c29uLmJ1aWxkCitpbmRleCA2ODkyZjE1MjU0Li4yMGQ3NTA1ODc3IDEwMDY0NAorLS0tIGEvc3Vi
cHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQKKysr
KyBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29uLmJ1
aWxkCitAQCAtMjEsNSArMjEsNiBAQCBpZiBndGtfZGVwLmZvdW5kKCkKICAgICAgICAgJ2d0ay12
aWRlby1yZW5kZXJlci5oJywKICAgICAgICAgJ2d0ay12aWRlby1yZW5kZXJlci5jJ10sCiAgICAg
ICAgY19hcmdzIDogIGV4dHJhX2NfYXJncywKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXNfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI2LjEwLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Qt
ZXhhbXBsZXNfMS4yNi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0LWV4YW1wbGVzXzEuMjYuMTAuYmIKaW5kZXggZmViZmQ2NzM2Zi4uYzcwYzViMzJi
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFt
cGxlc18xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dC1leGFtcGxlc18xLjI2LjEwLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0cmVhbWVyLmdpdDtwcm90b2NvbD1o
dHRwcztiCiAgICAgICAgICAgIGZpbGU6Ly9nc3QtcGxheWVyLmRlc2t0b3AgXAogICAgICAgICAg
ICAiCiAKLVNSQ1JFViA9ICJmMzEzZmFlMTkzMDg5NDA4ZTI3OGMwZGQzNDUwMTQ1ZTVhMTIzMDdi
IgorU1JDUkVWID0gImJmZGM2MjE4NWUyNDNkMzYzM2FhOTE2MTg3YTU2NmQwM2E1ODc3OTIiCiAK
IFMgPSAiJHtVTlBBQ0tESVJ9LyR7QlB9L3N1YnByb2plY3RzL2dzdC1leGFtcGxlcyIKIAotLSAK
Mi40Ny4xCgo=

--===============1959955833478817137==--

