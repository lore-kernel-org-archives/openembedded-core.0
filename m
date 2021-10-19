Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BBBC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.11588.1634657673528705591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdpLL1RZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so3343218wma.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oCQWFfYzvvqcNfjv2/VUPBw5CVAqwQz2c5eReFSFukA=;
        b=SdpLL1RZY0G9UYUUigi9nwQH1IzHaj+wcmavjvZMmuOgMrf0fIDDYVldopl+LTbY/8
         u27DDHxmVRN8XLZIGaauQXdekuDB8OE5kVwWzsXZLg2LVqeE/ZgYnRIzIDcCea8u8C49
         rZljld6gtRYC9hCwrpPAfulc6c2uHXZOU49v8WU+Yvv7YtsvWyPge3PrnVn8yAojpgcr
         f3CWzgwpHX/Hksj6l00SCK/CBQ/1Y1vV2DLEP3wP/He5QJQDU05zmPWgNxBb7mdhrV8m
         kZEzGpna2trvreYbE0B3eQu0qCdagDljr1rT1KcCvjwXNytW+DrTgBsGYfFcS10CBYMO
         MQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oCQWFfYzvvqcNfjv2/VUPBw5CVAqwQz2c5eReFSFukA=;
        b=vhqjawFaEq1LnpuCpd/W1QNyCiIPnNVi2svQgToiuHqsXd5VLBxyg4bBfUbxMw5Iv2
         0RqGtswT8I9QCs0W8Bk4f/pxmcecOKZg4diR4IK6vMV9lqAesucz/XmI/SOvJFoIcGUz
         1MKexWDnXlI/E6+dOYbWBoOSBa08rNezh6pW9/i5j41c3+NpyCVtbSVJIMHes2hboDyZ
         wEU1rMA04cosjl+O7Z3QB/whmLn0IXzoZwGEham8VuTs2XsJInJ7/2iCOlj8fvvN7KLT
         XqblbPWlFOGo9gU2pQXd4T0XvchxFyFWGghMMr5wnN3CJlvtfhoxwKJrtpM8qbBh/4eR
         V2qQ==
X-Gm-Message-State: AOAM530BAflmSoW3kz+j+nN1uLQTX+xpFWNBDVUf62zSjb6PtUAQ8M9u
	v966uAncv7pojdmB88gcf1Ed4lMPdKU=
X-Google-Smtp-Source: 
 ABdhPJzmxbUcSz1QPfStL3cVPI6PZr6058b+i7/NV034E4Imuohes5PVshQsntCkubDc3YEpC7l3rw==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr6850102wmq.184.1634657671958;
        Tue, 19 Oct 2021 08:34:31 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/65] librsvg: update 2.52.0 -> 2.52.2
Date: Tue, 19 Oct 2021 17:33:26 +0200
Message-Id: <20211019153419.3319802-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157131

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...GdkPixbufRGBA-start-naming-types-and.patch |  81 --------------
 .../librsvg/0002-New-ToPixel-trait.patch      | 100 ------------------
 .../librsvg/0003-New-ToCairoARGB-trait.patch  |  81 --------------
 .../0004-impl-ToPixel-for-CairoARGB.patch     |  49 ---------
 .../{librsvg_2.52.0.bb => librsvg_2.52.2.bb}  |   6 +-
 5 files changed, 1 insertion(+), 316 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-GdkPixbufRGBA-ToGdkPixbufRGBA-start-naming-types-and.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0002-New-ToPixel-trait.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0003-New-ToCairoARGB-trait.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0004-impl-ToPixel-for-CairoARGB.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.0.bb => librsvg_2.52.2.bb} (89%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-GdkPixbufRGBA-ToGdkPixbufRGBA-start-naming-types-and.patch b/meta/recipes-gnome/librsvg/librsvg/0001-GdkPixbufRGBA-ToGdkPixbufRGBA-start-naming-types-and.patch
deleted file mode 100644
index 6935403138..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-GdkPixbufRGBA-ToGdkPixbufRGBA-start-naming-types-and.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From c175ac8344aa465ffc2c2f3a9d02a7889f597f7f Mon Sep 17 00:00:00 2001
-From: Federico Mena Quintero <federico@gnome.org>
-Date: Tue, 21 Sep 2021 12:05:27 -0500
-Subject: [PATCH] GdkPixbufRGBA, ToGdkPixbufRGBA - start naming types and
- conversion traits for pixel formats
-
-The code assumes that struct Pixel is always the layout that GdkPixbuf
-uses.  This is true right now, but is a hidden assumption.  Let's
-start giving better names to pixel formats.
-
-Part-of: <https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/592>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/surface_utils/mod.rs            | 23 +++++++++++++++++++++++
- src/surface_utils/shared_surface.rs |  4 ++--
- 2 files changed, 25 insertions(+), 2 deletions(-)
-
-diff --git a/src/surface_utils/mod.rs b/src/surface_utils/mod.rs
-index 53bbd00bb..93d3b4f79 100644
---- a/src/surface_utils/mod.rs
-+++ b/src/surface_utils/mod.rs
-@@ -22,6 +22,9 @@ use rgb::alt::ARGB8;
- #[allow(clippy::upper_case_acronyms)]
- pub type CairoARGB = ARGB8;
- 
-+/// GdkPixbuf's endian-independent RGBA8 pixel layout.
-+pub type GdkPixbufRGBA = rgb::RGBA8;
-+
- /// Analogous to `rgb::FromSlice`, to convert from `[T]` to `[CairoARGB]`
- #[allow(clippy::upper_case_acronyms)]
- pub trait AsCairoARGB<T: Copy> {
-@@ -57,6 +60,26 @@ pub enum EdgeMode {
-     None,
- }
- 
-+/// Trait to convert pixels in various formats to RGBA, for GdkPixbuf.
-+///
-+/// GdkPixbuf unconditionally uses RGBA ordering regardless of endianness,
-+/// but we need to convert to it from Cairo's endian-dependent 0xaarrggbb.
-+pub trait ToGdkPixbufRGBA {
-+    fn to_pixbuf_rgba(&self) -> GdkPixbufRGBA;
-+}
-+
-+impl ToGdkPixbufRGBA for Pixel {
-+    #[inline]
-+    fn to_pixbuf_rgba(&self) -> GdkPixbufRGBA {
-+        GdkPixbufRGBA {
-+            r: self.r,
-+            g: self.g,
-+            b: self.b,
-+            a: self.a,
-+        }
-+    }
-+}
-+
- /// Extension methods for `cairo::ImageSurfaceData`.
- pub trait ImageSurfaceDataExt: DerefMut<Target = [u8]> {
-     /// Sets the pixel at the given coordinates. Assumes the `ARgb32` format.
-diff --git a/src/surface_utils/shared_surface.rs b/src/surface_utils/shared_surface.rs
-index 9d3289230..476a6f776 100644
---- a/src/surface_utils/shared_surface.rs
-+++ b/src/surface_utils/shared_surface.rs
-@@ -15,7 +15,7 @@ use crate::util::clamp;
- 
- use super::{
-     iterators::{PixelRectangle, Pixels},
--    AsCairoARGB, CairoARGB, EdgeMode, ImageSurfaceDataExt, Pixel, PixelOps,
-+    AsCairoARGB, CairoARGB, EdgeMode, ImageSurfaceDataExt, Pixel, PixelOps, ToGdkPixbufRGBA,
- };
- 
- /// Types of pixel data in a `ImageSurface`.
-@@ -342,7 +342,7 @@ impl ImageSurface<Shared> {
-             .map(|row| row.as_rgba_mut())
-             .zip(self.rows())
-             .flat_map(|(dest_row, src_row)| src_row.iter().zip(dest_row.iter_mut()))
--            .for_each(|(src, dest)| *dest = Pixel::from(*src).unpremultiply());
-+            .for_each(|(src, dest)| *dest = Pixel::from(*src).unpremultiply().to_pixbuf_rgba());
- 
-         Some(pixbuf)
-     }
diff --git a/meta/recipes-gnome/librsvg/librsvg/0002-New-ToPixel-trait.patch b/meta/recipes-gnome/librsvg/librsvg/0002-New-ToPixel-trait.patch
deleted file mode 100644
index c71c93e1a1..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0002-New-ToPixel-trait.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 47478d5a8a4b7a05b44f024404137c4c68b62b7e Mon Sep 17 00:00:00 2001
-From: Federico Mena Quintero <federico@gnome.org>
-Date: Tue, 21 Sep 2021 12:22:15 -0500
-Subject: [PATCH] New ToPixel trait
-
-Use it where we convert GdkPixbuf pixels to our own Pixel for premultiplication.
-
-Part-of: <https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/592>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/surface_utils/mod.rs            | 32 +++++++++++++++++++++++++++++
- src/surface_utils/shared_surface.rs |  5 +++--
- 2 files changed, 35 insertions(+), 2 deletions(-)
-
-diff --git a/src/surface_utils/mod.rs b/src/surface_utils/mod.rs
-index 93d3b4f79..58953e6a0 100644
---- a/src/surface_utils/mod.rs
-+++ b/src/surface_utils/mod.rs
-@@ -25,6 +25,9 @@ pub type CairoARGB = ARGB8;
- /// GdkPixbuf's endian-independent RGBA8 pixel layout.
- pub type GdkPixbufRGBA = rgb::RGBA8;
- 
-+/// GdkPixbuf's packed RGB pixel layout.
-+pub type GdkPixbufRGB = rgb::RGB8;
-+
- /// Analogous to `rgb::FromSlice`, to convert from `[T]` to `[CairoARGB]`
- #[allow(clippy::upper_case_acronyms)]
- pub trait AsCairoARGB<T: Copy> {
-@@ -68,6 +71,11 @@ pub trait ToGdkPixbufRGBA {
-     fn to_pixbuf_rgba(&self) -> GdkPixbufRGBA;
- }
- 
-+/// Trait to convert pixels in various formats to our own Pixel layout.
-+pub trait ToPixel {
-+    fn to_pixel(&self) -> Pixel;
-+}
-+
- impl ToGdkPixbufRGBA for Pixel {
-     #[inline]
-     fn to_pixbuf_rgba(&self) -> GdkPixbufRGBA {
-@@ -80,6 +88,30 @@ impl ToGdkPixbufRGBA for Pixel {
-     }
- }
- 
-+impl ToPixel for GdkPixbufRGBA {
-+    #[inline]
-+    fn to_pixel(&self) -> Pixel {
-+        Pixel {
-+            r: self.r,
-+            g: self.g,
-+            b: self.b,
-+            a: self.a,
-+        }
-+    }
-+}
-+
-+impl ToPixel for GdkPixbufRGB {
-+    #[inline]
-+    fn to_pixel(&self) -> Pixel {
-+        Pixel {
-+            r: self.r,
-+            g: self.g,
-+            b: self.b,
-+            a: 255,
-+        }
-+    }
-+}
-+
- /// Extension methods for `cairo::ImageSurfaceData`.
- pub trait ImageSurfaceDataExt: DerefMut<Target = [u8]> {
-     /// Sets the pixel at the given coordinates. Assumes the `ARgb32` format.
-diff --git a/src/surface_utils/shared_surface.rs b/src/surface_utils/shared_surface.rs
-index 476a6f776..9fa9a2e15 100644
---- a/src/surface_utils/shared_surface.rs
-+++ b/src/surface_utils/shared_surface.rs
-@@ -16,6 +16,7 @@ use crate::util::clamp;
- use super::{
-     iterators::{PixelRectangle, Pixels},
-     AsCairoARGB, CairoARGB, EdgeMode, ImageSurfaceDataExt, Pixel, PixelOps, ToGdkPixbufRGBA,
-+    ToPixel,
- };
- 
- /// Types of pixel data in a `ImageSurface`.
-@@ -304,13 +305,13 @@ impl ImageSurface<Shared> {
-                 .map(|row| row.as_rgba())
-                 .zip(surf.rows_mut())
-                 .flat_map(|(src_row, dest_row)| src_row.iter().zip(dest_row.iter_mut()))
--                .for_each(|(src, dest)| *dest = src.premultiply().into());
-+                .for_each(|(src, dest)| *dest = src.to_pixel().premultiply().into());
-         } else {
-             pixbuf_rows
-                 .map(|row| row.as_rgb())
-                 .zip(surf.rows_mut())
-                 .flat_map(|(src_row, dest_row)| src_row.iter().zip(dest_row.iter_mut()))
--                .for_each(|(src, dest)| *dest = src.alpha(0xff).into());
-+                .for_each(|(src, dest)| *dest = src.to_pixel().into());
-         }
- 
-         if let (Some(content_type), Some(bytes)) = (content_type, mime_data) {
diff --git a/meta/recipes-gnome/librsvg/librsvg/0003-New-ToCairoARGB-trait.patch b/meta/recipes-gnome/librsvg/librsvg/0003-New-ToCairoARGB-trait.patch
deleted file mode 100644
index 8dd45ef0a2..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0003-New-ToCairoARGB-trait.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From f5768df65cf6277e8ab687a84fdc5d9addaa373d Mon Sep 17 00:00:00 2001
-From: Federico Mena Quintero <federico@gnome.org>
-Date: Tue, 21 Sep 2021 12:49:53 -0500
-Subject: [PATCH] New ToCairoARGB trait
-
-Use it in the pixbuf-to-cairo-surface function.
-
-Part-of: <https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/592>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/surface_utils/mod.rs            | 17 +++++++++++++++++
- src/surface_utils/shared_surface.rs |  8 ++++----
- 2 files changed, 21 insertions(+), 4 deletions(-)
-
-diff --git a/src/surface_utils/mod.rs b/src/surface_utils/mod.rs
-index 58953e6a0..3f915cd01 100644
---- a/src/surface_utils/mod.rs
-+++ b/src/surface_utils/mod.rs
-@@ -76,6 +76,11 @@ pub trait ToPixel {
-     fn to_pixel(&self) -> Pixel;
- }
- 
-+/// Trait to convert pixels in various formats to Cairo's endian-dependent 0xaarrggbb.
-+pub trait ToCairoARGB {
-+    fn to_cairo_argb(&self) -> CairoARGB;
-+}
-+
- impl ToGdkPixbufRGBA for Pixel {
-     #[inline]
-     fn to_pixbuf_rgba(&self) -> GdkPixbufRGBA {
-@@ -112,6 +117,18 @@ impl ToPixel for GdkPixbufRGB {
-     }
- }
- 
-+impl ToCairoARGB for Pixel {
-+    #[inline]
-+    fn to_cairo_argb(&self) -> CairoARGB {
-+        CairoARGB {
-+            r: self.r,
-+            g: self.g,
-+            b: self.b,
-+            a: self.a,
-+        }
-+    }
-+}
-+
- /// Extension methods for `cairo::ImageSurfaceData`.
- pub trait ImageSurfaceDataExt: DerefMut<Target = [u8]> {
-     /// Sets the pixel at the given coordinates. Assumes the `ARgb32` format.
-diff --git a/src/surface_utils/shared_surface.rs b/src/surface_utils/shared_surface.rs
-index 9fa9a2e15..34dfc992e 100644
---- a/src/surface_utils/shared_surface.rs
-+++ b/src/surface_utils/shared_surface.rs
-@@ -15,8 +15,8 @@ use crate::util::clamp;
- 
- use super::{
-     iterators::{PixelRectangle, Pixels},
--    AsCairoARGB, CairoARGB, EdgeMode, ImageSurfaceDataExt, Pixel, PixelOps, ToGdkPixbufRGBA,
--    ToPixel,
-+    AsCairoARGB, CairoARGB, EdgeMode, ImageSurfaceDataExt, Pixel, PixelOps, ToCairoARGB,
-+    ToGdkPixbufRGBA, ToPixel,
- };
- 
- /// Types of pixel data in a `ImageSurface`.
-@@ -305,13 +305,13 @@ impl ImageSurface<Shared> {
-                 .map(|row| row.as_rgba())
-                 .zip(surf.rows_mut())
-                 .flat_map(|(src_row, dest_row)| src_row.iter().zip(dest_row.iter_mut()))
--                .for_each(|(src, dest)| *dest = src.to_pixel().premultiply().into());
-+                .for_each(|(src, dest)| *dest = src.to_pixel().premultiply().to_cairo_argb());
-         } else {
-             pixbuf_rows
-                 .map(|row| row.as_rgb())
-                 .zip(surf.rows_mut())
-                 .flat_map(|(src_row, dest_row)| src_row.iter().zip(dest_row.iter_mut()))
--                .for_each(|(src, dest)| *dest = src.to_pixel().into());
-+                .for_each(|(src, dest)| *dest = src.to_pixel().to_cairo_argb());
-         }
- 
-         if let (Some(content_type), Some(bytes)) = (content_type, mime_data) {
diff --git a/meta/recipes-gnome/librsvg/librsvg/0004-impl-ToPixel-for-CairoARGB.patch b/meta/recipes-gnome/librsvg/librsvg/0004-impl-ToPixel-for-CairoARGB.patch
deleted file mode 100644
index caf81af5d0..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0004-impl-ToPixel-for-CairoARGB.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From c66987d6fa9f9e442eb7dac947f469bcf8c35d48 Mon Sep 17 00:00:00 2001
-From: Federico Mena Quintero <federico@gnome.org>
-Date: Tue, 21 Sep 2021 12:54:12 -0500
-Subject: [PATCH] impl ToPixel for CairoARGB
-
-Part-of: <https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/592>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/surface_utils/mod.rs            | 12 ++++++++++++
- src/surface_utils/shared_surface.rs |  2 +-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/src/surface_utils/mod.rs b/src/surface_utils/mod.rs
-index 3f915cd01..4f751ece4 100644
---- a/src/surface_utils/mod.rs
-+++ b/src/surface_utils/mod.rs
-@@ -93,6 +93,18 @@ impl ToGdkPixbufRGBA for Pixel {
-     }
- }
- 
-+impl ToPixel for CairoARGB {
-+    #[inline]
-+    fn to_pixel(&self) -> Pixel {
-+        Pixel {
-+            r: self.r,
-+            g: self.g,
-+            b: self.b,
-+            a: self.a,
-+        }
-+    }
-+}
-+
- impl ToPixel for GdkPixbufRGBA {
-     #[inline]
-     fn to_pixel(&self) -> Pixel {
-diff --git a/src/surface_utils/shared_surface.rs b/src/surface_utils/shared_surface.rs
-index 34dfc992e..20cd0f40b 100644
---- a/src/surface_utils/shared_surface.rs
-+++ b/src/surface_utils/shared_surface.rs
-@@ -343,7 +343,7 @@ impl ImageSurface<Shared> {
-             .map(|row| row.as_rgba_mut())
-             .zip(self.rows())
-             .flat_map(|(dest_row, src_row)| src_row.iter().zip(dest_row.iter_mut()))
--            .for_each(|(src, dest)| *dest = Pixel::from(*src).unpremultiply().to_pixbuf_rgba());
-+            .for_each(|(src, dest)| *dest = src.to_pixel().unpremultiply().to_pixbuf_rgba());
- 
-         Some(pixbuf)
-     }
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.2.bb
similarity index 89%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.2.bb
index 47d3880873..7ab8136a8d 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.2.bb
@@ -18,15 +18,11 @@ inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspec
 
 SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
-           file://0001-GdkPixbufRGBA-ToGdkPixbufRGBA-start-naming-types-and.patch \
-           file://0002-New-ToPixel-trait.patch \
-           file://0003-New-ToCairoARGB-trait.patch \
-           file://0004-impl-ToPixel-for-CairoARGB.patch \
            file://0001-crossbeam-utils-check-only-the-architecture-not-the-.patch \
            file://0001-vendor-system-deps-sort-dependencies-before-using-th.patch \
            "
 
-SRC_URI[archive.sha256sum] = "bd821fb3e16494b61f5185addd23b726b064f203122b3ab4b3d5d7a44e6bf393"
+SRC_URI[archive.sha256sum] = "03d2887c18ffb906e1a60f97fe46a7169f69aa28d6db5d285748f3618b093427"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.20.1


