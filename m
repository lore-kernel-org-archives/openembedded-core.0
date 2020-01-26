Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 784129169E
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:06 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p14so3752396pfn.4
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zPxx3EHPh4Ta4XiCUnvFA6XTq7eJJZaVmLsyVqAmFvc=;
	b=n85IH78g1TL1ushLfYpnsIw6kFYt918uXmERNdJEL31hlgMGI+l8NBEn8UCmto8XaD
	OKSN6AWeKVSvcY1iikcZNvt8d2uF5ayCpe/mMBZPJuqyYQZ5bUiGk5mzA5za09yaGORI
	ONT8/C6/GC6cN0KQZWWXHTF+40EWT1dRrRseJeTVAbUGBGWy1yAGPkMpMa4+xmZrao9u
	x11XUOSn8K9qGFwVzt5KDF5oeeLEwhO8xmFPk6JAKpl9L2VtVI3ezz0qevG7k83ru8yU
	0CCtprAanUZinLCw7HQ52l7TLXrIUwLmyE2KKeWdV4unqNfZ987mMsJzsLFWLSeviyD0
	7uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zPxx3EHPh4Ta4XiCUnvFA6XTq7eJJZaVmLsyVqAmFvc=;
	b=kHJ8D8xLowDEzpXNVgOZiNRoPVs1+I0EasGeHiMc4Uh+KAbvN+Xyt7982QUz4EhEFZ
	CHHXcXw8LjrLcgRz9OZCWXPve+9TXup1Z9nJptZw15+H2heDTptyC/N9qCYztoTxLOuV
	/FFpj/a10akr8BWbVQevDtD3MU61YkSLPYgwUOdtlvfVpeHbeUZo1nFOX7RPQE/QzMGl
	vcWI5cbRP9MYdI90gxnHhh3BmZVcZImYo5pqGgiIVBdKfkTjaAxGD27yM2YxvA5VzVd/
	/JseL9jE2Oab+vkJ2SZTgYbeiZLJPkOagw7pFC/wLAzEcqTdYn2pUhbvxy3Td9xSr5sX
	AF/Q==
X-Gm-Message-State: APjAAAU7481c+RpT43FvpzlPjygot07HBPjVIbnmlqbtbi61xvG3HH9B
	EejgSUy6GSfpFyq4D4ciejd2oEuJ
X-Google-Smtp-Source: APXvYqxfbq7BAaweNNw3AB+iObIPONMhgjx8YRfaGS0Jye0F1knKeuJAknP1dpw2qMqW4ufq4/hg0A==
X-Received: by 2002:a63:303:: with SMTP id 3mr15160644pgd.372.1580055907392;
	Sun, 26 Jan 2020 08:25:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.06
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:38 -0800
Message-Id: <9c4d7a92f4f6e4070102b12de44d9bfe6f944735.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 13/29] glib-2.0: Backport the CVE-2019-12450 fix
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:06 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...e-Limit-access-to-files-when-copying.patch | 57 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch
new file mode 100644
index 0000000000..8fc03d1aed
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch
@@ -0,0 +1,57 @@
+From e6b769819d63d2b24b251dbc9f902fe6fd614da3 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:41:53 +0200
+Subject: gfile: Limit access to files when copying
+
+file_copy_fallback creates new files with default permissions and
+set the correct permissions after the operation is finished. This
+might cause that the files can be accessible by more users during
+the operation than expected. Use G_FILE_CREATE_PRIVATE for the new
+files to limit access to those files.
+
+CVE: CVE-2019-12450
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ gio/gfile.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/gio/gfile.c b/gio/gfile.c
+index 1cc69166a..13b435480 100644
+--- a/gio/gfile.c
++++ b/gio/gfile.c
+@@ -3284,12 +3284,12 @@ file_copy_fallback (GFile                  *source,
+         out = (GOutputStream*)_g_local_file_output_stream_replace (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+                                                                    FALSE, NULL,
+                                                                    flags & G_FILE_COPY_BACKUP,
+-                                                                   G_FILE_CREATE_REPLACE_DESTINATION,
+-                                                                   info,
++                                                                   G_FILE_CREATE_REPLACE_DESTINATION |
++                                                                   G_FILE_CREATE_PRIVATE, info,
+                                                                    cancellable, error);
+       else
+         out = (GOutputStream*)_g_local_file_output_stream_create (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+-                                                                  FALSE, 0, info,
++                                                                  FALSE, G_FILE_CREATE_PRIVATE, info,
+                                                                   cancellable, error);
+     }
+   else if (flags & G_FILE_COPY_OVERWRITE)
+@@ -3297,12 +3297,13 @@ file_copy_fallback (GFile                  *source,
+       out = (GOutputStream *)g_file_replace (destination,
+                                              NULL,
+                                              flags & G_FILE_COPY_BACKUP,
+-                                             G_FILE_CREATE_REPLACE_DESTINATION,
++                                             G_FILE_CREATE_REPLACE_DESTINATION |
++                                             G_FILE_CREATE_PRIVATE,
+                                              cancellable, error);
+     }
+   else
+     {
+-      out = (GOutputStream *)g_file_create (destination, 0, cancellable, error);
++      out = (GOutputStream *)g_file_create (destination, G_FILE_CREATE_PRIVATE, cancellable, error);
+     }
+ 
+   if (!out)
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 2286d03148..f151a3358f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
            file://glib-meson.cross \
            file://CVE-2019-13012.patch \
+           file://0001-gfile-Limit-access-to-files-when-copying.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.17.1


