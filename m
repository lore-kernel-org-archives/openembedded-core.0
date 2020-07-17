Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.2308.1594947718843191593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 18:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pRN7cayF;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ls15so5710706pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 18:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQydEL2krPj4aUUgJgY5gUsrJg/7KIMGxzEIsEfQA48=;
        b=pRN7cayFfUytnAPwWyuMA7/GmPOpzNAnk4VaKy09nCXIrLGyxzaLK9ITceA19W7kyc
         7gDVAPgzjVgXG7egiaCHZ5/bt4cNpWEFjg1npQWg4ikyqMBiQYpe2Jsh5LXgKq/izZEu
         J0DzwArMn2thb1VeGOdJ6bHxq5utclZ8/Wgs5+d+wuDYp0qI7eMCe83g55cqZBWxYWmA
         az49xApyHSMKrYDYaZ3owt6gPswTzfCiIrc4E6pKyhp06Y8F54P5OOnZVBfnETPah5G0
         eJ3g5n0rwv36PnztnNx8PfyOq7POSiaqTCuZnOrzNzryhiCRcJ4jg5LK1lHAzzSd/29c
         WKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQydEL2krPj4aUUgJgY5gUsrJg/7KIMGxzEIsEfQA48=;
        b=ge+mKexsTXF2bZdl1/Jn1tUL32633CzL8xEQXtyw7dOQ7gUDULmUcTog76dgBsjM8r
         RF1nUE8vxvSqHlMkxxyFBcGl1/3r7S4ApXbnQUsXimBNaqA1KsEZrVlYJU5WBIH22CTM
         gnHsExbp96tdE1XRCrR6WWCX83CX5g1UlwkFgXw+YMhq7XY8/mADU4yEppl/OYoiVNs0
         lwi61/FCoCZHLPe/9o4qvZcMm2DcjknJi9yfXj1KqNWwwV8DR9XR8pHYldppb6Pld62M
         pTlKcA0v9WFSO7gEdxYajywdG8kHXIEUPxI5GE0RvEgLPCJ4jtIQyZdEoyxjSK2/eu01
         cdxA==
X-Gm-Message-State: AOAM533+dPHNaLPSIhDC2fmXM52V1Bv9C/VWS1VWBTJBFBcj9VZrsJo0
	tEx/Wn4NRGjs6dfF0ABM/llNKDqC9cI=
X-Google-Smtp-Source: ABdhPJzHPTQ/wLRvsbc1CvrR10jnMi2o3OO4UKZx5ImKG5W5KPmB6Ha9gNEu4cyNMf5oh9TTtOa3cg==
X-Received: by 2002:a17:90a:cc0f:: with SMTP id b15mr7420959pju.83.1594947718065;
        Thu, 16 Jul 2020 18:01:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ad4])
        by smtp.gmail.com with ESMTPSA id j26sm5637238pfe.200.2020.07.16.18.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 18:01:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest tip
Date: Thu, 16 Jul 2020 18:01:55 -0700
Message-Id: <20200717010155.3552112-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Added copyright for AArch64 memcpy and memset code [1]

Details changelog is here [2]

[1] https://git.musl-libc.org/cgit/musl/commit/?id=fdf8b2ad9c5ae6adf3a91c0043eb898badee46d1
[2] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=fca7428c096066482d8c3f52450810288e27515c..0a005f499cf39822166dd4db3d2d31f0639f1b1b

Signed-off-by: Khem Raj <raj.khem@gmail.com>

s
---
 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index bdce412162..54edfc88e5 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95ee848a08ad253c04723da00cedb01"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b03f1cc25363d094011f8f4fd8bcfb68"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 0913b09aaf..ed2178b5a4 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "fca7428c096066482d8c3f52450810288e27515c"
+SRCREV = "0a005f499cf39822166dd4db3d2d31f0639f1b1b"
 
 BASEVER = "1.2.0"
 
-- 
2.27.0

