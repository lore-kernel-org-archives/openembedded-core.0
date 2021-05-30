Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.36989.1622412542779419952
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R9G1Bq87;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso8757193wmc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C1ckXdX7Qxy60x/FOKzV6BnM5w2gB3K9EFRCDc3Kl2Q=;
        b=R9G1Bq87jcQkHORQLbdRZnD2vZnU1ZCii0AjSvplrcHeae4y+1vSKoE1vc/NCqlmiG
         9mFy47ohqRF309n9Jf72NDa8iQtOm0TU1G/9ZOpB7Kw9ER8VOSr26svwgS4PowAmLdNt
         WwhPOF6N9Vt6Irw2KRBfSadW+2ADpyxA9U8PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C1ckXdX7Qxy60x/FOKzV6BnM5w2gB3K9EFRCDc3Kl2Q=;
        b=WSinYYWYOANi93Qz8FaCJxus2Nba/I2bI0mLx4AW5wf0wt/1mOiT/Cm2VPlZ95tzYV
         kz8bD1cp2U91puxHY4V8PKR+O61MVflGNwgjcL3EKtBrae+ELjIuevORg40RZ/TouuRj
         HajJsSwAeuus14kIjAIFSPEkgnkokQNCOVEFQRxC3frsFvEcVeUa8QjKsCgdKGNsw9Rh
         f3d0UjJyjxOf9LS6Wav9LwnHeNr4QT0zlhkBnmLfBJcg5xXi22tNaS4A9GIb/lw8QLE8
         9f/b2DQRZ/mx3dWY35El6VZHd2LfD+7Dh0cveGafxlxX00xVbkeV7rd13x1bh3IURmCH
         RDoA==
X-Gm-Message-State: AOAM533sQCy9Cx2FIY8oGd5KognrwPmWKIZYN4pNIw+jlDo2wTEs0Tf4
	618+3zqPMcYeBHaObowGzhN4BGPc0hy9jA==
X-Google-Smtp-Source: ABdhPJw3jFBCMX6+PcBluvk5vjiJAHfx2NNCKptEWHi43tLjzGfAJeSe7+KsdiEjCVdy5/9rCz8NTA==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr1679855wmf.168.1622412541285;
        Sun, 30 May 2021 15:09:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.09.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:09:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/16] kmod: upgrade 28 -> 29
Date: Sun, 30 May 2021 23:08:52 +0100
Message-Id: <20210530220856.2830501-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/kmod/kmod.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index ba5ec7f650a..e66684fda00 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc pkgconfig manpages
 
-SRCREV = "1ccfe994287119cc6cef37a7ca4c529d89de4b95"
+SRCREV = "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
 # Lookout for PV bump too when SRCREV is changed
-PV = "28"
+PV = "29"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
-- 
2.30.2

