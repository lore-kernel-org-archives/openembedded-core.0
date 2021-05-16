Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.11634.1621204371240607285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b6F4WtZl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id y14so2365693wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wNHh85zFxrFiueSK97ZYBNIvRXxpoIcvcJH7xqe3NhM=;
        b=b6F4WtZlcK6hsZcHxyRCJyi3PKE/5QEwcb7fyNNTPlMJ2P/2dGWjkS33jo4ykBBzJi
         N6If8FnAvKg4d4TDCwX6dKNxMyoLTstvHvdzzTe+osPpIu8QH7htTrQHJb76VxBDp2VC
         MIn6UbL34g7G5+S4m4LKylUI5WByOVHS3ZYlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wNHh85zFxrFiueSK97ZYBNIvRXxpoIcvcJH7xqe3NhM=;
        b=ercxjU0UQEZWF5f1mCJuOLsa5ujX06pQ80muAkuoVJroUkfas1Qjel6dL7entxaqGK
         VtSrM92N1WH5vn57UZp1WZbiEwCDMxDT3Te92yuLyJ3KuWvB6vL3zwiR4FXQubs3bdVX
         otGGMB22qDmtlrKtmQ6vw/WYIV00V3FtVQ8mANAG/4ORVMMNojXbxAmIPTlLjoeDprhY
         y1wGaJMFz+VC31RE+Z842I27NM0URBwvXYFiTYMQXpPfH4uUnkl6X3HHeyD8qaqZqbuC
         KKkYzTjgqx9VN40N0fBnNVi0FIKy6RWbIgbGuI4uaJf+2WYHZxrNY71TbrFuw01y6+7w
         SnCg==
X-Gm-Message-State: AOAM533ahIBV8cgO86hJapJ+D/jdbGkCV8fQAYcdup2auoe/kEqlkDE1
	z3RXU3eH1RjRabCiUVa/0HgQXKcInWaTvA==
X-Google-Smtp-Source: ABdhPJySZESJvTtWz3DW9k5IE9sBq98vWMRr1Pv4XK7Z400LWw4X2Ul2Cqa/L+F5iix1k4x6CwGm6A==
X-Received: by 2002:a5d:4845:: with SMTP id n5mr13147355wrs.314.1621204369801;
        Sun, 16 May 2021 15:32:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:49 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/27] libnss-mdns: upgrade 0.14.1 -> 0.15
Date: Sun, 16 May 2021 23:32:23 +0100
Message-Id: <20210516223247.2401235-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libnss-mdns/{libnss-mdns_0.14.1.bb => libnss-mdns_0.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libnss-mdns/{libnss-mdns_0.14.1.bb => libnss-mdns_0.15.bb} (95%)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
similarity index 95%
rename from meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
rename to meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
index 9a83898e52e..75e8ba06d97 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
@@ -11,7 +11,7 @@ DEPENDS = "avahi"
 SRC_URI = "git://github.com/lathiat/nss-mdns \
            "
 
-SRCREV = "41c9c5e78f287ed4b41ac438c1873fa71bfa70ae"
+SRCREV = "65ad25563937682ab2770c36d56667a754837102"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2

