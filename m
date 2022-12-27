Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81818C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 09:28:46 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.153737.1672133319317518227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 01:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uvt5DhLi;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id s5so18261986edc.12
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 01:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpB6R87YEhk2DSTjsa3m3ikinuwVbGDcQe4ntrImKZI=;
        b=Uvt5DhLiUP+9IRjJ6XCm7UVxVh2T02M5gybEW9mF79za40/DzXTKHDgnZQLDR9Woj1
         XWEdmMQkamOEZJAl2zJRNKGOgr3VUDGdobyLV8WU6D9ctHeX5LIVNcsA5Cb6YiX3M9e2
         nt8jKscOueaspXaAheMjdxxw+Dobq6vfegMJuXai7ilBtxzqmLZx6bUYKg/V0E02aZLu
         43+trHVXf+PaLyX/1apKhV14jpVYycYFsWiJXw40gVBn73bjxZoyuc9E1h9gox+6HPeZ
         405MdE3RuuNg9Idh/d9sByAIK6+OXqU8hL1Q9jchPH696vNV4602N99iNZXVtqhybdFW
         4B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpB6R87YEhk2DSTjsa3m3ikinuwVbGDcQe4ntrImKZI=;
        b=R519AfC//4BqN3QaEDAaDP2z2Nczl5xHtzKowWQhBvmafL9Uf8rlr9CdH1Cn9OYA9P
         ZXFpDks6X7ZhtqCZExE/sE3ozgGnfgbeXjO/YcFtv/weaROUmzQRCzSGB2wiCO3tdFFO
         vVodPOVAqK26zpDC1KDpZdOxJi9TGJ8QnO7qUQsfq3CGZTEHmfr7WkXWUHZDLhGHeO2D
         9+LIZXbsP5moScbGwHlfnEDmbEYLRMBXmBN5Of5kSrIA+8x5FrWovtvEoVGXni+7O59r
         jfqQoGmVxLVQOGYPCMd1V/gmRvFf33XeQCYFd1ScJCZ5ZYDDbRWSi32hNBlK3cNqdLXt
         DQfw==
X-Gm-Message-State: AFqh2kriE09OWIzF1UI3SIRmOJE1N+w18KD3Hocr6LD5uBbVIPAPKMi1
	TR2rGjHbrNP7kr7I97+MeyF7Hnf/2Kk=
X-Google-Smtp-Source: AMrXdXsL6t+Ww56g7gldnU4Hdvt57jpVgsk8SxaCalm8eq2b1MExtpbwWE/IgO2GBXgCKp8fPeXzjA==
X-Received: by 2002:a05:6402:158d:b0:472:adc9:6eb2 with SMTP id c13-20020a056402158d00b00472adc96eb2mr18233369edv.29.1672133317706;
        Tue, 27 Dec 2022 01:28:37 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b18-20020aa7cd12000000b00482e0c55e2bsm4054516edw.93.2022.12.27.01.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:28:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH][langdale] cmake: update 3.24.0 -> 3.24.2
Date: Tue, 27 Dec 2022 10:28:27 +0100
Message-Id: <20221227092827.602052-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 09:28:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175028

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
2.39.0


