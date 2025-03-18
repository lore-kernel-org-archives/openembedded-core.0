Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A093CC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.2869.1742323133610406423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O4gPp7YD;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so7717067a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323133; x=1742927933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhzkP8MEVpHWnx8XNSAlZP6Y3WdVRHIhXu6jRccd0g8=;
        b=O4gPp7YDx0BmkXDozyM2F6WuZiCdNEbWTz3Lq4APdKELpNR5621vf10DkT2Miu0fC8
         +tPfY9bQXdQYwYcbM735c9LGU4iPThzj7Zq7zVlv+OsQJzzPW/eQY72wI1roI+FPAqyo
         tyIWC0DkBeliIEG6ifJPOs6RHQiXsybgeF8Y+f+XWjUGEmW5+HPjCDIoalRLg1NagjIi
         y0oLxxaKmOW8xlYBw2Mc6SWk4dJ9j5kaeAWnjoWaPlR+QNNj5Waenr5Tc3JMMFOqoLVT
         +kTmERSIAv9adzV6F0jPB+jtEiG1DiR9pB+2BC/5qfcGS+sLAA/vmyJPF9B8hGC4emKV
         rf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323133; x=1742927933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhzkP8MEVpHWnx8XNSAlZP6Y3WdVRHIhXu6jRccd0g8=;
        b=F5cdT79rpa1g2oYZelaD6hR8ZaR/pvFTG4QSXrjj+nowTko5QrbTzQeURkb/EqLrfp
         3pVps4DLJf13POYgHUJ49AoXb9+wmonkG1w3k4pUODOL0qSRgVUoxCUZ9NXqvGa6S7JU
         aBInuxyzxASp2iMmqLoJS2IQMAPh1iVodUNh34q8JwnzuqHm3FsfTGNsQFrDUz7gXf8+
         gwJnCpyrZZGPlbxh2XUB+5PqxYHOTNFGCgakHZIHAnu40k8GS3jM98DGB+iN6AdG+zzP
         9qZxZ6lX/zc0ioiKXRl0/dPb+pYus09wRTvP10wbfkAlRr+Dps+pavsVbb8lANWlc1r2
         sQsw==
X-Gm-Message-State: AOJu0YzEoCTqgX1n3xtv+iDMCnIogJRYdqMES92uajlbyljtRoNY13AZ
	uZcH5OzUFXnBEref8s/Jlj6/uqfMqN+Wu66ZQEZtZu2QDVSp9HD7HHaY+JUl
X-Gm-Gg: ASbGncsj/MkFexbYFbqXkgUxXgMf2IDXfQZWCnlUeXQSbctXAuqbT5GebOKY3MbSw7g
	hz1iPyV780OFKvoVoxMbduALf1lJiSXd0LsDFF/nZ4scviw8LBMO7TijQh4KJ/232oG2befQZwY
	69c9JYlWfd5uVaaaFNTdK267jl00uJTmlzu2N++8Ynd6Ya7nwCj3FU624/JtfAfQLih8pngY6bU
	guHL2hG+bDGnkSm+qC5zg0WyIF5Fs2BUMml/QMuzVKRvtQzVIzNP35dAnbmPBBvwjSIaN6GXKFV
	18gQT67FsH7z5BO80PW6fobT3sG/JTvuln2c
X-Google-Smtp-Source: AGHT+IEFH+1+KIssCJV0+IKxg5TSwnaKqj+NhxtiabWCJ7DILWHADxRyaHxbUYr5KzM8itmwN9mWeg==
X-Received: by 2002:a17:90b:4fc5:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-301a5aff206mr5836853a91.7.1742323132788;
        Tue, 18 Mar 2025 11:38:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 10/25] libsndfile1: Include <stdbool.h> instead of redefining bool true and false
Date: Tue, 18 Mar 2025 11:38:25 -0700
Message-ID: <20250318183842.2256284-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213236

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...h-instead-of-redefining-bool-true-an.patch | 65 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch
new file mode 100644
index 00000000000..542a7838590
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch
@@ -0,0 +1,65 @@
+From 0ba5ab2fb7f29a01dbe570c324011e8cffc89d82 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Tue, 17 Dec 2024 10:38:47 +0100
+Subject: [PATCH] Include <stdbool.h> instead of redefining `bool`, `true` and
+ `false` keywords
+
+Fixes #1049
+
+Upstream-Status: Submitted [https://github.com/libsndfile/libsndfile/pull/1055]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ALAC/alac_decoder.c | 6 +-----
+ src/ALAC/alac_encoder.c | 7 +------
+ 2 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/src/ALAC/alac_decoder.c b/src/ALAC/alac_decoder.c
+index 46d3330..1b4a87c 100644
+--- a/src/ALAC/alac_decoder.c
++++ b/src/ALAC/alac_decoder.c
+@@ -26,6 +26,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stddef.h>
++#include <stdbool.h>
+ #include <string.h>
+ 
+ #include "alac_codec.h"
+@@ -38,11 +39,6 @@
+ #include "ALACBitUtilities.h"
+ #include "EndianPortable.h"
+ 
+-typedef enum
+-{	false = 0,
+-	true = 1
+-} bool ;
+-
+ // constants/data
+ const uint32_t kMaxBitDepth = 32 ;			// max allowed bit depth is 32
+ 
+diff --git a/src/ALAC/alac_encoder.c b/src/ALAC/alac_encoder.c
+index 599399a..f303311 100644
+--- a/src/ALAC/alac_encoder.c
++++ b/src/ALAC/alac_encoder.c
+@@ -30,6 +30,7 @@
+ // headers
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdbool.h>
+ #include <string.h>
+ 
+ #include "sfendian.h"
+@@ -44,12 +45,6 @@
+ #include "ALACAudioTypes.h"
+ #include "EndianPortable.h"
+ 
+-typedef enum
+-{
+-	false = 0,
+-	true = 1
+-} bool ;
+-
+ static void	GetConfig (ALAC_ENCODER *p, ALACSpecificConfig * config) ;
+ 
+ static int32_t	EncodeStereo (ALAC_ENCODER *p, struct BitBuffer * bitstream, const int32_t * input, uint32_t stride, uint32_t channelIndex, uint32_t numSamples) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 2a1b96d5e79..63c1570621b 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
            file://cve-2022-33065.patch \
            file://CVE-2024-50612.patch \
+           file://0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

