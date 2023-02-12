Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8CCC64EC7
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:33 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.12.1676236285844440022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fQxGFww9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id r8so11655441pls.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6i6eZCL8RavwT0KUjsYSTI3wF2IM70XBV6UpD52Cqmc=;
        b=fQxGFww9wE+z/9TwoLSMaZCJSS457koUfXn8GTnWelnxLQUDf8w68iaM6c+KVJLyTe
         f/C+BGPF/DSwmEkCYkkwPnAkJ8LkNPjg2s880Y9so4gDiS+nuOHOiXgceizLEFBqAg+e
         31duqcLHDGWJr6oIscxI7FZHUVg31rtmZw2bfLQODYtsQNxzQHDoMc72XOv01Lj2o9Np
         P7JdPfLPgELwyb2zN+s+eQ2XvaOwdwr41LWcP57j675b9bDEYxJfBHTk+KVgeTb9215q
         SF0ESCqLDz9cExYSdQQiSJOyBiQhyPQFVRbnUUh1YMJfH+Fu2fkC/GX10cq8C5/GrFI6
         PO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i6eZCL8RavwT0KUjsYSTI3wF2IM70XBV6UpD52Cqmc=;
        b=0FGiTEu5T9qicNVjZc6D3adnKqMJM9TAI0EYMfDIOuf0fuQZbazujaOGnbKmEM3+Q+
         wnaT4ny5to6vNbRRaV9yF30fe7hxp0TyqVi5guROceOh66Q6AalcP0XV2dEtQFjwTpUr
         yWiDUdTc7fZgCC4wfLSD0+nGb3IkHWxMKiubQtDvZVjbDEUz6F2xD+C6dZDVLrxr4xlr
         eKJBvbD8Cn++4xb2zaNWrnE7aFZm5BkBtE6ZoENVaZPnZS9X4Xdg/2vMt8aoZkhU0HdS
         44z0215r3A09uaAT4t1kUWXqOcNTG/fIGZnmaz3x66JeHTTy7oNibIrvJvlKxDfD2fKY
         eENQ==
X-Gm-Message-State: AO0yUKVR5Tpqh2XrlBhtCHT690k3C7niuEsBveAt5/Yy3fNZlLn7kDLi
	4Zy4AL/w0YvRah+rh7CL83jp8uaqyvSg8N4DUTY=
X-Google-Smtp-Source: AK7set+n75NKpZHwcJ7pVaNHeUmQEWRwZlnkIy1GDr19NFWKgY8NrlHMYuGa9lj7Sj44WpQrijfvCA==
X-Received: by 2002:a17:903:22c1:b0:19a:586c:92be with SMTP id y1-20020a17090322c100b0019a586c92bemr14802133plg.45.1676236284901;
        Sun, 12 Feb 2023 13:11:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/27] glslang: branch rename master -> main
Date: Sun, 12 Feb 2023 11:10:34 -1000
Message-Id: <04b7643cda2c6d82b017767a537e53ce69a7703a.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177061

From: Mingli Yu <mingli.yu@windriver.com>

Branch name is changed from master to main.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 65ee4c1067ee5d73c198eed8ed2f1c9a60d5df96)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/glslang/glslang_1.3.204.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
index 2af406212f..ff08f251cd 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
 SRCREV = "2742e959347ae2fac58acd0d022c92a0ff1f24bf"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


