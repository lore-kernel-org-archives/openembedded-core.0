Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.61406.1600092731003019454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KUONe0O+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id b124so12704031pfg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=kiMh6+xrW/MpGpoH9PuZG491I+KOIcoWnY0gaHcuO7o=;
        b=KUONe0O+txf8kXGu9vu9WtxVKQuN27A0pMO4i7R1zTJeeYtDEdPxTN00mvyXc9uvUq
         t1JCS1BnpP4/S7VqDFFkJEBY98/OeNAusMl6MzJFyHbWKkIduRmjODAq8WWL24aUE2pu
         RgtHXl8+VQdzTdgrtCr0MN7Emy6gu7DNTfqeP980gSVWnVL27dOy8hsIl4J7CKgT75wn
         t280K+vguZmM+TqkgZJU3TNuawftYYXyCTLwf+FFg0lrqaeNF/bFyDRxNK8OiJVXLhr3
         GIDCU0rkHSD8lQ8uPjA846Cu6ng7f8ZpizGAhZOyCvcIXImO+JIZv64rpQ8nqxVgz2Tj
         q85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=kiMh6+xrW/MpGpoH9PuZG491I+KOIcoWnY0gaHcuO7o=;
        b=cLwlTT+UoEXKKAPYsbwSZlbTV/GI6N7i2BODXC1wTK9+i97jYDRifH9xVGB2uO8sh+
         gDSMHv9bDLWfU7U393kQfMiU/d1Yz9oAX7QO8w0sDBxOn4xcumWFBgL46B3La3GY/hrM
         QFhmaF7fmJyfKLT+0EXXNDnJeHYDqSKkXz1RWFF1ebdjcdKwtjswhTeJ6ptPre1cW4V/
         Nazx9GNrizz4URypgl7b1phWAbPltWHnQR2ZFiq1EUCdcx8OHwS4izGjJld04YErxXe7
         1sP6mz+HHJhUpPPPcJi9eY8yIXOBfuValhywwrrX+i4d3AiPoqIwb4DXPQ1HM0yWoJ1K
         4KAQ==
X-Gm-Message-State: AOAM533KmHYfUH80Hw2f1GTx1Q124SKZQuMlHcsC5s2UbS+q3lPtVN5S
	5q1q7HYnrfe69AnpGhGU4mCYe72/ksMFLMPqynE=
X-Google-Smtp-Source: ABdhPJxTDdcvWpqd88H8u0h5XjV8mvyHnOVCVLB+yInrf8hUOEWpwMp9lAN26WB5K1w/joJvRU59+A==
X-Received: by 2002:a17:902:aa8d:: with SMTP id d13mr14714939plr.124.1600092730082;
        Mon, 14 Sep 2020 07:12:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/24] qemu: fix CVE-2020-14364 CVE-2020-14415
Date: Mon, 14 Sep 2020 04:11:21 -1000
Message-Id: <1a150f0df36892283686e3e1afb30a7742c8e252.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2020-14364.patch            | 93 +++++++++++++++++++
 .../qemu/qemu/CVE-2020-14415.patch            | 37 ++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 49dbb1c13d..e0ea5ad477 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-13800.patch \
 	   file://CVE-2020-13362.patch \
 	   file://CVE-2020-15863.patch \
+	   file://CVE-2020-14364.patch \
+	   file://CVE-2020-14415.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
new file mode 100644
index 0000000000..8333025a32
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
@@ -0,0 +1,93 @@
+From b946434f2659a182afc17e155be6791ebfb302eb Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Tue, 25 Aug 2020 07:36:36 +0200
+Subject: [PATCH] usb: fix setup_len init (CVE-2020-14364)
+
+Store calculated setup_len in a local variable, verify it, and only
+write it to the struct (USBDevice->setup_len) in case it passed the
+sanity checks.
+
+This prevents other code (do_token_{in,out} functions specifically)
+from working with invalid USBDevice->setup_len values and overrunning
+the USBDevice->setup_buf[] buffer.
+
+Fixes: CVE-2020-14364
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Tested-by: Gonglei <arei.gonglei@huawei.com>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Message-id: 20200825053636.29648-1-kraxel@redhat.com
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=qemu.git;a=patch;h=b946434f2659a182afc17e155be6791ebfb302eb]
+CVE: CVE-2020-14364
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/usb/core.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/hw/usb/core.c b/hw/usb/core.c
+index 5abd128..5234dcc 100644
+--- a/hw/usb/core.c
++++ b/hw/usb/core.c
+@@ -129,6 +129,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
+ static void do_token_setup(USBDevice *s, USBPacket *p)
+ {
+     int request, value, index;
++    unsigned int setup_len;
+ 
+     if (p->iov.size != 8) {
+         p->status = USB_RET_STALL;
+@@ -138,14 +139,15 @@ static void do_token_setup(USBDevice *s, USBPacket *p)
+     usb_packet_copy(p, s->setup_buf, p->iov.size);
+     s->setup_index = 0;
+     p->actual_length = 0;
+-    s->setup_len   = (s->setup_buf[7] << 8) | s->setup_buf[6];
+-    if (s->setup_len > sizeof(s->data_buf)) {
++    setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
++    if (setup_len > sizeof(s->data_buf)) {
+         fprintf(stderr,
+                 "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+-                s->setup_len, sizeof(s->data_buf));
++                setup_len, sizeof(s->data_buf));
+         p->status = USB_RET_STALL;
+         return;
+     }
++    s->setup_len = setup_len;
+ 
+     request = (s->setup_buf[0] << 8) | s->setup_buf[1];
+     value   = (s->setup_buf[3] << 8) | s->setup_buf[2];
+@@ -259,26 +261,28 @@ static void do_token_out(USBDevice *s, USBPacket *p)
+ static void do_parameter(USBDevice *s, USBPacket *p)
+ {
+     int i, request, value, index;
++    unsigned int setup_len;
+ 
+     for (i = 0; i < 8; i++) {
+         s->setup_buf[i] = p->parameter >> (i*8);
+     }
+ 
+     s->setup_state = SETUP_STATE_PARAM;
+-    s->setup_len   = (s->setup_buf[7] << 8) | s->setup_buf[6];
+     s->setup_index = 0;
+ 
+     request = (s->setup_buf[0] << 8) | s->setup_buf[1];
+     value   = (s->setup_buf[3] << 8) | s->setup_buf[2];
+     index   = (s->setup_buf[5] << 8) | s->setup_buf[4];
+ 
+-    if (s->setup_len > sizeof(s->data_buf)) {
++    setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
++    if (setup_len > sizeof(s->data_buf)) {
+         fprintf(stderr,
+                 "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
+-                s->setup_len, sizeof(s->data_buf));
++                setup_len, sizeof(s->data_buf));
+         p->status = USB_RET_STALL;
+         return;
+     }
++    s->setup_len = setup_len;
+ 
+     if (p->pid == USB_TOKEN_OUT) {
+         usb_packet_copy(p, s->data_buf, s->setup_len);
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch
new file mode 100644
index 0000000000..dca2f90a49
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch
@@ -0,0 +1,37 @@
+From 7a4ede0047a8613b0e3b72c9d351038f013dd357 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 20 Jan 2020 11:18:04 +0100
+Subject: [PATCH] audio/oss: fix buffer pos calculation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Fixes: 3ba4066d085f ("ossaudio: port to the new audio backend api")
+Reported-by: ziming zhang <ezrakiez@gmail.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Message-Id: <20200120101804.29578-1-kraxel@redhat.com>
+Reviewed-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=7a4ede0047a8613b0e3b72c9d351038f013dd357]
+CVE: CVE-2020-14415
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ audio/ossaudio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/audio/ossaudio.c b/audio/ossaudio.c
+index c43faee..9456491 100644
+--- a/audio/ossaudio.c
++++ b/audio/ossaudio.c
+@@ -420,7 +420,7 @@ static size_t oss_write(HWVoiceOut *hw, void *buf, size_t len)
+             size_t to_copy = MIN(len, hw->size_emul - hw->pos_emul);
+             memcpy(hw->buf_emul + hw->pos_emul, buf, to_copy);
+ 
+-            hw->pos_emul = (hw->pos_emul + to_copy) % hw->pos_emul;
++            hw->pos_emul = (hw->pos_emul + to_copy) % hw->size_emul;
+             buf += to_copy;
+             len -= to_copy;
+         }
+-- 
+1.8.3.1
+
-- 
2.17.1

