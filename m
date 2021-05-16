Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.11435.1621204374831717436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aMW27qtj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id r12so4483513wrp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NB0jKVpQZ1ATnlYww04an+El9LaAdHdwqemQdIgolfM=;
        b=aMW27qtjIS35uUCtH/yOLxi45qH4OCeUcHL1tWcvc/IILBmqADxdRIB89w5FAkUvW7
         8+Jrmgrj7DRaWNkb+69zzTgUEgfHx1A/0roIHEv34MANNVE1ZXP7q7TOG2J4R05Rm+Ov
         GObgF2aFKXlppkxG33Ctz201D0nm5a9fQZt/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NB0jKVpQZ1ATnlYww04an+El9LaAdHdwqemQdIgolfM=;
        b=TxUd+iD7ThpkROSKyveIEfgGUawDcQuISo6yYrxlqtI+mFEGM78CED8+Hvnh6Lp2hd
         WYvOzTaRdhqzwWjcq6qV2mYU2wbc6Wi/B1AhVY8HiL6PrH89Xr4XK7brptX+IcPFK0bx
         XSuTYWnrECeNIT+wwjt3FTvMCHDd0QyhZajvOwanjkAZQpY3DjsR7gff4leX5BGK0lcS
         VOy1rObeifRlWM2q8n6CtJHWzHlmTnFX5GS9hZ0Y7rKSCRD0MDLQplXCmoofFynTlJI0
         w/29f8HT0u1ai1wiSdTTk54mKUqSxv1rm9yXo2zTsb99+Jfe0gmtY4qyv1siRkkF68Ud
         ZXDw==
X-Gm-Message-State: AOAM530pp/bEyoqCcTrK7GUFcLNSviIl3yQ3Ylc/VtWZkWLtSkwdT+Pi
	AeMDto3KX/IITlhOrZHr8qznYNfYymCzfg==
X-Google-Smtp-Source: ABdhPJwN44KtOLqMDsabmXXRh/N0gAGOs/wbbTG5w9YQCUkTEt+GZqQUnNzC1ZVeTSbzsA2UODv4jw==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr11945349wra.274.1621204373304;
        Sun, 16 May 2021 15:32:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/27] libjpeg-turbo: upgrade 2.0.6 -> 2.1.0
Date: Sun, 16 May 2021 23:32:27 +0100
Message-Id: <20210516223247.2401235-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License changes were from a new author entry and changes to copyrght
years, no license change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libjpeg-turbo_2.0.6.bb => libjpeg-turbo_2.1.0.bb}   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.6.bb => libjpeg-turbo_2.1.0.bb} (89%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
similarity index 89%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
index 0bd6af8db95..7f91cc02aca 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b \
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8a61af33cc1c681cd5cc297150bbb5bd \
                     file://jpeglib.h;endline=16;md5=52b5eaade8d5b6a452a7693dfe52c084 \
-                    file://djpeg.c;endline=11;md5=302e980133b5c0c7f4dcb4ca0df41090 \
-"
+                    file://djpeg.c;endline=11;md5=b61f01ad6aff437b34d1f9e8004280a4 \
+                    "
 DEPENDS_append_x86-64_class-target = " nasm-native"
 DEPENDS_append_x86_class-target = " nasm-native"
 
@@ -14,8 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[md5sum] = "4cada3f0bdc93d826fa31bf9e4469ef6"
-SRC_URI[sha256sum] = "d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb"
+SRC_URI[sha256sum] = "bef89803e506f27715c5627b1e3219c95b80fc31465d4452de2a909d382e4444"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.30.2

