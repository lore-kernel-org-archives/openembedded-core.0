Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5307C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 01:50:56 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.64750.1744077048880479562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 18:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VM6KaT0R;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fb0f619dso48825335ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 18:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744077048; x=1744681848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVBg06fTexsltlpiYfj6x1Rz+kz+nhxEBfYZ2pH+8FY=;
        b=VM6KaT0RFTckgzoWLgkVCSr0SmjMsuVRu7wEMRi/w9qbZa0wBetEUST8PzQStPQHID
         nXBuujo2clzJr+aUbWiFMpnE84xxMD+XREIyAfXx+aJOGzfd8N/2eMyCEHbRVEVuP0XS
         70OoQ9DpntMYaO8G7a/Nwcs5eTseDgYo7+e+iP1Vcvcr7p25Ojorr1BxS6WVeU1Aaq01
         s9XBzuqNKwQXwPUXOHtAjqT7xhk/FkrZYF9DviXpg/T4UanlfuEObXh2ZrqtTti+cHw0
         rEjSIFeFZzRWv2/y2I77rklYEv1zplWVVOzRpdm1aXzvHHk6ajNKoUK8u5kSdjnV+/mk
         9LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744077048; x=1744681848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVBg06fTexsltlpiYfj6x1Rz+kz+nhxEBfYZ2pH+8FY=;
        b=jZpzl/+4BPaiKxno0tpO1RimKkI47xDSu/p1BU1P5l4zTdZX5FmnyhfW8jGowvneA5
         68sitC5TxlTyIGnndHT7yCNo88j0xUnhizpuvX5p9MhsVkL6dPXsOioVE3OMahlI3h/H
         K77YJmy8FRsZGejz1ZooKpEuFmGStbRSxIpGmgeFyUqinUJ9aHdNM2GrrYeTZyCqFbTg
         DCP1syahyvXWrXzemJeQp8Op9L/R+tOjzm4WdVjVD/3MtUG6BN9VcsPkptD1eOMbg6pr
         E2EnRD/LWIpeqmOg9ZLmQtElxLW1O5ZXc+XV5n4uPjZCeM3+RyfGohEjLJnxsEmQMw0M
         tVZw==
X-Gm-Message-State: AOJu0YzbZSNi3ffmeiD8I/qKGRWPQe2+ZxQdVTCyzpAfO2yHj74GdOfY
	7W9zAtjUBch8F8ar2G/Srb+qVAuQfFpXDFJdMOIahSwBckyUBjzs2valsw==
X-Gm-Gg: ASbGncs6c3Jx2e8LRRIEg0RBzs9tyBeuDPOKm4tsWVai9QV5dDiztLRwSG7LkPpTn5G
	Q06rktVopCmbLWeWM0gSRiiu64zLJuQ6kvhQhLURPYQ0U10A2JSZ1/GfG1QrYos+4bjWIczNARc
	4TxPHR9fkMz3E4RGEIwxoS3ZVre1n28hvQHuGBlExhdJ7sTH2CqrX+pqo4Ts8ffaQTzJslIfFl/
	PKFfuUi4We8Rve8uKLnzXS7xoIg0zZNelpK+UOzcdYflYOEtQqTinBus/W+cZI6mybSuD0l+UPQ
	uGsAmczBR12ruC8j8OBkvGZ2m9sY7pRSaRWjslKdKjhhniIGaLItYJWCXPNWlaJW9xyzTduRwoV
	fQTzqZzZlip8h4EA0/T2P6vBi6ctp2E6x57xcBi3UR2ieFInjzw==
X-Google-Smtp-Source: AGHT+IEwfE78by49yAVvxSh6fKOdqmk86lthesQ+wfc4XBrOG3qW5iDQEYBT+900hZQIifHIXE8OEw==
X-Received: by 2002:a17:902:ef0b:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22a8a0b59fbmr205573395ad.49.1744077047896;
        Mon, 07 Apr 2025 18:50:47 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877275fsm88437645ad.221.2025.04.07.18.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:50:47 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] ktls-utils: Initial commit
Date: Tue,  8 Apr 2025 11:50:41 +1000
Message-ID: <20250408015041.3803604-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 01:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214502

Package ktls-utils which includes tlsd.

This is used when in-kernel TLS consumers need a mechanism to perform TLS
handshakes on a connected socket to negotiate TLS session parameters that
can then be programmed into the kernel's TLS record protocol engine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../ktls-utils/ktls-utils_0.11.bb               | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-kernel/ktls-utils/ktls-utils_0.11.bb

diff --git a/meta-networking/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-networking/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
new file mode 100644
index 0000000000..e85dc4ac72
--- /dev/null
+++ b/meta-networking/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
@@ -0,0 +1,17 @@
+SUMMARY = "TLS handshake utilities for in-kernel TLS consumers"
+DESCRIPTION = "In-kernel TLS consumers need a mechanism to perform TLS \
+handshakes on a connected socket to negotiate TLS session parameters that \
+can then be programmed into the kernel's TLS record protocol engine."
+DEPENDS = "gnutls keyutils glib-2.0 libnl"
+RDEPENDS:${PN} += " gnutls"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
+
+SRCREV = "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
+SRC_URI = "git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig systemd
+
+PACKAGECONFIG[systemd] = "--with-systemd,,systemd"
-- 
2.49.0


