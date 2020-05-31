Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.17652.1590940451235119002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a0X5IuF+;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id a2so6834394ejb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9TganAlt4goJk8xyfk1bkX9tZEa69KkmPL8tjFu4lTw=;
        b=a0X5IuF+0cJnrRDNpQx1iu06wejChTcm21dt/KnWEhQuM6rUCYTcdrtxRJyxAoVwjM
         z9ek1MO1IwsrW9Fd4lGGkWnGgaiyraDlZ0Kc153Rp8GmQzoGFQ6+byZqfj+qf7tBHSNe
         cnfRgqY0atvEdmZ4Fyya8bsZ1A7K8VXQWwqSzjUhyXsfg10FNoCEhFP8T7LteZmP9Q8D
         CAOlfVxRbHJGl7Uzvq3DJLC85DqSgyJ/6HC73syfyvzUKuouOjcj5Raa9RBRCyk0NDPB
         FXJYR3f14ntD28XLJzvryLMGdKJxoZFRBt6WpfnY9PxIovYfgoxe1IcZp86v1ZxL/vQI
         tACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9TganAlt4goJk8xyfk1bkX9tZEa69KkmPL8tjFu4lTw=;
        b=HqJR+02BueyiLIwtRl4bjKlX8yW/FCqVYRL8aWBlbzeZmzjhpUvuv3TRiQt0akJ3vm
         rOHH8mQHKUQZOpAyO2uMrzKinWXvGKJ7YuMQ3RDVlLc/Mw8dUGTZtnvuQgN6Mnp30dzF
         bsgXK4cUI+1fQf3EM8oAuXjjmA6InpXfmQTzf7WBEE116MG2Z0uqJEiEWjTaYbPkttLE
         rTYe/m1u568dSF5fmBeRJkvox+zbMcqgrS55wl2mnxuVZr+RPbB0LTSy69fm7Z+5vZSX
         UKm065E7SC/dfPMSjbF8Ywl1UWtQT/KTSxLGfRL4+7Atl1rIyBj6uOjuqD5XfdktY0AW
         vdXw==
X-Gm-Message-State: AOAM531y8jJr6urALKSyq8IV7/4TAJVGWU2OdkmGU7n/mFqG8YOhfx62
	0TjuS1YKdu35LdJU51IETFFRwiYx
X-Google-Smtp-Source: ABdhPJy8oYRDsDdFpPr7p3n5S2hpnZ8bBEup31fohEDhGuDJk6JY+sYGJTnabE0fD8EXf+VKGimenw==
X-Received: by 2002:a17:906:f745:: with SMTP id jp5mr16692587ejb.440.1590940449209;
        Sun, 31 May 2020 08:54:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 48/70] libexif: update to 0.6.22
Date: Sun, 31 May 2020 17:52:32 +0200
Message-Id: <20200531155254.10283-48-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libexif/libexif/CVE-2016-6328.patch       |  64 ----------
 .../libexif/libexif/CVE-2017-7544.patch       |  40 ------
 .../libexif/libexif/CVE-2018-20030.patch      | 115 ------------------
 .../recipes-support/libexif/libexif_0.6.21.bb |  17 ---
 .../recipes-support/libexif/libexif_0.6.22.bb |  19 +++
 5 files changed, 19 insertions(+), 236 deletions(-)
 delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
 delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
 delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
 delete mode 100644 meta/recipes-support/libexif/libexif_0.6.21.bb
 create mode 100644 meta/recipes-support/libexif/libexif_0.6.22.bb

diff --git a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch b/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
deleted file mode 100644
index a6f307439b..0000000000
--- a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-CVE: CVE-2016-6328
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Tue, 25 Jul 2017 23:44:44 +0200
-Subject: [PATCH] fixes some (not all) buffer overreads during decoding pentax
- makernote entries.
-
-This should fix:
-https://sourceforge.net/p/libexif/bugs/125/ CVE-2016-6328
----
- libexif/pentax/mnote-pentax-entry.c | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-pentax-entry.c
-index d03d159..ea0429a 100644
---- a/libexif/pentax/mnote-pentax-entry.c
-+++ b/libexif/pentax/mnote-pentax-entry.c
-@@ -425,24 +425,34 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
- 		case EXIF_FORMAT_SHORT:
- 		  {
- 			const unsigned char *data = entry->data;
--		  	size_t k, len = strlen(val);
-+		  	size_t k, len = strlen(val), sizeleft;
-+
-+			sizeleft = entry->size;
- 		  	for(k=0; k<entry->components; k++) {
-+				if (sizeleft < 2)
-+					break;
- 				vs = exif_get_short (data, entry->order);
- 				snprintf (val+len, maxlen-len, "%i ", vs);
- 				len = strlen(val);
- 				data += 2;
-+				sizeleft -= 2;
- 			}
- 		  }
- 		  break;
- 		case EXIF_FORMAT_LONG:
- 		  {
- 			const unsigned char *data = entry->data;
--		  	size_t k, len = strlen(val);
-+		  	size_t k, len = strlen(val), sizeleft;
-+
-+			sizeleft = entry->size;
- 		  	for(k=0; k<entry->components; k++) {
-+				if (sizeleft < 4)
-+					break;
- 				vl = exif_get_long (data, entry->order);
- 				snprintf (val+len, maxlen-len, "%li", (long int) vl);
- 				len = strlen(val);
- 				data += 4;
-+				sizeleft -= 4;
- 			}
- 		  }
- 		  break;
-@@ -455,5 +465,5 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
- 		break;
- 	}
- 
--	return (val);
-+	return val;
- }
diff --git a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch b/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
deleted file mode 100644
index e49481ff84..0000000000
--- a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8a92f964a66d476ca8907234359e92a70fc1325b Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 28 Aug 2018 15:12:10 +0800
-Subject: [PATCH] On saving makernotes, make sure the makernote container tags
- has a type with 1 byte components.
-
-Fixes (at least):
-	https://sourceforge.net/p/libexif/bugs/130
-	https://sourceforge.net/p/libexif/bugs/129
-
-Upstream-Status: Backport[https://github.com/libexif/libexif/commit/
-c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd]
-
-CVE: CVE-2017-7544
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libexif/exif-data.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libexif/exif-data.c b/libexif/exif-data.c
-index 67df4db..6bf89eb 100644
---- a/libexif/exif-data.c
-+++ b/libexif/exif-data.c
-@@ -255,6 +255,12 @@ exif_data_save_data_entry (ExifData *data, ExifEntry *e,
- 			exif_mnote_data_set_offset (data->priv->md, *ds - 6);
- 			exif_mnote_data_save (data->priv->md, &e->data, &e->size);
- 			e->components = e->size;
-+                        if (exif_format_get_size (e->format) != 1) {
-+				/* e->format is taken from input code,
-+				 * but we need to make sure it is a 1 byte
-+				 * entity due to the multiplication below. */
-+				e->format = EXIF_FORMAT_UNDEFINED;
-+			}
- 		}
- 	}
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch b/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
deleted file mode 100644
index 76233e6dc9..0000000000
--- a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-CVE: CVE-2018-20030
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17 00:00:00 2001
-From: Dan Fandrich <dan@coneharvesters.com>
-Date: Fri, 12 Oct 2018 16:01:45 +0200
-Subject: [PATCH] Improve deep recursion detection in
- exif_data_load_data_content.
-
-The existing detection was still vulnerable to pathological cases
-causing DoS by wasting CPU. The new algorithm takes the number of tags
-into account to make it harder to abuse by cases using shallow recursion
-but with a very large number of tags.  This improves on commit 5d28011c
-which wasn't sufficient to counter this kind of case.
-
-The limitation in the previous fix was discovered by Laurent Delosieres,
-Secunia Research at Flexera (Secunia Advisory SA84652) and is assigned
-the identifier CVE-2018-20030.
-
-diff --git a/libexif/exif-data.c b/libexif/exif-data.c
-index 67df4db..8d9897e 100644
---- a/libexif/exif-data.c
-+++ b/libexif/exif-data.c
-@@ -35,6 +35,7 @@
- #include <libexif/olympus/exif-mnote-data-olympus.h>
- #include <libexif/pentax/exif-mnote-data-pentax.h>
- 
-+#include <math.h>
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
-@@ -344,6 +345,20 @@ if (data->ifd[(i)]->count) {				\
- 	break;						\
- }
- 
-+/*! Calculate the recursion cost added by one level of IFD loading.
-+ *
-+ * The work performed is related to the cost in the exponential relation
-+ *   work=1.1**cost
-+ */
-+static unsigned int
-+level_cost(unsigned int n)
-+{
-+    static const double log_1_1 = 0.09531017980432493;
-+
-+	/* Adding 0.1 protects against the case where n==1 */
-+	return ceil(log(n + 0.1)/log_1_1);
-+}
-+
- /*! Load data for an IFD.
-  *
-  * \param[in,out] data #ExifData
-@@ -351,13 +366,13 @@ if (data->ifd[(i)]->count) {				\
-  * \param[in] d pointer to buffer containing raw IFD data
-  * \param[in] ds size of raw data in buffer at \c d
-  * \param[in] offset offset into buffer at \c d at which IFD starts
-- * \param[in] recursion_depth number of times this function has been
-- * recursively called without returning
-+ * \param[in] recursion_cost factor indicating how expensive this recursive
-+ * call could be
-  */
- static void
- exif_data_load_data_content (ExifData *data, ExifIfd ifd,
- 			     const unsigned char *d,
--			     unsigned int ds, unsigned int offset, unsigned int recursion_depth)
-+			     unsigned int ds, unsigned int offset, unsigned int recursion_cost)
- {
- 	ExifLong o, thumbnail_offset = 0, thumbnail_length = 0;
- 	ExifShort n;
-@@ -372,9 +387,20 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
- 	if ((((int)ifd) < 0) || ( ((int)ifd) >= EXIF_IFD_COUNT))
- 	  return;
- 
--	if (recursion_depth > 30) {
-+	if (recursion_cost > 170) {
-+		/*
-+		 * recursion_cost is a logarithmic-scale indicator of how expensive this
-+		 * recursive call might end up being. It is an indicator of the depth of
-+		 * recursion as well as the potential for worst-case future recursive
-+		 * calls. Since it's difficult to tell ahead of time how often recursion
-+		 * will occur, this assumes the worst by assuming every tag could end up
-+		 * causing recursion.
-+		 * The value of 170 was chosen to limit typical EXIF structures to a
-+		 * recursive depth of about 6, but pathological ones (those with very
-+		 * many tags) to only 2.
-+		 */
- 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
--			  "Deep recursion detected!");
-+			  "Deep/expensive recursion detected!");
- 		return;
- 	}
- 
-@@ -416,15 +442,18 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
- 			switch (tag) {
- 			case EXIF_TAG_EXIF_IFD_POINTER:
- 				CHECK_REC (EXIF_IFD_EXIF);
--				exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o, recursion_depth + 1);
-+				exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o,
-+					recursion_cost + level_cost(n));
- 				break;
- 			case EXIF_TAG_GPS_INFO_IFD_POINTER:
- 				CHECK_REC (EXIF_IFD_GPS);
--				exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o, recursion_depth + 1);
-+				exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o,
-+					recursion_cost + level_cost(n));
- 				break;
- 			case EXIF_TAG_INTEROPERABILITY_IFD_POINTER:
- 				CHECK_REC (EXIF_IFD_INTEROPERABILITY);
--				exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o, recursion_depth + 1);
-+				exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o,
-+					recursion_cost + level_cost(n));
- 				break;
- 			case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:
- 				thumbnail_offset = o;
diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
deleted file mode 100644
index d847beab18..0000000000
--- a/meta/recipes-support/libexif/libexif_0.6.21.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Library for reading extended image information (EXIF) from JPEG files"
-HOMEPAGE = "http://sourceforge.net/projects/libexif"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
-           file://CVE-2017-7544.patch \
-           file://CVE-2016-6328.patch \
-           file://CVE-2018-20030.patch"
-
-SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
-SRC_URI[sha256sum] = "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
-
-inherit autotools gettext
-
-EXTRA_OECONF += "--disable-docs"
diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb b/meta/recipes-support/libexif/libexif_0.6.22.bb
new file mode 100644
index 0000000000..a520d5c9f9
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Library for reading extended image information (EXIF) from JPEG files"
+HOMEPAGE = "https://libexif.github.io/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+def version_underscore(v):
+    return "_".join(v.split("."))
+
+SRC_URI = "https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore("${PV}")}-release/libexif-${PV}.tar.xz \
+           "
+
+SRC_URI[sha256sum] = "5048f1c8fc509cc636c2f97f4b40c293338b6041a5652082d5ee2cf54b530c56"
+
+UPSTREAM_CHECK_URI = "https://github.com/libexif/libexif/releases/"
+
+inherit autotools gettext
+
+EXTRA_OECONF += "--disable-docs"
-- 
2.26.2

