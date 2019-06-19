Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C038D7E951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:25:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so1793745wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7qYVW7bpvJJF0GzbLHiH+nCdOeoGzk2N//J9SEpqIhM=;
	b=sg1JnNhZi8+VSBkzM7LqWZeUwVZ5WdwB5csnj6NUa/P/4cN6N3pKatENYGZQX008W6
	Nw7kdV9oQXl22n8duKRG5Sowaqf270Eq/OEaf2lYzlYDA6Oo26KLETK9nLSmfrDYT0jt
	l7KgnckWRp/mbnA1Z3zVudNS/Y3bFQGHOQ8gEW8j1wUZsEKm3oWisQEFBpGAv/JnyKsU
	7vGO4jrhg9l+ZJCV8Rz6U+dZou2EHjCR3J5TZCAd7pmcbE4GxYebANK2YxCPGIS+HV5p
	NicSUvF4bD2WYgNPdMcYg1pcJsAfwpPDm/ZgyGDahgOHwzYwQ5qrxDtCrGoElh6lSirG
	Hi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7qYVW7bpvJJF0GzbLHiH+nCdOeoGzk2N//J9SEpqIhM=;
	b=e9QCF6lY7UEJNE4DRpkUXOE/rfN3TdtEh/gecmsl1HbTBndk5Y7qLzOXwhNr8EAKBu
	5u6N1sMTk0sbL8ie2dHy9z/vXJwA3eqsEbnbZouZqKa3+Q40ksiPIBX9SEhHMvWvrYJk
	YwWDDKM6yx6UGue3thyAOgrk600S+vrr76xgC3JzvFKJzWpjyTJC9WrZGH0pR/SgYu5I
	/GbMSXN7onSP3B11gfWxbb8j07Ff5qtfpmsQgImmslEmFNIfH24VHfTNY+mZhCLpEgG0
	9na0KdnKwWoEBeLLaydGrgRowH9FqVSuGrq1eIfMzNg2ueEuc9BVRCThxJ5+kVUB50fY
	NwAw==
X-Gm-Message-State: APjAAAV55edgFfSLAUjawx3GUAh11zzOVotk9olkD62lWtU3C1uRBVNB
	6aG6fryUM4aJVtdDXpP8V7zkekYLscI=
X-Google-Smtp-Source: APXvYqyU4p5Tw9Lqrlq2tyx+WYb1IkV4eXZPeq1FonNU076O/UBYxVSpx7+vOEPKRMYDeiLvRn/g/w==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr7985786wmb.4.1560950705252; 
	Wed, 19 Jun 2019 06:25:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:25:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:48 +0200
Message-Id: <20190619132450.130226-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/9] epiphany: update to 3.32.3
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
X-List-Received-Date: Wed, 19 Jun 2019 13:25:05 -0000

Drop backported patch.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{epiphany_3.32.2.bb => epiphany_3.32.3.bb} |  5 +-
 ...Clean-up-ephy_web_application_create.patch | 79 -------------------
 2 files changed, 2 insertions(+), 82 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.32.2.bb => epiphany_3.32.3.bb} (77%)
 delete mode 100644 meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
similarity index 77%
rename from meta/recipes-gnome/epiphany/epiphany_3.32.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
index ff0e34f98d2..de1b6e2f84f 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
@@ -12,10 +12,9 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
-           file://0001-web-app-utils-Clean-up-ephy_web_application_create.patch \
            "
-SRC_URI[archive.md5sum] = "2a6672b22a0fdb869e5f0a415ac2da34"
-SRC_URI[archive.sha256sum] = "8ae70d9feaba3754c63ab249deeef9b7a31161a372655b4214f148ea2f440cfa"
+SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"
+SRC_URI[archive.sha256sum] = "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
diff --git a/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch b/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch
deleted file mode 100644
index ea644fb985a..00000000000
--- a/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 49f435217873e679b142f64d3e7def919fb642bb Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@igalia.com>
-Date: Wed, 8 May 2019 15:58:32 +0000
-Subject: [PATCH] web-app-utils: Clean up ephy_web_application_create()
-
-Fixes #764
-
-(cherry picked from commit 4e998d45e4cc549a7ca561a33895b0fbcf7ba6bb)
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/commit/a6a022c9c498ad5dcf7f2220644a7520df74ca31]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/ephy-web-app-utils.c | 24 ++++++++++--------------
- 1 file changed, 10 insertions(+), 14 deletions(-)
-
-diff --git a/lib/ephy-web-app-utils.c b/lib/ephy-web-app-utils.c
-index 97f3f24..fc68a96 100644
---- a/lib/ephy-web-app-utils.c
-+++ b/lib/ephy-web-app-utils.c
-@@ -374,46 +374,42 @@ ephy_web_application_create (const char *id,
-                              const char *name,
-                              GdkPixbuf  *icon)
- {
--  char *profile_dir;
--  char *desktop_file_path = NULL;
-+  g_autofree char *app_file = NULL;
-+  g_autofree char *profile_dir = NULL;
-+  g_autofree char *desktop_file_path = NULL;
- 
-   /* If there's already a WebApp profile for the contents of this
-    * view, do nothing. */
-   profile_dir = ephy_web_application_get_profile_directory (id);
-   if (g_file_test (profile_dir, G_FILE_TEST_IS_DIR)) {
-     g_warning ("Profile directory %s already exists", profile_dir);
--    goto out;
-+    return NULL;
-   }
- 
-   /* Create the profile directory, populate it. */
-   if (g_mkdir_with_parents (profile_dir, 488) == -1) {
-     g_warning ("Failed to create directory %s", profile_dir);
--    goto out;
-+    return NULL;
-   }
- 
-   /* Skip migration for new web apps. */
-   ephy_profile_utils_set_migration_version_for_profile_dir (EPHY_PROFILE_MIGRATION_VERSION, profile_dir);
- 
-   /* Create an .app file. */
--  g_autofree char *app_file = g_build_filename (profile_dir, ".app", NULL);
-+  app_file = g_build_filename (profile_dir, ".app", NULL);
-   int fd = g_open (app_file, O_WRONLY|O_CREAT|O_TRUNC, 0644);
-   if (fd < 0) {
--    LOG ("Failed to create .app file: %s", g_strerror (errno));
--    goto out;
--  } else {
--    close (fd);
-+    g_warning ("Failed to create .app file: %s", g_strerror (errno));
-+    return NULL;
-   }
-+  close (fd);
- 
-   /* Create the deskop file. */
-   desktop_file_path = create_desktop_file (id, name, address, profile_dir, icon);
-   if (desktop_file_path)
-     ephy_web_application_initialize_settings (profile_dir);
- 
-- out:
--  if (profile_dir)
--    g_free (profile_dir);
--
--  return desktop_file_path;
-+  return g_steal_pointer (&desktop_file_path);
- }
- 
- char *
--- 
-2.21.0
-
-- 
2.17.1


