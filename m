Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.7658.1593486339374778161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=m/F8cDOg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id c1so1602959pja.5
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WR2lg9He59FzEYeBEdQeA/9Z7R2gyQk2AWKSnSQvgyA=;
        b=m/F8cDOgcNWymLF56AeIHC6sIM9R64bso859kEOb2nr/CwlI0gDVnxznw2vA++pJBN
         Y58/pUugSUjsxMjxqkwQ9fi5QclpHcWnTdpNie/OANrUUduSO5knZspBIoRmzpvYKWa2
         dY8yVzKUsObQ2CS5HQ7+NxM2Zpb9p/XzOl1XVZAa0qCob5rR0+f9x8OxIPpsWVKQ7I22
         CPDXwavMsGO3pq5xcYmL+O/lP6CDE5X2Jvba8dTn6YKcvXA5BGUfqguMuC23XHgquNbd
         sh8Lt0kHQEwYZipZe8EoogxRH5+7wEJ/dPToiObSFnesrC5aN/p/SvpWVEX2jfFGvnPg
         rTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WR2lg9He59FzEYeBEdQeA/9Z7R2gyQk2AWKSnSQvgyA=;
        b=XkYUu7LLtCGLkFMbNdVR0+r+vY4LzUus6dSsAcXClqMt+kAmfHPT4Uj2dUAQdDlFus
         Cct0+0UfMw622N6et3VU+ul/NFB6dLDLMbuKHFXViWb1is+NuljpwHuYCNeAYt2EK9PE
         CwoaqC+UqdzMzk8vwpbcpNwKgs3vNrbWws+a2QKoE/Ex89nFvmMiYHaJFbcW+nUiwJ+4
         MeWZpOOtMDdVG8gaxdGe8XwFzJocQc+MM4mLzZf5Akpg5+7nzrCIzt1XAx473hhVFgts
         ulq8TlyOOCCU/u6PbcTSwIp+t6FmSLd9aUqUplJZzihbC6V5PYNfzk0M8YdaC0OYhwJT
         EKYg==
X-Gm-Message-State: AOAM533LtL5MLMHmEg5lQyPqAzsQ4OipzUpZpkCfwY48w1A3zogQr0YP
	b+DUPQdHhJ0PMkySRimQnTsHwt1Aw066Wg==
X-Google-Smtp-Source: ABdhPJzKXi3+W+EKW7t2bYqZY8hLtcbFttN28T+F1cBLtC2e59+mt+r6u3Nv02PK1oLOlrT40UEk3g==
X-Received: by 2002:a17:90b:916:: with SMTP id bo22mr20514702pjb.100.1593486338402;
        Mon, 29 Jun 2020 20:05:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.05.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:05:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/22] u-boot: move redundant-yyloc-global patch to u-boot-common.inc
Date: Mon, 29 Jun 2020 17:03:20 -1000
Message-Id: <2e128a775a3d51dc1856a35e2f5135d3c156d10e.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

gcc10 build issue occurs in both u-boot and u-boot-tools

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{u-boot-tools => files}/remove-redundant-yyloc-global.patch | 0
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 1 +
 meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb                 | 2 --
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools => files}/remove-redundant-yyloc-global.patch (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools/remove-redundant-yyloc-global.patch b/meta/recipes-bsp/u-boot/files/remove-redundant-yyloc-global.patch
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools/remove-redundant-yyloc-global.patch
rename to meta/recipes-bsp/u-boot/files/remove-redundant-yyloc-global.patch
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index edd0004792..4a17894c49 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -15,6 +15,7 @@ PE = "1"
 SRCREV = "303f8fed261020c1cb7da32dad63b610bf6873dd"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
+           file://remove-redundant-yyloc-global.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
index ca8876ff98..7eaf721ca8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
@@ -1,4 +1,2 @@
 require u-boot-common.inc
 require u-boot-tools.inc
-
-SRC_URI += "file://remove-redundant-yyloc-global.patch"
-- 
2.17.1

