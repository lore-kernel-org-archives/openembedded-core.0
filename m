Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.960.1795638788762756101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 12:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yhnfHrJW;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38644aedba1so9451966eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 12:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638788; x=1796243588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGLgps9BwVYe8ytFy/R7xoAhF9r9/EeUzJBNv/fa9SM=;
        b=yhnfHrJWqTW/WilUzuqXBL9gyIWrezeHaHEd4zrNgykqZPyNOuDHkZeVyTotZAMCLY
         MyYSUPnbCRXwALE4KGCC9+VMP9NMGe4En9Y8U921vynghYlo7rDLYHin8vccS3b37fuq
         C5Y9rFuWqtDS/eadkdW75Lp2+wanjxUlLICSp60YREkCagJZnf4j58UFnxiS5sYQtion
         yQ8PzIp2WwG0RvtRc/dECmt9xRcez80yntoa1A1CN4g2V433E8eqFWA/jxXVdapLzjBH
         vtVU1SCHFvmmoXTsJJY/Ckb7ckuUYT1cXJ/sX7Y61BxduqtpFlq2kYIs8SnclyMGgwXz
         hVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638788; x=1796243588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGLgps9BwVYe8ytFy/R7xoAhF9r9/EeUzJBNv/fa9SM=;
        b=lvDIoM9l8UBOcoZdUhZjXqOpC7RcUk/dhyN6vdklNZWgrG94nCzWFyKQuNI0hUpsrM
         FDjWVoTVVUAcTA9oPquNwGxLeClsPV5IGQTse0H2HXuSVXTAJebaQd6JtLksv/AFW43f
         cua0zm7I+nyh2085oBHi2bQ/WJo43CYhB2Z752vJz9oxscsehuTUfFpsf79tDhT7UTts
         /2DQ4rVvhjhbcU2RH3x9Z47sMP5PkADkGYLEsLOOJa3pCMw2VaGtOsFo8g7ExDHJ9bfK
         vHE35hup6keJlxQsAB/MDl1QaDVGySQHdSgd3WqMwDCdzfnwlIMxw9uu+p7vzGHeLN3i
         wOtQ==
X-Gm-Message-State: APuU4Z/yuFdTQjyw7CtHizIduGq5hRJzdqNfOOT7TSosRIrXwCbQ+MPK
	gzhwumymeaUZDAiJbKKBWWACwo2z8nZmBZp3fhT9wV9GIb5q5ZBXBegpo/dcJ6GC
X-Gm-Gg: AZFdTZep2+ygl8UtyXKMqVFJnTm6iL782UyeYmVzpwUZYVbFAdbtdmxCJshDy4ks/5t
	DAF0eRHIPUPKqlVbVzRvJMJ50Cs81yezINRHfYQOWLSMexM8mdG1C0CF2EV6fSuKibXVN8ZIL7b
	8iFDE3FI8vJYsf2ofUm4lyJQFG4OGtmXDB2ek9ckGGaI+ybvWHNCib0YiXiUmF5oHolqovqIqRp
	6/nD1BXUv2WaMdASAs4q9iUaL+wGCOpCs7X4u11GzDCUqTn1C8y77FTWo0EZrxkhE5bC54hNlQ3
	xsJZR68mwxJ02bLkDleNC+PH8LUxhwkHmyKz2tNXqyJ5owgTf6igN/OHYNlO9e0SlX8qs4vQpHZ
	BOLJTzZP/6mxCTFvUz5zTDlB4S1JGrrRysnLHSAjJuVh1m/griYh2jqqeDH9AClcgATeJNCc+WK
	fw6C3A7PkL6X532zBsl3ujaUHMU2NiMMJafNRh99bZ+dwpIyUPLDQtwEB2Cp+zWO4uUPCEjTPH+
	iiw0vX8k4npYmU8kTj0vMywtWOtZEguZOctivbAmYpsoW7AWyQrULhKtyMZ50bO5/tvBF7SpUgW
	NW8EMeTcxX7xVp7jLENcgGfPaqwPDLRB4g8QDUOeBtC7I66iHoyisW3w7tbdGyA8+rjK58e1JLo
	NGdYEM6ozLxQLdxUxxVlnCuK0yt/otDq4J72RBCdjL77MuOO9q5D9cNrNnd1iOYUDHpq4pGiuoJ
	2c/wrqBThXx6iOhjSZz/Vf5x/eE74CodHJBhQtVfRa3wU/motDDiVKQ07RoPir5Ax4JKpkA0M2a
	HmGa5RNAwdpVAFpOMSRzdFYPSKPbwQdcQ2o76vxs9WrwgxyspNEwxZ8P+VoG1wOpLIA42MFuvt1
	SlVjZA==
X-Received: by 2002:a05:7300:ce93:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-386bbfa6402mr7248692eec.32.1795638787791;
        Wed, 25 Nov 2026 12:33:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm64021261eec.24.2026.11.25.12.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:33:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] glib-2.0: Fix gdbus-server-auth ptest when run as non-root
Date: Wed, 25 Nov 2026 12:33:04 -0800
Message-ID: <20261125203304.2626213-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 20:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251248
Content-Type: text/plain; charset="utf-8"

test_server_path_in_use() pads g_get_tmp_dir() with 'x' characters
without adding a directory separator, so with G_TEST_TMPDIR=/tmp it tries
to create /tmpxxx... in the root directory. The ptest runs the tests as
the unprivileged glib2-test user, so g_mkdir_with_parents() fails:

  assertion failed (g_mkdir_with_parents (path->str, 0700) == 0): (-1 == 0)

Add the separator so the directory is created inside the tmp dir.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...er-auth-Create-the-long-path-inside-.patch | 40 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-tests-gdbus-server-auth-Create-the-long-path-inside-.patch

diff --git a/meta/recipes-core/glib-2.0/files/0001-tests-gdbus-server-auth-Create-the-long-path-inside-.patch b/meta/recipes-core/glib-2.0/files/0001-tests-gdbus-server-auth-Create-the-long-path-inside-.patch
new file mode 100644
index 0000000000..7d4918b841
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-tests-gdbus-server-auth-Create-the-long-path-inside-.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Oct 2026 10:10:22 -0700
+Subject: [PATCH] tests/gdbus-server-auth: Create the long path inside the tmp
+ dir
+
+test_server_path_in_use() builds an over-long socket directory by
+padding g_get_tmp_dir() with 'x' characters, but never adds a directory
+separator. With G_TEST_TMPDIR=/tmp the directory becomes
+
+    /tmpxxxxxxxx...
+
+i.e. a new entry in the root directory, so g_mkdir_with_parents() fails
+with EACCES unless the test runs as root:
+
+    assertion failed (g_mkdir_with_parents (path->str, 0700) == 0): (-1 == 0)
+
+This happens with the installed tests run by an unprivileged user, as
+the OpenEmbedded ptest does. Append a separator so the directory is
+created inside the temporary directory.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5551]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gio/tests/gdbus-server-auth.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gio/tests/gdbus-server-auth.c b/gio/tests/gdbus-server-auth.c
+index def0a74..811d12e 100644
+--- a/gio/tests/gdbus-server-auth.c
++++ b/gio/tests/gdbus-server-auth.c
+@@ -552,6 +552,7 @@ test_server_path_in_use (void)
+   gchar *escaped = NULL;
+ 
+   path = g_string_new (g_get_tmp_dir ());
++  g_string_append_c (path, G_DIR_SEPARATOR);
+   guid = g_dbus_generate_guid ();
+   while (path->len < UNIX_PATH_MAX - 1)
+     g_string_append_c (path, 'x');
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 9af625e05a..5ac6386494 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,6 +235,7 @@ SRC_URI += "file://run-ptest \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
            file://skip-monotonic-time-similar.patch \
+           file://0001-tests-gdbus-server-auth-Create-the-long-path-inside-.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
