Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86477C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.25195.1672425544284706629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Prw2COL9;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso13614095wmb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJdw9EERK7V2Gehj1f+SIlA66T5ydFE0zBORKr/xVPk=;
        b=Prw2COL9gv/OkXYhHdBQi9T28sT07AxtQDkmyhELEZaE6I0mV5HPDhVy0H82ED1vpv
         6NXpO5WEly7c533ygbJ4VjbMem5JtfRK5C+BLnFb2W1QGXZilIi/KAo4y/YLGKtaXrEr
         9Wm/iIZAHM0RpqYwOG0cKwtdn6v2AwoyzZ61N8TxlTIzy6zHE92rw5c1iOkYUeNB6d1Q
         WMcMTs/McevKFpGT6/xmmbBEOVhqp4mwE5vczWuPJ5m0BrFhHv5MDgD8w7FaAZYAsbdQ
         2yI2LoZbMJASHhOnBaBgdhnm0idPTq689d3EuUeK1re1AqTqcFnZ629dt6VZ3hGcHiZr
         dTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJdw9EERK7V2Gehj1f+SIlA66T5ydFE0zBORKr/xVPk=;
        b=UYORd4+EV+a6Ivy6abZ+JACWFBidebwh5ps6oZ/rY+tnxpNbY/phE6MgvC+fb4Lh12
         1IJxN36i9c0HzDo1fIZKfNTRjiVWf5Q0I62BhKE9GsOq5DQ0sZjcE3vYNmQ5OJ4XnfuK
         FoGXGTrlsQNLhzaxTSWDEyAjiuoU0ma8LvEd5DQvzkec0vaeRYtX9KwrKzj8Vc0glulh
         +IjcfvJiHkRu+Ii3ClB/tQuoZGknbCQsw4gw3oN5JP5RJ+qR7AqDI8gCxBR+5rRD3Zsl
         MtyqTHwRYaegSOe1SuVbmYP+WCfAFwGFBjQkvPjb4NInE4aDVRWaI/8alBdV6AHyd12V
         wN7w==
X-Gm-Message-State: AFqh2krJoovJtGuuz827UqwQfl61vHLDunZgUkPiBY4DN629aYoe5Ppq
	a76hJVjkfe17rrRDySvZ80f8kz5f56w=
X-Google-Smtp-Source: AMrXdXtNdbchYrj8vsJxiBD+U514LSLp2Fu6LBCFUV3WuMWmrHmse+cmuXQKJ9WQmHZ0MyOma8vMKg==
X-Received: by 2002:a05:600c:c87:b0:3d9:73fb:8aaa with SMTP id fj7-20020a05600c0c8700b003d973fb8aaamr14448949wmb.8.1672425542735;
        Fri, 30 Dec 2022 10:39:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/11] go: update 1.19.3 -> 1.19.4
Date: Fri, 30 Dec 2022 19:38:43 +0100
Message-Id: <20221230183850.3089510-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175167

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.19.3.inc => go-1.19.4.inc}   | 2 +-
 ...o-binary-native_1.19.3.bb => go-binary-native_1.19.4.bb} | 6 +++---
 ...cross-canadian_1.19.3.bb => go-cross-canadian_1.19.4.bb} | 0
 .../go/{go-cross_1.19.3.bb => go-cross_1.19.4.bb}           | 0
 .../go/{go-crosssdk_1.19.3.bb => go-crosssdk_1.19.4.bb}     | 0
 .../go/{go-native_1.19.3.bb => go-native_1.19.4.bb}         | 0
 .../go/{go-runtime_1.19.3.bb => go-runtime_1.19.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.19.3.bb => go_1.19.4.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.3.inc => go-1.19.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.3.bb => go-binary-native_1.19.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.3.bb => go-cross-canadian_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.3.bb => go-cross_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.3.bb => go-crosssdk_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.3.bb => go-native_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.3.bb => go-runtime_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.3.bb => go_1.19.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.3.inc b/meta/recipes-devtools/go/go-1.19.4.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.19.3.inc
rename to meta/recipes-devtools/go/go-1.19.4.inc
index 1245faba93..49349ba6ec 100644
--- a/meta/recipes-devtools/go/go-1.19.3.inc
+++ b/meta/recipes-devtools/go/go-1.19.4.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212"
+SRC_URI[main.sha256sum] = "eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.3.bb b/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.19.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.4.bb
index 1eed2cde41..8dc8bdf8e2 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "74b9640724fd4e6bb0ed2a1bc44ae813a03f1e72a4c76253e2d5c015494430ba"
-SRC_URI[go_linux_arm64.sha256sum] = "99de2fe112a52ab748fb175edea64b313a0c8d51d6157dba683a6be163fd5eab"
-SRC_URI[go_linux_ppc64le.sha256sum] = "741dad06e7b17fe2c9cd9586b4048cec087ca1f7a317389b14e89b26c25d3542"
+SRC_URI[go_linux_amd64.sha256sum] = "c9c08f783325c4cf840a94333159cc937f05f75d36a8b307951d5bd959cf2ab8"
+SRC_URI[go_linux_arm64.sha256sum] = "9df122d6baf6f2275270306b92af3b09d7973fb1259257e284dba33c0db14f1b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "fbc6c7d1d169bbdc82223d861d2fadc6add01c126533d3efbba3fdca9b362035"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.3.bb b/meta/recipes-devtools/go/go-cross_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.3.bb
rename to meta/recipes-devtools/go/go-cross_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.3.bb b/meta/recipes-devtools/go/go-native_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.3.bb
rename to meta/recipes-devtools/go/go-native_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.3.bb b/meta/recipes-devtools/go/go-runtime_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go_1.19.3.bb b/meta/recipes-devtools/go/go_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.3.bb
rename to meta/recipes-devtools/go/go_1.19.4.bb
-- 
2.30.2


