Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.177.1630174362938256272
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fCwatCpa;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id u7so10883060ilk.7
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bYS3IP0hUl+/pAcWaqDbuvmLy0CWBFs4+Qa7DOy7vJc=;
        b=fCwatCpak+pLHPPzwAZUjFtoy0MBq8JkovyvxjHjT9Fs3JF81/MYAgRpPwIsn59F6L
         CpBvrfL6ErlvNPPrqUqLCSsJEgWyDev6mO0QuJu3HKk1uchSzZYoW0VS1exuHfV20LJo
         6XcocTGt9Un5jBAoRzIKK++ibPRBtu0LRYkK5ESwkIclt+YaTgJwpO6FEPJq+DPtpEtg
         b2RywMS1iKtcJkZ54P48QGc/s8vzJuOPFYWh4gVYpm+WVJ4/QoOc0fast/NHkizOV/p4
         GEDCWgvTuo0phS0hvdjHIPIf6XoPruo/Y/NKHaru34Ibs6lTx3iSXm74xlbeNBePmoUm
         lZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYS3IP0hUl+/pAcWaqDbuvmLy0CWBFs4+Qa7DOy7vJc=;
        b=Tz/N2NqTbJji20snMnDcPBzdJiIFgp5TMk574dNjdEuynV5B6jpg/mmOtmrmQy1Ety
         Y2qTCsgciZUipRCGo+P8VjACSsnRFAGs9VmpWuG1xWG06VIJdX2PmyqVzNjZ9BsrdRGh
         xXHgusOxf4QMa6uRN/ejpze8A+e/CZm/4sucmEFxt+ef8Oc72F9kKfGpplowd9kaAsZl
         OwpD4F5Boa8j9W2+p6UcOUl1FTDCdfQbdH8QV9Pdo3EHPL60siHbVCdsvy9ooKuIT7N3
         xIWc4NeaG6Kt7gJTEXc6QDCpROT3SmT6Pg/aW1uv8BB+NsV/p+WfJ67gEWbUygVjEtH7
         Ng+A==
X-Gm-Message-State: AOAM530CMBS5wdbe+EtbwaxAT3yETZmrJYQwXcOzWWpVjjYhwrgbHPsI
	8mJD8E9+x5kkUntfLi3txJYoYhIDtYeLQuwT
X-Google-Smtp-Source: ABdhPJzxdfMwb8RqPjDfWITe3cp+2Hu4r+5wNborUYxPvrzcEaYIux3yxwpmgIK6E6gKmlvRjQ7LSA==
X-Received: by 2002:a92:6e05:: with SMTP id j5mr10634202ilc.252.1630174361133;
        Sat, 28 Aug 2021 11:12:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/36] Qemu: Security fix for CVE-2020-25625/2021-3409/2020-17380
Date: Sat, 28 Aug 2021 08:10:58 -1000
Message-Id: <721a14f13005dc0b5bddaac131c444b97be700a8.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

