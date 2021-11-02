Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D12C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6617.1635842603401399963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mNeX5cDu;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id o14so31913551wra.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxOlLYW3H137mK/ynkDC3WV8CgTr0MroWF9HNymbBbQ=;
        b=mNeX5cDuDnwdoNKIJC7pGYWv7WVHI1lTApH1V/V+x7fD3rS0QGMWrwe8+ACLAgw1Y1
         TAPGv+Wc3zL2u2RcNwbH9J2LFCyxFn0cM0XY/O2y1DLlnv68+meurH4hgnTrDuTcBpQl
         KEazepKPqnyrqLaSws0oDDMT21KoRsFBy30WlEzaZ9Z9NxL8r5CKGLXvXlcFLentvR5W
         yMxhcLmEMvHznJborWFUIBVcW5t9x9Pr/dSZxuPduL+b4xnhoqlm3YWPk61rMNvamb2u
         5o25NpNMBRlwB3M26EAguI55wb56YxmCkS08hdo+CRkJudIz3SFWb6xRkRHRsQZJGDyf
         aNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxOlLYW3H137mK/ynkDC3WV8CgTr0MroWF9HNymbBbQ=;
        b=uxEL45Yh0Pohz53BAolAspkW59ZQk7rZCDbRVYWbnubEj6iyPswULiFtEernl2V6lm
         dxL59Vs2Mg106WrnCgIFq/CEt0Zxs4OxHX8buU4HFucXIe5MhVnDzU7pAQcnQhszqP2w
         c6vcS6AWI3U+2QD4cV2+/9L1SB4EvZbUqVDic0xjGiO9EpSH3yG2ecbxRw+QaB6MEpfm
         Yw4jNQokUP+zCjLHOWh47nTSs6Movc76b1F9SejLfgNcIDhVSqvpV0vWswzd6nOZBIY3
         Mgakusv/q+qsL5MlmzjczABblD8dqrgY7bIF6Qg9PVlBgdGYNuogfimWlKKicqPJTxbr
         1qqQ==
X-Gm-Message-State: AOAM532bQEQFq/RVIF7z4m3sHVa6cxZp9lnV4x/Qo/MH+rbF7HU77Vh0
	8jWX7vOl3YT6otQGn89+Be7RKNgvtzw=
X-Google-Smtp-Source: 
 ABdhPJxKpJaZtscavLMkVOJIlT1rtqYaaM8shktmKDW+QR5EX4IQHDlF2sJffJONGmiswowSpWKYCw==
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr33232103wrx.71.1635842602047;
        Tue, 02 Nov 2021 01:43:22 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/33] cmake: update 3.21.3 -> 3.21.4
Date: Tue,  2 Nov 2021 09:42:56 +0100
Message-Id: <20211102084303.2974802-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157763

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.21.3.bb => cmake-native_3.21.4.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.21.3.bb => cmake_3.21.4.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.21.3.bb => cmake-native_3.21.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.21.3.bb => cmake_3.21.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.21.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.21.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.21.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.21.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 43d4fe57fb..8b1b0db30d 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "d14d06df4265134ee42c4d50f5a60cb8b471b7b6a47da8e5d914d49dd783794f"
+SRC_URI[sha256sum] = "d9570a95c215f4c9886dd0f0564ca4ef8d18c30750f157238ea12669c2985978"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.21.3.bb b/meta/recipes-devtools/cmake/cmake_3.21.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.21.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.21.4.bb
-- 
2.20.1


