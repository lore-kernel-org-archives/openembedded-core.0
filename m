Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id E59697F0D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:28 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id g3so376076pgs.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uPfNkMPX94VsexmKiPj+aAAe9LRlACXNpjqSBj2M6zA=;
	b=VTjotTJ2C4LKIoP1l1y3Lfm6BjLYmn9uo220B4jyeoGKzHv+ITFclgrqxhv520Xrx7
	Bv8r9dVPb64qR7tnctC+3wms+c8CXVqs3SEWRLW/o5NBAhyVHgRndd8jua4t6RABtZhB
	xlbMVfUX17SnWeRffpTOWabmaQ9v1OP8rvMZNKYSMboNztvREVbq2b9wmhFrSU/KrxBq
	pTleLEibHZPBqRqtgH8iNr3R4vCrqwOaiwbyAekLX72R+ytqcUt6XJqCw9nRg7C57nRN
	ddDQh1Ky1WPnFD7BN8cUcGAK0zzPAkVxvO6nTF/ZeXo508MreSxZtOyga68wkUSaIYAD
	v/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uPfNkMPX94VsexmKiPj+aAAe9LRlACXNpjqSBj2M6zA=;
	b=lxP8UYrRftBSSLLB/63xOSY77HiUh++GsW2wO4wZgadIDrChvBZhBWG3Ewm4AQMwzc
	ZCsU5FDe/4N/wifMGpHpUNrZDh0DxU8fNg9td6YpoPpVQmsJ2sFxQYD+nxCFF3+KfU7B
	3902A/qMmHpuvVXoIRgoymPDCNktoXrPkFTQEDRHNCl8gaNO8pSPlo2mdbyG1kqdzv2Q
	+RmlLARYrRijd5XR87aBhsAvT2Ak0rQ8aPwnVlpTi14hckzh/Yz613tjaJDlhUyG89aN
	EbzTYssrBde8vHzs3ipORkvu1H3N3sDU+e9w8w8DefvMyVu6/LxHFGJKbXdpgZMwsPW1
	ToDQ==
X-Gm-Message-State: APjAAAX3gFoXsrjxSdgV+BHJAFIOzYvBR5aoYeDMdXgBCRohEgk71eWf
	DFjZaCmtdAxa3/ZyxJMVT+79iRJEcCs=
X-Google-Smtp-Source: APXvYqz2MGrL9mif+9/y/UrnvecZfDq5Wa1PrvVevJB7lJB6q339oemquI9rT1FnMsH8Gx3crRqvFQ==
X-Received: by 2002:a65:6709:: with SMTP id u9mr895129pgf.59.1569294809831;
	Mon, 23 Sep 2019 20:13:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:02 -0700
Message-Id: <51f7ecf2259e1fb669cd84c5317cbd8810d731b7.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 06/24] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:29 -0000

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


