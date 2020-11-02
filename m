Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.1217.1604335794634257740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AJPpVX1F;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id s25so5881610ejy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlnnU6PJlWPJPrqQxNOJ945HrxNLK29bnTcuHE8r2aY=;
        b=AJPpVX1FwaCwCACJ1lDtxhk6iwYWNRlyrIW01ZmiUchvvvKxgD2hfM02II3PWu+jvb
         Or2qmtlU4HUhuBVTaM1AK26vivk5m12EXXL4/Amr2lbavFKCR7WiuQjd6h7h5PHZx5Cg
         49j92g5hojPu003tlwFHss3JoOEcK0jra1gILq/uqvrgX7HqnWmOtrE1TfuATqVR97Pi
         TxX1CrQti31+6ZhuI6QNJckFwWYfpgTCZjZjGvJDYEmZbXlDP1ESrT8OBRDkctqnboJk
         RVFbihHJ1T3cenNUyNBnLU7ATTzHj+MzKQ/XP9z5kcXoCEFCR/Hx2+adSXlDHlt2P+ik
         vm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlnnU6PJlWPJPrqQxNOJ945HrxNLK29bnTcuHE8r2aY=;
        b=Ra86ComBw7w9gcqirerGlaXRi6moAKaENyZJv9w2gHpzx7EWaqrx18cS0zIZeY7lTg
         Df1u9s6L+10Sd1GEUrcmBdvzsVwp3YfgMu1xLEe5XaXaEiZM6/fdgDzInX48FOgqb5cv
         h899QjC+LxFlsEzoobzWpY1GeJDAkVP+DdMzDmmjcR7C1spy4pcWvP5IAC/OhDqTPzT2
         vZQwV2TCPpw098A6JVo543EL/Qvz5iyrQMLuOHoSlk8G6zGmASZ6OttY223K+j7LakUD
         WWGchfDPUX1jLPARnoarB/sxvsUAuobwA4q8C724meBmInpURO2fEtRP+/QXe+radj1v
         ZsaA==
X-Gm-Message-State: AOAM532ZUhV/SK60eceRgkoNv1mXxGPRMD/6DvZsbszA2P84RDZ/MJmt
	wPzFXGG4bcIjw86uVy2IQuyXojkRTvUuyA==
X-Google-Smtp-Source: ABdhPJysP/eVgp9l22BubPFRQ6u5S0ztp6p936yUwjE9/q21B0ccJ/Hf2owddKN5QOT9wxWH+0R0Tg==
X-Received: by 2002:a17:906:3795:: with SMTP id n21mr170502ejc.502.1604335792987;
        Mon, 02 Nov 2020 08:49:52 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:52 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 40/80] openssl: upgrade 1.1.1g -> 1.1.1h
Date: Mon,  2 Nov 2020 17:48:27 +0100
Message-Id: <20201102164907.27572-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssl/{openssl_1.1.1g.bb => openssl_1.1.1h.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1h.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
index 815955837b..eb11fe3960 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
+SRC_URI[sha256sum] = "5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.29.0

