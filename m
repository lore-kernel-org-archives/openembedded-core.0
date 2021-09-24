Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.8769.1632492965124896299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=r6a1AFv0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id bj3-20020a17090b088300b0019e6603fe89so6154428pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NoRUm4PzxMfgB/wdum6OPLQejWA55ztCS8u2IOGFaIs=;
        b=r6a1AFv09LAg8y1JtkbOQUG3cmDm+/iqsfCTbFDLVpRwvqA/XMjtIbVWJBGgpuWLWI
         M4C1fE8lEb0KI3S+NRMv+cWmWTA+jHmmpejZF61sRovIfpJarowuu7De4+7VSXe8XxYF
         h0atdXIqaCNaAeXyL4Oyo+iL309+qNE9ovGhSovrYMOQzyQQzL4hyZtmL1P7QH/XYUxd
         wKHVqttAWbkp2YvrFcVMyGLFNJYPEUBdzJKjHw/H8cnop2f9mnrX+5RtKVXNj6H7WO0K
         4NOhmg6FhZ80s18valdF73hjENkNoW4bI14T/Uf/5cFeQUa26c8sRcEIIR7l3NnWzEVd
         52pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NoRUm4PzxMfgB/wdum6OPLQejWA55ztCS8u2IOGFaIs=;
        b=iivz9iwDAQ22uFwLCaqAJe7X5yzOOaJYG+8xWvPRjuhrB1SyOi8v0EtoHrny8ddgJA
         V+aShzQFvNG0xRsXd6o0ud8nc7mLutb46z6kRQ11lgkyvCVnx2jcCeo/0DjAiBTgEkW9
         OEylLjT2TqfmwZCbH4qg2dO2oy5GkNH3XtqSVaZbmy9hBYhBDsxzrKZZFsKVK9x1vu+H
         bz3aYyxYiIf19fSIwKTZZkuyJfA93Q1PfIWPv9DP+qmWb9/kl88++yRwWejWaJYnMZb/
         GRQq7l1ki3Ytk/b0VK+GPY5mfudsNWmLLE5BASNpHdwMuWnqLjqnpaPxoOasJY2W5Lzk
         bwiQ==
X-Gm-Message-State: AOAM53001MoEUMWiXWc7hjc3QGJxjcuZrDo3jS4e/j8PP3HI1S2Lt3pQ
	05CI0qr74uu3kLppTIsF1sSwvUPpOVQMj6E98Mc=
X-Google-Smtp-Source: ABdhPJwenD25/eqsIQgazRMWXADpy6sZcJWE7A0AqIM9Z70u7grJAvjs2/LJDR16aSAs4Rr+mnj5Ng==
X-Received: by 2002:a17:90a:d686:: with SMTP id x6mr2557290pju.8.1632492963280;
        Fri, 24 Sep 2021 07:16:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/25] qemu: Security fix CVE-2020-12829
Date: Fri, 24 Sep 2021 04:15:08 -1000
Message-Id: <579bd694630bc4df67762a844ad28f8e269d6694.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 105490
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=b15a22bbcbe6a78dc3d88fe3134985e4cdd87de4
ChangeID: 6e222b766fc67c76cdc311d02cc47801992d0e66
Description:

Affect qemu < 5.0.0

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../qemu/qemu/CVE-2020-12829_1.patch          | 164 +++++++++++
 .../qemu/qemu/CVE-2020-12829_2.patch          | 139 +++++++++
 .../qemu/qemu/CVE-2020-12829_3.patch          |  47 ++++
 .../qemu/qemu/CVE-2020-12829_4.patch          | 100 +++++++
 .../qemu/qemu/CVE-2020-12829_5.patch          | 266 ++++++++++++++++++
 6 files changed, 721 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_5.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c8c170dda0..f5e8a9ae49 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -84,6 +84,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3582.patch \
            file://CVE-2021-3607.patch \
            file://CVE-2021-3608.patch \
+           file://CVE-2020-12829_1.patch \
+           file://CVE-2020-12829_2.patch \
+           file://CVE-2020-12829_3.patch \
+           file://CVE-2020-12829_4.patch \
+           file://CVE-2020-12829_5.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_1.patch
new file mode 100644
index 0000000000..6fee4f640d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_1.patch
@@ -0,0 +1,164 @@
+From e29da77e5fddf6480e3a0e80b63d703edaec751b Mon Sep 17 00:00:00 2001
+From: BALATON Zoltan <balaton@eik.bme.hu>
+Date: Thu, 21 May 2020 21:39:44 +0200
+Subject: [PATCH] sm501: Convert printf + abort to qemu_log_mask
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some places already use qemu_log_mask() to log unimplemented features
+or errors but some others have printf() then abort(). Convert these to
+qemu_log_mask() and avoid aborting to prevent guests to easily cause
+denial of service.
+
+Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: 305af87f59d81e92f2aaff09eb8a3603b8baa322.1590089984.git.balaton@eik.bme.hu
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-12829 dep#1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/display/sm501.c | 57 ++++++++++++++++++++++------------------------
+ 1 file changed, 27 insertions(+), 30 deletions(-)
+
+diff --git a/hw/display/sm501.c b/hw/display/sm501.c
+index acc692531a..bd3ccfe311 100644
+--- a/hw/display/sm501.c
++++ b/hw/display/sm501.c
+@@ -727,8 +727,8 @@ static void sm501_2d_operation(SM501State *s)
+     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
+ 
+     if (addressing != 0x0) {
+-        printf("%s: only XY addressing is supported.\n", __func__);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
++        return;
+     }
+ 
+     if (rop_mode == 0) {
+@@ -754,8 +754,8 @@ static void sm501_2d_operation(SM501State *s)
+ 
+     if ((s->twoD_source_base & 0x08000000) ||
+         (s->twoD_destination_base & 0x08000000)) {
+-        printf("%s: only local memory is supported.\n", __func__);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
++        return;
+     }
+ 
+     switch (operation) {
+@@ -823,9 +823,9 @@ static void sm501_2d_operation(SM501State *s)
+         break;
+ 
+     default:
+-        printf("non-implemented SM501 2D operation. %d\n", operation);
+-        abort();
+-        break;
++        qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2D operation: %d\n",
++                      operation);
++        return;
+     }
+ 
+     if (dst_base >= get_fb_addr(s, crt) &&
+@@ -892,9 +892,8 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
+         break;
+ 
+     default:
+-        printf("sm501 system config : not implemented register read."
+-               " addr=%x\n", (int)addr);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: not implemented system config"
++                      "register read. addr=%" HWADDR_PRIx "\n", addr);
+     }
+ 
+     return ret;
+@@ -948,15 +947,15 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
+         break;
+     case SM501_ENDIAN_CONTROL:
+         if (value & 0x00000001) {
+-            printf("sm501 system config : big endian mode not implemented.\n");
+-            abort();
++            qemu_log_mask(LOG_UNIMP, "sm501: system config big endian mode not"
++                          " implemented.\n");
+         }
+         break;
+ 
+     default:
+-        printf("sm501 system config : not implemented register write."
+-               " addr=%x, val=%x\n", (int)addr, (uint32_t)value);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: not implemented system config"
++                      "register write. addr=%" HWADDR_PRIx
++                      ", val=%" PRIx64 "\n", addr, value);
+     }
+ }
+ 
+@@ -1207,9 +1206,8 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
+         break;
+ 
+     default:
+-        printf("sm501 disp ctrl : not implemented register read."
+-               " addr=%x\n", (int)addr);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
++                      "read. addr=%" HWADDR_PRIx "\n", addr);
+     }
+ 
+     return ret;
+@@ -1345,9 +1343,9 @@ static void sm501_disp_ctrl_write(void *opaque, hwaddr addr,
+         break;
+ 
+     default:
+-        printf("sm501 disp ctrl : not implemented register write."
+-               " addr=%x, val=%x\n", (int)addr, (unsigned)value);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
++                      "write. addr=%" HWADDR_PRIx
++                      ", val=%" PRIx64 "\n", addr, value);
+     }
+ }
+ 
+@@ -1433,9 +1431,8 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
+         ret = 0; /* Should return interrupt status */
+         break;
+     default:
+-        printf("sm501 disp ctrl : not implemented register read."
+-               " addr=%x\n", (int)addr);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
++                      "read. addr=%" HWADDR_PRIx "\n", addr);
+     }
+ 
+     return ret;
+@@ -1520,9 +1517,9 @@ static void sm501_2d_engine_write(void *opaque, hwaddr addr,
+         /* ignored, writing 0 should clear interrupt status */
+         break;
+     default:
+-        printf("sm501 2d engine : not implemented register write."
+-               " addr=%x, val=%x\n", (int)addr, (unsigned)value);
+-        abort();
++        qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2d engine register "
++                      "write. addr=%" HWADDR_PRIx
++                      ", val=%" PRIx64 "\n", addr, value);
+     }
+ }
+ 
+@@ -1670,9 +1667,9 @@ static void sm501_update_display(void *opaque)
+         draw_line = draw_line32_funcs[dst_depth_index];
+         break;
+     default:
+-        printf("sm501 update display : invalid control register value.\n");
+-        abort();
+-        break;
++        qemu_log_mask(LOG_GUEST_ERROR, "sm501: update display"
++                      "invalid control register value.\n");
++        return;
+     }
+ 
+     /* set up to draw hardware cursor */
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_2.patch
new file mode 100644
index 0000000000..e7258a43d3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_2.patch
@@ -0,0 +1,139 @@
+From 6f8183b5dc5b309378687830a25e85ea8fb860ea Mon Sep 17 00:00:00 2001
+From: BALATON Zoltan <balaton@eik.bme.hu>
+Date: Thu, 21 May 2020 21:39:44 +0200
+Subject: [PATCH 2/5] sm501: Shorten long variable names in sm501_2d_operation
+
+This increases readability and cleans up some confusing naming.
+
+Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
+Message-id: b9b67b94c46e945252a73c77dfd117132c63c4fb.1590089984.git.balaton@eik.bme.hu
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-12829 dep#2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/display/sm501.c | 45 ++++++++++++++++++++++-----------------------
+ 1 file changed, 22 insertions(+), 23 deletions(-)
+
+diff --git a/hw/display/sm501.c b/hw/display/sm501.c
+index bd3ccfe311..f42d05e1e4 100644
+--- a/hw/display/sm501.c
++++ b/hw/display/sm501.c
+@@ -700,17 +700,16 @@ static inline void hwc_invalidate(SM501State *s, int crt)
+ static void sm501_2d_operation(SM501State *s)
+ {
+     /* obtain operation parameters */
+-    int operation = (s->twoD_control >> 16) & 0x1f;
++    int cmd = (s->twoD_control >> 16) & 0x1F;
+     int rtl = s->twoD_control & 0x8000000;
+     int src_x = (s->twoD_source >> 16) & 0x01FFF;
+     int src_y = s->twoD_source & 0xFFFF;
+     int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
+     int dst_y = s->twoD_destination & 0xFFFF;
+-    int operation_width = (s->twoD_dimension >> 16) & 0x1FFF;
+-    int operation_height = s->twoD_dimension & 0xFFFF;
++    int width = (s->twoD_dimension >> 16) & 0x1FFF;
++    int height = s->twoD_dimension & 0xFFFF;
+     uint32_t color = s->twoD_foreground;
+-    int format_flags = (s->twoD_stretch >> 20) & 0x3;
+-    int addressing = (s->twoD_stretch >> 16) & 0xF;
++    int format = (s->twoD_stretch >> 20) & 0x3;
+     int rop_mode = (s->twoD_control >> 15) & 0x1; /* 1 for rop2, else rop3 */
+     /* 1 if rop2 source is the pattern, otherwise the source is the bitmap */
+     int rop2_source_is_pattern = (s->twoD_control >> 14) & 0x1;
+@@ -721,12 +720,12 @@ static void sm501_2d_operation(SM501State *s)
+     /* get frame buffer info */
+     uint8_t *src = s->local_mem + src_base;
+     uint8_t *dst = s->local_mem + dst_base;
+-    int src_width = s->twoD_pitch & 0x1FFF;
+-    int dst_width = (s->twoD_pitch >> 16) & 0x1FFF;
++    int src_pitch = s->twoD_pitch & 0x1FFF;
++    int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
+     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
+     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
+ 
+-    if (addressing != 0x0) {
++    if ((s->twoD_stretch >> 16) & 0xF) {
+         qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
+         return;
+     }
+@@ -758,20 +757,20 @@ static void sm501_2d_operation(SM501State *s)
+         return;
+     }
+ 
+-    switch (operation) {
++    switch (cmd) {
+     case 0x00: /* copy area */
+ #define COPY_AREA(_bpp, _pixel_type, rtl) {                                   \
+         int y, x, index_d, index_s;                                           \
+-        for (y = 0; y < operation_height; y++) {                              \
+-            for (x = 0; x < operation_width; x++) {                           \
++        for (y = 0; y < height; y++) {                              \
++            for (x = 0; x < width; x++) {                           \
+                 _pixel_type val;                                              \
+                                                                               \
+                 if (rtl) {                                                    \
+-                    index_s = ((src_y - y) * src_width + src_x - x) * _bpp;   \
+-                    index_d = ((dst_y - y) * dst_width + dst_x - x) * _bpp;   \
++                    index_s = ((src_y - y) * src_pitch + src_x - x) * _bpp;   \
++                    index_d = ((dst_y - y) * dst_pitch + dst_x - x) * _bpp;   \
+                 } else {                                                      \
+-                    index_s = ((src_y + y) * src_width + src_x + x) * _bpp;   \
+-                    index_d = ((dst_y + y) * dst_width + dst_x + x) * _bpp;   \
++                    index_s = ((src_y + y) * src_pitch + src_x + x) * _bpp;   \
++                    index_d = ((dst_y + y) * dst_pitch + dst_x + x) * _bpp;   \
+                 }                                                             \
+                 if (rop_mode == 1 && rop == 5) {                              \
+                     /* Invert dest */                                         \
+@@ -783,7 +782,7 @@ static void sm501_2d_operation(SM501State *s)
+             }                                                                 \
+         }                                                                     \
+     }
+-        switch (format_flags) {
++        switch (format) {
+         case 0:
+             COPY_AREA(1, uint8_t, rtl);
+             break;
+@@ -799,15 +798,15 @@ static void sm501_2d_operation(SM501State *s)
+     case 0x01: /* fill rectangle */
+ #define FILL_RECT(_bpp, _pixel_type) {                                      \
+         int y, x;                                                           \
+-        for (y = 0; y < operation_height; y++) {                            \
+-            for (x = 0; x < operation_width; x++) {                         \
+-                int index = ((dst_y + y) * dst_width + dst_x + x) * _bpp;   \
++        for (y = 0; y < height; y++) {                            \
++            for (x = 0; x < width; x++) {                         \
++                int index = ((dst_y + y) * dst_pitch + dst_x + x) * _bpp;   \
+                 *(_pixel_type *)&dst[index] = (_pixel_type)color;           \
+             }                                                               \
+         }                                                                   \
+     }
+ 
+-        switch (format_flags) {
++        switch (format) {
+         case 0:
+             FILL_RECT(1, uint8_t);
+             break;
+@@ -824,14 +823,14 @@ static void sm501_2d_operation(SM501State *s)
+ 
+     default:
+         qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2D operation: %d\n",
+-                      operation);
++                      cmd);
+         return;
+     }
+ 
+     if (dst_base >= get_fb_addr(s, crt) &&
+         dst_base <= get_fb_addr(s, crt) + fb_len) {
+-        int dst_len = MIN(fb_len, ((dst_y + operation_height - 1) * dst_width +
+-                           dst_x + operation_width) * (1 << format_flags));
++        int dst_len = MIN(fb_len, ((dst_y + height - 1) * dst_pitch +
++                          dst_x + width) * (1 << format));
+         if (dst_len) {
+             memory_region_set_dirty(&s->local_mem_region, dst_base, dst_len);
+         }
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_3.patch
new file mode 100644
index 0000000000..c647028cfe
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_3.patch
@@ -0,0 +1,47 @@
+From 2824809b7f8f03ddc6e2b7e33e78c06022424298 Mon Sep 17 00:00:00 2001
+From: BALATON Zoltan <balaton@eik.bme.hu>
+Date: Thu, 21 May 2020 21:39:44 +0200
+Subject: [PATCH 3/5] sm501: Use BIT(x) macro to shorten constant
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: 124bf5de8d7cf503b32b377d0445029a76bfbd49.1590089984.git.balaton@eik.bme.hu
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-12829 dep#3
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/display/sm501.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/hw/display/sm501.c b/hw/display/sm501.c
+index f42d05e1e4..97660090bb 100644
+--- a/hw/display/sm501.c
++++ b/hw/display/sm501.c
+@@ -701,7 +701,7 @@ static void sm501_2d_operation(SM501State *s)
+ {
+     /* obtain operation parameters */
+     int cmd = (s->twoD_control >> 16) & 0x1F;
+-    int rtl = s->twoD_control & 0x8000000;
++    int rtl = s->twoD_control & BIT(27);
+     int src_x = (s->twoD_source >> 16) & 0x01FFF;
+     int src_y = s->twoD_source & 0xFFFF;
+     int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
+@@ -751,8 +751,7 @@ static void sm501_2d_operation(SM501State *s)
+         }
+     }
+ 
+-    if ((s->twoD_source_base & 0x08000000) ||
+-        (s->twoD_destination_base & 0x08000000)) {
++    if (s->twoD_source_base & BIT(27) || s->twoD_destination_base & BIT(27)) {
+         qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
+         return;
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_4.patch
new file mode 100644
index 0000000000..485af05e1e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_4.patch
@@ -0,0 +1,100 @@
+From 3d0b096298b5579a7fa0753ad90968b27bc65372 Mon Sep 17 00:00:00 2001
+From: BALATON Zoltan <balaton@eik.bme.hu>
+Date: Thu, 21 May 2020 21:39:44 +0200
+Subject: [PATCH 4/5] sm501: Clean up local variables in sm501_2d_operation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Make variables local to the block they are used in to make it clearer
+which operation they are needed for.
+
+Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: ae59f8138afe7f6a5a4a82539d0f61496a906b06.1590089984.git.balaton@eik.bme.hu
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-12829 dep#4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/display/sm501.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/hw/display/sm501.c b/hw/display/sm501.c
+index 97660090bb..5ed57703d8 100644
+--- a/hw/display/sm501.c
++++ b/hw/display/sm501.c
+@@ -699,28 +699,19 @@ static inline void hwc_invalidate(SM501State *s, int crt)
+ 
+ static void sm501_2d_operation(SM501State *s)
+ {
+-    /* obtain operation parameters */
+     int cmd = (s->twoD_control >> 16) & 0x1F;
+     int rtl = s->twoD_control & BIT(27);
+-    int src_x = (s->twoD_source >> 16) & 0x01FFF;
+-    int src_y = s->twoD_source & 0xFFFF;
+-    int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
+-    int dst_y = s->twoD_destination & 0xFFFF;
+-    int width = (s->twoD_dimension >> 16) & 0x1FFF;
+-    int height = s->twoD_dimension & 0xFFFF;
+-    uint32_t color = s->twoD_foreground;
+     int format = (s->twoD_stretch >> 20) & 0x3;
+     int rop_mode = (s->twoD_control >> 15) & 0x1; /* 1 for rop2, else rop3 */
+     /* 1 if rop2 source is the pattern, otherwise the source is the bitmap */
+     int rop2_source_is_pattern = (s->twoD_control >> 14) & 0x1;
+     int rop = s->twoD_control & 0xFF;
+-    uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
++    int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
++    int dst_y = s->twoD_destination & 0xFFFF;
++    int width = (s->twoD_dimension >> 16) & 0x1FFF;
++    int height = s->twoD_dimension & 0xFFFF;
+     uint32_t dst_base = s->twoD_destination_base & 0x03FFFFFF;
+-
+-    /* get frame buffer info */
+-    uint8_t *src = s->local_mem + src_base;
+     uint8_t *dst = s->local_mem + dst_base;
+-    int src_pitch = s->twoD_pitch & 0x1FFF;
+     int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
+     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
+     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
+@@ -758,6 +749,13 @@ static void sm501_2d_operation(SM501State *s)
+ 
+     switch (cmd) {
+     case 0x00: /* copy area */
++    {
++        int src_x = (s->twoD_source >> 16) & 0x01FFF;
++        int src_y = s->twoD_source & 0xFFFF;
++        uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
++        uint8_t *src = s->local_mem + src_base;
++        int src_pitch = s->twoD_pitch & 0x1FFF;
++
+ #define COPY_AREA(_bpp, _pixel_type, rtl) {                                   \
+         int y, x, index_d, index_s;                                           \
+         for (y = 0; y < height; y++) {                              \
+@@ -793,8 +791,11 @@ static void sm501_2d_operation(SM501State *s)
+             break;
+         }
+         break;
+-
++    }
+     case 0x01: /* fill rectangle */
++    {
++        uint32_t color = s->twoD_foreground;
++
+ #define FILL_RECT(_bpp, _pixel_type) {                                      \
+         int y, x;                                                           \
+         for (y = 0; y < height; y++) {                            \
+@@ -819,7 +820,7 @@ static void sm501_2d_operation(SM501State *s)
+             break;
+         }
+         break;
+-
++    }
+     default:
+         qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2D operation: %d\n",
+                       cmd);
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_5.patch
new file mode 100644
index 0000000000..ab09e8b039
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-12829_5.patch
@@ -0,0 +1,266 @@
+From b15a22bbcbe6a78dc3d88fe3134985e4cdd87de4 Mon Sep 17 00:00:00 2001
+From: BALATON Zoltan <balaton@eik.bme.hu>
+Date: Thu, 21 May 2020 21:39:44 +0200
+Subject: [PATCH 5/5] sm501: Replace hand written implementation with pixman
+ where possible
+
+Besides being faster this should also prevent malicious guests to
+abuse 2D engine to overwrite data or cause a crash.
+
+Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
+Message-id: 58666389b6cae256e4e972a32c05cf8aa51bffc0.1590089984.git.balaton@eik.bme.hu
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-12829 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/display/sm501.c | 207 ++++++++++++++++++++++++++-------------------
+ 1 file changed, 119 insertions(+), 88 deletions(-)
+
+diff --git a/hw/display/sm501.c b/hw/display/sm501.c
+index 5ed57703d8..8bf4d111f4 100644
+--- a/hw/display/sm501.c
++++ b/hw/display/sm501.c
+@@ -706,13 +706,12 @@ static void sm501_2d_operation(SM501State *s)
+     /* 1 if rop2 source is the pattern, otherwise the source is the bitmap */
+     int rop2_source_is_pattern = (s->twoD_control >> 14) & 0x1;
+     int rop = s->twoD_control & 0xFF;
+-    int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
+-    int dst_y = s->twoD_destination & 0xFFFF;
+-    int width = (s->twoD_dimension >> 16) & 0x1FFF;
+-    int height = s->twoD_dimension & 0xFFFF;
++    unsigned int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
++    unsigned int dst_y = s->twoD_destination & 0xFFFF;
++    unsigned int width = (s->twoD_dimension >> 16) & 0x1FFF;
++    unsigned int height = s->twoD_dimension & 0xFFFF;
+     uint32_t dst_base = s->twoD_destination_base & 0x03FFFFFF;
+-    uint8_t *dst = s->local_mem + dst_base;
+-    int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
++    unsigned int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
+     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
+     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
+ 
+@@ -721,104 +720,136 @@ static void sm501_2d_operation(SM501State *s)
+         return;
+     }
+ 
+-    if (rop_mode == 0) {
+-        if (rop != 0xcc) {
+-            /* Anything other than plain copies are not supported */
+-            qemu_log_mask(LOG_UNIMP, "sm501: rop3 mode with rop %x is not "
+-                          "supported.\n", rop);
+-        }
+-    } else {
+-        if (rop2_source_is_pattern && rop != 0x5) {
+-            /* For pattern source, we support only inverse dest */
+-            qemu_log_mask(LOG_UNIMP, "sm501: rop2 source being the pattern and "
+-                          "rop %x is not supported.\n", rop);
+-        } else {
+-            if (rop != 0x5 && rop != 0xc) {
+-                /* Anything other than plain copies or inverse dest is not
+-                 * supported */
+-                qemu_log_mask(LOG_UNIMP, "sm501: rop mode %x is not "
+-                              "supported.\n", rop);
+-            }
+-        }
+-    }
+-
+     if (s->twoD_source_base & BIT(27) || s->twoD_destination_base & BIT(27)) {
+         qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
+         return;
+     }
+ 
++    if (!dst_pitch) {
++        qemu_log_mask(LOG_GUEST_ERROR, "sm501: Zero dest pitch.\n");
++        return;
++    }
++
++    if (!width || !height) {
++        qemu_log_mask(LOG_GUEST_ERROR, "sm501: Zero size 2D op.\n");
++        return;
++    }
++
++    if (rtl) {
++        dst_x -= width - 1;
++        dst_y -= height - 1;
++    }
++
++    if (dst_base >= get_local_mem_size(s) || dst_base +
++        (dst_x + width + (dst_y + height) * (dst_pitch + width)) *
++        (1 << format) >= get_local_mem_size(s)) {
++        qemu_log_mask(LOG_GUEST_ERROR, "sm501: 2D op dest is outside vram.\n");
++        return;
++    }
++
+     switch (cmd) {
+-    case 0x00: /* copy area */
++    case 0: /* BitBlt */
+     {
+-        int src_x = (s->twoD_source >> 16) & 0x01FFF;
+-        int src_y = s->twoD_source & 0xFFFF;
++        unsigned int src_x = (s->twoD_source >> 16) & 0x01FFF;
++        unsigned int src_y = s->twoD_source & 0xFFFF;
+         uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
+-        uint8_t *src = s->local_mem + src_base;
+-        int src_pitch = s->twoD_pitch & 0x1FFF;
+-
+-#define COPY_AREA(_bpp, _pixel_type, rtl) {                                   \
+-        int y, x, index_d, index_s;                                           \
+-        for (y = 0; y < height; y++) {                              \
+-            for (x = 0; x < width; x++) {                           \
+-                _pixel_type val;                                              \
+-                                                                              \
+-                if (rtl) {                                                    \
+-                    index_s = ((src_y - y) * src_pitch + src_x - x) * _bpp;   \
+-                    index_d = ((dst_y - y) * dst_pitch + dst_x - x) * _bpp;   \
+-                } else {                                                      \
+-                    index_s = ((src_y + y) * src_pitch + src_x + x) * _bpp;   \
+-                    index_d = ((dst_y + y) * dst_pitch + dst_x + x) * _bpp;   \
+-                }                                                             \
+-                if (rop_mode == 1 && rop == 5) {                              \
+-                    /* Invert dest */                                         \
+-                    val = ~*(_pixel_type *)&dst[index_d];                     \
+-                } else {                                                      \
+-                    val = *(_pixel_type *)&src[index_s];                      \
+-                }                                                             \
+-                *(_pixel_type *)&dst[index_d] = val;                          \
+-            }                                                                 \
+-        }                                                                     \
+-    }
+-        switch (format) {
+-        case 0:
+-            COPY_AREA(1, uint8_t, rtl);
+-            break;
+-        case 1:
+-            COPY_AREA(2, uint16_t, rtl);
+-            break;
+-        case 2:
+-            COPY_AREA(4, uint32_t, rtl);
+-            break;
++        unsigned int src_pitch = s->twoD_pitch & 0x1FFF;
++
++        if (!src_pitch) {
++            qemu_log_mask(LOG_GUEST_ERROR, "sm501: Zero src pitch.\n");
++            return;
++        }
++
++        if (rtl) {
++            src_x -= width - 1;
++            src_y -= height - 1;
++        }
++
++        if (src_base >= get_local_mem_size(s) || src_base +
++            (src_x + width + (src_y + height) * (src_pitch + width)) *
++            (1 << format) >= get_local_mem_size(s)) {
++            qemu_log_mask(LOG_GUEST_ERROR,
++                          "sm501: 2D op src is outside vram.\n");
++            return;
++        }
++
++        if ((rop_mode && rop == 0x5) || (!rop_mode && rop == 0x55)) {
++            /* Invert dest, is there a way to do this with pixman? */
++            unsigned int x, y, i;
++            uint8_t *d = s->local_mem + dst_base;
++
++            for (y = 0; y < height; y++) {
++                i = (dst_x + (dst_y + y) * dst_pitch) * (1 << format);
++                for (x = 0; x < width; x++, i += (1 << format)) {
++                    switch (format) {
++                    case 0:
++                        d[i] = ~d[i];
++                        break;
++                    case 1:
++                        *(uint16_t *)&d[i] = ~*(uint16_t *)&d[i];
++                        break;
++                    case 2:
++                        *(uint32_t *)&d[i] = ~*(uint32_t *)&d[i];
++                        break;
++                    }
++                }
++            }
++        } else {
++            /* Do copy src for unimplemented ops, better than unpainted area */
++            if ((rop_mode && (rop != 0xc || rop2_source_is_pattern)) ||
++                (!rop_mode && rop != 0xcc)) {
++                qemu_log_mask(LOG_UNIMP,
++                              "sm501: rop%d op %x%s not implemented\n",
++                              (rop_mode ? 2 : 3), rop,
++                              (rop2_source_is_pattern ?
++                                  " with pattern source" : ""));
++            }
++            /* Check for overlaps, this could be made more exact */
++            uint32_t sb, se, db, de;
++            sb = src_base + src_x + src_y * (width + src_pitch);
++            se = sb + width + height * (width + src_pitch);
++            db = dst_base + dst_x + dst_y * (width + dst_pitch);
++            de = db + width + height * (width + dst_pitch);
++            if (rtl && ((db >= sb && db <= se) || (de >= sb && de <= se))) {
++                /* regions may overlap: copy via temporary */
++                int llb = width * (1 << format);
++                int tmp_stride = DIV_ROUND_UP(llb, sizeof(uint32_t));
++                uint32_t *tmp = g_malloc(tmp_stride * sizeof(uint32_t) *
++                                         height);
++                pixman_blt((uint32_t *)&s->local_mem[src_base], tmp,
++                           src_pitch * (1 << format) / sizeof(uint32_t),
++                           tmp_stride, 8 * (1 << format), 8 * (1 << format),
++                           src_x, src_y, 0, 0, width, height);
++                pixman_blt(tmp, (uint32_t *)&s->local_mem[dst_base],
++                           tmp_stride,
++                           dst_pitch * (1 << format) / sizeof(uint32_t),
++                           8 * (1 << format), 8 * (1 << format),
++                           0, 0, dst_x, dst_y, width, height);
++                g_free(tmp);
++            } else {
++                pixman_blt((uint32_t *)&s->local_mem[src_base],
++                           (uint32_t *)&s->local_mem[dst_base],
++                           src_pitch * (1 << format) / sizeof(uint32_t),
++                           dst_pitch * (1 << format) / sizeof(uint32_t),
++                           8 * (1 << format), 8 * (1 << format),
++                           src_x, src_y, dst_x, dst_y, width, height);
++            }
+         }
+         break;
+     }
+-    case 0x01: /* fill rectangle */
++    case 1: /* Rectangle Fill */
+     {
+         uint32_t color = s->twoD_foreground;
+ 
+-#define FILL_RECT(_bpp, _pixel_type) {                                      \
+-        int y, x;                                                           \
+-        for (y = 0; y < height; y++) {                            \
+-            for (x = 0; x < width; x++) {                         \
+-                int index = ((dst_y + y) * dst_pitch + dst_x + x) * _bpp;   \
+-                *(_pixel_type *)&dst[index] = (_pixel_type)color;           \
+-            }                                                               \
+-        }                                                                   \
+-    }
+-
+-        switch (format) {
+-        case 0:
+-            FILL_RECT(1, uint8_t);
+-            break;
+-        case 1:
+-            color = cpu_to_le16(color);
+-            FILL_RECT(2, uint16_t);
+-            break;
+-        case 2:
++        if (format == 2) {
+             color = cpu_to_le32(color);
+-            FILL_RECT(4, uint32_t);
+-            break;
++        } else if (format == 1) {
++            color = cpu_to_le16(color);
+         }
++
++        pixman_fill((uint32_t *)&s->local_mem[dst_base],
++                    dst_pitch * (1 << format) / sizeof(uint32_t),
++                    8 * (1 << format), dst_x, dst_y, width, height, color);
+         break;
+     }
+     default:
+-- 
+2.25.1
+
-- 
2.25.1

