Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.1493.1588648803062644651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NlZHkPNf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id z6so244693plk.10
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=D3M5QRHlZqR0SE5UAlY5m48ImQq+C39TVb01wFggSYo=;
        b=NlZHkPNf/FW2sSXtPWbgQ+ZzT2ZsPpBePYP2TICPQB0spK78WWQ25yK5DghaCNCqFr
         sKpFl0YRRwNWs1iRlrdMACtYHq3pulpYvASVz0IL99iBkEG0fF6xThSHOV9yZhyrD6vd
         mtC5IJVY9aQz0zNUWvnnE21/UYPdB5Zs+cFu4xPs589sfYN7M/LsOZwfCsrxlDbaO9FZ
         4kFThCFfo8/TeDxzumQbk1eV8tLHBIXlFQdd38WV2k5+C/8SA7wF4wJQbMbMotqoEjBW
         EPPb0p/v9bBdiA/h+4AjVHsaZUzTOtEF3Croo6HITEHJE9SJhtZcAS7FEfJnc8/xoF4V
         AL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=D3M5QRHlZqR0SE5UAlY5m48ImQq+C39TVb01wFggSYo=;
        b=E32ISle+2AbmRlSAlbIVknhdXE/9MFQ1Uzy5cu2CbhCjT7q8tZ3iE1n6xnZgJZy2ZY
         Ep002TIVcWKG/a8IO5zYEq4+Av+rdtjrza1SwkysekplTPZbsDbaXRTRFQm2W1blfbGF
         4qhNcCdgqQWYrorO4Plk14nCHnWCdic7xX2WF+4hfAY5hIoBthtBD6zU2QQDklITTmpM
         5h0YlOdH5sEiVSJwl22bh5M+vAD3pYivLb0HBtZ6YMyjy4GW2q9WRZOAoFc4t8rWWVjt
         QixaosFX+XB7f1xBvaBmtrVf1TOdSsWRt74Xp0MdUZkJst+iahQ4sQIkV1XP6Rs9uY+p
         98UA==
X-Gm-Message-State: AGi0PuZ3fVutfkwaohRMjl5ixfte47R8NI/JoH6097ZgoBq4tsIufhsH
	hOe8+M0Djr8+iMegQTqK3BrqysfxaLXpvw==
X-Google-Smtp-Source: APiQypJu39yKBEWF5p5FhFiZT9q+S6aKw1HOb/OM5HKoQYT4saDejGVFoekmwq2Y9ULy3Mbw0gz8Eg==
X-Received: by 2002:a17:902:8202:: with SMTP id x2mr832032pln.287.1588648802066;
        Mon, 04 May 2020 20:20:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/28] pbzip2: Fix license warning
Date: Mon,  4 May 2020 17:18:58 -1000
Message-Id: <1b0312ec6f546fce0610d08ba754f500f3df4147.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

After below commit introduced, the LICENSE
field changed from BSD-4-Clause to bzip-1.0.6.
669600ef9b bzip2/pbzip2: Correct license information

But actually it should be bzip2-1.0.6,
update it to fix the below license warning:
WARNING: pbzip2-native-1.1.13-r0 do_populate_lic: pbzip2-native: No generic license file exists for: bzip-1.0.6 in any provider

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index d7450c73c1..e321cd2b27 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
 newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
 HOMEPAGE = "http://compression.ca/pbzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip-1.0.6"
+LICENSE = "bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 
 DEPENDS = "bzip2"
-- 
2.17.1

