Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3735.1793405754170704080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=LmovmGEj;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso15320205e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405752; x=1794010552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SoR6UsStZxwrxptAfix40IhdIqpTGd9V1rNo1g4o3hk=;
        b=LmovmGEj49tcXhWF7l3sfsEHXxOP0xDM5dKC5dRVq57hI2shKu4L2A1sMRv5qvEiON
         w1Apl6nIiZIosPSsBZmVdDc3fVXzX3r8zHzuXD/O6OZtlu/U7/ExRJig3vmYGSbBN0Wg
         ocDqxOb2+1R7nVxywxQ2w4UAlzFAdZ/Q2zRCp+0TxayGnbM5jxccpPmQL7MpB5XtNQYS
         dOxQtWZ4RTN+cGhwDe1Vxv1sAUxaiLErWLjxeNo3qqYOKDPFe/Zsf0d5gfvyLzpD2Qqt
         tCx+PWqlkbLvb5JS0fH3rnPnql5NcaUF4gGINO7XuaDtm1Foplu1mBeqCLvx21sPeN/H
         EQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405752; x=1794010552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SoR6UsStZxwrxptAfix40IhdIqpTGd9V1rNo1g4o3hk=;
        b=q9R2I93RwmC0ODqhEPdN7gAcwZB+UqRr/0NK0oPI/HSR9Z0FLMxaWgEhG1jVXbmf8v
         wFmMIRAle6n0yFRK/jBOhd2cvMEVj4yqRDjdeBWfi6OqH6/Xx7ha28KHnurVNTzWJd6w
         Uilys1uw5XeR7Sm4RFvW6BfC17QKNdZVos1qdKlCn8KkdigCL5q2lfgKLjIiV5H0x9j5
         T7+f6WXoJphT3eJDbkJYvGY4ZhGOISYAcXM2nTax875esG0ElkbLHbr/LgjTiUVbkKMM
         Lt/3MjoBKbMBzQOJMeJiG24S2LwQlstIw4D3XzQjrSO4ASdjCAI/vSPiYmUfDm1HxpW1
         u/8A==
X-Gm-Message-State: AFq9FYLK23ZVZ0TQ+vXvDoCy/c7t04f7DNL34zC9Dy85As2fAAU/zxF5
	mzBj//5gKbUSiFpMHu+Oj2BlI92NATWW2fPwpdU2MVAZH+GHO4QmEta76DJh/hYciNqFxTVxW83
	JU7LeEN0=
X-Gm-Gg: AYBFou3rCRVMLPZjs0ekkLj9fOu+67g088zr2MfzDW1wXvgm7TzvO88+JGgGi824eK/
	4jGxC05zqqWx51JERnSIFUt0p7nEMYrALoUyC9ZzVZ53xcf8VWdyNzBMRcNI50A2j7GDF3wo1Mi
	xRK+XiuKRuHx/ogb6MdAhKt51g8vMeIhMgFHCw71jDymZbO6uE+hPmS2uIQktyoZCwAdcxve/uq
	xzm2Ek0kZR2dKbOHv25UjgLgiVXnRuSqYMXxr+d34T4W/xfaHM4hk4p5FQ/rbLkV5GhhNysmI0Z
	EF6Sqn0dSTBCU/GRHPnlJqJPKga0vEJ+tNwg0AMqYDsJPWAEVuWtdtjgIn1xCAcxUVI0yg6KwTR
	bJ1kR41uBIJKdn8IuXQTxLBTOL2kCB3QGa3URFm0cVXr/q8LaBGNNqXynnDB97yU8VtZvUbT1zp
	Nmh++b9Ew35+zAcHAbsAZKsp7prOubA5rxt/62kgK0zzxpd/giFb+xK/jaXS6XV/Fluy2gzNNyQ
	JEUmb8cyx+KgkCs/vtKsKgdA//ycc9gxiyk+GwBpZvu3AFhzyyc8V73e/HKVKLPAT2DEyQFBlCv
	OCZ7DPUMaDokFWLnZyeUc9fjy+7vbU1CGYcAFZIsD8mHnBWpiMLE+ZKegMZ0Q1zDRKclkPP5OL/
	ICsl6vMeQSLxQqvyJrU/zppYcsFHs
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr80336845e9.16.1793405752431;
        Fri, 30 Oct 2026 17:15:52 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/55] libpng: patch CVE-2026-46675
Date: Sat, 31 Oct 2026 01:14:37 +0100
Message-ID: <fc564217d93f388e452a64c1d0df07528bc1f889.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249091
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-46675

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/files/CVE-2026-46675.patch         | 115 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-46675.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-46675.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-46675.patch
new file mode 100644
index 00000000000..3af0251c553
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-46675.patch
@@ -0,0 +1,115 @@
+From aa77ef38c17ab2fc1b41bec09fb973c6a386641d Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Wed, 23 Sep 2026 18:30:11 +0300
+Subject: [PATCH] fix: Clear stale zstream pointers when releasing the inflate
+ stream
+
+The zstream buffer pointers and counters are all cleared on acquisition
+in `png_inflate_claim`, but only `next_in` and `avail_in` were cleared
+on release in `png_read_finish_IDAT`, and none were cleared on release
+in the chunk decompression paths.
+
+If `png_read_end` is called before row reading starts, the IDAT stream
+is never claimed. Previously, a leftover non-zero `avail_in` caused the
+refill in `png_read_IDAT_data` to be skipped, and inflation continued
+through a stale `next_in` into an input buffer that may since have been
+deallocated.
+
+Introduce the function `png_inflate_detach_buffers` to clear the
+pointers and the counters of zstream input and output buffers on both
+acquisition and release. Although clearing `next_out` and `avail_out`
+is not currently necessary at any call site, it makes release mirror
+acquisition at a negligible cost paid once for each zlib stream.
+
+This is a cherry-pick of commit 6c7783b151377f591c83955e23da50991ad1a600
+from branch 'libpng18'.
+
+Reported-by: Ze Sheng <OwenSanzas@users.noreply.github.com>
+Reported-by: JasonHonKL <JasonHonKL@users.noreply.github.com>
+
+CVE: CVE-2026-46675
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/aa77ef38c17ab2fc1b41bec09fb973c6a386641d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngrutil.c | 33 +++++++++++++++++++--------------
+ 1 file changed, 19 insertions(+), 14 deletions(-)
+
+diff --git a/pngrutil.c b/pngrutil.c
+index 551395168..482f0ae8d 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -332,6 +332,18 @@ png_read_buffer(png_structrp png_ptr, png_alloc_size_t new_size, int warn)
+ }
+ #endif /* READ_iCCP|iTXt|pCAL|sCAL|sPLT|tEXt|zTXt|SEQUENTIAL_READ */
+ 
++/* Detach the zstream from the input and output buffers left by
++ * the current or a previous owner, and possibly deallocated since.
++ */
++static void
++png_inflate_detach_buffers(png_structrp png_ptr)
++{
++   png_ptr->zstream.next_in = NULL;
++   png_ptr->zstream.avail_in = 0;
++   png_ptr->zstream.next_out = NULL;
++   png_ptr->zstream.avail_out = 0;
++}
++
+ /* png_inflate_claim: claim the zstream for some nefarious purpose that involves
+  * decompression.  Returns Z_OK on success, else a zlib error code.  It checks
+  * the owner but, in final release builds, just issues a warning if some other
+@@ -392,13 +404,7 @@ png_inflate_claim(png_structrp png_ptr, png_uint_32 owner)
+ 
+ #endif /* ZLIB_VERNUM >= 0x1240 */
+ 
+-      /* Set this for safety, just in case the previous owner left pointers to
+-       * memory allocations.
+-       */
+-      png_ptr->zstream.next_in = NULL;
+-      png_ptr->zstream.avail_in = 0;
+-      png_ptr->zstream.next_out = NULL;
+-      png_ptr->zstream.avail_out = 0;
++      png_inflate_detach_buffers(png_ptr);
+ 
+       if ((png_ptr->flags & PNG_FLAG_ZSTREAM_INITIALIZED) != 0)
+       {
+@@ -744,7 +750,8 @@ png_decompress_chunk(png_structrp png_ptr,
+          else if (ret == Z_OK)
+             ret = PNG_UNEXPECTED_ZLIB_RETURN;
+ 
+-         /* Release the claimed stream */
++         /* Release the claimed stream. */
++         png_inflate_detach_buffers(png_ptr);
+          png_ptr->zowner = 0;
+       }
+ 
+@@ -1569,6 +1576,7 @@ png_handle_iCCP(png_structrp png_ptr, png_inforp info_ptr, png_uint_32 length)
+ 
+                                     if (errmsg == NULL)
+                                     {
++                                       png_inflate_detach_buffers(png_ptr);
+                                        png_ptr->zowner = 0;
+                                        return;
+                                     }
+@@ -1595,7 +1603,8 @@ png_handle_iCCP(png_structrp png_ptr, png_inforp info_ptr, png_uint_32 length)
+                else /* profile truncated */
+                   errmsg = png_ptr->zstream.msg;
+ 
+-               /* Release the stream */
++               /* Release the claimed stream. */
++               png_inflate_detach_buffers(png_ptr);
+                png_ptr->zowner = 0;
+             }
+ 
+@@ -4294,11 +4303,7 @@ png_read_finish_IDAT(png_structrp png_ptr)
+     */
+    if (png_ptr->zowner == png_IDAT)
+    {
+-      /* Always do this; the pointers otherwise point into the read buffer. */
+-      png_ptr->zstream.next_in = NULL;
+-      png_ptr->zstream.avail_in = 0;
+-
+-      /* Now we no longer own the zstream. */
++      png_inflate_detach_buffers(png_ptr);
+       png_ptr->zowner = 0;
+ 
+       /* The slightly weird semantics of the sequential IDAT reading is that we
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index f375aa5f4e9..8e7f9d8f8ec 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-34757_p1.patch \
            file://CVE-2026-34757_p2.patch \
            file://CVE-2026-33416-05.patch \
+           file://CVE-2026-46675.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
