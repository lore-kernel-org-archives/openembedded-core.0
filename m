Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.36987.1622412541981090236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UsBxb2fj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so5434628wmh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Km5Jk1r1mkmU+G7vsDO2FABzrxT7qBIAs5L9mNlePr0=;
        b=UsBxb2fjNmfHMuQGcWAu1xFZH1CetzAaGAsnCJobwlab0d/rK2piwW6xrHnuiRD1IB
         4qdaty2WbIZE08uYHy3vuO7lNpStRDLA75YUegl3/VzLxTrp7lOJT2qu9AWu7CQenvLh
         Lmb8+a4Peap4KIrqoiW2VYn5YPM188vYWjOgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Km5Jk1r1mkmU+G7vsDO2FABzrxT7qBIAs5L9mNlePr0=;
        b=VrPFJYKt97vgjUrBzkFS0JL1/y7YSOaooUGlEuuNxwFKvkUPpcWf0KLklahwW860a7
         a8sen8wJmI0mnCVrAE3CfnjG4kGdHR5454I6Qj3p8NzhnOhON4oXCKB1w81gt1SsqXca
         fp35f72dMwqv1IysmeLGuYBrmq4TqfXW3w0TJ78pFGu6sLFT5y0Pnzv4pwYXg6AcFbWg
         iBrYGPmZncxytQR6bY+5ECinRbft+rZDFD2kLxM9rSHtxkn7Ly8rYr2fDnwnzZ87M0Tb
         8LlwRLJItuoP/bnVoo6+u6c/dAnJOr1q1WldPt+TEEKrWuxm05r1RXbiOXIpNUocAv2R
         wYIw==
X-Gm-Message-State: AOAM530RqMMQz1Wh5fOU7smEe0UCKvDKeJ+YpjWkTbuDWce0a2mTbGwj
	1eSmKTcfFCKqUC3rgAW1UdtR9uVp6aJhww==
X-Google-Smtp-Source: ABdhPJyF48+/ObLgb9B/0TZTz03/TPgw8uurtPeg7vcySgrtk+k9ZPVydgOBLiAV6i87cvD3jdoZtw==
X-Received: by 2002:a05:600c:48a8:: with SMTP id j40mr18587421wmp.114.1622412540553;
        Sun, 30 May 2021 15:09:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.09.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:09:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/16] libinput: upgrade 1.17.2 -> 1.17.3
Date: Sun, 30 May 2021 23:08:50 +0100
Message-Id: <20210530220856.2830501-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/{libinput_1.17.2.bb => libinput_1.17.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.17.2.bb => libinput_1.17.3.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.17.2.bb b/meta/recipes-graphics/wayland/libinput_1.17.3.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.17.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.17.3.bb
index e4a8e1a3d8f..ef19146f797 100644
--- a/meta/recipes-graphics/wayland/libinput_1.17.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.17.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "b822263086b6588b9a9a153be97dea409f63927fb67b9a241748e76f222a5be1"
+SRC_URI[sha256sum] = "0d010e0bf601b5d3a06b3c4d77d67751cf554f3e6448e57aa046ea9ee8f818ac"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.30.2

