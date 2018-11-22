Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 669836C5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:42:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c126so9509395wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j2TA6vlRkFp0O4Xzu98+PnumTOVaYtycgn9Lr48jjTs=;
	b=mH7rvKQgFQQTRdRYkhTWDu3jvaXGPp73bYhjv1wIxbvazJzS2+iUbrzx1Y4LJS4EOQ
	Ib1BhmBixPGxV4XeFSLw0Ubv0/EOGWPgWcMZYRA4QAfaIYjqAPVz9rfvNLNrx4JuICFG
	xWFmLCSi3p3iqGfLoaCD6Lz9Z9VmHaHxtdeW9b5urm8FLOIvvyKZDWn5Wzeon12PGesy
	H3I2V95nlm/a7yuf6H1YGtxru1PzYG6J3QAVan3k0l18vK5a/N3DBvJPHCiNYVjf3fp0
	2KGLia7emyJXb2m73pv1TAgSlxku3D68xVfYK1lPh+XVd+Isq1iiVdNpC8ZG2EcDVhfe
	NMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j2TA6vlRkFp0O4Xzu98+PnumTOVaYtycgn9Lr48jjTs=;
	b=EwCPzC4/V2Ch70/jCEfBtiAQvwd/8qPzv7BJ/RbQyw9HLXQh3RRYncVl5+26SqhjfJ
	wCB+ESDhu2/YM0K2tBuJSD7Y2uKaNcBKrScNiq3kcDC6vZbgnRmugVTkhRNSK+IIwFka
	LoViFt8ZSKbAZCEpHVzLTA89jRhtZ+KWuCJxZOOaXKQVt6+xqPkVIs31uvhJFCTqM4RE
	RzHDL3VohBZ0BXICNR7jTOrvzFtVRwdZfzoI7U1SjtsT1ItreIk1IHi7f3iUdtMOmCQL
	zs1lm68qHpb3fmUHF97AZDl4GmqVTg/1utVOrQZfF3gPVz5xguIPlgBk5Y2AZMxHfjq7
	mNfw==
X-Gm-Message-State: AGRZ1gKV5wjrC63z0szuvyy0IwJPAWnFSt5jMoJoomxCxbH0MUTxFMyn
	/uETrP4/orp3/vfLZjkGDRhVRKQ+
X-Google-Smtp-Source: AJdET5dfZwuKnWg4zZAsdJyzjKZ8Pf7xFlTdxavohypB76s2BnjqOUO1u6v+5zgm6iy9bL7tfc2xIg==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr10460969wma.85.1542901320945; 
	Thu, 22 Nov 2018 07:42:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:42:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:32 +0100
Message-Id: <20181122154136.121480-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/16] sysprof: update to 3.30.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 15:42:00 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...fix-non-literal-format-string-issues.patch | 34 -----------------
 .../sysprof/files/wordsize.patch              | 38 -------------------
 .../{sysprof_3.30.0.bb => sysprof_3.30.2.bb}  |  6 +--
 3 files changed, 2 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/wordsize.patch
 rename meta/recipes-kernel/sysprof/{sysprof_3.30.0.bb => sysprof_3.30.2.bb} (82%)

diff --git a/meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch b/meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch
deleted file mode 100644
index 38f9f5f66a8..00000000000
--- a/meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From de13d1f908335cc882c447e4d7c4360b9e5da190 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 6 Sep 2018 17:49:44 -0700
-Subject: [PATCH] fix non-literal format string issues
-
-clang errors out when using -Werror=format-nonliteral
-since the definition of g_strdup_vprintf() from glib-2.0
-is using va_list and clangs still warns where as
-gcc doesn't do that for va_list arguments
-
-Fixes
-src/sp-window.c:96:27: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-|   str = g_strdup_vprintf (format, args);
-|                           ^~~~~~
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/merge_requests/6]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sp-window.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sp-window.c b/src/sp-window.c
-index 4dfac2d..aff4779 100644
---- a/src/sp-window.c
-+++ b/src/sp-window.c
-@@ -80,7 +80,7 @@ static guint signals [N_SIGNALS];
- static void sp_window_set_profiler (SpWindow   *self,
-                                     SpProfiler *profiler);
- 
--static void
-+static G_GNUC_PRINTF(3, 4) void
- sp_window_notify_user (SpWindow       *self,
-                        GtkMessageType  message_type,
-                        const gchar    *format,
diff --git a/meta/recipes-kernel/sysprof/files/wordsize.patch b/meta/recipes-kernel/sysprof/files/wordsize.patch
deleted file mode 100644
index d65b13a682f..00000000000
--- a/meta/recipes-kernel/sysprof/files/wordsize.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/merge_requests/5]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From bc7e3e27c28d0bab8bea72f2314191532b2e7840 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 7 Sep 2018 01:30:09 +0100
-Subject: [PATCH] capture: use size of void* instead of glibc-specific
- __WORDSIZE
-
-__WORDSIZE is glibc-specific so sp-capture-types.h doesn't work with musl.
----
- lib/capture/sp-capture-types.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/lib/capture/sp-capture-types.h b/lib/capture/sp-capture-types.h
-index 48fcfb8..1d6cd1d 100644
---- a/lib/capture/sp-capture-types.h
-+++ b/lib/capture/sp-capture-types.h
-@@ -32,12 +32,14 @@ G_BEGIN_DECLS
- #define SP_CAPTURE_MAGIC (GUINT32_TO_LE(0xFDCA975E))
- #define SP_CAPTURE_ALIGN (sizeof(SpCaptureAddress))
- 
--#if __WORDSIZE == 64
-+#if GLIB_SIZEOF_VOID_P == 8
- # define SP_CAPTURE_JITMAP_MARK    G_GUINT64_CONSTANT(0xE000000000000000)
- # define SP_CAPTURE_ADDRESS_FORMAT "0x%016lx"
--#else
-+#elif GLIB_SIZEOF_VOID_P == 4
- # define SP_CAPTURE_JITMAP_MARK    G_GUINT64_CONSTANT(0xE0000000)
- # define SP_CAPTURE_ADDRESS_FORMAT "0x%016llx"
-+#else
-+#error Unknown GLIB_SIZEOF_VOID_P
- #endif
- 
- #define SP_CAPTURE_CURRENT_TIME   (sp_clock_get_current_time())
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb b/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
similarity index 82%
rename from meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
index 19dcf25a51d..866642cd1ea 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
@@ -9,13 +9,11 @@ inherit gnomebase gettext systemd upstream-version-is-even
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
-SRC_URI[archive.md5sum] = "ae896a8a2364e18c07fafa9573202f59"
-SRC_URI[archive.sha256sum] = "29cd2c4be277f00698dce48259219557c4fddc2c01254b8fac95900a8c663f63"
+SRC_URI[archive.md5sum] = "80cb47906eced2e7b9976bf00deec323"
+SRC_URI[archive.sha256sum] = "e90878e5a509bd79d170a7a51d47cc5508ab1363afaf0d97654373dfd9c8ba0b"
 SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
-           file://wordsize.patch \
-           file://0001-fix-non-literal-format-string-issues.patch \
            "
 RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://bugzilla.gnome.org/show_bug.cgi?id=794625"
 
-- 
2.17.1


