Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEEB7EE16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:41 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id r1so16119408pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6JkrnoFcZUSZJErq1ajsQZxzWyOjbchkf5F11cY9PBw=;
	b=PU4ZB9D9B1eEBHoV/or40q0uhh2cpv85gL6NgNkuCpTMiQEfpYMLOl2xVYkYNhYIy5
	BRA/3/56/umkCzkgmLiavD1AnE9DmQVFYXuOECP0W4URASkO+LhltyERTCN/Ru9cAZ6U
	1AKlqdG3AG057fUw99Zl/egRxnNkuPsDQ48N20dLqWxUg9nnB/3gfJJ1MwMAzdud6Wys
	H/2ggWoHxvbQM6K4/6BzSyQWZWjE+jP6fQh6l/553F48o25H0I4vM0ZhkPA73QnZw5jW
	t3+519zNNUnjiZj5UVdYx4zT6b/bCzhTx6xyynQboeBcXmxqzSWs8gc+VRTkYCpDxjNH
	sszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6JkrnoFcZUSZJErq1ajsQZxzWyOjbchkf5F11cY9PBw=;
	b=VZqsYkbvOfGNks4cpKHtgrJAZ604FVBrOaYBMb04EaCuOaSpwMkJTiEl7ada7Cy0bl
	mSKOEnSE1eM/C7AJ0hQdgu60ON8MH+MUHoUErCaRQ3eMNhuAOpZgJglPan1QziIsuUcY
	IwZ4f3syGVbotGoSE8aE3wXYhly39kHD1Hsa4e3+LwCNPjQTnmE8WskI1pycLgqTYSsY
	klMDJxhQJo8rUiX3GmIYVqwQS+Lwzd4QeIRQ7FXwrpdahHwyrfUVW3gp6t2KEQIr7Tid
	pHMP3vfdOGkrBGjXCoYc4fdeNaIwEWa/cQj98egGHGznXs6bXP2bbZ8VEKHtS2tmONpV
	ablA==
X-Gm-Message-State: APjAAAXZaGqkHCpSYbFlKXosQzD95f+rhNtKBJCiFaDSo2WaEAMGFxRu
	gdqrSiuAjnIxzkwB1w4gUtW8SYfd
X-Google-Smtp-Source: APXvYqygZGj1j+3JsDNY8UcNXgD4rahSSOplpZb+mQU1L1caT5n/cLbA6xsYSYiUKA+XqTDmsAndAg==
X-Received: by 2002:a65:4844:: with SMTP id i4mr67758299pgs.113.1563719142676; 
	Sun, 21 Jul 2019 07:25:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:08 -0700
Message-Id: <71bfb9dfdc806e0e95f1302d0d6c3c751f03bb4b.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 19/30] glib-2.0: Security fix for CVE-2019-12450
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:42 -0000

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


