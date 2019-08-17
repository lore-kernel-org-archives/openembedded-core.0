Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 836007F343
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:21:51 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id k3so4685367pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uPfNkMPX94VsexmKiPj+aAAe9LRlACXNpjqSBj2M6zA=;
	b=rvPpXF0CTTSFxSS6ZhgpOCyYzhqyzrxH70kPLvHTdKXBxqev34xAg8WaXIB7eheAuA
	+I40chnKnk3mq96zcYgEV0yhBfkP//P2tuUzpGZJIo7momzsZX2idBpfRGoSsVeCnUbe
	064areidcjDJ7tBujskE7oXKU2VIHkazc3fkHjfW06zWc4flFJBjpIGc7Yae9YUuP5d0
	HoDKnxDmOgKVPaIifPKwSJ7mHHcLxpqgGSXS7NIwJ46eYQ8FETAgNPu1ow2NAUUecB+n
	4B86Dta/4sRONAPtrLdDm4aa2DcxiIBDFhnwpMWzDmugwLeBdlCcKE+26NPtHo7oElt/
	LqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uPfNkMPX94VsexmKiPj+aAAe9LRlACXNpjqSBj2M6zA=;
	b=GXCSyrOltXGdHJoz+gOwhNPzwdrLOZBapp1j8yn2PVvsWm/+ykkR/NK35p0sReWYmB
	sn1D/ulPbx8xAg0GTUplycusIgbsNDJAaM/2GVqskQath1L4CZndaCcPuQAkswHqjhWG
	8h+x1qOwUlw/ayV3PTNgxtULGFdUg7jVtCSzChNBk/Fc8VOarfdPC7dvCAieVsASSEUL
	AsOvQx8fPzChcP5Cyw4r10zxL4M9gpgKgxQv2s8eKSrEQNlRRe0oeqwHF/LT6zCZvBVA
	lp1ymC3MqhoyYGA8qdEgSquws01L0Lqjo9HAkNi8MMALLvioIcsxQHiBgBsq6BvuAY/f
	Ph4g==
X-Gm-Message-State: APjAAAXbPqaHTUyGkhDV8vzb/XvD7j/JteNBaKUW5+cvASlICWx+ssrE
	gZfKTcIpIGDyt2vjQAnV/wsO/8eh
X-Google-Smtp-Source: APXvYqz8z0pmRpV8E+AueKTz5CBMLtR1BZdvYCPVny76QIVRCDhcNQ0QzDShqEthHSN19xhLWjaJlA==
X-Received: by 2002:a62:8246:: with SMTP id w67mr17588008pfd.226.1566076912688;
	Sat, 17 Aug 2019 14:21:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:29d8:851b:cd27:3ce0])
	by smtp.gmail.com with ESMTPSA id a20sm7261804pjo.0.2019.08.17.14.21.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Aug 2019 14:21:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 14:21:39 -0700
Message-Id: <51f7ecf2259e1fb669cd84c5317cbd8810d731b7.1566076780.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1566076780.git.akuster808@gmail.com>
References: <cover.1566076780.git.akuster808@gmail.com>
Subject: [thud-next][ 6/8] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Sat, 17 Aug 2019 21:21:51 -0000

From: Andrii Bordunov via Openembedded-core <openembedded-core@lists.openembedded.org>

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         | 47 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
new file mode 100644
index 0000000..29c5d98
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
@@ -0,0 +1,47 @@
+From c7f7fd53780f8caebccc903d61ffc21632b46a6c Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Tue, 22 Jan 2019 13:26:31 -0500
+Subject: [PATCH] keyfile settings: Use tighter permissions
+
+When creating directories, create them with 700 permissions,
+instead of 777.
+
+Closes: #1658
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/glib/commit
+/5e4da714f00f6bfb2ccd6d73d61329c6f3a08429]
+
+CVE: CVE-2019-13012
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ gio/gkeyfilesettingsbackend.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gkeyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend.c
+index a37978e83..580a0b0a1 100644
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
+-- 
+2.22.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
index f007596..611abd8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2019-12450.patch \
            file://CVE-2019-9633_p1.patch \
            file://CVE-2019-9633_p2.patch \
+           file://CVE-2019-13012.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.7.4


