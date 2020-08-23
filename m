Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.181965.1598214091265895848
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tAB4lHvq;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id d11so9078985ejt.13
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31nJlxCl6oNwVFqdcX81GsIsPlvjhT+/98dMpGimyEU=;
        b=tAB4lHvqJAtdphHs6Rk5EXx1NT8ZmqBL5NFX7A+T7UqZ6HaJ0nu//5B862e0NxWHBE
         vIL56mNArZIxrVNr9woW3qoi3u35WPyjOxFBjva8CPuVzseCmQ6O+9sSiIBiM7baovbt
         bd+h9U8BLl/tYiO/YzSR5MvHAm9IfLpPQUICYGLqDcpmAiS3IKL29Qg6EuGuUAMQKMfK
         UrllWd8H/rP3BzSNyYsfxGT77NfFIytOG5Qr+9XgLP4lIpUUg4jL/at2az3gGu+SHZ9v
         gVf7e2IQm8fC+mK7ZeaDZ4AdMRiEX1NanPcqK1FnV69Ac3dh6L/byIx5hHGgaiuwx7/r
         GlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31nJlxCl6oNwVFqdcX81GsIsPlvjhT+/98dMpGimyEU=;
        b=VUprHA/5Y2B2T7CcAtu4hLg3ZwV+dC8YWN7H4tzJOYf1rEV5TwfEBrzw3fkn+L583S
         jstI3uFljRWfpfCsFHO7/W+3MDyT7ZRgerjLyuO4MrM0BpSwbhHddLFESB58sbjfceeB
         3H0yuUtTNKtVH8oGbrYC2pc8IznCR0XLFU9oqfc9vvLa/xXmsabnchdWhYWP9zZs986x
         RCK9/8nYe1s4HnxQz5IkAV+2suWCkILAwsf5KFocnr+Yna8s84BKs9WoIKI96d+L/clF
         Ut9eFGvrG/teamoqgIAQl4vnlTirDM2vfFW3SbM2NQHnu7dTWEc2OsvLNCVZ3tFmQsWI
         unwA==
X-Gm-Message-State: AOAM5310DAF6F/ul+yIVNVelxBQ0lGoXMTjdaFAiN5xqHtxtdROqpbe7
	FFsO6/kcqlPRq9ncyPJybcS+kb6KOoM=
X-Google-Smtp-Source: ABdhPJywz2er9jvE0dB7AAUArR7wP1um7CvowyLn29iTVTBZgYpYTn9FzPBWtNIn4nkH+XKTI3LKKw==
X-Received: by 2002:a17:906:6055:: with SMTP id p21mr2768473ejj.173.1598214089550;
        Sun, 23 Aug 2020 13:21:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/37] bootchart2: update 0.14.8 -> 0.14.9
Date: Sun, 23 Aug 2020 22:20:20 +0200
Message-Id: <20200823202031.24686-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../bootchart2/{bootchart2_0.14.8.bb => bootchart2_0.14.9.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/bootchart2/{bootchart2_0.14.8.bb => bootchart2_0.14.9.bb} (99%)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
rename to meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index a938b2da49..6571c19938 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -97,8 +97,7 @@ SRC_URI = "git://github.com/xrmx/bootchart.git \
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "331ada031f1d65f6d934d918f896e1c708c64bf7"
-PV .= "+git${SRCPV}"
+SRCREV = "868a2afab9da34f32c007d773b77253c93104636"
 
 inherit systemd update-rc.d python3native update-alternatives
 
-- 
2.28.0

