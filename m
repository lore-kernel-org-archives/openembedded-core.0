Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.5906.1626265583986701383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kd+vZBLv;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso1291007wmj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GXNZmZ9wp4LLuPvAhDfxVTeODczQgJuOvJnuVeHw/zo=;
        b=Kd+vZBLvkJsJIGNJsUuloqyv0X4qzySIrSuYhkKgDVxOZG20xxWcnEGjOUHGxTDQNN
         eBhK+elAw4kctMCugiOjxoR8nocfRn2V+w7G6OaayFzDdRueaulSMkcXMFXCrQlvYj6X
         vMtSvWQIcDsTJG9URqxgLoXbkY7MdHeLgzvknq9bb12ZTXnF/Oap4Ofl5rr6H+Lql9iK
         n6jdnk03hB5PO0pnFsjPcNMCvqbx/5oSw5+chwldkF94ZpaHivwuwcdSFpH+yWJtPLen
         yKtOPGPh6GPjlNFrQuQcODaFQGrk1egK7JLWglhQvIxtBd3bdub0WGZPWDmtP/9/xctB
         dgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GXNZmZ9wp4LLuPvAhDfxVTeODczQgJuOvJnuVeHw/zo=;
        b=nGBzmYvBIrwQ8hROr7D49Ld8k5CzkwfImNWY52GVdVf7WelfRGA+HiyQYrc6EUzduy
         rtizBIqHwyFVsiCvVk7R4KLC1lm9Gn/uYIJVIMGap5aGUYeeXTaY6F8hU3CD7/4dEUKP
         YepZLNowokgAMZ5noxCQ4g2F6k6PljnrfXVlgu4ys1jd/3mvH0TqVRQ+0w1YZcuoKxtT
         01+RVywGYltFFF6oaiYnwKt2l9dJx2PriY0Cy1A1Spn7J4PFNN+zkKRtwZxLVAl+y5u5
         xQ+vfXMxa7A7ACnCSwTVn8ZhBX9UD+VwRcykmb8SfpMNMKD9m3ao9Euc1AXkPKpXc1YC
         EjGA==
X-Gm-Message-State: AOAM532E5k5uc9ssR4SHnMLdqz3XJ/2Gz+fnVDNj+p2tNOUcwdwQMjmC
	Okv2mrZgOMcNatG0rs5i6tfBNXfPats=
X-Google-Smtp-Source: ABdhPJxZuOZLM9kgTxRfsyIRNAbHjWT4zrmsPdNcc6z6haoyUyeeqVFloYGbi+6RtyFHq5XLTUtpIQ==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr10752508wml.59.1626265582679;
        Wed, 14 Jul 2021 05:26:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/21] mpg123: upgrade 1.28.0 -> 1.28.2
Date: Wed, 14 Jul 2021 14:26:00 +0200
Message-Id: <20210714122606.605142-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mpg123/{mpg123_1.28.0.bb => mpg123_1.28.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.28.0.bb => mpg123_1.28.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.28.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.28.2.bb
index 143a59ba63..ebe11d4138 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.28.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "e49466853685026da5d113dc7ff026b1b2ad0b57d78df693a446add9db88a7d5"
+SRC_URI[sha256sum] = "7eefd4b68fdac7e138d04c37efe12155a8ebf25a5bccf0fb7e775af22d21db00"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.31.1

