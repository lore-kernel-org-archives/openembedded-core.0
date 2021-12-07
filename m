Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850B0C43219
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.66654.1638882439764992350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ii8FgpZY;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id d9so29365918wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xJO005pV9h0lSfbyGP1GfphaeBe01xS5bCXSBukiUrw=;
        b=Ii8FgpZYJooi4dIyj6TAF/TtYTPBjGeH9m2bHQ8IwdOwdCSK2OCUgLv2TMNXHaTK/j
         ees5YRFHyUao/U0cvAMJ/SHUWKUoPE1ebnZSSFs8FGpcl6anBunwgsMWJQbMQdBsewC/
         a48e1439k6nd2LeVPkL17JDs2USisej5+xvND8+PZodFq9JktwMsiqNcpL4pETuJRT2p
         5T6o6H4Mcz9LqA6LdBkJu6MywNWYXGr50vcTCN+WJPtxpquYSQDHeYokSqilM4C/trzx
         wrlDqOVMGp9MX+pUJPG6PWuQmMNco5enNZxm1vUWIcTmEUod2OdA8rGpVGA02TVImuy7
         Epng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xJO005pV9h0lSfbyGP1GfphaeBe01xS5bCXSBukiUrw=;
        b=iurWPux/WLxUbsi7mOv5WloNwukjF11zLCXPg9f7lnmwg0abuu9z0n0RJo+aFxIFni
         0eHyCqvZ5sBEeaVawH1wuijZ+od4+Db4wihVK2g9IAu1BGGYs8fM/77LZDmBZyaBWJRs
         XU5z/OcWM0+sq2Za76Qg6JNXi8yqtmn91GKLzP46oTXrWwthnQ7l9gUgeFB/GZl9WSrg
         lBWWuAOY8KupaNT3iM25iM4jnTIM2OPoBMAu2GArLkPQivg5+Cg4Dx41eoMUdMoU2BSt
         P1WGFYqJIO2GC4NL3NXWLhFdPTNLXH0e6w+9n8omZkYdplHK0jre896ScKefXv0zf67X
         wvgg==
X-Gm-Message-State: AOAM532Oui160Xz5FBDbgCiqbdMa9tStCJgCNSD6S7zbIIg8Gwth5CI9
	xit8dAY2+gzIPu5cA/AGaJLK/tGSnTgIYQ==
X-Google-Smtp-Source: 
 ABdhPJxujBWl57Gg0jzTgLjpbOqOw0FCoViowrxp8BJcrSdYf5mAsHcG93KtLpUHauGZyuDNppFK/Q==
X-Received: by 2002:adf:d20e:: with SMTP id
 j14mr51560479wrh.220.1638882438409;
        Tue, 07 Dec 2021 05:07:18 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/16] go: update 1.17.3 -> 1.17.4
Date: Tue,  7 Dec 2021 14:07:01 +0100
Message-Id: <20211207130703.3196805-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159299

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.17.3.inc => go-1.17.4.inc}     | 2 +-
 ...{go-binary-native_1.17.3.bb => go-binary-native_1.17.4.bb} | 4 ++--
 ...o-cross-canadian_1.17.3.bb => go-cross-canadian_1.17.4.bb} | 0
 .../go/{go-cross_1.17.3.bb => go-cross_1.17.4.bb}             | 0
 .../go/{go-crosssdk_1.17.3.bb => go-crosssdk_1.17.4.bb}       | 0
 .../go/{go-native_1.17.3.bb => go-native_1.17.4.bb}           | 0
 .../go/{go-runtime_1.17.3.bb => go-runtime_1.17.4.bb}         | 0
 meta/recipes-devtools/go/{go_1.17.3.bb => go_1.17.4.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.3.inc => go-1.17.4.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.3.bb => go-binary-native_1.17.4.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.3.bb => go-cross-canadian_1.17.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.3.bb => go-cross_1.17.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.3.bb => go-crosssdk_1.17.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.3.bb => go-native_1.17.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.3.bb => go-runtime_1.17.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.3.bb => go_1.17.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.3.inc b/meta/recipes-devtools/go/go-1.17.4.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.17.3.inc
rename to meta/recipes-devtools/go/go-1.17.4.inc
index 4fe091787b..5c4423ac18 100644
--- a/meta/recipes-devtools/go/go-1.17.3.inc
+++ b/meta/recipes-devtools/go/go-1.17.4.inc
@@ -15,7 +15,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0"
+SRC_URI[main.sha256sum] = "4bef3699381ef09e075628504187416565d710660fec65b057edf1ceb187fc4b"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.3.bb b/meta/recipes-devtools/go/go-binary-native_1.17.4.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.4.bb
index 1b43a804da..8d8142ce1d 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "550f9845451c0c94be679faf116291e7807a8d78b43149f9506c1b15eb89008c"
-SRC_URI[go_linux_arm64.sha256sum] = "06f505c8d27203f78706ad04e47050b49092f1b06dc9ac4fbee4f0e4d015c8d4"
+SRC_URI[go_linux_amd64.sha256sum] = "adab2483f644e2f8a10ae93122f0018cef525ca48d0b8764dae87cb5f4fd4206"
+SRC_URI[go_linux_arm64.sha256sum] = "617a46bd083e59877bb5680998571b3ddd4f6dcdaf9f8bf65ad4edc8f3eafb13"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.3.bb b/meta/recipes-devtools/go/go-cross_1.17.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.3.bb
rename to meta/recipes-devtools/go/go-cross_1.17.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.3.bb b/meta/recipes-devtools/go/go-native_1.17.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.3.bb
rename to meta/recipes-devtools/go/go-native_1.17.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.3.bb b/meta/recipes-devtools/go/go-runtime_1.17.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.4.bb
diff --git a/meta/recipes-devtools/go/go_1.17.3.bb b/meta/recipes-devtools/go/go_1.17.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.3.bb
rename to meta/recipes-devtools/go/go_1.17.4.bb
-- 
2.20.1


