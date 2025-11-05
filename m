Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DC2CD4841
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:48 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2343.1762384572017878893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZYuL5UDC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HaULH/m4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a564ee6b1-fe88588c-d9bc-415b-98fb-2c67282f3701-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MxC8MzQ3s9BnDHlUHt1uWdd8Iz8YQpGFgOHww7PvQLw=;
	b=ZYuL5UDCj3B7K1AGMKhJRNbDsJLGrFyUtlIKjNn/v+Y2vzKq+bpCme/vsqpEi2er
	9cfWCz5SjgSxFHkBkN/nqnrFVjk31x+NzgFpHvmT6B7eqxX45EWEifGufKYRpKkBB6V
	1Y65zJA2bZKQI6MMk8rs0o1jZ9SRq0J3XptDFXqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MxC8MzQ3s9BnDHlUHt1uWdd8Iz8YQpGFgOHww7PvQLw=;
	b=HaULH/m4KpY0vL8pKwpTtK31WPJtXU2NG/L/Sm6iqWQfRjI3S1ihLpXwQzFQAumS
	K9fJdqES+Ds/4H0sJcqowgNG5ZCemorSIpMZdJGM2biujNwsCUpM6lWvlijy/v/NBbD
	6dS3ikF9rd5rnzUmXW9HEdzU05mVWavc5yrcXR0E=
Content-Type: multipart/mixed; boundary="===============8317243699924566191=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.26.7 FAILED
Message-ID: <0101019a564ee6b1-fe88588c-d9bc-415b-98fb-2c67282f3701-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225901

--===============8317243699924566191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.26.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.26.5-1.26.7.patch
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
From 1ee8ecbc7246cc8faf5ca7eab1635b8ccffeee80 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 21:40:29 +0000
Subject: [PATCH] gst-examples: upgrade 1.26.5 -> 1.26.7

---
 ...001-Make-player-examples-installable.patch | 23 +++++++++----------
 ...mples_1.26.5.bb => gst-examples_1.26.7.bb} |  2 +-
 2 files changed, 12 insertions(+), 13 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index 828c87dc9a..de4ae36fb6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From 844247dd6ab51a02a8803e1a7d2fb27d32c01454 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
index 2fa4ef11fe..6790f0b038 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "82cbccedf7946a32d28a5aaec8ebbcb627770c19"
+SRCREV = "c5a5c302f5e7218182c0633decec16b25de82add"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.47.1


--===============8317243699924566191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-ad27d9142b7433924710455c00c4d89e5e6aaee2"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:ad27d9142b7433924710455c00c4d89e5e6aaee2"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 650 Local 638 Mirrors 0 Missed 12 Current 937 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1327 of 1587 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_recipe_qa_setscene)
NOTE: recipe gst-examples-1.26.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-examples-1.26.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3798 of 4295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_fetch)
NOTE: Running task 4096 of 4295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_write_config)
NOTE: recipe gst-examples-1.26.7-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.26.7-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.26.7-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.26.7-r0: task do_fetch: Succeeded
NOTE: Running task 4277 of 4295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_unpack)
NOTE: Running task 4278 of 4295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.26.7-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.26.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.26.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.26.7-r0: task do_unpack: Succeeded
NOTE: Running task 4279 of 4295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_patch)
NOTE: Running task 4280 of 4295 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_collect_spdx_deps)
NOTE: recipe gst-examples-1.26.7-r0: task do_patch: Started
NOTE: recipe gst-examples-1.26.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-examples-1.26.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-examples-1.26.7-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4280 tasks of which 4274 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105214013.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105214013.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.7/temp/log.do_patch.3797395
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.26.7-r0 do_patch: Applying patch '0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.7/sources/gst-examples-1.26.7/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.7/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 844247dd6ab51a02a8803e1a7d2fb27d32c01454 Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.26.7/temp/log.do_patch.3797395
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb:do_patch) failed with exit code '1'

--===============8317243699924566191==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.26.5-1.26.7.patch"

RnJvbSAxZWU4ZWNiYzcyNDZjYzhmYWY1Y2E3ZWFiMTYzNWI4Y2NmZmVlZTgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMTo0MDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1leGFtcGxlczogdXBncmFkZSAxLjI2LjUgLT4gMS4yNi43CgotLS0KIC4uLjAwMS1NYWtlLXBs
YXllci1leGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaCB8IDIzICsrKysrKysrKy0tLS0tLS0tLS0K
IC4uLm1wbGVzXzEuMjYuNS5iYiA9PiBnc3QtZXhhbXBsZXNfMS4yNi43LmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWV4YW1wbGVzXzEuMjYuNS5i
YiA9PiBnc3QtZXhhbXBsZXNfMS4yNi43LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1l
eGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1leGFtcGxlcy1pbnN0YWxsYWJsZS5w
YXRjaAppbmRleCA4MjhjODdkYzlhLi5kZTRhZTM2ZmI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXItZXhh
bXBsZXMtaW5zdGFsbGFibGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4YW1wbGVzLWluc3RhbGxhYmxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3OTI0MDE2ZmNlMmQwYjQzNTg5MWEzMzVjZGFl
NTJmYzkzOWM3ZTNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NDQyNDdkZDZhYjUx
YTAyYTg4MDNlMWE3ZDJmYjI3ZDMyYzAxNDU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIERhdGU6IFRodSwg
MTcgQXVnIDIwMTcgMTE6MDc6MDIgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBwbGF5ZXIg
ZXhhbXBsZXMgaW5zdGFsbGFibGUKQEAgLTcsMTYgKzcsMTUgQEAgU2lnbmVkLW9mZi1ieTogSnVz
c2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIFVwc3RyZWFtLVN0YXR1czog
RGVuaWVkIFtVcHN0cmVhbSBjb25zaWRlcnMgdGhlc2UgY29kZSBleGFtcGxlcywgZm9yIG5vdyBh
IGxlYXN0XQogCiBodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9Nzc3
ODI3Ci0KIC0tLQotIHBsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZCB8IDEgKwot
IHBsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQgICAgICB8IDEgKworIHN1YnByb2plY3Rz
L2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgfCAxICsK
KyBzdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5idWls
ZCAgICAgIHwgMSArCiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAotSW5kZXg6
IGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKLT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KLS0tLSBnc3QtZXhhbXBsZXMub3JpZy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVz
b24uYnVpbGQKLSsrKyBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29u
LmJ1aWxkCitkaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3Bs
YXllci9nc3QtcGxheS9tZXNvbi5idWlsZCBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5
YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKK2luZGV4IDVlODBjYThkZDQuLjEyOWU1
YmRjYmUgMTAwNjQ0CistLS0gYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxh
eWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCisrKysgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMv
cGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCiBAQCAtMiw1ICsyLDYgQEAgZXhl
Y3V0YWJsZSgnZ3N0LXBsYXknLAogICAgICBbJ2dzdC1wbGF5LmMnLAogICAgICAgJ2dzdC1wbGF5
LWtiLmMnLApAQCAtMjQsMTAgKzIzLDEwIEBAIEluZGV4OiBnc3QtZXhhbXBsZXMvcGxheWJhY2sv
cGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCiArICAgIGluc3RhbGw6IHRydWUsCiAgICAgIGRl
cGVuZGVuY2llcyA6IFtnc3RfZGVwLCBkZXBlbmRlbmN5KCdnc3RyZWFtZXItcGxheS0xLjAnKSwg
bV9kZXBdKQogIAotSW5kZXg6IGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29u
LmJ1aWxkCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLS0gZ3N0LWV4YW1wbGVzLm9yaWcvcGxheWJhY2svcGxheWVy
L2d0ay9tZXNvbi5idWlsZAotKysrIGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21l
c29uLmJ1aWxkCitkaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNr
L3BsYXllci9ndGsvbWVzb24uYnVpbGQgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJh
Y2svcGxheWVyL2d0ay9tZXNvbi5idWlsZAoraW5kZXggYTNiZDgzZTUzMC4uNTFkNDM0ZjkwZCAx
MDA2NDQKKy0tLSBhL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3Rr
L21lc29uLmJ1aWxkCisrKysgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxh
eWVyL2d0ay9tZXNvbi5idWlsZAogQEAgLTIwLDUgKzIwLDYgQEAgaWYgZ3RrX2RlcC5mb3VuZCgp
CiAgICAgICAgICdndGstdmlkZW8tcmVuZGVyZXIuaCcsCiAgICAgICAgICdndGstdmlkZW8tcmVu
ZGVyZXIuYyddLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1leGFtcGxlc18xLjI2LjUuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWV4YW1wbGVzXzEuMjYuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzXzEuMjYuNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxl
c18xLjI2LjcuYmIKaW5kZXggMmZhNGVmMTFmZS4uNjc5MGYwYjAzOCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI2LjUuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI2Ljcu
YmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2dzdHJlYW1lci9nc3RyZWFtZXIuZ2l0O3Byb3RvY29sPWh0dHBzO2IKICAgICAgICAgICAg
ZmlsZTovL2dzdC1wbGF5ZXIuZGVza3RvcCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjgy
Y2JjY2VkZjc5NDZhMzJkMjhhNWFhZWM4ZWJiY2I2Mjc3NzBjMTkiCitTUkNSRVYgPSAiYzVhNWMz
MDJmNWU3MjE4MTgyYzA2MzNkZWNlYzE2YjI1ZGU4MmFkZCIKIAogUyA9ICIke1VOUEFDS0RJUn0v
JHtCUH0vc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzIgogCi0tIAoyLjQ3LjEKCg==

--===============8317243699924566191==--

