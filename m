Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1060AF46437
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46604.1773653410445192091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eFp6vS/a;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so51651565e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653409; x=1774258209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxx/93fBMlBySIZOYqG6L7md5pZNAhzwjkaewOMF9zE=;
        b=eFp6vS/anPg9ATPECu6Xok4fnWXZ/VTBnkFnIeB+WeupgMj9jju1EIHpvT47/znpG5
         hr9mBk3veKU44WQvzPC2Qa7qoiM1DwHHqCL7Sv0ncdTQE/GtoU5X2nIfxRZ7CqD3LjYO
         +JlyawNsqs9A2ADfQsAvqPdt6716Khee7lXwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653409; x=1774258209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxx/93fBMlBySIZOYqG6L7md5pZNAhzwjkaewOMF9zE=;
        b=gQ7lJQEkBc5t3QJn/8tFftYRf8WsYdA56lPG/0BhtyoF5cKjyUGNHTo5qIToIUIp66
         NYIR3PHY4oye8hewZVb4mVKxA4SqtoKNqbRftFnviPLRHLhojYGePbGLRIQhnnDufXis
         coAK05hgM/zdLjes1jv8HG4uk30TfpQdh39+BYBEHXE0kR5FoyA31fxx8+ZBkN9rfibs
         6nUn850PdVtrDuNMuQhrZQPAUBJwimoM8gYwJpnYXbFe3OAqEGEMOynC3U6cNnH/dBw6
         hi5eA+zDkoyO1YNzHFirT4BgSes0OYa9HvRjZTSu3IIUGCE0XcSB2yaiSML8yQbowPGa
         PnKg==
X-Gm-Message-State: AOJu0YzZraA26cUZWzCU97qlVtBuBGTAsCl53WyyC4+7ZRa1HxTx+AU/
	DXM0B1dUVzIqpOSc///manBpMrgBRDke0Emc865ugTpnIB6zEo0TNzxsQmS3fnjHvv3vci2lLVF
	QmK3h
X-Gm-Gg: ATEYQzxLxG0TeH4Wjo89+6nFqVZj9/Kfws61FBtPd7ZKkTQRe2c3FgJWqrYfeibqSdz
	MIWCMT05dgomIzTEE4DnYJARpkiQsSHBElFIhOz1kvee/u0m+yXGvwBq7O0UTqWoDaswTxF0nmL
	WUZPxlMPkpPrrXWbxZ5qvQKpJjHl4zj9WZ5+BqleY1zCF20pMXY9OS99CVwslk6rzOCedBtVKSU
	D7jY9+it0b+psyhww66cPvwqbZRErUyG7VW+kJ5CvzwAiR7h5jZ27IpCt4+5H7/YDQTjHsKnS3z
	3pL5pQyTgiS6FygT7onrd7jNDY8hx7xwqXaFam/QMqajyEC3sZjdPxCvcr+cBl4sappOZ/vm+Fc
	bIDV2EgSGK2jv90zKFQA22SW9IpXfL7bpQA3eEnegv/kBwWRrA2qesbs9Ohr50uEy8U1u6CxSlX
	Mcv+m957SQKRmaGj4DjJ/912emIoBAYijoMeTbHou6xgiKx7MRPTlwfyjPEqj02GOxrLf8jYH19
	gtadQxK5xYrd2kpDO8z3t6/1hjRMagGIw==
X-Received: by 2002:a05:600c:354b:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-48556703401mr204012305e9.18.1773653408389;
        Mon, 16 Mar 2026 02:30:08 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/17] gtk+3: fix incompatible-pointer-types errors for native build on Fedora 41
Date: Mon, 16 Mar 2026 10:28:29 +0100
Message-ID: <0a82d5d0c0563905bad20d5479794ae84ef13cc8.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233232

From: Yoann Congal <yoann.congal@smile.fr>

Backport 2 patchs to fix incompatible-pointer-types error when building
gtk+3-native on Fedora 41 host:
  tests/testinput.c:197:79: error: passing argument 1 of ‘gdk_event_get_source_device’ from incompatible pointer type [-Wincompatible-pointer-types]
  gtk/gtklabel.c:4235:32: error: passing argument 1 of ‘gtk_widget_queue_resize’ from incompatible pointer type [-Wincompatible-pointer-types]

On autobuilder: fedora41-vk-1:~$ gcc --version
gcc (GCC) 14.3.1 20251022 (Red Hat 14.3.1-4)

GCC 14 notoriously restricted how pointer types are converted:
https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types

Suggested-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-type-when-calling-GtkWidget-methods.patch | 28 +++++++++++
 ...ests-Add-GdkEvent-casts-in-testinput.patch | 48 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb      |  2 +
 3 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Use-the-right-type-when-calling-GtkWidget-methods.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0002-tests-Add-GdkEvent-casts-in-testinput.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Use-the-right-type-when-calling-GtkWidget-methods.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-Use-the-right-type-when-calling-GtkWidget-methods.patch
new file mode 100644
index 00000000000..76de5630655
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Use-the-right-type-when-calling-GtkWidget-methods.patch
@@ -0,0 +1,28 @@
+From a3e82f20a1a1e7d8ffbc960a8bb4aa65b0d151ee Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 6 Dec 2022 21:49:22 +0000
+Subject: [PATCH] Use the right type when calling GtkWidget methods
+
+From: Emmanuele Bassi <ebassi@gnome.org>
+
+Let's avoid complaints from the compiler.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/commit/a3e82f20a1a1e7d8ffbc960a8bb4aa65b0d151ee]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ gtk/gtklabel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gtk/gtklabel.c b/gtk/gtklabel.c
+index 7933ab2af73..40a569004b6 100644
+--- a/gtk/gtklabel.c
++++ b/gtk/gtklabel.c
+@@ -4232,7 +4232,7 @@ gtk_label_style_updated (GtkWidget *widget)
+   if (change == NULL || gtk_css_style_change_affects (change, GTK_CSS_AFFECTS_FONT))
+     {
+       gtk_label_clear_layout (GTK_LABEL (widget));
+-      gtk_widget_queue_resize (label);
++      gtk_widget_queue_resize (widget);
+     }
+ 
+   if (change == NULL || gtk_css_style_change_affects (change, GTK_CSS_AFFECTS_TEXT_ATTRS) ||
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0002-tests-Add-GdkEvent-casts-in-testinput.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-tests-Add-GdkEvent-casts-in-testinput.patch
new file mode 100644
index 00000000000..c6ec597384e
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/0002-tests-Add-GdkEvent-casts-in-testinput.patch
@@ -0,0 +1,48 @@
+From 76bc2a57136fd6cf0374fa3f86a7ba646b779803 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Fri, 19 Jan 2024 10:41:33 +0000
+Subject: [PATCH] tests: Add GdkEvent casts in testinput
+
+From: David King <amigadave@amigadave.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/commit/76bc2a57136fd6cf0374fa3f86a7ba646b779803]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ tests/testinput.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/testinput.c b/tests/testinput.c
+index b68552a4280..3d4d7f6f875 100644
+--- a/tests/testinput.c
++++ b/tests/testinput.c
+@@ -194,7 +194,7 @@ button_press_event (GtkWidget *widget, GdkEventButton *event)
+ 
+       print_axes (event->device, event->axes);
+       gdk_event_get_axis ((GdkEvent *)event, GDK_AXIS_PRESSURE, &pressure);
+-      draw_brush (widget, gdk_device_get_source (gdk_event_get_source_device (event)),
++      draw_brush (widget, gdk_device_get_source (gdk_event_get_source_device ((GdkEvent *)event)),
+                   event->x, event->y, pressure);
+ 
+       motion_time = event->time;
+@@ -239,10 +239,10 @@ motion_notify_event (GtkWidget *widget, GdkEventMotion *event)
+ 	      gdk_device_get_axis (event->device, events[i]->axes, GDK_AXIS_X, &x);
+ 	      gdk_device_get_axis (event->device, events[i]->axes, GDK_AXIS_Y, &y);
+ 	      gdk_device_get_axis (event->device, events[i]->axes, GDK_AXIS_PRESSURE, &pressure);
+-	      draw_brush (widget, gdk_device_get_source (gdk_event_get_source_device (event)),
++	      draw_brush (widget, gdk_device_get_source (gdk_event_get_source_device ((GdkEvent *)event)),
+                           x, y, pressure);
+ 
+-	      print_axes (gdk_event_get_source_device (event), events[i]->axes);
++	      print_axes (gdk_event_get_source_device ((GdkEvent *)event), events[i]->axes);
+ 	    }
+ 	  gdk_device_free_history (events, n_events);
+ 	}
+@@ -252,7 +252,7 @@ motion_notify_event (GtkWidget *widget, GdkEventMotion *event)
+ 
+ 	  gdk_event_get_axis ((GdkEvent *)event, GDK_AXIS_PRESSURE, &pressure);
+ 
+-	  draw_brush (widget, gdk_device_get_source (gdk_event_get_source_device (event)),
++	  draw_brush (widget, gdk_device_get_source (gdk_event_get_source_device ((GdkEvent *)event)),
+                       event->x, event->y, pressure);
+ 	}
+       motion_time = event->time;
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
index e6c8e43923a..01677e33f8a 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
@@ -7,6 +7,8 @@ SRC_URI = "${GNOME_MIRROR}/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            file://CVE-2024-6655.patch \
+           file://0001-Use-the-right-type-when-calling-GtkWidget-methods.patch \
+           file://0002-tests-Add-GdkEvent-casts-in-testinput.patch \
            "
 SRC_URI[sha256sum] = "dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec"
 

