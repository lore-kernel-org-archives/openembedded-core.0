Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C57C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8742.1637163339941511572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jao+g5b5;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id b12so5493569wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sigG42fmOpc4pouXJzaZBp9UXnfqFjRq7mttuvStnwU=;
        b=jao+g5b5ztgZc5QY6PArXzQ+8V7WI/OD7GCCRS9545C5cFTNEpSh8NStHo4vfgqFZd
         n8EpIjlTZehT57GzG6T7ko5dNGvvaeVfXMeCze0Sy2VbastWpcdOP6qR520QzABYUgzB
         3XwGQhlOoW6hjgcpNEW8pyq2STYjTiEMq7GPhgCEPDxJYHJG+NZ/mBv7/xCyajmEh7H5
         k8M8QqbIVePCKzRtzIfPtvPDprAgS+5SFGIBBI10wrkTUntyPtxp1FI++4l1NZApDmo/
         BAFTCSnUiDKuA+zo2PN0K0pmY/qdV0bSNmwqCeoxX4/FzR1j+I8QxpOIwp4reJjdROMt
         TVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sigG42fmOpc4pouXJzaZBp9UXnfqFjRq7mttuvStnwU=;
        b=P4KbCLcqy3+PQUg8WV+WmFjm4VUb+NfJ+dIdYirlKyOQg7EAJsXc7RePAZ4OsiOB2g
         CcG5sKrRmzU8doSecWUMO/XsSmNEpipI1s1e0E+wNOSK94ZZhlSPGYVFAAqVHHjqaapV
         aM7k3E6VwgQElwTvmiwr4MN64hroAELSVZi1BrRC0gq5slr4bdGUkAi0qUk5tMs1IOVD
         KxrouSugD/tNXT7+l8bKmAAKpBoUGVwwT9JFullQHw5sOvCy0HO+4gfFzdXvymeUHalm
         L90Ybw3BV3s7qeLVv4Zrob4h0D879/XIDudM41H/KZdLgd0W/RsdXFHBOnBNTYc8N8F2
         ljsA==
X-Gm-Message-State: AOAM532U0xk5gfgGMG19e1/VDhTMrRhrSiImYjrfZXY1ybD3Xva624gy
	w8yqsbsMrONd10lWxonAye860LMkFe8=
X-Google-Smtp-Source: 
 ABdhPJxJleM0e6dgE8R8+roktv1hIf/UovcK9tv7huOrF5AcxdMqMHKOBcg+fNHSiTkbI9oce+khYQ==
X-Received: by 2002:a5d:6091:: with SMTP id w17mr20761660wrt.65.1637163338530;
        Wed, 17 Nov 2021 07:35:38 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/36] xwayland: upgrade 21.1.2 -> 21.1.3
Date: Wed, 17 Nov 2021 16:35:07 +0100
Message-Id: <20211117153525.257146-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158413

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xwayland/{xwayland_21.1.2.bb => xwayland_21.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_21.1.2.bb => xwayland_21.1.3.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
index 6aba65935b..5d083e8ada 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b81cbdd5ad60b8b7ad8c3ecc7ec2a28c9bf021448670735cebb501f08bebd18b"
+SRC_URI[sha256sum] = "ebc2757f39fd4c7db1654fd86591589c211aa20172d43a54f77ae567cedbf8a2"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.20.1


