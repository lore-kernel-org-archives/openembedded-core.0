Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDF3F357AC
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21479.1771943119170883017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HlY6YSyy;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837907f535so50078265e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943117; x=1772547917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yi8JyS0+5KvsERwSG6+7QgQXR+4BKawwoAZyKRdaTyE=;
        b=HlY6YSyydPsSjJYKwSQm1H8bv6sn7J9vJgT9nSnxB8Mk/Pv1GymE1fcPNOTWdn/41b
         qo7YotdsFPfWoyoKLVEwona3iSCUWdC6N9kvxrOcXfJR52NHoTwfKPbKlv79/gw4g6Yy
         1ThQzkzo6up793Bp4/XwTmnHG0k1ACfO6qr20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943117; x=1772547917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yi8JyS0+5KvsERwSG6+7QgQXR+4BKawwoAZyKRdaTyE=;
        b=eX9QWAMEklsLI1fe+Z4K1JUImKWHXTrfq0A6Kcn9x89FrAsRdGrmf0pE/XQW8VXI2z
         no6loyXfKhl05vzw64cJbpc7KgyK/hFxRD0qTJi0GTee7IedCynaNfu4rus52qhWz6A/
         GW05Vb2TGfYB8DsLHM0szhCkIQwG3CC23oMH5N+OagfkpAAZVb/JZa7w/Iyz8oCHoN/3
         Ei1DtODVHe1Sr/RSDNCm7ooq2wpJOFx/5CoQKILMNlYg1Evji7NzyqH2g1AFNYUuJaxC
         HkGXkrhZIH+QM0vEIZttNCDQF9yvjx4WeF6iiLOJwGYJJe3GTEXzAmg3EtOYsIWpu6kx
         ZbXw==
X-Gm-Message-State: AOJu0Yye7TYt3PJnL6NCEaj1vGs0TA3cd5fEVzzOu/xjg+baLELU3jBX
	KQr5f7wyAh9JyWrqvqbR0APXxbyskuLKDTzqHusSbl9y4lQPUbIDSAsLgPngJ2I37HR5VYfmzCO
	/0ZOJ
X-Gm-Gg: AZuq6aIy9CUcxsSjTC2ZpGWWLDuu0hRX68C3OU7e5WfMS3JZ8wKJi9lzGNpCoISHdpX
	Xb4g03oPdGN9+Td+g2Xf9yRQvG2uM2+PJj02WvJDXLa5tY4e0yLNfSvCcF+DgcE/9WLL1SpuuUG
	JP+dvukTSqSMNJpbu8ixmHpVh1ogZDd9LZAXtT4+QX4WsTlt+ID/1T91F3pAO+o/WvkjlbsZysq
	oi+tj5SEiIoH8kDx/waIXrke70pokE22eODGwpRwgi2rGR6Qu/mXeYNEZeAMrdo2JGCqKsilmRz
	iU+2JPVzlwEiETJuyBTcPJot9JdQQgV8MV10vInPFEkzbAyRTDI1HnSBiL0gRlymK3HSDJ5JASv
	MuVqdAiDcLzWw9aOB+KVSg82Jy1dnfUxa/HwHFZqqm5sG2z+8tngNGo8d/RKKBse3zTqKrTTqIG
	UF66vtnD8qKJJl9Tn6J9uSEJ2Qs3j9etiPUU5m7mOjVv5C0X05z8uzKBItp748nLUQQemjva1xx
	pqcpE3p5CU3b1pWGRJ0rK6rtm9w7Eh/bg==
X-Received: by 2002:a05:600c:848e:b0:47e:e71a:e13a with SMTP id 5b1f17b1804b1-483a960a0f8mr178719515e9.32.1771943116811;
        Tue, 24 Feb 2026 06:25:16 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/38] glib-2.0: patch CVE-2026-1489
Date: Tue, 24 Feb 2026 15:24:17 +0100
Message-ID: <678efba93e863ea29cb9e3ab95d31bc25fd2e55a.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231791

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3872
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4984

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch  |  42 +++
 .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch  |  30 ++
 .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch  | 290 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch  |  68 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   4 +
 5 files changed, 434 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
new file mode 100644
index 00000000000..612bb8bec52
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
@@ -0,0 +1,42 @@
+From 662aa569efa65eaa4672ab0671eb8533a354cd89 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 22:00:17 +0100
+Subject: [PATCH] guniprop: Use size_t for output_marks length
+
+The input string length may overflow, and this would lead to wrong
+behavior and invalid writes.
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-171
+Closes: #3872
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/662aa569efa65eaa4672ab0671eb8533a354cd89]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/guniprop.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/guniprop.c b/glib/guniprop.c
+index fe0033fd6..1a0cc6408 100644
+--- a/glib/guniprop.c
++++ b/glib/guniprop.c
+@@ -753,13 +753,13 @@ get_locale_type (void)
+   return LOCALE_NORMAL;
+ }
+ 
+-static gint
++static size_t
+ output_marks (const char **p_inout,
+ 	      char        *out_buffer,
+ 	      gboolean     remove_dot)
+ {
+   const char *p = *p_inout;
+-  gint len = 0;
++  size_t len = 0;
+   
+   while (*p)
+     {
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
new file mode 100644
index 00000000000..7587a9e09e1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
@@ -0,0 +1,30 @@
+From 58356619525a1d565df8cc348e9784716f020f2f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 22:01:49 +0100
+Subject: [PATCH] guniprop: Do not convert size_t to gint
+
+We were correctly using size_t in output_special_case() since commit
+362f92b69, but then we converted the value back to int
+
+Related to: #3872
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/58356619525a1d565df8cc348e9784716f020f2f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/guniprop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/guniprop.c b/glib/guniprop.c
+index 1a0cc6408..fe50a287c 100644
+--- a/glib/guniprop.c
++++ b/glib/guniprop.c
+@@ -779,7 +779,7 @@ output_marks (const char **p_inout,
+   return len;
+ }
+ 
+-static gint
++static size_t
+ output_special_case (gchar *out_buffer,
+ 		     int    offset,
+ 		     int    type,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
new file mode 100644
index 00000000000..1755254ff7d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
@@ -0,0 +1,290 @@
+From 170dc8c4068db4c4cbf63c7d27192e230436da21 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 22:04:22 +0100
+Subject: [PATCH] guniprop: Ensure we do not overflow size in
+ g_utf8_{strdown,gstrup}()
+
+While this is technically not a security issue, when repeatedly adding
+to a size_t value, we can overflow and start from 0.
+
+Now, while being unlikely, technically an utf8 lower or upper string can
+have a longer size than the input value, and if the output string is
+bigger than G_MAXSIZE we'd end up cutting it silently.
+
+Let's instead assert each time we increase the output length
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/170dc8c4068db4c4cbf63c7d27192e230436da21]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/guniprop.c | 109 +++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 70 insertions(+), 39 deletions(-)
+
+diff --git a/glib/guniprop.c b/glib/guniprop.c
+index fe50a287c..86020b6e0 100644
+--- a/glib/guniprop.c
++++ b/glib/guniprop.c
+@@ -753,14 +753,36 @@ get_locale_type (void)
+   return LOCALE_NORMAL;
+ }
+ 
+-static size_t
+-output_marks (const char **p_inout,
+-	      char        *out_buffer,
+-	      gboolean     remove_dot)
++static inline void
++increase_size (size_t *sizeptr, size_t add)
++{
++  g_assert (G_MAXSIZE - *(sizeptr) >= add);
++  *(sizeptr) += add;
++}
++
++static inline void
++append_utf8_char_to_buffer (gunichar  c,
++                            char     *out_buffer,
++                            size_t   *in_out_len)
++{
++  gint utf8_len;
++  char *buffer;
++
++  buffer = out_buffer ? out_buffer + *(in_out_len) : NULL;
++  utf8_len = g_unichar_to_utf8 (c, buffer);
++
++  g_assert (utf8_len >= 0);
++  increase_size (in_out_len, utf8_len);
++}
++
++static void
++append_mark (const char **p_inout,
++             char        *out_buffer,
++             size_t      *in_out_len,
++             gboolean     remove_dot)
+ {
+   const char *p = *p_inout;
+-  size_t len = 0;
+-  
++
+   while (*p)
+     {
+       gunichar c = g_utf8_get_char (p);
+@@ -768,7 +790,7 @@ output_marks (const char **p_inout,
+       if (ISMARK (TYPE (c)))
+ 	{
+ 	  if (!remove_dot || c != 0x307 /* COMBINING DOT ABOVE */)
+-	    len += g_unichar_to_utf8 (c, out_buffer ? out_buffer + len : NULL);
++            append_utf8_char_to_buffer (c, out_buffer, in_out_len);
+ 	  p = g_utf8_next_char (p);
+ 	}
+       else
+@@ -776,14 +798,14 @@ output_marks (const char **p_inout,
+     }
+ 
+   *p_inout = p;
+-  return len;
+ }
+ 
+-static size_t
+-output_special_case (gchar *out_buffer,
+-		     int    offset,
+-		     int    type,
+-		     int    which)
++static void
++append_special_case (char   *out_buffer,
++                     size_t *in_out_len,
++                     int     offset,
++                     int     type,
++                     int     which)
+ {
+   const gchar *p = special_case_table + offset;
+   gint len;
+@@ -795,10 +817,12 @@ output_special_case (gchar *out_buffer,
+     p += strlen (p) + 1;
+ 
+   len = strlen (p);
+-  if (out_buffer)
+-    memcpy (out_buffer, p, len);
++  g_assert (len < G_MAXSIZE - *in_out_len);
+ 
+-  return len;
++  if (out_buffer)
++    memcpy (out_buffer + *in_out_len, p, len);
++
++  increase_size (in_out_len, len);
+ }
+ 
+ static gsize
+@@ -839,11 +863,13 @@ real_toupper (const gchar *str,
+ 		  decomp_len = g_unichar_fully_decompose (c, FALSE, decomp, G_N_ELEMENTS (decomp));
+ 		  for (i=0; i < decomp_len; i++)
+ 		    {
++
+ 		      if (decomp[i] != 0x307 /* COMBINING DOT ABOVE */)
+-			len += g_unichar_to_utf8 (g_unichar_toupper (decomp[i]), out_buffer ? out_buffer + len : NULL);
++                        append_utf8_char_to_buffer (g_unichar_toupper (decomp[i]),
++                                                    out_buffer, &len);
+ 		    }
+-		  
+-		  len += output_marks (&p, out_buffer ? out_buffer + len : NULL, TRUE);
++
++                  append_mark (&p, out_buffer, &len, TRUE);
+ 
+ 		  continue;
+ 		}
+@@ -856,17 +882,17 @@ real_toupper (const gchar *str,
+       if (locale_type == LOCALE_TURKIC && c == 'i')
+ 	{
+ 	  /* i => LATIN CAPITAL LETTER I WITH DOT ABOVE */
+-	  len += g_unichar_to_utf8 (0x130, out_buffer ? out_buffer + len : NULL); 
++          append_utf8_char_to_buffer (0x130, out_buffer, &len);
+ 	}
+       else if (c == 0x0345)	/* COMBINING GREEK YPOGEGRAMMENI */
+ 	{
+ 	  /* Nasty, need to move it after other combining marks .. this would go away if
+ 	   * we normalized first.
+ 	   */
+-	  len += output_marks (&p, out_buffer ? out_buffer + len : NULL, FALSE);
++          append_mark (&p, out_buffer, &len, TRUE);
+ 
+ 	  /* And output as GREEK CAPITAL LETTER IOTA */
+-	  len += g_unichar_to_utf8 (0x399, out_buffer ? out_buffer + len : NULL); 	  
++          append_utf8_char_to_buffer (0x399, out_buffer, &len);
+ 	}
+       else if (IS (t,
+ 		   OR (G_UNICODE_LOWERCASE_LETTER,
+@@ -877,8 +903,8 @@ real_toupper (const gchar *str,
+ 
+ 	  if (val >= 0x1000000)
+ 	    {
+-	      len += output_special_case (out_buffer ? out_buffer + len : NULL, val - 0x1000000, t,
+-					  t == G_UNICODE_LOWERCASE_LETTER ? 0 : 1);
++              append_special_case (out_buffer, &len, val - 0x1000000, t,
++                                   t == G_UNICODE_LOWERCASE_LETTER ? 0 : 1);
+ 	    }
+ 	  else
+ 	    {
+@@ -898,7 +924,7 @@ real_toupper (const gchar *str,
+ 	      /* Some lowercase letters, e.g., U+000AA, FEMININE ORDINAL INDICATOR,
+ 	       * do not have an uppercase equivalent, in which case val will be
+ 	       * zero. */
+-	      len += g_unichar_to_utf8 (val ? val : c, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (val ? val : c, out_buffer, &len);
+ 	    }
+ 	}
+       else
+@@ -908,7 +934,7 @@ real_toupper (const gchar *str,
+ 	  if (out_buffer)
+ 	    memcpy (out_buffer + len, last, char_len);
+ 
+-	  len += char_len;
++          increase_size (&len, char_len);
+ 	}
+ 
+     }
+@@ -946,6 +972,8 @@ g_utf8_strup (const gchar *str,
+    * We use a two pass approach to keep memory management simple
+    */
+   result_len = real_toupper (str, len, NULL, locale_type);
++  g_assert (result_len < G_MAXSIZE);
++
+   result = g_malloc (result_len + 1);
+   real_toupper (str, len, result, locale_type);
+   result[result_len] = '\0';
+@@ -1003,14 +1031,15 @@ real_tolower (const gchar *str,
+             {
+               /* I + COMBINING DOT ABOVE => i (U+0069)
+                * LATIN CAPITAL LETTER I WITH DOT ABOVE => i (U+0069) */
+-              len += g_unichar_to_utf8 (0x0069, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (0x0069, out_buffer, &len);
++
+               if (combining_dot)
+                 p = g_utf8_next_char (p);
+             }
+           else
+             {
+               /* I => LATIN SMALL LETTER DOTLESS I */
+-              len += g_unichar_to_utf8 (0x131, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x131, out_buffer, &len);
+             }
+         }
+       /* Introduce an explicit dot above when lowercasing capital I's and J's
+@@ -1018,19 +1047,19 @@ real_tolower (const gchar *str,
+       else if (locale_type == LOCALE_LITHUANIAN && 
+                (c == 0x00cc || c == 0x00cd || c == 0x0128))
+         {
+-          len += g_unichar_to_utf8 (0x0069, out_buffer ? out_buffer + len : NULL); 
+-          len += g_unichar_to_utf8 (0x0307, out_buffer ? out_buffer + len : NULL); 
++          append_utf8_char_to_buffer (0x0069, out_buffer, &len);
++          append_utf8_char_to_buffer (0x0307, out_buffer, &len);
+ 
+           switch (c)
+             {
+             case 0x00cc: 
+-              len += g_unichar_to_utf8 (0x0300, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x0300, out_buffer, &len);
+               break;
+             case 0x00cd: 
+-              len += g_unichar_to_utf8 (0x0301, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x0301, out_buffer, &len);
+               break;
+             case 0x0128: 
+-              len += g_unichar_to_utf8 (0x0303, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x0303, out_buffer, &len);
+               break;
+             }
+         }
+@@ -1039,8 +1068,8 @@ real_tolower (const gchar *str,
+                 c == 'J' || c == G_UNICHAR_FULLWIDTH_J || c == 0x012e) &&
+                has_more_above (p))
+         {
+-          len += g_unichar_to_utf8 (g_unichar_tolower (c), out_buffer ? out_buffer + len : NULL); 
+-          len += g_unichar_to_utf8 (0x0307, out_buffer ? out_buffer + len : NULL); 
++          append_utf8_char_to_buffer (g_unichar_tolower (c), out_buffer, &len);
++          append_utf8_char_to_buffer (0x0307, out_buffer, &len);
+         }
+       else if (c == 0x03A3)	/* GREEK CAPITAL LETTER SIGMA */
+ 	{
+@@ -1063,7 +1092,7 @@ real_tolower (const gchar *str,
+ 	  else
+ 	    val = 0x3c2;	/* GREEK SMALL FINAL SIGMA */
+ 
+-	  len += g_unichar_to_utf8 (val, out_buffer ? out_buffer + len : NULL);
++          append_utf8_char_to_buffer (val, out_buffer, &len);
+ 	}
+       else if (IS (t,
+ 		   OR (G_UNICODE_UPPERCASE_LETTER,
+@@ -1074,7 +1103,7 @@ real_tolower (const gchar *str,
+ 
+ 	  if (val >= 0x1000000)
+ 	    {
+-	      len += output_special_case (out_buffer ? out_buffer + len : NULL, val - 0x1000000, t, 0);
++              append_special_case (out_buffer, &len, val - 0x1000000, t, 0);
+ 	    }
+ 	  else
+ 	    {
+@@ -1093,7 +1122,7 @@ real_tolower (const gchar *str,
+ 
+ 	      /* Not all uppercase letters are guaranteed to have a lowercase
+ 	       * equivalent.  If this is the case, val will be zero. */
+-	      len += g_unichar_to_utf8 (val ? val : c, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (val ? val : c, out_buffer, &len);
+ 	    }
+ 	}
+       else
+@@ -1103,7 +1132,7 @@ real_tolower (const gchar *str,
+ 	  if (out_buffer)
+ 	    memcpy (out_buffer + len, last, char_len);
+ 
+-	  len += char_len;
++          increase_size (&len, char_len);
+ 	}
+ 
+     }
+@@ -1140,6 +1169,8 @@ g_utf8_strdown (const gchar *str,
+    * We use a two pass approach to keep memory management simple
+    */
+   result_len = real_tolower (str, len, NULL, locale_type);
++  g_assert (result_len < G_MAXSIZE);
++
+   result = g_malloc (result_len + 1);
+   real_tolower (str, len, result, locale_type);
+   result[result_len] = '\0';
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch
new file mode 100644
index 00000000000..779d36ccda4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch
@@ -0,0 +1,68 @@
+From b96966058f4291db8970ced70ee22103e63679e5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 17:39:34 +0100
+Subject: [PATCH] glib/tests/unicode: Add test debug information when parsing
+ input files
+
+On case of failures makes it easier to understand on what line of the
+source file we're at, as it might not be clear for non-ascii chars
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/b96966058f4291db8970ced70ee22103e63679e5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/tests/unicode.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/glib/tests/unicode.c b/glib/tests/unicode.c
+index 90b5a98b8..44d1083dd 100644
+--- a/glib/tests/unicode.c
++++ b/glib/tests/unicode.c
+@@ -546,6 +546,7 @@ test_casemap_and_casefold (void)
+   const char *locale;
+   const char *test;
+   const char *expected;
++  size_t line = 0;
+   char *convert;
+   char *current_locale = setlocale (LC_CTYPE, NULL);
+ 
+@@ -555,6 +556,7 @@ test_casemap_and_casefold (void)
+ 
+   while (fgets (buffer, sizeof (buffer), infile))
+     {
++      line++;
+       if (buffer[0] == '#')
+         continue;
+ 
+@@ -588,6 +590,9 @@ test_casemap_and_casefold (void)
+ 
+       convert = g_utf8_strup (test, -1);
+       expected = strings[4][0] ? strings[4] : test;
++      g_test_message ("Converting '%s' => '%s' (line %" G_GSIZE_FORMAT ")",
++                      test, expected, line);
++
+       g_assert_cmpstr (convert, ==, expected);
+       g_free (convert);
+ 
+@@ -607,9 +612,11 @@ test_casemap_and_casefold (void)
+ 
+   infile = fopen (filename, "r");
+   g_assert (infile != NULL);
++  line = 0;
+ 
+   while (fgets (buffer, sizeof (buffer), infile))
+     {
++      line++;
+       if (buffer[0] == '#')
+         continue;
+ 
+@@ -619,6 +626,9 @@ test_casemap_and_casefold (void)
+       test = strings[0];
+ 
+       convert = g_utf8_casefold (test, -1);
++      g_test_message ("Converting '%s' => '%s' (line %" G_GSIZE_FORMAT ")",
++                      test, strings[1], line);
++
+       g_assert_cmpstr (convert, ==, strings[1]);
+       g_free (convert);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 37a5fd34a96..8d349af1d5d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -74,6 +74,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-1484-01.patch \
            file://CVE-2026-1484-02.patch \
            file://CVE-2026-1485.patch \
+           file://CVE-2026-1489-01.patch \
+           file://CVE-2026-1489-02.patch \
+           file://CVE-2026-1489-03.patch \
+           file://CVE-2026-1489-04.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

