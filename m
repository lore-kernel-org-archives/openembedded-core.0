Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.11573.1621204381284077498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DjziPEj3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so1899614wmk.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IKvOmlT92COQqRdTCxQwxZxf6FO4jZOxHuuhJucAXBE=;
        b=DjziPEj31xRXmuXeuEDYmzJRgJ9lyObfyDoPI/VkXWIXR/rpbYGQATqLsYoA/oCNXI
         +flC4ahJ5CcRl7psvV9KBnZndNUVh152OaCWb0ikRYeCnU7RlVzFGuoY73l9XAIlEPAn
         8z5OoQln84UslOo2OBEuB0LsBnd22SAhnvOAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IKvOmlT92COQqRdTCxQwxZxf6FO4jZOxHuuhJucAXBE=;
        b=jZsuyBgXdyWDo1970sAjI+r8CX2IFl+EnmiH4CjrlTWtO1qSQsthBpS3/Lhpsk5Ccc
         iWDzeqi7KALBgRfgKkxji4zZqmjIcmOsYWSNqsYb6mzeZFeD5aoe3fyLZsWmV6QXWOO1
         t5iMUjIiEvzmLBeBfmr39DNJEJsyPBb1Q0dQt1uE0YstBN6HWAftBreejZ8bUqUAldpM
         ltz/bQPYV70FzYy4s6h7wm11KVM3NnL9Zo3W2OR+fdPn9esNrWiSsuN6P2Y6ucW86yUc
         MKfcv/OITW9Msn9HCioA6OPCX2qi37qizcyIwV3kKqS+PASKBNGV318HpGEa4sm/DQpf
         pV4A==
X-Gm-Message-State: AOAM533gNfN7EIvnL4olMiR6SzCX9YCmW9IVhqCMPfDXinc9jxGKpzG5
	AMd3VtvwEADk4CFoeVRZxUjaNuD76TMYoQ==
X-Google-Smtp-Source: ABdhPJwI9EbFr2HLIZ2FH469Qkitjt3aWXY3B+P88JoKE9lYzjkQgwAsh2JVL4zSHLiY2WIczvqGAQ==
X-Received: by 2002:a7b:cd98:: with SMTP id y24mr20337608wmj.4.1621204379870;
        Sun, 16 May 2021 15:32:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/27] diffoscope: upgrade 172 -> 175
Date: Sun, 16 May 2021 23:32:42 +0100
Message-Id: <20210516223247.2401235-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_172.bb => diffoscope_175.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_172.bb => diffoscope_175.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_172.bb b/meta/recipes-support/diffoscope/diffoscope_175.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_172.bb
rename to meta/recipes-support/diffoscope/diffoscope_175.bb
index 86dd5d8d70b..853f8dd3a0b 100644
--- a/meta/recipes-support/diffoscope/diffoscope_172.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_175.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5ffe7f38555c6409bc7e7edc277ed77dd78641fe1306fc38d153dbbe445ddea4"
+SRC_URI[sha256sum] = "b87481752815140e35088647ccdea13297e41a2d72772e842590360b662f7533"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2

