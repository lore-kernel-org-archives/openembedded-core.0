Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.31960.1613399895966198818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lM4Rrzg8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id b8so1578537oti.7
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1zf8K3KWj4/f1maFmqKl5CFmdTGNFb3Wyskf2Tq3UMc=;
        b=lM4Rrzg8Zkc+1KxDu9sNbXxfyqlarCJtjgwZq77ek3k/tkx+VSHvRJ6lnt08cBnvz0
         OgXCoVWuuzHS0EWVEHh7bIcuVsqZgtI1b2zEywwhNq4ROvY6e1ofCjD7Y7ayY5grUvnW
         V02SY28hnY0RcFlhPLvZ1//0xMSLe/qR3zRONZiNB5vaFFtvJtf0DHSm4mmwNKNH4Tr4
         MBk6+qgBKQUY/gAnuN5LgZktVX3cl/q6NK/ESQUrQYu5istJFiN4sV/MxvZkAd6noYrd
         j9lKkKzhWOuj2GoTHLp3P4IbL+vHdDGhGZqQ144ONWn405fvAg3h4I96pCLKYntZCtNs
         rGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1zf8K3KWj4/f1maFmqKl5CFmdTGNFb3Wyskf2Tq3UMc=;
        b=exNl9JdW+VTnHnTMy9Q7MmOJah/F+xjC//VZ8pDEhjHLP9xP0uq/M8BNkgrHxIdUry
         sLvDVe+lM2Ir6EbMURX8BERRFSZ3U8+WHkp0R60ukH2dE5xPccKneBT3O8WxP7DGixnY
         UL6CHpC/ksbbHhP5ADzOeJErRmx1+fbfLTOg7qY94CNxaZY9leOkEh9QPFloG6qIwu8k
         8rpwWgld2ueC65cTCqFJXvDgDS2rVX3Zx0qdgGMILLqnrCY6WU3JEVlomU0HieR5IA3T
         xMEnf2NqARwT/kt01+m9KoKPGdepQxPjQOTdm6mWx94Jdj7gP7pPp531+Hrx70f7NE3T
         Rxdg==
X-Gm-Message-State: AOAM531vaA7HgHTVUk2N+21bxwnFZUEL0w69yJLYsBocm7NYsyHHLysN
	4vJuDa4CuIYDAgTnwEdRTWQjOCXtULcBrD9s
X-Google-Smtp-Source: ABdhPJy14pOxeKEg1XRCImObG2VSqOIifWT9lz//qcfbay3U5BumgyUUE+xAff1dkPF6v/DDfj0kjQ==
X-Received: by 2002:a9d:6b07:: with SMTP id g7mr7292273otp.82.1613399894915;
        Mon, 15 Feb 2021 06:38:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/17] opkg: Fix patch glitches
Date: Mon, 15 Feb 2021 04:37:16 -1000
Message-Id: <0807c033f13e49e2891bbc69858a4cf5221c8f2c.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The original patch contained some text which shouldn't have been there
and used brackets in configure which isn't a great idea. Tweak the patch
to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63cbf187fe189c99645fe3afee8a6361a9a32cdc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
index 285d258c63..4578fa33be 100644
--- a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
+++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
@@ -9,13 +9,12 @@ Index: opkg-0.4.4/configure.ac
 ===================================================================
 --- opkg-0.4.4.orig/configure.ac
 +++ opkg-0.4.4/configure.ac
-@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
+@@ -281,7 +281,11 @@ AC_FUNC_UTIME_NULL
  AC_FUNC_VPRINTF
  AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
  
 -CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-+1607446883
-+if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
++if ! test -z "$SOURCE_DATE_EPOCH" ; then
 +    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
 +else
 +    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-- 
2.25.1

