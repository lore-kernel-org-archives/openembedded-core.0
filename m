Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9C077303
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:53:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c10so4937813pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=l8RhBjbDd0yoUT5TSMUowKe7gtEQu4PWKU1u7lmW1pQ=;
	b=hSTERh/au+SdCS3NkffwjumVjZCZMg/XkCcYPssUmC4J29VriGqfD6YCXZqy4pD2zG
	4/cHEOJJxx6InKMRpvH0FyvYmdQt95xHq/i8vGEBOrVmFMUdYbfwP3txJkHAKV5n3SUQ
	mwvZHfVqfS7FjcEjrLL0T57zf4C5Uhetzn3x76mGBFZKhHpq3wnpRpabrJFBKeiUcAzH
	BnwJtAxbBekPdOTD15OZy2EJrFIAwfim316fJGJfXQZq2RamtAfTQhG1dl5b3xmv50R0
	yekbuuk/sU6oFdruXJ67i4liZ7E5chIZgra40RnXWvMG4BEBtDeBckzUVEMdzR7dES/h
	VxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=l8RhBjbDd0yoUT5TSMUowKe7gtEQu4PWKU1u7lmW1pQ=;
	b=NbnF7zH8gA3NwvkKHJ9I3vp077/KS/Xt7u/IJkD3ZEkbhvf2hmmXrL3AzbJYcoGIWZ
	JWSDwYJW03LNLC+YtfsivM1KCVbgu58UlSYMV5aUATzJ30PC6GdWNmZOHV+SdQy5d+LR
	M1CXejSlA0iq1ZyyZrahy80pPhXmPszjpDgLyThL2PqBya68uMMLrpieNC1Y2Pj0Ocfu
	dmKTEe25wPACTv/KlKfxP0kROOoj3D98eCVSJvl/y7ILo2RMyKD35MevrSXHNYKRCDyW
	f30VCMPPegP+clhurI2c1H2DTlGXk/RZyeH/PSTfZxcBINKZXOMp5Eci6gsz/pyGgYh6
	+CTg==
X-Gm-Message-State: AG10YOTiW+XKjkkFJtUCSWdOtaTiAJba3mmr9CJ0UFjG37boKJRuQeTw4SXDpMehZAQi6w==
X-Received: by 10.98.74.93 with SMTP id x90mr1123193pfa.80.1454684017094;
	Fri, 05 Feb 2016 06:53:37 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o184sm25144290pfo.36.2016.02.05.06.53.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 06:53:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 06:53:21 -0800
Message-Id: <367827c80f68f3b6c256bb128786f6c4a0e0e7b0.1454683625.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454683625.git.akuster@mvista.com>
References: <cover.1454683625.git.akuster@mvista.com>
In-Reply-To: <cover.1454683625.git.akuster@mvista.com>
References: <cover.1454683625.git.akuster@mvista.com>
Subject: [PATCH 2/4] libpng: Security fix CVE-2015-8126
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
X-List-Received-Date: Fri, 05 Feb 2016 14:53:36 -0000

From: Armin Kuster <akuster@mvista.com>

libpng: Buffer overflow vulnerabilities in png_get_PLTE/png_set_PLTE functions

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libpng/libpng-1.6.17/CVE-2015-8126_1.patch     |  91 ++++++++++++++
 .../libpng/libpng-1.6.17/CVE-2015-8126_2.patch     | 134 +++++++++++++++++++++
 .../libpng/libpng-1.6.17/CVE-2015-8126_3.patch     |  79 ++++++++++++
 .../libpng/libpng-1.6.17/CVE-2015-8126_4.patch     |  48 ++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.17.bb    |   7 ++
 5 files changed, 359 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_1.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_2.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_3.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_4.patch

diff --git a/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_1.patch b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_1.patch
new file mode 100644
index 0000000..25fe136
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_1.patch
@@ -0,0 +1,91 @@
+From 81f44665cce4cb1373f049a76f3904e981b7a766 Mon Sep 17 00:00:00 2001
+From: Glenn Randers-Pehrson <glennrp at users.sourceforge.net>
+Date: Thu, 29 Oct 2015 09:26:41 -0500
+Subject: [PATCH] [libpng16] Reject attempt to write over-length PLTE chunk
+
+Upstream-Status: Backport
+https://github.com/glennrp/libpng/commit/81f44665cce4cb1373f049a76f3904e981b7a766
+
+CVE: CVE-2015-8126 patch #1
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libpng-manual.txt | 5 +++++
+ libpng.3          | 5 +++++
+ pngwrite.c        | 4 ++--
+ pngwutil.c        | 7 +++++--
+ 4 files changed, 17 insertions(+), 4 deletions(-)
+
+Index: libpng-1.6.17/libpng-manual.txt
+===================================================================
+--- libpng-1.6.17.orig/libpng-manual.txt
++++ libpng-1.6.17/libpng-manual.txt
+@@ -5109,6 +5109,11 @@ length, which resulted in PNG files that
+ chunk.  This error was fixed in libpng-1.6.3, and a tool (called
+ contrib/tools/png-fix-itxt) has been added to the libpng distribution.
+ 
++Starting with libpng-1.6.19, attempting to write an over-length PLTE chunk
++is an error. Previously this requirement of the PNG specification was not
++enforced. Libpng continues to accept over-length PLTE chunks when reading,
++but does not make any use of the extra entries.
++
+ XIII.  Detecting libpng
+ 
+ The png_get_io_ptr() function has been present since libpng-0.88, has never
+Index: libpng-1.6.17/libpng.3
+===================================================================
+--- libpng-1.6.17.orig/libpng.3
++++ libpng-1.6.17/libpng.3
+@@ -5613,6 +5613,11 @@ length, which resulted in PNG files that
+ chunk.  This error was fixed in libpng-1.6.3, and a tool (called
+ contrib/tools/png-fix-itxt) has been added to the libpng distribution.
+ 
++Starting with libpng-1.6.19, attempting to write an over-length PLTE chunk
++is an error. Previously this requirement of the PNG specification was not
++enforced. Libpng continues to accept over-length PLTE chunks when reading,
++but does not make any use of the extra entries.
++
+ .SH XIII.  Detecting libpng
+ 
+ The png_get_io_ptr() function has been present since libpng-0.88, has never
+Index: libpng-1.6.17/pngwrite.c
+===================================================================
+--- libpng-1.6.17.orig/pngwrite.c
++++ libpng-1.6.17/pngwrite.c
+@@ -205,7 +205,7 @@ png_write_info(png_structrp png_ptr, png
+       png_write_PLTE(png_ptr, info_ptr->palette,
+           (png_uint_32)info_ptr->num_palette);
+ 
+-   else if ((info_ptr->color_type == PNG_COLOR_TYPE_PALETTE) !=0)
++   else if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE)
+       png_error(png_ptr, "Valid palette required for paletted images");
+ 
+ #ifdef PNG_WRITE_tRNS_SUPPORTED
+Index: libpng-1.6.17/pngwutil.c
+===================================================================
+--- libpng-1.6.17.orig/pngwutil.c
++++ libpng-1.6.17/pngwutil.c
+@@ -922,17 +922,20 @@ void /* PRIVATE */
+ png_write_PLTE(png_structrp png_ptr, png_const_colorp palette,
+     png_uint_32 num_pal)
+ {
+-   png_uint_32 i;
++   png_uint_32 max_num_pal, i;
+    png_const_colorp pal_ptr;
+    png_byte buf[3];
+ 
+    png_debug(1, "in png_write_PLTE");
+ 
++   max_num_pal = (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE) ?
++      (1 << png_ptr->bit_depth) : PNG_MAX_PALETTE_LENGTH;
++
+    if ((
+ #ifdef PNG_MNG_FEATURES_SUPPORTED
+        (png_ptr->mng_features_permitted & PNG_FLAG_MNG_EMPTY_PLTE) == 0 &&
+ #endif
+-       num_pal == 0) || num_pal > 256)
++       num_pal == 0) || num_pal > max_num_pal)
+    {
+       if (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE)
+       {
diff --git a/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_2.patch b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_2.patch
new file mode 100644
index 0000000..4aa9170
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_2.patch
@@ -0,0 +1,134 @@
+From a901eb3ce6087e0afeef988247f1a1aa208cb54d Mon Sep 17 00:00:00 2001
+From: Glenn Randers-Pehrson <glennrp at users.sourceforge.net>
+Date: Fri, 30 Oct 2015 07:57:49 -0500
+Subject: [PATCH] [libpng16] Prevent reading over-length PLTE chunk (Cosmin
+ Truta).
+
+Upstream-Status: Backport
+https://github.com/glennrp/libpng/commit/a901eb3ce6087e0afeef988247f1a1aa208cb54d
+
+Many changes involved date and version updates with don't apply in this case.
+
+CVE: CVE-2015-8126 patch #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ANNOUNCE          |  6 +++---
+ CHANGES           |  4 ++--
+ libpng-manual.txt | 11 +++++------
+ libpng.3          | 19 +++++++++----------
+ pngrutil.c        |  3 +++
+ pngset.c          | 13 +++++++++----
+ pngwutil.c        |  6 +++---
+ 7 files changed, 34 insertions(+), 28 deletions(-)
+
+Index: libpng-1.6.17/libpng-manual.txt
+===================================================================
+--- libpng-1.6.17.orig/libpng-manual.txt
++++ libpng-1.6.17/libpng-manual.txt
+@@ -5109,10 +5109,9 @@ length, which resulted in PNG files that
+ chunk.  This error was fixed in libpng-1.6.3, and a tool (called
+ contrib/tools/png-fix-itxt) has been added to the libpng distribution.
+ 
+-Starting with libpng-1.6.19, attempting to write an over-length PLTE chunk
++Starting with libpng-1.6.19, attempting to set an over-length PLTE chunk
+ is an error. Previously this requirement of the PNG specification was not
+-enforced. Libpng continues to accept over-length PLTE chunks when reading,
+-but does not make any use of the extra entries.
++enforced, and the palette was always limited to 256 entries.
+ 
+ XIII.  Detecting libpng
+ 
+Index: libpng-1.6.17/libpng.3
+===================================================================
+--- libpng-1.6.17.orig/libpng.3
++++ libpng-1.6.17/libpng.3
+@@ -5613,10 +5613,9 @@ length, which resulted in PNG files that
+ chunk.  This error was fixed in libpng-1.6.3, and a tool (called
+ contrib/tools/png-fix-itxt) has been added to the libpng distribution.
+ 
+-Starting with libpng-1.6.19, attempting to write an over-length PLTE chunk
++Starting with libpng-1.6.19, attempting to set an over-length PLTE chunk
+ is an error. Previously this requirement of the PNG specification was not
+-enforced. Libpng continues to accept over-length PLTE chunks when reading,
+-but does not make any use of the extra entries.
++enforced, and the palette was always limited to 256 entries.
+ 
+ .SH XIII.  Detecting libpng
+ 
+Index: libpng-1.6.17/pngrutil.c
+===================================================================
+--- libpng-1.6.17.orig/pngrutil.c
++++ libpng-1.6.17/pngrutil.c
+@@ -997,6 +997,9 @@ png_handle_PLTE(png_structrp png_ptr, pn
+     * confusing.
+     *
+     * Fix this by not sharing the palette in this way.
++    *
++    * Starting with libpng-1.6.19, png_set_PLTE() also issues a png_error() when
++    * it attempts to set a palette length that is too large for the bit depth.
+     */
+    png_set_PLTE(png_ptr, info_ptr, palette, num);
+ 
+Index: libpng-1.6.17/pngset.c
+===================================================================
+--- libpng-1.6.17.orig/pngset.c
++++ libpng-1.6.17/pngset.c
+@@ -513,12 +513,17 @@ png_set_PLTE(png_structrp png_ptr, png_i
+     png_const_colorp palette, int num_palette)
+ {
+ 
++   png_uint_32 max_palette_length;
++
+    png_debug1(1, "in %s storage function", "PLTE");
+ 
+    if (png_ptr == NULL || info_ptr == NULL)
+       return;
+ 
+-   if (num_palette < 0 || num_palette > PNG_MAX_PALETTE_LENGTH)
++   max_palette_length = (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE) ?
++      (1 << png_ptr->bit_depth) : PNG_MAX_PALETTE_LENGTH;
++
++   if (num_palette < 0 || num_palette > max_palette_length)
+    {
+       if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE)
+          png_error(png_ptr, "Invalid palette length");
+@@ -551,8 +556,8 @@ png_set_PLTE(png_structrp png_ptr, png_i
+    png_free_data(png_ptr, info_ptr, PNG_FREE_PLTE, 0);
+ 
+    /* Changed in libpng-1.2.1 to allocate PNG_MAX_PALETTE_LENGTH instead
+-    * of num_palette entries, in case of an invalid PNG file that has
+-    * too-large sample values.
++    * of num_palette entries, in case of an invalid PNG file or incorrect
++    * call to png_set_PLTE() with too-large sample values.
+     */
+    png_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
+        PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
+Index: libpng-1.6.17/pngwutil.c
+===================================================================
+--- libpng-1.6.17.orig/pngwutil.c
++++ libpng-1.6.17/pngwutil.c
+@@ -922,20 +922,20 @@ void /* PRIVATE */
+ png_write_PLTE(png_structrp png_ptr, png_const_colorp palette,
+     png_uint_32 num_pal)
+ {
+-   png_uint_32 max_num_pal, i;
++   png_uint_32 max_palette_length, i;
+    png_const_colorp pal_ptr;
+    png_byte buf[3];
+ 
+    png_debug(1, "in png_write_PLTE");
+ 
+-   max_num_pal = (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE) ?
++   max_palette_length = (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE) ?
+       (1 << png_ptr->bit_depth) : PNG_MAX_PALETTE_LENGTH;
+ 
+    if ((
+ #ifdef PNG_MNG_FEATURES_SUPPORTED
+        (png_ptr->mng_features_permitted & PNG_FLAG_MNG_EMPTY_PLTE) == 0 &&
+ #endif
+-       num_pal == 0) || num_pal > max_num_pal)
++       num_pal == 0) || num_pal > max_palette_length)
+    {
+       if (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE)
+       {
diff --git a/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_3.patch b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_3.patch
new file mode 100644
index 0000000..0e0ad23
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_3.patch
@@ -0,0 +1,79 @@
+From 1bef8e97995c33123665582e57d3ed40b57d5978 Mon Sep 17 00:00:00 2001
+From: Glenn Randers-Pehrson <glennrp at users.sourceforge.net>
+Date: Fri, 30 Oct 2015 11:34:37 -0500
+Subject: [PATCH] [libpng16] Silently truncate over-length PLTE chunk while
+ reading.
+
+Upstream-Status: Backport
+https://github.com/glennrp/libpng/commit/1bef8e97995c33123665582e57d3ed40b57d5978
+
+Normal Issues is date and version conflicts not applied.
+
+CVE: CVE-2015-8i26 patch #3
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+
+---
+ ANNOUNCE   |  3 ++-
+ CHANGES    |  3 ++-
+ pngrutil.c | 15 +++++++++++----
+ pngset.c   |  2 +-
+ 4 files changed, 16 insertions(+), 7 deletions(-)
+
+Index: libpng-1.6.17/pngrutil.c
+===================================================================
+--- libpng-1.6.17.orig/pngrutil.c
++++ libpng-1.6.17/pngrutil.c
+@@ -867,7 +867,7 @@ void /* PRIVATE */
+ png_handle_PLTE(png_structrp png_ptr, png_inforp info_ptr, png_uint_32 length)
+ {
+    png_color palette[PNG_MAX_PALETTE_LENGTH];
+-   int num, i;
++   int max_palette_length, num, i;
+ #ifdef PNG_POINTER_INDEXING_SUPPORTED
+    png_colorp pal_ptr;
+ #endif
+@@ -925,9 +925,19 @@ png_handle_PLTE(png_structrp png_ptr, pn
+       return;
+    }
+ 
++   max_palette_length = (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE) ?
++      (1 << png_ptr->bit_depth) : PNG_MAX_PALETTE_LENGTH;
++
+    /* The cast is safe because 'length' is less than 3*PNG_MAX_PALETTE_LENGTH */
+    num = (int)length / 3;
+ 
++   /* If the palette has 256 or fewer entries but is too large for the bit depth,
++    * we don't issue an error, to preserve the behavior of previous libpng versions.
++    * We silently truncate the unused extra palette entries here.
++    */
++   if (num > max_palette_length)
++     num = max_palette_length;
++
+ #ifdef PNG_POINTER_INDEXING_SUPPORTED
+    for (i = 0, pal_ptr = palette; i < num; i++, pal_ptr++)
+    {
+@@ -997,9 +1007,6 @@ png_handle_PLTE(png_structrp png_ptr, pn
+     * confusing.
+     *
+     * Fix this by not sharing the palette in this way.
+-    *
+-    * Starting with libpng-1.6.19, png_set_PLTE() also issues a png_error() when
+-    * it attempts to set a palette length that is too large for the bit depth.
+     */
+    png_set_PLTE(png_ptr, info_ptr, palette, num);
+ 
+Index: libpng-1.6.17/pngset.c
+===================================================================
+--- libpng-1.6.17.orig/pngset.c
++++ libpng-1.6.17/pngset.c
+@@ -523,7 +523,7 @@ png_set_PLTE(png_structrp png_ptr, png_i
+    max_palette_length = (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE) ?
+       (1 << png_ptr->bit_depth) : PNG_MAX_PALETTE_LENGTH;
+ 
+-   if (num_palette < 0 || num_palette > max_palette_length)
++   if (num_palette < 0 || num_palette > (int) max_palette_length)
+    {
+       if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE)
+          png_error(png_ptr, "Invalid palette length");
diff --git a/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_4.patch b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_4.patch
new file mode 100644
index 0000000..2622630
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8126_4.patch
@@ -0,0 +1,48 @@
+From 83f4c735c88e7f451541c1528d8043c31ba3b466 Mon Sep 17 00:00:00 2001
+From: Glenn Randers-Pehrson <glennrp at users.sourceforge.net>
+Date: Thu, 5 Nov 2015 11:18:44 -0600
+Subject: [PATCH] [libpng16] Clean up coding style in png_handle_PLTE()
+
+Upstream-Status: Backport
+https://github.com/glennrp/libpng/commit/83f4c735c88e7f451541c1528d8043c31ba3b466
+
+CVE:  CVE-2015-8126 patch #4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ pngrutil.c | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+Index: libpng-1.6.17/pngrutil.c
+===================================================================
+--- libpng-1.6.17.orig/pngrutil.c
++++ libpng-1.6.17/pngrutil.c
+@@ -925,18 +925,21 @@ png_handle_PLTE(png_structrp png_ptr, pn
+       return;
+    }
+ 
+-   max_palette_length = (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE) ?
+-      (1 << png_ptr->bit_depth) : PNG_MAX_PALETTE_LENGTH;
+-
+    /* The cast is safe because 'length' is less than 3*PNG_MAX_PALETTE_LENGTH */
+    num = (int)length / 3;
+ 
+-   /* If the palette has 256 or fewer entries but is too large for the bit depth,
+-    * we don't issue an error, to preserve the behavior of previous libpng versions.
+-    * We silently truncate the unused extra palette entries here.
++   /* If the palette has 256 or fewer entries but is too large for the bit
++    * depth, we don't issue an error, to preserve the behavior of previous
++    * libpng versions. We silently truncate the unused extra palette entries
++    * here.
+     */
++   if (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE)
++      max_palette_length = (1 << png_ptr->bit_depth);
++   else
++      max_palette_length = PNG_MAX_PALETTE_LENGTH;
++
+    if (num > max_palette_length)
+-     num = max_palette_length;
++      num = max_palette_length;
+ 
+ #ifdef PNG_POINTER_INDEXING_SUPPORTED
+    for (i = 0, pal_ptr = palette; i < num; i++, pal_ptr++)
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
index 2d9835c..110c43d 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
@@ -10,6 +10,13 @@ LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}/libpng-${PV}.tar.xz \
           "
+SRC_URI += "\
+            file://CVE-2015-8126_1.patch \
+            file://CVE-2015-8126_2.patch \
+            file://CVE-2015-8126_3.patch \
+            file://CVE-2015-8126_4.patch \
+            "
+
 SRC_URI[md5sum] = "430a9b76b78533235cd4b9b26ce75c7e"
 SRC_URI[sha256sum] = "98507b55fbe5cd43c51981f2924e4671fd81fe35d52dc53357e20f2c77fa5dfd"
 
-- 
2.3.5


