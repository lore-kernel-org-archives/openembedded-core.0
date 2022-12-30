Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EECC46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:44 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.22402.1672418675423265072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4+pucuQV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 79so14491543pgf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEBs/koUpn8y6LZrlOXfDDB0IbI6JEcWMZsN95Fyncg=;
        b=4+pucuQVAoWth1FLhzb+n2umhXCb069cS42ZImTLdaLqd75KSdf+KB4pIOQGLjikI7
         FWzGztefEZMCnCEsP8nTvgQgvtKFMYt/HS5F/LQro4yFPQB81FkLbsatKNAVMPBG+2yt
         J7gQWZO5YZJCsPt9JJvhP2+we++BmkH1pkpvxpGmomjV1pfLGClTV3+TSYrsUaQK3cTH
         DeyETiJsyQD04EcOELHH9c1vsjMuKVlpYhqLzPLj7EVc1nufvCkKHtGXlz7KKpmKhr16
         6YPipQ0H1nyGxQVwjuusavFKHs2KsIrOLvxYBn/7KY5pnBKFcpE3AkCWvjGRXz8KLKhM
         gp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEBs/koUpn8y6LZrlOXfDDB0IbI6JEcWMZsN95Fyncg=;
        b=TSvIaj8Mq+9N2V3fbJtgJdT7R08KMinGQenzBBwAfgNwnNFNoRfqI4WwwLSn8zurUt
         vpiv3mJCFi+i2ty/g0l0lmAmp9XUa3HpZ6YvzenzN3+iHaFvp5Yu3z4XBncaG4TiCqgY
         ipDKb0+YKmCvpOPqMxtTpro4H7EVeLLX8RcpvPfrFg6n4hnba3lAKRYV/e6tVtZkSikn
         r5JEUu3wBqiQJDAX+CzEmod/Y0CJrlU5De+4gte7dDEdrwRDlIckBjt/iQD6P4814PzA
         yIwmD4ZUJq2jlczcP77TYiH0VHDYCzkjCElZ3mPwFzBX3m507+uRJKWv7UWkxLP6e0ZQ
         bV6w==
X-Gm-Message-State: AFqh2krIVmL6kFpJOlRfc8CS6iEOBRk7CpDXyfVDoL6pKhAIkaVrgJ+F
	mAf2TQqzf81fDjpG4oPV41cVbIUukk8YCYzxYwE=
X-Google-Smtp-Source: AMrXdXvSg7geSCQJnxaI85QTqR1hpJDGZw2vd3hY7l7oNVN83uKL8lPtRNKK09DIBJ7i8Ph+ljvSgQ==
X-Received: by 2002:a62:2545:0:b0:581:fc19:4aa3 with SMTP id l66-20020a622545000000b00581fc194aa3mr2928457pfl.0.1672418674415;
        Fri, 30 Dec 2022 08:44:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/22] cmake: update 3.24.0 -> 3.24.2
Date: Fri, 30 Dec 2022 06:43:59 -1000
Message-Id: <633a6c78c03ecd2f30059e09acbbd64858478939.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175150

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ebd026f5fe81728dd7373ce8d532b60eab32326f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cmake/{cmake-native_3.24.0.bb => cmake-native_3.24.2.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.24.0.bb => cmake_3.24.2.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.24.0.bb => cmake-native_3.24.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.24.0.bb => cmake_3.24.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.24.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d64afffdc1..1ede8eee61 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "c2b61f7cdecb1576cad25f918a8f42b8685d88a832fd4b62b9e0fa32e915a658"
+SRC_URI[sha256sum] = "0d9020f06f3ddf17fb537dc228e1a56c927ee506b486f55fe2dc19f69bf0c8db"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.24.0.bb b/meta/recipes-devtools/cmake/cmake_3.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.24.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.24.2.bb
-- 
2.25.1


