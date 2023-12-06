Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09102C10F05
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 16:00:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.35468.1701878442289913180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 08:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AyWpfb7g;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40bda47c489so52815745e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701878440; x=1702483240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Htj98LRamzMmc3BGJA9fGZPOK3qb7VuCImxrQjWG4c4=;
        b=AyWpfb7g4hNRQ/PyzGC3sMzqbjnPuyN86BZfUuUg7HuDD08Y4lUM5QxniwaF2GW1S6
         UzDTMQsZtbFBlJbNbePCsYwoJqejh7Y10iBFPSdZJR4KDectX+1B7lPoMAMKeFf0ccJM
         zOpfZdQYju6fZGlAwlWIUsKEsyhMdJASkuRjrV+2L2kQdvKzeEa/TnOX6vIFF0pFfqHI
         FC3EDaB2m0RssoAvtjBlbfE9Lt2ZJWJOccRP9M7M27m5AFuley7Yb/qpqpRqMYH63tIA
         pcAzr7/giBlDD8XviZpZulhsGBfNsKl8GfxaXQwXkHIXsGmxxQHeIV3t03B9sJXiunKq
         FVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701878440; x=1702483240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Htj98LRamzMmc3BGJA9fGZPOK3qb7VuCImxrQjWG4c4=;
        b=f7DFlv2gZYZofcxk17gZyWHXQseNoR1di+N79wcPBhMEhm2pg/nSAsvXd40rDdV6oF
         CgVAk2XtHY9KbbP0UThByZ232ibUBnFaXQTmrpgNBIEL+nJB7q9vpdG92NCfMOaW6QEj
         20Vvkr2dAhy0RGDWhRjNQ0O9woyyWow8cwXTMJ9oSuCnAt4jOtiWPJHhGQgudt3LEFi8
         izusDMQdthdyLmQkSpvv/QlT0uU4LdqwSkj/45B1/3ObEJ8xhgkcv/n1uPbjAHR9lJgq
         ZoU1+sq3heDJDNk7JtPzWLnPUAu+w3L7tXzRX+ncQ4sbykTOzv+8KIHmiHeXR4Mlc3ya
         gpsA==
X-Gm-Message-State: AOJu0YyZxO8zfbsTbKacuMdsi2xryA1b1xSLHrk6lEPeqxL+RHM2mYMI
	+Ksr0m+km+ygg0sW1K/76f3GiEiq+vo=
X-Google-Smtp-Source: AGHT+IGLvOKmpIIzzti0sQvMpbmJYLWvec/8Bb5Z4sUZD5kFG36VhYoGOxXfbL5tksqF+SMZszWZkw==
X-Received: by 2002:a7b:c38e:0:b0:40b:5e21:d36f with SMTP id s14-20020a7bc38e000000b0040b5e21d36fmr725042wmj.120.1701878440372;
        Wed, 06 Dec 2023 08:00:40 -0800 (PST)
Received: from toster.lan (bl23-105-200.dsl.telepac.pt. [144.64.105.200])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b0040839fcb217sm47139wmf.8.2023.12.06.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 08:00:40 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH v2 2/2] go: update 1.20.11 -> 1.20.12
Date: Wed,  6 Dec 2023 15:59:30 +0000
Message-ID: <20231206155929.1035815-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206155929.1035815-1-jose.quaresma@foundries.io>
References: <20231206155929.1035815-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 16:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191905

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
---

v2: add the missing 1.20.12 files

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
2.43.0


