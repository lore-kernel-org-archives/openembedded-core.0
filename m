Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 724216AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 17:39:44 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g23so111618262wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ZzIuppm5PKKVEYqw78RFgOXuaF/v71DFsky2Z0oc9V0=;
	b=VHkS5yGRWEeHYhFWu/zgtL0R4fh6qCUJIx6KyQxyGIZ/HsTS0NFuPnsq3dNRkubRaF
	jG1Ox3f1uupz0kt26EDTM8dn2lo/T9TjJby0jzxoTYJe7rM8kMojxHxBA4WWrXXmCa5e
	ry0VMvX+zhMuok0+qOe9Gax9TRyIctlb6Z4+5rKjxWUwKMWh9MAwF285NWiqPwLaZHmB
	9PY6zLIki3F1lp1mcP+FuTRP3i3FR4UjKDyrBZMBfCaZQM046mDJDQP9JPfiyShWryoS
	GQToKEZgDkTvDHb7U/nWiPuFvG7UAn+QK0W0FT0uU020GYxSgQju4/JVsFpbPzD9fO/x
	ynbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZzIuppm5PKKVEYqw78RFgOXuaF/v71DFsky2Z0oc9V0=;
	b=Pvc86Gm3sY5yMSaN5z9abjYdi2Xh1tLnaXAd1evPehQFXOT0ZLGaySCnr5L5KCNZYV
	MTFWKrWLhCs4UZst1pzkP53wJew+baukNaRj8u6+iEgUb822dqA9Ae5XGvXRCYcOiB/j
	rIUf6+6ojgJ2senn4eIwdFPPT2iG8XgY6c4D2wZ77Gj7DFmws9o4emwC2UT0PFOv+p/A
	KnXykHIvzMR8FpK5IO5LBo8vR5ONwe7Ysf9ZZ7AXxb23piw9IdOi1v8RFT734JIaQKKc
	UagJLLmkZtYfku2vt+AR34X3h9ScSxg9Y+TBXDPmCXjiV8QE+1iOkfAj6VcscCrxazSt
	ilkg==
X-Gm-Message-State: ABUngvclmYv4ygP8ufqMtBGsBXYYqtoKw9tge+Bw19uPw3+SGxhdGjEdkZZoWtlGaxb4NArC
X-Received: by 10.194.119.196 with SMTP id kw4mr2224390wjb.181.1479145185378; 
	Mon, 14 Nov 2016 09:39:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r138sm23344153wme.9.2016.11.14.09.39.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Nov 2016 09:39:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 17:39:40 +0000
Message-Id: <1479145180-25985-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] glib: remove obsolete gi-exclude patch
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
X-List-Received-Date: Mon, 14 Nov 2016 17:39:45 -0000

This patch has been superseded by 2907b1 in gobject-introspection, which we're
now shipping.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/gi-exclude.patch             | 59 ----------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb      |  1 -
 2 files changed, 60 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gi-exclude.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/gi-exclude.patch b/meta/recipes-core/glib-2.0/glib-2.0/gi-exclude.patch
deleted file mode 100644
index dc62b92..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/gi-exclude.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-The autoptr types should be excluded from gobject-introspection parsing as
-they're not user-facing.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/gio/gio-autocleanups.h b/gio/gio-autocleanups.h
-index a95ba65..24ccc2d 100644
---- a/gio/gio-autocleanups.h
-+++ b/gio/gio-autocleanups.h
-@@ -21,6 +21,8 @@
- #error "Only <gio/gio.h> can be included directly."
- #endif
- 
-+#ifndef __GI_SCANNER__
-+
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GAction, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GActionMap, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GAppInfo, g_object_unref)
-@@ -146,3 +148,5 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GVolume, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GVolumeMonitor, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GZlibCompressor, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GZlibDecompressor, g_object_unref)
-+
-+#endif
-diff --git a/glib/glib-autocleanups.h b/glib/glib-autocleanups.h
-index 6355f75..09d28be 100644
---- a/glib/glib-autocleanups.h
-+++ b/glib/glib-autocleanups.h
-@@ -21,6 +21,8 @@
- #error "Only <glib.h> can be included directly."
- #endif
- 
-+#ifndef __GI_SCANNER__
-+
- static inline void
- g_autoptr_cleanup_generic_gfree (void *p)
- {
-@@ -87,3 +89,5 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GVariantDict, g_variant_dict_unref)
- G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GVariantDict, g_variant_dict_clear)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GVariantType, g_variant_type_free)
- G_DEFINE_AUTO_CLEANUP_FREE_FUNC(GStrv, g_strfreev, NULL)
-+
-+#endif
-diff --git a/gobject/gobject-autocleanups.h b/gobject/gobject-autocleanups.h
-index 980203f..a1d4ba1 100644
---- a/gobject/gobject-autocleanups.h
-+++ b/gobject/gobject-autocleanups.h
-@@ -21,6 +21,10 @@
- #error "Only <glib-object.h> can be included directly."
- #endif
- 
-+#ifndef __GI_SCANNER__
-+
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GObject, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GInitiallyUnowned, g_object_unref)
- G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GValue, g_value_unset)
-+
-+#endif
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
index 17016c8..e4fccc7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
-           file://gi-exclude.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
-- 
2.8.1


