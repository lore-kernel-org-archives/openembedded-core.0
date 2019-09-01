Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id BF5F27F4BF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id az1so4453196plb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BjPq8JOTwdEVKI1ZUpLtrQsVB1h5g0kAsRTQvQJ1+TE=;
	b=PXs7KRJwCxwXvZ2MvlZhcP4q5OBsXlmez9RorMkYw9rsNZ7ybGsGEiassMu3rgfzaA
	8ejfwMqXcN/KyetXNHVKquAhQ6cu9wgBbmn1bIITSFOOz3norDraNVJes6WANFBbpBeL
	a7uaRYxz37rSSA1YCO2ArbCn5nrYjwfngCpZXMMU6yiWkPJitY8/IIOyUqwy/xPf488h
	pm+DKChkYv2RxZ45gTFeWyj4V81Dp7AdOA7XSpYbbGx0KFNQe+eLhtWncRuwhvhgBG1C
	lFwr2CLfHWCwQH92+e6z2lbbtViewvw9UuOkfy6CIsXOn5BqtpDZHuOn7S1ZJ3Jkzf+z
	xiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BjPq8JOTwdEVKI1ZUpLtrQsVB1h5g0kAsRTQvQJ1+TE=;
	b=Etc+Byv319egUQeCNKVdOg9xJavanVIiVuNgg6RPhbSmWGpiYtucREedVwj1K1pPg0
	urQqJpzdmoqVTa62umvwH2HLlrKOy7w0HkLF0PWQkQraQ0vYV+PWxefN1eAeR+2HuWZf
	7CcOGEser93W8Fk1jnsE6w/WCE246Nngd9rXPdZG59SCBUw5xERsUwN5USN0Giyha5WM
	zTiRtqRqoElrANVbt4SWkcxOzulqnVapkLYHYXar+M0uQOV1FhtJkPi4NkfEUPfjPSob
	1PWypnR1COKol1l/JmcjGB1hn0So3Xz88ySq93axclROZHgSinH0W49SrbyOmnX8aetG
	tTXA==
X-Gm-Message-State: APjAAAWWKs0+qHjlG9tCJpAE4DjuuiJAzvQkAe3Y+74m4wlwp+qjxUgR
	yRhbJ0ubcehvgocyM3uNPWMSg02q
X-Google-Smtp-Source: APXvYqwTlmza9YV7zl4VOx0pNZKynhTlLl5WVknNJ+/1NU0dJ1slj2sIIOKYpTrCNja8vxMz+Ab9MQ==
X-Received: by 2002:a17:902:f01:: with SMTP id
	1mr24749008ply.337.1567348617698; 
	Sun, 01 Sep 2019 07:36:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:13 -0700
Message-Id: <6e94f1abd1b572674f9f8514051ebcd4369a2f2d.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 35/43] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:57 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         | 40 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
new file mode 100644
index 0000000..c882cba
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
@@ -0,0 +1,40 @@
+From 9fd6b4b21891adc318784f6a141f40d767b0d73c Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Tue, 22 Jan 2019 13:26:31 -0500
+Subject: [PATCH] keyfile settings: Use tighter permissions
+
+When creating directories, create them with 700 permissions,
+instead of 777.
+
+Closes: #1658
+CVE: CVE-2019-13012
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/commit/5e4da714f00f6bfb2ccd6d73d61329c6f3a08429]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ gio/gkeyfilesettingsbackend.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gkeyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend.c
+index a37978e..580a0b0 100644
+--- a/gio/gkeyfilesettingsbackend.c
++++ b/gio/gkeyfilesettingsbackend.c
+@@ -89,7 +89,8 @@ g_keyfile_settings_backend_keyfile_write (GKeyfileSettingsBackend *kfsb)
+ 
+   contents = g_key_file_to_data (kfsb->keyfile, &length, NULL);
+   g_file_replace_contents (kfsb->file, contents, length, NULL, FALSE,
+-                           G_FILE_CREATE_REPLACE_DESTINATION,
++                           G_FILE_CREATE_REPLACE_DESTINATION |
++                           G_FILE_CREATE_PRIVATE,
+                            NULL, NULL, NULL);
+ 
+   compute_checksum (kfsb->digest, contents, length);
+@@ -640,7 +641,7 @@ g_keyfile_settings_backend_new (const gchar *filename,
+ 
+   kfsb->file = g_file_new_for_path (filename);
+   kfsb->dir = g_file_get_parent (kfsb->file);
+-  g_file_make_directory_with_parents (kfsb->dir, NULL, NULL);
++  g_mkdir_with_parents (g_file_peek_path (kfsb->dir), 0700);
+ 
+   kfsb->file_monitor = g_file_monitor (kfsb->file, 0, NULL, NULL);
+   kfsb->dir_monitor = g_file_monitor (kfsb->dir, 0, NULL, NULL);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 733a2d4..2286d03 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
            file://glib-meson.cross \
+           file://CVE-2019-13012.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.7.4


