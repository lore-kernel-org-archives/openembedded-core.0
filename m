Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.35303.1612792390181463172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JsmGk0OE;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 123so3433639ooi.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i6G8B4NvIqcx5MaqWap+OiwlSWJtyS4vu0/cvCByb3Y=;
        b=JsmGk0OEuQQzjbR0ofJHJyhs5WflWh+2i56kRo/x7lr66CoLQDPhSgceV0+Dfe8AA5
         2h5QgmsaOnRj8g+AfBXgB/wEDoh2kyMZxe4pjxVar8cImxNo1sk5kEoTLKxzWQzz8gQ6
         FKuC9+/S/8GbLbDpOH8fK/SXHC8G0O5m3Ho3kjCDWTRj3PNpYyZG0iQS0Ah1CJsxt4Ts
         J4hofzhiddfrBAi1nBknnNWD7350WUxKx1LhiQ/6RA6jpp1LlQ47EMBAve4O8i01JeNg
         RHggIeN979oO9DihuAUE80RYKYEC6WHJOZNXvjMDp5E0MyhcdvJcsESWw4mm7KjqEPua
         +m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i6G8B4NvIqcx5MaqWap+OiwlSWJtyS4vu0/cvCByb3Y=;
        b=QWzFMOdi8CXtJkh3DEy63Mht2E6PH/8viKr3OFL5TvDIj4PMIThOzqqU840VegcChT
         W3l+ZK/gWLJrGKblaQgnn6px73qIjKVE8fcbSk/QIA6tVxsbPKfJbJ6FRvwfpaoaJCsf
         RnIhXveI7W/JDMSp0ZMZ66s7UPyxIdTj80nWBlBr7A/AGIAhiIEP7FgPaICDUb/SOtQa
         bt4q6Pqqp85Dlf2kG0G1i5Anz5Kg2XdMLmCq3j4XdoxRFZdloZsAUumkzbimERf++lFY
         eFK3F2cL02DkN4945MDiAWHyNvWO7i5dz+bLfb4EC8HP+yS9EayQyM6ccXwZZmzW+x6p
         YoWQ==
X-Gm-Message-State: AOAM533MqLv4D5sxOH4p6mcvQVdORa0cheQPgkz7Ib2HJKHt8U6buykq
	0e7wry/FUXPE3Alt/T++7tfmtQ7cCoDzRELxoa4=
X-Google-Smtp-Source: ABdhPJxsRGTsNV0PADuIRTmly7Bx51F4KLBaRhS7uDVuQ3eq+XbbvQQzjGAEDxms4yfeSJwLGHypyQ==
X-Received: by 2002:a4a:dc99:: with SMTP id g25mr7230325oou.14.1612792389109;
        Mon, 08 Feb 2021 05:53:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/28] ca-certificates: correct upstream version check
Date: Mon,  8 Feb 2021 03:51:56 -1000
Message-Id: <ed36f9145923b70556a7bedb34255042fa507a80.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bc2943a7819c7e6d1bd4c1c03b265671811784c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20200601.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
index 37ba51ce6a..6f39df7985 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-certdata2pem.py-use-python3.patch \
            "
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

