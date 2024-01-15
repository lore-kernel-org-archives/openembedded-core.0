Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4013C47DD3
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.88298.1705340031496273695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bHRBsUCW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BqfLEWiI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d0e2fcfee-2336e3c9-6f3b-4844-8e5a-c86204f76aa4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Q22zTPUPry3FyXWD2vL6KwufuYRD0cez3GvpObgwfPc=;
	b=bHRBsUCWQwK5y8cNUzErdUIbh3LEACcXRtCOp1BQPWidAzNzV/+eeWD3K0wyiWmA
	7qja+G8poWrtPih7ZuUY2Xnjkqki8JIyE39TMkZs5cM9iZcdafdWQiHCbYAul7AvFNd
	v0Az1+oWG26hkr6kcEOeNzEqr43xuZBI5HOMWKc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Q22zTPUPry3FyXWD2vL6KwufuYRD0cez3GvpObgwfPc=;
	b=BqfLEWiIJtaC0InHFTIEWOGhcxatXeSLYujITq0HS/mLxmOzolqm66pfIElTrXl6
	SBEr4WdLsaYwYiUpfoPIN80hrgLkk+KYiid1j5KyoOYHxoxi0fLbUezEhsze8Q1XPB0
	gEsNQwzl1PzQCJJFCnvpxSR30ZoLXzVDNcIHvMHA=
Content-Type: multipart/mixed; boundary="===============5194784649885467015=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] pulseaudio: upgrading to 17.0 FAILED
Message-ID: <0101018d0e2fcfee-2336e3c9-6f3b-4844-8e5a-c86204f76aa4-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193779

--===============5194784649885467015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pulseaudio* to *17.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pulseaudio-upgrade-16.1-17.0.patch
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
From b83578a59c8ee71b8e44ba17ed827579bcc3e131 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 13:47:27 +0000
Subject: [PATCH] pulseaudio: upgrade 16.1 -> 17.0

---
 ...nt-conf-Add-allow-autospawn-for-root.patch | 24 +++++++++----------
 ...ild-remove-dependency-on-doxygen-bin.patch |  3 ++-
 ...LFAGS-to-improve-reproducibility-bui.patch | 12 ++++------
 ...{pulseaudio_16.1.bb => pulseaudio_17.0.bb} |  2 +-
 4 files changed, 19 insertions(+), 22 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_16.1.bb => pulseaudio_17.0.bb} (84%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
index 33f7709ae4..b31b05a4a3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
@@ -1,4 +1,4 @@
-From babec3a50dd710d26b72f6c6d43bd79b04e954a6 Mon Sep 17 00:00:00 2001
+From 2ed92d21a27395f5a21db05ddb0d0cc77cc5abc5 Mon Sep 17 00:00:00 2001
 From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
 Date: Tue, 28 Apr 2015 14:32:43 +0300
 Subject: [PATCH] client-conf: Add allow-autospawn-for-root
@@ -15,6 +15,7 @@ that use case. If someone can prove otherwise, the patch would
 probably be accepted.]
 
 Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+
 ---
  man/pulse-client.conf.5.xml.in | 9 +++++++++
  src/pulse/client-conf.c        | 1 +
@@ -24,13 +25,14 @@ Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
  5 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/man/pulse-client.conf.5.xml.in b/man/pulse-client.conf.5.xml.in
-index b88898c..e737c96 100644
+index 15f8776..9e3e706 100644
 --- a/man/pulse-client.conf.5.xml.in
 +++ b/man/pulse-client.conf.5.xml.in
-@@ -82,6 +82,15 @@ License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
+@@ -90,6 +90,15 @@ License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
+       disable the unit with the "disable" command).</p>
      </option>
  
-     <option>
++    <option>
 +      <p><opt>allow-autospawn-for-root=</opt> Allow autospawning also for root.
 +      Takes a boolean value, defaults to <opt>no</opt>. If the <opt>autospawn
 +      </opt> option is disabled, this option has no effect. Autospawning for
@@ -39,15 +41,14 @@ index b88898c..e737c96 100644
 +      enabled only in environments where there are no regular users at all.</p>
 +    </option>
 +
-+    <option>
+     <option>
        <p><opt>daemon-binary=</opt> Path to the PulseAudio daemon to
        run when autospawning. Defaults to a path configured at compile
-       time.</p>
 diff --git a/src/pulse/client-conf.c b/src/pulse/client-conf.c
-index a3c9486..9f68ee5 100644
+index 1daaf91..fd8a87d 100644
 --- a/src/pulse/client-conf.c
 +++ b/src/pulse/client-conf.c
-@@ -138,6 +138,7 @@ void pa_client_conf_load(pa_client_conf *c, bool load_from_x11, bool load_from_e
+@@ -139,6 +139,7 @@ void pa_client_conf_load(pa_client_conf *c, bool load_from_x11, bool load_from_e
          { "default-server",         pa_config_parse_string,   &c->default_server, NULL },
          { "default-dbus-server",    pa_config_parse_string,   &c->default_dbus_server, NULL },
          { "autospawn",              pa_config_parse_bool,     &c->autospawn, NULL },
@@ -80,10 +81,10 @@ index 26b7790..69830ef 100644
  ; extra-arguments = --log-target=syslog
  
 diff --git a/src/pulse/context.c b/src/pulse/context.c
-index 69be5f4..d6e13e8 100644
+index e535d04..963208e 100644
 --- a/src/pulse/context.c
 +++ b/src/pulse/context.c
-@@ -1027,7 +1027,7 @@ int pa_context_connect(
+@@ -1052,7 +1052,7 @@ int pa_context_connect(
      if (!(flags & PA_CONTEXT_NOAUTOSPAWN) && c->conf->autospawn) {
  
  #ifdef HAVE_GETUID
@@ -92,6 +93,3 @@ index 69be5f4..d6e13e8 100644
              pa_log_debug("Not doing autospawn since we are root.");
          else {
              c->do_autospawn = true;
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
index b1a43bd7f0..50aa49f13b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
@@ -1,4 +1,4 @@
-From 4ee244d0824e772ab35abb0f9df5e8088e16fc5d Mon Sep 17 00:00:00 2001
+From 93357397b192055f6d1e6e6e8ebfc45bb0a0c25b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 26 Apr 2021 19:30:40 +0200
 Subject: [PATCH] doxygen/meson.build: remove dependency on doxygen binary
@@ -10,6 +10,7 @@ optional and should be treated as such.
 
 Upstream-Status: Inappropriate [needs proper upstream fix]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  doxygen/meson.build | 2 --
  1 file changed, 2 deletions(-)
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
index 48f0492177..4ee2f7c52a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
@@ -1,22 +1,23 @@
-From f0ddd7c36556ad05c1398fdd132947323ad26473 Mon Sep 17 00:00:00 2001
+From 983f005acd7431326fad0d392addb5e18a731946 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 6 Dec 2018 11:43:41 +0800
-Subject: [PATCH 2/2] do not display CLFAGS to improve reproducibility build
+Subject: [PATCH] do not display CLFAGS to improve reproducibility build
 
 Macro PA_CFLAGS contains build path, do not use it to
 display CFLAGS which could improve reproducibility build.
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  src/daemon/main.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/daemon/main.c b/src/daemon/main.c
-index 30ef499..5c3abf0 100644
+index 924a4d4..54b4c5b 100644
 --- a/src/daemon/main.c
 +++ b/src/daemon/main.c
-@@ -916,7 +916,7 @@ int main(int argc, char *argv[]) {
+@@ -1071,7 +1071,7 @@ int main(int argc, char *argv[]) {
      pa_set_env_and_record("PULSE_SYSTEM", conf->system_instance ? "1" : "0");
  
      pa_log_info("This is PulseAudio %s", PACKAGE_VERSION);
@@ -25,6 +26,3 @@ index 30ef499..5c3abf0 100644
  
  #ifdef HAVE_LIBSAMPLERATE
      pa_log_warn("Compiled with DEPRECATED libsamplerate support!");
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
similarity index 84%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
index 64002cd1cc..54c79b4097 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
@@ -6,5 +6,5 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
            "
-SRC_URI[sha256sum] = "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4"
+SRC_URI[sha256sum] = "053794d6671a3e397d849e478a80b82a63cb9d8ca296bd35b73317bb5ceb87b5"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.42.0


--===============5194784649885467015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1851 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1850 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4dd6bf90d36443523f7d264adc2914c88d162232"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4dd6bf90d36443523f7d264adc2914c88d162232"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 390 Local 371 Mirrors 0 Missed 19 Current 583 (95% match, 98% complete)
Removing 5 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 680 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 681 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 683 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 698 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 710 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe ofono-2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1098 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa)
NOTE: Running task 1139 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ofono-2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 857 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe avahi-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 863 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 864 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 865 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running task 1291 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.71-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.71-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 973 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2228 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: Running task 2343 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2578 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: Running task 2579 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2598 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: Running task 2599 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_collect_spdx_deps)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: Running task 2600 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2601 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_lic)
NOTE: recipe pulseaudio-17.0-r0: task do_populate_lic: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_lic: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2602 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Succeeded
NOTE: Running task 2603 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_compile)
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Succeeded
NOTE: Running task 2604 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_install)
NOTE: recipe pulseaudio-17.0-r0: task do_install: Started
NOTE: recipe pulseaudio-17.0-r0: task do_install: Succeeded
NOTE: Running task 2605 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package)
NOTE: Running task 2606 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2607 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-plugins-1.2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2608 of 2625 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.7.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Failed
NOTE: recipe alsa-plugins-1.2.7.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2608 tasks of which 2590 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115134241.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115134241.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: pulseaudio-17.0-r0 do_package: QA Issue: pulseaudio: Files/directories were installed but not shipped in any package:
  /usr/share/dbus-1
  /usr/share/dbus-1/system.d
  /usr/share/dbus-1/system.d/pulseaudio-system.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
pulseaudio: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: pulseaudio-17.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/pulseaudio/17.0/temp/log.do_package.4100472
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package) failed with exit code '1'

--===============5194784649885467015==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pulseaudio-upgrade-16.1-17.0.patch"

RnJvbSBiODM1NzhhNTljOGVlNzFiOGU0NGJhMTdlZDgyNzU3OWJjYzNlMTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTM6NDc6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dWxzZWF1ZGlvOiB1cGdyYWRlIDE2LjEgLT4gMTcuMAoKLS0tCiAuLi5udC1jb25mLUFkZC1hbGxv
dy1hdXRvc3Bhd24tZm9yLXJvb3QucGF0Y2ggfCAyNCArKysrKysrKystLS0tLS0tLS0tCiAuLi5p
bGQtcmVtb3ZlLWRlcGVuZGVuY3ktb24tZG94eWdlbi1iaW4ucGF0Y2ggfCAgMyArKy0KIC4uLkxG
QUdTLXRvLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LWJ1aS5wYXRjaCB8IDEyICsrKystLS0tLS0K
IC4uLntwdWxzZWF1ZGlvXzE2LjEuYmIgPT4gcHVsc2VhdWRpb18xNy4wLmJifSB8ICAyICstCiA0
IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3B1bHNlYXVkaW8ve3B1bHNlYXVkaW9fMTYuMS5iYiA9
PiBwdWxzZWF1ZGlvXzE3LjAuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvcHVsc2VhdWRpby9wdWxzZWF1ZGlvLzAwMDEtY2xpZW50LWNvbmYtQWRkLWFsbG93
LWF1dG9zcGF3bi1mb3Itcm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3B1bHNl
YXVkaW8vcHVsc2VhdWRpby8wMDAxLWNsaWVudC1jb25mLUFkZC1hbGxvdy1hdXRvc3Bhd24tZm9y
LXJvb3QucGF0Y2gKaW5kZXggMzNmNzcwOWFlNC4uYjMxYjA1YTRhMyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvcHVsc2VhdWRpby9wdWxzZWF1ZGlvLzAwMDEtY2xpZW50LWNv
bmYtQWRkLWFsbG93LWF1dG9zcGF3bi1mb3Itcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vMDAwMS1jbGllbnQtY29uZi1BZGQtYWxs
b3ctYXV0b3NwYXduLWZvci1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiYWJlYzNh
NTBkZDcxMGQyNmI3MmY2YzZkNDNiZDc5YjA0ZTk1NGE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAyZWQ5MmQyMWEyNzM5NWY1YTIxZGIwNWRkYjBkMGNjNzdjYzVhYmM1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVGFudSBLYXNraW5lbiA8dGFudS5rYXNraW5lbkBsaW51
eC5pbnRlbC5jb20+CiBEYXRlOiBUdWUsIDI4IEFwciAyMDE1IDE0OjMyOjQzICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGNsaWVudC1jb25mOiBBZGQgYWxsb3ctYXV0b3NwYXduLWZvci1yb290CkBA
IC0xNSw2ICsxNSw3IEBAIHRoYXQgdXNlIGNhc2UuIElmIHNvbWVvbmUgY2FuIHByb3ZlIG90aGVy
d2lzZSwgdGhlIHBhdGNoIHdvdWxkCiBwcm9iYWJseSBiZSBhY2NlcHRlZC5dCiAKIFNpZ25lZC1v
ZmYtYnk6IFRhbnUgS2Fza2luZW4gPHRhbnUua2Fza2luZW5AbGludXguaW50ZWwuY29tPgorCiAt
LS0KICBtYW4vcHVsc2UtY2xpZW50LmNvbmYuNS54bWwuaW4gfCA5ICsrKysrKysrKwogIHNyYy9w
dWxzZS9jbGllbnQtY29uZi5jICAgICAgICB8IDEgKwpAQCAtMjQsMTMgKzI1LDE0IEBAIFNpZ25l
ZC1vZmYtYnk6IFRhbnUgS2Fza2luZW4gPHRhbnUua2Fza2luZW5AbGludXguaW50ZWwuY29tPgog
IDUgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvbWFuL3B1bHNlLWNsaWVudC5jb25mLjUueG1sLmluIGIvbWFuL3B1bHNlLWNsaWVu
dC5jb25mLjUueG1sLmluCi1pbmRleCBiODg4OThjLi5lNzM3Yzk2IDEwMDY0NAoraW5kZXggMTVm
ODc3Ni4uOWUzZTcwNiAxMDA2NDQKIC0tLSBhL21hbi9wdWxzZS1jbGllbnQuY29uZi41LnhtbC5p
bgogKysrIGIvbWFuL3B1bHNlLWNsaWVudC5jb25mLjUueG1sLmluCi1AQCAtODIsNiArODIsMTUg
QEAgTGljZW5zZSBhbG9uZyB3aXRoIFB1bHNlQXVkaW87IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3
LmdudS5vcmcvbGljZW5zZXMvPi4KK0BAIC05MCw2ICs5MCwxNSBAQCBMaWNlbnNlIGFsb25nIHdp
dGggUHVsc2VBdWRpbzsgaWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+
LgorICAgICAgIGRpc2FibGUgdGhlIHVuaXQgd2l0aCB0aGUgImRpc2FibGUiIGNvbW1hbmQpLjwv
cD4KICAgICAgPC9vcHRpb24+CiAgCi0gICAgIDxvcHRpb24+CisrICAgIDxvcHRpb24+CiArICAg
ICAgPHA+PG9wdD5hbGxvdy1hdXRvc3Bhd24tZm9yLXJvb3Q9PC9vcHQ+IEFsbG93IGF1dG9zcGF3
bmluZyBhbHNvIGZvciByb290LgogKyAgICAgIFRha2VzIGEgYm9vbGVhbiB2YWx1ZSwgZGVmYXVs
dHMgdG8gPG9wdD5ubzwvb3B0Pi4gSWYgdGhlIDxvcHQ+YXV0b3NwYXduCiArICAgICAgPC9vcHQ+
IG9wdGlvbiBpcyBkaXNhYmxlZCwgdGhpcyBvcHRpb24gaGFzIG5vIGVmZmVjdC4gQXV0b3NwYXdu
aW5nIGZvcgpAQCAtMzksMTUgKzQxLDE0IEBAIGluZGV4IGI4ODg5OGMuLmU3MzdjOTYgMTAwNjQ0
CiArICAgICAgZW5hYmxlZCBvbmx5IGluIGVudmlyb25tZW50cyB3aGVyZSB0aGVyZSBhcmUgbm8g
cmVndWxhciB1c2VycyBhdCBhbGwuPC9wPgogKyAgICA8L29wdGlvbj4KICsKLSsgICAgPG9wdGlv
bj4KKyAgICAgPG9wdGlvbj4KICAgICAgICA8cD48b3B0PmRhZW1vbi1iaW5hcnk9PC9vcHQ+IFBh
dGggdG8gdGhlIFB1bHNlQXVkaW8gZGFlbW9uIHRvCiAgICAgICAgcnVuIHdoZW4gYXV0b3NwYXdu
aW5nLiBEZWZhdWx0cyB0byBhIHBhdGggY29uZmlndXJlZCBhdCBjb21waWxlCi0gICAgICAgdGlt
ZS48L3A+CiBkaWZmIC0tZ2l0IGEvc3JjL3B1bHNlL2NsaWVudC1jb25mLmMgYi9zcmMvcHVsc2Uv
Y2xpZW50LWNvbmYuYwotaW5kZXggYTNjOTQ4Ni4uOWY2OGVlNSAxMDA2NDQKK2luZGV4IDFkYWFm
OTEuLmZkOGE4N2QgMTAwNjQ0CiAtLS0gYS9zcmMvcHVsc2UvY2xpZW50LWNvbmYuYwogKysrIGIv
c3JjL3B1bHNlL2NsaWVudC1jb25mLmMKLUBAIC0xMzgsNiArMTM4LDcgQEAgdm9pZCBwYV9jbGll
bnRfY29uZl9sb2FkKHBhX2NsaWVudF9jb25mICpjLCBib29sIGxvYWRfZnJvbV94MTEsIGJvb2wg
bG9hZF9mcm9tX2UKK0BAIC0xMzksNiArMTM5LDcgQEAgdm9pZCBwYV9jbGllbnRfY29uZl9sb2Fk
KHBhX2NsaWVudF9jb25mICpjLCBib29sIGxvYWRfZnJvbV94MTEsIGJvb2wgbG9hZF9mcm9tX2UK
ICAgICAgICAgIHsgImRlZmF1bHQtc2VydmVyIiwgICAgICAgICBwYV9jb25maWdfcGFyc2Vfc3Ry
aW5nLCAgICZjLT5kZWZhdWx0X3NlcnZlciwgTlVMTCB9LAogICAgICAgICAgeyAiZGVmYXVsdC1k
YnVzLXNlcnZlciIsICAgIHBhX2NvbmZpZ19wYXJzZV9zdHJpbmcsICAgJmMtPmRlZmF1bHRfZGJ1
c19zZXJ2ZXIsIE5VTEwgfSwKICAgICAgICAgIHsgImF1dG9zcGF3biIsICAgICAgICAgICAgICBw
YV9jb25maWdfcGFyc2VfYm9vbCwgICAgICZjLT5hdXRvc3Bhd24sIE5VTEwgfSwKQEAgLTgwLDEw
ICs4MSwxMCBAQCBpbmRleCAyNmI3NzkwLi42OTgzMGVmIDEwMDY0NAogIDsgZXh0cmEtYXJndW1l
bnRzID0gLS1sb2ctdGFyZ2V0PXN5c2xvZwogIAogZGlmZiAtLWdpdCBhL3NyYy9wdWxzZS9jb250
ZXh0LmMgYi9zcmMvcHVsc2UvY29udGV4dC5jCi1pbmRleCA2OWJlNWY0Li5kNmUxM2U4IDEwMDY0
NAoraW5kZXggZTUzNWQwNC4uOTYzMjA4ZSAxMDA2NDQKIC0tLSBhL3NyYy9wdWxzZS9jb250ZXh0
LmMKICsrKyBiL3NyYy9wdWxzZS9jb250ZXh0LmMKLUBAIC0xMDI3LDcgKzEwMjcsNyBAQCBpbnQg
cGFfY29udGV4dF9jb25uZWN0KAorQEAgLTEwNTIsNyArMTA1Miw3IEBAIGludCBwYV9jb250ZXh0
X2Nvbm5lY3QoCiAgICAgIGlmICghKGZsYWdzICYgUEFfQ09OVEVYVF9OT0FVVE9TUEFXTikgJiYg
Yy0+Y29uZi0+YXV0b3NwYXduKSB7CiAgCiAgI2lmZGVmIEhBVkVfR0VUVUlECkBAIC05Miw2ICs5
MywzIEBAIGluZGV4IDY5YmU1ZjQuLmQ2ZTEzZTggMTAwNjQ0CiAgICAgICAgICAgICAgcGFfbG9n
X2RlYnVnKCJOb3QgZG9pbmcgYXV0b3NwYXduIHNpbmNlIHdlIGFyZSByb290LiIpOwogICAgICAg
ICAgZWxzZSB7CiAgICAgICAgICAgICAgYy0+ZG9fYXV0b3NwYXduID0gdHJ1ZTsKLS0tIAotMi44
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvcHVsc2VhdWRpby9wdWxz
ZWF1ZGlvLzAwMDEtZG94eWdlbi1tZXNvbi5idWlsZC1yZW1vdmUtZGVwZW5kZW5jeS1vbi1kb3h5
Z2VuLWJpbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3B1bHNlYXVkaW8vcHVsc2Vh
dWRpby8wMDAxLWRveHlnZW4tbWVzb24uYnVpbGQtcmVtb3ZlLWRlcGVuZGVuY3ktb24tZG94eWdl
bi1iaW4ucGF0Y2gKaW5kZXggYjFhNDNiZDdmMC4uNTBhYTQ5ZjEzYiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvcHVsc2VhdWRpby9wdWxzZWF1ZGlvLzAwMDEtZG94eWdlbi1t
ZXNvbi5idWlsZC1yZW1vdmUtZGVwZW5kZW5jeS1vbi1kb3h5Z2VuLWJpbi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vMDAwMS1kb3h5Z2Vu
LW1lc29uLmJ1aWxkLXJlbW92ZS1kZXBlbmRlbmN5LW9uLWRveHlnZW4tYmluLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA0ZWUyNDRkMDgyNGU3NzJhYjM1YWJiMGY5ZGY1ZTgwODhlMTZmYzVk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MzM1NzM5N2IxOTIwNTVmNmQxZTZlNmU4
ZWJmYzQ1YmIwYTBjMjViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI2IEFwciAyMDIx
IDE5OjMwOjQwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRveHlnZW4vbWVzb24uYnVpbGQ6IHJl
bW92ZSBkZXBlbmRlbmN5IG9uIGRveHlnZW4gYmluYXJ5CkBAIC0xMCw2ICsxMCw3IEBAIG9wdGlv
bmFsIGFuZCBzaG91bGQgYmUgdHJlYXRlZCBhcyBzdWNoLgogCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW25lZWRzIHByb3BlciB1cHN0cmVhbSBmaXhdCiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KKwogLS0tCiAgZG94eWdl
bi9tZXNvbi5idWlsZCB8IDIgLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3B1bHNlYXVkaW8vcHVsc2VhdWRpby8w
MDAyLWRvLW5vdC1kaXNwbGF5LUNMRkFHUy10by1pbXByb3ZlLXJlcHJvZHVjaWJpbGl0eS1idWku
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vMDAw
Mi1kby1ub3QtZGlzcGxheS1DTEZBR1MtdG8taW1wcm92ZS1yZXByb2R1Y2liaWxpdHktYnVpLnBh
dGNoCmluZGV4IDQ4ZjA0OTIxNzcuLjRlZTJmN2M1MmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL3B1bHNlYXVkaW8vcHVsc2VhdWRpby8wMDAyLWRvLW5vdC1kaXNwbGF5LUNM
RkFHUy10by1pbXByb3ZlLXJlcHJvZHVjaWJpbGl0eS1idWkucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvcHVsc2VhdWRpby9wdWxzZWF1ZGlvLzAwMDItZG8tbm90LWRpc3BsYXkt
Q0xGQUdTLXRvLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LWJ1aS5wYXRjaApAQCAtMSwyMiArMSwy
MyBAQAotRnJvbSBmMGRkZDdjMzY1NTZhZDA1YzEzOThmZGQxMzI5NDczMjNhZDI2NDczIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ODNmMDA1YWNkNzQzMTMyNmZhZDBkMzkyYWRkYjVl
MThhNzMxOTQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9u
Z3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCA2IERlYyAyMDE4IDExOjQzOjQxICsw
ODAwCi1TdWJqZWN0OiBbUEFUQ0ggMi8yXSBkbyBub3QgZGlzcGxheSBDTEZBR1MgdG8gaW1wcm92
ZSByZXByb2R1Y2liaWxpdHkgYnVpbGQKK1N1YmplY3Q6IFtQQVRDSF0gZG8gbm90IGRpc3BsYXkg
Q0xGQUdTIHRvIGltcHJvdmUgcmVwcm9kdWNpYmlsaXR5IGJ1aWxkCiAKIE1hY3JvIFBBX0NGTEFH
UyBjb250YWlucyBidWlsZCBwYXRoLCBkbyBub3QgdXNlIGl0IHRvCiBkaXNwbGF5IENGTEFHUyB3
aGljaCBjb3VsZCBpbXByb3ZlIHJlcHJvZHVjaWJpbGl0eSBidWlsZC4KIAogVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtvZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgc3JjL2RhZW1vbi9tYWluLmMg
fCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9zcmMvZGFlbW9uL21haW4uYyBiL3NyYy9kYWVtb24vbWFpbi5jCi1pbmRl
eCAzMGVmNDk5Li41YzNhYmYwIDEwMDY0NAoraW5kZXggOTI0YTRkNC4uNTRiNGM1YiAxMDA2NDQK
IC0tLSBhL3NyYy9kYWVtb24vbWFpbi5jCiArKysgYi9zcmMvZGFlbW9uL21haW4uYwotQEAgLTkx
Niw3ICs5MTYsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKSB7CitAQCAtMTA3
MSw3ICsxMDcxLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkgewogICAgICBw
YV9zZXRfZW52X2FuZF9yZWNvcmQoIlBVTFNFX1NZU1RFTSIsIGNvbmYtPnN5c3RlbV9pbnN0YW5j
ZSA/ICIxIiA6ICIwIik7CiAgCiAgICAgIHBhX2xvZ19pbmZvKCJUaGlzIGlzIFB1bHNlQXVkaW8g
JXMiLCBQQUNLQUdFX1ZFUlNJT04pOwpAQCAtMjUsNiArMjYsMyBAQCBpbmRleCAzMGVmNDk5Li41
YzNhYmYwIDEwMDY0NAogIAogICNpZmRlZiBIQVZFX0xJQlNBTVBMRVJBVEUKICAgICAgcGFfbG9n
X3dhcm4oIkNvbXBpbGVkIHdpdGggREVQUkVDQVRFRCBsaWJzYW1wbGVyYXRlIHN1cHBvcnQhIik7
Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9wdWxz
ZWF1ZGlvL3B1bHNlYXVkaW9fMTYuMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3B1bHNl
YXVkaW8vcHVsc2VhdWRpb18xNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3B1bHNlYXVkaW8vcHVsc2VhdWRpb18xNi4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW9fMTcu
MC5iYgppbmRleCA2NDAwMmNkMWNjLi41NGM3OWI0MDk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW9fMTYuMS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW9fMTcuMC5iYgpAQCAtNiw1ICs2
LDUgQEAgU1JDX1VSSSA9ICJodHRwOi8vZnJlZWRlc2t0b3Aub3JnL3NvZnR3YXJlL3B1bHNlYXVk
aW8vcmVsZWFzZXMvJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL3ZvbGF0aWxlcy4w
NF9wdWxzZSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRveHlnZW4tbWVzb24uYnVpbGQtcmVt
b3ZlLWRlcGVuZGVuY3ktb24tZG94eWdlbi1iaW4ucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOGVlZjMyY2U5MWQ0Nzk3OWY5NWZkOWE5MzVlNzM4Y2Q3ZWI3NDYz
NDMwZGFiYzcyODYzMjUxNzUxZTUwNGFlNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNTM3OTRk
NjY3MWEzZTM5N2Q4NDllNDc4YTgwYjgyYTYzY2I5ZDhjYTI5NmJkMzViNzMzMTdiYjVjZWI4N2I1
IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicHVsc2VhdWRpby0oP1A8cHZlcj5cZCsoXC4oPyE5
OSlcZCspKylcLnRhciIKLS0gCjIuNDIuMAoK

--===============5194784649885467015==--

