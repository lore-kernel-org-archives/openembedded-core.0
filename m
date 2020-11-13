Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.608.1605296943747786967
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 11:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aNLB+a53;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id l5so12078609edq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 11:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GgJmGyedSHd1Qbsu+pcpQySglhcHXHYTUWxBnWpgt3Q=;
        b=aNLB+a53pQQVnSShYZu0wT70j1teurRCctGoBokcOaInOx1+9vod/di5pbfa+BgmZJ
         9p02S4kEDtShLFsMQkcJXSafbufnAD3ZZkBgjEBmyNM47P9Zpg1WGqOJBwLEnvTBV+/G
         //h4axEmp34HcAUB+N9DtmtqOiTc8eQbaYLTiF+odXGN1r0v73vn8YVGH4cCAdqRgLlQ
         k/sNV4ak0tfX2G8vRuB99Fecm9jndPDktd8WUJDc2E8sOr7kODcFYPznja/z6FI3byN3
         jJ8Zbl7T2nCeJzIgn6djA9lryA5HZE1Rod3V9WjIH7tDT12e2pRdagGcICF5ZfYpcyq+
         s3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GgJmGyedSHd1Qbsu+pcpQySglhcHXHYTUWxBnWpgt3Q=;
        b=ozG3lT9UtFETmwNlOkzQhtgH8i/jdJ+TAfqinnxQTN9/Vl7jm03E16fLYyfTGYU9/1
         Q5mwje2cRPpVjUMYz9JddRQR+w2Lep3YhOMr0uLqWkIcJWcOv0etVxzAcJzznJ9uXqX6
         E5vm6UNEd/URLSzLqiNlXs+ZoeYbyszJD5P+MEVojwsy/peydXsuBkJaUqqG0EH6AW1i
         /KuyldRF0MUN3Iye59Qt7LCjjIHrgY+C6gvYUnk1tJ4Sb2YXQsgi7Y9z1shMhn8NlSjp
         csRln+ZVvGOMOUv5Ct9PrbW0rCUxYYmqJslIxeVI9ICAAaHjuv9s+cZJxVDLZ7hkoPVJ
         3onA==
X-Gm-Message-State: AOAM533TwkHD7laoOFHC8GZCUOQUtFzy391ZuN3jGIYp48BUm9w8aUWR
	irxUmxfPavFXTgtnYjcUVLQgBC/PHui57Q==
X-Google-Smtp-Source: ABdhPJxVvJtu9ei/j5sksBibS6HVkomzqLUEkJ8FBjAuU4d3c5OWE0mERUwKxY7O4yMTsa+4SsRCZg==
X-Received: by 2002:aa7:d1d8:: with SMTP id g24mr4487684edp.324.1605296942132;
        Fri, 13 Nov 2020 11:49:02 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id lz27sm4499287ejb.39.2020.11.13.11.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 11:49:01 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/5] python3-pycairo: use python3targetconfig
Date: Fri, 13 Nov 2020 20:48:51 +0100
Message-Id: <20201113194854.21266-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113194854.21266-1-alex.kanavin@gmail.com>
References: <20201113194854.21266-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-pycairo_1.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
index 37faabcdfb..8987b7a428 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "5695a10cb7f9ae0d01f665b56602a845b0a8cb17e2123bfece10c2e585
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-inherit meson pkgconfig
+inherit meson pkgconfig python3targetconfig
 
 CFLAGS += "-fPIC"
 
-- 
2.29.2

