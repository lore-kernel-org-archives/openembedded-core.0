Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.444.1623703897808466329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 13:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L0KC1C/h;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id my49so18799972ejc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 13:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TbIpaVnhYt1c6hJ6san0kipvk16qIOb5oNenCVVz1jg=;
        b=L0KC1C/huaVj+341pwQg8gc342y7cd88zCtQl+qSQbhw0chb740CWHaDnGP8VPKrez
         T+PgccTIW/ghGBjpdMUNLe6TNytSpaHP18zRHoAUsBHe+GWUJnwaktV1eX06dDaLn2mD
         wxGxaNIu85bj3KE9TMIttZk9ap0KIo56iHDmp8f9gfWUw0gQEYAfI14w0FhwRswRGdTD
         qTENeD87jZjZrIpr0pSOhi4SyFSxnUarofJo7mzLpa/ES+rr4VWCU3nl/WxHRYJdMqn/
         pyi76MffByc6Tp4pkUMD6du7Qd/XXfEXwCOC/4G1BQt9JZ+6+1mERBOuW02O1xJINcNx
         UB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TbIpaVnhYt1c6hJ6san0kipvk16qIOb5oNenCVVz1jg=;
        b=URbIYrFKneMuTJWygqq4wrgzs7EFLcDopBYAIBxssZGnQre2TRegrafr8Vi55mrUyf
         o7axkl6TMCxC7Xlll7rkk3Z3qdrsHPTq5y+LWEd30FmkF2gSDI5Fq5e2yCU7R7z7fURf
         WudLYJpJPUYbcmSF54OT2NA1sj7wF5TaO8sBv5YMtBZorSwCD0NR8iCRaHlb3hEZe0R9
         rrlEzMO1bEyFtC0u1z+Rdezlh8iddV4ydPWWX/oQuocSqNBBaHo0PILplKX3N1O++PoR
         OrLqrKzA3zyHs6ZMWrre+I7Hgn/Lxz+YIqpyOLO9tP6BuQP861jf1rWnzQsLkiejoTcH
         kMpw==
X-Gm-Message-State: AOAM530VGUcV6NgrcJ+5U0OIlsVf4z4PxzMOAsO8kYHrRuRAMUIDol6y
	ECBUMkOHkFBk3Tm+sVo32/cZPuYbDSnl6w==
X-Google-Smtp-Source: ABdhPJzjwglSkIJQ8p9+QHJWWXNo34PF8pEFSHXJLcq/IjsumT7qPhYhNiC/50P3GhkhJXp61+zOuA==
X-Received: by 2002:a17:906:d97:: with SMTP id m23mr17256376eji.392.1623703896398;
        Mon, 14 Jun 2021 13:51:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f10ae4125962954aa99f170.dip0.t-ipconnect.de. [2003:f0:7f10:ae41:2596:2954:aa99:f170])
        by smtp.gmail.com with ESMTPSA id s10sm8074357ejf.54.2021.06.14.13.51.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:51:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libx11: remove CPPFLAGS_FOR_BUILD += "-D_GNU_SOURCE"
Date: Mon, 14 Jun 2021 22:51:24 +0200
Message-Id: <20210614205126.1680546-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614205126.1680546-1-schnitzeltony@gmail.com>
References: <20210614205126.1680546-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With 1.7.2 it is not required any and although they mention glibc explicitly,
_GNU_SOURCE is set in config.h for musl either.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
index 383860409f..5d7e9e3783 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
@@ -31,9 +31,6 @@ EXTRA_OEMAKE += 'CWARNFLAGS=""'
 PACKAGECONFIG ??= "xcms"
 PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 
-# src/util/makekeys is built natively but needs -D_GNU_SOURCE defined.
-CPPFLAGS_FOR_BUILD += "-D_GNU_SOURCE"
-
 PACKAGES =+ "${PN}-xcb"
 
 inherit gettext
-- 
2.31.1

