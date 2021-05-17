Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.19744.1621260915641829160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FeToGr3v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so3789597pjv.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9DVU+NO0cB+FyDluGq5nZkA3Z5tHLF8piO4ZCPGwC08=;
        b=FeToGr3vfOtGBVzStOpZlWexwCdWvfySPLGKDSM/7RrlAr7lCqRPTmRLfyM0we/hD1
         WmcZVyZFOt5YrrHQ5N25XEhq717CPqy/cOoO9uMgq3MQJ7mVYKmKrLnXUKVIobNJiUcK
         ZP4nOSSj7i2kor7JlZdvzjk2LJ2MDR+DIwUUay+wRpCdBU+QW/zvDvAVohpLY6N5LeHv
         yJU5dHXaZ3uRXS+QfLxGRm4xjfyPm5/qnkqD2AxwMwIGVWv722qZp4Qflsh6j0+FSlfK
         dH9VNaIk5FRpGaSF28iAYp+rzkRojkXuPe943XU37bQcwo0Wd0+K8QHtXy4Binyo0bDB
         kz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9DVU+NO0cB+FyDluGq5nZkA3Z5tHLF8piO4ZCPGwC08=;
        b=qtsK90hEtG6gDDkaPFDCElXevphX/C72PlWr74DsNC4aAfj+c+p21NhyWQRFKne8Yu
         Py2zXG00zJPzPj48rHvh53fLAzRPvhjYqdFiWibc1Aye6DCTuaguTA+vt027yRvxjGA9
         ImbHo3BcAT+DRpL6rmTsyA2fD6qvU3ihHUwZtBxzj4PokA7FvCIo4Eh29hX+Z6X8CxSr
         fGbxN40spCw3BIgxgWUe1rGkQfj/bvjm0dlNvQAHWc9GsXs5mKa96BZ+QTc97VFrRTt/
         fdMjw417jmyq5OdIEi+aT+1Ia21i8sHG2fReU53643Ij2gAyDb+9E7uYcqR8GxkL1cIJ
         Uh4A==
X-Gm-Message-State: AOAM533LV3uUL1DF/Vxiz++LAE+Yv7TOjVQWLfTFzX5VUE1Fu39TGkYi
	Axow/wXCerf4iX2fA7M4tbaW6THXRyD88hwrVSw=
X-Google-Smtp-Source: ABdhPJz4VUpF420b8l5dkboz1KuoAxVCKt/NNNeRPkj04f169zzvbVAcFvXIVWAAx6AsvWfE6me4VA==
X-Received: by 2002:a17:90a:f811:: with SMTP id ij17mr139296pjb.63.1621260914713;
        Mon, 17 May 2021 07:15:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.15.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:15:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/35] image.bbclass: fix comment "pacackages" -> "packages"
Date: Mon, 17 May 2021 04:13:40 -1000
Message-Id: <f0a53e39130d73eba774e97249e0fd472ca5b66d.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c5f0d21799c2bff6875ef9fdc22d11035ea3320)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 98513ddf08..1900eff412 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -38,7 +38,7 @@ IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs stateless-rootfs em
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
 
-# These pacackages will be installed as additional into debug rootfs
+# These packages will be installed as additional into debug rootfs
 IMAGE_INSTALL_DEBUGFS ?= ""
 
 # These packages will be removed from a read-only rootfs after all other
-- 
2.25.1

