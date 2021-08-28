Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web12.157.1630174357968412126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TKrdOoKQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id j15so10918587ila.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NMfOJXSe20n4hJe+HBnu9ivbQnHRP6TIWkvY1gFFGV8=;
        b=TKrdOoKQDdO+nqebtEUtgZeEopufUBhI1/qlayI4pYN8Yq9KD0QdjIHl/v+kxUweuC
         8/AS0YZXKblwzQmf9fflYFrOEXmU1s0KSHFrwqc3dGCNgw3vaRluTI5WZ3l4BFaaI1yq
         3vkYtkQlO5m/9Jb0ownz/xyZViY6TdjHG4M/Z2qKgeF8d0TWLQWFWH4Qt9rVmKK5d5ys
         a2tY1fsQdjOeIRFlcloQL25JKj5J63t4eHJxgc/+mmoIefWnpQfaV8+R08/vxcQvlMng
         lIGhiCNIGV/rIruXcJozJj6nKKsqaw3HPQ5opwOxFEPmJxxDukV7cYWfLTVkwgxW58OD
         5E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMfOJXSe20n4hJe+HBnu9ivbQnHRP6TIWkvY1gFFGV8=;
        b=XTBn2XlNmEXNu38Gvu8408pTzAKCEWw5FTOIkZ7af48xDfgqNPc1uBG2/LseUXM5eZ
         cRjEsUaAAY+8aHE0yuZRhwc7sRM37XxOH3wJCZZnab+fbOScN9l5TJmLgFfG72nwM67o
         ntB3VMEUdZvJPmxx8Fe5E45JYPEajKe7UO11x2ehGPzo0W3NJCJasKq9tFlT4iTnCyJb
         q/67VNo1/b+IWuX2Heae7v1OjYWN/cxA/WyXNDEO0md4VDiKjo6V0LAlBtlGZP3UUYxS
         bCQ1eDj/xFBF1GGJhQvQMXtckwM7iDqGA07+aXCgVn1JnFf2+IENJsFsWg7kOMFLtXtr
         2dKQ==
X-Gm-Message-State: AOAM5315EQaQvaVTR419zzguiEUHyjlj5m/MdgZ8ac6q3rcz0OdMA87Y
	AXzFPv2ruY8CJ3Tt48AuODtnDbWdh6iGHW33
X-Google-Smtp-Source: ABdhPJzz5qtUK49DEDmyNzh5gxyR5iml5AL1IGo6L+XVITjpub9EEn9uPatLQu/fQfMR9YxIGLLVHw==
X-Received: by 2002:a92:ca89:: with SMTP id t9mr11097245ilo.178.1630174356052;
        Sat, 28 Aug 2021 11:12:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/36] qemu: Security fix CVE-2020-25624
Date: Sat, 28 Aug 2021 08:10:57 -1000
Message-Id: <853f4a4755d053cc4defa65cda5e317e3e28bc3f.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 106958
Type: Security Fix
Disposition: Backport from qemu.org
ChangeID: 9d0c21c4ff5dc12ba623685cd7ae4d4bc294f519
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2020-25624_1.patch          |  87 +++++++++++++++
 .../qemu/qemu/CVE-2020-25624_2.patch          | 101 ++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25624_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25624_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a33008670b..6978be951e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -56,6 +56,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-20203.patch \
            file://CVE-2021-3392.patch \
            file://CVE-2020-25085.patch \
+           file://CVE-2020-25624_1.patch \
+           file://CVE-2020-25624_2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25624_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25624_1.patch
new file mode 100644
index 0000000000..a46b5be193
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25624_1.patch
@@ -0,0 +1,87 @@
+From fbec359e9279ce78908b9f2af2c264e7448336af Mon Sep 17 00:00:00 2001
+From: Guenter Roeck <linux@roeck-us.net>
+Date: Mon, 17 Feb 2020 12:48:10 -0800
+Subject: [PATCH] hw: usb: hcd-ohci: Move OHCISysBusState and TYPE_SYSBUS_OHCI
+ to include file
+
+We need to be able to use OHCISysBusState outside hcd-ohci.c, so move it
+to its include file.
+
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Guenter Roeck <linux@roeck-us.net>
+Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
+Message-id: 20200217204812.9857-2-linux@roeck-us.net
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25624 patch #1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/usb/hcd-ohci.c | 15 ---------------
+ hw/usb/hcd-ohci.h | 16 ++++++++++++++++
+ 2 files changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
+index 8a94bd004a..1e6e85e86a 100644
+--- a/hw/usb/hcd-ohci.c
++++ b/hw/usb/hcd-ohci.c
+@@ -1870,21 +1870,6 @@ void ohci_sysbus_die(struct OHCIState *ohci)
+     ohci_bus_stop(ohci);
+ }
+ 
+-#define TYPE_SYSBUS_OHCI "sysbus-ohci"
+-#define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SYSBUS_OHCI)
+-
+-typedef struct {
+-    /*< private >*/
+-    SysBusDevice parent_obj;
+-    /*< public >*/
+-
+-    OHCIState ohci;
+-    char *masterbus;
+-    uint32_t num_ports;
+-    uint32_t firstport;
+-    dma_addr_t dma_offset;
+-} OHCISysBusState;
+-
+ static void ohci_realize_pxa(DeviceState *dev, Error **errp)
+ {
+     OHCISysBusState *s = SYSBUS_OHCI(dev);
+diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
+index 16e3f1e13a..5c8819aedf 100644
+--- a/hw/usb/hcd-ohci.h
++++ b/hw/usb/hcd-ohci.h
+@@ -22,6 +22,7 @@
+ #define HCD_OHCI_H
+ 
+ #include "sysemu/dma.h"
++#include "hw/usb.h"
+ 
+ /* Number of Downstream Ports on the root hub: */
+ #define OHCI_MAX_PORTS 15
+@@ -90,6 +91,21 @@ typedef struct OHCIState {
+     void (*ohci_die)(struct OHCIState *ohci);
+ } OHCIState;
+ 
++#define TYPE_SYSBUS_OHCI "sysbus-ohci"
++#define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SYSBUS_OHCI)
++
++typedef struct {
++    /*< private >*/
++    SysBusDevice parent_obj;
++    /*< public >*/
++
++    OHCIState ohci;
++    char *masterbus;
++    uint32_t num_ports;
++    uint32_t firstport;
++    dma_addr_t dma_offset;
++} OHCISysBusState;
++
+ extern const VMStateDescription vmstate_ohci_state;
+ 
+ void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports,
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25624_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25624_2.patch
new file mode 100644
index 0000000000..8c1275b2f4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25624_2.patch
@@ -0,0 +1,101 @@
+From 1328fe0c32d5474604105b8105310e944976b058 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 15 Sep 2020 23:52:58 +0530
+Subject: [PATCH] hw: usb: hcd-ohci: check len and frame_number variables
+
+While servicing the OHCI transfer descriptors(TD), OHCI host
+controller derives variables 'start_addr', 'end_addr', 'len'
+etc. from values supplied by the host controller driver.
+Host controller driver may supply values such that using
+above variables leads to out-of-bounds access issues.
+Add checks to avoid them.
+
+AddressSanitizer: stack-buffer-overflow on address 0x7ffd53af76a0
+  READ of size 2 at 0x7ffd53af76a0 thread T0
+  #0 ohci_service_iso_td ../hw/usb/hcd-ohci.c:734
+  #1 ohci_service_ed_list ../hw/usb/hcd-ohci.c:1180
+  #2 ohci_process_lists ../hw/usb/hcd-ohci.c:1214
+  #3 ohci_frame_boundary ../hw/usb/hcd-ohci.c:1257
+  #4 timerlist_run_timers ../util/qemu-timer.c:572
+  #5 qemu_clock_run_timers ../util/qemu-timer.c:586
+  #6 qemu_clock_run_all_timers ../util/qemu-timer.c:672
+  #7 main_loop_wait ../util/main-loop.c:527
+  #8 qemu_main_loop ../softmmu/vl.c:1676
+  #9 main ../softmmu/main.c:50
+
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Reported-by: Yongkang Jia <j_kangel@163.com>
+Reported-by: Yi Ren <yunye.ry@alibaba-inc.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20200915182259.68522-2-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25624 patch #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/usb/hcd-ohci.c | 24 ++++++++++++++++++++++--
+ 1 file changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
+index 1e6e85e86a..9dc59101f9 100644
+--- a/hw/usb/hcd-ohci.c
++++ b/hw/usb/hcd-ohci.c
+@@ -731,7 +731,11 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
+     }
+ 
+     start_offset = iso_td.offset[relative_frame_number];
+-    next_offset = iso_td.offset[relative_frame_number + 1];
++    if (relative_frame_number < frame_count) {
++        next_offset = iso_td.offset[relative_frame_number + 1];
++    } else {
++        next_offset = iso_td.be;
++    }
+ 
+     if (!(OHCI_BM(start_offset, TD_PSW_CC) & 0xe) || 
+         ((relative_frame_number < frame_count) && 
+@@ -764,7 +768,12 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
+         }
+     } else {
+         /* Last packet in the ISO TD */
+-        end_addr = iso_td.be;
++        end_addr = next_offset;
++    }
++
++    if (start_addr > end_addr) {
++        trace_usb_ohci_iso_td_bad_cc_overrun(start_addr, end_addr);
++        return 1;
+     }
+ 
+     if ((start_addr & OHCI_PAGE_MASK) != (end_addr & OHCI_PAGE_MASK)) {
+@@ -773,6 +782,9 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
+     } else {
+         len = end_addr - start_addr + 1;
+     }
++    if (len > sizeof(ohci->usb_buf)) {
++        len = sizeof(ohci->usb_buf);
++    }
+ 
+     if (len && dir != OHCI_TD_DIR_IN) {
+         if (ohci_copy_iso_td(ohci, start_addr, end_addr, ohci->usb_buf, len,
+@@ -975,8 +987,16 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
+         if ((td.cbp & 0xfffff000) != (td.be & 0xfffff000)) {
+             len = (td.be & 0xfff) + 0x1001 - (td.cbp & 0xfff);
+         } else {
++            if (td.cbp > td.be) {
++                trace_usb_ohci_iso_td_bad_cc_overrun(td.cbp, td.be);
++                ohci_die(ohci);
++                return 1;
++            }
+             len = (td.be - td.cbp) + 1;
+         }
++        if (len > sizeof(ohci->usb_buf)) {
++            len = sizeof(ohci->usb_buf);
++        }
+ 
+         pktlen = len;
+         if (len && dir != OHCI_TD_DIR_IN) {
+-- 
+2.25.1
+
-- 
2.25.1

