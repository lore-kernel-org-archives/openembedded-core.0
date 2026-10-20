Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4746.1792538587459654258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=xK8UhZpQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1f68a9855so585675e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538586; x=1793143386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+7vBrDEDXwSAzmrfw4r8yEroKyfQnKUmP/RZbX8p7Q=;
        b=xK8UhZpQGj1ywTcIEmTG3EW9O5InQf+Agk8crk59T22o6arDQRFyp2EncRAMPz7AN7
         XHvTjq7xsrO/p/MyWIwpcCBmlZZ73cw5qZgJRXXFuEfcci10aP899Gl+Sr2zc3TYIa8r
         72Ho+1/HCRjvzCRgu6Z9R1xeN4O8X974jDPBq5CJksh1SGFCB2iTtyyJeLKYK1nDbgmA
         qJo1U3kExzyv3xuGqOsoTmq1ujAyb4j8LtByeVrIc4xY8sCTKolqmA2WVZojxj6GOQzY
         1oFGS7IQfdy3yU+lm7kUWo2oDA3HJxG5aqX9eqq0zYJ+6dF+3pJKlt7yEcYrm/VHsE/0
         +KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538586; x=1793143386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G+7vBrDEDXwSAzmrfw4r8yEroKyfQnKUmP/RZbX8p7Q=;
        b=PfbR5Q76Y4ygj5AfYh5v1EVLc1Cm/6YNFssBs43zIyr2LLilWb2yaITF6zGQU7huW8
         pRT1b6ZwxQimw+eic7pmWfr3tt6aid3SjLwfVawPX7RVJnS+kY+mD5ChIiVLujr/pBBw
         o75t+Tg2xhQzQ/q7i4JvIj4osoUgZMhWQVq0dRIOmZoH1+h8ccGFBwBQGFr0kCiKrfHB
         NYI7/j5PMhm3pHo0eW58Zv33sOa2OWivkqJI3uk32D98KKcIyv7Jk/WybZo1a01OpO/i
         GA7UWWhBdd9nOP8s/5HAR1tTQEfyuF1wr8lrhSQ8zzg1TwQ0lP6RytV3oxnoWZFHScxy
         BXzQ==
X-Gm-Message-State: AFq9FYLHqr6qEN7E8UCbdeKoM32o8PRPx6/rWSeELupW+QKiPQPd1MFu
	pPoIUfs8e0V11E3VZ8Eg7pTHZDKPs3dIVdtxskor8LaNK3uSAq38/Vv8yaIOOlLyPC1vFtxb0JF
	7IkV81zQ=
X-Gm-Gg: AYBFou2J+xWz7hLrwTyvYvZ1CY4WY0W8aOnxHESRXWngzzumvzZ9qi7csduVR7vqxXL
	hTUkkBozm3YoTHEVWwwr3DaSQ3ApYYQM7YF6+unq8hPkyTJsGFrVTd7QZpY+15hXDXv4txPYmhI
	w+DvC7xkfpRfZb5cZIGFKIHVTgGS/lBRCO/+QYooXfu8PFA25y0c2gEPvCPjMbPAbRO7Dhrv18e
	CLlzAREKI6G4sR1+NwHgtCtnr3K8ep4NbGrXarBIcAIUxSZ58Q29nFJlzcdZweRhGwGpk6tE5HD
	LFSY+qm4gx1lVEeVzMATN1i3pRtfr/epyt7xtlESytqdaIZEyRoMmZd1kxQfPKdXm5D0R01uJ2g
	LGRFraZE4eM6JrnyUWk3QLyPsBGIEBRjJ4OxfWug3iYXuH2oMnFJ8D2H/M4sKpvqqZJYHabyvpo
	vXSr35SmsrygJXrL6ltVWCFZ87jcVbu82AIwsBZSWTwCcjpDFnHB6ThrXFhT5y7++LpW0tkUAD9
	WzK3vFQK9wzqJQ4ExZ5OErTXblYhijQkD9B9ysP/SYBPFaex+DERkwWtYgl9MnhNeoxqz05K7uy
	uM9aUUxriW6ArQOC6WwLuV5gb0wpPQBkGe7it2Rjsaz4RYNHSSx7lXc=
X-Received: by 2002:a05:600c:1c09:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1fdafd654mr4662815e9.14.1792538585536;
        Tue, 20 Oct 2026 16:23:05 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/25] glib-2.0: upgrade 2.88.3 -> 2.88.4
Date: Wed, 21 Oct 2026 01:22:35 +0200
Message-ID: <eeaf910479454922fb8d555b3e49be31abf671d8.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248344
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.4/NEWS

Source: NEWS

Overview of changes in GLib 2.88.4, 2026-10-08
==============================================

* Bugs fixed:
  - #4011 gio/tests/services: Installed service file contains build path after
    !5259 (Jaipaul Cheernam)
  - #4020 'TLS callback not invoked' error on msys2-clang64 CI job (Luca Bacci)
  - !5262 Backport !5261 "gio/tests/services: Fix installed service file
    containing build path" to glib-2-88
  - !5273 Backport !5266 "docs: Fix gio gi-docgen docs_url" to glib-2-88
  - !5285 Backport !5283 "gconstructor: Reference _tls_used also on GCC, CLang"
    to glib-2-88
  - !5323 Backport !5311 "fix: handle long filenames in trash by truncating from
    front" to glib-2-88
  - !5379 Update Norwegian Nynorsk translation
  - !5394 Backport various security fixes to glib-2-88

Drop 0001-gio-tests-services-Fix-installed-service-file-using-.patch
(local backport of #4011/!5262) as the fix is now included upstream.

Assisted-by: kiro:claude-sonnet-5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...es-Fix-installed-service-file-using-.patch | 35 -------------------
 ...l_2.88.3.bb => glib-2.0-initial_2.88.4.bb} |  0
 ...{glib-2.0_2.88.3.bb => glib-2.0_2.88.4.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 4 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.3.bb => glib-2.0-initial_2.88.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.3.bb => glib-2.0_2.88.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch
deleted file mode 100644
index 755e51cdd3d..00000000000
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ed5956d0000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 30 Jul 2026 11:28:36 +0000
-Subject: [PATCH] gio/tests/services: Fix installed service file containing
- build path
-
-The refactoring in !5259 changed the installed service file's
-configure_file() to use the build output as input instead of the
-original .in template. Since @installed_tests_dir@ is already
-substituted in the build output, the installed version gets the
-build directory path instead of the install prefix.
-
-Use the .in template directly as input for the installed version.
-
-Closes #4011
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ed5956d]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- gio/tests/services/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.build
-index 1111111..2222222 100644
---- a/gio/tests/services/meson.build
-+++ b/gio/tests/services/meson.build
-@@ -18,7 +18,7 @@ foreach service_file_name : dbus_service_files
-     # Build a second copy of the service file for the installed
-     # version of the tests.
-     installed_service_file = configure_file(
--      input: service_file,
-+      input: service_file_name + '.in',
-       output: service_file_name + '.to-install',
-       configuration: installed_cdata,
-     )
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 50cdeff1589..7e7725f9bd3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,13 +237,12 @@ SRC_URI += "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
-           file://0001-gio-tests-services-Fix-installed-service-file-using-.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8b8ce72fdf79bbbdc9b383b"
+SRC_URI[archive.sha256sum] = "25fd169f3b2f91fe2391ad297883ce0fcf30c69fc789ffd1c9672d1332b1c5a8"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
