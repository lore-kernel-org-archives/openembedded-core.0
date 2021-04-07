Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web09.7809.1617805146392607467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j5TzHK9K;
 spf=pass (domain: linaro.org, ip: 209.85.210.45, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f45.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso18261708otp.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Apr 2021 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kesCTiVzwPVaPkSEPMmjRtpUrIGT51HuAY6gGTaIGD4=;
        b=j5TzHK9KJu58SQJVdnFAQUX2LzydVNfrtBtblzehiIUHPc5ckD08bC9hz921Xj2mi0
         4aHn5z6gpEJERk3fTq0mpiuwsAxwIZB9GSDsfZAyu3kG86WBPBU883OPNTtmGGRRQAmg
         2CtCkQk0LFGkJ/pe9tBFYilFMnRXG6fvCjkGQJ78bDci6i63bKjh+jg+jtiWDAmicwLz
         BK/E7wdauNz7+UHSm82/FXf8JkrSR+SFS/lb3wLstsM9xPNE06FN27CwXPEUb4+oXSzl
         TKBioLyAmLlm2/SsyoBxiy8riUz43hONTk1xHRqb9RrBSb2ljRASecg79NLHZqRi7yv+
         Yc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kesCTiVzwPVaPkSEPMmjRtpUrIGT51HuAY6gGTaIGD4=;
        b=SxnKNdQjRN1ps6sUay//cnFYjJfCUvpweF+qYob16OlKhOcFCSqn7ju1Rsmbb7PMOt
         UAXzxXH+C507yyeI42RX9RlKGWJjCCBM4Xc7DYVhe6O37AO3TXMr5i+48efGiebiKrrq
         RXioY+KXhupNBBmkQn44FXM56jqOm7Ol9EbTmf43K9Mz6EoxHmwk8XBZzuXky4diOVY1
         Nh75CPU471XrbquLdzRBeuAOdmAqmVxIBR8Gx+ntPFlq3l1xBNgC8/DfYf7W8FjDGjKb
         Tl3I7xC3Cbmg+0A977UdUb375oYYrm2MYAskn2OslGWYFMbcmalYWS9vYhI63LMOthHr
         YMTg==
X-Gm-Message-State: AOAM533ZFfqBLkoybwQwH4Dz6eT66tztfSDz1o0AX0NgGHHN9mUQF1L3
	Y3Swh4c0R2sROZ/CVoqif0gQYH3IrbOpEw==
X-Google-Smtp-Source: ABdhPJxu/ZF8G08MHarCDmC7q5Y75S+m9Ja+0besG4rHWG0Ml04NxKufQ+MW9zvtqfq3bdwNv+BGFg==
X-Received: by 2002:a9d:63d4:: with SMTP id e20mr3156540otl.135.1617805145722;
        Wed, 07 Apr 2021 07:19:05 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.Home ([2806:10b7:2:5369:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id h20sm4664337oor.8.2021.04.07.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 07:19:05 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] build-appliance-image: Update to master head revision
Date: Wed,  7 Apr 2021 09:19:03 -0500
Message-Id: <20210407141903.12612-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 925235db60..1aeb952db2 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -24,7 +24,7 @@ IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
 
 inherit core-image setuptools3
 
-SRCREV ?= "c6483187f96c6d21b7129ad78de3ff976fbe5970"
+SRCREV ?= "42514ade8bdb9502f49a56752561f6c2e9f23348"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
2.31.0

