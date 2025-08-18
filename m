Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506A3CA0EE9
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 19:57:02 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.731.1755547014952201036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 12:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HMudSYL1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202508181956502e6ab4b341d4d66702-qdtix8@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202508181956502e6ab4b341d4d66702
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 Aug 2025 21:56:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vA8XTFt5qCiLySgu4hdLT7TPdfVIb94FER4FX8HCMyI=;
 b=HMudSYL16RH+KYsef8NveuvG9THFwCmm5tvg80TU5KIhGH2B5JnXdaPInknDhg+tsviSyg
 3B8utZ1z3Ojq9EcOIXMxFnwiEBYnwSpGGZpniLaDIuCbj0Q2N74+CsREGHTuS5poI1mW54DW
 cYDSMLvJMgeB7D3fKg9vnfZEAWhUb4vINpRHvea0JKcYjHcSh8kwc8ujLtkMT3dzshklcSAY
 Hq6SPK6IpLB1RjZppXary/bTNpdqTwv1VIpMbPgrd3n7hMa4EU6Z+Vou8IDYWhs5CQf+Qc5m
 x0zH96oUimjQyHm8uMCs0MsY0uyJZzmQoeWy7t3TVu8sMScAO5GMNacw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] glib-2.0: update 2.84.2 -> 2.84.4
Date: Mon, 18 Aug 2025 21:56:02 +0200
Message-Id: <20250818195603.2459636-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 19:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222048

From: Peter Marko <peter.marko@siemens.com>

Overview of changes in GLib 2.84.4, 2025-08-08
==============================================
* Bugs fixed:
  - #3716 (CVE-2025-7039) (#YWH-PGM9867-104) Buffer Under-read on GLib through
    glib/gfileutils.c via get_tmp_file() (Michael Catanzaro)
  - #3721 GFile leak in g_local_file_set_display_name during error handling
    (Philip Withnall, Michael Catanzaro)
  - !4668 Backport !4667 “Incorrect output parameter handling in closure helper
    of g_settings_bind_with_mapping_closures” to glib-2-84
  - !4675 Backport !4674 “gfileutils: fix computation of temporary file name” to
    glib-2-84
  - !4679 Backport !4677 and !4678 “Fix GFile leak in
    g_local_file_set_display_name()” to glib-2-84
  - !4697 Backport !4696 “gthreadpool: Catch pool_spawner creation failure” to
    glib-2-84
  - !4705 Backport !4702 “gio/filenamecompleter: Fix leaks” to glib-2-84
  - !4711 Backport !4708 “gfilenamecompleter: Fix g_object_unref() of undefined
    value” to glib-2-84

Overview of changes in GLib 2.84.3, 2025-06-13
==============================================
* Bugs fixed:
  - !4656 Backport !4655 “gstring: Fix overflow check when expanding the string”
    to glib-2-84

!4656 solves first half of CVE-2025-6052

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/0001-meson-Run-atomics-test-on-clang-as-well.patch    | 2 +-
 ...1-meson.build-do-not-enable-pidfd-features-on-native-g.patch | 2 +-
 .../{glib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.4.bb}  | 0
 .../glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.4.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index e5878a1428..5ad2a0375b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -17,7 +17,7 @@ diff --git a/meson.build b/meson.build
 index a8bcadc..041b68e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2075,7 +2075,7 @@ atomicdefine = '''
+@@ -2077,7 +2077,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e512940e34..aa098da379 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -17,7 +17,7 @@ diff --git a/meson.build b/meson.build
 index 041b68e..155bfd4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1073,7 +1073,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1075,7 +1075,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 404c82ef6e..c0044b4cf9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f"
+SRC_URI[sha256sum] = "8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

