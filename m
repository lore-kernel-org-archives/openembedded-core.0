Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web08.10513.1628177705128780732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RLtRi7Tb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id z6-20020a0568302906b02904f268d34f86so5225742otu.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=q6iXKrN4bExolIfQ1gTx4xoBk1HqgdeiIRovv+s4ao4=;
        b=RLtRi7TbEe7TWkJvLBsigWBmfedG6bp87BMLHnpFsctNN+ETWk8fdjnoWELBTvJ7d9
         x/f2vrr8MMh8fIRbhy/50+4aAdp4rJJ8v9rviGy7HzNlhvgOGcqp8TDBsK3/Ep4BWVAm
         9Q/FB3VhYIXJcc54alJYhrt84ZdHVZ1MmhbyGjdGGWqONYZC0boVs2v5HX1GpmATNtQa
         s9aRqD19An1Pk18K+WRvXoShlRAqAY1aALnQXTqkvLrnxf+ch0QljTcU7uawycuvRq90
         JJ1eVHPthq+4SNaZyHCXu8gK5prb2xf7ukf0UcH8PC6jamdbmQ/qY2VcqHbeZgpYEOyt
         GbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q6iXKrN4bExolIfQ1gTx4xoBk1HqgdeiIRovv+s4ao4=;
        b=BazoQJRdzAlZwqq/WG0c7hh05mR7QN8yJKxaGzARCUZdzMRcj1WY8qPZa9KYsWhMaw
         Oou1eNbEENz4w1sn+xd5W0qJELjsKqlUJuxxzXHBWv0XRFWlfOi0rCom5yCJ0R3xTp9Z
         BhfbsDP24Bjy4XIQSJWunJxZswdeHzTyKoHfBdhSfVR+e1gFgXUz3pOhzm9ihjhwVAu9
         re9SXoIewFh9zwsANwmcvY4303GW8CLIcdVZx+wDRaEhhd9FVTGEiWyTwEGjTzcfLSHG
         dx9whEjgO6wiP2MFVMsmPvdolYeOC+50xcoPPZDHJx6F4IURhITHLW8TB6TFJNwQCvGH
         QYXg==
X-Gm-Message-State: AOAM531hVlOzf0qnl7CZev5Q1nKtN7utA//i9MZCk1IAbVa3AYprF3eA
	9oTu6SxlRouH+wge9vzscQVx3Iq1mN7a3uWP
X-Google-Smtp-Source: ABdhPJwspTu2VYbuC132Cc3FmrmTC7HQSMe/RaslscUaAK0Az/eFmpL6oK29lQ7cfMSA4VHNfhEX2g==
X-Received: by 2002:a05:6830:440f:: with SMTP id q15mr4209023otv.349.1628177704090;
        Thu, 05 Aug 2021 08:35:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/33] Revert "gstreamer-plugins-base: ignore CVE-2021-3522 since it is fixed"
Date: Thu,  5 Aug 2021 05:33:39 -1000
Message-Id: <0e8f099a0f39236572c69f4f47f71e99a02eb90a.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change is correct but should be in gstreamer recipe not gstreamer-plugins-base

This reverts commit f32e90a7f8918aacda61ef6176eb1655742045b4.
---
 .../gstreamer/gstreamer1.0-plugins-base_1.16.3.bb             | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index 431468d459..bcfdef3bbd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -20,10 +20,6 @@ SRC_URI = " \
 SRC_URI[md5sum] = "e3ddb1bae9fb510b49a295f212f1e6e4"
 SRC_URI[sha256sum] = "9f02678b0bbbcc9eff107d3bd89d83ce92fec2154cd607c7c8bd34dc7fee491c"
 
-# CPE entries for gst-plugins-base are listed as gstreamer issues
-# so we need to ignore the false hit
-CVE_CHECK_WHITELIST += "CVE-2021-3522"
-
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
 DEPENDS += "iso-codes util-linux zlib"
-- 
2.25.1

