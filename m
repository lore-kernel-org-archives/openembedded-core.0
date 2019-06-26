Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8096D6D7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j2so1659367pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6JkrnoFcZUSZJErq1ajsQZxzWyOjbchkf5F11cY9PBw=;
	b=pU5BqEU+6BzBBb57sSDJ7rWzdX9AaI4EsKmqZNQinUU6kbL020pn0hGafKOwA5ETR1
	hWK2cZq9X48et+fKriNAfBhMJBI85Ee3QAZpns+Jv96Pzq87/4DzF8TupzDkhZwIAmO6
	v4oUWVD5TsApPQDiPRnSp0toaAKeMm7rZZKteJqTp3isdOTdmX39WKalWNYXU1Uoi52r
	ZAzkn+CZxlpygkBnIuP5i4FIkJoL/Dsa2qWx3Gi7DW9ve+cvoXPyQD2j4JZKaoUdB/oO
	cV+iHT4srtvWI2uGQUDPwiVxWcNMw8+VajZJ4iPIGzhyKlNZAI2CbuDgJFcmBrvcQWwT
	JodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6JkrnoFcZUSZJErq1ajsQZxzWyOjbchkf5F11cY9PBw=;
	b=s8tug26L8gpQAdLIamoUbJ+gRb/tLyvOZ1fT/Jlea2YkHf5nmLa4NP0b4X+B21OEF9
	/iQUqL4RJMx0j/OEIVh52QOBP1hoCZv5w7LZmVVtpCj80xbWssiA8TpYRBeTPo1CxYWQ
	HlR/eoL1lgTv+lXlG6RG5kkK8WCpPbheJDmQv6baofn9FJ8Cu0DsAn8K4SyYczPJvAOB
	9cf/mXIs0k0sET+MWUVcr4jPqBMQ4ywWtI6eTsrvpRWaJqD9+TaHKRxS6/2tGHErmOYI
	3pyf01/0go9jue7eBRo031OQQnh/HR+6xmnSbgkI8x7hfOjm1RitP9RsfMJpUepCmrEw
	scgg==
X-Gm-Message-State: APjAAAWHuAF3ahiUWS6n1IVQqRZqwv8UIHJJfWy9uVKziTkpS4gXD+cX
	aYkIcAY6OVwyT5+2rpwzyj467y+j+98=
X-Google-Smtp-Source: APXvYqzvN2OYgV3gMVaB28gvx5GITq7A8ecvC4qdM0fMODn+X4qlZuR99EcS8d3LORsQXWGHTQ44VA==
X-Received: by 2002:a17:90a:1d8:: with SMTP id 24mr66259pjd.70.1561568034331; 
	Wed, 26 Jun 2019 09:53:54 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:20 -0700
Message-Id: <71bfb9dfdc806e0e95f1302d0d6c3c751f03bb4b.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 19/25] glib-2.0: Security fix for CVE-2019-12450
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:53 -0000

From: Armin Kuster <akuster@mvista.com>

Source: glib-2.0
MR: 98443
Type: Security Fix
Disposition: Backport from https://gitlab.gnome.org/GNOME/glib/commit/d8f8f4d637ce43f8699ba94c9b7648beda0ca174
ChangeID: 880b9b349cb8d82c7c1314a3657ec9094baba741
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-12450.patch         | 59 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
new file mode 100644
index 0000000..37ad580
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
@@ -0,0 +1,59 @@
+From d8f8f4d637ce43f8699ba94c9b7648beda0ca174 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:41:53 +0200
+Subject: [PATCH] gfile: Limit access to files when copying
+
+file_copy_fallback creates new files with default permissions and
+set the correct permissions after the operation is finished. This
+might cause that the files can be accessible by more users during
+the operation than expected. Use G_FILE_CREATE_PRIVATE for the new
+files to limit access to those files.
+
+Upstream-Status: Backport
+https://gitlab.gnome.org/GNOME/glib/commit/d8f8f4d637ce43f8699ba94c9b7648beda0ca174
+CVE: CVE-2019-12450
+Signed-off-by: Armin kuster <akuster@mvista.com>
+
+---
+ gio/gfile.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/gio/gfile.c b/gio/gfile.c
+index 24b136d..74b5804 100644
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
+2.7.4
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
index 1271a7c..879bc48 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://date-lt.patch \
+           file://CVE-2019-12450.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.7.4


