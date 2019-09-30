Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDE560807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y10so3410346plp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fvUDpFi44QMFi2MN1XRqzTYpulu2pHOv5HzGABEdhwI=;
	b=Dl1IvDZvU8ZSkA8q1WjW9EuWYv+u5fykmZm9Syrh0YuTiFK0et983CIAd1qP9SNgl9
	1+hIBEn43QV1ji3+oaFGMMcPfMvHkiSHeCSGslByyh5jDRERMCWbMh5iaYGKEwHlGxru
	GNQrSGy7CPWlsORvaqpdyR9XkWHGVxz41UXo8Z3jEIxObRXRtce4abuO4onBl0USeY3Z
	pH8AKwPQi/77BxuGridgysm+0saXGkgjyIcpIG+I+JoXwkAxyeUNB0hPmseEtVSEjXte
	Eu8WwEo99FZRUPbekRmL2hJuLViXZpgG/Jedxg4DSTNds914O4vL+niTEQfUBobm1XVG
	fGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fvUDpFi44QMFi2MN1XRqzTYpulu2pHOv5HzGABEdhwI=;
	b=EMK1ITHx/RLg6wGfW0zD0vmA94naPCM9mb2iVPjztq1Q/yYQC7MhciWn/Cy2hz5dAg
	4017HoVPCjxXsFRbGbyoTu+crdLApyd3rm6xByKR+k4qzBNGlrxt6QGn3en1k+LNo8W7
	Lw1zkeaqgoPgutjZQcWtZnhlJ+0cQAAc6KSFXXZTEL48eNOlbWzDL5qoyhax3j14vie4
	5oC64bjY8VMOZbWk0GXYL+EAyED40Cl4HPa9NkSpcEORLbV58L65i4MNjPE0Fb3+3NiT
	NqAjm1aPE/WR3BlC+3wD//a5C3vdUCmWS3bePtunZB97F0LbtYp1/83du2dgmanT+NPY
	Q4CQ==
X-Gm-Message-State: APjAAAUimZDjtgw/kKHzuWpZUJSsi+91SAnM6dJ0QEZZJfw1Xd8AEjjF
	Z00bmb+2StDZljz1LYVaKGI2gWX2pnw=
X-Google-Smtp-Source: APXvYqyFWreQ7IQ3PnBjSbq8Cxd248AYFNy4h+8EkmHd3auacay+MLdyL9DvwN0He/sDbrGLHrrnpA==
X-Received: by 2002:a17:902:8bc4:: with SMTP id
	r4mr17448096plo.341.1569818907263; 
	Sun, 29 Sep 2019 21:48:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:28 -0700
Message-Id: <d2ce91ddd66d2c646b0fe273e66538f2724a5cdb.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 33/54] pango: fix CVE-2019-1010238
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:27 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pango/pango/CVE-2019-1010238.patch             | 38 ++++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.42.4.bb        |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch

diff --git a/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
new file mode 100644
index 0000000..5b0c342
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
@@ -0,0 +1,38 @@
+From 490f8979a260c16b1df055eab386345da18a2d54 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Wed, 10 Jul 2019 20:26:23 -0400
+Subject: [PATCH] bidi: Be safer against bad input
+
+Don't run off the end of an array that we
+allocated to certain length.
+
+Closes: https://gitlab.gnome.org/GNOME/pango/issues/342
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/pango/commit/490f8979a260c16b1df055eab386345da18a2d54]
+CVE: CVE-2019-1010238
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ pango/pango-bidi-type.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/pango/pango-bidi-type.c b/pango/pango-bidi-type.c
+index 3e46b66c..5c02dbbb 100644
+--- a/pango/pango-bidi-type.c
++++ b/pango/pango-bidi-type.c
+@@ -181,8 +181,11 @@ pango_log2vis_get_embedding_levels (const gchar    *text,
+   for (i = 0, p = text; p < text + length; p = g_utf8_next_char(p), i++)
+     {
+       gunichar ch = g_utf8_get_char (p);
+-      FriBidiCharType char_type;
+-      char_type = fribidi_get_bidi_type (ch);
++      FriBidiCharType char_type = fribidi_get_bidi_type (ch);
++
++      if (i == n_chars)
++        break;
++
+       bidi_types[i] = char_type;
+       ored_types |= char_type;
+       if (FRIBIDI_IS_STRONG (char_type))
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index f3be9f4..1e1a5b8 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -16,7 +16,9 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://insensitive-diff.patch"
+            file://insensitive-diff.patch \
+            file://CVE-2019-1010238.patch \
+            "
 
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
-- 
2.7.4


