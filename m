Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.1704.1599498169597785251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Aeimxd+w;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id mm21so6972879pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fmCI4JtBz945GoIp1ZOcJcjUoYyJ1WuZF0y5R75hbC0=;
        b=Aeimxd+wLbJwlZ1da5J7Yhp/E235zg2AzZ12elVOmzeRK5kLZtv3jeHygDmPAYs4Ho
         dIJ6c/w/p8qZZDvlyugzXVGAyOBNjFqFFXi/rtqs6V+XOkWP8TYuHVuAXN4m3fQayp85
         XpC1B/4iGWLg0cjLXdeo7nnnBz9fUU50NfgJOlPPih7CXWmX3H/fqxoDTMJnWqaxqKmR
         1CKXPhYpbmMoDPB4ciFXw2ZR+HMIDWW19tpCtdpO5HkV+KFn54mO9gPGeDMuckg8xGNH
         khIPV11eD0o36RyLJT1xXWPDGGal8Pr8GGjN0HhKKy0XyH0BAh21AnOI+3A1u3ijMn6n
         9MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmCI4JtBz945GoIp1ZOcJcjUoYyJ1WuZF0y5R75hbC0=;
        b=gw5xDynJPBjuM3G62/t/rUS70KhZFsmyAxqksNFfOGKKZd6L6DL3SP3C9w2T/LejAI
         GxQp4JzMTi3Ydxpgm0CLjE1FC/il3X+b+FmeOtUnbwIUHTs2OfBzRuAiiKS8pECRItwv
         razK1oLqEKFgHKLYBnPm2Ugc8qUOgAxvlE+ggdBuY16A1cP/u2zrL0/uS3QIsEGh/fPr
         zDU6BUGGIyzmbF3CYdzCjaVUwYlIzDDiFbNbGrG8nfWEKG97VPkz3OSHpEXVyCoLPaVv
         ObWtsqKBMT4IoEEBrjoucvby9OvqbzEBvx06mFPFOwLjuybPu8CTCgZ8Usk5dbo95GFv
         MdXw==
X-Gm-Message-State: AOAM531B9/RYb8XvuGzVwY3LHWGsTcx0ImVWL+CeqdUT4ACTjABhozMv
	vlN85EvYzc6Ig6gLjt6bEiEjkee2ZwPu9+DX
X-Google-Smtp-Source: ABdhPJyvAvy/7xMe6CCApwJgb6pOTBhHklPXmPLYZT6qJNUhhNkn+6Fs8Z0snFDiVwHmRWGBLIyptg==
X-Received: by 2002:a17:90a:fcc:: with SMTP id 70mr204424pjz.220.1599498168638;
        Mon, 07 Sep 2020 10:02:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/18] recipes-kernel: linux-firmware add qcom-venus-{5.2,5.4} packages
Date: Mon,  7 Sep 2020 07:02:08 -1000
Message-Id: <ecfc52630fb28ca2288c3319aea6a017d5878cc7.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anibal Limon <anibal.limon@linaro.org>

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e20c1e07a807f66f028104d8491d974a36734192)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20200817.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 22e71059d8..ffeb8e6926 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -291,7 +291,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
-             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
+             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-whence-license \
@@ -860,6 +860,8 @@ LICENSE_${PN}-qcom-license = "Firmware-qcom"
 FILES_${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
+FILES_${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
+FILES_${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
@@ -868,6 +870,8 @@ FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/c
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
-- 
2.17.1

