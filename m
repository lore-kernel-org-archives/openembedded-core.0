Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.8507.1604191474791782403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oW/nFgNt;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id oq3so11816263ejb.7
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qWxx4MlR6L4WP/qmx8mEVTiiV4rCXBxGLImK5puJaJc=;
        b=oW/nFgNt0yA6dIpDxctD19d1B8uc/ogsUGshq3aPv8DcPxJIMX4CK3GbRkDPeDc5pr
         slnbPl8P+D6D5NZXpaBlQR9NrySN1GVBgAdnrGZ2DRTe9H5JjRI4C6WLobfsNgF2+btu
         5lqG4v4oG0Vhed2RaSDM1lt8jHP0rYLCdwgaZVfD1Bxh0Y81SqpDQyuIDPtZU/12uZvz
         itbzHIfiiIsKL1PqxLrkONyX7Ij809TVSD7a+FdPCzQyJbG2AZLlE/mV1w4Xu6RgVVYs
         QZwxBEsV1wPFvls9wUi/V1S3IveodH6lDN7rcerdDN40AyzKOMZySE08LKiTqyrD1PTh
         /nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWxx4MlR6L4WP/qmx8mEVTiiV4rCXBxGLImK5puJaJc=;
        b=MJCnT4o/1RkRy6qnfnSc9y6xkmWkqokY4j6OPu1DDVYBCTa+rKBqc0aihT+WSfFiup
         MjJFaTiuW4TKUZpK0IMyVuL9BNCkM7Hjc5opytJuLjUXmzMn+3ahOfrep8Ew2KlgW2uk
         lUseNsGbp2Yt0e//mZhc6CLEZA/8II2Z1HlNdNHtP2Qyq/8Cox8JOVPKip1qvo5ze4+/
         wMHld14MSBfgksAFDD3xLEJSsUyKST/jecBhWEMruK09wYMLuS8K4CMVhuk4vhiNckTU
         zrmUK+6w+bo0muqTcyn8rv82mdbBBOVW4qZlGhkQfmxmB/Ta1YNGuqR+g1x/t5ccVqYW
         N3JA==
X-Gm-Message-State: AOAM530hNB2oCxvsTfqNzuxLzs7DlrmW8j3um3wQnAKLU1kOIEJ3AJIz
	3ogZOeg/CkUqNj0WCp7Zowhcr4c5cwM=
X-Google-Smtp-Source: ABdhPJwSOJ2XuNTFhNC75b/btH09duDrl8wZ7D3f1AyniXEFxF7yJerbZB9cM0VvdOJQknleNzlJuA==
X-Received: by 2002:a17:906:b0d6:: with SMTP id bk22mr8966451ejb.153.1604191473209;
        Sat, 31 Oct 2020 17:44:33 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dm8sm6726629edb.57.2020.10.31.17.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:32 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 08/12] gstreamer1.0-vaapi: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:36 +0100
Message-Id: <20201101004340.4019257-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
index 1bedf25128..9d9b1b8757 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "13f7cb6a64bde24e67f563377487dcce"
-SRC_URI[sha256sum] = "191de7b0ab64a85dd0875c990721e7be95518f60e2a9106beca162004ed7c601"
+SRC_URI[md5sum] = "8c9b5a4d20afc04bc5e1536e81511f27"
+SRC_URI[sha256sum] = "77200b3c183fe97cd987deb5544e615873cff5e98ec87573583771e5f1fb9ebe"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.27.0

