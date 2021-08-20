Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.5382.1629503723568039430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 16:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gfUPj48g;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so14925839pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 16:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H3ZdNI8h/hTO/1LABCQ65Hpp8f2pOBFy09RqMfytqJ0=;
        b=gfUPj48ggy8lUeVkVEsBZe0hMSE1Fsx6agxn2G5harljuq2PmJ2wMNAkD1UvMSm5lZ
         tcRKkpQfu9rFlaBGoFtFbmVMp4uXUWP4NtToxVw4lY5/HJP+8lPuL7XI+B8zNYdsBbU9
         co7qgxGIxNAhjUccAyi3lrRQKWbM+7IxmHVMyNgw/jCt4N9ZSXmOzkXnT/3U/E+riBPk
         3uVqjQvH+LpSPLScNJn6b7MpotNCQ1mRrRKcp+Uw8r0MGFRnNCXVOOiD+466HzHDYjsa
         jTfPonTbjSTA94ccRrb5fUgcOhsQQNAd+zojpjOqvicxhz9NqLjFQhrON7oi1up4a1aU
         wAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H3ZdNI8h/hTO/1LABCQ65Hpp8f2pOBFy09RqMfytqJ0=;
        b=sc7fD+ry6/61/jFs4yP87vpW1Rz0iR+1bSlhz3AO8y8aPeGXSodNINkumOFH36lL+G
         PE+TIz3UalaUYipS8wcGyrr+otYDKwt6/S2Yi9my/qWQWKkUDMtTuAcoAGkLurQ5yikD
         g24wD771P71dmBR41YXfqoy9nNejuqrmnJee4T/ABREYoZro9G5h/X+Gm1PXyX0Havnw
         yl/cGZifrOn7P97PJHNZIWbabfIBSu1He4qsFCJ9MJGuil6kR6a0O1gVCwxa+DGnsP0T
         txsSyAJG+usR28S3HJfJ5VOmiaT1FhfAAQP0eTZcK/I3ZWJTMsfib3xaTaWzmHHuKPHH
         IVOQ==
X-Gm-Message-State: AOAM531cTQkuxPBUX20w8eM5AVB95bxSZZOnmwUGfymVKoEJiWSAH4r9
	ZP5TNgvLO4SQKvoZOMc9XnyEOAxu8wk=
X-Google-Smtp-Source: ABdhPJyjvHI1xCCZhHxgGonbBj3AP1j6NQKc/SnzlVLyS9GNY9XbVWrT0QUqHMl3fz77lslzCSC7ew==
X-Received: by 2002:a17:90b:3604:: with SMTP id ml4mr7065528pjb.82.1629503722937;
        Fri, 20 Aug 2021 16:55:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id i11sm9634705pgo.25.2021.08.20.16.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:55:22 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 3/7] Qemu: Security fix for CVE-2020-25625/2021-3409/2020-17380
Date: Fri, 20 Aug 2021 16:55:15 -0700
Message-Id: <20210820235519.593218-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820235519.593218-1-akuster808@gmail.com>
References: <20210820235519.593218-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: Qemu.org
MR: 105781, 109964, 108621
Type: Security Fix
Disposition: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg05905.html
ChangeID: 0acf082885e7ab3ac2fb41d6e503449869dd46a8
Description:

This address:
CVE-2020-25625
and its two fixes address an incomplete fix for CVE-2020-25625
CVE-2021-3409
CVE-2020-17380

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-25625.patch            | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6978be951e..76bfb4fcf9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -58,6 +58,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-25085.patch \
            file://CVE-2020-25624_1.patch \
            file://CVE-2020-25624_2.patch \
+           file://CVE-2020-25625.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch
new file mode 100644
index 0000000000..374d7c4562
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch
@@ -0,0 +1,42 @@
+From 1be90ebecc95b09a2ee5af3f60c412b45a766c4f Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 15 Sep 2020 23:52:59 +0530
+Subject: [PATCH] hw: usb: hcd-ohci: check for processed TD before retire
+
+While servicing OHCI transfer descriptors(TD), ohci_service_iso_td
+retires a TD if it has passed its time frame. It does not check if
+the TD was already processed once and holds an error code in TD_CC.
+It may happen if the TD list has a loop. Add check to avoid an
+infinite loop condition.
+
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Message-id: 20200915182259.68522-3-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25625
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/usb/hcd-ohci.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
+index 9dc59101f9..8b912e95d3 100644
+--- a/hw/usb/hcd-ohci.c
++++ b/hw/usb/hcd-ohci.c
+@@ -691,6 +691,10 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
+            the next ISO TD of the same ED */
+         trace_usb_ohci_iso_td_relative_frame_number_big(relative_frame_number,
+                                                         frame_count);
++        if (OHCI_CC_DATAOVERRUN == OHCI_BM(iso_td.flags, TD_CC)) {
++            /* avoid infinite loop */
++            return 1;
++        }
+         OHCI_SET_BM(iso_td.flags, TD_CC, OHCI_CC_DATAOVERRUN);
+         ed->head &= ~OHCI_DPTR_MASK;
+         ed->head |= (iso_td.next & OHCI_DPTR_MASK);
+-- 
+2.25.1
+
-- 
2.25.1

