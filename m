Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EE4CA1003
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11338.1755263228377035400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xEibmzPy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=I6ig/nT5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010198add77e90-bcc4bf0a-ea2b-48b2-8a91-ad42e64daf93-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=icH6aLmXpyUCLaOQyChbhzdxCLX1/ExOEXiabd3w3Ko=;
	b=xEibmzPyPmN95y5DUggIfCmvLYcAWaYONs8cuuoXdLyWA7ZcEBJ3VnW0A6dw24Kv
	rwcfyXQipv9pEn5wl/fxPLwG8eZWSj90h2MUmQTlUZgGCrGxcxfCvbgKcgiuDfmPeJT
	WrXiDx/n2Ume7GeUPRxq9mud40LeF1EOLNOmW+9Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=icH6aLmXpyUCLaOQyChbhzdxCLX1/ExOEXiabd3w3Ko=;
	b=I6ig/nT5BBB5HVmX1ho4NsPWoxCRmiLIn6uSngg5QgeaflHMDthg1/yHyJ3ViUI0
	V0hT2KkNaVPwEmL5sg6ujqmzQ3kRAXKAsrn9AfZWHWmWz4C3PEVXSPbn2pOrc71fl4l
	3BZ5gt3zyIMNDHmvzAT8EozDDplJ7eXrFTE3aRIk=
Content-Type: multipart/mixed; boundary="===============5862235302751082891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-examples: upgrading to 1.26.5 FAILED
Message-ID: <01010198add77e90-bcc4bf0a-ea2b-48b2-8a91-ad42e64daf93-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221947

--===============5862235302751082891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.26.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.26.3-1.26.5.patch
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
From 2413907a4fef53e3084d9c3dcf22d88810d4db95 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 11:56:52 +0000
Subject: [PATCH] gst-examples: upgrade 1.26.3 -> 1.26.5

---
 ...001-Make-player-examples-installable.patch | 23 +++++++++----------
 ...mples_1.26.3.bb => gst-examples_1.26.5.bb} |  2 +-
 2 files changed, 12 insertions(+), 13 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.3.bb => gst-examples_1.26.5.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index 828c87dc9a..6dd12a9270 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From b9757dd6200a8b974230c25741ccc541ed2f3a8a Mon Sep 17 00:00:00 2001
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
@@ -24,10 +23,10 @@ Index: gst-examples/playback/player/gst-play/meson.build
 +    install: true,
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-Index: gst-examples/playback/player/gtk/meson.build
-===================================================================
---- gst-examples.orig/playback/player/gtk/meson.build
-+++ gst-examples/playback/player/gtk/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
+index a3bd83e530..51d434f90d 100644
+--- a/subprojects/gst-examples/playback/player/gtk/meson.build
++++ b/subprojects/gst-examples/playback/player/gtk/meson.build
 @@ -20,5 +20,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
index df8fd4bd26..2fa4ef11fe 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "87bc0c6e949e3dcc440658f78ef52aa8088cb62f"
+SRCREV = "82cbccedf7946a32d28a5aaec8ebbcb627770c19"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.47.1


--===============5862235302751082891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1941 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-bb7ad0281627da119f1f266036875e426af631eb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bb7ad0281627da119f1f266036875e426af631eb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 659 Local 646 Mirrors 0 Missed 13 Current 938 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3846 of 4317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_recipe_qa)
NOTE: Running task 4117 of 4317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_write_config)
NOTE: recipe gst-examples-1.26.5-r0: task do_recipe_qa: Started
NOTE: recipe gst-examples-1.26.5-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.26.5-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.26.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4298 of 4317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_fetch)
NOTE: recipe gst-examples-1.26.5-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.26.5-r0: task do_fetch: Succeeded
NOTE: Running task 4299 of 4317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_unpack)
NOTE: Running task 4300 of 4317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.26.5-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.26.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.26.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.26.5-r0: task do_unpack: Succeeded
NOTE: Running task 4301 of 4317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_patch)
NOTE: Running task 4302 of 4317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_collect_spdx_deps)
NOTE: recipe gst-examples-1.26.5-r0: task do_patch: Started
NOTE: recipe gst-examples-1.26.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-examples-1.26.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-examples-1.26.5-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4302 tasks of which 4295 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815115638.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815115638.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.5/temp/log.do_patch.1575231
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.26.5-r0 do_patch: Applying patch '0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.5/sources/gst-examples-1.26.5/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.5/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From b9757dd6200a8b974230c25741ccc541ed2f3a8a Mon Sep 17 00:00:00 2001
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
|index a3bd83e530..51d434f90d 100644
|--- a/subprojects/gst-examples/playback/player/gtk/meson.build
|+++ b/subprojects/gst-examples/playback/player/gtk/meson.build
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-Make-player-examples-installable.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.5/temp/log.do_patch.1575231
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb:do_patch) failed with exit code '1'

--===============5862235302751082891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.26.3-1.26.5.patch"

RnJvbSAyNDEzOTA3YTRmZWY1M2UzMDg0ZDljM2RjZjIyZDg4ODEwZDRkYjk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTE6NTY6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZXhhbXBsZXM6IHVwZ3JhZGUgMS4yNi4zIC0+IDEuMjYuNQoKLS0tCiAuLi4wMDEtTWFrZS1w
bGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2ggfCAyMyArKysrKysrKystLS0tLS0tLS0t
CiAuLi5tcGxlc18xLjI2LjMuYmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjYuNS5iYn0gfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1leGFtcGxlc18xLjI2LjMu
YmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjYuNS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXIt
ZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFibGUu
cGF0Y2gKaW5kZXggODI4Yzg3ZGM5YS4uNmRkMTJhOTI3MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4
YW1wbGVzLWluc3RhbGxhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1leGFtcGxlcy1pbnN0YWxsYWJs
ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzkyNDAxNmZjZTJkMGI0MzU4OTFhMzM1Y2Rh
ZTUyZmM5MzljN2UzYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjk3NTdkZDYyMDBh
OGI5NzQyMzBjMjU3NDFjY2M1NDFlZDJmM2E4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBEYXRlOiBUaHUs
IDE3IEF1ZyAyMDE3IDExOjA3OjAyICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgcGxheWVy
IGV4YW1wbGVzIGluc3RhbGxhYmxlCkBAIC03LDE2ICs3LDE1IEBAIFNpZ25lZC1vZmYtYnk6IEp1
c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBVcHN0cmVhbS1TdGF0dXM6
IERlbmllZCBbVXBzdHJlYW0gY29uc2lkZXJzIHRoZXNlIGNvZGUgZXhhbXBsZXMsIGZvciBub3cg
YSBsZWFzdF0KIAogaHR0cHM6Ly9idWd6aWxsYS5nbm9tZS5vcmcvc2hvd19idWcuY2dpP2lkPTc3
NzgyNwotCiAtLS0KLSBwbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgfCAxICsK
LSBwbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29uLmJ1aWxkICAgICAgfCAxICsKKyBzdWJwcm9qZWN0
cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkIHwgMSAr
Cisgc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVp
bGQgICAgICB8IDEgKwogIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKLUluZGV4
OiBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCi09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci0tLS0gZ3N0LWV4YW1wbGVzLm9yaWcvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21l
c29uLmJ1aWxkCi0rKysgZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNv
bi5idWlsZAorZGlmZiAtLWdpdCBhL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9w
bGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxh
eWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCitpbmRleCA1ZTgwY2E4ZGQ0Li4xMjll
NWJkY2JlIDEwMDY0NAorLS0tIGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3Bs
YXllci9nc3QtcGxheS9tZXNvbi5idWlsZAorKysrIGIvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVz
L3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZAogQEAgLTIsNSArMiw2IEBAIGV4
ZWN1dGFibGUoJ2dzdC1wbGF5JywKICAgICAgWydnc3QtcGxheS5jJywKICAgICAgICdnc3QtcGxh
eS1rYi5jJywKQEAgLTI0LDEwICsyMywxMCBAQCBJbmRleDogZ3N0LWV4YW1wbGVzL3BsYXliYWNr
L3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZAogKyAgICBpbnN0YWxsOiB0cnVlLAogICAgICBk
ZXBlbmRlbmNpZXMgOiBbZ3N0X2RlcCwgZGVwZW5kZW5jeSgnZ3N0cmVhbWVyLXBsYXktMS4wJyks
IG1fZGVwXSkKICAKLUluZGV4OiBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNv
bi5idWlsZAotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotLS0tIGdzdC1leGFtcGxlcy5vcmlnL3BsYXliYWNrL3BsYXll
ci9ndGsvbWVzb24uYnVpbGQKLSsrKyBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9t
ZXNvbi5idWlsZAorZGlmZiAtLWdpdCBhL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFj
ay9wbGF5ZXIvZ3RrL21lc29uLmJ1aWxkIGIvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXli
YWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQKK2luZGV4IGEzYmQ4M2U1MzAuLjUxZDQzNGY5MGQg
MTAwNjQ0CistLS0gYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0
ay9tZXNvbi5idWlsZAorKysrIGIvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3Bs
YXllci9ndGsvbWVzb24uYnVpbGQKIEBAIC0yMCw1ICsyMCw2IEBAIGlmIGd0a19kZXAuZm91bmQo
KQogICAgICAgICAnZ3RrLXZpZGVvLXJlbmRlcmVyLmgnLAogICAgICAgICAnZ3RrLXZpZGVvLXJl
bmRlcmVyLmMnXSwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZXhhbXBsZXNfMS4yNi4zLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1leGFtcGxlc18xLjI2LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI2LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBs
ZXNfMS4yNi41LmJiCmluZGV4IGRmOGZkNGJkMjYuLjJmYTRlZjExZmUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXNfMS4yNi4zLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXNfMS4yNi41
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9nc3RyZWFtZXIvZ3N0cmVhbWVyLmdpdDtwcm90b2NvbD1odHRwcztiCiAgICAgICAgICAg
IGZpbGU6Ly9nc3QtcGxheWVyLmRlc2t0b3AgXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI4
N2JjMGM2ZTk0OWUzZGNjNDQwNjU4Zjc4ZWY1MmFhODA4OGNiNjJmIgorU1JDUkVWID0gIjgyY2Jj
Y2VkZjc5NDZhMzJkMjhhNWFhZWM4ZWJiY2I2Mjc3NzBjMTkiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9
LyR7QlB9L3N1YnByb2plY3RzL2dzdC1leGFtcGxlcyIKIAotLSAKMi40Ny4xCgo=

--===============5862235302751082891==--

