Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A84C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.44231.1742834042613504835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PfMWo5M2;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2260c915749so61241105ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834042; x=1743438842; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0J3mphLhYsRfd3xHYAwUnucf+7NLQ/ewxn975gYex6o=;
        b=PfMWo5M2pjy1ztzaCczx0bzwvuyTXKonWHqtHWkS0NlCOCjugYsSWvlb2coIPEf88o
         OZB9/mDsvC6M5XUv77eSrRIw/ulMOuNm9aeK+CVbnuHBfl0CEYG3xCDV8vaXKgfHY7Ci
         Y59/G+mLOAM2937QrQ6MArUeZ39PkidRu6L4NIQNZjQ7U8rwfAnbDReIEWap4nTKJ29Q
         0VnrJWrGpM/ten8GyExxsgn/6T5y1y1A1M33HJ+3BKeNdxEws7md8NHyfJMaV5Qbmo6K
         /Q2F8ZAMFbfUEGDtaB/WS1ulucUTutVIViim7U99T0tzRI/9xzog+ak7iAmF1NZnTDFN
         wLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834042; x=1743438842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0J3mphLhYsRfd3xHYAwUnucf+7NLQ/ewxn975gYex6o=;
        b=RBppoKtb16zw8qR/JhUqOhviwO2GGeqK2tf+IyG1p5Gx5i+/4nZQIm92bzKZQsfRx6
         mZ7ZbrIUnLf+VFZjuMU0LZxW8FXjkkObYGUF3JJ6uwtI2JIh++aAfR9Zn6V+Iitp6TyX
         7sEHhqbEOUPFVSK/5buyyzsWSbjngIdbPDJbfskjWvvQzRQHWD2S2lSRQVBDoBgxqpnP
         raS2zChgA/TtVkxeF9Pmp8at8FP/nHsk7DEvig9muaPlbSFSGhsPI6ij/GYsYEkiKktR
         bKCwwaSBPE3gIrmkSZL+oXqD6slbM13Bpz8c9nTVgybKklzz85QPCy1rMuEOGmoBwPQ+
         6CAA==
X-Gm-Message-State: AOJu0YzUyWid8NQV0hJK3+lGVp45qeu3Y+CftT1WCKKTiHj0sxaaI47E
	+aTPosihPCZas7m5TVuW/E0EkaN45IkxdzOI/oPbzNCbgDtV2c+aLlGCzixj
X-Gm-Gg: ASbGncvidCMEOKotADl+G8unK3HgKKYRP1xBPqoCodybmti5HqgEHdS2WVyfFWXs4PJ
	fM0kY7deJlCxXN2uh4rZpG+fXN1PtJtUsUYVNq07rBz+yp3ZygGAfk4wZo3grKhHoLRRjsapN/M
	7Ommj0m6s07Y8cDpUlWWwLk1Tn5V4fwMHe3s/dkFaOgZwOZiC0anmx1/dQjapQZe97fYaN/e8qu
	X2qcjUwk6yQ5ER5wdjKwgpVUNHhh7mpLRRw6cJOKwINeTbGk9jKgSiXgv3L0Bp5d+vOyg2SG556
	SR3QT4zpjGHMQYR2QH7dD3s4UmcbL/vh8J9HUgtZXyszyBs=
X-Google-Smtp-Source: AGHT+IGFUCFNt9WX+q23VQ3RgeYlGoHGGqrhC8Ep8KzjhLT67e4tKwXaxMPczg1AlbEqMLBBIOZTgQ==
X-Received: by 2002:a05:6a21:339a:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-1fe42f995edmr18253839637.20.1742834041848;
        Mon, 24 Mar 2025 09:34:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:34:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:40 -0700
Subject: [PATCH 19/21] apt: Fix build with GCC 15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-19-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213551

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...strutl-Add-missing-include-cstdint-gcc-15.patch | 26 ++++++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb             |  1 +
 2 files changed, 27 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch b/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
new file mode 100644
index 0000000000000000000000000000000000000000..b86ed8bb92d83dfd03a41e88c34fc4cfad51e395
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
@@ -0,0 +1,26 @@
+From 9da1b0dbdcc90455bc9de49f73a96e7d18f83493 Mon Sep 17 00:00:00 2001
+From: Julian Andres Klode <julian.klode@canonical.com>
+Date: Tue, 18 Feb 2025 10:29:40 +0100
+Subject: [PATCH] strutl: Add missing #include <cstdint> [gcc 15]
+
+Closes: #1096322
+
+Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/commit/f82dcd7e4ebb3f70d28e9feb3621676f8c0cc024]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/contrib/strutl.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index 67100f1..c0a1cbc 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -26,6 +26,7 @@
+ 
+ #include <algorithm>
+ #include <array>
++#include <cstdint>
+ #include <iomanip>
+ #include <limits>
+ #include <locale>
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 26a6d99f84dd823cee9675137d59cf733001369f..62a674d62bb35998e572f2ed60ef268bd4dbb135 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
+           file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
            "
 
 SRC_URI:append:class-native = " \

-- 
2.49.0


