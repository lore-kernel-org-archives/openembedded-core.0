Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.5944.1609856719686464238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kGAq/Cum;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id lb18so1771139pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Z8mBIMG3a94MPv21swnuzetJfBVVdR2tVk/1KkGhaTs=;
        b=kGAq/Cumh6N5CpPPNbwcPtRt3bjC0YdVoQwMp72IAogXhH1bQj21tHmjZxoFP+DxY+
         RKVCv/wpSX3Mu5jp+StxzUFm3k2LXamhteRbiLhNMd7IovHTayPabUo+LiRdrPwhcUJ1
         KdY9M8er8Eq4akVUxSIPb5D0MI0SwFk9TvGSneqbspBT9DSeamFDkKIX0GNPVMVb1r0E
         L+Yf7oRj1ikH61eWHnxkMRgwWJuNXsBc4PmS4cXlkdRgZ1iyZPrmihWOi+4jBoDMNyKZ
         Vb0IqfS5GaUF8ssGeFJ1XUuaP3KI2iNBejM1MBmFX9VhNs9X4kUIWpBDeIBjf3JPUaMa
         57fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Z8mBIMG3a94MPv21swnuzetJfBVVdR2tVk/1KkGhaTs=;
        b=J93GeZSlzFCdByzZGowVXdmpDA5ccbKdkDdOq8zuY459cIHIWrY5mFpsMRHE5g5HBy
         qCQ5VE2vJo1xpLKDXpf51JSYilhyAua/18/CJlHsMZE8N8pjx+KxJU5DIkylxLN8exoa
         40+zsaahIKoFIYk7CixkVTTmr4metFXVjKVgp2g5MiSdkeaokw2zH1bEdX7RBsydl9gH
         SAve8aI3btySQj6w3RuQ6ntuziG2k+dZN0Co0GyfGUh5taICWMOtnrZNg5Al4QW/R7BA
         t0LJ9HJGAlyh9zcSi7UyN/8Oxrl4U5+Wdl4nXlbW2lDZDSAQ7b1UStJfevsnRV0Bj5Dx
         9+pA==
X-Gm-Message-State: AOAM530ZHawy9BcvtItSP/MPfEch8pGRpM9E9hXJmzDN2VWH5ny5DCKr
	zRdjEn+2U+o70h6QeWMVnB/DlNGxalmDCoyM35E=
X-Google-Smtp-Source: ABdhPJz8EhXhXaL+1uTnRtEWSZAcWX3PNEHIu0Ml7JW1zvEB/9uZk7uywlQV72E5kBvX8lMQYg1uxw==
X-Received: by 2002:a17:902:ee0b:b029:db:c808:ccef with SMTP id z11-20020a170902ee0bb02900dbc808ccefmr77095321plb.85.1609856718888;
        Tue, 05 Jan 2021 06:25:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/30] coreutils: enable xattrs by default for nativesdk
Date: Tue,  5 Jan 2021 04:23:38 -1000
Message-Id: <93856de6814a013eccbfac6b3b9bb75cf0655964.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Nathan Rossi <nathan@nathanrossi.com>

When using coreutils nativesdk (e.g. with buildtools-tarball) for
running oe-core builds, a number of recipes/classes/etc. expect xattr
support. This requirement is also expressed by the existing
PACKAGECONFIG_class-native default including xattrs.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80d7debffdeed165006b26dcb89cffafaaecca06)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index bd7a8a2f35..7dd9e41def 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -39,6 +39,9 @@ PACKAGECONFIG_class-target ??= "\
 # The lib/oe/path.py requires xattr
 PACKAGECONFIG_class-native ??= "xattr"
 
+# oe-core builds need xattr support
+PACKAGECONFIG_class-nativesdk ??= "xattr"
+
 # with, without, depends, rdepends
 #
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-- 
2.17.1

