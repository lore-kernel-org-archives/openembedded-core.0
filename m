Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6531.1599512010062785156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WFPJeQqo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id a17so16932974wrn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+koqI2t9u0BNSyjM4flFILv/vBwOGCsFmhC8TDUhI60=;
        b=WFPJeQqoNST5IUNBilJhCZlc2ljzUF238uRlyvcXM3ocdERrBKE9BTtoqj15MVngXa
         ag2kZ09ycyUz2TgXhh8bW5YnVtFQHE7vk57pEps+jDbYCPeu7z8A9MPtUUFC1opbgjM4
         fguA+Z/UzgS2PQ7uVJ+VhXci6HTezTCjJPnTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+koqI2t9u0BNSyjM4flFILv/vBwOGCsFmhC8TDUhI60=;
        b=oVpZGNSAhXdNFxCxs6UG3ELYauQzR+87Y0gV63rqjRnqw1kZ9iHbOavnrrwwnbeO5g
         K8K45VEmwi8xUgRMkcFbJiMpjYWPRb6kj0zo3WOD0o8AGmntCiu6WlnwKwDwOEXkc4mG
         XXakPtKLTYPlTkXQB3tGYA+AgMx8FDOprOJgyczYOaPlalkZDW4sldmZoUCGtKBy8yFt
         BWadxwZpDY2W+0wTRuN8t2owkGjRMv8O9iQx5VXnyyT6wLJF9mOQ4QYl8vegO5GtmDEp
         PfDfDgFMbZ0VJgjkTt7YIpooKJw0sfWMT95rGQwlZe2KG2MSvO8CDBF5HANTl1XkN95g
         qpZA==
X-Gm-Message-State: AOAM533vECtjnxNsgM+JsYS0OzOAvCBvnH8Gzh5SZfhHhTFmn0knj+Lc
	ssBbUO06vHqFyEjIWOPAB+y/ckxWT+yeVQ==
X-Google-Smtp-Source: ABdhPJwhKQjq+J+mNCZSFwBttdnrHkleyBfjhiUUKhmVALExji7ii0olJlIPOD85JC2K/s6hxmXrwQ==
X-Received: by 2002:adf:f808:: with SMTP id s8mr22975453wrp.268.1599512008128;
        Mon, 07 Sep 2020 13:53:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][zeus 08/19] buildtools-extended-tarball: Add libstc++.a
Date: Mon,  7 Sep 2020 21:53:10 +0100
Message-Id: <20200907205321.1941682-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Builds like native-openjdk, really wants a to link
some tools against the static version. Since when
using the extended tarball, its the only place to
get it, add the library.

(From OE-Core rev: 59c4a3fdbbfd5a6aaba7e0a1675dcd5866a7f3a4)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 5a781730ed7..37f97056139 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
+    nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-- 
2.25.1

