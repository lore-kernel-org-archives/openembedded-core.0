Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.12887.1614955740675562469
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NlCg0CZv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id c16so1545068ply.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MOf+OGU160ylD0ly+jg2skeZQIvSS0NQXGu6NpvVflo=;
        b=NlCg0CZv/xxrRveWnPqZcqW0Sw09D9ZR3C7eaiPmhQFfNhwYeqXiVAtRuwhK2+RMzF
         xDwunPxNzKwSz3cGdon7HHRBPtBTdbvrGa4kw+xPxKQyndjK/KkccO6IdnN8igF6blAD
         r7MHX/fWwzqM/BaqZOznCLkgLPZBr3rUZ3Sk5mu76CxfS86kCGlO+d9BpLo8wzOClMLD
         AgbH5LwSvLjJIWRf7LazTJ1pXSltWy1uKD9hoamyzXQ1T1efujlgSJLVRAgm0SEN5Sif
         rOhffkanU7Wr7D+W9x3ICYg4Tmw68ujCxRcva+viyqMZIkVbnybXNJoMJdBRQWSNRT1d
         5dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MOf+OGU160ylD0ly+jg2skeZQIvSS0NQXGu6NpvVflo=;
        b=A8wvJVUdzwXUx6cpgSPkGRSdxqJSGL+YI0mI5ZLY1qqtHjPK0QWb5rv2K8NJCqpNos
         X1wGIHa63fH+5dOUy5jaxwuoSntx8q8dWTS6Nagx4a6jpGhyU7aYFNmecwH2LPj43rWf
         dpEMrjJ9GHkIC8rXApZVKbVcOJYt/mpl6OfzfbP0+TVwUGB6J0U6Bd/57KRmIt8MVjAj
         wZp1YSK1CH6IP5w/qXtH2BJUt2tBdu+QhSPuSiaNFSjFo1OGdk1OFguidOUH0tGzqXC/
         VUpy2ybuCPlUfNlkSu7mjPl9tJvC8z5Z3KypvMIL6k3xCScNjeQLPhEOYKaDsaxFUJzx
         ILCQ==
X-Gm-Message-State: AOAM533h0qRr78vG0uV7f5gU6pAPjQvbhWQcn1Adm5IXIZacQP5y4iy6
	I3XhzNL55P00tTZKGxRt2jXhxmjnUWido6hn
X-Google-Smtp-Source: ABdhPJwxDWiSoMmu2nOUhnRyn277ALbOYbZ6W3QH2nYyyppx7F/B7LoZ0efd5X1BohEI/qri5fua/g==
X-Received: by 2002:a17:90a:5d14:: with SMTP id s20mr10640235pji.6.1614955739666;
        Fri, 05 Mar 2021 06:48:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:59 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/27] asciidoc: Switch to using the main branch
Date: Fri,  5 Mar 2021 04:46:31 -1000
Message-Id: <519f382fd0dd537377c0cf0b6473d427c10054f3.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Upstream has renamed the "master" branch to "main".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05637733cf89a81fd5d787402f5a917f279a1a0d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index 751bf0f19f..932339f739 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main \
            file://auto-catalogs.patch"
 SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
 PV .= "+py3-git${SRCPV}"
-- 
2.25.1

