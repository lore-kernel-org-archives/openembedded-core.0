Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA43CA0FE2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.88799.1754057265782008253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=a965lGso;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=L8cADbeD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019865f62560-d26036e5-0670-4fc8-aafc-b212c075b13e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EVomkc1P/hdkk5nM28pz0IIpOpiwrGasyVKTTbzByc8=;
	b=a965lGsoJ01Wxf3GL7JKkCr0R6xcozL0lbwfvAyLDxJwRoNPRhE98Et4/JgoKI/I
	WHkXo7Sn5BiS2Jpbysa4KCkxyGTn7x+QCJ9QYko9njBQ9g+/uWAj/mVfK7lJc9R/K1A
	LUfnz1qwWGhjZB4fChqsGc4auaEBLJKibxMEHe+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EVomkc1P/hdkk5nM28pz0IIpOpiwrGasyVKTTbzByc8=;
	b=L8cADbeD1Hn5lWutTMXekjx4N/GXfl0Imz68noCPuhwB4cLXJzMd9zM4tySLIyvY
	5xWN6XNHcTt0xAa+erRTadmawLTKKU8TeOiQiJI8UQO11vvAcAbuhD2nupGBcbalShv
	CMzHT+hwRKS/MatwycBARhHTOPsH+9urdvI3gqBw=
Content-Type: multipart/mixed; boundary="===============3234453809057670334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-examples: upgrading to 1.26.4 FAILED
Message-ID: <0101019865f62560-d26036e5-0670-4fc8-aafc-b212c075b13e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221324

--===============3234453809057670334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.26.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.26.3-1.26.4.patch
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
From 58ecb996623af26fd2011c873b84b92563e82cca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 12:25:32 +0000
Subject: [PATCH] gst-examples: upgrade 1.26.3 -> 1.26.4

---
 ...001-Make-player-examples-installable.patch | 23 +++++++++----------
 ...mples_1.26.3.bb => gst-examples_1.26.4.bb} |  2 +-
 2 files changed, 12 insertions(+), 13 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.3.bb => gst-examples_1.26.4.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index 828c87dc9a..570299b07e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From b637144039e901d7832ce8142cf66d1222824fd9 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb
index df8fd4bd26..cb3672adff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "87bc0c6e949e3dcc440658f78ef52aa8088cb62f"
+SRCREV = "b079b40877776aef8e2d3bf1e3892433ba200163"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.47.1


--===============3234453809057670334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (941 cached, 1 parsed). 1933 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b7b9a1e9e27a7217baa8d8d85ed1598d51244642"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b7b9a1e9e27a7217baa8d8d85ed1598d51244642"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 662 Local 649 Mirrors 0 Missed 13 Current 948 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3887 of 4358 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_recipe_qa)
NOTE: Running task 4158 of 4358 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_write_config)
NOTE: recipe gst-examples-1.26.4-r0: task do_recipe_qa: Started
NOTE: recipe gst-examples-1.26.4-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.26.4-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.26.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4339 of 4358 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_fetch)
NOTE: recipe gst-examples-1.26.4-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.26.4-r0: task do_fetch: Succeeded
NOTE: Running task 4340 of 4358 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_unpack)
NOTE: Running task 4341 of 4358 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.26.4-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.26.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.26.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.26.4-r0: task do_unpack: Succeeded
NOTE: Running task 4342 of 4358 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_patch)
NOTE: Running task 4343 of 4358 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_collect_spdx_deps)
NOTE: recipe gst-examples-1.26.4-r0: task do_patch: Started
NOTE: recipe gst-examples-1.26.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-examples-1.26.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-examples-1.26.4-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4343 tasks of which 4336 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801122517.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801122517.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.4/temp/log.do_patch.3195966
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.26.4-r0 do_patch: Applying patch '0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.4/sources/gst-examples-1.26.4/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.4/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From b637144039e901d7832ce8142cf66d1222824fd9 Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-examples/1.26.4/temp/log.do_patch.3195966
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-examples_1.26.4.bb:do_patch) failed with exit code '1'

--===============3234453809057670334==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.26.3-1.26.4.patch"

RnJvbSA1OGVjYjk5NjYyM2FmMjZmZDIwMTFjODczYjg0YjkyNTYzZTgyY2NhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMjoyNTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1leGFtcGxlczogdXBncmFkZSAxLjI2LjMgLT4gMS4yNi40CgotLS0KIC4uLjAwMS1NYWtlLXBs
YXllci1leGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaCB8IDIzICsrKysrKysrKy0tLS0tLS0tLS0K
IC4uLm1wbGVzXzEuMjYuMy5iYiA9PiBnc3QtZXhhbXBsZXNfMS4yNi40LmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWV4YW1wbGVzXzEuMjYuMy5i
YiA9PiBnc3QtZXhhbXBsZXNfMS4yNi40LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1l
eGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1leGFtcGxlcy1pbnN0YWxsYWJsZS5w
YXRjaAppbmRleCA4MjhjODdkYzlhLi41NzAyOTliMDdlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXItZXhh
bXBsZXMtaW5zdGFsbGFibGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4YW1wbGVzLWluc3RhbGxhYmxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3OTI0MDE2ZmNlMmQwYjQzNTg5MWEzMzVjZGFl
NTJmYzkzOWM3ZTNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNjM3MTQ0MDM5ZTkw
MWQ3ODMyY2U4MTQyY2Y2NmQxMjIyODI0ZmQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
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
L2dzdC1leGFtcGxlc18xLjI2LjMuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWV4YW1wbGVzXzEuMjYuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzXzEuMjYuMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxl
c18xLjI2LjQuYmIKaW5kZXggZGY4ZmQ0YmQyNi4uY2IzNjcyYWRmZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI2LjMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI2LjQu
YmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2dzdHJlYW1lci9nc3RyZWFtZXIuZ2l0O3Byb3RvY29sPWh0dHBzO2IKICAgICAgICAgICAg
ZmlsZTovL2dzdC1wbGF5ZXIuZGVza3RvcCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjg3
YmMwYzZlOTQ5ZTNkY2M0NDA2NThmNzhlZjUyYWE4MDg4Y2I2MmYiCitTUkNSRVYgPSAiYjA3OWI0
MDg3Nzc3NmFlZjhlMmQzYmYxZTM4OTI0MzNiYTIwMDE2MyIKIAogUyA9ICIke1VOUEFDS0RJUn0v
JHtCUH0vc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzIgogCi0tIAoyLjQ3LjEKCg==

--===============3234453809057670334==--

