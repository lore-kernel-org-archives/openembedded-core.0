Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.11639.1621204376918599739
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MTHjkh4f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j14so2729474wrq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SqJQ4zMODhOAaZPvHPurrVL2zVVIcWOlUZCWJ15mXFo=;
        b=MTHjkh4fLq/o79EZjc8//m1xVbnBlgI5X8t157a5kL1cVtGffYBuDaaLqoToNClH9+
         h1UfCua54GVEGWSjVq5oqMREBWuNMH0R7T71CC8B8IfEZdrbV6Scvls72LQ4GEY4ZDB+
         W3KCyjvpD3M1OF7yPGuOG/LcNXQI0e41tJDtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SqJQ4zMODhOAaZPvHPurrVL2zVVIcWOlUZCWJ15mXFo=;
        b=tCFFQ45j+bjut+R4EMol/YpLoZk1kR9HNuxShiNq1CRnF/f0fs9ujk2s63CESjQbbc
         J8+0AlIr/3nhqaC2CM6ENQ9908cP4wKAbCoSG2BKT1gTTL+zxVJ61RsRDF+RvXVmjNrp
         Ss960grkQx/GOcQ19SxH3rm+3d0qFcoNRgNdZQCeqX4mZu1C2cgXEJqxaB4LAB/FbAOE
         I/JCr+/iwTlHjgHxvY3bxC+bnfDIFNOOfOJF987B0abIV2xFAJSp7JCYQoLZG65YB7VS
         KOCuYNjpKOgBvLWiyeLVNuPvet8LSmcOsQbcHGYl325VKQ66HfR/6acMa4w+J0D41DN7
         AMjA==
X-Gm-Message-State: AOAM532tix3+D2BpZSnyaXZK5gND/oyVx677x1+UMUGMw3SlIuWgGn73
	zQ6F9tlJAtWYxWCU07QEolV/oPuuE1WRDA==
X-Google-Smtp-Source: ABdhPJyRzxRJBJV3DmX01TftWSLKc5maFi3xaPgobLyxl41ojVAlu1RhWLLdHiP70ypIxS9fhEP+8w==
X-Received: by 2002:adf:aad8:: with SMTP id i24mr3388048wrc.0.1621204375459;
        Sun, 16 May 2021 15:32:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/27] gtk+3: upgrade 3.24.28 -> 3.24.29
Date: Sun, 16 May 2021 23:32:32 +0100
Message-Id: <20210516223247.2401235-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.28.bb => gtk+3_3.24.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.28.bb => gtk+3_3.24.29.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.28.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.28.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb
index 619c733a073..031fbb6d664 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.28.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "b04e09763367f1ce932cd2ee3a359d4de150e1c38e7bef7d29aa72557a6b47c6"
+SRC_URI[sha256sum] = "f57ec4ade8f15cab0c23a80dcaee85b876e70a8823d9105f067ce335a8268caa"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.30.2

