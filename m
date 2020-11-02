Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.1230.1604335772964509477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ccyd4VZO;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id o18so15055931edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vhROiWdl3fwN5TDyiJHjWCEMYs+uggKClrJ6QiM+8g=;
        b=ccyd4VZON5ia/EVbUOt9sqlS8rbHHp+rUuDnESK2AQ5vtVJN65wxZ1llSzmN9mh3Bq
         oCfeetyq43t1wAUFzunN20g6Vg0zCmsGBu6FFIU9G3HA6xn1OrXRw+VzKjQBOX6swW1e
         NfDOkgWJxbjixV9ZfQfaCMGAbfNc1k5VYxAfiihV04EkIXV2dRyxDZeKB8owU7DIhWTw
         VjZ27Z6I0HD1yPGiFsGWExdVXJload9IcjOcLljn69+pnNVSE8g2sdIvO2CgPA3BzQ5h
         fF/bMk/eiFDYt/OZXosjTjXoUSF/q2niFVkC+NlMzdy5psEgVwRSEwJ+OCMchKrkfcnG
         8Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vhROiWdl3fwN5TDyiJHjWCEMYs+uggKClrJ6QiM+8g=;
        b=j4KEDWS7Pkx4Fn2O7M+PMTogt0LwyEUxCPiN5I+Z6wBkW6XMLAUTLz5H5cEB0Nz5fE
         EG4g5H+uzjz00JkuVP34o7RuolZ3wcKEeGxf0pJLZXwQudELmANHKCN7iVaSIgqASE6k
         lPz8NZocV/1jpKVr+Z3v15ZUX//B6xT0+KJmTWQFvvWZwyiUCadfW2q/i9WgRfPTZhBi
         ISMpbwun2J3QLwkshxGHMFoAufNXEZ+ZK4a6TUGJ17vlcC8Uc+21Wv7Byv1+2SunmUW2
         3RjFpiWbJzhhKmMQHaF0GhTZ/RLQLf02v/Wb8XIXx17hkqgF+QeYIXVmNxfsI6/KV11U
         quRA==
X-Gm-Message-State: AOAM5319PsqrvWD8HfYq+iAjXGOTsoEMcEvWt+oZJ70nnqFrFzJEHQ+o
	Ll7qv+s46IeMR8GqQGpQ9AQKa38MxNy0GQ==
X-Google-Smtp-Source: ABdhPJxqgVmJJ8ZcBAK7YxJUtwiha9ReamnOSd23PcZx8Bg938e9t6PfLMTt9lfPLn5YAcsJnxdxJw==
X-Received: by 2002:a05:6402:6d8:: with SMTP id n24mr17558883edy.168.1604335771371;
        Mon, 02 Nov 2020 08:49:31 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:30 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/80] curl: upgrade 7.72.0 -> 7.73.0
Date: Mon,  2 Nov 2020 17:48:03 +0100
Message-Id: <20201102164907.27572-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/curl/{curl_7.72.0.bb => curl_7.73.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.72.0.bb => curl_7.73.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.72.0.bb b/meta/recipes-support/curl/curl_7.73.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.72.0.bb
rename to meta/recipes-support/curl/curl_7.73.0.bb
index 7d0268253d..0f26b0f1af 100644
--- a/meta/recipes-support/curl/curl_7.72.0.bb
+++ b/meta/recipes-support/curl/curl_7.73.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "ad91970864102a59765e20ce16216efc9d6ad381471f7accceceab7d905703ef"
+SRC_URI[sha256sum] = "cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dca4a29d88a4bee146d131"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.29.0

