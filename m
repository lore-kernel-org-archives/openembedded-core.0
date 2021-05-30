Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.36985.1622412540890419324
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SdlAWffM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id b145-20020a1c80970000b029019c8c824054so690010wmd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pDWyiKCMq+6uMzKjB5p7f8y6hXLGrWjqkUKyBg/7y5k=;
        b=SdlAWffMNAIXZ62YlNXEuPKPRzLJC74Gzy/k+LQfyKebMY28cV6HMfK1JzJT6VTTFR
         5o9sEosG3CbswTLB+1eUyvMUlOneedhZm41vuvlOd9yVfZTgpRuSepngJcJfFKglQMMj
         U8fcQcACL4RtDFitdvEkefPXIMBxUu7dzTw38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pDWyiKCMq+6uMzKjB5p7f8y6hXLGrWjqkUKyBg/7y5k=;
        b=pACOikp8B6Ww7rIvSymKv8J4n60AwOGM2EOTARh169SX3HhxKhHQ7263VnRp0uR0fs
         0o32bjCCeCOVVG7JQKFygVLr4MoSi1j+7NbriH2Dj/nenl51oBCaOzDqM+V8cvU52H/W
         Dgx1BRXKo6Ty36xMd2a/rQK+52CWD5PFV9OxyDfODOZy+4rC/DKPd0BAIAmdxlDfiCHN
         J1lgqSAXOEbidV9Y0x8EVNKd/KySKQ5mOz33NavX3A8PCyxHYfj4rSe3vkkpW7NAAUHK
         JwpgzcBlO/1nfHLAZd14kjpSOg7ncjjXU+w1NpWTOt/AiUU17kdNmKuIa63KUU1VUF6d
         dwAg==
X-Gm-Message-State: AOAM531XrOTIKmEzJ4K2SyJIwBXYUDjoN4DOiD3YP/h7P+Q6sLiJU8VO
	jP+lMIDx3xIMX8gh5DrZlPRE5s2RdWhJRQ==
X-Google-Smtp-Source: ABdhPJxbncqplo3eTsiWoEJkwrs8whgMYXV6urX64CU4kyKstVmilQGnMYr74NPmR0qeRTj8EnKHbg==
X-Received: by 2002:a1c:2743:: with SMTP id n64mr22879226wmn.76.1622412539358;
        Sun, 30 May 2021 15:08:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/16] python3-importlib-metadata: upgrade 4.0.1 -> 4.3.0
Date: Sun, 30 May 2021 23:08:47 +0100
Message-Id: <20210530220856.2830501-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ib-metadata_4.0.1.bb => python3-importlib-metadata_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.0.1.bb => python3-importlib-metadata_4.3.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
index f4013da3456..f4ac3c44ec0 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "8c501196e49fb9df5df43833bdb1e4328f64847763ec8a50703148b73784d581"
+SRC_URI[sha256sum] = "c4646abbce80191bb548636f846e353ff1edc46a06bc536ea0a60d53211dc690"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2

