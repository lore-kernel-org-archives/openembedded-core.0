Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.26542.1592249773487003808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ASnSrczB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id d66so8260681pfd.6
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FTexyjk22z8SgK7yvhH78iGzsUvw21ED7O86LQiABu0=;
        b=ASnSrczBGu33B0AqEXWSrag0LoejL5YiCGW4seIMDx9B1pA8WymcN0O87GmjyxdJJU
         tSYAiwn8uL06BNLsjbTerM32u6xRxoXCKUjlhOHLR8mfxbuSEF0rxZXc2JJLrk+z4BL1
         LpL4osmqXMcd9NaAl8O7kVTWMA/zVtzQB9MBkBXcqxhhgBHLvO88qMQqob96baBetxrz
         3LLrQHEwIQmxTipwb1svCX2p3VO17ZELrgFRQmjdLG/KBJ+zn9A8UsRAo1KYyAoHznsp
         p5mecMdKiBQ0Ie0aUXDKjUOjeZE7GdaDaRcgbimmgBOUGde59blwLUd5cMALrCyua/at
         3O0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FTexyjk22z8SgK7yvhH78iGzsUvw21ED7O86LQiABu0=;
        b=AmXfspa2tP3HEVzmZH1fZ++Jsur8kTOf0V9qBqrG9u9YeCLhmY9HkuJwx9FsPjTsQq
         g1cCGMWsswaobqzNlBTsMtG28tsXqd5yyo5n2AOzatTEBwwTvxZe1VhXNLr89ip8raP7
         5pILlJCP7WuGtrlBWvofJ0IADnCOCXxJbDw6EHGsKURYOKAZSlr7iRcv7YCtMXcUQewC
         UDJsPRJSmzWEGw8GzKIFiOlcasF5GdPQJlpPS7W8D8fFyyJ/0rVSCEtzt8h0Ud/BovFj
         j0iYnawsywdlJjq3sLM5r0csunFbsef2qC+fNaGfPzcwTKpZGIqybudMZphaZYVrWxKu
         anlg==
X-Gm-Message-State: AOAM531+YIKdXtJlNh4aHHrd/1g9z5dHt0Q9A0aya0dgItYAcgF+xiKo
	Zeu9a3LlsAs93SOB6vTqt8vSUHxiSfQ=
X-Google-Smtp-Source: ABdhPJwbU2Kj9gKD8LcXG99rNVLjMha8V8/zRMVrzSVDCHa2sax8NTuB6Za/Uqe2rdUE1WsfmwelfQ==
X-Received: by 2002:a62:382:: with SMTP id 124mr24696819pfd.190.1592249772568;
        Mon, 15 Jun 2020 12:36:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/21] lz4: disable static library
Date: Mon, 15 Jun 2020 09:35:24 -1000
Message-Id: <44d22ea87fde918d32957bc757c6c98482681f5d.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

It was found to be built in a non-reproducible way.

[YOCTO #13925]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8f3f03e7ffcefdb6a97b747a26276dec4bfa77c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index ed4452c82e..6510156ed0 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_WHITELIST += "CVE-2014-4715"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
 do_install() {
 	oe_runmake install
-- 
2.17.1

