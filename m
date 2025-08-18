Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0DDCA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 20:00:22 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.743.1755547220269736559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 13:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Gm0esEdG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202508182000187c90863c3ffb4da718-yz2p7i@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202508182000187c90863c3ffb4da718
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 Aug 2025 22:00:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=b3LyHH6UXjcDTR+1o27dJw7TWKYaEeDBbptgsonybHA=;
 b=Gm0esEdGbAYIGRm3WgpoCZ7EZrhGXX4++L1BJS4EXwFbhseHT1XvCNmrHIdE/2gLV9d15e
 lC1SpUWRcrCc+zERmyiX5+b2hp5/dn6bRBi2x5sGhxfAHAg6p9MEcbLUTkeHN0qUOueDx9lA
 1UvITFocqTvvno0U71npdmSGYvmYlOCGpZ24016/bDTZRSerQCFlupLmtmvNLB0MwMhJOkce
 PwxMI+6+mZpCT04sGZ1wF0Mql/A65I7ItxD2/dCt7GEi6gD0FQXYlyzIW8ssgqhmXdZzz4Lc
 8rdMaiz64SC60xz3rOn0ohxnspA2+tecIj8iEUfHGh8Yc1Ht9fBvKGsw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 3/4] glib-2.0: update 2.84.2 -> 2.84.4
Date: Mon, 18 Aug 2025 21:58:56 +0200
Message-Id: <20250818195857.2459975-3-peter.marko@siemens.com>
In-Reply-To: <20250818195857.2459975-1-peter.marko@siemens.com>
References: <20250818172457.1683617-1-peter.marko@siemens.com>
 <20250818195857.2459975-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 20:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222052

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
index 819f3ff50a..c171598bed 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -234,7 +234,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f"
+SRC_URI[sha256sum] = "8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

