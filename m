Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.27303.1603635849463627984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hoNGP/gh;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id n6so9576448wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w9bxmzwP7OU/v47c+qN3RhHCJUYP+lumftnnzTRw5Mw=;
        b=hoNGP/ghyLcjXAr0d02x9JIxY27K60dGQ1OGnUKoTdptsXSdtI5UBTa35Dq4ZzObKJ
         hQdCPsOyLUmBioNfBtOcD02mlI1s8zv/66dNMxrooUAUCZtYbRWoZTyVP8NbzThM4jYa
         cw1g652O1Zj2y4JjYjmg85mq14NJuneXI1THUJf/cXlyAEIkYc8dVZe8HGoXChIvSQEP
         0ykEApbaC4V9NzWDyFka6p9VavNdoX5pOa1/Ga1ao2AxlI/hTi/h/pSDfsQFhLUTsePZ
         nuZUmJ6yVEi35L3c9HQk770aeeXQuE6SNNvi/Wn7N/hClpj0yPQ+GzxmWlmpIy9p+7Vn
         Y0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w9bxmzwP7OU/v47c+qN3RhHCJUYP+lumftnnzTRw5Mw=;
        b=YGRc89335i3HmhsHMI398gHOhzzBfL20aCvbNPuTKgXz9FMSnAgps2clmJvenXmdK3
         EnnRq49gvhDDcmabRDBebeeJRMXKcEmu786aSWBXIdPumdq3kTmKZKuC2bpUc2jnsBy9
         D1ZcJmuKa/zSf1Icw4x0wHpqh0pjprQo2tpwllfe0TLPhyr/r5Cne5TkhpeVHseuV79p
         kwHZ1ozUGezYf6DX4Vxw4fb9Hl/rC+3SIxPaouY/6vs6rEESNOsu6oRpA//kbPE8zAOP
         bY9d8v8Ava2i3ecO23HdmA2zsbWlpMUZqbpCgCBYtBO/FPmsJMtX6RiVU7NZK1eQsYCz
         2YSQ==
X-Gm-Message-State: AOAM531Kiy5evzFRo8HQgRl/pKw/V6b9qFDOLoEV/mqa8d9Eg2Y+3bDr
	sMTburXX0LHDF6zRoeH/gUEXXXv1/9eFog==
X-Google-Smtp-Source: ABdhPJzXO5fA0+ELQLqmOWB/jsqOTt62BJ8i481trwJ0v0LCIm6sSKDXs8dRLIdgcgvpQ4D6Vy/0nw==
X-Received: by 2002:adf:e881:: with SMTP id d1mr13035697wrm.395.1603635847793;
        Sun, 25 Oct 2020 07:24:07 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:24:07 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 12/12] gst-validate: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:53 +0000
Message-Id: <20201025142353.1929717-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
index 35492fe861..ef42abbdd7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "688f42c52d62e8c5e506df911553fb2c"
-SRC_URI[sha256sum] = "4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca"
+SRC_URI[md5sum] = "740a436f5b9bf17ea7de0e62c92ec264"
+SRC_URI[sha256sum] = "c2064e887324af6aa476ca669234936711f253b29042f617f1d9f2597c4bf92b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.29.0

