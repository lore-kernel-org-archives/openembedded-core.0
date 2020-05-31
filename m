Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.17664.1590940467470591391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mKNJVAxm;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id mb16so6880014ejb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cM0v8C6k3pUuCUYf+eHQZCb/qdHlGUaG0Ao/NOliIwg=;
        b=mKNJVAxmA32Et6nZ+BRrx99TvEYQgt9ljGqS8b7lHZmDlSIYv8IhBbmMml4R/Fi4T1
         OUdNjNWN97zfTmAF+cmTmx3NrwuHVPM3h8VxS+b7rJda6q2KMDVybu2VwalhdDmLKh25
         8voBDoiSI5vYaLZhnpahM6o+pP2JoTEIHzV1zuw+a4HISeKrur+6ch73LtxxI5zofuX9
         jXDhxACUfB9JmuDx/bbDG5r2hnlhJWfnpMLdyZtjKjJJxnDBk048MfDO8LtvGt3TsYxt
         QIpTLDXZxCZKUFPy1nxcI8x/s909sP1dqwgpr5v9RuNhP6AhUhzkXEr0jlQXSQRLEg37
         mFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cM0v8C6k3pUuCUYf+eHQZCb/qdHlGUaG0Ao/NOliIwg=;
        b=b+bHQ3XloS7AIGrIPVdIK0km6Tisln9HDYV9oVLAlGW5zgd2qb0s94SEoVfCgMoFa3
         84bOfRumEHrRCEweOzlUUH42ARbFQ61ilyMt9uLCjYIst8bQu3TUDGmWR+jlx6Jz8dWs
         VK8u/nq02JWGBe0nNvn6dok9Ao+mB5g3wYwTymRqjpe5H/9S3tQznJWER6keL/3la03w
         0X1lJPcEaiAY4fE2BM/bJoBcnO5k0669i3zj2NoiUtq3TNgAiiUvBSm6s2hqqy/ofFXt
         cppi6SLSQVWhxxBg1cCIQ9VWpgvRUxu3ydwaP8sMBGoh0HpfB6CPDip5FI8vGAyZX+uV
         k6Gg==
X-Gm-Message-State: AOAM530Plkh+kIibyr0eptXofBihf8BPRXmO45qRtpRQjaeeqaVM0Znl
	DPR9i4yXVbxs/Dco2mWpzzXWMHkq
X-Google-Smtp-Source: ABdhPJxntEK53gL2+MoVcIOqx/xybkRF/NiBvRYKX7Zw00KShUU6NytYGP8Yysg56Ev4HGjQIu+jvQ==
X-Received: by 2002:a17:906:a8d:: with SMTP id y13mr15560196ejf.455.1590940465848;
        Sun, 31 May 2020 08:54:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 66/70] help2man-native: update to 1.47.15
Date: Sun, 31 May 2020 17:52:50 +0200
Message-Id: <20200531155254.10283-66-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: http changed to https
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...help2man-native_1.47.11.bb => help2man-native_1.47.15.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.11.bb => help2man-native_1.47.15.bb} (69%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.11.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
similarity index 69%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.11.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
index a60e851897..4f80a2bdb1 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.11.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
@@ -1,12 +1,11 @@
 SUMMARY = "Program for creating simple man pages"
 SECTION = "devel"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "dd322adcaede5bd5eaed075ff8971bc1"
-SRC_URI[sha256sum] = "5985b257f86304c8791842c0c807a37541d0d6807ee973000cf8a3fe6ad47b88"
+SRC_URI[sha256sum] = "c25a35b30eceb315361484b0ff1f81c924e8ee5c8881576f1ee762f001dbcd1c"
 
 inherit autotools native
 
-- 
2.26.2

