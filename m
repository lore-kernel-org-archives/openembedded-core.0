Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.17642.1590940442142846924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FBin0BwY;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id q19so1582640eja.7
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2tH6bjK9p+fNr7AFwX+Few2Y8+Mjn0UthBnHSWFa2GQ=;
        b=FBin0BwYCxXx+iDs+aYkYMxQR/rNdEmr7dnmcWtveRLWRBaFI58T972iSk0cDj1xf9
         B263x40Yo/HBKLGnH7cRiUyNHyjMYlkO2Cr5V+pLThCk4r1irIM4V7wty7CJ71kM4sUz
         P26354MYGlg/7uluoPJv6KpVNX+QqY1Ar4ETFpt3o+pYXEyFijvH5tgb+oEwdRlIh5ah
         VnurFhq6VQ9HJkXCvNq6j2CIlic6IZmnO7bLlsWZd16WAf3Yz524q2OCglXBy+5foqpZ
         NHJmxdsWOapRc161lTrTaPhDzgBk98KSzej1K82E1BCo4Y7l2FXjddICgiZMIg0bPU56
         7H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2tH6bjK9p+fNr7AFwX+Few2Y8+Mjn0UthBnHSWFa2GQ=;
        b=X0uFCnJ7WWqTvvbtnZI9NaqAA/VDOjbOuHoTAWD+LqSQYDdttdBfLoZxY7nF8rsihT
         coxRbTq79C7cofPEPW1V+09VSWkKXagzzMj0kvIX4w6qTDMnvdQJtyxKrEvRmt8MUdwo
         GI/HzqMncmVEUQTDrkh5xEVSuXwVrBedDgECwYUpXU+RFmHdHZRq2EvetATYO4vfKZzY
         mOMwqsDN7mp2lknXEEbeVz9Z2E+YhZcFsy7qhFafQBx56L8dBCLC4yIuBUkWJcQXbPcU
         HtPa5nugVxGRgzf3EqWc8i/xBrXd1yaZYHI8SGCIBUQentntx6tXVXaGKCSzlFsQ7Pnn
         1sHg==
X-Gm-Message-State: AOAM530uD9uuSOu/4AgHl2bi/4fnC286bdpZwffUSUTDO5H07Re57De4
	9bGs0uNkXbsPUBEnCANOckPako88
X-Google-Smtp-Source: ABdhPJy/oHxynJOD8ooIzv9vTN4S1oCSMBKA/dr9Qo9sYvTfak+RlUWuN6XO5q4PK1xJyAq8is5XWQ==
X-Received: by 2002:a17:906:da1e:: with SMTP id fi30mr16481155ejb.80.1590940440502;
        Sun, 31 May 2020 08:54:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 38/70] alsa-tools: upgrade 1.1.7 -> 1.2.2
Date: Sun, 31 May 2020 17:52:22 +0200
Message-Id: <20200531155254.10283-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/{alsa-tools_1.1.7.bb => alsa-tools_1.2.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.7.bb => alsa-tools_1.2.2.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
index c1f4acdb03..0838be8798 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
 
 SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "475bdf6457bcf55c8c895d653ee56a54"
-SRC_URI[sha256sum] = "a0243328a8f6f691a3055c484fd8d3326393096325e93743b246029d327c4ef6"
+SRC_URI[md5sum] = "4e6187d2c3a8c73a9d75d66a72faed27"
+SRC_URI[sha256sum] = "bfd3c7aae1289269605d3da02279159b10e3dabdd31e658cbceaa30170957349"
 
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree
-- 
2.26.2

