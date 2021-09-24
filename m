Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.8936.1632492969021635072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NxaU3O/y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id bb10so6587720plb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IK++NTK90fgEJfzOiGrtZUsVmRrIwobN+ePmkxZgYyk=;
        b=NxaU3O/ymgIQxlvpccWRGRvNskT5VwlKzh4oJN1rrukSG/kxFmlh3fd/jT05surkz5
         SpyQYUFiFGmVZ4fxhtHR6upY0BHBu771gLM19vX9nK7GjYZLw0aLkiv+8iEFyx3mZYqT
         8pQ1EZYrkVKTyma+LyPLqZsVNdOXBB1Sf0Ung2zyyswTuyQT0Fvop6Ren4apKrsWvYz4
         snWAoUfHwNHbjnts7hO27bk/IjsbDrOCxobyWyWPgfSPorsWV7tdt618DuZ3qtku+kPD
         OuQ1oMnmAzaqIEuVwDYw6gDP79kSgeSYAlhF7kCHaZacMcyl3mvJoDs4rfcFuimfTfI3
         4vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IK++NTK90fgEJfzOiGrtZUsVmRrIwobN+ePmkxZgYyk=;
        b=Nvc1RzgNsbJiG7LhVdoU9ta4Ee+TJqdAb9RMfZqTjkl/8JqwWrXHHVf0oS3WD2yj+C
         A/KW7kTk5lFMwllblAq2JDyvIjMdCU1tNCeUotjJWW990QMYbH3ERq6MU1ueZywpexeU
         LjoFPKULgZ77LQXDCJ6hVXJWFk2HRlCfcdqbDa1F5Z9aRotO196hsgY5VZ8WuXlsl1Uw
         /ZQO79gJfQ14rOeZefuf5Ss0IUiOvQ35/wd37qrDAGiDpjeGIjn3qHp80xZounuRoihV
         rSLsYKOo9JWGYRnCtZlETPIMV1LYBeYdHC1zW//RLsSOt98I40Wqke52/TrXrTEzDuTU
         karw==
X-Gm-Message-State: AOAM531hkE7Slf/tyyMA8D+6o+e4T3Q2MkUdOo6ND6W1CtQYlxQiWLq0
	8h3ZmlqbAo0jQ0t7SKrZFVc+ZNLXmd9tFRgQRK0=
X-Google-Smtp-Source: ABdhPJwxJ6pw9HP+xzADTZrR1+AN316jjcLZUJC+NCVCFmVcEk4E0MsquKr+Pr8yvjQ9aukWGNc+zA==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id w16-20020a170902a710b029012b9b9fc461mr9141933plq.59.1632492968029;
        Fri, 24 Sep 2021 07:16:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/25] qemu: Security fix for CVE-2020-28916
Date: Fri, 24 Sep 2021 04:15:10 -1000
Message-Id: <4a21ddae5436f6fdd672c7f32414b8794a91e643.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 107262
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=c2cb511634012344e3d0fe49a037a33b12d8a98a
ChangeID: 3024b894ab045c1a74ab2276359d5e599ec9e822
Description:

Affects qemu < 5.0.0

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-28916.patch            | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3113d638d7..211c03e57b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -90,6 +90,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-12829_4.patch \
            file://CVE-2020-12829_5.patch \
            file://CVE-2020-27617.patch \
+           file://CVE-2020-28916.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
new file mode 100644
index 0000000000..756b1c1495
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
@@ -0,0 +1,48 @@
+From c2cb511634012344e3d0fe49a037a33b12d8a98a Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 11 Nov 2020 18:36:36 +0530
+Subject: [PATCH] hw/net/e1000e: advance desc_offset in case of null descriptor
+
+While receiving packets via e1000e_write_packet_to_guest() routine,
+'desc_offset' is advanced only when RX descriptor is processed. And
+RX descriptor is not processed if it has NULL buffer address.
+This may lead to an infinite loop condition. Increament 'desc_offset'
+to process next descriptor in the ring to avoid infinite loop.
+
+Reported-by: Cheol-woo Myung <330cjfdn@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-28916
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/net/e1000e_core.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
+index d8b9e4b2f4..095c01ebc6 100644
+--- a/hw/net/e1000e_core.c
++++ b/hw/net/e1000e_core.c
+@@ -1596,13 +1596,13 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
+                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
+                 }
+             }
+-            desc_offset += desc_size;
+-            if (desc_offset >= total_size) {
+-                is_last = true;
+-            }
+         } else { /* as per intel docs; skip descriptors with null buf addr */
+             trace_e1000e_rx_null_descriptor();
+         }
++        desc_offset += desc_size;
++        if (desc_offset >= total_size) {
++            is_last = true;
++        }
+ 
+         e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
+                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
+-- 
+2.25.1
+
-- 
2.25.1

