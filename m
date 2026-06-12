Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE9BCD98CC
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 03:41:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63056.1781235704631007553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 20:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ELR+87oL;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so9059605ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 20:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781235704; x=1781840504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yF3f7r5lNv2LtkZeVo37a/XBjQ/H2B4oTdGhBRQ7Kb4=;
        b=ELR+87oLqR/+1EWdLWleGikUYONp0hK2fn0Q8LDTz73q9Dqv7AXaDZIyxlIw9HdehW
         +DhFdQmFHG8+9WZ897fyi3uKUQHToE0lrS3mdSy4Bw5X7uawH5p7GAPfLkn0omN6H9/Q
         wB8o17joOsd1uE4aiPFcRyrqx409TlUguyZ6cKiu3rGIpN3Ks0Q1Um1ewOtY8IlrRHDw
         JpHP00+AbQYssZp0qAjtRR51r0zq69tpX+979LIng362J26Mo6CAUhcNgpM+ZF9/TqL1
         DrJslGyXkpbsEybpSjYSE9p752K11Mh3yWBRQQx1tWCqfHZaianBgaLRJOcIOUgNuvKR
         Lu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781235704; x=1781840504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yF3f7r5lNv2LtkZeVo37a/XBjQ/H2B4oTdGhBRQ7Kb4=;
        b=dYyXhg8eytIBNgS83+QPLcOYbVC+FGFHbjRwvVnqu7ArFPawtq3ryVHuHszeqw5wzO
         Yo76lp36kq+yIfCkEq2W6bnjA79bsexe1Yrt2TqK5oIO4HrrKeFzxUNsjbQcFrUk5HGm
         mFLjRpRlv2jJJm/yRuXogzYaT1BDlSPAv5HemlCjPshOzmKqir9/lgdqAIaDd+lRDtGo
         1wUgyKzEdMeOot2Vn7YjVIol3k2MX823tl+xJxcMg8DJY/c1BpMLf3FNGRBLmcZhAVC5
         SdxQeuN7ujMtyPG8gadVGeyl8TofgWaYQYex7Y5Y9nzfnglSSgdic/nLjgga43138FYA
         6KkA==
X-Gm-Message-State: AOJu0YxNdYWWxaAKizrDtklv41efe/LFuRKaSZe5hcp7lcXygDWQfoZv
	0UFW686NKu5tkeXC7GIWMCyVgMrKK99VZ1zTRjOcZRg1d01OAr8ORZJSykjy+Q==
X-Gm-Gg: Acq92OFsJ67LAgTRCURm4mDqiIJ18EGGhzOPSolXKIB9LauvhrQ1Of2rsJIpA9O8fFJ
	BvZvnuMFrVeq1QIIfQ6s2HLkAMsWdygWf8D3wQLTybOkZnbdO3idAe7/keBFTgshkMS0qTCbzbt
	J6qbE2X1G0xiN4OfPalupcZxmG091WqkNx1mKo0gpIWasdRCGigv3m9pibjSQh/sWAoWmH2IYhl
	eMlg3ibGTFLvbv/MHn+D8Pte1XVF/01fJDw2jAYCM56Ig/wjdx+io2ocH2GAaf+WlRtDUZXV0Du
	BhgDD4hcFwN3FvgK9KDRJwVBd6pAZ+g4qQSd9pfoJNXoRXist9frFWAePkIcvEnPyknfk4gUcnA
	Z1zBoSqKKp0ml4EG0RAnNTyBER4b+0Zt1nh/0hp/PPvc5rIbeEaR6hLZyxuBgfEpKQ3CJL2monx
	D834qN8AOkupCYrOs/wl8JBveAj0Eg/QPuGLXFxHc9uC6QE8Axkmu4zmeXoVwZ
X-Received: by 2002:a17:902:ccc7:b0:2c0:fa52:1c47 with SMTP id d9443c01a7336-2c3fd514310mr12866285ad.25.1781235703562;
        Thu, 11 Jun 2026 20:41:43 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm4310305ad.6.2026.06.11.20.41.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 20:41:43 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH] tiff: fix CVE-2026-4775
Date: Fri, 12 Jun 2026 09:11:33 +0530
Message-Id: <20260612034133.804411-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 03:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238590

Fix CVE-2026-4775

Reference: https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc21e714950a4af5bf89f023c

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../libtiff/tiff/CVE-2026-4775.patch          | 59 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
new file mode 100644
index 0000000000..ed5f0714a6
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
@@ -0,0 +1,59 @@
+From 782a11d6b5b61c6dc21e714950a4af5bf89f023c Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 22 Feb 2026 23:32:47 +0100
+Subject: [PATCH] TIFFReadRGBAImage(): prevent integer overflow and later heap
+ overflow on images with huge width in YCbCr tile decoding functions
+
+Fixes https://gitlab.com/libtiff/libtiff/-/issues/787
+
+CVE: CVE-2026-4775
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc21e714950a4af5bf89f023c]
+
+Signed-off-by: Naman Jain <namanj1@kpit.com>
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 4543dddae..fa82d0910 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -2224,7 +2224,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+     uint32_t *cp1 = cp + w + toskew;
+     uint32_t *cp2 = cp1 + w + toskew;
+     uint32_t *cp3 = cp2 + w + toskew;
+-    int32_t incr = 3 * w + 4 * toskew;
++    const tmsize_t incr = 3 * (tmsize_t)w + 4 * (tmsize_t)toskew;
+ 
+     (void)y;
+     /* adjust fromskew */
+@@ -2364,7 +2364,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr42tile)
+ {
+     uint32_t *cp1 = cp + w + toskew;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+ 
+     (void)y;
+     fromskew = (fromskew / 4) * (4 * 2 + 2);
+@@ -2522,7 +2522,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr41tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr22tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 2) * (2 * 2 + 2);
+     cp2 = cp + w + toskew;
+@@ -2625,7 +2625,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr21tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr12tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 1) * (1 * 2 + 2);
+     cp2 = cp + w + toskew;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 07540692fc..fca846589f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-52356.patch \
            file://CVE-2024-7006.patch \
            file://CVE-2025-9900.patch \
+           file://CVE-2026-4775.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
-- 
2.34.1


