Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAE2C32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:08 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.4542.1661294167929125460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JViz2NFV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id w13so8381096pgq.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=lOm2BUbrxmQ0vU1eetJc0Xj32+8jfAfteIJE9qjEJzw=;
        b=JViz2NFVpxaoJDPFf5MRcxlSX0lHA9Enux2cgKkjq53A6gvs9yP2KqNiW2OadsEIwo
         5BvoNU+GylXB0U4cyrT6SClvlEYqhw3649WpUrccJypuUrjjMRAh7qcyNSsiLe1xufxC
         B0Oivn4+ZdFwOQYIPIEUKdIMFfn/7QmIVUWLiKweoT0O+j3nYIaJwxIlvimO2c1k65EV
         KQQH9rQ7oDjzsmeEEaNyaRpWxY//g2eaW0lE4l1YOqF2ZZOShe4pTqK+Wt0gs8reX0z2
         Fs9pufESETY5Nd0hTe4XcbpxxXXrCYMX9X9XNA0AeHswnB/nZTndD8TBVI23uP2kQNpQ
         Tymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=lOm2BUbrxmQ0vU1eetJc0Xj32+8jfAfteIJE9qjEJzw=;
        b=t4C6Kl9fTlYRplzQc8d6OUf2Dto3WtgqxVxoHNxD5tFZK3BRM5GyYijz7RBh9LQLgN
         HymZRdTgMble++Ahtd7hsGQRDM4sX28tEu0bzWE+qmPojV6RP0SxqG1jWEbk67L4qh7F
         y27uqgCdyBQcF386gz3PUzGPVj7Fj04347OctJauZXKbIgVKMLC2Ytft9svBq/tklzMC
         hwgn2QCoDDnnlTm/TjSsNynL10Ze9nOEiRJlt9pKGGT0BBaoJ6cirOpgycTZGxncWZ3a
         tIJq7HE1NHElHB27Jja874Mg0g9CSEUdXbZXUxFMkB8HYzf9VwtXVolfzMGRgtLn10Ul
         07Cw==
X-Gm-Message-State: ACgBeo1inEdvZ+Rglyab+O3fT0avTEttLoV4Urkvnd/suXcA9TI5D8Zl
	jGRKLDpqA3a/ATCBV0KO5wxC4HYAIpSJBfSu
X-Google-Smtp-Source: 
 AA6agR7LN/ZZJSQFgWE+NRZ2yz260Q7OtU5km072jnyrrTk0Ab8ILjINUgtoLZCzJuWAra5VbFxTNA==
X-Received: by 2002:a63:9042:0:b0:41c:cdd4:ae66 with SMTP id
 a63-20020a639042000000b0041ccdd4ae66mr21821024pge.47.1661294166933;
        Tue, 23 Aug 2022 15:36:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/28] go: update v1.17.12 -> v1.17.13
Date: Tue, 23 Aug 2022 12:35:20 -1000
Message-Id: 
 <5acea6ee55d36987609bfa38b579ba86ca1879d1.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169740

From: Sakib Sajal <sakib.sajal@windriver.com>

Update to latest v1.17.x release.
Contains fix for CVE-2022-32189.

go.git$ git log --oneline go1.17.12^..go1.17.13
    15da892a49 (tag: go1.17.13, origin/release-branch.go1.17) [release-branch.go1.17] go1.17.13
    703c8ab7e5 [release-branch.go1.17] math/big: check buffer lengths in GobDecode
    d9242f7a8c [release-branch.go1.17] cmd/compile: do not use special literal assignment if LHS is address-taken
    489c148578 [release-branch.go1.17] cmd/compile: fix prove pass when upper condition is <= maxint
    66c60f076c [release-branch.go1.17] runtime: clear timerModifiedEarliest when last timer is deleted
    c25b12fb81 [release-branch.go1.17] runtime: use saved LR when unwinding through morestack
    1ed3c127da (tag: go1.17.12) [release-branch.go1.17] go1.17.12

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.17.12.inc => go-1.17.13.inc}   | 2 +-
 ...o-binary-native_1.17.12.bb => go-binary-native_1.17.13.bb} | 4 ++--
 ...cross-canadian_1.17.12.bb => go-cross-canadian_1.17.13.bb} | 0
 .../go/{go-cross_1.17.12.bb => go-cross_1.17.13.bb}           | 0
 .../go/{go-crosssdk_1.17.12.bb => go-crosssdk_1.17.13.bb}     | 0
 .../go/{go-native_1.17.12.bb => go-native_1.17.13.bb}         | 0
 .../go/{go-runtime_1.17.12.bb => go-runtime_1.17.13.bb}       | 0
 meta/recipes-devtools/go/{go_1.17.12.bb => go_1.17.13.bb}     | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.12.inc => go-1.17.13.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.12.bb => go-binary-native_1.17.13.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.12.bb => go-cross-canadian_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.12.bb => go-cross_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.12.bb => go-crosssdk_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.12.bb => go-native_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.12.bb => go-runtime_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.12.bb => go_1.17.13.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.12.inc b/meta/recipes-devtools/go/go-1.17.13.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.12.inc
rename to meta/recipes-devtools/go/go-1.17.13.inc
index 77a983f9d0..95d0fb7e98 100644
--- a/meta/recipes-devtools/go/go-1.17.12.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "0d51b5b3f280c0f01f534598c0219db5878f337da6137a9ee698777413607209"
+SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.12.bb b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.12.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.13.bb
index b034950721..4ee0148417 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "6e5203fbdcade4aa4331e441fd2e1db8444681a6a6c72886a37ddd11caa415d4"
-SRC_URI[go_linux_arm64.sha256sum] = "74a4832d0f150a2d768a6781553494ba84152e854ebef743c4092cd9d1f66a9f"
+SRC_URI[go_linux_amd64.sha256sum] = "4cdd2bc664724dc7db94ad51b503512c5ae7220951cac568120f64f8e94399fc"
+SRC_URI[go_linux_arm64.sha256sum] = "914daad3f011cc2014dea799bb7490442677e4ad6de0b2ac3ded6cee7e3f493d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.12.bb b/meta/recipes-devtools/go/go-cross_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.12.bb
rename to meta/recipes-devtools/go/go-cross_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.12.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.12.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.12.bb b/meta/recipes-devtools/go/go-native_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.12.bb
rename to meta/recipes-devtools/go/go-native_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.12.bb b/meta/recipes-devtools/go/go-runtime_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.12.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go_1.17.12.bb b/meta/recipes-devtools/go/go_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.12.bb
rename to meta/recipes-devtools/go/go_1.17.13.bb
-- 
2.25.1


