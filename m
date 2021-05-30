Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.37033.1622412539712207508
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dJNMPOTg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v23so6574274wrd.10
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y45J+EXt2pNj/nulu1n+3cCxPuiiJhvsb8Xx/iWwWeo=;
        b=dJNMPOTgERT/zpE8ymAFANc9BlBuqXeCtJqEaK5A+qVijvWvdJuvKYv9r4LTmI1/2+
         9KHpvGOHIS5i8ZLAc0ceiovlQwrCszEjo0nx3bjyHKLDPIBjyDj3vY6C2NQCTZ21VOgi
         KURcF+o1P2NjT4+8w2PkHE7zaW9S3DuD5KPCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y45J+EXt2pNj/nulu1n+3cCxPuiiJhvsb8Xx/iWwWeo=;
        b=sOytgQHmyARz3n1fnHoceu4w4+t3DefU+sKHijU0oJO1Tx8Q1iBQDmvqGK01vXSsFc
         BgDSYRMfZ0ZhhYioDLVPb+JcoUNHMqEnvlArYmo87wqr/CLgtCJjH/dQi3yX3pzbKTUG
         E8o4pqiuYqeOmNVy6WE0ysXa9Wk9TjW3MJrfA7k6rk7prD7u6g15h/GI5ZMir78f0kHe
         QHUo7dSNmpafkvNJr2BSvjc6syC9VtdFXqQvYcUzCm7BDOpz0XcOZ1zbJnygP0SkkN9Y
         6emRvGm3zD0cI2B4itFkX+UJnEEkoUo+8x0QJ1/DKtIVzRBreGAVqqeWK4MakoNxvR/Q
         yhzQ==
X-Gm-Message-State: AOAM530yHCHbR6B2oBb1ly4HpJbQd8cKQn0CV1M5D9mrD5FuPm8EcvyO
	+In+VZeYfb8nRai4PBXvDfKDytBIG8ZUtA==
X-Google-Smtp-Source: ABdhPJyhFgE8UT7YLgjZGeEO/aks1ZxvB4N5WM1Jy96cbEFb27iCgTaGXQx0njpRgZI4eFVmTmeOcA==
X-Received: by 2002:a05:6000:1286:: with SMTP id f6mr18289583wrx.226.1622412537916;
        Sun, 30 May 2021 15:08:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/16] iproute2: upgrade 5.11.0 -> 5.12.0
Date: Sun, 30 May 2021 23:08:43 +0100
Message-Id: <20210530220856.2830501-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../iproute2/{iproute2_5.11.0.bb => iproute2_5.12.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.11.0.bb => iproute2_5.12.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
index e27b42d2327..36311233742 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "c5e2ea108212b3445051b35953ec267f9f3469e1d5c67ac034ab559849505c54"
+SRC_URI[sha256sum] = "9d268db98a36ee2a0e3ff3b92b2efff66fc1138a51e409bdef6ab3cfe15f326f"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.30.2

