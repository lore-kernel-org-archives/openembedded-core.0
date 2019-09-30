Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 54DC57F33E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:27 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id e5so3399535pls.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BjPq8JOTwdEVKI1ZUpLtrQsVB1h5g0kAsRTQvQJ1+TE=;
	b=qzl7fiG+JfspAwwGDLJdS5ZMOn0eWA6OSm7A+pyITMRQ9rJBM8vll7N4Ue0RQ7HlEl
	LOKukeJm89SM4ZM7J6aSndCzWpbJkSHjiW43YGCzGIyGpBdosRvjzrKRsLiaZAt1R1Yx
	XiCBN2+LsYVmaR4Y99k3TLO10fvFfv+SyjCQb5lCoG9JC6dWv4BXkg1Nhjwk8uUFR2lg
	U3DbWpN/xJdGfXIc8er3kR+x8DDIaTAl6+Y8b/qGmHCfFCFkd6uX+tJ/t7uDma8+W4E9
	ENOe6TRNf2xrB/pTdKNRHiJmiz9Fs0pjoKPSWX/itS3YG2wVWKgbOxooTevcbYz3QUds
	07mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BjPq8JOTwdEVKI1ZUpLtrQsVB1h5g0kAsRTQvQJ1+TE=;
	b=Uy4tE09zbDymlB+ImrcdZ5UccDs90iPlu859JzqRK/0geRsECkxS1SJcGx5UT2Y2ia
	dgdHmvXLBqJBpfRceuJvSaPfVzElvA5V8PdQfZg/CGqI0rp7Liicy3HZTfMSKqsh+r/8
	zv2gt0n50v3H8g9wcc3/u19q5t0aD0UwoJCNwoupIJr+TxZoMn40hKW8gxg+33uU01Ws
	PkMgqFElifSHCkPl7E1BBDNpP3RNhGcwAEcD2eoiIhy/JlkEQuyTuD4es7sEWqdrtemV
	BQstVqab8G8ChBqfFh6Sdvi/MrcF+Z6jSTaPb+err5yJwiRIlocvsepUeX+hU0KaIW5R
	hSuA==
X-Gm-Message-State: APjAAAUxldzB4seAkBkdNvw5XJS5dn35kjtl1i5/GMIijamHc2bAAenj
	6pRpR3CW/kV07EXhA0RptTqdByBKULU=
X-Google-Smtp-Source: APXvYqxgRf5VfplRCql7OKFzjb+Rm+2gAi2MRnszqHUlyorgsaOsqnD5fiuPFmvTJ4J3iIs3Mh0PVw==
X-Received: by 2002:a17:902:a70f:: with SMTP id
	w15mr18629458plq.132.1569818908401; 
	Sun, 29 Sep 2019 21:48:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:29 -0700
Message-Id: <b7bc9c12219f5c48eb6698e4537f6c0be94ac06a.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 34/54] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:27 -0000

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


