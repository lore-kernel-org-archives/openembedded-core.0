Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7997BC77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:12:55 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.1038.1683058367047754415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 13:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-38e692c0930so2635698b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 13:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683058366; x=1685650366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0hFA22ZY1/z5ohUZF69Xcnsq9I2IFo4mpucjwo+G/c=;
        b=CM3ilbnQcMJxULzY6vOZ6lVRuTouOnCUt4PdREQUI23cSu9JDZ6XdJA2TimHWMbIZr
         h2bM4OUdMsAX1K5ihsXhELCKJJ6zKCn2RlLb9spw0uDsiuxHvGtIMaFddU1Dc9BX0UPV
         3dkm+ocNSZwHkxzyNVmFZEqGagOkA8wk+0/ZLuHtc/QbVdegFlZxzfFGJ2XBNA6VDxT4
         CdU/AUK14VthlqyLEKfkZzipbP48hvaMr7/ozgr4jwlXjgiU3gEseDrai01/0FKK8uuA
         FNwTlJBRolWLp3Lrq1ZYP2OOe63jCoWbnlVogAeQBSUTKeUysXi70bZ/k8bTEHU0SyRc
         dleQ==
X-Gm-Message-State: AC+VfDxAYrQ3Z7T03gY1kv4Dkb/uU21ESi1q48ewY75+pQt1fBafhBIw
	LbUXHpiSoQlo6U+n/hkguDdqmXLYiN4wGQ==
X-Google-Smtp-Source: ACHHUZ7JbDN5H981BIf8XAQlSPo+wFWU7c2wnu26BVJI5pZ8tMz7GFCHUwjWkSv/ALzub8vczZ7asg==
X-Received: by 2002:a05:6808:4394:b0:38e:352:62ac with SMTP id dz20-20020a056808439400b0038e035262acmr8374896oib.51.1683058365981;
        Tue, 02 May 2023 13:12:45 -0700 (PDT)
Received: from localhost (201-35-128-44.user3p.brasiltelecom.net.br. [201.35.128.44])
        by smtp.gmail.com with ESMTPSA id r185-20020a4a37c2000000b00541854d066bsm1512178oor.10.2023.05.02.13.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 13:12:45 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: 23.0.2 -> 23.0.3
Date: Tue,  2 May 2023 17:12:40 -0300
Message-Id: <20230502201240.2372610-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180770

Update to 23.0.3 stable release. Release notes in:

 - https://docs.mesa3d.org/relnotes/23.0.3.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../mesa/{mesa-gl_23.0.2.bb => mesa-gl_23.0.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.0.2.bb => mesa_23.0.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.0.2.bb => mesa-gl_23.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.0.2.bb => mesa_23.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_23.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index babd10a855..10efff96f0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "1b7d3399fc6f16f030361f925d33ebc7600cbf98094582f54775b6a1180529e7"
+SRC_URI[sha256sum] = "386362a5d80df3b096636b67f340e1ce67b705b44767d5bdd11d2ed1037192d5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.0.2.bb b/meta/recipes-graphics/mesa/mesa_23.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_23.0.3.bb
-- 
2.40.0


