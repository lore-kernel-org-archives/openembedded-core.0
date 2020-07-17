Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.12742.1594996687379806539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Adf1GRs8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d1so5522421plr.8
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=u1zla4of+yqm2Y7Zt+lSmr3L6zITrYEN9yRNFX5XgcI=;
        b=Adf1GRs83pOBeuS+TEw7R1mZe3iFyxDNmdq6P0r/a+qrc7FKI7jJrkrTBoO0SN6XJ2
         NKA5RB3bPFJh+61W5ZHh+5POXEniOitxOTQyP9q32s9AepGjVj8WnEIdY3ZvIXWYo22K
         RqSlOR0hXj45EgD1B+CORypCvV97yL3eL6iRgyG5hq2GiLiAyMoxcR+0iDTMYAxwJFx1
         xf3ZtzwlZvP9sBjH5A+d3Xv0mtiLnGi7dWbK1q8astE0NS8BaG8g88tSQwfQ36Pv/tpI
         nQ0FyUY84emjPR9Gn8hElgwgA5cO6ud14s627FJ8NWtIYekB2bM6CYp6X/6XGgCTU85E
         Q0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=u1zla4of+yqm2Y7Zt+lSmr3L6zITrYEN9yRNFX5XgcI=;
        b=V6pe7CftYM1WyVd8d8BODrflWbNgde0Flt7qGLYAut/KrAv/UvJQB5SNwKON39Ec43
         TuDRyxk1DPrC9UDEBBVBkQqglvozV1BkDBpngctBtELAriy1LcxOnyzCsO807x+wDtAG
         K8TP1QUxlcTHb9CBiLkil9yzxUx1xQtuIp5aeuHvYXlipLRBO22hA6+ncwNE9LE4+dl0
         c6EwQpj3FGjwYSm3OiOg8jxOX8P+FdHnXwxV0AE4VHK7ajMNEUmPxjo5xSjXOG1k5VP3
         gQuF5t2oKNhN+Yhct0MWL+Wtg+VICu6ZcY/Fy+xLsxfnjkz2ngr0MoVMZVWxu8DRVbPo
         a0tg==
X-Gm-Message-State: AOAM531af1qdJs0eL7KbSApAHBtephSpmoEtSoKuyrsvFw0t8kiNFK9E
	ToIkqNXt43+UrtpMPEjVs8SD4YWar+U=
X-Google-Smtp-Source: ABdhPJzjf+1IjuqwYv0jv+Wqtek3rY/pMGPQtgPTe7TDq+eqQjKJxldQ8TiZ7oEQSNFuOlI1PvXhWg==
X-Received: by 2002:a17:90a:ce02:: with SMTP id f2mr10942122pju.159.1594996686498;
        Fri, 17 Jul 2020 07:38:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/20] bison: fix Argument list too long error
Date: Fri, 17 Jul 2020 04:37:09 -1000
Message-Id: <90c75ff2e696e984d18e33726d1d07647b140ee6.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix Argument list too long error when len(TMPDIR) = 410

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73f05ba58dcee57e25712f9aee97535d9a32c982)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/bison/bison_3.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb b/meta/recipes-devtools/bison/bison_3.5.3.bb
index 36c29fe4df..e6c169e9db 100644
--- a/meta/recipes-devtools/bison/bison_3.5.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
@@ -28,7 +28,7 @@ EXTRA_OEMAKE_append = " -l"
 inherit autotools gettext texinfo
 
 # The automatic m4 path detection gets confused, so force the right value
-acpaths = "-I ${S}/m4"
+acpaths = "-I ./m4"
 
 do_compile_prepend() {
 	for i in mfcalc calc++ rpcalc; do mkdir -p ${B}/examples/$i; done
-- 
2.17.1

