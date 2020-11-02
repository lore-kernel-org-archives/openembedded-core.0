Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.1211.1604335782261200837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RymaAmGs;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id k3so19758596ejj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TMiUVI8fL0q8KLp5dIA2+7+/1jJeRhrWcXZ4e4wvljM=;
        b=RymaAmGsh04GaCy2XRrj9Fow8EwC+kPfX74gLvyABJLsNBUYen6KPHuKHjzjmV89es
         7HdnIKK4iY9nwayRUDZ87Wf1cnmb5NK2UlmnDCXSgijVBxP9QsJeUud1ulyMSRBp/RUf
         x1bp51kz4unRLrtWvpD5CXopm+tM5EdrOZZ4QUIQRgjN4YoolccJ2sYbO+uo8waN8gjI
         fFze/NtZhZgdHxxN1wQiindlV8b0JATIUwUL4Yf9Y1e3FXqvLd0kgPvjKwgC4ZOzxkKr
         ethbRU+VVRtcNTP8xMM7kLDGe/TfVoSrXebYQJvqtMAYpW2S+sc75ikmjsv1tN0l153W
         /Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TMiUVI8fL0q8KLp5dIA2+7+/1jJeRhrWcXZ4e4wvljM=;
        b=E19QgvUl349OVLCkXlwXLMBUOvhc2jqSJJvpZhapCwiDzTqo6qIskeAK28hCt/wE2+
         Y8X6rYdPdbYmWUcccJekWlzqF4niJUqeK4/Z3LGVOj58SrcrjHFg/ATRXHarFpwfjg/y
         36IWrKuAWMDsuty6cRurpSDcj7JyqmueREzGBmZj64wQxXQK2OXh6y453apH3Pt8ArXI
         acSBr7ttznsPGj14mLC3OoAS2Cp4dgarbYOPwju/7V5dEyVNDV2r8mZpZDaKIvTR+K6X
         kjFuUq4aUuhVzTfZSsl3/tu4yJKRUejZ6Mk4lqiPKiC/+iAOek3O7QEBlVt2sY7IBX1q
         B41A==
X-Gm-Message-State: AOAM5308Xo2aSVuyt4/N9TjeMtxsb1o7pb3hPBFU7+RNxacKI7TGY0OW
	VrYT3QtaFvBeEHQiHErtgdGB9mnRVKX1/Q==
X-Google-Smtp-Source: ABdhPJy4rzoJbB5O+GtoIa2YHN5k2y13URBn1A8Xyw4K0jruFy8hkSAfYDerLolU86nceaiagR1K2A==
X-Received: by 2002:a17:906:241b:: with SMTP id z27mr15156981eja.418.1604335780658;
        Mon, 02 Nov 2020 08:49:40 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:40 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/80] help2man: upgrade 1.47.15 -> 1.47.16
Date: Mon,  2 Nov 2020 17:48:13 +0100
Message-Id: <20201102164907.27572-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../help2man/{help2man_1.47.15.bb => help2man_1.47.16.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.47.15.bb => help2man_1.47.16.bb} (86%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.47.15.bb b/meta/recipes-devtools/help2man/help2man_1.47.16.bb
similarity index 86%
rename from meta/recipes-devtools/help2man/help2man_1.47.15.bb
rename to meta/recipes-devtools/help2man/help2man_1.47.16.bb
index 6ab9f6cbe7..27a15eb0e2 100644
--- a/meta/recipes-devtools/help2man/help2man_1.47.15.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.47.16.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c25a35b30eceb315361484b0ff1f81c924e8ee5c8881576f1ee762f001dbcd1c"
+SRC_URI[sha256sum] = "3ef8580c5b86e32ca092ce8de43df204f5e6f714b0cd32bc6237e6cd0f34a8f4"
 
 inherit autotools
 
-- 
2.29.0

