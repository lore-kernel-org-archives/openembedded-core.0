Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF354C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.52888.1638136775591462465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=66i+Wj6a;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id x5so14701659pfr.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QUgTVp28waD8LyW9k1pWMAh4qC3x4frqNuRrcFX12mc=;
        b=66i+Wj6af+i8/HCAi4qo3SRSSi+GNPqQ+d+numQ4kAycUwcW1eG+UrWWR2GbDEq8H4
         Lukjt4JSo5yyS23RMI/eu4BFTpWwL2DeJ1UslwGqlTVF8HGST/hank74PqwwmJcZTkYo
         QORpHryhDeCK3LRGutMyLX63fIP3l3jVSL8ZVuvqX+asvvunGY2LL/x6ItendbjKB3/F
         aIypWaa7zVABvLbELk4U8XM7osu+NLoiU9NePwsuwKz8SxeqAePbQAaBbTYvGJj5Gy4Z
         3W+X3QpYRHr1iuLi+H7/p1PeB2OMvAsi3Cde7GQPjBECm80VDoAvSX8mEbYgxhDgyW2w
         Lesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QUgTVp28waD8LyW9k1pWMAh4qC3x4frqNuRrcFX12mc=;
        b=waMH2JUf6wlGIK3KKJQsFyKJ9AMBh3YtiBQi31EurzOId/Z1ebpxWLw9otbXIt7fkC
         VzYhgrSsi9MFOmKYIb7lF+gQycgtfUpWTtusvlaeEJdSZUlCYbowxxBWlcXamRi3DqSB
         qtDBksZpzlMb5HOSqeg5oV4Cdhn2wsuwODHzRR9xfOMTSKK0g2JiQDZ38gB/IEhUkRQN
         mnBZ2L9UJuf3n3FjZYv0zd4fJkSsQXQrUN9a7G55PD7V2rGTieBz9aZmssZI67b6MTqv
         srUMDnl91sblhhChTcke9Dk8ohvZuzHWrrqKIBDan8tdPJr4J/7Tslps0VVA79JNCvWq
         Kiow==
X-Gm-Message-State: AOAM53268qX4sVlaDEidtFJmsI/4zL+eKal2st2JCqvXH1DaDmmmH9HH
	c8kKMaWFQJlgt6rDgNuysOJF0tDM1oy8CHzaxEI=
X-Google-Smtp-Source: 
 ABdhPJyEoH1SseK8S1if+1eXQ/PtfnyknkmsAK2tKi2JJXY0e8zwvb4tcGLLjQugAuPr3z//jL3pSQ==
X-Received: by 2002:a05:6a00:888:b0:4a8:56c:d2c with SMTP id
 q8-20020a056a00088800b004a8056c0d2cmr18543769pfj.40.1638136774487;
        Sun, 28 Nov 2021 13:59:34 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/42] webkitgtk: submit patches upstream
Date: Sun, 28 Nov 2021 11:57:42 -1000
Message-Id: 
 <cab590ceddb6636477f9ae6c0f2c33a92b747fb6.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158912

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a71d871f4a9cbcbc178b5a1e038626ad1af717a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-FindGObjectIntrospection.cmake-prefix-variables-obta.patch | 2 +-
 .../0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch       | 2 +-
 ...1-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index fae3b0b2e5..54d34b1c69 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -4,7 +4,7 @@ Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
  from pkg-config with PKG_CONFIG_SYSROOT_DIR
 
-Upstream-Status: Pending [review on oe-core list]
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232933]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  Source/cmake/FindGObjectIntrospection.cmake | 1 +
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
index aa9a06701a..3364deb5bb 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 29 Aug 2016 16:38:11 +0300
 Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232935]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
index 3e03aa968c..9e2bf09dd7 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
 g-ir-compiler is using a C compiler internally, so it needs to set
 the proper flags for it.
 
-Upstream-Status: Pending [review on oe-core list]
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232936]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.25.1


