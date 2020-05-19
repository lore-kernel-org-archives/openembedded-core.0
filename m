Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.5785.1589859314193919055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=noG1eOEO;
 spf=pass (domain: linaro.org, ip: 209.85.210.67, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f67.google.com with SMTP id c3so10000388otr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 20:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NLS24jMV/W1zl1m77TVPuD8rv+H+5j/8N98qo/YUVzQ=;
        b=noG1eOEOCY56XEnufL1i/dUlTMLTeOplkXvmaH2MlqteNUsFrpO48Cu8wDFRPUwpki
         BlCeEym7mq93xsF9hqWa3oFFezb7454AS2LDqz/KwG/jAi9sLvtVOsUeqSfALNxNjkcb
         itIdp/U0oWLZk4+5au0bkY9LUzp5fKoebENtYgE48BSmoOj3uaiy2nmTDKDDWxFcHd9P
         68tsP45aRiIam4dqPaH4eZo8ggqeyZcCxtsWpUu3wavX+pRNcKNT3dXMwsHa29q4evW6
         mivUqfRvZE3kYQn7s3rOiuiSoGOFNSHeCHqsBMdZnQ6B+0PS83c9rIyQxiaoD00Q4STT
         5jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NLS24jMV/W1zl1m77TVPuD8rv+H+5j/8N98qo/YUVzQ=;
        b=FqIGOoJg1HfEma/7wEgr0JLiqMvPjrYPTSt1g/FLa8e3I5IthqHxOoyo5UBm++Nybs
         MGe7Q7Rq58mrlYpVT5QZ70mXFybyV2BRg3yR66hxoLkfx0LfzzM7UnU7OaVwM4dq6T2z
         LlJNnMxOKH/2GzBzALf7WSFKkoHKXVAnrws33P1NLVOVRXvq+LswJk600j4hGuA+GsXk
         5BWgVL4ciugsRcl6bCoP3J1a+KWUm5SruZeqo7Dkhjp5Q+7QLx3wt3alvkTlx+UX60mj
         ckqcvw9mIbh3EFwiRN51vng6gcECw9cXYsJnnMOlHC2o0J4IwpyIHSgfETsUTdd3BgZV
         mMJA==
X-Gm-Message-State: AOAM531QKJOCAQQekAskbNwd9WV0DO3p/JPOC/HM17sW47AE2dG05FgT
	J++0i62BSkZ+Iy+Ehw5xE7EbdjhwLQE=
X-Google-Smtp-Source: ABdhPJwYlYNOsXssMJ1/6fU9tdeQR1xBEyla/WwIUcr29M15nx8cKA0UD1S6z863/udsuOwc0MiTKg==
X-Received: by 2002:a9d:518b:: with SMTP id y11mr7353124otg.258.1589859312894;
        Mon, 18 May 2020 20:35:12 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:9c4c:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id 33sm3481866otx.31.2020.05.18.20.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:35:12 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 3/3] linux-firmware: Update to 20200122 -> 20200421
Date: Mon, 18 May 2020 22:35:05 -0500
Message-Id: <20200519033505.357681-3-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519033505.357681-1-anibal.limon@linaro.org>
References: <20200519033505.357681-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 ...inux-firmware_20200122.bb => linux-firmware_20200421.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200122.bb => linux-firmware_20200421.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
index ac7d6ec431..fa0507a88c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
@@ -125,7 +125,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=c27d0c06cd5d376d8ab55860e65ba4e4 \
+                    file://WHENCE;md5=cb9a66eff0464b55335d3a7374fbc51c \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -196,8 +196,8 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "ac291b21f366ae2a37193ec8f14c39d2"
-SRC_URI[sha256sum] = "a30e811b3736a72b874ac27e10662f5e5409b1cadf8aab7ba88e8f8bc8083986"
+SRC_URI[md5sum] = "229a93395f4033da68429f165a62b952"
+SRC_URI[sha256sum] = "6dd7cba25d694c031f65529b9027cc8faaffaddfae70a4e3b58c2e4a0af3bfa8"
 
 inherit allarch
 
-- 
2.26.2

