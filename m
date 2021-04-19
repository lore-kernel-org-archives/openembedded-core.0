Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.1650.1618790803281636115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 17:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wc3++KoN;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id 8so564992qkv.8
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 17:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y6cnXmnkGPQDoaaGAeC9utP8TRQYd8SyAqTORrUfi5A=;
        b=Wc3++KoNkDsAdgMrTqVtFAPOzTYVG6qV/u+Q01cIPhUcca31lK4BOk+yF6Lku7wzDp
         z9n6x0ch+cP+THN26ePg28txu4bjxF22V7VbLpS+S1oZdNmSebl/FQ2ls7gYylxSLlzY
         OVN5KLFVS1zcl7A2Ajwdix+SjqqKqt+FEgDXFjoE1xqXZHBLaorcYSYtAgQYNa7dZ4Oo
         KTtbR62OJFLHSDaKjZYIO8g5xtMzzj5luVnBEXeef7uEIEYE1KTWH2sfWo7HmwhBBXkH
         dAbNFZT05K7q1C9Wo8jgg4FjW+jCRKeBcN3IFWMpfKnAHHlLiCoJu4hSS4QQraLbcqvj
         ecNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y6cnXmnkGPQDoaaGAeC9utP8TRQYd8SyAqTORrUfi5A=;
        b=Vcv/SvvF0PusvXDpVxJqWVYfwRiw+D+UeNGQSUKz1iUdkPDkUjLnKr1dVNPbXLW4sD
         /1Ch3Q1PqkjVEOjOAFIDfdbNyOnvKt6PUsDQxaJ3MOJ8YTQMZnYFiPng3Nx1WRXivg5y
         ejXgIpcoeQ1BNZU1q35te910OhGDs7hvojKxlqDIHaXAHqD1mLmR9vjNtov/4a3PhMm/
         p9U11PrUizyupyTE3ncrfSckNf7Ggr89UvfxM7g8ZuKwI3vrk2ZBUsSUp+3ZXAoKym2/
         +fljmsrMnrGgtpHt+uzuML6AcKfLwc2x2iOE5whLZLj2Sqxak5CGCnCYm2z5qSiyP2+8
         DkjQ==
X-Gm-Message-State: AOAM531ZW5Sfe2nAmhlSaNUqwUb/b8038Hlb4MkXh+tGtzhJd4Kk2//2
	PebP3IvLYHNXLUBIWi5tf0g=
X-Google-Smtp-Source: ABdhPJxmyLKpveUsAQYIhGCHVnjgxCZF1iXHb89tCHXk6lZHHejB2rXiC2BqHO3bnadYqcYqAQ6tNA==
X-Received: by 2002:a37:a990:: with SMTP id s138mr9563539qke.69.1618790802384;
        Sun, 18 Apr 2021 17:06:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n136sm8641759qka.133.2021.04.18.17.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:06:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] linux-yocto-rt/5.10: update to -rt34
Date: Sun, 18 Apr 2021 20:06:31 -0400
Message-Id: <85572238f767d47f8863edf48cdc2d25a5c81ce7.1618790681.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1618790681.git.bruce.ashfield@gmail.com>
References: <cover.1618790681.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    ac98a75ef2bc net/xfrm: fixup 5.10.30 -stable merge

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b22eb94e41..20faff811a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "60ca2b8c07383a2d46fef1b668e34dff90c1b404"
+SRCREV_machine ?= "ac98a75ef2bc550f67454bd738ede581c8846ff3"
 SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

