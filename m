Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.6411.1623744785582574813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OgUer5NL;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id my49so21093653ejc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gpHZtLFF5yFGvE2/C2vDMMrGiN+On4LV+a99autLDe4=;
        b=OgUer5NLMG5uPqIcZ3eTz4M/QeZ0dbStX3p4y2eu4BMT2PaG1k2IuiTfaLktZGiz7m
         jHDC+RAPqbZ0uzSzO/3kfi6o/ei2mWlUw0LhWij0ll4JzYOt57TFbGWq2E/cV63PoWv+
         TVriGLTM4ElbfiNHKrU+oTXW6BxVNgIE/wyxV7tdVHmwHoq1Y8FK08wIYI7NWr3jT6Fy
         8mGLKLsJcYxzkkNg4xBkJjdTIVGjj+6uyC7uxxwAVmYLY+OYN0HG5bIX+6ybs2SlM9RF
         rmDaFhdsutUbLlqh386S8+7s582pg6ZZ4Fs9Sq5Vsw9ozwMAQa2ZDMlMTdVLDa6Wt9Jc
         1OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gpHZtLFF5yFGvE2/C2vDMMrGiN+On4LV+a99autLDe4=;
        b=LAdeDHX1wa+8wQzK+NOHz2EdAaRbhwXQHsrzBk9pR5bRPckDF5Eg8aLYl0rZ5lImIk
         C7MmzGuv1+9ooUVPotWlNPtkaeaN9LKEdNd2nD+k87nAiYFpWFs0cE5w6rxa/EvqGOxU
         ye2Mo1r6zGga0RAJuiD8855BWoNdlVPw48EP/Ghydpccap0jkoUiAvNmJfIdlL4ceSJm
         3HbW4I7X4C7GmjHyO45aNBlcvZph20FRzEqGOop5NzUufcE+wl4mCEaolCT8t49l7uaX
         bC3uUAPxNhRLAC4UNEvpJ74uXamH6F2KJGp4KYmq4wHkLpTIzyxaD6aQ6U+eq1sOMsL+
         9NJw==
X-Gm-Message-State: AOAM532MqnVvUFytUT04mWRh73JQ6iK4fqt/qMGBYIiYgAzTl8bYN1Mp
	TFQAfk9MyK1sdLdiTT7R1gSPCdjTusO9Uw==
X-Google-Smtp-Source: ABdhPJwAkTdc8Sct2pdP65ro1lq4ZsEmF9/wvgvqW6ukA3mJFYDqStXI56gbR7DAc1alBpBobZvftw==
X-Received: by 2002:a17:906:c010:: with SMTP id e16mr19606885ejz.214.1623744784249;
        Tue, 15 Jun 2021 01:13:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/31] stress-ng: upgrade 0.12.09 -> 0.12.10
Date: Tue, 15 Jun 2021 10:12:37 +0200
Message-Id: <20210615081240.1734087-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.12.09.bb => stress-ng_0.12.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.09.bb => stress-ng_0.12.10.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
index f7e5f03e78..7b06f00616 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "cffac091082c7adbfec649be3c66941c3d622f8b96795656bcce2e20d669cfeb"
+SRC_URI[sha256sum] = "bd167b6559fa8a28680371b1defd3ffe2344eb550129d58dd7d5e2d568f2786e"
 
 DEPENDS = "coreutils-native"
 
-- 
2.31.1

