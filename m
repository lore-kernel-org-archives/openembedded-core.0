Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EA4C4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:39 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.30644.1668892530970110035
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5/klxr6Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 62so7880672pgb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPgAVFrBeAq4LvNM1HYoPY0W/nFDBAuZ6yyrZ6xUnus=;
        b=5/klxr6Z9qTe+uw1R8DHr1HD7bq8U81OHYDWUZ3vnkG5uoR0oReG+OTS6y87ZtZjho
         yI82x6lASBoP15Xy/oDceaDzmzu1PDovsZzj1SIUgx2kufGIGeJCL9vFYWxDErwlygnD
         VwzPilBXvWehjzDX4iKQVgyQfsu7aS1wqjXs1vcZlm5bu8dmR9fSOarCD7JfnXHCA/Ux
         vgQtmFL1w6AHhvG1dWVJpUIaOJHL+A1CSQl7CVSMvs26wtVUHjVxC1I1zpobu1gfGvop
         9wckquPYmG+dzEBFx63TwtQsf02SBuXuqm2XckzWJYqbTaIdd8yvFp8BgSekf3V4gWUq
         Ss3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPgAVFrBeAq4LvNM1HYoPY0W/nFDBAuZ6yyrZ6xUnus=;
        b=MAfTPzMbMTZIkVcOcpFl6RYlAtEcRfR4SDKXEcaYu8Ye697u3+Ejgnf+M0Tnw29rkX
         VXtlPdGI5fFpOLaYtwjsubCFNO6hZF3/R3kw0inFDPeoEN1e/wn7e2heWi4Au382gU3c
         woAnjC51V+bGaGhheOkG5SCsDZsSdL0DI1HL4Jr45C9aQT+hSYAMOxk1p3xQO3xAMW0F
         ZC0KxBnZKrOmqQ9P/4LKKo/CjGiupeQDdsOGEvzIpo8hmZK6WSnxSAlYXK05PRmlwG/J
         l330gs2gQhLpekDzfXeCKTfqlNHUCj3whE/+PcQDCWydDHUIRxTRedHnlfXyfG02DA2p
         kSow==
X-Gm-Message-State: ANoB5pm06Tg1zC3Xfl8FxLzyBqNHG2Mki56639LTeNmkaEqIEIhYps9A
	bO0BvEMIzBfBnqeZEJlkDOJi0Iv90EQsFnVJHlw=
X-Google-Smtp-Source: AA0mqf64YRx/sGyopUnj8uab/wuT6USZtqp+nBruQrTDxCzuGZM88bEo2MPHhr/8oRg/tbZJwe8Y+A==
X-Received: by 2002:a63:5359:0:b0:46f:3dfb:87e1 with SMTP id t25-20020a635359000000b0046f3dfb87e1mr12125946pgl.290.1668892529813;
        Sat, 19 Nov 2022 13:15:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/35] go: update 1.19.2 -> 1.19.3
Date: Sat, 19 Nov 2022 11:14:43 -1000
Message-Id: <ff2436215efda27cc380840a4f97910d3263e245.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173544

From: Sakib Sajal <sakib.sajal@windriver.com>

go1.19.3 (released 2022-11-01) includes security fixes to the os/exec and syscall
packages, as well as bug fixes to the compiler and the runtime.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fd33d169a5febb37eac03312c4014e35d29d06df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.19.2.inc => go-1.19.3.inc}     | 2 +-
 ...{go-binary-native_1.19.2.bb => go-binary-native_1.19.3.bb} | 4 ++--
 ...o-cross-canadian_1.19.2.bb => go-cross-canadian_1.19.3.bb} | 0
 .../go/{go-cross_1.19.2.bb => go-cross_1.19.3.bb}             | 0
 .../go/{go-crosssdk_1.19.2.bb => go-crosssdk_1.19.3.bb}       | 0
 .../go/{go-native_1.19.2.bb => go-native_1.19.3.bb}           | 0
 .../go/{go-runtime_1.19.2.bb => go-runtime_1.19.3.bb}         | 0
 meta/recipes-devtools/go/{go_1.19.2.bb => go_1.19.3.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.2.inc => go-1.19.3.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.2.bb => go-binary-native_1.19.3.bb} (84%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.2.bb => go-cross-canadian_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.2.bb => go-cross_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.2.bb => go-crosssdk_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.2.bb => go-native_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.2.bb => go-runtime_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.2.bb => go_1.19.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.2.inc b/meta/recipes-devtools/go/go-1.19.3.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.19.2.inc
rename to meta/recipes-devtools/go/go-1.19.3.inc
index 206ee3ca45..1245faba93 100644
--- a/meta/recipes-devtools/go/go-1.19.2.inc
+++ b/meta/recipes-devtools/go/go-1.19.3.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b"
+SRC_URI[main.sha256sum] = "18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.2.bb b/meta/recipes-devtools/go/go-binary-native_1.19.3.bb
similarity index 84%
rename from meta/recipes-devtools/go/go-binary-native_1.19.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.3.bb
index 80c24095dd..334f63b30b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.3.bb
@@ -9,8 +9,8 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5e8c5a74fe6470dd7e055a461acda8bb4050ead8c2df70f227e3ff7d8eb7eeb6"
-SRC_URI[go_linux_arm64.sha256sum] = "b62a8d9654436c67c14a0c91e931d50440541f09eb991a987536cb982903126d"
+SRC_URI[go_linux_amd64.sha256sum] = "74b9640724fd4e6bb0ed2a1bc44ae813a03f1e72a4c76253e2d5c015494430ba"
+SRC_URI[go_linux_arm64.sha256sum] = "99de2fe112a52ab748fb175edea64b313a0c8d51d6157dba683a6be163fd5eab"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.2.bb b/meta/recipes-devtools/go/go-cross_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.2.bb
rename to meta/recipes-devtools/go/go-cross_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.2.bb b/meta/recipes-devtools/go/go-native_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.2.bb
rename to meta/recipes-devtools/go/go-native_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.2.bb b/meta/recipes-devtools/go/go-runtime_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.3.bb
diff --git a/meta/recipes-devtools/go/go_1.19.2.bb b/meta/recipes-devtools/go/go_1.19.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.2.bb
rename to meta/recipes-devtools/go/go_1.19.3.bb
-- 
2.25.1


