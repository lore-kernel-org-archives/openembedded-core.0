Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E2D997C6CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 23:38:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o10so3188800wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 15:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hYSo0raqgLduAqDksLNRfAOIlk13IVif3W6lp6bMKxk=;
	b=UKyiz2xuJ05+5pz92q5K8eZad+MnyI6r+f9tzZ7ig9d1AE/tgev/DvFiHC1LC4LtQO
	I0OGtluIrZm5dOkf4DE1ZOVu5kn6XZUOYmdlgCelGsH20ufl8/s0lpA+5ybHkT1tx7/t
	3ngg/Ro6whc7Jh4+yeu2qKYulwPcC/A50YzMK2qST5hsUIqGuDYS1uPLAD8Gvbsvp5vD
	HsB+wtOLmpiH28sTA7FPlmY5cCE3MRx3s2V0ZJKawfHFOCyWH7iBPeIlk/AQqYunLaDX
	stab2uuaWnF01K+GkYj9eN87mBlR+J2PpDz8Mwxocogw1WnSFjd9IyAwZ+oUrqlL/eKx
	gwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hYSo0raqgLduAqDksLNRfAOIlk13IVif3W6lp6bMKxk=;
	b=p8F1ZBrdpyGg1kNwwgPpfLgydDy6Xy3UdUkqiyMmaB7Wiv0UkC7z5U4EhoAC8TpTnD
	6FA1vLM17lmuhWiMjvJJerBCmhQxIwhJhlYmUsMV64L9s3UF/TKnLQGiqES2qHb1onuq
	KcQVdbEaJ9nRq3mW4a/Ka5Sc0pwkVWANcLSJHDntnqD+XiygYlsLWq/YMfM3B9YzAx75
	K1W/r7Zj7X2kxU0oSc8RlFIjKNuvmztXW4+JfJv7M7uweqd9RuwPpeX79jAU0r0fMQiG
	6Eq3u+0oc+DCt+ba/TSsD6BykkWUgJvB8Th5qdcZbDTUI+5IenFeqLOEooXDRB3T0+v2
	fwzg==
X-Gm-Message-State: APjAAAXJgCJ8htQKYdILGkrgPhiMjk8fJ4K/qdAVfdKon3+GBYf4iElL
	lbhLIEsT4cz0CL0Fx4w/9A/uPPTGhgI=
X-Google-Smtp-Source: APXvYqxpmipYAvyxUmrXLoQjfRC1dTO1OxCLGuPuNU1Tjt15sW/aTDH3ai6w2/FfOWsKLuFyogncnw==
X-Received: by 2002:a1c:eb17:: with SMTP id j23mr524555wmh.86.1551829098249;
	Tue, 05 Mar 2019 15:38:18 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z129sm118745wmc.33.2019.03.05.15.38.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 15:38:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 23:38:15 +0000
Message-Id: <20190305233815.15306-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cairo: fix CVE-2018-19876 CVE-2019-6461 CVE-2019-6462
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
X-List-Received-Date: Tue, 05 Mar 2019 23:38:18 -0000

CVE-2018-19876 is a backport from upstream.

CVE-2019-6461 and CVE-2019-6462 are patches taken from Clear Linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../cairo/cairo/CVE-2018-19876.patch               | 34 ++++++++++++++++++++++
 .../cairo/cairo/CVE-2019-6461.patch                | 19 ++++++++++++
 .../cairo/cairo/CVE-2019-6462.patch                | 20 +++++++++++++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb        |  3 ++
 4 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
new file mode 100644
index 00000000000..4252a5663b9
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
@@ -0,0 +1,34 @@
+CVE: CVE-2018-19876
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Mon, 19 Nov 2018 12:33:07 +0100
+Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
+ cairo_ft_apply_variations
+
+Fixes a crash when using freetype >= 2.9
+---
+ src/cairo-ft-font.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
+index 325dd61b4..981973f78 100644
+--- a/src/cairo-ft-font.c
++++ b/src/cairo-ft-font.c
+@@ -2393,7 +2393,11 @@ skip:
+ done:
+         free (coords);
+         free (current_coords);
++#if HAVE_FT_DONE_MM_VAR
++        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
++#else
+         free (ft_mm_var);
++#endif
+     }
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
new file mode 100644
index 00000000000..5232cf70c69
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -0,0 +1,19 @@
+There is a potential infinite-loop in function _arc_error_normalized().
+
+CVE: CVE-2019-6461
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..f9249dbeb 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+     do {
+ 	angle = M_PI / i++;
+ 	error = _arc_error_normalized (angle);
+-    } while (error > tolerance);
++    } while (error > tolerance && error > __DBL_EPSILON__);
+ 
+     return angle;
+ }
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
new file mode 100644
index 00000000000..4e4598c5b5d
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
@@ -0,0 +1,20 @@
+There is an assertion in function _cairo_arc_in_direction().
+
+CVE: CVE-2019-6462
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..1bde774a4 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
+     if (cairo_status (cr))
+         return;
+ 
+-    assert (angle_max >= angle_min);
++    if (angle_max < angle_min)
++       return;
+ 
+     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+ 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index cdef023198f..c2628ae0ca0 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -24,6 +24,9 @@ DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
+           file://CVE-2018-19876.patch \
+           file://CVE-2019-6461.patch \
+           file://CVE-2019-6462.patch \
           "
 
 SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
-- 
2.11.0


