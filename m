Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.19288.1608974868777922642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ag6hsQyB;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id cm17so5578987edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=umGa6D4KjWoAAVCVd9pdgsn7UhVU1igp5ATc8ycMkLo=;
        b=Ag6hsQyB9V8npag+RsutKhB9GJhZWoSEFGTeD/NTMldD7OFcHF5+y+zsvLSgrVNU0Y
         A0wRSonBvdo1VU3V0KUMmyeUGlO/mYfKUggpRQl8ItA/h7bPEk2LtvcjDmAk5bQS70Eq
         G7kZOHUmeoEJIavX2DMVrcCSPo3SESwqLxgBbwi0bUytW9oU2ZGCJ1VRAQaNyG9u7+i4
         hwuFXfPSnVQMuRmba4E2mUt8Jjk3RzDvGK9MTWoXWl1AFhmNN20vAWX5bjj/g+H6DDYH
         jJSLYeYQ/2Rkx8kRy3Qz+DAOpB6weWKtDQLWCZHqEsG6Xnm1LQxLsSpmVESQnTJ2gSs2
         F2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=umGa6D4KjWoAAVCVd9pdgsn7UhVU1igp5ATc8ycMkLo=;
        b=TNn8wq/1qiIlrbZYsyQmS0nmCXBE2xzvNCXo2O4oA9Q1gPwgABlPjKhBpjFCABz0E5
         R7hRz8Xi4sQLnDuytrU245bbXkmEU4X+Nq2UMP4/sjd5DF1y5gJK02cUjYyeMPEtp01G
         a8fLl3RqwdRChjcd/c/igg+Qg30T/h0bIIF1HJoTffdiACZODLXt3OgD73YD6PAy8m4Q
         I1w0tXDALMbe7mlMaD2EvyA2XNe6DK1rAmsQM6KRgZOfzDi6L2CIcj3P7KIbeOcTSVqz
         bxQIHuo1s3ToC21sZajZs3D3fzmdv3ZO/C7oSU3cGROCKfxfwIh1vmzNucmPDeKJGVyG
         mKXg==
X-Gm-Message-State: AOAM533Cyie5V9iXg0ZuuJarrcvghYvmbkIOEvFYyWKH9p0R/0ZiLwUK
	DvFKlTuphECNf947lNYOsV1B1bjazgI=
X-Google-Smtp-Source: ABdhPJwAUhOEIbYBxA8qhMDhX7MXI575Tn2r22spmq7xLTOUivkINGmkWVb3tyLsE5AqrtM5fPkjEg==
X-Received: by 2002:a50:ed17:: with SMTP id j23mr34659981eds.218.1608974867400;
        Sat, 26 Dec 2020 01:27:47 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/48] enchant2: upgrade 2.2.13 -> 2.2.14
Date: Sat, 26 Dec 2020 10:26:50 +0100
Message-Id: <20201226092732.52323-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../enchant/{enchant2_2.2.13.bb => enchant2_2.2.14.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.13.bb => enchant2_2.2.14.bb} (90%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.13.bb b/meta/recipes-support/enchant/enchant2_2.2.14.bb
similarity index 90%
rename from meta/recipes-support/enchant/enchant2_2.2.13.bb
rename to meta/recipes-support/enchant/enchant2_2.2.14.bb
index 3b890e733a..a5080d9c78 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.13.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.14.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "eab9f90d79039133660029616e2a684644bd524be5dc43340d4cfc3fb3c68a20"
+SRC_URI[sha256sum] = "bf7cc9a410b54c29648c7711dc8f210e7b13768508aaf43cc9c4527d5a9c7a8e"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.29.2

