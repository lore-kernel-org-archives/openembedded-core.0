Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.37066.1622412539752773351
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O4hmYM36;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so8785840wmc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VLEwOg6qbn9hWtdqDOQ75+3mNxtAqWMRbDYCzkSBV/I=;
        b=O4hmYM36XdE4y/vrwADffsPhZsEcmLvtGXWaqYJtcbRzZMaBTF9sEgGrBT37lNgb6p
         pDLmTEde3m/0se+RQrF73Pha5MTmModo72+ubmqaTxGn+kbzgUQL5iiEr2Ufre/1cBHi
         zWi2IzAt6VaThIatFr2w17uAQ+StJq8eV1pNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VLEwOg6qbn9hWtdqDOQ75+3mNxtAqWMRbDYCzkSBV/I=;
        b=VMiQsu75ZzPq9O6oY2R7LvFYxqpKBraj5Noa21Sg2ehl0l3MjMFsbIFiFECMQfUH+2
         Olp8KYM6TNAEe//6YuZiZpv+AKe2IE3UCgrKhAn4CJYDtia3/k2gRDXcePVvyWVbgQdj
         pvv64R+WI1frkKm5q7G73lK4tac1NLBBlsTUltA7f917m0IGV0utsr8taj1WIN7KW6QV
         vLrFcVov5F/fvRBXfBDC2V6asUYcK3VCYHUpwGftQgoxu6QayPMkFAEcAAr26Fhv8jKG
         yHyKSnPmZqvu8N/ARP0bColj17JvK/ySpMcP821Nj6Aaw7s8ywqk1bvRoOqmxsUnZUGz
         Mbvw==
X-Gm-Message-State: AOAM530XLPpfyEJZsxOIq6mZ/RftcL/JtJvqLmReM4BLOYNMWg+lgKN5
	xTOvKnxqz1E4DXxHmXUZKi35DUwaCXqtjA==
X-Google-Smtp-Source: ABdhPJxYousf2gSbt9/eJMLBtnJKFz//iNTQSAptR4E1BrPJY4s117aPJZkbQWh+88pTBbX6JvUlcw==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr23209711wmk.97.1622412538274;
        Sun, 30 May 2021 15:08:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/16] libx11: upgrade 1.7.0 -> 1.7.1
Date: Sun, 30 May 2021 23:08:44 +0100
Message-Id: <20210530220856.2830501-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libx11_1.7.0.bb => libx11_1.7.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.0.bb => libx11_1.7.1.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
index 3faee6e497f..b5f0445e12d 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
            file://disable_tests.patch \
            "
 
-SRC_URI[sha256sum] = "36c8f93b6595437c8cfbc9f08618bcb3041cbd303e140a0013f88e4c2977cb54"
+SRC_URI[sha256sum] = "e64e43deaa562cbfb0d5ada64670ec09c6fac7935262dcd77bbc6d984a535d47"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.30.2

