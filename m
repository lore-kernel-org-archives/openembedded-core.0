Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.31870.1613399915189361353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x5AJ6cAm;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id g84so7968071oib.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X2j8oq6Pp8J1Qnjxsx0FyrOFRKhcMl4gxbyd6RjWKAw=;
        b=x5AJ6cAmtRJxYnKVLbi/Ry4RvbCgSgY27HC2CX593S/aflITa8Jqhfpcv5NZ70spOz
         UgwCIywnAmwtXj2z0WzTPF5a98CSWJW/RrDR6aP4DMBKEvZdbPkiLKbZAoOmu7KQGj5E
         a88m5XN3eO1knFfFSmGUKbxOv9TnuYyLHIotWnU08+pp8EhrmqJDEQbtMT+1I2xDo/jT
         hCfZiYqVe30yv94EQU8vL/xmQgp20N5EaVsKGWur1sLu63K6KpepcJ7h+4vdnBsbl/RO
         Lk4kmuugOkA6wCsHrYldJ3JSIUx4YFlNwQxm3mlkWhjqTDx02XPZgoxStSFFyhTncc1W
         EJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X2j8oq6Pp8J1Qnjxsx0FyrOFRKhcMl4gxbyd6RjWKAw=;
        b=Tvh12eZhS0fSU61HMWUxpifTmCK7sPmqGVLCVhtKhAWBpYKe6iPRBukzG+s3IsHIiz
         eOK22lFWvCvE23z24igtWOETYAqFpzA0lUdI67ICPdkaPAI73WHsnroGgiTAczFvBJVA
         k36bQLNP3SgPjsuDvpv0e0idtai9CFMq2oWceYhLQSChsMBnLqT6Ao4Gho056nTRG0P/
         D3//yHZ1CwYgXVCZsPyzYpwhj++YCr3VN2PWjDzMHqvilptlQ6UFqKUVFsNoFw/sHMZg
         7uWAFYrmmdPe4c9diTxBYObD4dELpr5TmUjUSOGYSk16LGQTzp/HoTIsbSEWe8K/0kpQ
         DlQA==
X-Gm-Message-State: AOAM5332CA4ob+vEqvntuRQ6HkwiZxUAbJH/KX0s29ZSq5Qozcv+NfBR
	nPOjj/HIVXlamc0XcV4VSrDzJVmdKI3QISD8
X-Google-Smtp-Source: ABdhPJwusoy0x5R9+BHVbDTtjjKq4E0WwILV7RwgMzrzPupHagleI8nUnsLTyNPDj7j9WZLer6tS0A==
X-Received: by 2002:aca:5008:: with SMTP id e8mr8901798oib.13.1613399914186;
        Mon, 15 Feb 2021 06:38:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/17] p11-kit: upgrade 0.23.20 -> 0.23.21
Date: Mon, 15 Feb 2021 04:37:20 -1000
Message-Id: <f28b3af0c7011f9c9e4d463b5d4cc6552321a9af.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e811db2f614500f16415fc09801f229968428e7)
[0.23.x is an lts release, bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.21.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.21.bb} (94%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
similarity index 94%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
index 4ba93f998a..b1fd2334b2 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
@@ -9,7 +9,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "762cdaa2cd5c5ec09cc844f9a6bdc551c7f6c8ed"
+SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.25.1

