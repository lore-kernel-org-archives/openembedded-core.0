Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.40858.1590446254277607746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fq68ezpw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id z64so4761214pfb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kZq0tN/8afvY6zb6FaL7Wdy3hggCLv+TMnEBqysTicc=;
        b=fq68ezpwhCiBi9zwQXiI2nGO+i+5CIod2ikKCWGdqSqcxhl1yeK6m1Gvuee+q8BEwx
         aXbvG/4qKp02amdRCOn7TjQhe8xebtvQgZ2Raiy+cOaE/udIOfDsG63Wp54opLc/t1ut
         8rfzNbgFbCKSQm1suQzQpv3NXtD0CEhkQ3815eEr9t4u+gMcuUnM+vZigHMX2c3C+iZn
         vR48VMwn7lZ0/MnbGcpYRQJWjB/UAchUYONrv4mBSMCbiJkNa5sPd+VTVkYCN7GcXkVV
         /pyZ4YhhQzHwBaYsJDhxNDehFf77iR0iOZzfb4tIG4ikoaI/vpIeJfAJ1ozH5WEFexma
         vTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZq0tN/8afvY6zb6FaL7Wdy3hggCLv+TMnEBqysTicc=;
        b=ucXioPzpaJMSfYWDtwB3rMxAJJFRbu9YOEKMypJygeSuroDmaF5XUt8HX3VwDan52p
         q1xTeb8eqYv5awlnzkHuXnDGL28Wtcp/E6h3ywEM4mKyFQgmLWdgtjBnn9YZyj6NzY0L
         kvjnP5N3cl5uKv2QV0danmdfEeF6CoGOGYbZY7keTD6+4QdPoxEpN7nSyNDkFNU7N+DB
         Xhlh0SRq5DCVnAtZ4L4i/MgwOvku8nsSSqaxTAYbzscL8sv3yOAV6E01+gB8otKDaxT1
         6gXKumqRZD/IgtGGPGEaUmGVch+mDMbmKaz0B3rEeIhUsdFezGDaGmbLh/mhBM+oVNqd
         nwGQ==
X-Gm-Message-State: AOAM530Xfho4lw5vJK0kDKrxBUX3VySepsjEUtINWwqmCkUOjjqZQzdp
	jAIvWm8BgpcDZMJgB2OQm+G/EJZ5m5g=
X-Google-Smtp-Source: ABdhPJyb5nvis8YG79TyZ3S1R2It3WW93FHrgV5puXU44YvSudv4wDMXQ4XG0aWre+Op27eV2iPhCg==
X-Received: by 2002:a63:1149:: with SMTP id 9mr29107277pgr.236.1590446253382;
        Mon, 25 May 2020 15:37:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/17] recipes-kernel/linux-firmware: Add adreno-a630 firmware package
Date: Mon, 25 May 2020 12:36:52 -1000
Message-Id: <0e62fe015b457c18de158ba22641759a093daf45.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit f3021d19eff3c9705cd91e407c042a1aa3b8e7d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 139307cda3..ac7d6ec431 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -288,7 +288,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
-             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-whence-license \
              ${PN}-license \
@@ -849,6 +849,7 @@ FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -856,6 +857,7 @@ RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
-- 
2.17.1

