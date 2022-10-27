Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EE8FA374A
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.2199.1666901793633820197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hazDPowR;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id 13so7920394ejn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8lJQ26CtFu09/1t2Q2tOuB8p+p/EXOn2+tsl0GOBdQ=;
        b=hazDPowRfd49zMNGMWwLtp2wVlFdluVZBcAdFISUE3PnEjXUQp0ltV/fuPaeQAfUOn
         6bPAORi++os9I8zH1b/wKGCXrcX1CkNTCOtOC8RMFXwsS+vKelwnadWg2EzOKjyBt/MU
         Q5hc7q3Wic5l+juqrZS5Gher4MS6f0XjjsuQE7FkeMne67WsgyMGvPTvW1np5ydXBRaP
         yAXJg3CsMykQWirQ1b7q7+SSy4LgEs/KzQj9j3LqMUAq2twUuPMkSgRppyfW+mhrnE3W
         vaUkkowJmqPfPYx+6Byxuj8fL+XFtgR38lrxqcg7h/IUXO4zFNiKJ7zNa0FHOE0dMzfY
         ypfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8lJQ26CtFu09/1t2Q2tOuB8p+p/EXOn2+tsl0GOBdQ=;
        b=ugXpElHq9A11h0ePy0QfDJ6zq/kpLqOg6azVknu9xnVs8UZYoI8hJTc9a1qxjna8N5
         VX4nxpY1UL3fQz2E+iepnNd/gQfKXcWJdaje3WOHS8zcKr5VEvXFrtf2+t8bSvbkPh70
         3vLh7z+Xe3EG4ry2lv7taOgYXuc3/EylHKfitwWGj6pNqtJqRkDJvA03KTcLU6L7CE/G
         dtRREdI7rQr8j0+DOGq0iG2Anz38+tnS809SbAnpC57d+68V0ibkADM6PHhJLi7bHYR9
         UQ0CefDWdwAPyTrq/d0Po+QIEfE9mXUu9FhGhPEHioE0A7+hfXjY1POQ9D6mEeLqFnoB
         /K/g==
X-Gm-Message-State: ACrzQf1iPYiUgOal8Oj0XzJqEqN7bNZyZGkLVZ243byL5wLgFNv26Qc5
	nabgHr0Bcn6I2VsYtjloovrbmQHYgTDOHw==
X-Google-Smtp-Source: AMsMyM5iOTnkLaOC+NCYeCe+fvUpEpecsEazq3xuslKTyxsi+wKfMkXlAbAZzASPoRXpaacn+4quwQ==
X-Received: by 2002:a17:906:5dce:b0:78d:e71a:6e0 with SMTP id p14-20020a1709065dce00b0078de71a06e0mr43075819ejv.360.1666901792124;
        Thu, 27 Oct 2022 13:16:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/23] cmake: update 3.24.0 -> 3.24.2
Date: Thu, 27 Oct 2022 22:16:01 +0200
Message-Id: <20221027201611.3644334-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172216

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


