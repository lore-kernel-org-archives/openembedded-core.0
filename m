Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 27350797E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 16:04:00 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id d19-v6so7233518pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MLz1eBQZOnwqkSCs/obeEbFU5coVyLCga0zW/YLVDKk=;
	b=O7MazYmFFtum4DF5Gylq/KYokNU5Hxtl8+Sv2EOr1u6fP/AlzFyglyWg/rpQ1ixm6a
	bvdZpktfJE3hfDeSCF69oy3u88Nf++GzyehXDbHsT2t0v9sm5MSH2X4FLW9HOHN8OUvm
	tdzgUFmC0HVJSUZLQnlcnAmRZa0jXe6hnMuASWGKqWqYmOGDCT72Eq2rWx3Fl1zUrRyL
	/ym/9cL/6SS4tpgStwqrkWFNed9DLm+y09+t55DtneXbWn1kuJ7fXU1xvGsj4csu0y+F
	2zzmbBXCuClaepzKzqfz7JHYzGN4hIwdQ8Os+sULEjqurMPP2lxcXGQxpEdiJKcKWpsa
	hVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MLz1eBQZOnwqkSCs/obeEbFU5coVyLCga0zW/YLVDKk=;
	b=qIy7mfDdORZ2qlx3N7O1yFWxtdY5Y2m2VF7IcywjIe4oT0JsYWb0QyeCnxLu+c6QKg
	N0qnFEUFqubsu4XocWpFji0OtuGgMosd8goluJGEfL/khqPB9yzjq83erxGqPlIDEnFp
	/t6WAfFPuqdapMZpsc3xXSQftZ/JL+7KoBJLRAHQSJEIXO8wWQTu2aytYKv9GPLBFRAy
	DDfiLJdAbYCRM6ABFD5TLh/lM23q1YxP4EZzKk+FmTll5Czh3zCNnahMiB3LG+xks8Cd
	qMrY1x1VXeooCLU4nuK+1KQfLxv5TXEpvukVdsxc3RHVLypeLANapd92yMyVV+HAXzzW
	/i4A==
X-Gm-Message-State: APzg51BwMl1nfi99TQwma0rs8KeHHyRXFw7DFQW0t670cbYS9rg8B5zu
	fqqZ6xN43WsT1bRPTN0U7O5O43OD
X-Google-Smtp-Source: ANB0VdZq39WX8vfTsCxSw3ExLd44IW1BSori3+SjnBRcqb0wf0vDJ3J/jLXvTqnaI8vpY/lRL5uRTw==
X-Received: by 2002:a63:31c2:: with SMTP id
	x185-v6mr8926130pgx.373.1536336241620; 
	Fri, 07 Sep 2018 09:04:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	193-v6sm21208122pgh.47.2018.09.07.09.04.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 09:04:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 09:03:53 -0700
Message-Id: <d0ae484bdd20a9c83a7f802447ab46f3c9fe6373.1536336171.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536336171.git.raj.khem@gmail.com>
References: <cover.1536336171.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] sysprof: Fix build with clang
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
X-List-Received-Date: Fri, 07 Sep 2018 16:04:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fix-non-literal-format-string-issues.patch | 34 +++++++++++++++++++
 meta/recipes-kernel/sysprof/sysprof_3.30.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch

diff --git a/meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch b/meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch
new file mode 100644
index 0000000000..b77bfa4a65
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/0001-fix-non-literal-format-string-issues.patch
@@ -0,0 +1,34 @@
+From de13d1f908335cc882c447e4d7c4360b9e5da190 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 6 Sep 2018 17:49:44 -0700
+Subject: [PATCH] fix non-literal format string issues
+
+clang errors out when using -Werror=format-nonliteral
+since the definition of g_strdup_vprintf() from glib-2.0
+is using va_list and clangs still warns where as
+gcc doesn't do that for va_list arguments
+
+Fixes
+src/sp-window.c:96:27: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
+|   str = g_strdup_vprintf (format, args);
+|                           ^~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sp-window.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sp-window.c b/src/sp-window.c
+index 4dfac2d..aff4779 100644
+--- a/src/sp-window.c
++++ b/src/sp-window.c
+@@ -80,7 +80,7 @@ static guint signals [N_SIGNALS];
+ static void sp_window_set_profiler (SpWindow   *self,
+                                     SpProfiler *profiler);
+ 
+-static void
++static G_GNUC_PRINTF(3, 4) void
+ sp_window_notify_user (SpWindow       *self,
+                        GtkMessageType  message_type,
+                        const gchar    *format,
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
index 7783ab27f5..19dcf25a51 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
            file://wordsize.patch \
+           file://0001-fix-non-literal-format-string-issues.patch \
            "
 RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://bugzilla.gnome.org/show_bug.cgi?id=794625"
 
-- 
2.18.0


