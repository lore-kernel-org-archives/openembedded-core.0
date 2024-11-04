Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C416DD1BDC2
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 16:02:13 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.61303.1730736125977580007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 08:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Fs8dWpfU;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso3009378a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 08:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1730736125; x=1731340925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppHFmWug/3LykfuFLU5tirr1d4i0PtTGIAfUjhjWb3w=;
        b=Fs8dWpfUhJTIFlIX7OpApzVwGaCd229jhXHuQYA6k1/GTAgX+YvrUu8Ua/cKDxqikn
         cnrQcFr32s4/AU/pGjSO3MR6LzrOnL/VXnhi5i753YZP6Uz14V6pMbzpfAmj7NdAZLEq
         eC9XYIC8uZFSF6NRQMt9DoejLjZbLPwnAGfKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730736125; x=1731340925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppHFmWug/3LykfuFLU5tirr1d4i0PtTGIAfUjhjWb3w=;
        b=NxIjyQeWZ2OyYRD2EzrgFf7qR4CnFKiGlKXcCZ4+WmU4WFIOfC4RVpVEfAO06p4ICB
         mx3y2kyiW/BlDpeIN9pSDy7KAOju9mDLzLiJWY4bepgVDotB1fNK/GDr6P/glljoYeEz
         JQoO3GTvoa8YYZFH3zZlBZK1oGrK802Uodil/yE7Zkf6HUdoNUNXcds9zUWOgBjVm1bT
         Y5jXmm+aXziSqP1zkBAEqvev5vtmBl6UjCYZR1PNjy5fQNwjaIRJ7gH79uuCEMDT/sNx
         Ozt0ZAdA9+iu9xLnUnPu+a+YNhWKDA1yd7dBlXTBNlFSuXiIgfgOaMd8eFwKq1ks1JR2
         iP/A==
X-Gm-Message-State: AOJu0YxjMdy8YEMpg6PU9ZsJ4h1Xqslc7ihttW6FgQ9jbidzd3OnoS8e
	MTMBmr5WpHnQhn4RCRO89CnDgiCWtC/aXYkvv11GCEIx461ERYCUVVcEV/MGUCDNBa80xFNukJX
	NCyE=
X-Google-Smtp-Source: AGHT+IEvkpELGjvcSxcjKShNrfxAJpMdzN41+AjyetAeq+gF6kyZjE1kqzPWkkggXcGBXry3+wNdsw==
X-Received: by 2002:a17:90b:378f:b0:2e2:8d33:f79d with SMTP id 98e67ed59e1d1-2e92ce71814mr22355986a91.19.1730736124760;
        Mon, 04 Nov 2024 08:02:04 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882e:ab98:7529:8e26:b6dd:89cf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93db42e33sm7744647a91.47.2024.11.04.08.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 08:02:04 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][master][styhead][scarthgap][PATCH] xserver-xorg: upgrade 21.1.13 -> 21.1.14
Date: Mon,  4 Nov 2024 21:31:53 +0530
Message-Id: <20241104160153.1770335-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 16:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206690

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix CVE-2024-9632

Ref: https://lists.x.org/archives/xorg/2024-October/061765.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
index 1f18c22fa8..28c98eb527 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
+SRC_URI[sha256sum] = "8f2102cebdc4747d1656c1099ef610f5063c7422c24a177e300de569b354ee35"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.25.1


