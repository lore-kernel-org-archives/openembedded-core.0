Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.11643.1621204381757655059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I9AGGTsk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id y14so2365898wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/GMnKvNQRwkapsJkwyV56m8tPHI61DOqutrql9W0mLA=;
        b=I9AGGTskMGBTCdF/RRalKIEVr3CyQGzIaLxxqhcmfcUFuUQf7CORu63wnYlkdxGOgX
         x/EBJdWDfifAWXNEtwEllR/B4y8FpX1xBzgRZk85JCJPX+Ib+ONQW0jZ4z7xXwDKSTNu
         sHhH+/YT+cWejBqxzmG9tyJBcD3UJGVpycfJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/GMnKvNQRwkapsJkwyV56m8tPHI61DOqutrql9W0mLA=;
        b=N8CSiwr/Ey/8j/42eY0UQZS+1afAUyPU9C/Thxbmt0cOsY3KqSBaPw1JN4qoxbkqco
         z9cv7rW86Qag2+NDOiRfsscLwfg58tJscrnoFoHVwXMBRwwobwJ7YdcUOJJyaplnpuSB
         rVDs+Wg238gFlCc5WC794sLWg27i4W3ezHRtTpjKFotMO4a6vldve31GqT7/NsWqGJ6B
         qTnP1q1im7sgzVnyVdHA/1Nzl91QWdPuXgZHto9W20saGam/9RCLsEUKWDcvKfKRWyvA
         CceWdszcf6cUAblypjwvhb1TjFf+iP2TX2ToIfpSbb1JLgrRvzRcaVpfwRPUqfXdooIr
         1x3g==
X-Gm-Message-State: AOAM533LqytHvCGVMhE46PJNbCO8xk9tHfYgHxiB3kA5c6GDgUq7s30M
	Fq8CRgljT7Shyypv+zu6c6hJd/sNzoI18A==
X-Google-Smtp-Source: ABdhPJwe9f8CIzoUGJxQHHWutjJFFYPZGDksYqqL6qyfIjglqJwc/vuUYVreC7cTytV6Bbd/EeHd0A==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr1860019wrw.235.1621204380292;
        Sun, 16 May 2021 15:33:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:33:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/27] mpg123: upgrade 1.26.5 -> 1.27.2
Date: Sun, 16 May 2021 23:32:43 +0100
Message-Id: <20210516223247.2401235-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mpg123/{mpg123_1.26.5.bb => mpg123_1.27.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.26.5.bb => mpg123_1.27.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb b/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
index 7207bd1dd01..9a91cc89d64 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "502a97e0d935be7e37d987338021d8f301bae35c2884f2a83d59c4b52466ef06"
+SRC_URI[sha256sum] = "52f6ceb962c05db0c043bb27acf5a721381f5f356ac4610e5221f50293891b04"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2

