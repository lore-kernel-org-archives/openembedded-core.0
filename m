Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web09.8171.1620831499154383741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UJL0SaBH;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id s24-20020a4aead80000b02901fec6deb28aso4996156ooh.11
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CTtxDynO2Nibj8utovv8To1WxtLpK9eEQEAtv+ioqsU=;
        b=UJL0SaBHDtTm4lVxoxJ7UkguwUVoPn/nThKWcOgBDcWmCSSZ8NWOTgPAzNnHUw1m2n
         S84yb4ZKL/tZapuIqoJA5kyQHeDuxcKXTzGDEUG9oNrQx2gyRzGXEK0/zADX9d1j+CgV
         Q5kdqTFfNbt1Txh7XIR9qwGmYZvULvD/zxNoB20WpnhBvCz2fz62RWgYC1NgQjy/cv3f
         5DBkRA2I56UO/1h+3GoIdygAxSnWh2V//BEZISJIdRwwDbU/a2801kJbnNgGiiDLzyVC
         5DcWDIX4A0gMEK/vy5ZDrz9lLLKX1BgEuh6Q8062+Gj1w1IgUZz6OMw4bwUsm3sTqbyQ
         k+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CTtxDynO2Nibj8utovv8To1WxtLpK9eEQEAtv+ioqsU=;
        b=AsfKwtAuHGisISePKf8nQzKgaVW+ugOT24BYocKBCPCSW53V6ULvkvsmYhQGqzrY7K
         mqh7xrwPjyyrpRY/VlIk+IdvTL3FIi9BxrTD070ud1AEk11NXy604ebEBVwz77LDpZLn
         JqbMuZjokpDAm0TRCqBZOpDSGAuhap0TVaWoOmLfzk6CPNJPJHWJJS8ET/2+Dai+HYZO
         4K5Z+oOvFAgOdyfQH/z0UP5a0FDrMzLqUCflGALxjpgr7P0d07qBBkZzWBFf4LwPZqGU
         8U9kl4T3cMsqaTPfXlqbx8+UafNGt12amFvTWi7mvS6HWg5aow9S7p1wOUjS29sKSMQs
         H39g==
X-Gm-Message-State: AOAM5302//6tQFjqfFRM/TkUHidaq49+Xjg2Rr8IXwQgviYHFBLVp8uu
	Bq2tN/SuAy+YUCDwoYPHmFQp8Bgi5L9Lb4n96Lk=
X-Google-Smtp-Source: ABdhPJz0jYNPPMMm4w5f3QXw9c6kTtLPqWYUP8eqCxBWTKgWPbd3b6P+Xq6gO3u0tf0Tkeifs27MYQ==
X-Received: by 2002:a4a:e5d5:: with SMTP id r21mr28553209oov.1.1620831498103;
        Wed, 12 May 2021 07:58:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/22] builder: whitelist CVE-2008-4178 (a different builder)
Date: Wed, 12 May 2021 04:56:47 -1000
Message-Id: <640c40ed2e29feb0e130edcb8e4185a11a3873be.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 107987b342a834badfad286474b03543b4764d23)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 0a64c31ab3..9d5cd8cde6 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,3 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
+# -4178 is an unrelated 'builder'
+CVE_CHECK_WHITELIST = "CVE-2008-4178"
-- 
2.25.1

