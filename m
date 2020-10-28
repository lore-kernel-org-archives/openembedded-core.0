Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.3885.1603919175732527854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J6u/0GsV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id g25so133776edm.6
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vhpMH5PLsQsIFGcW0/Sw0B92L3veYcgkXdC64w9aDCA=;
        b=J6u/0GsV855vDJWpdXpJofq9Fsy/K5b5dDXhom1OyQ3olU4SOX1OtET9Nn4aQ6sZPl
         7A+z3ZVAbpWQiTiaOxfBtbDgY86VY2zjO5RqDWNqTUCFk2eruxcSpGOJ1hZ+t2/n17Mf
         5FAyvdhXhfcL8XSMI6W7vsx4SaM2KJdN6Mh4zTN3r9PuBvSDrfG3PjxDvWC41EZ28k/X
         XdWhEhQXruz3t8i2LubqyxxcqQHz0IuLPMFfoVQnMViRnxI8IB78Q8g3NLSHJlbrQRd8
         EUKHuYMumb1OWst4M+je30atrRfh0Ju7ziPy9fQXLxinnWkbz6XTNisHYRSZrosby5by
         nZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhpMH5PLsQsIFGcW0/Sw0B92L3veYcgkXdC64w9aDCA=;
        b=jv8eHPtlxvpAsiGaVEE7X23vZTOAUVS9PMIH9LjnREpVoUcohkrljMvbGTH1LKCvVv
         2OP+uC1JC+h6038m3jK2PHMpwZ547ougJH/SM69Pbhx/5mszqxkOfsIIr39XdtDHpG8M
         Hxp+A0GVqds1JJMp2Soy5dxK3KHOAHU2VLtYFluaMqQ9meFEyZQaJmFRbM3xEfxYELGs
         DkFKyPXX12n4ObTxloV4e80juJpRAPf5myC4jfJ2YRvWAs+QUAd3t4kFmyh4y1LMEYmG
         9V1mMkRMkM4mxtABR1RvLZVr71I3t2ND7UJTEMIe/Cy+EZkrMznlVSuYMBmQOPrtkdS5
         JiEw==
X-Gm-Message-State: AOAM532By3n2I1GzrRr172HQzM1mpWEjo9jOfPhw+ZPWP/emxTVJ8imB
	bfajCMWK5RVgnLRFQEAjVdrAlFVY++6mNQ==
X-Google-Smtp-Source: ABdhPJxrSZAGw4MN9JYLW9MoaZgXLiGTZARLlysDOadIYTb9ctZSdf4JsV+Cw0Dx1EhOj3HJ4qt/7Q==
X-Received: by 2002:a50:f0c4:: with SMTP id a4mr786526edm.289.1603919174099;
        Wed, 28 Oct 2020 14:06:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/33] gnu-config: update to latest revision
Date: Wed, 28 Oct 2020 22:05:34 +0100
Message-Id: <20201028210558.21070-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index ae03a99a61..980ed63415 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "0b5188819ba6091770064adf26360b204113317e"
-PV = "20200831+git${SRCPV}"
+SRCREV = "664b772118739dac69ef8c39abea7e02973ff316"
+PV = "20201018+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.29.0

