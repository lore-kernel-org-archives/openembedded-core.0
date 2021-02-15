Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web08.32110.1613399937187724332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VsMhR6i8;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id q186so3968166oig.12
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mZwls8DH+saXw3RinjrKZCk3dcBb+juY4i8G6VCP2lI=;
        b=VsMhR6i83sLlIn/FC7wzSnC1+ShgaVzYXMfIJBUrwvT1BP2765Me2gncb2EJpTRzi7
         2g1rAGBrHoLn+iEtUVRvBlYjqcBfio4Rp8SOzEgUwris5yL/DCA9v28COUpryiaqyqvW
         zd1penSD1QiP6Z9MUqtUTbUzljTxuahbC0AFefk8HehO78QwRWHMyQRMH5Jef9gpILA1
         d3TedEadXNi02PMgCfwRup4zz/vW0gGyPTbdVHbJ99EZXETzN8VZiRdaDkKGn7u54Sl3
         rdIz4OEh5E0Q3ULoGxlCOIUpbrcYcwZ97/KwVyTCcIC92DEapVkZi046fRAqCvGCPlPK
         BcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZwls8DH+saXw3RinjrKZCk3dcBb+juY4i8G6VCP2lI=;
        b=SnAN5Us3at2nH5ryyoUS24h5hcb6bjB2B2XBg4tiFubDrhyQYWmTmd6S1LPuBeBuqo
         TtfL0Q53gFdcH1GzzdBO4I2QZyveyFiqzJAXibQDR3m+X9N5HfhQYGKhfl0wo7ccmQjQ
         M42VtvV1i8h7V3syNZYWW9KZSIAgBqQxNxTxzEQ3D45In62RPUMoQ6Ss4U/nojsgXOPp
         5not9ZZZQUYvApqZMwI3NBqKmWmUEWHcf+AScsRtVUIfGzTAc32C6ups4SeOGC424zuQ
         JgD+bQVObphK2AGLhtA4m9gZgXy9UUwxal8JYSOnGE3LBoYHz5WwagKC7knaDJY6/AZM
         /wIg==
X-Gm-Message-State: AOAM530GuDiHqKzm1+zCKZfiBpE7hCP9JRLS2WTM9TCkRFl7YvhjB8+l
	WwEyYrwlhxsCgP3hldqzCFMbSLx2TyKqbG94
X-Google-Smtp-Source: ABdhPJyI9+NOOZJGjIEjm6l70etWpXIbfFjgEsi1a6J3yD512A3MR9YoBb/jw1fuK/wnUExH82XmKw==
X-Received: by 2002:a05:6808:10cd:: with SMTP id s13mr8565211ois.117.1613399936166;
        Mon, 15 Feb 2021 06:38:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/17] distutils3-base.bbclass: use python3targetconfig
Date: Mon, 15 Feb 2021 04:37:25 -1000
Message-Id: <458b8f495d6c5e5dfee5b917e1ce14bba31a6d05.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c8f666097802cb594a759989edcf01603a22df3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/distutils3-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index 7dbf07ac4b..a277d1c7bc 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,5 +1,5 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-inherit distutils-common-base python3native
+inherit distutils-common-base python3native python3targetconfig
 
-- 
2.25.1

