Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.8991.1618733799884498203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 01:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l88mET0Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id g16so7875802pfq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PQy+lc+FoUuzhLxTXFH/XLMeSZbzT0cheoPtyi8ZoG0=;
        b=l88mET0QOG1vp7nR6zp1j1ryY8cQfrrIY2SJxYoShIVAt5pVIEVhaaq4rNZ0/mDasW
         sP3eP0i+QtW7ZC+AlymzRQp6Y/fr7SVCaj0ijJLopcgYCXj3Z6IlIVEi/lkREmB+dAR7
         4QotOwQ0Vfm7qx/nZgclzdvft3q3pSKDXqY+e2d//60ZSUSLDwoEbbC0QBQ0Dn1Cydy2
         GWS8xjCs2LqsgzLRZSOu0u68xRR29qMu44u5tR1/w7LJyZ9QJGxbl2jOB60jiBf1+J1+
         zkG+xciBV51GhH5DkO1pXzgHNK9cODBDS1KEefz3/U4xcXmMi/5vluYrq5vP5wrF0q3D
         HnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PQy+lc+FoUuzhLxTXFH/XLMeSZbzT0cheoPtyi8ZoG0=;
        b=Tvvfen+A1jF4mBmhAMUv7roiqraR0BOgcf6QkcZ/UBFO4Yw7XoD5V1OvCkrnoo5I1x
         T+bSNOCGTgTEAbza8LeUwrtxdBS1mX8mbgDH0iC2LzRAaKisirD2yzzohGXFa/z8nLmX
         CdEtkpuVQiOV3ca4Q5MNwUmfSd9qWG8qUn7K68biFWehsGrTXgrtOpvlq7xQyQd+fh99
         L7sHXJ0mYeQSdbUrrdXPkApsBhc02SaSwQiodsndHTFN1yoXQso4N6cn/DoGaEbVzgtx
         cfgbgy1dydwY91sbgjFkEC+bHjk1lPdQFVSaSX0nWZ77M1qAISBxJwWJBreC12z4Lx7G
         XqJw==
X-Gm-Message-State: AOAM532OBP1wiYoe0ATg54/cnEfUypVPkAt90LS1KRSeyhRBmuhInsI9
	LHk3hKfG5aELs8RFV/sKa2cDGiBRSEarXw==
X-Google-Smtp-Source: ABdhPJyUiDFjetTuT13lUCK1Gjus30eIuzaZzHi7xx7+/hgX6Y/7387tx8Rs3N7EIrQxSAyBUEaf3A==
X-Received: by 2002:a63:338e:: with SMTP id z136mr6544952pgz.115.1618733799006;
        Sun, 18 Apr 2021 01:16:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id g2sm2339211pju.18.2021.04.18.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 01:16:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/6] wpa-supplicant: Enable openssl
Date: Sun, 18 Apr 2021 01:16:31 -0700
Message-Id: <20210418081634.3169548-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418081634.3169548-1-raj.khem@gmail.com>
References: <20210418081634.3169548-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use openSSL for TLS/SSL implementation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index cddcfb6811..16c5918522 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=279b4f5abb9c153c285221855ddb78cc \
 DEPENDS = "dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
-PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
 PACKAGECONFIG[openssl] = ",,openssl"
 
-- 
2.31.1

