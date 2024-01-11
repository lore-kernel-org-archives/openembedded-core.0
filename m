Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710DCC47DA7
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:42 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.15719.1704990459679715481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T83HhNrF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d595de968bso3594195ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990458; x=1705595258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjF4uazWuwGsOs254pKoVPTcR+CUUqqGMFU07AV2Um8=;
        b=T83HhNrFOIIvKIwG1Dtee25azQioGFAPoswC1qKjb3S26XNvPSfqD8ZfonjkH0AGFr
         c8wun/CUdrfKgIIgLlBUs5mpIHutsj/aKV+OVFFZl78U2e7KQ2xAIkg5aTUwPzflz21l
         AM52ofXiSfoinZwlGpMINqJc8KTf/06DtxmVjeetlQkeZQ6aUcXusAsYxG6gJDmqe42k
         jDbgaZQ6ou+PuS6JSduQs+wmIiRY2S9FchZ7Cvms2h/wUc0uTVSbtdvQ1ZrLj9ydbomB
         9t1cvE3AyjVzTIVFuOwLs3lt/fH2nK5MDtsoudUBtaB1ZLcl9ND4xWxM+Te+qQDCHT0d
         ngcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990458; x=1705595258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjF4uazWuwGsOs254pKoVPTcR+CUUqqGMFU07AV2Um8=;
        b=c0VFEpsOvD7nOmoEJMjMBAYatwpB3s3eEqHXPLcSSaIgPyoEeKm4ZFWWDYfswSWTQ1
         LkmttBxp9Y8kZ4a6Uc3qKaewaAJmJa9TsBNQROTWUUbaBq3Y2zR2F6COIqLVVrQDphN3
         x6BoFosdyA6fzuSIKsvt6QinT4+ZSBiy+X0C2QobO6gl9rZVoc/HN+gvZp1TDJQJxLLM
         sVcjTfqymmogFUVDcdWRK3Vy3B9wmCRk7ZWBjxodk21Dh8GoO2sg5Yy2fRtFiNjInUp8
         hMP1T5suj+D2LxKatruY/LkBFrodVlvrXDzV2BG4BSY2DKfRkUxMDx9PPstfvKO4cnXS
         yLtw==
X-Gm-Message-State: AOJu0YwcHGOuCWUcVFHjOIbkEQ4xEaqprbL8Y2fOaKtVf7T4IWgN9XXI
	kj0Q7HSA0efiJgVGbHHqrSMDiSn6Qmw0PItg/L0wKw5TX6MWnQ==
X-Google-Smtp-Source: AGHT+IF5Q1q54DfaVKfP/R4uP+0p2ae2elnnf9bPEmPm5ilsfo1nuCxcLu2IVcCwx1JZfzjodHj0zA==
X-Received: by 2002:a17:903:41cb:b0:1d4:9225:a88f with SMTP id u11-20020a17090341cb00b001d49225a88fmr1487340ple.13.1704990458329;
        Thu, 11 Jan 2024 08:27:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/12] go: update 1.20.11 -> 1.20.12
Date: Thu, 11 Jan 2024 06:27:17 -1000
Message-Id: <3e7981c7e575b0e16a7b7aba47993e9c58a719c5.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193552

From: Jose Quaresma <quaresma.jose@gmail.com>

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.11..go1.20.12
97c8ff8d53 (tag: go1.20.12, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.12
6446af942e [release-branch.go1.20] net/http: limit chunked data overhead
77397ffcb2 [release-branch.go1.20] crypto/rand,runtime: revert "switch RtlGenRandom for ProcessPrng"
d77307f855 [release-branch.go1.20] cmd/compile: fix findIndVar so it does not match disjointed loop headers
1bd76576fe [release-branch.go1.20] crypto/rand,runtime: switch RtlGenRandom for ProcessPrng
1b59b017db [release-branch.go1.20] path/filepath: consider \\?\c: as a volume on Windows
46bc33819a [release-branch.go1.20] cmd/go/internal/vcs: error out if the requested repo does not support a secure protocol
e1dc209be8 [release-branch.go1.20] cmd/go/internal/modfetch/codehost: set core.longpaths in Git repos on Windows

[1] https://github.com/golang/go/compare/go1.20.11...go1.20.12

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8515842b5c503b9a8840675d9cbcfe147d25c1d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.20.11.inc => go-1.20.12.inc} | 2 +-
 ...binary-native_1.20.11.bb => go-binary-native_1.20.12.bb} | 6 +++---
 ...oss-canadian_1.20.11.bb => go-cross-canadian_1.20.12.bb} | 0
 .../go/{go-cross_1.20.11.bb => go-cross_1.20.12.bb}         | 0
 .../go/{go-crosssdk_1.20.11.bb => go-crosssdk_1.20.12.bb}   | 0
 .../go/{go-native_1.20.11.bb => go-native_1.20.12.bb}       | 0
 .../go/{go-runtime_1.20.11.bb => go-runtime_1.20.12.bb}     | 0
 meta/recipes-devtools/go/{go_1.20.11.bb => go_1.20.12.bb}   | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.11.inc => go-1.20.12.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.11.bb => go-binary-native_1.20.12.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.11.bb => go-cross-canadian_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.11.bb => go-cross_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.11.bb => go-crosssdk_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.11.bb => go-native_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.11.bb => go-runtime_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.11.bb => go_1.20.12.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.11.inc b/meta/recipes-devtools/go/go-1.20.12.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.11.inc
rename to meta/recipes-devtools/go/go-1.20.12.inc
index 2f510b1791..9be56c6707 100644
--- a/meta/recipes-devtools/go/go-1.20.11.inc
+++ b/meta/recipes-devtools/go/go-1.20.12.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "d355c5ae3a8f7763c9ec9dc25153aae373958cbcb60dd09e91a8b56c7621b2fc"
+SRC_URI[main.sha256sum] = "c5bf934751d31c315c1d0bb5fb02296545fa6d08923566f7a5afec81f2ed27d6"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.11.bb b/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.11.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.12.bb
index bf91067971..e555412a19 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.11.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ef79a11aa095a08772d2a69e4f152f897c4e96ee297b0dc20264b7dec2961abe"
-SRC_URI[go_linux_arm64.sha256sum] = "7908a49c6ce9d48af9b5ba76ccaa0769da45d8b635259a01065b3739acef4ada"
-SRC_URI[go_linux_ppc64le.sha256sum] = "e04676e1aeafe7c415176f330322d43a4be5ea6deb14aca49905bd1449dc7072"
+SRC_URI[go_linux_amd64.sha256sum] = "9c5d48c54dd8b0a3b2ef91b0f92a1190aa01f11d26e98033efa64c46a30bba7b"
+SRC_URI[go_linux_arm64.sha256sum] = "8afe8e3fb6972eaa2179ef0a71678c67f26509fab4f0f67c4b00f4cdfa92dc87"
+SRC_URI[go_linux_ppc64le.sha256sum] = "2ae0ec3736216dfbd7b01ff679842dc1bed365e53a024d522645bcffd01c7328"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.11.bb b/meta/recipes-devtools/go/go-cross_1.20.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.11.bb
rename to meta/recipes-devtools/go/go-cross_1.20.12.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.11.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.11.bb b/meta/recipes-devtools/go/go-native_1.20.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.11.bb
rename to meta/recipes-devtools/go/go-native_1.20.12.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.11.bb b/meta/recipes-devtools/go/go-runtime_1.20.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.11.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.12.bb
diff --git a/meta/recipes-devtools/go/go_1.20.11.bb b/meta/recipes-devtools/go/go_1.20.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.11.bb
rename to meta/recipes-devtools/go/go_1.20.12.bb
-- 
2.34.1


