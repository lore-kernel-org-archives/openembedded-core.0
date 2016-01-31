Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B915C7723E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:36 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id cy9so69606041pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/ugpeuTtUNvj+p7R4N2JrGCCwFe1xvxLQNCnlO9PSS0=;
	b=jLvO/CLj5KIX8iFkTZZhuzzWJxhe+Qnz909jPvsy4k2UySKJiCC8qWbqikTBueWIyB
	aFmbZ63PIbgGy89XmhuhUw36onq+22WxbOM487vrg5u5qDV/LagyFuz/vFyP87QDYDdC
	UmBfM5H+fnwZeAUY0KcK8DytclRUfR3XPGvk7GDj0VwfNP5A5oys7tgs3y0ColByQ22K
	Z3DmteiNscIxg2TgnD0EPXuTgIo6E43YXS/JM9HNa7hAGtaBmR71HI9SiF+eqD2L+LKW
	llXe3+ZNqJbDC4PUS+8T8+zBw5w1CJE8Q5tKAW6x+0SYDXHhRDDAcu1Lexn3tUcNbhpR
	9SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=/ugpeuTtUNvj+p7R4N2JrGCCwFe1xvxLQNCnlO9PSS0=;
	b=LCjU48V1bSul6JAxL5kuTgb0pOm0h6C+IVySJcgzUZs8Wh5yJFyA8IfW8Yivkh8R7Y
	vsofsEIk06w68Bq4JHCjc80JsYt4xIBEGgD6PGbjo1FOlvsnukKYTtqEu2dkGJF5UPK4
	QI6UwRFGjC6UZGIm451uyC0fF0WHFWKHglxCjePjev9/t7pmJBaCUdSVorqv8xjtrfy3
	yJQx31mnOLlzBXQY62/B+qskVgLhH4hMcK4XzBkBo67RCR79E0QV/klpxsmJ9JFjKUyO
	lPkH2jtyV8hQL3PmH3p60ZjafsCUQFWvRqlNUMJuPyyLOMghqSqKp8oxJNsIFAv9DAg+
	YVDg==
X-Gm-Message-State: AG10YOSbmmOCbPOsfmHQOrXARnsFYUW6zzc/+zZbUc9Yi2bCuV1cZ0fk1uVKFXUJ1F8QnQ==
X-Received: by 10.66.142.73 with SMTP id ru9mr32295317pab.121.1454270017013;
	Sun, 31 Jan 2016 11:53:37 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:13 -0800
Message-Id: <ea4f7918c95ae1bd6751fce70c36ee7ae207f6ae.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
Subject: [jethro-next 7/8] gdk-pixbuf: Security fix CVE-2015-7674
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:36 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7674 Heap overflow with a gif file in gdk-pixbuf < 2.32.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      | 39 ++++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
new file mode 100644
index 0000000..d516e88
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
@@ -0,0 +1,39 @@
+From e9a5704edaa9aee9498f1fbf6e1b70fcce2e55aa Mon Sep 17 00:00:00 2001
+From: Benjamin Otte <otte@redhat.com>
+Date: Tue, 22 Sep 2015 22:44:51 +0200
+Subject: [PATCH] pixops: Don't overflow variables when shifting them
+
+If we shift by 16 bits we need to be sure those 16 bits actually exist.
+They do now.
+
+Upstream-status: Backport
+https://git.gnome.org/browse/gdk-pixbuf/commit/?id=e9a5704edaa9aee9498f1fbf6e1b70fcce2e55aa
+
+CVE:  CVE-2015-7674
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gdk-pixbuf/pixops/pixops.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+Index: gdk-pixbuf-2.30.8/gdk-pixbuf/pixops/pixops.c
+===================================================================
+--- gdk-pixbuf-2.30.8.orig/gdk-pixbuf/pixops/pixops.c
++++ gdk-pixbuf-2.30.8/gdk-pixbuf/pixops/pixops.c
+@@ -264,11 +264,11 @@ pixops_scale_nearest (guchar        *des
+ 		      double         scale_x,
+ 		      double         scale_y)
+ {
+-  int i;
+-  int x;
+-  int x_step = (1 << SCALE_SHIFT) / scale_x;
+-  int y_step = (1 << SCALE_SHIFT) / scale_y;
+-  int xmax, xstart, xstop, x_pos, y_pos;
++  gint64 i;
++  gint64 x;
++  gint64 x_step = (1 << SCALE_SHIFT) / scale_x;
++  gint64 y_step = (1 << SCALE_SHIFT) / scale_y;
++  gint64 xmax, xstart, xstop, x_pos, y_pos;
+   const guchar *p;
+ 
+ #define INNER_LOOP(SRC_CHANNELS,DEST_CHANNELS,ASSIGN_PIXEL)     \
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index 68f3850..dcd01b1 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-pixops-Be-more-careful-about-integer-overflow.patch \
+           file://CVE-2015-7674.patch \
            "
 
 SRC_URI[md5sum] = "4fed0d54432f1b69fc6e66e608bd5542"
-- 
2.3.5


