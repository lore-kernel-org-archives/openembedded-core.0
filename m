Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12407C4450A
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2961.1783577517601178325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ruv6FzIr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XIyzrrnW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f45811a31-4180313e-ca23-4969-8cd7-4d2cd813accf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577516;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=IxJFmazd5a6V+PvnMJA9ANEF+NUmChLiJaIbiM4A76E=;
	b=ruv6FzIrCPR0YcmvEsRfOXuwRNkQlf+3i5LwddV9MqBOWGKYREnbhS+8J1nJWo2j
	VQNkzWF3BmDp7b25UpnIdKG4vPRQOCf9QB/zsB4+qps/WAAGxsBfF/UvnZVByNlM0QH
	In4Sh7LJs6Eqxd+c/gL1BmPQCqw/ROpINqKJA+u4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577516;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=IxJFmazd5a6V+PvnMJA9ANEF+NUmChLiJaIbiM4A76E=;
	b=XIyzrrnWGSixs1mk4ZZhfhT739zmrpJmWECB14k9Rvvp3ZZPlBcspUKkOwy7c1z8
	xRupD+XvXlXOFmAP9zC5m4PbTRxjzsvE/BrjYzCEHcXabrF2WlatoB8T9dwCrvO33i6
	Qy5+sGB67HhwV1ecvq5/0GcnE9yjnetTMTSunsPk=
Content-Type: multipart/mixed; boundary="===============0850680199660670566=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-examples: upgrading to 1.28.5 FAILED
Message-ID: <0101019f45811a31-4180313e-ca23-4969-8cd7-4d2cd813accf-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240534

--===============0850680199660670566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.28.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.28.4-1.28.5.patch
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
From ed7c2bd2a5e2581e7b3417092ed49f148b08d11b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:47:41 +0000
Subject: [PATCH] gst-examples: upgrade 1.28.4 -> 1.28.5

---
 ...0001-Make-player-examples-installable.patch | 18 +++++++++---------
 ...amples_1.28.4.bb => gst-examples_1.28.5.bb} |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.4.bb => gst-examples_1.28.5.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e7862b40e7..5bb78445a2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 75ff9436c9ff965327d6dad256c0a1539435b13a Mon Sep 17 00:00:00 2001
+From d09522a305c4ab80579800bed28cc4c4f4281b6e Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -8,14 +8,14 @@ Upstream-Status: Denied [Upstream considers these code examples, for now a least
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
 ---
- playback/player/gst-play/meson.build | 1 +
- playback/player/gtk/meson.build      | 1 +
+ subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
+ subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
-diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
 index 5e80ca8dd4..129e5bdcbe 100644
---- a/playback/player/gst-play/meson.build
-+++ b/playback/player/gst-play/meson.build
+--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
++++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
@@ -23,10 +23,10 @@ index 5e80ca8dd4..129e5bdcbe 100644
 +    install: true,
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
 index 6892f15254..20d7505877 100644
---- a/playback/player/gtk/meson.build
-+++ b/playback/player/gtk/meson.build
+--- a/subprojects/gst-examples/playback/player/gtk/meson.build
++++ b/subprojects/gst-examples/playback/player/gtk/meson.build
 @@ -21,5 +21,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
index ad6374d3fb..dcdf7fd433 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "b46f881eaa8126eddfd21b5ae5512f8d4ff36255"
+SRCREV = "727ceb91886862d200f423baf36cde2bb7ce5b4d"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.47.1


--===============0850680199660670566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-695458fba19d3c560b2f3e35dde0cb0472bdfcf6"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:695458fba19d3c560b2f3e35dde0cb0472bdfcf6"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 914 Local 900 Mirrors 0 Missed 14 Current 927 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1482 of 1841 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3796 of 4233 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_recipe_qa)
NOTE: Running task 4057 of 4233 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_write_config)
NOTE: recipe gst-examples-1.28.5-r0: task do_recipe_qa: Started
NOTE: Running task 4176 of 4233 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_create_recipe_spdx)
NOTE: recipe gst-examples-1.28.5-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.28.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe gst-examples-1.28.5-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.28.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4215 of 4233 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_fetch)
NOTE: recipe gst-examples-1.28.5-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.28.5-r0: task do_fetch: Succeeded
NOTE: recipe gst-examples-1.28.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4216 of 4233 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_unpack)
NOTE: Running task 4217 of 4233 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.28.5-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.28.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.28.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.28.5-r0: task do_unpack: Succeeded
NOTE: Running task 4218 of 4233 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_patch)
NOTE: recipe gst-examples-1.28.5-r0: task do_patch: Started
NOTE: recipe gst-examples-1.28.5-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4218 tasks of which 4211 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260709054722.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260709054722.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.5/temp/log.do_patch.4101637
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.28.5-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.5/sources/gst-examples-1.28.5/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.5/recipe-sysroot-native/etc/quiltrc push', 1, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From d09522a305c4ab80579800bed28cc4c4f4281b6e Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.5/temp/log.do_patch.4101637
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb:do_patch) failed with exit code '1'

--===============0850680199660670566==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.28.4-1.28.5.patch"

RnJvbSBlZDdjMmJkMmE1ZTI1ODFlN2IzNDE3MDkyZWQ0OWYxNDhiMDhkMTFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNTo0Nzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1leGFtcGxlczogdXBncmFkZSAxLjI4LjQgLT4gMS4yOC41CgotLS0KIC4uLjAwMDEtTWFrZS1w
bGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2ggfCAxOCArKysrKysrKystLS0tLS0tLS0K
IC4uLmFtcGxlc18xLjI4LjQuYmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjguNS5iYn0gfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1leGFtcGxlc18xLjI4LjQu
YmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjguNS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXIt
ZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFibGUu
cGF0Y2gKaW5kZXggZTc4NjJiNDBlNy4uNWJiNzg0NDVhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4
YW1wbGVzLWluc3RhbGxhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1leGFtcGxlcy1pbnN0YWxsYWJs
ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzVmZjk0MzZjOWZmOTY1MzI3ZDZkYWQyNTZj
MGExNTM5NDM1YjEzYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDA5NTIyYTMwNWM0
YWI4MDU3OTgwMGJlZDI4Y2M0YzRmNDI4MWI2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBEYXRlOiBUaHUs
IDE3IEF1ZyAyMDE3IDExOjA3OjAyICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgcGxheWVy
IGV4YW1wbGVzIGluc3RhbGxhYmxlCkBAIC04LDE0ICs4LDE0IEBAIFVwc3RyZWFtLVN0YXR1czog
RGVuaWVkIFtVcHN0cmVhbSBjb25zaWRlcnMgdGhlc2UgY29kZSBleGFtcGxlcywgZm9yIG5vdyBh
IGxlYXN0CiAKIGh0dHBzOi8vYnVnemlsbGEuZ25vbWUub3JnL3Nob3dfYnVnLmNnaT9pZD03Nzc4
MjcKIC0tLQotIHBsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZCB8IDEgKwotIHBs
YXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQgICAgICB8IDEgKworIHN1YnByb2plY3RzL2dz
dC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgfCAxICsKKyBz
dWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5idWlsZCAg
ICAgIHwgMSArCiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAotZGlmZiAtLWdp
dCBhL3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZCBiL3BsYXliYWNrL3BsYXll
ci9nc3QtcGxheS9tZXNvbi5idWlsZAorZGlmZiAtLWdpdCBhL3N1YnByb2plY3RzL2dzdC1leGFt
cGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgYi9zdWJwcm9qZWN0cy9n
c3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCiBpbmRleCA1
ZTgwY2E4ZGQ0Li4xMjllNWJkY2JlIDEwMDY0NAotLS0tIGEvcGxheWJhY2svcGxheWVyL2dzdC1w
bGF5L21lc29uLmJ1aWxkCi0rKysgYi9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVp
bGQKKy0tLSBhL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBs
YXkvbWVzb24uYnVpbGQKKysrKyBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9w
bGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKIEBAIC0yLDUgKzIsNiBAQCBleGVjdXRhYmxlKCdn
c3QtcGxheScsCiAgICAgIFsnZ3N0LXBsYXkuYycsCiAgICAgICAnZ3N0LXBsYXkta2IuYycsCkBA
IC0yMywxMCArMjMsMTAgQEAgaW5kZXggNWU4MGNhOGRkNC4uMTI5ZTViZGNiZSAxMDA2NDQKICsg
ICAgaW5zdGFsbDogdHJ1ZSwKICAgICAgZGVwZW5kZW5jaWVzIDogW2dzdF9kZXAsIGRlcGVuZGVu
Y3koJ2dzdHJlYW1lci1wbGF5LTEuMCcpLCBtX2RlcF0pCiAgCi1kaWZmIC0tZ2l0IGEvcGxheWJh
Y2svcGxheWVyL2d0ay9tZXNvbi5idWlsZCBiL3BsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVp
bGQKK2RpZmYgLS1naXQgYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVy
L2d0ay9tZXNvbi5idWlsZCBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5
ZXIvZ3RrL21lc29uLmJ1aWxkCiBpbmRleCA2ODkyZjE1MjU0Li4yMGQ3NTA1ODc3IDEwMDY0NAot
LS0tIGEvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5idWlsZAotKysrIGIvcGxheWJhY2svcGxh
eWVyL2d0ay9tZXNvbi5idWlsZAorLS0tIGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXli
YWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQKKysrKyBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxl
cy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29uLmJ1aWxkCiBAQCAtMjEsNSArMjEsNiBAQCBpZiBn
dGtfZGVwLmZvdW5kKCkKICAgICAgICAgJ2d0ay12aWRlby1yZW5kZXJlci5oJywKICAgICAgICAg
J2d0ay12aWRlby1yZW5kZXJlci5jJ10sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzXzEuMjguNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXNfMS4yOC41LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhh
bXBsZXNfMS4yOC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWV4YW1wbGVzXzEuMjguNS5iYgppbmRleCBhZDYzNzRkM2ZiLi5kY2RmN2ZkNDMzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVz
XzEuMjguNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4
YW1wbGVzXzEuMjguNS5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci5naXQ7cHJvdG9jb2w9aHR0cHM7
YgogICAgICAgICAgICBmaWxlOi8vZ3N0LXBsYXllci5kZXNrdG9wIFwKICAgICAgICAgICAgIgog
Ci1TUkNSRVYgPSAiYjQ2Zjg4MWVhYTgxMjZlZGRmZDIxYjVhZTU1MTJmOGQ0ZmYzNjI1NSIKK1NS
Q1JFViA9ICI3MjdjZWI5MTg4Njg2MmQyMDBmNDIzYmFmMzZjZGUyYmI3Y2U1YjRkIgogCiBTID0g
IiR7VU5QQUNLRElSfS8ke0JQfS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMiCiAKLS0gCjIuNDcu
MQoK

--===============0850680199660670566==--

