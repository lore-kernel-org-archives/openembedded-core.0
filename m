Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.146529.1598053878911499268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A6bY0um6;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ds1so1490676pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 16:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5+qSwlmKkAXpayxQ6AyGy4ebsw7+/Xak4gn2hkUqCgM=;
        b=A6bY0um66FsEBNrQqmhZ4GkhE6XBTcdBx2vQJNvrbZIKJ4RP+qM8j1vJW/sPN7THyD
         zAs5Tr2ec5ob/uLD30YD/r05lyFoXg9PsCDhoxjb0Zx8S7nuY45HtRCH07YTY+t5766b
         wNvAoclVIM3SqnFL8hDjavGcvV7lzmrb9ltdU48cbzIUQBC6G5D87NtC3oyHX7wUZl4d
         DFlSn3Ss23hqZ0SuteoDquTq0M4A4LMp6k0EyKNooxVhi3KcHWs2fYU/GTwyf09LNm7v
         OhYqsN26JJ4eYoUU53YYtbMW+nKpQejvhTKguzOGvi1LS1JQ7A2hVb9RwbmEkqEvUstA
         n81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5+qSwlmKkAXpayxQ6AyGy4ebsw7+/Xak4gn2hkUqCgM=;
        b=U0zfkuPJrmHtXsdnggRyHScSyRucNNNDUZs195Tpzmcj9GtHu55vRyu0salaiUVAdb
         PzJ3U1eRoR4d26uVsDGZgvozOFMMf6M7kdKSU2yyuzTwA6NPF1yGprYqIpYWOothaFMY
         TsEtNWc0hfL5OGIVcF8BxoxUn6/taCOUPs67lM3mepzAxKOtKG0MhojJue3u2+djCCzl
         TA/ULPPhhcwxAowAYakZqmdkRAPDeBEnw4x7ZHi4qLJErhw9NXoJuijoLuEtsmgU8D3o
         WbahI5Ycmumh+ufy3kOHhpneANeViPiznUUusf2Tjj2gWAqpvoK1HeTU7p8KWkJ9d+uL
         44qQ==
X-Gm-Message-State: AOAM531s0obeP52TCd6Fid90ixAfSByGNAkZQYHgeVPKOHY9lWunLqqz
	do21NPYqZnA1c2gyV1lkLP1X+UgPPUcIRA==
X-Google-Smtp-Source: ABdhPJzGYtVGmz0CF3bQTUQMh99ZqoeiHGWxsu7ClmihUDG1mHsoJRZvWR2yl7qoJ7dOeU81NDjQyQ==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id na15mr4293462pjb.119.1598053878081;
        Fri, 21 Aug 2020 16:51:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cc9c])
        by smtp.gmail.com with ESMTPSA id i14sm3869086pfu.50.2020.08.21.16.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 16:51:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFT][PATCH] uninative: Upgrade to 2.9
Date: Fri, 21 Aug 2020 16:51:15 -0700
Message-Id: <20200821235115.994663-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This supports glibc upto 2.32 which is now rolling into distributions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 889695eae3..69b6edee5f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.31"
+UNINATIVE_MAXGLIBCVERSION = "2.32"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
-UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
-UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
-UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
+UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
+UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
+UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
-- 
2.28.0

