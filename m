Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 83D837D718
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:11 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id y72so8817535pfb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uPfNkMPX94VsexmKiPj+aAAe9LRlACXNpjqSBj2M6zA=;
	b=NFCsUtZq0/zZESMxZvUpzNppCbo3yBnVvd6TaOPEpPuiCh7QjY8kfku3RRBzjTBfjI
	XOtroUBzOUkIC57oaT2gFCd6ALeJM76Psg6SD2RNZsmXFca6h/sMuUzFbaSZ3rW1tFCK
	2e4QhxEPC6GVWrLmrSLIp0uYKo+INOeIGFS/SaFh1cz/ZO7xNWyZp8OoT612HRmWAnM2
	dR3Bh9kKEL9q/2ycDuAgLjn4i2WMvhTsNt+tY34btzlL8dUOSez7HNCMaNGD4DLVPiyk
	OXndCcxlQ6Ts/GsX9PbDLEFClKJIDQUWfmmx/aaQ57s1WDWhjpN2Q7Gl5CUz8YRydq/I
	2idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uPfNkMPX94VsexmKiPj+aAAe9LRlACXNpjqSBj2M6zA=;
	b=ce3y15Z8ekgE4p5+W6ucDRz5ZcPd/0SEewK9unzE7PggywGXP7VFPrYXrgJaJxJ7Xz
	fwOOeGpK/SxvOU57Noknk6HZsLioZ/I9Tdr/IAXrW6K+ik/0Up4fXVL8H3+q2Ch/pF+r
	hwAakusOtrj9JEiWjJTtYCPXM1I0xX0z33d5bxH/7mVR4bEkvhh4ZSH2T8zGC7UncDh8
	r6MK73cEK0jzWCAA/sPqK/Depn2JrLxxvHZkYWR0NqSi0xiMjz75fkYWDBP4lYmtHWDv
	wcFvq8GTy7Aj+v6R7XRlM6UO1APLZPXw+PiNShBPY9JUyk/DTpsbNrMq7wcDHI7aNNVj
	FF9Q==
X-Gm-Message-State: APjAAAUgq/zxpWmxyqokFj1d7mbfkIG9Zz7KgV76qz9ErRvMO7tzFwZC
	AGLXLVzGdospa3tMJCZezhr56CCHoNw=
X-Google-Smtp-Source: APXvYqxqaDTmCabNTYe3WEwHtN/Hc8Trg7tT/LLP+p5ql6iwI3bLSmZcnaBdiMZlgePqP064jgw0cg==
X-Received: by 2002:a63:5717:: with SMTP id l23mr30898479pgb.90.1570461072472; 
	Mon, 07 Oct 2019 08:11:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:43 -0700
Message-Id: <51f7ecf2259e1fb669cd84c5317cbd8810d731b7.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 06/26] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:11 -0000

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


