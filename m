Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC22C41535
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:27 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.5803.1651048822615162363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mdekgfoz;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id a21so1110607edb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HuiBGEyUl3ZG6pyfYcs8MxYkU/hBKjAnqYCKKyNhgLw=;
        b=mdekgfozT7pizyANH5qvuflLBn1eaSoj8MHtnGMkkLx7rGiRm/41nb0me5ltldk81F
         SseHe76rQrWhTS7LBEiPvA6Cid7ijj8eLfFx/XvXfP0KTAJLGXuzBNHlxvD5dNfQWKAW
         6HfBK/XlgFDBjmoSTw2HMuQhbHfmgO/zjloEkNhsm1esCstt3B0e1vGFWCK9eb3Nyu7a
         EhZpLiSMh+AXVbtKO3dTzXM2lmP68aISlQxya8/h2vS7vplQ/4Pe9D4gRDn0XEHgqMFA
         JgOU8sRVhI34peRckH48/iIRRP9SKMxN8VEu/r4iR8CInHyWOEOO3gmPCvngk+9QdJii
         7f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HuiBGEyUl3ZG6pyfYcs8MxYkU/hBKjAnqYCKKyNhgLw=;
        b=1aN96Q3aWSIvddoute6Ks7oVIo9rZsPFoa4wNEv0ReuRv4PMK4sWXEanpQk1Vs0css
         ImYusRj85XlmPbFOJvdPACP3Fjk5RmpIiuMI+ygZH8S+Id/ORslJmiPPAswRAXcagc/H
         u+iZnFnT/gT1GIzkk+3M6Xueb4iHj/DdecLsL3gS4V9CH0bQ3TDU1BXkWlWT1ohAQeV7
         lLQdWvt02izergyijAy3zXtNtfJ4f93wuUdOKY1kjz88NIOaq46KJJoSOP7RID1SwmHW
         SKOn4+MzsSTACHgsGlfI9FLdCO9opygwGO8xoyvu3t7eQ0vZmG3G3EQ+PS4RCZDGLMIX
         oGCw==
X-Gm-Message-State: AOAM530L4qXHdCHVp+uBYaoPU2eH8TVp918j4UvXLVaE6NApHaGUCcMD
	henjPVVqRjbQ6blt47DU2fyiHHy3iGE=
X-Google-Smtp-Source: 
 ABdhPJwNmm4nVm+4H4sfzDavUyeTgIGgRflGfYbYUZOsGBOG0yhwqhSsaL81uK8JyxDPH0/8h1aixw==
X-Received: by 2002:aa7:c445:0:b0:425:d509:2113 with SMTP id
 n5-20020aa7c445000000b00425d5092113mr21477723edr.12.1651048821152;
        Wed, 27 Apr 2022 01:40:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/18] go: update 1.18 -> 1.18.1
Date: Wed, 27 Apr 2022 10:40:01 +0200
Message-Id: <20220427084009.3406717-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164901

Do not version patch directories; we carry only one version of go.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.18.inc => go-1.18.1.inc}       | 4 ++--
 .../{go-binary-native_1.18.bb => go-binary-native_1.18.1.bb}  | 4 ++--
 ...{go-cross-canadian_1.18.bb => go-cross-canadian_1.18.1.bb} | 0
 .../go/{go-cross_1.18.bb => go-cross_1.18.1.bb}               | 0
 .../go/{go-crosssdk_1.18.bb => go-crosssdk_1.18.1.bb}         | 0
 .../go/{go-native_1.18.bb => go-native_1.18.1.bb}             | 0
 .../go/{go-runtime_1.18.bb => go-runtime_1.18.1.bb}           | 0
 ...cmd-go-make-content-based-hash-generation-less-pedan.patch | 0
 ...0001-exec.go-do-not-write-linker-flags-into-buildids.patch | 0
 ...src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch | 0
 ...-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch | 0
 .../0004-ld-add-soname-to-shareable-objects.patch             | 0
 ...make.bash-override-CC-when-building-dist-and-go_boot.patch | 0
 .../0006-cmd-dist-separate-host-and-target-builds.patch       | 0
 .../0007-cmd-go-make-GOROOT-precious-by-default.patch         | 0
 meta/recipes-devtools/go/{go_1.18.bb => go_1.18.1.bb}         | 0
 16 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.18.inc => go-1.18.1.inc} (82%)
 rename meta/recipes-devtools/go/{go-binary-native_1.18.bb => go-binary-native_1.18.1.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.18.bb => go-cross-canadian_1.18.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.18.bb => go-cross_1.18.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.18.bb => go-crosssdk_1.18.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.18.bb => go-native_1.18.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.18.bb => go-runtime_1.18.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0001-exec.go-do-not-write-linker-flags-into-buildids.patch (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0004-ld-add-soname-to-shareable-objects.patch (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
 rename meta/recipes-devtools/go/{go-1.18 => go}/0007-cmd-go-make-GOROOT-precious-by-default.patch (100%)
 rename meta/recipes-devtools/go/{go_1.18.bb => go_1.18.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.18.inc b/meta/recipes-devtools/go/go-1.18.1.inc
similarity index 82%
rename from meta/recipes-devtools/go/go-1.18.inc
rename to meta/recipes-devtools/go/go-1.18.1.inc
index 54e241af10..64426471df 100644
--- a/meta/recipes-devtools/go/go-1.18.inc
+++ b/meta/recipes-devtools/go/go-1.18.1.inc
@@ -1,6 +1,6 @@
 require go-common.inc
 
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.18:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -14,4 +14,4 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "38f423db4cc834883f2b52344282fa7a39fbb93650dc62a11fdf0be6409bdad6"
+SRC_URI[main.sha256sum] = "efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.18.bb b/meta/recipes-devtools/go/go-binary-native_1.18.1.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.18.bb
rename to meta/recipes-devtools/go/go-binary-native_1.18.1.bb
index 500bb4ddcc..da9f39f428 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.18.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.18.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "e85278e98f57cdb150fe8409e6e5df5343ecb13cebf03a5d5ff12bd55a80264f"
-SRC_URI[go_linux_arm64.sha256sum] = "7ac7b396a691e588c5fb57687759e6c4db84a2a3bbebb0765f4b38e5b1c5b00e"
+SRC_URI[go_linux_amd64.sha256sum] = "b3b815f47ababac13810fc6021eb73d65478e0b2db4b09d348eefad9581a2334"
+SRC_URI[go_linux_arm64.sha256sum] = "56a91851c97fb4697077abbca38860f735c32b38993ff79b088dac46e4735633"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.18.bb b/meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.18.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.18.bb b/meta/recipes-devtools/go/go-cross_1.18.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.18.bb
rename to meta/recipes-devtools/go/go-cross_1.18.1.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.18.bb b/meta/recipes-devtools/go/go-crosssdk_1.18.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.18.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.18.1.bb
diff --git a/meta/recipes-devtools/go/go-native_1.18.bb b/meta/recipes-devtools/go/go-native_1.18.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.18.bb
rename to meta/recipes-devtools/go/go-native_1.18.1.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.18.bb b/meta/recipes-devtools/go/go-runtime_1.18.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.18.bb
rename to meta/recipes-devtools/go/go-runtime_1.18.1.bb
diff --git a/meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
diff --git a/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
rename to meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
diff --git a/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
rename to meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
diff --git a/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
diff --git a/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
diff --git a/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
diff --git a/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
diff --git a/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
diff --git a/meta/recipes-devtools/go/go_1.18.bb b/meta/recipes-devtools/go/go_1.18.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.bb
rename to meta/recipes-devtools/go/go_1.18.1.bb
-- 
2.30.2


