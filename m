Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6522CC43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:37:09 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.4024.1657773423515922757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=U8DPfUyS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id h132so481622pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eKLPz9p8IufudTBWRZ1dWFetH7Wjge+1/7pr05qn5Uc=;
        b=U8DPfUySS8oftyUtstpDn2lGVA1REaEkL8Asc6dYq7AsoWN1FDsYtbpPDjvQMvQyTT
         0eVVUnIg698LqGIgMrPuXz9ZRucZR7vJIv1AGXiYL9TdNX0VLCLUaM2SAdNqfP7pZDJa
         YaP/94Ucn05wX5ClVuC8kvWfiLIXOFp5FUSCobOthTfjt3+JnxaAfmSYdlnKViM6xLKO
         5Vlu9fVM2eRfnsXH5xau02QrhhFnRKIVQCKPaoCQ+f4bqLZnX74rAs6XRzz2c6sow6eW
         0YPMmhCOsGiasAHLMRtrld8aufXMrZ357JgiucU7iLinF63qgc5UaA+hs0DPp4ajGM06
         fKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eKLPz9p8IufudTBWRZ1dWFetH7Wjge+1/7pr05qn5Uc=;
        b=FMuWF8aZPH272b4IPGqCIfRaWcUrOpJC7v8nWB2xvCLuZHLzXVddG3bRLDinSW7mBv
         lXtIW2kNtMNwLH8Xt3j6+At4gYi174fRIUHjFb2ic22VFtwV9Vf/KO1KvYRPyeOVUdHa
         PhSVits1RhjlCTp/LlBWonggDdBETJyTWWrQxYz4tjkrkU+HKtOAjaFyJB1K25XR70KY
         hnCxQPbATCyma8XI8ChZ0FSKLPgvt2DifCvn8xf6M+Uk5tsf//mfEe//91Uhs4NS+uXL
         +/jdEcuJmMg2cPLRNnb0lEwzdG2yq9CXuSY2wQR3oosQIRVOldbHv4DWpgoZE5sPDvV7
         B6gg==
X-Gm-Message-State: AJIora+gj/SKhsodyT0P/dUMIwXMwiHXyxSTs1q03b6u84MLaa81Uwfv
	PUM8jrcTcJaH7aBs86uTSvpWLN3HcZaTjnza
X-Google-Smtp-Source: 
 AGRyM1tYGM5y29DtD+MyXTLL583ptZOHZBoiX6iG6d4q9heIvaNf95NURwZ6KgUsRP1sXeEpQYbe+Q==
X-Received: by 2002:a63:258:0:b0:40d:3156:6d61 with SMTP id
 85-20020a630258000000b0040d31566d61mr5989110pgc.190.1657773424753;
        Wed, 13 Jul 2022 21:37:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.37.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:37:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/27] gstreamer1.0-vaapi: upgrade 1.20.2 ->
 1.20.3
Date: Wed, 13 Jul 2022 18:35:43 -1000
Message-Id: 
 <e0086979006dafbbc21f062e5fcb10c4908b1309.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:37:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168020

From: wangmy <wangmy@fujitsu.com>

Changes from version 1.20.2

vaapi: Do not disable the whole vpp when some va operations not available
vaapidecode, vaapipostproc: Disable DMAbuf from caps negotiation
scrambled video with some Intel graphics cards

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c363ae6f797460654a7884402f7f98181a7d688f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...streamer1.0-vaapi_1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
index 40dc21cf45..6e580f9f79 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "30126ab6e3105dab8da76bd9951a68886149bcd70c7fee0bac68de564de41d3d"
+SRC_URI[sha256sum] = "6ee99eb316abdde9ad37002915bd8c3867918f6fdc74b7cf2ac4c1ae0d690b45"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.25.1


