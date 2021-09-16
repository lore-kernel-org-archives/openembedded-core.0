Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.4488.1631750664500451049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 17:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jht5EfbF;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id m21-20020a17090a859500b00197688449c4so3499856pjn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/zLSrDazNzxEV+xXz+3peV7lknvqsn60n/RnDtHfyr0=;
        b=jht5EfbFZGfNIpJ0IHAaCJ3aaAqFjkKjDNJG0xdnZ4IXNptmBJoV9mrXu3L8tqUTRj
         AGZswfKpZe3xyRQuAh4prbUlj2u3OkyyDFB+/4G8xc8JSWjY7MJ1WuHZ3/gm/qGblImv
         wZx1O3NazQThPFHb9zTDoilyv4C+Mez4r6V+/NCDW99enqCTefhu3ssko3NC9q/oTQ4Y
         rY8Pju8/VRSrewASCTXHlBpaAGT4nZXPCwURx79HfV5fuLpbjVCDaNKCfGg2dPtB7Qjt
         4mITIUTJz/q5ZCMK4Qf8onyODNE/cRBPRb67auFHkUdToGflEjrr4hJSTYmywooPlIv9
         MwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/zLSrDazNzxEV+xXz+3peV7lknvqsn60n/RnDtHfyr0=;
        b=DGclr8x5jffhBGU+lbQGRZV9fnARK39ANGKLJG4SiLoBNVg35HB+2sFfFrgqSlcxin
         jVCBI3RKJtYaDTqzGpjA8DiKndJsPYukoq5u/HznNzCZ8qZw9aXmhEy+bTR2bmNNeg4A
         GYWS2LQ72bCbr4xrJz5526TDzK0WAVwViZiajA2eWLIU4iNcxa4REPKf/Ph4AiWUj4hD
         YketmsiqUZP/Z/dScsRtTkauj/lDOpz1xNf370s7aMedWDLHg7qmnhX63/tuINXrvCsy
         OyFhp3esX+WXGUZthMv85uhWdkF58GklxvXcPmxVfk/t4xKTZu1s5Re3Yce3s811hEB5
         t2oA==
X-Gm-Message-State: AOAM533G026o1n1URAuSAlBT+zm0pZb0sJ7UfsNFXgoQCtv9ZalVelko
	1RjNXSlqpFHyZYllEKFvcw2CviI9V3U=
X-Google-Smtp-Source: ABdhPJzvQKS7MHY79kl/4fwLVXWxV+GpVANsY3Emc10/Ypi5sJqEdYQz4roBRRxTyQIlwuADAkZ51g==
X-Received: by 2002:a17:902:c40e:b0:138:a4d4:cf46 with SMTP id k14-20020a170902c40e00b00138a4d4cf46mr2143149plk.48.1631750663792;
        Wed, 15 Sep 2021 17:04:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:538a:dbbb:2df2:d1e8])
        by smtp.gmail.com with ESMTPSA id 13sm919152pfw.73.2021.09.15.17.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 17:04:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 3/4] qemu: Security fix for CVE-2020-28916
Date: Wed, 15 Sep 2021 17:04:18 -0700
Message-Id: <20210916000419.1812968-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916000419.1812968-1-akuster808@gmail.com>
References: <20210916000419.1812968-1-akuster808@gmail.com>
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

