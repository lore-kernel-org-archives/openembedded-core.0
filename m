Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.501.1606848754249275130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1JTu3b9h;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id s63so1720183pgc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=al5Dm/nFRSqUKZlW0yQUP9udf1PA56GyzSoXoIL8irg=;
        b=1JTu3b9hJcUwVF7+w9grQCehlhWazM0OaDp+OGSXj8662zYSRhePEb07eztiqhdbeD
         ixvAtgjWM4PoO6Ga1IlNEZbisI0SLItk4zqkbdA/UWyotFypRqHFMx31rZ/niu9XozGg
         Llbpg/ISGWTACOSW//oUNH833LQ1Ipjph1foJ1cRrG9JqD7yiQSnSB/JPtYMZ5e+sJjo
         AvYpTu2fbtP6jdgVgt82E/zNEHjRBwrjsHZouWZ/lbZ39YXVsBvkS74e1fR0p39Q/M/T
         8Mr9TIqC0UU7JkR+87YIE5+VSDX+1IMdfoDiZn0ElKGsJoyHX0R+sa8eTfIWtBAe1uaP
         PfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=al5Dm/nFRSqUKZlW0yQUP9udf1PA56GyzSoXoIL8irg=;
        b=kbSoqyd0kS2YS6421cs33BCpgpS3291OHKyvKgdLLoqhmr4kOOdZvX7+8E480XSbQ0
         lKUfcMELZfH4VGdAvVPNMaUeBgPd9HzCPzoXfZzVbV10VyZ6phpBdukr6h8txq/Af8jD
         +FR8CCv560ZSKasekG/9qUtclGAqfO6uHr9q1XDKh8NTkRbpvOI/qBkvouaYpbfoxMwa
         Fj9SPJ9gbTHOYysM45zrRDGMq5/pE0fr4P2liEwn7iUaBo3K+WgS98i2szVtHe1KH7Or
         5ubI+XT9g6KfGJpJ8hrS+1Gv71eKtcipPoI9H9QE4mRUN/BRjEh1o2K8arNF0yjJmY9H
         iGBw==
X-Gm-Message-State: AOAM531KDDwjQaHjXQz3XkmhdOzsKVLCXPSj4yXHVBgukzNMR1Z2BsNz
	zOAb4+5t4X61GxwQMhuEwarPZIflEBVu2T0J
X-Google-Smtp-Source: ABdhPJzU4gf+7oCwcmEJeAUBaJmMT0Wc90hqLcWzPfvC6Lbo3ctPkWhJiug+mAoLwDvmKCy02ePiXQ==
X-Received: by 2002:a65:414d:: with SMTP id x13mr3477974pgp.226.1606848753305;
        Tue, 01 Dec 2020 10:52:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/16] linux-firmware: rdepend on license for all nvidia packages
Date: Tue,  1 Dec 2020 08:51:48 -1000
Message-Id: <8edd935405d6fb3b1822bbbbea41fae892629cb5.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Max Krummenacher <max.oss.09@gmail.com>

Fixes commit 0671d04978 ("linux-firmware: package nvidia firmware")

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59789dea33629a96f0fe5646eb684aa131e167bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
index 045f2647e0..93b9d5308a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
@@ -501,6 +501,7 @@ FILES_${PN}-nvidia-license = "${nonarch_base_libdir}/firmware/LICENCE.nvidia"
 
 RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
+RDEPENDS_${PN}-nvidia-tegra-k1 += "${PN}-nvidia-license"
 
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
-- 
2.17.1

