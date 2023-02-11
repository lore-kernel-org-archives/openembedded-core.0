Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE92C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:37 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.19561.1676150644242898900
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jDXEdI0q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id ea13so5671981pfb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GyPw2oodFlseOPT8cUHXs9WiDw320sKLTLRfR5icls=;
        b=jDXEdI0qxo/HruQkKQMvBQoyC/rTIu8R3Fmrq3UHjDyfEIg50hmRr75oLAf2pve4MJ
         7/n92PhmDaAVfpFsRlKglG/6lDgd20JwAN2pp6OnbQzhdcZyU7rNnzP6Z6vmnR6LMNev
         rOWcSQ6FPbFHzvd1YhRkSo59Y2C3osJBxEP1JJa9XYu05uhuf+riAozQFhdFtPQu1YA8
         WvA7qIxpABX//PZkhoMwt6GE7IiF5k+SpuGwid6h2fKgli1SY1z6tAKE2plxlxcyRyLi
         Kt2AD1ywvY4XeGP3/CVN64LmjJQQPPW2J2xYM17t1Ax0LthpjBrN4N8LMlG/UbhRSjcy
         EeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GyPw2oodFlseOPT8cUHXs9WiDw320sKLTLRfR5icls=;
        b=UjBZti1IY7p8Y/NmsaQ3IGuqp+ToJnnRX5QS3HiK74oiaytR8pomXfnMi/fkC8JPdT
         mwM+jFkGuRoOiQNmgzZDPbHg6fn8jF2H6JaZjW2mGj9eUNdOx3fbqzBAloimQZkzmKcp
         M36XuIV0IpDJP7ua8rKrekvDigw5zU14bENXTlLu65EaOIcYru2UHZeph20Wu+YuQZhq
         9t13DVfpWAKslM7uBk9yTtFd6dhwJJbYe8lkQAwo4nPWbYSWlcPswo1g//jOAzFApYYH
         d5/EbTG2iqcpilnE/F/mUtPJ1awf8aRXF5euC0feoYRwZzFBMKc2Mt4aCYmwnArYfJC3
         KDJQ==
X-Gm-Message-State: AO0yUKUnGBK9lYZTEQUHTkBaU4Q+ce6KHoRaNpuch9bp/SAoPc93rbUn
	LH5Pw/jEVMVw2MXxW5ajKhce67nneZzfpsSc7Hw=
X-Google-Smtp-Source: AK7set9DsNVAinRJJ6azp0YAzqlefES3pt75D805lOsZKOh5QiNtpomBOUOlmSGaHVrseNTcIP0UYA==
X-Received: by 2002:a62:3247:0:b0:5a8:5e6d:28d7 with SMTP id y68-20020a623247000000b005a85e6d28d7mr7654889pfy.0.1676150667755;
        Sat, 11 Feb 2023 13:24:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/28] glslang: branch rename master -> main
Date: Sat, 11 Feb 2023 11:23:40 -1000
Message-Id: <4daadcc7c8daf687b29a0958a7aaacdae45ae3cf.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177027

From: Mingli Yu <mingli.yu@windriver.com>

Branch name is changed from master to main.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 65ee4c1067ee5d73c198eed8ed2f1c9a60d5df96)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/glslang/glslang_1.3.216.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
index 69d9a0a84e..5b3b85b4ff 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
 SRCREV = "adbf0d3106b26daa237b10b9bf72b1af7c31092d"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


