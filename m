Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E3EC001DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.1210.1687401382478267557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iN2B9MwI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b6824141b4so1177255ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401381; x=1689993381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmUj7cvWiUciyeWVOUhSlyLnT6q8VeCBkNhY5BkV0PA=;
        b=iN2B9MwIVCJlL7l6G3VHsEfEjtTwbLqPszYts7z9SXwNyuRsk/04WXT5haFw5C+KVI
         RQulilIem+PMeOFvPfd15naYnztXOmz83G1pgA+MxaaOcqRLe2d3AcRClFYvtoFvu1Pp
         tYfMEB5rMaESzcpfM//iOPhNqvOqj6OvV8O9S1FrY4CBVX40Ta/vdFmHYHtFPK/m5kzE
         D1Wny4kSMu5w2lWt3KUUspcgq43HExvRLZshgWwSgLQikwi5fcKKBZcsI3clgp6DZp84
         7T/ijJ1kMutCYwLY8MzACQPCLFzW13WEMe9+HQE3l9chxBEUt2LGfTs5l4Pt7/GeJnpl
         RVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401381; x=1689993381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmUj7cvWiUciyeWVOUhSlyLnT6q8VeCBkNhY5BkV0PA=;
        b=Z7o1pABBVUugl94s6SGHZF8Hf+Vcnjr2QRGFmMmngOIbrLOYr/GrPNRwKhxL/gGe82
         lClhP4N3VPSCwBKB5q5FzYh5NbSXPD68ZVZY+6H64Rxfv76n0ilk6mArzAW+Hc5xAhpk
         Ay220oUb1Rdn88nHQZb+4VvFIiJuFqHw0krnb5lw5XeZHBIghTIP8EQVgDk+xGv+70sw
         hV7rge6PaICiGRgathZR6hHiaTsdUbqAdE5QfWOth/EW09hUz4kFODsvPhmBvjSKDH2X
         8awtCwFuZZZEWcYfWxyjYBxTb22JJwVUeBjp7U2+vFUxXLjT9Ot1JWQOacQouKAZARpr
         cCDw==
X-Gm-Message-State: AC+VfDypyc6JUwaCnUUDwmfCLAsz6kNIxdXVYj+ehpgd0Rexu8o1myyY
	YZQIa+ekxeuU6Wc82UxXn4oXohYFMB6iAv+EhpQ=
X-Google-Smtp-Source: ACHHUZ7DAQa3b885I5Y3O2P0DY74LYleL94TGGzJ2OJajnTm0lKmCEQvsnrHS42zlLj3HCQrXc5Ivw==
X-Received: by 2002:a17:902:bc43:b0:1b6:8233:6f5c with SMTP id t3-20020a170902bc4300b001b682336f5cmr6796986plz.19.1687401381571;
        Wed, 21 Jun 2023 19:36:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/23] libxpm: upgrade 3.5.15 -> 3.5.16
Date: Wed, 21 Jun 2023 16:35:40 -1000
Message-Id: <145d19c86d61761d7446f6776c4cbc8274c06861.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183208

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
test: skip compressed file tests when --disable-open-zfile is used
itlab CI: build with each of --enable-open-zfile & --disable-open-zfile
configure: correct error message to suggest --disable-open-zfile
Fix a memleak in ParsePixels error code path
Fix CVE-2022-44617: Runaway loop with width of 0 and enormous height
open-zfile: Make compress & uncompress commands optional
Require LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
test: Use PACKAGE_BUGREPORT instead of hard-coded URL's
test: Add simple test cases for functions in src/rgb.c
xpmReadRgbNames: constify filename argument
XpmCreateDataFromXpmImage: Fix misleading indentation
parse.c: Wrap FREE_CIDX definition in do { ... } while(0)
parse.c: remove unused function xstrlcpy()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4d9f0958eecdf683434d77a4f65611803cffd247)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
index 32a2b35356..c3d01f1bb3 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "60bb906c5c317a6db863e39b69c4a83fdbd2ae2154fcf47640f8fefc9fdfd1c1"
+SRC_URI[sha256sum] = "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


