Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E79C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 16:06:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.1645.1706285165331225636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 08:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BM7RtTRc;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e800461baso11400525e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706285163; x=1706889963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXbDAQHP0VCISJLAjKl+piZgPlD9EZGfwZynD6bSykA=;
        b=BM7RtTRcyOlsUQTv4gTvgjDg+X2j8kcjwtAj8E7CWxO6LVqRlMcgjPjle5W51nKYJU
         E4dPvMY/HGY42itupTehvPMHnKfqyAIvrxMuuWoaaw0F+2MUzCwQV6f0TAgxQfC2ZocA
         WsvdijRwjWMLeIg9ZTTR0iSR/q7SwbBOkDVG2GaNPkMtgYnJboSvZl4MTZ/CrEIIqA/B
         zHxrXvH4RON6DdbLXpoubwTbiHBhB2R1r5uvER6X8Re95gxrbQYKSw43ORsPqRozz60Z
         ujKzdi0fI/rHu0JQmUvimMTayzsnCjNaNmrJbaBm11d3bkMuvXCbj7unOkCtQklBq8Nw
         SFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706285163; x=1706889963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXbDAQHP0VCISJLAjKl+piZgPlD9EZGfwZynD6bSykA=;
        b=N+mdoh5iS+3mtCbLfqSmgjBuFDqCZNB5zWh/6XRsrNpP4zDLzBP/qOiJ29Mu8N5pHx
         d93Xeh972sfF9PcZmUWj6PLaS3p6w7ROXetIjSutyGWYnPKCG2HoqjdJT/p8AYRU8kLx
         URYGvNeqSd5ZlkZ0Ng07gDw345uMIYsPFuMEKSchf0HgLBRxIteXZQJ1oEImGDCNjQLk
         zPuN1bNJtPt4gBAyHaD92HeghxoQdQjf7TySyJ5klis6H/JM1WHTizEbO7u1P+g3w/76
         MuiCKkZ20G5RMTyBGLkGb3i2t9QCm1zAfhTFVypyKr+wbWu1X9nbOmrwSOYIIY759/Gz
         vNaQ==
X-Gm-Message-State: AOJu0Yx/KxxRNxbxdvXv7i37iISPqZ0LiMe4lvr6Q3JFeqMkR1GLu4QG
	lMZAEFDSaqz9YCMDws5HdNOQMF5xD/28a4FzewUNhQ5jSYTgR4t/3m1bvpzWQYE=
X-Google-Smtp-Source: AGHT+IE/0BXbw/7kqyIQQ9bSOtEVgHEMucSnQZ7IUPtBd+GqZ7dNFajqpMF6vMBnIU0o27u+qt/lDQ==
X-Received: by 2002:a05:600c:470e:b0:40e:68af:5616 with SMTP id v14-20020a05600c470e00b0040e68af5616mr9925wmo.39.1706285163117;
        Fri, 26 Jan 2024 08:06:03 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id fc20-20020a05600c525400b0040ed1e5d5f3sm5327920wmb.41.2024.01.26.08.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 08:06:02 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] go: update 1.20.12 -> 1.20.13
Date: Fri, 26 Jan 2024 16:05:55 +0000
Message-ID: <20240126160555.66586-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 16:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194392

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.12..go1.20.13
a95136a88c (tag: go1.20.13) [release-branch.go1.20] go1.20.13
5c38c04957 [release-branch.go1.20] crypto/tls: align FIPS-only mode with BoringSSL policy
9e4abed39b [release-branch.go1.20] crypto/internal/boring: upgrade module to fips-20220613
95afc744a7 [release-branch.go1.20] runtime: put ReadMemStats debug assertions behind a double-check mode
8cb86b5f85 [release-branch.go1.20] os/signal: skip nohup tests on darwin builders
59ffd3b90d [release-branch.go1.20] os/signal: remove go t.Run from TestNohup

[1] https://github.com/golang/go/compare/go1.20.12...go1.20.13

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.20.12.inc => go-1.20.13.inc} | 2 +-
 ...binary-native_1.20.12.bb => go-binary-native_1.20.13.bb} | 6 +++---
 ...oss-canadian_1.20.12.bb => go-cross-canadian_1.20.13.bb} | 0
 .../go/{go-cross_1.20.12.bb => go-cross_1.20.13.bb}         | 0
 .../go/{go-crosssdk_1.20.12.bb => go-crosssdk_1.20.13.bb}   | 0
 .../go/{go-native_1.20.12.bb => go-native_1.20.13.bb}       | 0
 .../go/{go-runtime_1.20.12.bb => go-runtime_1.20.13.bb}     | 0
 meta/recipes-devtools/go/{go_1.20.12.bb => go_1.20.13.bb}   | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.12.inc => go-1.20.13.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.12.bb => go-binary-native_1.20.13.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.12.bb => go-cross-canadian_1.20.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.12.bb => go-cross_1.20.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.12.bb => go-crosssdk_1.20.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.12.bb => go-native_1.20.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.12.bb => go-runtime_1.20.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.12.bb => go_1.20.13.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.12.inc b/meta/recipes-devtools/go/go-1.20.13.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.12.inc
rename to meta/recipes-devtools/go/go-1.20.13.inc
index 9be56c6707..b6eeb651c9 100644
--- a/meta/recipes-devtools/go/go-1.20.12.inc
+++ b/meta/recipes-devtools/go/go-1.20.13.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "c5bf934751d31c315c1d0bb5fb02296545fa6d08923566f7a5afec81f2ed27d6"
+SRC_URI[main.sha256sum] = "0fe745c530f2f1d67193af3c5ea25246be077989ec5178df266e975f3532449e"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.12.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.13.bb
index 41db2ada80..d99bab71e1 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9c5d48c54dd8b0a3b2ef91b0f92a1190aa01f11d26e98033efa64c46a30bba7b"
-SRC_URI[go_linux_arm64.sha256sum] = "8afe8e3fb6972eaa2179ef0a71678c67f26509fab4f0f67c4b00f4cdfa92dc87"
-SRC_URI[go_linux_ppc64le.sha256sum] = "2ae0ec3736216dfbd7b01ff679842dc1bed365e53a024d522645bcffd01c7328"
+SRC_URI[go_linux_amd64.sha256sum] = "9a9d3dcae2b6a638b1f2e9bd4db08ffb39c10e55d9696914002742d90f0047b5"
+SRC_URI[go_linux_arm64.sha256sum] = "a2d811cef3c4fc77c01195622e637af0c2cf8b3814a95a0920cf2f83b6061d38"
+SRC_URI[go_linux_ppc64le.sha256sum] = "5f632b83323e16f8c6ceb676cd570b3f13f1826e06a81d92985d1301b643a7d3"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.12.bb b/meta/recipes-devtools/go/go-cross_1.20.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.12.bb
rename to meta/recipes-devtools/go/go-cross_1.20.13.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.12.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.12.bb b/meta/recipes-devtools/go/go-native_1.20.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.12.bb
rename to meta/recipes-devtools/go/go-native_1.20.13.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.12.bb b/meta/recipes-devtools/go/go-runtime_1.20.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.12.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.13.bb
diff --git a/meta/recipes-devtools/go/go_1.20.12.bb b/meta/recipes-devtools/go/go_1.20.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.12.bb
rename to meta/recipes-devtools/go/go_1.20.13.bb
-- 
2.43.0


