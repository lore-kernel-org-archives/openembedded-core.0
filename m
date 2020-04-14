Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.11331.1586871427302123899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D29yQCJQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id b11so2966083wrs.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o85fzavr9atH3UISCKOabs14wvEDyyP6BmKVJ61uFSo=;
        b=D29yQCJQ3FOJIJrrV+O7bIAHFwWdmGkvdaEwqk90IcFkJdtdjbmZsfTj18wYowM84x
         QqcBkWgvmAdKy2ohrsA+C4swgS3IjpLKf6TrpXb4QKeWixocusn8rbw6epxtPhfAVZae
         sQavylOYGPirmpVWhHdY6ekevyO/V/NYzKonM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o85fzavr9atH3UISCKOabs14wvEDyyP6BmKVJ61uFSo=;
        b=EProwtfqhduWYvfHmEdEz0OQhPB09AbfNa3LaWfZO7WGSUXD/Fpo4h6HWVCxfxbCzx
         OioPbrS8mm4mvZLn3MTyJ7pEnUgA34asf6yZdUF0661HX/QFjPPQJY3gG702u6uSXzRK
         b45fM7iUVqpjcv7A9+b9VffmQgXgiyIwGLaXj5OtrbgqpGPRjjvSLdMZupFn9gQtv/dg
         wTYpgrc8Z4XHIqiCnQwllV+YCcgdMdVa6L0K557qvzgNOWMOvDexQmIf9MyToOG5qlvE
         gt6ECzxRho/Ek/yd3M9M2IL+CqLUplYJs6EsKCLJNREEdubwDN0EK8vAm8rwmJB+Hxct
         WdCg==
X-Gm-Message-State: AGi0Pua+0P9oOyz4nZhrF3qJBCNzev7fq3LCeFMubkfOHs0g1sPzzYvs
	fEnOzE79LzKqyw0eoywPESj3gTk0k24=
X-Google-Smtp-Source: APiQypI2WRWZ+e1r5mqym5kpwEyOjngt43+uGd0dXQcS89AxRHJ9tcbntet1QnPmyByr9pLa19Ef7w==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr23635700wrj.165.1586871425332;
        Tue, 14 Apr 2020 06:37:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v21sm18240490wmj.8.2020.04.14.06.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:37:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: licensing@lists.yoctoproject.org
Subject: [PATCH] bzip2/pbzip2: Correct license information
Date: Tue, 14 Apr 2020 14:37:03 +0100
Message-Id: <20200414133703.565115-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The license of pbzip2 looks slightly BSD like but is in fact the bzip2
license. The SPDX identifier for this is "bzip-1.0.6" since there is
another version of the bzip license out there.

To clear up all the confusion, use the SPDX license name and update
both recipes to refer to it. The copyright information is slightly
different between the codebases but the license looks the same.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/common-licenses/{bzip2 => bzip2-1.0.6} | 0
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb        | 2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb     | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/files/common-licenses/{bzip2 => bzip2-1.0.6} (100%)

diff --git a/meta/files/common-licenses/bzip2 b/meta/files/common-licenses/bzip2-1.0.6
similarity index 100%
rename from meta/files/common-licenses/bzip2
rename to meta/files/common-licenses/bzip2-1.0.6
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 8e9b779e672..d58f553a49a 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip2"
+LICENSE = "bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 1275cc00972..d7450c73c11 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
 newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
 HOMEPAGE = "http://compression.ca/pbzip2/"
 SECTION = "console/utils"
-LICENSE = "BSD-4-Clause"
+LICENSE = "bzip-1.0.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 
 DEPENDS = "bzip2"
-- 
2.25.1

