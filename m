Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285C2C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.6398.1646731952391341896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dUnz/OZ3;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id qa43so37736005ejc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C58ixp5QcYaK2I1f8tLpc3X09GqfnXV6GxTlm1oSKIs=;
        b=dUnz/OZ3fVN+2/YuohejY/to2BJndtBkSTak+v9gHX9IhsZkVjmuNeq+Q6fc9Fl4il
         U271FjJCShY386ttftw6fj4+YFVel/AFz5pOnTm7PlQAuOjvHQSPfgT7xys/WuNCoi9/
         Lu/eJvrKKIxB/49fZYTBO8uw3WApTOkCJFBQkLoqQUCDroaTlgoZrHsTZKt8QfhtJ8wC
         YtyQ6xv98gTGqcoUyzcpt9PKbvutHLPePDYgI3ihe5SgW7Dcyyves9i2tJFcTxCLXqbM
         WbUwOMvK0FgyN1tdUjcjcQ4p29cNU1ePFUKdYAs5vL8rJjZO0VOvd2Q2UKSxQPBz0mUw
         qZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C58ixp5QcYaK2I1f8tLpc3X09GqfnXV6GxTlm1oSKIs=;
        b=QwKnGnJBmz9BVtimNp9HLtidlb96QD5pHZQ+5vu/+lqs3Z+GYi5X8UFDNQfjVZJoV+
         PZna21g3xOUmDOEZRsPjhYr2UggRn9I8+yUWgxlmnegoUKwKM7LKg8aB6pyxKLpiLoIX
         pePOQYVs2FOFpVTbymh3ThiLivXj51XqQ6EUyPhhYzfFY+WVu+u9VPAB3zq/XlEv0RH/
         2R7rux4voZsVZRJNZnKA6V7c7uqgktyk/IS6wBwgUF87BFLlRN/YiIgauYkKPqzIBior
         JrT/meTjousK3RKZmI8YuJr6Ub6Xr6fGiboI0bHWBUMP+m1terPdXrM4m7xYh11M92r1
         mdgw==
X-Gm-Message-State: AOAM530FhQy5kW5AYLYBi/aBPOxxJb7reTzLFu0EqYVIEm83eK3uXFlK
	jJv6crFPvshkS5tf0d5TIBK+taPxYx4=
X-Google-Smtp-Source: 
 ABdhPJyfpjgQpTy44Hbsb6kqpN+vUJyF/Iudpo7PHUrFr+EbxMna4zNVuNy6SaBdI80763EFwHsilA==
X-Received: by 2002:a17:906:4d0d:b0:6da:a60f:bf4 with SMTP id
 r13-20020a1709064d0d00b006daa60f0bf4mr12396946eju.451.1646731950730;
        Tue, 08 Mar 2022 01:32:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/16] xwayland: update 21.1.4 -> 22.1.0
Date: Tue,  8 Mar 2022 10:32:12 +0100
Message-Id: <20220308093224.3436483-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162881

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xwayland/{xwayland_21.1.4.bb => xwayland_22.1.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_21.1.4.bb => xwayland_22.1.0.bb} (92%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
similarity index 92%
rename from meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
index e08be51ce7..9769235ce6 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
@@ -10,14 +10,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "19f6795f31cfa8eb352b1e5b3c379f22ee6020e98701ff2cc679da8c4f1159f7"
+SRC_URI[sha256sum] = "1752d6d0a930e71292b5a308d3811ebd54d8cc68cacff44de654265b8617a2bf"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt"
 
 OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} \
-- 
2.30.2


