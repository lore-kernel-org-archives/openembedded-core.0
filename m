Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.37288.1597028386071408741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 19:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0HqyUknE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id e4so4049649pjd.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 19:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MnTV4XIhtW4yVAQpL3xUtXYRpyTYYbhCL3FTSMI+jM8=;
        b=0HqyUknEC6QycCHdyplS5gUjNm4UPEH5D8Z3oB7oLbSIXsIG3mca7T6eR7ZwyxDRJH
         jCIOc7bKWoHTxSicJp4auq/VbYumKGkBXujDyjQwQeqZY4mJy6eF9NK0hOcxjFfoxDgS
         g0+cYH0B1vKZTlokkFpAzndFQOxxI4Jg0v37FSI+VuMpuLiDWO5IInmU02AYE6a2zXp/
         VQ/L8MDA10GFn8baxaik5Lng7TMx7DgPguWNKbBpRa2PWnwNjb2pbXpd9/3sbsPWNcMP
         OVybEJL9PxNHsmE1/m3o8cf4DI9G5LHqZ7p/gXsU6ewPHa6EFpF4MzWneFhdHdsiiy2i
         k7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MnTV4XIhtW4yVAQpL3xUtXYRpyTYYbhCL3FTSMI+jM8=;
        b=ILPR2EF6lSbWdLAxi2+UsTSsvPcE2b5C1y3eMwzHfQtZ0fmuSKUMf3RTeBBUpa/jK6
         Rq2dwe9C7+tr/+D8mx81FdxmNjW0GjTLb/bebAsouTZ88xjK4USYiiWY81BMb726/gtS
         yfsftyuGJtMTxdHzRyTN6gSzNcGLIbT9kaVms76ocOx6Pg8GJabxFF8o5SLEnncgl52x
         QYVYQZSjfb4nvv/KRySjBKYlJo8tBtVrnUwqKuuy0UWCzEZtUMxLhfF4VAJfkiqe9q1x
         nNuu3KbbVnFn9LyvJF72Tcpmwvr25tj2X87tAriFeYW+r+T4cPlAkrOS6w24g1QXJWCp
         HsBg==
X-Gm-Message-State: AOAM5337C433Ycu+ZUs2oGoHolIAObsE+0Fo6uFAmYR31ZwF02GSt62F
	rhN0p8S44MQ0BWJRs27IzGYbnJDczrPmzg==
X-Google-Smtp-Source: ABdhPJyVENx2iTeZPKeXAfkCpEC6T3+kv6BSUeXSQc/L1LiHa3p7fbCM/LOCgcZyXTHMaR4UFSaQtw==
X-Received: by 2002:a17:902:b584:: with SMTP id a4mr21954260pls.341.1597028384737;
        Sun, 09 Aug 2020 19:59:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.19.59.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 19:59:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/19] glib-2.0: update 2.62.4 to 2.62.5
Date: Sun,  9 Aug 2020 16:59:08 -1000
Message-Id: <d1c337161f70893cd4eec15364c6c41d5040ccc6.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Stable branch bug fix and security release.

One patch updated, three removed since they are no longer needed

Changes (from release notes):

Fix potential relative read when calling g_printerr(), which could lead to a
denial of service from a setuid-root process being used to block access to the
TTY for another user (#1919)
Fix SOCKS proxy resolver sometimes not being used when resolving addresses
via Happy Eyeballs (CVE-2020-6750) (#1989)
Several other Happy Eyeballs fixes for address resolution (#1871, #1872, #1902)
Fix parsing of full Julian day range from $TZ environment variable (#1999)
Several race condition/crash fixes (!1353, !1357)

Bugs fixed:

1919 read from relative path in g_printerr() in 2.58.3
1995 Tracker issue for Happy Eyeballs regressions
1999 GTimeZone fails to accept full Julian day range when parsing the direct $TZ string format
1323 Backport !1314 “gtimezone: fix parsing of Julian day in POSIX TZ format” to glib-2-62
1331 Backport !1330 “W32: Correctly set st_ino when doing private stat()” to glib-2-62
1352 Backport !1351 “glib.supp: update g-threaded-resolver-getaddrinfo-config” to glib-2-62
1361 Backport !1353 GMainContext source reference fixes to glib-2-62
1365 Refactor g_socket_client_connect_async()
1370 Backport !1369 “build: Rework path construction to reliably add prefix” to glib-2-62
1371 Backport !1357 “gunixmounts: Make GUnixMountMonitor thread-safe” to glib-2-62

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...t-write-bindir-into-pkg-config-files.patch |   2 +-
 ...-GSource-iterator-if-iteration-can-m.patch |  43 -------
 ...-memory-leaks-and-memory-corruption-.patch | 109 ------------------
 ...e-mutex-unlocking-in-destructor-righ.patch |  36 ------
 ...{glib-2.0_2.62.4.bb => glib-2.0_2.62.5.bb} |   7 +-
 5 files changed, 3 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.62.4.bb => glib-2.0_2.62.5.bb} (83%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index edac4c9f75..8dd959b7e2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -22,7 +22,7 @@ index 71e88c4..8ce3987 100644
 @@ -831,14 +831,14 @@ pkg.generate(libgio,
                 'schemasdir=' + join_paths('${datadir}', schemas_subdir),
                 'bindir=' + join_paths('${prefix}', get_option('bindir')),
-                'giomoduledir=' + giomodulesdir,
+                'giomoduledir=' + pkgconfig_giomodulesdir,
 -               'gio=' + join_paths('${bindir}', 'gio'),
 -               'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
 -               'glib_compile_schemas=' + join_paths('${bindir}', 'glib-compile-schemas'),
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch b/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
deleted file mode 100644
index 37b77d567c..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ef2be42998e3fc10299055a5a01f7c791538174c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Mon, 3 Feb 2020 15:38:28 +0200
-Subject: [PATCH] GMainContext - Fix GSource iterator if iteration can modify
- the list
-
-We first have to ref the next source and then unref the previous one.
-This might be the last reference to the previous source, and freeing the
-previous source might unref and free the next one which would then leave
-use with a dangling pointer here.
-
-Fixes https://gitlab.gnome.org/GNOME/glib/issues/2031
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/b06c48de7554607ff3fb58d6c0510cfa5088e909]
-
----
- glib/gmain.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/glib/gmain.c b/glib/gmain.c
-index af979c8..a9a287d 100644
---- a/glib/gmain.c
-+++ b/glib/gmain.c
-@@ -969,13 +969,17 @@ g_source_iter_next (GSourceIter *iter, GSource **source)
-    * GSourceList to be removed from source_lists (if iter->source is
-    * the only source in its list, and it is destroyed), so we have to
-    * keep it reffed until after we advance iter->current_list, above.
-+   *
-+   * Also we first have to ref the next source before unreffing the
-+   * previous one as unreffing the previous source can potentially
-+   * free the next one.
-    */
-+  if (next_source && iter->may_modify)
-+    g_source_ref (next_source);
-
-   if (iter->source && iter->may_modify)
-     g_source_unref_internal (iter->source, iter->context, TRUE);
-   iter->source = next_source;
--  if (iter->source && iter->may_modify)
--    g_source_ref (iter->source);
-
-   *source = iter->source;
-   return *source != NULL;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
deleted file mode 100644
index cf97d9d3db..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 611430a32a46d0dc806a829161e2dccf9c0196a8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Mon, 3 Feb 2020 15:35:51 +0200
-Subject: [PATCH] GMainContext - Fix memory leaks and memory corruption when
- freeing sources while freeing a context
-
-Instead of destroying sources directly while freeing the context, and
-potentially freeing them if this was the last reference to them, collect
-new references of all sources in a separate list before and at the same
-time invalidate their context so that they can't access it anymore. Only
-once all sources have their context invalidated, destroy them while
-still keeping a reference to them. Once all sources are destroyed we get
-rid of the additional references and free them if nothing else keeps a
-reference to them anymore.
-
-This fixes a regression introduced by 26056558be in 2012.
-
-The previous code that invalidated the context of each source and then
-destroyed it before going to the next source without keeping an
-additional reference caused memory leaks or memory corruption depending
-on the order of the sources in the sources lists.
-
-If a source was destroyed it might happen that this was the last
-reference to this source, and it would then be freed. This would cause
-the finalize function to be called, which might destroy and unref
-another source and potentially free it. This other source would then
-either
-- go through the normal free logic and change the intern linked list
-  between the sources, while other sources that are unreffed as part of
-  the main context freeing would not. As such the list would be in an
-  inconsistent state and we might dereference freed memory.
-- go through the normal destroy and free logic but because the context
-  pointer was already invalidated it would simply mark the source as
-  destroyed without actually removing it from the context. This would
-  then cause a memory leak because the reference owned by the context is
-  not freed.
-
-Fixes https://github.com/gtk-rs/glib/issues/583 while still keeping
-https://bugzilla.gnome.org/show_bug.cgi?id=661767 fixes.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/aa20167d419c649f34fed06a9463890b41b1eba0]
-
----
- glib/gmain.c | 35 ++++++++++++++++++++++++++++++++++-
- 1 file changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/glib/gmain.c b/glib/gmain.c
-index a9a287d..10ba2f8 100644
---- a/glib/gmain.c
-+++ b/glib/gmain.c
-@@ -538,6 +538,7 @@ g_main_context_unref (GMainContext *context)
-   GSourceIter iter;
-   GSource *source;
-   GList *sl_iter;
-+  GSList *s_iter, *remaining_sources = NULL;
-   GSourceList *list;
-   guint i;
-
-@@ -557,10 +558,30 @@ g_main_context_unref (GMainContext *context)
-
-   /* g_source_iter_next() assumes the context is locked. */
-   LOCK_CONTEXT (context);
--  g_source_iter_init (&iter, context, TRUE);
-+
-+  /* First collect all remaining sources from the sources lists and store a
-+   * new reference in a separate list. Also set the context of the sources
-+   * to NULL so that they can't access a partially destroyed context anymore.
-+   *
-+   * We have to do this first so that we have a strong reference to all
-+   * sources and destroying them below does not also free them, and so that
-+   * none of the sources can access the context from their finalize/dispose
-+   * functions. */
-+  g_source_iter_init (&iter, context, FALSE);
-   while (g_source_iter_next (&iter, &source))
-     {
-       source->context = NULL;
-+      remaining_sources = g_slist_prepend (remaining_sources, g_source_ref (source));
-+    }
-+  g_source_iter_clear (&iter);
-+
-+  /* Next destroy all sources. As we still hold a reference to all of them,
-+   * this won't cause any of them to be freed yet and especially prevents any
-+   * source that unrefs another source from its finalize function to be freed.
-+   */
-+  for (s_iter = remaining_sources; s_iter; s_iter = s_iter->next)
-+    {
-+      source = s_iter->data;
-       g_source_destroy_internal (source, context, TRUE);
-     }
-   UNLOCK_CONTEXT (context);
-@@ -585,6 +606,18 @@ g_main_context_unref (GMainContext *context)
-   g_cond_clear (&context->cond);
-
-   g_free (context);
-+
-+  /* And now finally get rid of our references to the sources. This will cause
-+   * them to be freed unless something else still has a reference to them. Due
-+   * to setting the context pointers in the sources to NULL above, this won't
-+   * ever access the context or the internal linked list inside the GSource.
-+   * We already removed the sources completely from the context above. */
-+  for (s_iter = remaining_sources; s_iter; s_iter = s_iter->next)
-+    {
-+      source = s_iter->data;
-+      g_source_unref_internal (source, NULL, FALSE);
-+    }
-+  g_slist_free (remaining_sources);
- }
-
- /* Helper function used by mainloop/overflow test.
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch b/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
deleted file mode 100644
index 4c9e9f5182..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3e9d85f1b75e2b1096d9643563d7d17380752fc7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 11 Feb 2020 09:34:38 +0200
-Subject: [PATCH] GMainContext - Move mutex unlocking in destructor right
- before freeing the mutex
-
-This does not have any behaviour changes but is cleaner. The mutex is
-only unlocked now after all operations on the context are done and right
-before freeing the mutex and the context itself.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/730a75fc8e8271c38fbd5363d1f77a00876b9ddc]
-
----
- glib/gmain.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/glib/gmain.c b/glib/gmain.c
-index 10ba2f8..b1df470 100644
---- a/glib/gmain.c
-+++ b/glib/gmain.c
-@@ -584,7 +584,6 @@ g_main_context_unref (GMainContext *context)
-       source = s_iter->data;
-       g_source_destroy_internal (source, context, TRUE);
-     }
--  UNLOCK_CONTEXT (context);
-
-   for (sl_iter = context->source_lists; sl_iter; sl_iter = sl_iter->next)
-     {
-@@ -595,6 +594,7 @@ g_main_context_unref (GMainContext *context)
-
-   g_hash_table_destroy (context->sources);
-
-+  UNLOCK_CONTEXT (context);
-   g_mutex_clear (&context->mutex);
-
-   g_ptr_array_free (context->pending_dispatches, TRUE);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.5.bb
similarity index 83%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.62.5.bb
index d496235003..e463dd9b7c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.5.bb
@@ -16,15 +16,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch \
-           file://0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch \
-           file://0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "d52234ecba128932bed90bbc3553bfe5"
-SRC_URI[sha256sum] = "4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc"
+SRC_URI[md5sum] = "4029ea2df04a8d4c360e45d9e8316784"
+SRC_URI[sha256sum] = "b8d1cdafa46658b63d7512efbe2cd21bd36cd7be83140e44930c47b79f82452e"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.17.1

