Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web08.7999.1623852334884254860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ztgU3wwC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id q5-20020a9d66450000b02903f18d65089fso2548087otm.11
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=13r5BCchk19+dSA7ittwA49taP3foUcMbmNtCFTkslM=;
        b=ztgU3wwC9alJK42nOg4LgtR1u4cFa4a/cnfoneLMZIrw0e/8BfwSWmO1MA+YWRCmYU
         lJubmOM/TmLaDwPoU2yoHVbqs64ULlEORcV46Pk+cnelKAdPqDC+LJnQOOU0spGQ/qim
         l2CP7wWuwHsnuneR8UI3BFu+pC0ldMx4qb68CDCNS1OAJ9Uwo2+URWsbHNMAhYm5d6hu
         BQP42YRPbqR/VnOfKXsUi1C2ZthPJkFG0WeQSSHntyjJv4xXg2WdS6WaBRRMJBqBsTpM
         IZYNy/SOV+F7dHqRbRrmD7faE2B0AoQU7KHjb3srw6mtbdrag0X/oOwNBwntmTIHTqlY
         SyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=13r5BCchk19+dSA7ittwA49taP3foUcMbmNtCFTkslM=;
        b=S+lSkQ905SAcmnN7piJY1KmwpeaBnh4raVcu7gi+Vc5gXV/pLncUGuohvIjc6fKGES
         3W5No87D0oRLyyscLsFQkJErkRfogb8Kz/4YtWdLfqqirFmiXsjdnvyjUeHcsacoIpk2
         hjmOu6DNfhaWVpZICPfPq16kH7i3meMICzxPZ5bepnKzag+hfymA6xsqOm59Zs06sWP4
         vs/BvP6Y2Ebdv4i61BNWEMAJXtAKrLlea7UpkPdh6GK7C2uiti8gUN092Pc/EtIWtEGo
         dDhf9f/98QkRi6oBYYX8B9xF04HhWtbw3jca2HWIgUrWfKY2D0npbb6jpUNL++ksUJlb
         fZvg==
X-Gm-Message-State: AOAM531r94U4/65UbAicRFQ+uKGTcEWYsVTFnuf4LLxNVUzuWhf4rO4y
	J4ZZc/vaF3I9toKCbwhXQynjo4oZRpvb0xOaitg=
X-Google-Smtp-Source: ABdhPJyLZgbyZtoxQ1kqxlWliHoq4OfNq8+tPYc0+O1F09rvcEQN/c9kj+iYx2PGM3aowg7iBznTEw==
X-Received: by 2002:a9d:6e99:: with SMTP id a25mr64834otr.168.1623852333823;
        Wed, 16 Jun 2021 07:05:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w17sm434637oif.44.2021.06.16.07.05.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:05:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] valgrind: fix a typo
Date: Wed, 16 Jun 2021 04:04:28 -1000
Message-Id: <061cf0ccd5eb47c080eb833ba1dd25242c55945a.1623852080.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623852080.git.steve@sakoman.com>
References: <cover.1623852080.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0478d9b04d6a6d10e439116b23b641a1e2553e26)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 4621471d67..67999e579a 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -107,7 +107,7 @@ VALGRINDARCH_mipsel = "mips32"
 VALGRINDARCH_mips64el = "mips64"
 VALGRINDARCH_powerpc = "ppc"
 VALGRINDARCH_powerpc64 = "ppc64"
-VALGRINDARCH_powerpc64el = "ppc64le"
+VALGRINDARCH_powerpc64le = "ppc64le"
 
 INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
 
-- 
2.25.1

