Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.11305.1607008124182284989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A6P1i1y4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id q10so1481558pfn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yw5UdbQXL73S5wEXyKymtJCzP6kEOMOlZ89xemg2rgM=;
        b=A6P1i1y4/oKSxgoTAhL9LC1kWAqFhMPrJNcU51Uc+pDX+XNEtsmCHzAr1LnOi6hibK
         dLFxjXNUyGeDPpQfvuajuLlxfD4oCYRlOS1i75eOVnzgAFRQ9JE4ajmaoxc65Bi5sJl1
         fiBfppOvMa76dKGuQN3vhdMWjTx2I63np7xiDQy+OTlimav/qHobWAeuvik+G6R56xeC
         DI0Luvzfv71RLAnWqC3yO5Wrk608qdrk4pM1vv4DQaAaZCHwKlXR7xIVYl215VDqFp+7
         fKPzhGciPT0p3s863U3p3/I4PLHEqYl3GCQprk/8ZPL0MA6QbApo2ZRYIgi+/jKHKpPb
         xAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yw5UdbQXL73S5wEXyKymtJCzP6kEOMOlZ89xemg2rgM=;
        b=Qg4Rw3WVNvcp9TMLtlX/ndX/icvLW5YEChEzZ71ZC/75PHHHp5lGN9GujYj9ONDijm
         0QWt5Y2ohK34nccbwXE+2mSqQPGdnVEnvueBuGfBnrhHA/4/6pUAhWUPJQDrBdvcDEJs
         gESXCoaajLRYKPPIYddS2Cvojhoopjs4E9Yz1+QsCIKA/h7DJWVwaeNkf7KGsxKavpgI
         YmD8lLwchktmaXOkRCqo6r+5sJeq8MZZjUdobdtH9/INnnDx6iv2HV6HFK1HsNt3Y/Yg
         ++nb9tpRY/B9Rkw5YA9OA9iUzZ8bzWtQy4Pbtlo19N2PkguBozZAQiyezUn6Y3oaFICH
         c1rw==
X-Gm-Message-State: AOAM531oxtBtnY7jOOqwdqz//1CLKIYc6NSe1AAWSzPCu/Ek8k81gNtv
	nABLLlJ8QRskNm7payit4ZuwJ0sRpUWPyzzT
X-Google-Smtp-Source: ABdhPJwZFbpQIV3lk/m9o+apHl2J7t8xk11RMMd8T+ZBcOtGv2L4h9h4DKhiE21uc7bMrSFYlK6ydg==
X-Received: by 2002:a62:1443:0:b029:197:e734:a289 with SMTP id 64-20020a6214430000b0290197e734a289mr3385928pfu.66.1607008122651;
        Thu, 03 Dec 2020 07:08:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:08:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/28] pseudo: merge in fixes for setfacl issue
Date: Thu,  3 Dec 2020 05:07:52 -1000
Message-Id: <c2708c5feac5a7398ccb605c806fe72efa21a20b.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

[YOCTO #13959]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18fbd28c9aa0276d110839c4282a9ab75fc9f28e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ead5dcfb14..fcadfd96ac 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "b94fa2fc81cde25865ee223ca437d07377229a53"
+SRCREV = "067950bd9415fafcafb2bf32c0e10df4f2ac936c"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.17.1

