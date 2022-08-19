Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742AEC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.483.1660894073933777092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XP/yl+T1;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so607223wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PJp1TI1vp+iJ0SfoAcj+tmJlJZLTruDMuS3YgM/Vi3s=;
        b=XP/yl+T1H6F2bdaTbJzu8ffk6AyeSXrSSYxgR1wg3cRte906+dUWh3a+paCbpTMq2S
         ilm6HmmjKnJafahlj1V4QlxgNF0O1Xz4jnbsMdA4EiWK0P7HbAeyMasuGRlapZ9D3KOp
         2yx6OmQg8towtVumtr7aBQjmoCtqd1+9BpEGwyZ5Dw9pVI1LInoG7jiPVCODU2PYv0pq
         d0Zbc6uOtAzyg1u49pfdhJmfbwgzOLvjbwAmkvOrg79pSG/JECrkA5ZnmpXfXN64i3ia
         POWzb8/NHP8fwbRp9onpfbgUH+BO1cMQo2d/iTTyDnz4ZuOvwpCcxtIYk9cnE/zK0wZA
         tCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PJp1TI1vp+iJ0SfoAcj+tmJlJZLTruDMuS3YgM/Vi3s=;
        b=zwvInSfjpkQaA5550Gxy+cFsVFrBICa3dckDx3zBRQqCXt7IEH/IWSgdJeD2/2g2Zs
         IBl0H5VFjODcfHsz55RIjvHifVV4Hox29fxr1qWcDPRfW0MeZgS9Rc0tKTkXpHW2tr4d
         //i+Ac1aCVfG3E6axqP4Tl+AFA/febke9qeIxIg76LnWPCzETROKTthss1C6rneJ8zZs
         KRika6qS/C7khFg7jWG32LYsdG0mPQzBUXO2FU9C1rqf8M9Vi8WfMlk/zeJuAwIqNvK7
         J5oCp8Iw1p/wBU+Yt6GSRMnIDDbfA34O6WtSzj2ZROF00By/XhPMqodfTLS2eClINCcu
         0XoQ==
X-Gm-Message-State: ACgBeo2ujucet/nSCufHjaZtY1/kLW+vzZ7Y4ZEqBruE9mmJTfIe/Oyy
	D9u77waNSaSuWh3/tStFIxOF7UTEZig=
X-Google-Smtp-Source: 
 AA6agR60Fq2SI+83vCAQTqqslUsEN+ILeamFO9+3BJ0MV8RbN25lkj1v6wBieVwl5lb5ZeOZ8V4jwA==
X-Received: by 2002:a05:600c:26d2:b0:3a6:280c:24a with SMTP id
 18-20020a05600c26d200b003a6280c024amr3317493wmv.130.1660894072168;
        Fri, 19 Aug 2022 00:27:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/42] gdk-pixbuf: update 2.42.8 -> 2.42.9
Date: Fri, 19 Aug 2022 09:26:53 +0200
Message-Id: <20220819072727.2236928-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169579

Disable manpages, as they require rst2man.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Add-use_prebuilt_tools-option.patch  | 18 +++++++++--------
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch  | 20 +++++++++----------
 ...-pixbuf_2.42.8.bb => gdk-pixbuf_2.42.9.bb} | 12 +++++++----
 3 files changed, 28 insertions(+), 22 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.8.bb => gdk-pixbuf_2.42.9.bb} (91%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
index a8206a4507..02cc9a2a70 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
@@ -1,4 +1,4 @@
-From ba73bb0f3d2023839bc3b681c49b7ec1192cceb4 Mon Sep 17 00:00:00 2001
+From f81b60ebcbbfd9548c8aa1e388662c429068d1e3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 8 May 2021 21:58:54 +0200
 Subject: [PATCH] Add use_prebuilt_tools option
@@ -18,7 +18,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  5 files changed, 42 insertions(+), 19 deletions(-)
 
 diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index 8b0590b..7331491 100644
+index 54ff9dd..2e321cf 100644
 --- a/gdk-pixbuf/meson.build
 +++ b/gdk-pixbuf/meson.build
 @@ -342,13 +342,20 @@ foreach bin: gdkpixbuf_bin
@@ -45,16 +45,18 @@ index 8b0590b..7331491 100644
    # load the installed cache; we always build it by default
    loaders_cache = custom_target('loaders.cache',
 diff --git a/meson.build b/meson.build
-index 7a1409b..0bc73eb 100644
+index 813bd43..a93e6f7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -403,16 +403,16 @@ subdir('gdk-pixbuf')
+@@ -369,18 +369,18 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
 -if not meson.is_cross_build()
 +if not meson.is_cross_build() or get_option('use_prebuilt_tools')
-   subdir('tests')
+   if get_option('tests')
+     subdir('tests')
+   endif
 -  subdir('thumbnailer')
  endif
 +subdir('thumbnailer')
@@ -69,10 +71,10 @@ index 7a1409b..0bc73eb 100644
      gdk_pixbuf_bindir,
      gdk_pixbuf_libdir,
 diff --git a/meson_options.txt b/meson_options.txt
-index 0ee6718..cc29855 100644
+index d198d99..1c899e9 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -49,4 +49,8 @@ option('gio_sniffing',
+@@ -53,4 +53,8 @@ option('gio_sniffing',
         description: 'Perform file type detection using GIO (Unused on MacOS and Windows)',
         type: 'boolean',
         value: true)
@@ -82,7 +84,7 @@ index 0ee6718..cc29855 100644
 +       value: false)
  
 diff --git a/tests/meson.build b/tests/meson.build
-index 7c6cb11..1029e6a 100644
+index 28c2525..d97c02d 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -5,6 +5,12 @@
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 25410b11ea..dd580f8162 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From f00603d58d844422363b896ea7d07aaf48ddaa66 Mon Sep 17 00:00:00 2001
+From b511bd1efb43ffc49c753e309717a242ec686ef1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
@@ -14,10 +14,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index 312aa78..b813d99 100644
+index 1d39b44..2b00815 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
-@@ -212,7 +212,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
+@@ -216,7 +216,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
          g_string_append_c (contents, '\n');
  }
  
@@ -26,7 +26,7 @@ index 312aa78..b813d99 100644
  query_module (GString *contents, const char *dir, const char *file)
  {
          char *path;
-@@ -221,6 +221,7 @@ query_module (GString *contents, const char *dir, const char *file)
+@@ -225,6 +225,7 @@ query_module (GString *contents, const char *dir, const char *file)
          void                    (*fill_vtable)   (GdkPixbufModule *module);
          gpointer fill_info_ptr;
          gpointer fill_vtable_ptr;
@@ -34,7 +34,7 @@ index 312aa78..b813d99 100644
  
          if (g_path_is_absolute (file))
                  path = g_strdup (file);
-@@ -270,10 +271,13 @@ query_module (GString *contents, const char *dir, const char *file)
+@@ -274,10 +275,13 @@ query_module (GString *contents, const char *dir, const char *file)
                                     g_module_error());
                  else
                          g_fprintf (stderr, "Cannot load loader %s\n", path);
@@ -47,8 +47,8 @@ index 312aa78..b813d99 100644
 +        return ret;
  }
  
- #ifdef G_OS_WIN32
-@@ -314,6 +318,7 @@ int main (int argc, char **argv)
+ #if defined(G_OS_WIN32) && defined(GDK_PIXBUF_RELOCATABLE)
+@@ -318,6 +322,7 @@ int main (int argc, char **argv)
          gint first_file = 1;
          GFile *pixbuf_libdir_file;
          gchar *pixbuf_libdir;
@@ -56,7 +56,7 @@ index 312aa78..b813d99 100644
  
  #ifdef G_OS_WIN32
          gchar *libdir;
-@@ -452,7 +457,9 @@ int main (int argc, char **argv)
+@@ -456,7 +461,9 @@ int main (int argc, char **argv)
                  }
                  modules = g_list_sort (modules, (GCompareFunc)strcmp);
                  for (l = modules; l != NULL; l = l->next)
@@ -67,7 +67,7 @@ index 312aa78..b813d99 100644
                  g_list_free_full (modules, g_free);
                  g_free (moduledir);
  #else
-@@ -468,7 +475,8 @@ int main (int argc, char **argv)
+@@ -472,7 +479,8 @@ int main (int argc, char **argv)
                          infilename = g_locale_to_utf8 (infilename,
                                                         -1, NULL, NULL, NULL);
  #endif
@@ -77,7 +77,7 @@ index 312aa78..b813d99 100644
                  }
                  g_free (cwd);
          }
-@@ -486,5 +494,8 @@ int main (int argc, char **argv)
+@@ -490,5 +498,8 @@ int main (int argc, char **argv)
  
          g_free (pixbuf_libdir);
  
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
similarity index 91%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
index fb6829a7d1..d33718e3ea 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
-SRC_URI[sha256sum] = "84acea3acb2411b29134b32015a5b1aaa62844b19c4b1ef8b8971c6b0759f4c6"
+SRC_URI[sha256sum] = "28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
@@ -44,11 +44,13 @@ PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=enabled,-Dtiff=disabled,tiff"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
-EXTRA_OEMESON:class-target = " \
+EXTRA_OEMESON = "-Dman=false"
+
+EXTRA_OEMESON:append:class-target = " \
     -Duse_prebuilt_tools=true \
 "
 
-EXTRA_OEMESON:class-nativesdk = " \
+EXTRA_OEMESON:append:class-nativesdk = " \
     -Duse_prebuilt_tools=true \
 "
 
@@ -95,9 +97,11 @@ do_install:append() {
 
 }
 
-# Remove a bad fuzzing attempt that sporadically fails without a way to reproduce
 do_install_ptest() {
+        # Remove a bad fuzzing attempt that sporadically fails without a way to reproduce
 	rm ${D}/${datadir}/installed-tests/gdk-pixbuf/pixbuf-randomly-modified.test
+        # https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/215
+	rm ${D}/${datadir}/installed-tests/gdk-pixbuf/pixbuf-jpeg.test
 }
 
 do_install:append:class-native() {
-- 
2.30.2


