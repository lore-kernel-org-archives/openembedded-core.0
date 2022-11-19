Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E692C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:38 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.26061.1668880112943124052
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HVh9Iots;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id q9so7788761pfg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV9xIRffQihAV8Jqp4j4ZIKzHddrqEAWeCaHK7p0zpU=;
        b=HVh9Iots2oAc30X1tnRZS2V62aulxVJRgznZsOe7/b4u5AntCowkuhACdo0T0gjWAb
         3ZQlg5X3t7rLVoks4gx+dhq5enyWJD4Nwo4A7OrP86aGu4UQLvHWJaPh4c5LrxmBGSBf
         S5t+NbjcwxGeL7jicxUAUvqrtAHjWIxxUGj9mz+R986lZbt9s55OsWde6O/HBWA3dwDS
         cPXB8MIdAAAU9Zl0yERkKL7bBJvH1mRcjXe4dI7DNJR5hKmsd+dK7suOWe3a7SuJKYe7
         Mc2pEYdqVMUKPWFp0GTwRYJMvFOlctzYHj3c8QHonvQUwayh/dkFkBSBloY2hWKRIysN
         /t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV9xIRffQihAV8Jqp4j4ZIKzHddrqEAWeCaHK7p0zpU=;
        b=Ja+sxC6JT1aNwinUZZ3wpKItv3kG65fJ9Aswpt6sd3fOW1ZHR4sBApqQdbEcJi2lRm
         RpnAQKEUAF39i0UtE/N+UC3H9s7k+RH2OfurvZfGtM8jRpReC+ZyDIHM0AuQwLGYD+mx
         lepmXUgXYSqFlcdy2/V7QksM7OGnuQgjHsYYHKa+me17HsXzthJj3uNcfrAqCETBcSJE
         c0evMQRS5KHWsM0annAh7DjYArgaaw0NihSHOSdhk46q7AnORY+7aqqHPzFgZdAfgf48
         W0y07hOsZCX9WzNibY8KyM6ar4+pZ/jaxno7rBKLLuqKj9d0mgen/GeeXedJ7JdIQKUd
         ga6w==
X-Gm-Message-State: ANoB5pmyLvp9bMD6Nl3+MztZqb+wGe6sY07FBwyLq5yzTMy78wOndTec
	YoBWTlo6if5vYH5amusEGu0MKjxzo4Dler5ICiY=
X-Google-Smtp-Source: AA0mqf6wXqMJWjF4nNz/Y0bA9WeEkrxFY50Ti86QKIVUlSR+wEnHVY6J7p1+OAtAwe2+s+siotqraw==
X-Received: by 2002:a63:1425:0:b0:459:664e:68a3 with SMTP id u37-20020a631425000000b00459664e68a3mr11061553pgl.340.1668880112055;
        Sat, 19 Nov 2022 09:48:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/21] maintainers: update gcc version to 9.5
Date: Sat, 19 Nov 2022 07:47:47 -1000
Message-Id: <58d776cad60ef67746f3988db6741afffb428dc5.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173536

SIgned-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1575fce8c7..11a35a2c59 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -194,7 +194,7 @@ RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gcc-source-9.3.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-gcc-source-9.5.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
-- 
2.25.1


