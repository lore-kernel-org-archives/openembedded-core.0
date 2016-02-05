Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0C19C7739F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:53:37 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 66so5341948pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=cRBg1sud9pOkFNiSDwCOwZy3orsc/jkHR1ldvVyCZ9c=;
	b=0fhBCaYG9awpN0FEx1Zc2hizAjO/OqTF6WQv/BqSV5/gs38wo6QA+/0zHWXEtW8gvj
	5r7/L7NlRY+740IaAhVE+5f74boZEwKjb8+qaFITt2bcXbHsmec2fg2SakYcXNQcvUUo
	zsiJGWPbv2nD1Ve+71HHfFp8II/AZ5dfQBLcRFomHPNXWOAqOvnycA7Wo36Ovyeoj28h
	uIZvBBHomgekOpPKG+uUDv6oNIA51E2JI6XVJEhS1GMW/63Zmi86sMWOBHtiHAoLgTbU
	XhXSKJQ7xpUUg9su3k4J9uYFw0y8rzqfhGWdKlEX0Ze5SoXzccQvtGfJ0/mOZN+YtJsd
	4Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=cRBg1sud9pOkFNiSDwCOwZy3orsc/jkHR1ldvVyCZ9c=;
	b=Ech7GgCHt5snpKok6pZhU3i7TFUFKA2Xkhpb0hM5I5FregqFycvddWBABQ5ys8/zNz
	1XlpsdZG9c3sGSHqQ8D16/QBsBs8C9A8/9hU3lMuvqFu9GG56Axxf04IH1rfUVEM1558
	Ix3QcPl0aNIUZ4YVYeyacXwpsTctT5lMXY/H2+1EN8hb2XHzQj9IdKsYxSd1nU0iQU7r
	TI36ALDqoYqL1xqFIkrTgENPEHmw071yUSPXauWpZitMe+wsZLHZ1nQZGSd1976sEFq5
	AmtCPaR/IFl1nQT28DcjleRuvRkcxEe0FwEqfRaVLD+Vq8WjvAqDoxZI6tjGqcBk8xqO
	sUeg==
X-Gm-Message-State: AG10YORBuMdbyUZQEhyUeveixFkYQZzWJM/LX+1mbI5K0tVGVk644TwqMDjno34Cx0mjMw==
X-Received: by 10.98.14.68 with SMTP id w65mr20650053pfi.146.1454684019042;
	Fri, 05 Feb 2016 06:53:39 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o184sm25144290pfo.36.2016.02.05.06.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 06:53:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 06:53:22 -0800
Message-Id: <1005dd78a6a2b6d4b8098ec3cdc3eef1d29e655b.1454683625.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454683625.git.akuster@mvista.com>
References: <cover.1454683625.git.akuster@mvista.com>
In-Reply-To: <cover.1454683625.git.akuster@mvista.com>
References: <cover.1454683625.git.akuster@mvista.com>
Subject: [PATCH 3/4] libpng: Security fix CVE-2015-8472
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
X-List-Received-Date: Fri, 05 Feb 2016 14:53:38 -0000

From: Armin Kuster <akuster@mvista.com>

libpng: Buffer overflow vulnerabilities in png_get_PLTE/png_set_PLTE functions

this patch fixes an incomplete patch in CVE-2015-8126

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libpng/libpng-1.6.17/CVE-2015-8472.patch       | 29 ++++++++++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.17.bb    |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8472.patch

diff --git a/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8472.patch b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8472.patch
new file mode 100644
index 0000000..404f012
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng-1.6.17/CVE-2015-8472.patch
@@ -0,0 +1,29 @@
+From 9f2ad4928e47036cf1ac9b8fe45a491f15be2324 Mon Sep 17 00:00:00 2001
+From: Glenn Randers-Pehrson <glennrp at users.sourceforge.net>
+Date: Wed, 4 Nov 2015 23:47:42 -0600
+Subject: [PATCH] [libpng16] Fixed new bug with CRC error after reading an
+ over-length palette.
+
+Upstream-Status: Backport
+CVE: CVE-2015-8472 
+
+https://github.com/glennrp/libpng/commit/9f2ad4928e47036cf1ac9b8fe45a491f15be2324
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ pngrutil.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libpng-1.6.17/pngrutil.c
+===================================================================
+--- libpng-1.6.17.orig/pngrutil.c
++++ libpng-1.6.17/pngrutil.c
+@@ -973,7 +973,7 @@ png_handle_PLTE(png_structrp png_ptr, pn
+    if (png_ptr->color_type == PNG_COLOR_TYPE_PALETTE)
+ #endif
+    {
+-      png_crc_finish(png_ptr, 0);
++      png_crc_finish(png_ptr, (int) length - num * 3);
+    }
+ 
+ #ifndef PNG_READ_OPT_PLTE_SUPPORTED
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
index 110c43d..cc288c7 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
@@ -15,6 +15,7 @@ SRC_URI += "\
             file://CVE-2015-8126_2.patch \
             file://CVE-2015-8126_3.patch \
             file://CVE-2015-8126_4.patch \
+            file://CVE-2015-8472.patch \
             "
 
 SRC_URI[md5sum] = "430a9b76b78533235cd4b9b26ce75c7e"
-- 
2.3.5


