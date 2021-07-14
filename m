Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.5895.1626265587815634439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RqWcuHqe;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id o30-20020a05600c511eb029022e0571d1a0so1291122wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q2ZLK2k5DVsav9NSVT5UKlkDYUiQiaGrZ5oh+qYv5Kg=;
        b=RqWcuHqeLlu17uqhs/gn3e0fNPp3h2SWanQp1iQoAa+zCBQ8KYMXDKGqYczfQJHLDR
         hDlkQ7o/jAxMpnwBb4hnwOq0KHNg7P8O1EfW41M2tNNt9rucrmgUadunmhalA2Gn8E0R
         ++MqcoGgf5t+rWMwpOaDW8RHUUWQEkrA9/qz558i+mawensyePgOzlqScIWAvs187xgN
         CsDnd1OzQbzpOgwZQr40UMeTqHlDwplnJl/Afcqb6fi2n9/k02PGgefBY34f9jFFXC+V
         kwO2g0oUp39c9Lb9EvpVB2A3W99VQ0MwBZ8jWGK1A8fvDjnEf6DrPzaWvyjMB2ViO0ga
         AfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q2ZLK2k5DVsav9NSVT5UKlkDYUiQiaGrZ5oh+qYv5Kg=;
        b=KNMcUwtt03sooYB10TBH6mSTo/ulPLlMUaxhbqou9xilSur+CGljaxbYySWruP1DCx
         z8N/q9hkQQcnIYFTenVkLNycvlmMrMNdBPbWtiyiCPGrBEzo6c1VHZIcNoRt/6Cq1RJ2
         1Tgbpb/ubCtSIdZAtkwOYvHXp62I9KG5Lt2qGZe+jARoWFrZr5apFUTOU9J4EajxIFDm
         MVXsn2LNGcDOu9IrzRknc9EvLf4XdemP9Fzu/xNGRLzoNHAelVv5Ebqh+D7zKvpUuBE2
         5cjwkd3hnDswEeg0MtZMVCF0h9KZvuCrBqf+hLRH16SSXVAYEDaZB51HwzZ7FdR+77yh
         zTEg==
X-Gm-Message-State: AOAM530mpDb8/p/ysFR++1YY3QjlfiNO3+ZgfSsSqed48BbyZATCD2nQ
	W2QxYUpiSdgs8GTtoppwF9I+0nI+sI8=
X-Google-Smtp-Source: ABdhPJxJJt0/rtFaJ0UFsZWJKShAb2PR082HCTSAeHtK/XrE8lNcliGWc/+eUR9z4/h33xTQboVDhQ==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr10695144wmb.39.1626265586507;
        Wed, 14 Jul 2021 05:26:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/21] tcl: fix upstream version check
Date: Wed, 14 Jul 2021 14:26:06 +0200
Message-Id: <20210714122606.605142-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index 57a86e4c64..8d58fafeb3 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -29,6 +29,8 @@ SRC_URI[sha256sum] = "cfb49aab82bd179651e23eeeb69606f51b0ddc575ca55c3d35e2457469
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
+UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
+
 S = "${WORKDIR}/${BPN}${PV}"
 
 VER = "${PV}"
-- 
2.31.1

