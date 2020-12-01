Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.495.1606848773814372319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CCLKl/IF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id hk16so1830468pjb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Xukcysm5vEU6ymwZlNu6UbeMesXSDRfwIg891n9R4oE=;
        b=CCLKl/IFCax0hS0NPoto124+lCPWOL6ZumiaeSqGEraegWub246BJ+8MtiXP0bvVhe
         DDtVvsKP9LJ2xi7u9qf600n7N+KOiPPZMnvOoNP0I1hu7M0WdUbB9AwMtOX89rwCwaAn
         vtIRYTGrIQMs9j/tNn/iXBWv6OCMoIUtQo/KUGAqKptfxhIj70tILTsqWtop6F25QBGv
         /Z1cjCdKs9HGkxXLAuFzwDOM8BWJFlvQzkgZ6CaK/gxFdstG7t4EqmFfOm0NPCdU3Y8b
         jTcKrKhFM86HtJARVe9T8SEbq+3iDpX9r7w7m8YoJo+c9STrv9I0OLftPG87kPSJ2K1I
         zmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Xukcysm5vEU6ymwZlNu6UbeMesXSDRfwIg891n9R4oE=;
        b=bxwM4Ogh7bgmYs21HKW8ODCfO9kW+bcsT10cfheEA0kFjNU+0LuBX1WWlzm75fBmc/
         q8jPHAVTVc7mZbkjZ/9Gz9KGDvc9OUl4mQK2qMZrHloNF4jy9TmV/W+NiOjgyShxSFsY
         zaDDTdcpqBjH5vhbEPXbabVfzsMkF1/PwOwXw4eRuyZElyeBcD26E0eTyoc05eWu8teJ
         W3Yn7PU/fwVv8zPf0/SeQ414/VtFCV7MvO34xWt5yjPqTRf/RF/JHSSB5uMT5puohHE9
         2H0ZAVGUEQf2hov0m8R0W1z4FfcznbI8XDRMlk8HjG2X1r80t90bt/ckw0kFP65+hG3Z
         ebvA==
X-Gm-Message-State: AOAM532MF7ls06XPvaomHrIFQG+Gav3CLxTK0Ok1Hky7yJDEEkpSS+iB
	PuSOqM0agIqCHUfQJF/ep40BeZtP53xL5H5B
X-Google-Smtp-Source: ABdhPJwjZmvH/3fXLp+g4u6oApKfR+JQ7WbYc3ZBEwtBWimjlnvngzRHsc1GHxmcNy2GAgZMFxM0kQ==
X-Received: by 2002:a17:902:8e81:b029:d9:f1a8:54ac with SMTP id bg1-20020a1709028e81b02900d9f1a854acmr4005753plb.69.1606848772975;
        Tue, 01 Dec 2020 10:52:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:51 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/16] sysvinit: remove bashism to be compatible with dash
Date: Tue,  1 Dec 2020 08:51:56 -1000
Message-Id: <5fe58dbfbc42aa105a6be6444878f0c0588cb4d5.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Fedor Ross <fedor.ross@ifm.com>

Replace the equality operator '==' with '=' inside of '[]' to be
compatible with bash and dash.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b7f0ec6eafb35117eaf4eeef281162080f0ca79a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index fd1fdd26ba..d0d3149821 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -63,7 +63,7 @@ startup() {
   stty onlcr 0>&1
 
   # Limit stack size for startup scripts
-  [ "$STACK_SIZE" == "" ] || ulimit -S -s $STACK_SIZE
+  [ "$STACK_SIZE" = "" ] || ulimit -S -s $STACK_SIZE
 
   # Now find out what the current and what the previous runlevel are.
 
-- 
2.17.1

