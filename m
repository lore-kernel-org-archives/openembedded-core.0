Return-Path: <yanis.binard@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386F2E85367
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 13:32:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11795.1775223136123979450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 06:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JHZ7kydd;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yanis.binard@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486507134e4so27387285e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775223134; x=1775827934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzvfwzzQj2tuDYuciLvzN5BQANQGzT48X4OGUuM7+Yw=;
        b=JHZ7kyddCA1dOWaiojTkw6mHArVwGkBRO5UrchQbHiFxf8Sga4XevSR9MmmYNUFSph
         1IXSwuUPRFuoPNODC9H+dw3KrY6QUnXn/SiIiRGhsoSAr+i6FHc40s8IxqIPYlZZJlJP
         q5syfRKvrLYzwmqV5HAxM/K8vJBve/k32MWfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775223134; x=1775827934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzvfwzzQj2tuDYuciLvzN5BQANQGzT48X4OGUuM7+Yw=;
        b=in3WHVBx6jRqHZxu5tm/kKKurJWc+CICxGgQ2tvyiMcyK3EsLE2u5esW0e8BoN3pAc
         W1uHu/XvuXU8ZfCpgUuiKko/my4E9H/Nmc5yEECWJ9UqL4u1wWTfaSFmR4dxOL6F8vq4
         1J9bHPZZYikLn6qLMo+WW2aECcRbGjIzRTCCZoF8EftC7w7828lY4mVHKAqVjauNvyfs
         o9BxZ9xe24VTG43fu0+F8CxjmYEWm4Z+6hnq8B2DzVEQRaQ58hiGN7E9BbtwgFNpMLLi
         Q4yrQn1dc2FOURs9HtJWwyHtVYoLw7WPQ0W9sGKlpOazS65Wy7lu/bQpOQexygeN6g6r
         YT4A==
X-Gm-Message-State: AOJu0YylBkutZC9HypbyzjXagSq4nege/o2tIsyrAH91JKp4KhPxkyQN
	Zbu7aVbAeQY8MhgJpf+p6R6M7qD0r+0bFxEAINAnMh7gzPbGnDtujDgaP2JEJeM7n2ajFmiM6k+
	bHWnI6ek=
X-Gm-Gg: ATEYQzwPDfwE+W5G2gDPAHA6SOWWzdbtU7Y0qt2dIvWRoFRbdsCvssk1aIbmxER4aih
	I0Kq9BRsnFbTVAJLHYxSDuOLAePmYi1P9j2LzNW5fQTjGrBpBsvGU/JkEQ+LpEEJbwebvIboxSH
	8VuBRK09IrrxYt+A3sv5A/MaiS+WaM7dq1e/PRGrM3ToPJmYMCctZkX13se+l1C/reWDl+nDkYv
	NCCsqNFlERbXpHn3SyAKJR31xYEFXNjIGZENKPdxQOsR+43Hmv3sgoLK1M+klQuiqJd8dfeKGdr
	BlWgZhgcWc21Yr5qYlYEdYys/RUECekBASVVevDXw9PZ2c0VpxqOv6IGhOzZLEyLkPmDtFuRnls
	dlwemM2GXACuhLUr57mQU51mITJXzgz4a8lVijiErOdTbIkoBNLCQsejUW99s5ruoTsXXdO+wid
	pMV0niwzDZCcYy6G5gS+I/+lL1GoPtVuH3R76ptbOQb8m9ezxsHkfQvmIdY0z3lYw1zbduWH0se
	WjN0OCxpC9Mb+nO2D9mW+RWuD6eQ70l1w==
X-Received: by 2002:a05:600c:c056:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488998f14d5mr33523555e9.28.1775223134004;
        Fri, 03 Apr 2026 06:32:14 -0700 (PDT)
Received: from P-ASN-MAGENTA.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e8e897sm19986095e9.26.2026.04.03.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:32:13 -0700 (PDT)
From: yanis.binard@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Yanis BINARD <yanis.binard@smile.fr>
Subject: [PATCH] barebox: upgrade v2026.03.0 -> v2026.03.1
Date: Fri,  3 Apr 2026 15:30:58 +0200
Message-ID: <20260403133057.68413-2-yanis.binard@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 13:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234589

From: Yanis BINARD <yanis.binard@smile.fr>

CVE-2026-33243 has been fixed in v2026.03.0[0] but introduced
a regression. v2026.03.1 contains a single commit to fix it[1].

Changelog : https://github.com/barebox/barebox/compare/v2026.03.0...v2026.03.1
* FIT: handle hashed-nodes property not being in hashed nodes order

Release: https://github.com/barebox/barebox/releases/tag/v2026.03.1

[0]: https://github.com/barebox/barebox/commit/55f25be5223b662c6888d9d7ef07d28e0348d7db
[1]: https://lore.kernel.org/barebox/abljJRMecNdejSD0@pengutronix.de/

Signed-off-by: Yanis BINARD <yanis.binard@smile.fr>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 17cfc25692..9f615a82d4 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.03.0"
+PV = "2026.03.1"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "760f22ff34ca00539d29826cce07d83210e41ebb51266616c6969b855c099bc2"
+SRC_URI[sha256sum] = "9e4b23720016bb934dc5ea36d4c33886a8a295445d290b99993d0b32caab6469"

