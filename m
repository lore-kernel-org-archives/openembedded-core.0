Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E553C02193
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:03:17 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.15999.1738166596582705603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bk5T+wbB;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d0062fb20bso2799845ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738166595; x=1738771395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cgNiqcWLwgQTMp80mxNLJWL8N2xOC+lwBf/WI6CpC0=;
        b=Bk5T+wbB+m69UHiLKqt6Ey98lPan6AFAl3Ki0vvIbMBCcSsaB7Q5LDe2i0G17eeJLf
         7QRavs/X5wqOKNOnBpGzPFPwJsscsDsbMdcsHcNt/2fmwFI9M6d4IFVfA/O0JPCXO7bD
         hulN8f/fYnm+LvIoahwJoIetZF9QuUtef5DG6UWfnXJ32gfFBS7iMabJ6AXlq5ZSu3wE
         4ifZe5dKXvCTUZ4rNrxSDzyxPNtRmOl4Dy7ptr/VpdiE/sJKWAqUZQfelHr9FFfTVpZK
         F4SThk3OMo+E0wzGriu0qpJlOMYgW4OlXDJ355S7GE8gHBLIKtN9xRE8a2KHQG0MHGqW
         lMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166595; x=1738771395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cgNiqcWLwgQTMp80mxNLJWL8N2xOC+lwBf/WI6CpC0=;
        b=ZcTHBLkzNZuXQMAAtUGHZHdP/l5yotMhNa4pGt2n3CcF1xQ05yvBJ3+Neqs1vqz9hw
         06q/Vnk3Bm980wual3C5usNkOnVZWCnel+4EhMvk1Rsfm+nyMO2Af73uTWo5skEfnHdj
         NuAxkWSnSKicyStP8b9esYHUJphpBXPZR1Bmpoc7XG0cKbCLi5dJCt+s2sWgy/2uuGaA
         3sMyiRqiyO2h5ZpybvcPGDkhY1WC4JQ5C/xsI58yb/4H+hhhYvsnWwtgiYLC47vnhe+g
         vBARyrOIHFQ7J+YayQd0okJ19jfe8ThQmyx5lOaJrJ2kZGlJYZsXLhK9IrWprN2+qwEd
         eyNA==
X-Gm-Message-State: AOJu0YzUi9eqALSGHk0+Tifkjin3GoaGVjOjw2RyCOE/7BVK0SUatAIl
	uzbjpQBkRnK6YOIGn5LUa7pPOwEPBSTx1Oardr2ZWuF56D0/18g+O7Qnjg==
X-Gm-Gg: ASbGncsRH/qdMurxC1ZN4uKRS0vTsyDCJeNUO08fyehte3MkpW7blizh2c3um2MFOpi
	H8rja7UT2xWYTWywHYMpvMMN6pLSoNmtctRluDnALccbmWZ7+MTsSweXGkl3XmBjGSg9E531Sxe
	4duJTftKfPv2KoV8ExdFTV5JfKnieFLKL+8U+WjcAeknPTIBV0hbFco3TlLNio7qVaTlDejS/ln
	d+ts0a7JQegzJkk/7X/t9eQZ97gcm/GbS1GtldeShIrjLgYG2ptYc8nVkTyGzIDurBBjeTb8lKT
	SQ3NE3YL23hSR1sugt/gKlBN3Dw0S9YMp/9SWC3kl28NDyNC
X-Google-Smtp-Source: AGHT+IFf2dqk4UVQ3a84AMfZgA8EX42xqHCKk0YjQAnbhiVWD5W2JX9AFl5nGOadNbR2u2NuMiqEAA==
X-Received: by 2002:a05:6e02:1947:b0:3cf:f88b:b518 with SMTP id e9e14a558f8ab-3cffe47022dmr37937255ab.18.1738166595329;
        Wed, 29 Jan 2025 08:03:15 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1db85d43sm3763417173.115.2025.01.29.08.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:03:14 -0800 (PST)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] util-linux-libuuid: use util-linux's CVE_PRODUCT value
Date: Wed, 29 Jan 2025 10:02:58 -0600
Message-ID: <20250129160258.11448-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 16:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210387

util-linux and util-linux-libuuid should use the same CVE_PRODUCT
since they're the same product. They're just split off for package
dependency reasons.  Prior to this patch the libuuid recipe gave the
wrong CVE_PRODUCT value, causing some CVE check tools to fail on it.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 56162ab1479..580ff488e42 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -43,3 +43,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            "
 
 SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
+
+CVE_PRODUCT = "util-linux"
-- 
2.47.0


