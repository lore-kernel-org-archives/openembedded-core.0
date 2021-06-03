Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.650.1622735010554159715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N//GrDeQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id t3so7658140edc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TtsZ18E7+AXQpQGrfWxkraSXiLTQc64N6d4JGOHOUVg=;
        b=N//GrDeQfXtblH5N/h6fyQ56OEUAxLgmW1YWtXi+bhlllb4BnDY8YPHoBzrDta6lKS
         Zr634e6fbYhBFfAJpnzUFs4wz6CpslDxnfZmMiZyJDqA6/R/xYEefmrxjKd0JRUk0JIf
         3Hry2m+UloVRfnCj3TJsyExHpbzOZLK3EgCP8xjtT2LyIp7mqODzkWXhZ5GqQlc/HjZL
         rE4/QMZgpsVt2MHuYmeA2MFPX3Ae/vTtt7VxaZv+hrsRDE0xWQnt3W/KASdhQDsIeTGn
         36JNj9m+UTt2tspm/NPNh1D5mRl1RoTbD6J0vYQBbhM+xxFaRxISGFO07jjT+U9wsipB
         6s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtsZ18E7+AXQpQGrfWxkraSXiLTQc64N6d4JGOHOUVg=;
        b=RqTUrnFzzWaMHpcnEe9MOLXAHNoEzn2rhf8dNsMMUtNymknHS9tYrYSrPbNYw8ihZi
         0+9oNxNedy8d8hCRSAeE/Dj3Z9gvscBkWnrRqUO5FQtWtwiKi/pWOPbdCo52devV5oNJ
         tUnzJlEoqjHaMa7qlsZ71PPcAnLbmUW/bjax/Zk9aFaiRmDRPdggoD6NQ7lQAMc4KDN2
         N95bnhCXyIcTffRJJ4tx+9QAqg9eZ9i04OrIQTtyBeziMOKkEHTbpoK0BZFEeTACM3HH
         q1LoP+VxvPO+rcOA6IcaXDS2vqXTXpjnprfU4GU6Xve8Do0eUpapbf7R1tu9u5AfMjeO
         cBDg==
X-Gm-Message-State: AOAM530af7rGcv4kUAUEhws1Bgs64+a8tyGH7bXuUrMRdnkPLoL2z8Tm
	Icpx1DKF4n8wWcBYBhEzLbU9NuZPjM/M1Q==
X-Google-Smtp-Source: ABdhPJxE0TTP+6BphIug094Eb/jF4Zcx9nCUBoa+7crQ83Lpz0awBSdzl+P58EmMF2LyyMeWm4Bz3w==
X-Received: by 2002:a05:6402:da:: with SMTP id i26mr82293edu.379.1622735009145;
        Thu, 03 Jun 2021 08:43:29 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:28 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] alsa-ucm-conf: upgrade 1.2.4 -> 1.2.5
Date: Thu,  3 Jun 2021 17:43:12 +0200
Message-Id: <20210603154313.2894136-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154313.2894136-1-schnitzeltony@gmail.com>
References: <20210603154313.2894136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See changelog at [1]

[1] https://github.com/alsa-project/alsa-ucm-conf/releases/tag/v1.2.5

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../alsa/{alsa-ucm-conf_1.2.4.bb => alsa-ucm-conf_1.2.5.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.4.bb => alsa-ucm-conf_1.2.5.bb} (80%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
similarity index 80%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
index 32cf41c8fd..5de7185895 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
@@ -8,7 +8,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2c3b535c77dcb9aaf62a61f4f8324f1ab184162f105f7ec9ed1e37c742fcd340"
+SRC_URI[sha256sum] = "093ae3d85a5e6fd2cd1cc27feda400d7191382fb8b5e5e23497286c87c1507a5"
+# Something went wrong at upstream tarballing
+S = "${WORKDIR}/${BPN}-1.2.4.81.g4884e"
 
 inherit allarch
 
-- 
2.31.1

