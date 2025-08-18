Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBEACA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 20:00:02 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.823.1755547192926952799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 12:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=A5bs/Hao;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250818195950c92021bce9e4a2fa14-mikgx3@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250818195950c92021bce9e4a2fa14
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 Aug 2025 21:59:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=X3LQFOPX9GS/v7uvGzGJswcT1YaR15ISMC89fKw/SBE=;
 b=A5bs/HaoQ+5I2hzTnPUISOms0KizEu5uCNlLQrArB5QwEctxNnGUEd3fJjW+BrFxcm+6jG
 SRTOo1ECmrVtBzGRo25bmMBy41szvrRG3I6EmH6pEhB4QBsOuQxGuEAE8TtfdpJHh/7A8sN/
 PGwxY7l91/QLBniFFDl8DTzq8Se4V0u2phd1hlLJADg137E+tFYoBeyuCncQHUv38El7FRAi
 SFHeWyJm+/i8hdynTJEz+YWQ6SyTQJXAGZGMxb2Bm2Q+6jILIP6wvWlXKQZDDbqCqz9929Ad
 7yNPCeNcX1ZaDirwALiQ0noAZqDfira9a/s6VQIL3+iqrufEdCQ9IUrw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 1/4] glib-2.0: update 2.84.0 -> 2.84.1
Date: Mon, 18 Aug 2025 21:58:54 +0200
Message-Id: <20250818195857.2459975-1-peter.marko@siemens.com>
In-Reply-To: <20250818172457.1683617-1-peter.marko@siemens.com>
References: <20250818172457.1683617-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 20:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222050

From: Markus Volk <f_l_k@t-online.de>

- remove backport patch

Overview of changes in GLib 2.84.1, 2025-04-03
==============================================

* Fix test failure when building against gobject-introspection ≥1.83.4 (#3634,
  work by Philip Withnall)

* Bugs fixed:
  - #3630 2.84.0 build failure on Linux: ../gio/gnetworkmonitornetlink.c:47:10:
    fatal error: netlink/netlink_route.h: No such file or directory (Philip
    Withnall)
  - #3634 test failure with gobject-introspection 1.83.4: warning: element
    doc:format from state 3 is unknown, ignoring (Philip Withnall)
  - #3636 gio/trash does not handle special characters well
  - #3642 `g_cancellable_connect()` documentation incorrect (Marco Trevisan
    (Treviño))
  - #3643 g_cancellable_connect(): is it safe to unref cancellable from
    callback? (Marco Trevisan (Treviño))
  - #3649 Crash with some registry key values in GWin32AppInfo (Philip Withnall)
  - !4484 Memory sanitizer fixes
  - !4489 gobject: Be consistent in using atomic logic to handle the
    GParamSpecPool
  - !4541 gsettings: Port docs to gi-docgen format, add missing annotations and
    make various improvements
  - !4544 tests: Don't install runner scripts without installed_tests
  - !4545 Update French translation
  - !4547 Update Catalan translation
  - !4548 Update Turkish translation
  - !4551 Updated Danish translation
  - !4552 Update Persian translation
  - !4553 docs: Document GSignalFlags members added after 2.0
  - !4554 Update Indonesian translation
  - !4555 tests: Add a test for g_object_freeze_notify() being called too often
  - !4557 gfileinfo: Slightly expand docs for
    g_file_info_get_attribute_as_string()
  - !4558 gi: Dynamically set doc-format
  - !4561 tests: Various fixes to create temporary files in /tmp rather than the
    build directory
  - !4562 gdbusnameowning: Convert docs to gi-docgen linking syntax
  - !4563 giounix-private: Fix macro for checking for epoll_create1()
  - !4565 Fix LGPL in header
  - !4567 gutils: make documentation of g_set_prgname() clearer
  - !4568 docs: Add some detail
  - !4569 Update Romanian translation
  - !4570 gspawn-win32: Fix potential integer overflows in argv handling
  - !4571 gvarianttype: Improve docs on type validation

* Translation updates:
  - Catalan (Jordi Mas)
  - Danish (Ask Hjorth Larsen)
  - French (Vincent Chatelain)
  - Indonesian (Andika Triwidada)
  - Persian (Danial Behzadi)
  - Romanian (Antonio Marin)
  - Turkish (Sabri Ünal)

(From OE-Core rev: 676b9acbe94f055a351da3bdcfbe457411e1877c)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This upgrade fixes CVE-2025-4056

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...664e6f1a29e0d5f301979f6d168b08435a61.patch | 75 -------------------
 ...l_2.84.0.bb => glib-2.0-initial_2.84.1.bb} |  0
 ...{glib-2.0_2.84.0.bb => glib-2.0_2.84.1.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 4 files changed, 1 insertion(+), 77 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.0.bb => glib-2.0-initial_2.84.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.0.bb => glib-2.0_2.84.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch b/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch
deleted file mode 100644
index 28bce02dc3..0000000000
--- a/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From aee0664e6f1a29e0d5f301979f6d168b08435a61 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Mon, 10 Mar 2025 15:21:15 +0000
-Subject: [PATCH] girparser: Ignore new doc:format element in GIR files
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-As of gobject-introspection 1.83.2, a new `<doc:format name="…"/>`
-element is supported (as a child of `<repository>`) in GIR files.
-
-For the moment, this information isn’t needed in libgirepository — but
-the GIR parser does have to know about the element in order to not throw
-an error claiming it’s invalid.
-
-This is a slightly tweaked version of the code added to
-gobject-introspection.git in commit
-9544cd6c962fab2c3203898779948309833e2439 by Corentin Noël
-<corentin.noel@collabora.com>, reformatted slightly to fit in with
-GLib’s style guidelines.
-
-This is backwards compatible and does not require a new
-gobject-introspection version.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3634
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- girepository/girparser.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/girepository/girparser.c b/girepository/girparser.c
-index 63143718d9..be88d871a4 100644
---- a/girepository/girparser.c
-+++ b/girepository/girparser.c
-@@ -107,7 +107,8 @@ typedef enum
-   STATE_ALIAS,
-   STATE_TYPE,
-   STATE_ATTRIBUTE,
--  STATE_PASSTHROUGH
-+  STATE_PASSTHROUGH,
-+  STATE_DOC_FORMAT,  /* 35 */
- } ParseState;
- 
- typedef struct _ParseContext ParseContext;
-@@ -3159,6 +3160,11 @@ start_element_handler (GMarkupParseContext  *context,
-           state_switch (ctx, STATE_PASSTHROUGH);
-           goto out;
-         }
-+      else if (strcmp ("doc:format", element_name) == 0)
-+        {
-+          state_switch (ctx, STATE_DOC_FORMAT);
-+          goto out;
-+        }
-       break;
- 
-     case 'e':
-@@ -3843,6 +3849,10 @@ end_element_handler (GMarkupParseContext  *context,
-           state_switch (ctx, ctx->prev_state);
-         }
-       break;
-+    case STATE_DOC_FORMAT:
-+      if (require_end_element (context, ctx, "doc:format", element_name, error))
-+        state_switch (ctx, STATE_REPOSITORY);
-+      break;
- 
-     case STATE_PASSTHROUGH:
-       ctx->unknown_depth -= 1;
--- 
-GitLab
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 61e1a3ef17..4368e51df8 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -229,13 +229,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
-           file://aee0664e6f1a29e0d5f301979f6d168b08435a61.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a"
+SRC_URI[sha256sum] = "2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab6bb73396bf30789a"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

