Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 817D77D58A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 03:53:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w34so510718pga.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 20:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6JkrnoFcZUSZJErq1ajsQZxzWyOjbchkf5F11cY9PBw=;
	b=ZLosfk+M7Y7HyAygVVYu8W76CWbllgTGYmdyRsgduKzVfjpUeFg+0PKHCA9MYrAMZc
	zz5HwCOz8D02trgDV3rWPzifivL+d7CI4/Pqb9JWoCewfaxNVndGnnVsw+XzUiYcfjqC
	exMb/hUpiWvu1/lt8tbi65wx/U8FGdSB5rsOtBvdWV9EHkF/+aQf96ls4iYo3SkPm9Fe
	LvrbWxyOGHmfVxqDupf+Rq/P5OkIQOOg4fcwH59ot0WC5dMQXwzGSs4g3zGxXWd+F8b3
	zyD33m5DrTfUa6Gy0wqeKdaaZ46jEgY2PysXlHNLMsOU/ERvltLCJr4JKSoA2MQnb8yv
	jCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6JkrnoFcZUSZJErq1ajsQZxzWyOjbchkf5F11cY9PBw=;
	b=azQqjTt+nJTP6LNL3h8pgg9lzC+6UdYZwYY6+ecDn8HcRLtPQ8uyv8H+v6Oq0rXkV0
	D90WBOtQ5HpAuDHvu8VKVAworo9CU9zGT641/MfKTkizGvlx3BQZJNSaXTsdvWhLTgwc
	PNqlf7LdFr1wymnsm55uBWdUNdPPlyRCv+Hxs94P+Vc1eLCmLHnmSSCtPMSSs+KoP4sf
	/DXcsjnZPDo7gsgeSnfRGlmdPB7dphYgzjuuwqRZfHfAYiy+N70tQ6pg75NpZhrQ6j+e
	++z09azUdpbw+qWbTkVMLLrZKDOklQaWJ+arGYP6ZM2tABPVYIqnHWmpMld3q7CkeD6O
	GhEA==
X-Gm-Message-State: APjAAAXt4QfXc+1Hq00FfWPDP0vWtIyM5ub8c5srCB3CRRdardNpl/e/
	keEAuOmCeZ8XT8XngJzdj8JnLpnD
X-Google-Smtp-Source: APXvYqz1dMBXBnH3Wes1XpCzNa89DRGLC/XtzdbZVNlcafkASKqPoOQ448+b9kSbIFGMtH0FJ42kKg==
X-Received: by 2002:a63:295:: with SMTP id 143mr1269054pgc.279.1559793184188; 
	Wed, 05 Jun 2019 20:53:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:649f:275:809c:24d6])
	by smtp.gmail.com with ESMTPSA id i5sm448743pfk.49.2019.06.05.20.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Jun 2019 20:53:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 20:53:00 -0700
Message-Id: <1559793182-529-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 1/3] glib-2.0: Security fix for CVE-2019-12450
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
X-List-Received-Date: Thu, 06 Jun 2019 03:53:03 -0000

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


