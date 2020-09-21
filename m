Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web11.45662.1600704694879945142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 09:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f5Yrcbo9;
 spf=pass (domain: linaro.org, ip: 209.85.167.194, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f194.google.com with SMTP id z26so17518609oih.12
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h56g5Gg0FQieP5A5PkmH1UqPVSvxYDUgFBjphj7ozQE=;
        b=f5Yrcbo9SX191owjfUNtRCrTJzNrlj5OzqkHXRdRTY4w5WJ7B2VL3fbxapqFrjApZ5
         ADsYcPygksgc99i/hDsqAn538L0GPB9KS9vT5gR6wl3sbDGZMBloFk9KSmr5LOKld5Dv
         QtsvmsP9oqhhJ6OfEZqmJS+/HPE4XS3gnZOZq01zVgRNdZGowGqeqJZT6a9CwpZPj3Of
         OLdNqHenKKgTzr/bLfjK2YhYh0LwMN67xTdPANZoEO+Qiqvx7dWRR44mfo8iopGNM7r+
         dnSe01Fe6AHcxvsOshXCT/YHVPCwJql5aKpt1ZgUL96FPMYO+AO14/YzjTI4hXF2Bia9
         0ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h56g5Gg0FQieP5A5PkmH1UqPVSvxYDUgFBjphj7ozQE=;
        b=M21hYnZz7SaGFm3Pit3qd/l6nEwfXDWtoT4VDqqM2lQ9f4kqxbB1DvfRmRZ2GM2bqq
         XjBflb5uioMjjbTa3WKeV/n9Sh9Jb7NLDCUvqtmMZE7RFN3IOsYzaiZSKCusClr/xPui
         kLp0RgVifs8Fxg2Q30I4aip6ahFHDV4HGEY8kugQz9tIupGIah+WrsofoyGVhFFvXt8m
         x2jdKK5pJ9KtecdLbIqNSpczK/x4yLmsP3DcwGCq8sUkvyXUBeJTceM8p1w4Vb6IvJlU
         1udpzkncZ6FmWtLTXMytQ7nyNzhlYrfo2hFnez9ZBm1H0fWUsnO9pLavc5kQ954eqX8Q
         rLFw==
X-Gm-Message-State: AOAM530IgQTw3GxO2KMg613qnZfTRFzmnWmmv1XDxFA+x+Mn2Q2nSQ+E
	pTLOLJu21AzAqUXDjHn2bqlYOTtMKxNavA==
X-Google-Smtp-Source: ABdhPJwbZ22dBdd+wLLATMMN/51XKz8raCa5TszsB0bn94NfIoMpThUisjLJUHww2iCjkohEBcsN5w==
X-Received: by 2002:a54:411a:: with SMTP id l26mr98827oic.12.1600704693932;
        Mon, 21 Sep 2020 09:11:33 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:3bb9:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id f26sm6062151otq.50.2020.09.21.09.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:11:33 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	alex.kanavin@gmail.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] mesa: update 20.1.6 -> 20.1.8
Date: Mon, 21 Sep 2020 11:11:22 -0500
Message-Id: <20200921161122.8060-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../mesa/{mesa-gl_20.1.6.bb => mesa-gl_20.1.8.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.1.6.bb => mesa_20.1.8.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.1.6.bb => mesa-gl_20.1.8.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.1.6.bb => mesa_20.1.8.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_20.1.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.1.8.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index af2a5c0f9b..dd4619a06b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "23bed40114b03ad640c95bfe72cc879ed2f941d0d481b77b5204a1fc567fa93c"
+SRC_URI[sha256sum] = "df21351494f7caaec5a3ccc16f14f15512e98d2ecde178bba1d134edc899b961"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.1.6.bb b/meta/recipes-graphics/mesa/mesa_20.1.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_20.1.8.bb
-- 
2.28.0

