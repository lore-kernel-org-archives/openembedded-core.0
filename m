Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.3367.1594933713332285061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GdNz88sV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id s10so8537553wrw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dibzN6slKNHywGXjwFbhxcifwgG75ViR/xMexh+ktVQ=;
        b=GdNz88sVU+xNkjqDR/zNYxMWfmFe2RerKzV59v5R3LA0JVhu1e4GsbKdeVx8cPIJGw
         PtEIVcjGtXrw0GudDE3hEX5/hRIHjbYWOrF2JZOw43yyUIVVuc0iw89/lmscM8gXDZ4T
         qMsex+IBQ5pfHDrovebKBno6WDBnNfTXcMsNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dibzN6slKNHywGXjwFbhxcifwgG75ViR/xMexh+ktVQ=;
        b=H8oRSSH9DLNT/RqaG+H2D5aH9Jp1OYG03S0IInzi8SD9QtToeQbqnuL32u+/b5CQWc
         DNq5IAGFokjlderNEFd88q1oxLmSLIp48i5s7Q5ApINk2Plmw6UqS0hNjqNQRuHxmMoJ
         nO/3buXzygkxOZoc20Zr5XWVMxJZSEDmpkCshKjyw4gwSkjrCMvEUPdOgkopY0F4DWZa
         TVdQJcl1BIKRUmkgbufopgt436xlcnFcuGEcuqy2P+KgQJ2CXKFrvshA+dgQZzieHjCL
         hu4prtVoaVIYrk/11Ega5guesabQ1hVXrGEdcnlNc2mhsegzPtdN87fl67FgpHv6xLHC
         LFUQ==
X-Gm-Message-State: AOAM533ThfUeJtpEtV+QeQo4F3tdA9dedtTwP6pCdDR65RY1MDqQ27SX
	xfG7yJK04bUXAawWasuPFr6G/ipHDAiUkQ==
X-Google-Smtp-Source: ABdhPJxkuCiz737WSK1FaDEZPRhWPXSx53nduYv5vT2Y3fGwOL1vx90nEbFVss7IgLNNKxJRZY5eNQ==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr6775744wrv.177.1594933711632;
        Thu, 16 Jul 2020 14:08:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/20] webkitgtk: upgrade 2.28.2 -> 2.28.3
Date: Thu, 16 Jul 2020 22:08:06 +0100
Message-Id: <20200716210808.7438-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../webkit/{webkitgtk_2.28.2.bb => webkitgtk_2.28.3.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.28.2.bb => webkitgtk_2.28.3.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
index e9941c7a2cf..01580922651 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
@@ -20,8 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            "
-SRC_URI[md5sum] = "ec0ef870ca37e3a5ebbead2f268a28ec"
-SRC_URI[sha256sum] = "b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc68c30bd"
+SRC_URI[sha256sum] = "f0898ac072c220e13a4aee819408421a6cb56a6eb89170ceafe52468b0903522"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1

