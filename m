Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.60123.1606744027332625624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 05:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D7A+lcPH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id h21so25232605wmb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 05:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqMHzGEHhAupWGqBIS9yelsjhKoMOzq/EwzHvgglPJw=;
        b=D7A+lcPHnFU4tbSCdhPc/eAwz+V1hyJkblZcc0iusu5pQCT3R3MQNGtDfvsffoO1zI
         L4rnPxaFcj/5z2DuL5zbZ2TJADTUfpfjXZNxz0XMl6HcGVYmSi663LpAm3obbvoEpy/o
         LHM0ABHJuNTo+dH0pG7/A6Rnb5h/5pcdktvCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqMHzGEHhAupWGqBIS9yelsjhKoMOzq/EwzHvgglPJw=;
        b=ZrN11d27nA0wioXQit0RPW7BBgYQVTCn509bXe4qhfDz8OtMDVn42GSgp/fKzY51WQ
         15jTtccOi+pwNTBcbybESawW9DOLN94DuhviNNvTIjXDeGQDO0YwhbwQfOCv0OAXqL4m
         nrw0rAr/q6zj4Rskg40pdkC2y/NLDECVbXGVxxEWB00sMEHbypXFA+EfsscYRSt0SopW
         dHUKZTeXk6Q7GgepRBjf6PhNF9KU0U7BsN9+rbe+GOOHejOqcf8enCCwHo0yfB4AeKjV
         NPB0gJPeqzu4b84U8eyMmRwLwxZxH/cGWteebrUvrHFCZo4g34e5PdSdMTU6/M7TGp9r
         GgWA==
X-Gm-Message-State: AOAM532HBFhdVx6ruXnXdTqHveNczNvgu6td7+Z2+cigxsAaLXq3DX1o
	cwIFjhGofspSfrq3k9kZ2448k7UuQanFuQ==
X-Google-Smtp-Source: ABdhPJwhRI0+5NJ17cNHlr+oCRVrxQZJOl65arC5k5Td19IHqypjSW61StuNXeq6qHWxNKEA3pkW/A==
X-Received: by 2002:a1c:2681:: with SMTP id m123mr7001677wmm.175.1606744025380;
        Mon, 30 Nov 2020 05:47:05 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id a184sm25254879wmf.8.2020.11.30.05.47.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:47:04 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lz4: Use the new branch naming from upstream
Date: Mon, 30 Nov 2020 13:47:03 +0000
Message-Id: <20201130134703.3279682-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream renamed master -> dev, update SRC_URI to match.

[YOCTO #14135]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 6510156ed0c..455d2a5141f 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -11,7 +11,7 @@ PE = "1"
 
 SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
 
-SRC_URI = "git://github.com/lz4/lz4.git \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
            file://run-ptest \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.25.1

