Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id A05CE7F290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:08 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id u17so359916pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BjPq8JOTwdEVKI1ZUpLtrQsVB1h5g0kAsRTQvQJ1+TE=;
	b=HzyVvsGFHgYHhx8Wt/AZj5fDVcAwQ2gvicDBjrTU04p1r6X9Ib4GOx7uyYDFC5FDzq
	k2bIivJk2TTzFCs1dXTY1QMZUNjRqqpBYx/x+3OhhLsaiaZABin5xetG/I8SEGi1EPOV
	gZwCEdo+L1vZcpJDFCg+3OxUW+vusobjxscSs/4F9IFBm4RjaLWHK3+7FUpOocsDsB5I
	7HqKqY1cnWTn/HDPWSF4UrsvIm8sC9T4JXIcC/eiH7RGs9RXGTw458sc4npFcPfNcWSO
	HRBeqJS4gUCl8JBk7lME9EDeFLPkmuzaEbVD9ARF4JccHo9IDDZ59Hf0zg9Of/fRO5nx
	JzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BjPq8JOTwdEVKI1ZUpLtrQsVB1h5g0kAsRTQvQJ1+TE=;
	b=MvzXTvuGSYUWnl9b0iUdKvWt266m/AL///TzVXlfiTJd2+VuyPROaM4CJ8BqpzmxQ3
	4cMd4VdO5BgF97GnWQHGIE9Ry1FdqWqIrbEkvMoM+sVT6hIwonix/XaX7GRdyzOtMQU2
	xGVA9dCd1fOA2IRo9SMyaSiCxrcpCw2w4tZRrXj38XVkIcUqpBAGxZjCy9enG7C4cuM1
	si9urhQ8K/OR0CJEZsWY4apZLjISCYil355SmX83F92rOEz1l1yIJU8KaHzzVgCaEjMe
	pB/ZV/C2sIqsAA+Stg2D3iZFIMwGns8a2c6OrfqpRPNsethSQT+8TDj+VyTgY52i20nL
	qELw==
X-Gm-Message-State: APjAAAVPv5vyNmB8NbNpOBAGsxLymJPK4WULVUwGimCpCT2dnPQWFZfD
	h1zxW/Fw6SHFk+KtZJiMa3lvtMo1pQA=
X-Google-Smtp-Source: APXvYqwCL9fuHCJH4LSd7+wLLiEhNs+QYOW7AG4QC85GqQWJUO+6Q2+oMst2m7Nqwp6IeF/sbuL07g==
X-Received: by 2002:a63:6b49:: with SMTP id g70mr784619pgc.92.1569293408926;
	Mon, 23 Sep 2019 19:50:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:15 -0700
Message-Id: <6e94f1abd1b572674f9f8514051ebcd4369a2f2d.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 35/50] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:09 -0000

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


