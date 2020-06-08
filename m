Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.25156.1591602498778266716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mfKTYde2;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id e2so17114146eje.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bg44gbIm73C76Y3ep/Hk8h+I2hzF4oagAHdjoOORvb4=;
        b=mfKTYde2FwcBU3916l9Shd2nbS97UODw47dKR+I9gFTsziBoklLLPPUm5p6bp0K9St
         0uA9LzoU4/lFjouVZzKRsUMG5giTUpySZ6XUpMsqwA6sa4QCFBC+I4gghs3SAFDiI6kw
         IOHGU+WVdCmAzA/IBrcZ7x42yzbZkD+WlQGpWvWr5xiYHcQG3GKWykp0Fs7NofUHPYMG
         0ygK/q81Vz+Q+m/agwp/FTFmrvXTb0iTrd/Nx7agxrtCliyPxr+OdZYAfgvb9mvL5ZzM
         +Z36Me6uRioSlvV3VTGY/08aJidBxPo0rcKXF1qQ1vkEun1TffuCxlFJMmuqjaJiIKiz
         eTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bg44gbIm73C76Y3ep/Hk8h+I2hzF4oagAHdjoOORvb4=;
        b=iyCJB1S53Brm9Nyw0xqZkpnl1Ry0PRdpafLBTxDnK6DxSq8go9YgQLUp5hOAHQ3AxJ
         3dJBIP+S92/CbJhpoYm3hM+tgpwcEMGpoRKxZ04gLHMIXs9tcU1z9sDaO5cj1UwMZj5g
         9Jz3vnyr3zXjGnIhj7kOQ1jL4EPMieXJDm1EiTr2Rnk2jMjjMsspRcG2vVWntE9jrcRe
         Koh93+V3t8z6w0qOtlGv2He+jqzCGswcWGxJEgu2VBVHbgBMezoSGIgtmOaElUMsIr1/
         8tIwMK1qJ/FgXPIMBku0mayh2DgWxFRoHTw70Hx8L6xvOgSA42rL7sNrEAjf/qfWLkhf
         ZjDw==
X-Gm-Message-State: AOAM532BdeUW3crO7K1jKWdtMQM9Nt0tArqmX5AnUsnRV5SCsyvKdwm4
	Ny01tE6Duc9n9307lQm9kV3KBlqx2aU=
X-Google-Smtp-Source: ABdhPJye3IX9M5D8or0xLuo3yivt2FQiesQVSJukZAsCB4PwmlSJjReD+xh89HaWiV5JzGDdQLe9Iw==
X-Received: by 2002:a17:906:d973:: with SMTP id rp19mr12176261ejb.475.1591602497150;
        Mon, 08 Jun 2020 00:48:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/42] pkgconf: upgrade 1.6.3 -> 1.7.3
Date: Mon,  8 Jun 2020 09:46:22 +0200
Message-Id: <20200608074659.7051-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pkgconf/{pkgconf_1.6.3.bb => pkgconf_1.7.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.6.3.bb => pkgconf_1.7.3.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb
index 732ca2a034..12496c3849 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb
@@ -20,8 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "f93fb1be95a5cb62e43c219c82b5791a"
-SRC_URI[sha256sum] = "61f0b31b0d5ea0e862b454a80c170f57bad47879c0c42bd8de89200ff62ea210"
+SRC_URI[sha256sum] = "b846aea51cf696c3392a0ae58bef93e2e72f8e7073ca6ad1ed8b01c85871f9c0"
 
 inherit autotools
 
-- 
2.26.2

