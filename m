Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.36990.1622412543149466421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Od63CGaf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so7707398wmk.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eN54IWytqZgoEkAvExKJUyGUOP3+AdCJpl0fwlbUfs8=;
        b=Od63CGafL1gd2o/PTXXOtpmu+eEf6CDoAmEX4EpTZWnUspFoxWnt1czBCZLxslNJfk
         p1e2vI52gDF+98Ie6Koc/+ADjq2/sqnGcX8ZviNwkZL0GZJq0+s77iJW2dm6ywu6k4ZM
         4CatxWZFcgnsJs9E/hzJl6yAaMyZKyHt1NdlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eN54IWytqZgoEkAvExKJUyGUOP3+AdCJpl0fwlbUfs8=;
        b=LsVIdji/z1JqPVW3LOUmbWDtHFKoWQieP5I+mFF3PkzhAC2Wc6aEVd1KNSytrsST+h
         /O2t+nZq0lZWvkPd/h4LYO5BzUcNI3QG9Kw3dm1NwvTQeVJJbi2yknQAZ8oNinpvFFkR
         kTOz5yvSV9GFnB3Eg9E8bdz4MHoEgGUNihUcQhbY/xoZWG21/hK4LT1TSi5Fjz2QlCEK
         9mxo9y/6V5/sQvYUZkC+K0On/gi3RNsRW1NkQVYiErgV2WjFUTvKHM2OuSEFgl0rbNd3
         hqkeKjnasCOfouBc+b+CghmCp8E6qh84ppG36yco9gwiVyOlNZx/QNjA9P0EOHJ9Y3Oz
         yPwQ==
X-Gm-Message-State: AOAM531i3GVyvN6zb82FgW9ySF1bPguhDhHejJLBWnPOiNznPLoyVEaw
	ywSYBWVZYSlM9028F0yZEbISuG2idFke9A==
X-Google-Smtp-Source: ABdhPJynOR3fnicyJdvA6fIraCRNiQCjnW88oPtShTHiQrdJPSzsKApyw2cZcSwdeXR7b53t0DOHUw==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr6185028wmj.158.1622412541735;
        Sun, 30 May 2021 15:09:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.09.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:09:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/16] xorgproto: upgrade 2021.4 -> 2021.4.99.1
Date: Sun, 30 May 2021 23:08:53 +0100
Message-Id: <20210530220856.2830501-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{xorgproto_2021.4.bb => xorgproto_2021.4.99.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2021.4.bb => xorgproto_2021.4.99.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb
index 52f42d40744..f4b08951546 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "0f5157030162844b398e7ce69b8bb967c2edb8064b0a9c9bb5517eb621459fbf"
+SRC_URI[sha256sum] = "0bce7d4fe800dcb5581cc59a99946c12e6e0be292636544221ec73e96f1a28ed"
 
 inherit meson
 
-- 
2.30.2

