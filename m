Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 200D57ED03
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 02:05:30 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id b128so266914pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=h35ci2H/+cb0xy9RjQGEwYkXDdYAOp+7zmzxLqNHerk=;
	b=CNNSXcHMtRex1KstIaQit27TByhoseXUJP5jd+ViiuVr2s7jLZ043r+Nb+svNGt4B+
	YbM8ibtGtinWT8/4azn5AgY8RR0ifP4VctFJDtk96Gg536Uvro09M4K/MAcnI0wNPQ+x
	LAC7Qsz+LZPFPY8zobuecr/hstp284CsZASof9Fo8Ls4TJ2zwJeOlKCi3ZJe4V7x7DoE
	YKBehj3bPQzy9DRo5qzjlJmuL/9l7GTN7tvDqaamv5gM77bOG8kUbGiPxZ2iQW31LHgh
	YpAI6WP+2XNbyk5NGcnwLAiO1B9kZ1EdspIiVRiLxf9C7ddO12x9EezVPbpKDkhZorA/
	w6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h35ci2H/+cb0xy9RjQGEwYkXDdYAOp+7zmzxLqNHerk=;
	b=eFb9UXFfnGUjU0WVVAd0vIdJ0ysJs4DXaJRzdGmJRTHTDqP7EITo6pBOqeJ66LjyoL
	lUMNDInaU2sMdc6aSpt28pDkjtV4Te1zt8dWnD3sCEK2iGm0w0ZYuhuCL843nDF/U9oj
	eTYYjFGXUVXrnUnYKoPxoOQ2idbWn0Mtbwyy8JPEwb7037MsfY1SjarDybKCwX9SXJ6q
	mhgnf65R9TOVftQ02M75FnAnLzw7iL4dPvPbTU0lgE0ZJEs8xLx2ngj8w46n4eOquC3A
	VqeKsQHOj1AZEDuXNXTLoNsY2I8zIqRGLzm0eVSZpSt0LD7papSbQbLQDX2GTDmScqh9
	XSbQ==
X-Gm-Message-State: APjAAAXFEVcpNSmVd737gqRruzGNmu98s3IwAuowNXWf7/L/5KazG6hf
	cu8TPUoh5i61VFrug7z2Is/cCS/eJEI=
X-Google-Smtp-Source: APXvYqxqWUdbwIT2m0TXdCVohMAoucMY4irygqDCAGmST8GCCwCa+vzXojcRh7JB7D/27+Z4L1suvQ==
X-Received: by 2002:a65:6804:: with SMTP id l4mr4601393pgt.329.1568426731824; 
	Fri, 13 Sep 2019 19:05:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:b812:1f2e:5b35:90e5])
	by smtp.gmail.com with ESMTPSA id
	q204sm36820704pfc.11.2019.09.13.19.05.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Sep 2019 19:05:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 19:05:29 -0700
Message-Id: <1568426729-8318-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] pango: fix CVE-2019-1010238
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
X-List-Received-Date: Sat, 14 Sep 2019 02:05:31 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 65631a048f57965745dc8cc23cb80c4c3a71ba94)
[Fix up for thud context]
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
index 22fe3af..f6a3a5a 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -15,7 +15,9 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 
 SRC_URI += "file://run-ptest \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
-"
+            file://CVE-2019-1010238.patch \
+            "
+
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
 
-- 
2.7.4


