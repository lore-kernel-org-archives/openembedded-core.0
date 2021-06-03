Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.647.1622735009475153809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CNXg3/3S;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id o5so7689679edc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sVvbAPdvTv8z0wzTLYyXSEmz0WDduIOeuqP9TSCSj38=;
        b=CNXg3/3Ss0ERv+MnBYD5L6mm1ssU6m8OwYzM/XoLJnQwyePEnIN3ueT5jYxaMjqpm9
         8fVTPcaDUlVXeyw4U6H8HRMe6HB0O5vsjgB0Yamv1kjigHUVfniwR7Tdh0wNyiUv4PFP
         GtC6f0jh0faBpckHtWdutnSg9QkTXqARUYc/ZHCbB/wz/vjA75XmT8y5kbXacZ93QF6H
         RrjRQ8iz/W9koxkTF7MLlWg+SB9Yp1crqsHmOdQDSwM9Uki421HeowXtWV8v0X8HqoMC
         DJLRk6RIAAwn3j8rHZ270WmMsf8ZL7dFOu+tcEaYNb+qeBEqVwrdU8VmvQcSRXVWAF07
         4Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sVvbAPdvTv8z0wzTLYyXSEmz0WDduIOeuqP9TSCSj38=;
        b=WRXjb02z3lK20zytene7RR4AQQecNQTCn/tGtYODGuauNJbGe0Gfjhn1hfe0zatLUV
         HTaYuJoIkXLz2YaW1PWfDVvRssMVRWAlvAGISqE59lODexU0hOHVEiPdA4nTmGOPIYHh
         iPflHMQTr83tL8P6g0O0Jig/fcRyhKTE2w9q+4BsW0Xn5s0auoOPCFRGuSKU7p1EHeiK
         +rS8ZQUsPvqjvCjFz0JKnONx/h/JVvGsFZoIEiFk+C4x89vEBfwRa8lqfXoIQSlz7H09
         j5+OPDz4uvrGFCc1VO41ydXDrWL2zlGPLGGxq5bJ3y99HeQhRgMvMK5mEqWUw71kzMj8
         K5vA==
X-Gm-Message-State: AOAM532j6LFVgEoq3NO5YKDPxCtRtJ+mS8pQ8+4IIoi1PZywD0FWM1KG
	WLdOckrrIGt+K+/ah2UExJh5UsD3IOVQxg==
X-Google-Smtp-Source: ABdhPJwmonwuhOo/pgfmBHpNhGhwGXLQVzJFsQiHGUtf8agMhK4Vgfa1DfMxl6awHhui3/uHfyO/wQ==
X-Received: by 2002:a05:6402:1d8e:: with SMTP id dk14mr79893edb.385.1622735008123;
        Thu, 03 Jun 2021 08:43:28 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:27 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] alsa-topology-conf: upgrade 1.2.4 -> 1.2.5
Date: Thu,  3 Jun 2021 17:43:11 +0200
Message-Id: <20210603154313.2894136-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154313.2894136-1-schnitzeltony@gmail.com>
References: <20210603154313.2894136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:
/Makefile
 - Makefile: add SRCPATH to override the source .conf tree
 - Introduce Makefile to simplify the binary files availability
Description
 - Introduce Makefile to simplify the binary files availability

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...lsa-topology-conf_1.2.4.bb => alsa-topology-conf_1.2.5.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-topology-conf_1.2.4.bb => alsa-topology-conf_1.2.5.bb} (79%)

diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
similarity index 79%
rename from meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
index 26542fbbbc..a6b2d7a608 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb
@@ -8,7 +8,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "55e0e6e42eca4cc7656c257af2440cdc65b83689dca49fc60ca0194db079ed07"
+SRC_URI[sha256sum] = "8bfa8306ca63e1d0cbe80be984660273b91bd5b7dd0800a6c5aa71dd8c8d775c"
+# Something went wrong at upstream tarballing
+S = "${WORKDIR}/${BPN}-1.2.4.2.g15998"
 
 inherit allarch
 
-- 
2.31.1

