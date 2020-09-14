Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.61405.1600092769525562659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=buf7Prh2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id z17so3892818pgc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Nbz/ZYthZJFg/CEB724Cn/nf9eiHuNT1owSmOCsIV4c=;
        b=buf7Prh2reRRke/U4jyl0K7V5sXVg5D/1VfI5j18EZflismTnICTtylGs2GvwMgRMn
         p290zH1DDZNFAtvQU6PLRzR2O/rC+Th4h1rStMwLckky84QP42h2AlWQ0nwqCcpniuZC
         Ro3FZbhTNCKoaQqoa9VVlMFKgjtaIwK7o+LLPotcDvbX75qx8j/p4KyFioYikvw2g4GX
         ZOAqpY2+YcfYrS5ozFabMmZ5yXfnHOC9sl+3iOE3YtUWQ9pmW4e6FFhvRoc6nnnS1c7D
         mRIxiDtxzoSJJ8w4jLJNbVj8IMstKdYlAwdIiqb2B0majwN7J6ku6Re6fysDNLNH7X7c
         9H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Nbz/ZYthZJFg/CEB724Cn/nf9eiHuNT1owSmOCsIV4c=;
        b=ohh3bcqS7U8waXdE1JFiS3S8IMMKKRBZIjTJ6V8oLa5CpirSR71Y7Jz88cAi3xNb46
         hhJXgtsldvhGVo5CIa4/0yXYE3JUdoLCRDkcrE3ktm+nSJd5VZ62IhZg5mVOpayWurVF
         GW18bg+93NgidgIqr0gCJAZE/roDLm6P0imEtWQefg4i0BWzBbLgd7PxkQi26uznf6AV
         PgBZSepQGhfjDGnmNVMok+tTxwg7GoR3NXSRDivAAYqx21f9lyZpQ3x0LtsEEIHzvR+C
         JkoX7ad3MQ/fET3XOQQGCliAHP9DivE+n8Qj1eGo0cIyFpX1eF4mQAD0qwMm/REGbQ04
         sU8A==
X-Gm-Message-State: AOAM533BC+oQCULPNex3giXQh4ntEqjn7geCQx2niACGJXDHP56D6rpk
	wZocheUVjnWwnnTh52DSfCMN9pgIhr5TJRndJes=
X-Google-Smtp-Source: ABdhPJxm6oZAsqFQLMzYLOuipaZ0qQvvOkslncuMs6V82/NBLh6UYAh9NQhaO9Zddq1Zxm3QcAQojw==
X-Received: by 2002:a05:6a00:8c5:b029:13e:ce2c:88bd with SMTP id s5-20020a056a0008c5b029013ece2c88bdmr13473546pfu.0.1600092768708;
        Mon, 14 Sep 2020 07:12:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/24] cmake: whitelist CVE-2016-10642
Date: Mon, 14 Sep 2020 04:11:36 -1000
Message-Id: <46fadf2008b59278f09aa7fdd4f94da7bd098c4a.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

This CVE is specific to the npm package that can install cmake, so isn't
relevant to our cmake recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e74ed809ec4c1f61264ecf5be4bc319e5e07766)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 09949b566c..a2c7d513b3 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -26,3 +26,7 @@ SRC_URI[md5sum] = "d86ccaf3d2462b6b5947919abe5b9f15"
 SRC_URI[sha256sum] = "5f760b50b8ecc9c0c37135fae5fbf00a2fef617059aa9d61c1bb91653e5a8bfc"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
+
+# This is specific to the npm package that installs cmake, so isn't
+# relevant to OpenEmbedded
+CVE_CHECK_WHITELIST += "CVE-2016-10642"
-- 
2.17.1

