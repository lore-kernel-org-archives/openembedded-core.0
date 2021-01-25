Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.359.1611586384854818803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j2l5pfPV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id md11so8560787pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u0t8HaTna1WwrgP/fG22P4OogWlj2MjEz81xBgM1hk0=;
        b=j2l5pfPVLgvY45E/0uD0zVcB87kJYAsIRvL5PxOLbsEWKQf6pNrmtYEHBLOF7rACTD
         pBQ/ZpsS2GHhxb3P5f8HHVK9XfT/eQVfAFenJSpLd/0Hp8LR6ZaeFQiYRu3zmSsdjU/Y
         xh++5JAVGN+2p/iSuAePLjsBYJI5N11flZw3Al2Td5rRfH3lAJsSaScMD3r7V2P4TnmW
         2u4DB6Gq758cdvplTfFX7b9r3k3FAMB5pEbivO2xM/6nolmCSz7j+27cOtOGUCwQrJQ8
         YMpj/UHJ+BMKsd0IJ5OG4+6JSDKE/JbK3Dx9uTr8gJAawdqIkCUyLbgGQJe3kVzqOzoy
         6naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u0t8HaTna1WwrgP/fG22P4OogWlj2MjEz81xBgM1hk0=;
        b=TuXd6AeTNnHQva+j7bHgnsyantPTqrNT0k3pCWabYrF3WbV8+XFdZNx7qKJNSFoP/A
         Eh+/4WubRhRV738z3fasALST4mivo+RQArK2ounIJzO3crrvUq3g4cMGATEgkcDzP8C7
         JXmkH3zK2gVimDE7ilekJoFo9HFdMr1346Wchoa73GOlGGx7ZQ+LCiFZtWY2W2OKwaaw
         64eZUL6ejY7mCzyzkB1A0MvFsipjAXYP6rjD+BOBSdlIDfGnmwC6lSDEX0+Nmp4o9Qx7
         muKKsMrQEwiXwcjqdog7C/UEKCGmMg/DHfASnuELjsS261gyryhianeQ/biG6mLuYewp
         FPWg==
X-Gm-Message-State: AOAM530B04WtouWwmVZ3pUkoWrucgiUrwCjJ9frMQKD89eQ7aibh03/I
	/keLYRGjVK7ZcV8bteYsOhmukSgEjXJs4OlSCa4=
X-Google-Smtp-Source: ABdhPJxDehmK5HS7T1PlFYHqT+GbGheyYnSsTG/03KBmZIqig2UdF8obpU2LTxuAScRYgD3Bj5HgeA==
X-Received: by 2002:a17:902:9049:b029:da:efd6:4c12 with SMTP id w9-20020a1709029049b02900daefd64c12mr1047109plz.12.1611586383978;
        Mon, 25 Jan 2021 06:53:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:03 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/47] pseudo: Update to print PSEUDO_LOGFILE in abort message on path mismatches
Date: Mon, 25 Jan 2021 04:51:01 -1000
Message-Id: <c15c4d721861cd04cf36779311fd84e3d3497bb2.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9259d684415e3e7923de74359a4ed3487e0e9da7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 50933c4bc1..a9f7aa966a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch \
            "
 
-SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
+SRCREV = "69f205c41902e17933b81b1450636848e8da2126"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

