Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A08817E541
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 10:59:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p7so1719905wmp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QmiY4OjPBiZNe37b2HCW0Y607S6ArfnhwxlIaKslKtc=;
	b=UoVbRdM7PDCRwBf/iCOsY7nmVDwg0r/su+ZHUj/xiY8CM/SZo8y6j0pLKFvU/Ak/5q
	Z1jUOLyRyYVXZ4bagz1hHVI9Ath46AHNlepmF0Q9FeS10AVZT3NfKtZlU4OsF2XV6k+M
	LN1vj3koOXDkl9+pqxvCT4bp+1oUPd2ee0ED2iYE6hnO9/E/RQPZju4a1FITFvCfR7wT
	Gobn+1+l0oACfwiwyHXb4hadMlCeCg4KrTAIxytp96YIK07cKNxxiku2WvPALbRriUQV
	bdKJ/GCGt+hKnAk6U9Rec6YYlu+wDPSyG3RUWs+YpycqW6d10ljeXhKw0T9AaJjWGANt
	RwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QmiY4OjPBiZNe37b2HCW0Y607S6ArfnhwxlIaKslKtc=;
	b=nAazOiEXBvdQ4eHrmSZmolVZ0hfDhtQFB/dQ0ZDcG5xJEynInpOGJNhJVVB4oLIvSR
	idHKSFGZjXjgFKlurHmnWsyQB3h8jDdfzZ/+zDDo2dqg4UXpZfHNT6OjF747nkbUAC9m
	RNO3gUbFRWILnf+eZKwfIqFSHhsmSxMY8qn5TOKQuriE8vbgm4AimhQe74yJlrs4UcY0
	8poDnPCu5Ui87RLjhCmNH3RHYh+LwRosR5la4FTfgBRd0gIEdpdSsj/Mr4+dwCvzZyun
	dT6OqtBLm8awmJrHqrmuzdj5lpGW807TS0GQkhNa8NzS1DoFYXzjr4KPkhKPRShrhV4J
	B5wg==
X-Gm-Message-State: APjAAAUrvwMMPanlGjlCnHXM8RyIjBJCi9krWi+fDWoEUgi27NmNaWYW
	lqJyQSgeiU6Tq7wmKLoFezGp6b0u
X-Google-Smtp-Source: APXvYqzuOHVeUoGX9ObVIPfoQES0057G+SXGY4Fu5MCYNLNCAw/kb1T4CzJfI8V5Z94iDRJXaBhCEA==
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr2061704wmk.37.1569322783132;
	Tue, 24 Sep 2019 03:59:43 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id n7sm1943753wrt.59.2019.09.24.03.59.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 03:59:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 12:59:24 +0200
Message-Id: <20190924105925.2287-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924105925.2287-1-schnitzeltony@gmail.com>
References: <20190924105925.2287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [sumo][PATCH 3/4] glib-2.0: Add patch from upstream to fix build with host gcc9
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
X-List-Received-Date: Tue, 24 Sep 2019 10:59:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...11-gdbus-Avoid-printing-null-strings.patch | 77 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-gdbus-Avoid-printing-null-strings.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0011-gdbus-Avoid-printing-null-strings.patch b/meta/recipes-core/glib-2.0/glib-2.0/0011-gdbus-Avoid-printing-null-strings.patch
new file mode 100644
index 00000000000..043879c85e0
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0011-gdbus-Avoid-printing-null-strings.patch
@@ -0,0 +1,77 @@
+From 566e1d61a500267c7849ad0b2552feec9c9a29a6 Mon Sep 17 00:00:00 2001
+From: Ernestas Kulik <ekulik@redhat.com>
+Date: Tue, 29 Jan 2019 09:50:46 +0100
+Subject: [PATCH] gdbus: Avoid printing null strings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This mostly affects the 2.56 branch, but, given that GCC 9 is being
+stricter about passing null string pointers to printf-like functions, it
+might make sense to proactively fix such calls.
+
+gdbusauth.c: In function '_g_dbus_auth_run_server':
+gdbusauth.c:1302:11: error: '%s' directive argument is null
+[-Werror=format-overflow=]
+ 1302 |           debug_print ("SERVER: WaitingForBegin, read '%s'",
+ line);
+       |
+
+gdbusmessage.c: In function ‘g_dbus_message_to_blob’:
+gdbusmessage.c:2730:30: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
+ 2730 |       tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
+      |
+
+Upstream-Status: Applied [1]
+
+[1] https://gitlab.gnome.org/GNOME/glib/commit/566e1d61a500267c7849ad0b2552feec9c9a29a6
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ gio/gdbusauth.c    | 2 +-
+ gio/gdbusmessage.c | 5 ++---
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/gio/gdbusauth.c b/gio/gdbusauth.c
+index 1f8ea8057..752ec23fc 100644
+--- a/gio/gdbusauth.c
++++ b/gio/gdbusauth.c
+@@ -1272,9 +1272,9 @@ _g_dbus_auth_run_server (GDBusAuth              *auth,
+                                                     &line_length,
+                                                     cancellable,
+                                                     error);
+-          debug_print ("SERVER: WaitingForBegin, read '%s'", line);
+           if (line == NULL)
+             goto out;
++          debug_print ("SERVER: WaitingForBegin, read '%s'", line);
+           if (g_strcmp0 (line, "BEGIN") == 0)
+             {
+               /* YAY, done! */
+diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
+index 3221b925d..3a1a1f9e9 100644
+--- a/gio/gdbusmessage.c
++++ b/gio/gdbusmessage.c
+@@ -2731,7 +2731,6 @@ g_dbus_message_to_blob (GDBusMessage          *message,
+   if (message->body != NULL)
+     {
+       gchar *tupled_signature_str;
+-      tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
+       if (signature == NULL)
+         {
+           g_set_error (error,
+@@ -2739,10 +2738,10 @@ g_dbus_message_to_blob (GDBusMessage          *message,
+                        G_IO_ERROR_INVALID_ARGUMENT,
+                        _("Message body has signature “%s” but there is no signature header"),
+                        signature_str);
+-          g_free (tupled_signature_str);
+           goto out;
+         }
+-      else if (g_strcmp0 (tupled_signature_str, g_variant_get_type_string (message->body)) != 0)
++      tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
++      if (g_strcmp0 (tupled_signature_str, g_variant_get_type_string (message->body)) != 0)
+         {
+           g_set_error (error,
+                        G_IO_ERROR,
+-- 
+2.21.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
index faf594569d6..35fd86819bf 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
+           file://0011-gdbus-Avoid-printing-null-strings.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.21.0


