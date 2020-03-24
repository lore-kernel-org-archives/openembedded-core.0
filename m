Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.1382.1585085851002202765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 14:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vNKaSTul;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id l20so242818wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zgIoas0yvrzRJfeaSvudM6yCD+ehzoJ1iAvGKbD9FYI=;
        b=vNKaSTulSX2uY6hv2HNJgoIdQeFVCxxS6bs2aP00R1IYpyFTe7dRZMJzGG+SR+Dlke
         DyduL/0wBt8mhywbR96sinBRNDMBYqLA840tMdCoOqtT/Ynpiv7Vhxl8tt7Wg6X1j8qy
         ypzF0un96A16h4Mp6xTLBxaafzEwUttiktfTCxg3f5VkFhvt+x8bhWoYNg0IRmaMO215
         hxeTibPAK6gLqzJHQEHFyqoBAtz0u5bm5e24XeL6E30HKUj3C3ut1QymPYgOJ8MYSpq4
         G1pF5ywCaNnGgc2XHqAUOtYbw0oeY+HUaWyQjWs8oNoALG7vmfmbV2eZ3jjzxp/sKyfY
         kvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgIoas0yvrzRJfeaSvudM6yCD+ehzoJ1iAvGKbD9FYI=;
        b=h0qPcFA3vVZo4ddbBSz4YAr+9cvGbB1uGJiwh3Ps4gPxCrYXfZzpP9jagd9mc0jCTA
         UalU5JFVevIXfYFAPOVTBJSTvrxa7Uet5FaNCWowG01ldbzuWWf4FGpn/q2N6ze5MoDC
         qTxo65wGlfMtmWmTR0Q+MQ7fgkiPcCXW4iVlE/7aupddsYq6+MDyVHK2fbIsGatVHcGx
         Bp1Y6MQ0Sk1VHwneeXV90evVXUSKGxE4qt5BAppdpBiK/GrphEJK9TYf4QGe3NXl8UyH
         YfrXoFW0p53SpvbmlsRJ1Y0RmqA9ip3xl2a8gqTZAV/v1F7bCXFKmEnpTNPOT9uYxaGJ
         MHZQ==
X-Gm-Message-State: ANhLgQ3zg5IUeFuD/dTVEJJBvYHotsvwnOzq03Jfa8mIZOFviOl4pOtH
	lT4hwii/DUMbYHKS0KCWV7NNMy4aMiw=
X-Google-Smtp-Source: ADFU+vslW3t7h7tUlWCfdwdLbuBpvrn7N8GYhe2W30zLapyxGv5tl7JImJWN/65K/GL/5wr2LSYVEA==
X-Received: by 2002:a1c:456:: with SMTP id 83mr74110wme.54.1585085849375;
        Tue, 24 Mar 2020 14:37:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.93.197])
        by smtp.gmail.com with ESMTPSA id z188sm6167782wme.46.2020.03.24.14.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:37:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] ptest: further bump RAM in qemu
Date: Tue, 24 Mar 2020 22:36:47 +0100
Message-Id: <20200324213647.20829-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324213647.20829-1-alex.kanavin@gmail.com>
References: <20200324213647.20829-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particularly gdk-pixbuf tests were hitting the 2M limit with an image size
that is just under that.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-ptest-fast.bb | 2 +-
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
index 3641217306..29afb91d77 100644
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -13,7 +13,7 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
 
 # ptests need more memory than standard to avoid the OOM killer
-QB_MEM = "-m 1024"
+QB_MEM = "-m 2560"
 
 # Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
 PTEST_EXPECT_FAILURE = "1"
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index bf749acd79..220c427387 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -17,7 +17,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
 
 # ptests need more memory than standard to avoid the OOM killer
 # also lttng-tools needs /tmp that has at least 1G
-QB_MEM = "-m 2048"
+QB_MEM = "-m 2560"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
 PTEST_EXPECT_FAILURE = "1"
-- 
2.25.1

