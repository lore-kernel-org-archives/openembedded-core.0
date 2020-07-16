Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.3261.1594933707294992902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V2B5Dxyi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id f2so8575446wrp.7
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uVc+u6BMeUw3iN7RpZEdx07rJwCB5wDulmZLAz5FuGo=;
        b=V2B5Dxyi4aomT9JCnN8ZZTdjU8t1jJT7j96DFwy5fmSqachTE+8K4Gd4K63ers0g2i
         hG51xbJd4b+eg5/rn58sSxka4E4hFCEu8Cf3wKnI7h1vfprfCP1G8PX9iWwLfWKrYsZB
         VPDqhgf2BAyuaxMd5hks57/iMlbbLGa7Mb/60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uVc+u6BMeUw3iN7RpZEdx07rJwCB5wDulmZLAz5FuGo=;
        b=P/q/7e8fk1u8LDxHMPGF6O0+bGIB9x9N24QnQ+z+JmlqqlJp0UPR+wmsf81O5U/h1q
         7fiZndHUXmWaEJsPQrzupvnUJPH8sZkWG5+q930KgckiiGb03lkpY5n9A3JW8gFMaksz
         NXHbNMuk/NHYE5nOmUnKnEAeBHPXieKjZKxbb7Q3CwIqffYEFIbS2MU+EHtJRGHZjFRb
         pM2CO0kGv3J/TyFKSlyoYZAAZ57inTwGaa0GVCYznZkLzTYr6Gdo9mziLa6GAmGbDqnI
         c6ih4Z7ExWfBYYYB7dvPH3FQOHxBPis5mVSq+e4TH8OpDEYoRjs++YN9tdx3lUBIa2Ng
         O8ow==
X-Gm-Message-State: AOAM530J3CZpBQ0GsyRCoEbNR1H5KTwPxy3j4KUcRD7iySvuNYZGZ0DH
	SlXpbAddWMvYf0qudpy/ypFjtc0mAjQdVw==
X-Google-Smtp-Source: ABdhPJwYLSofHSjemaJxNv4V85UN4MpThcLkk0z+g8BANqNC50Wwb6KxaGSaCg8q9VhIc5ULW5lddQ==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr6581079wro.312.1594933705535;
        Thu, 16 Jul 2020 14:08:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/20] ffmpeg: upgrade 4.3 -> 4.3.1
Date: Thu, 16 Jul 2020 22:08:02 +0100
Message-Id: <20200716210808.7438-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ffmpeg/{ffmpeg_4.3.bb => ffmpeg_4.3.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.3.bb => ffmpeg_4.3.1.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index b4cf278cb20..517dac7f051 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[sha256sum] = "1d0ad06484f44bcb97eba5e93c40bcb893890f9f64aeb43e46cd9bb4cbd6795d"
+SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.25.1

