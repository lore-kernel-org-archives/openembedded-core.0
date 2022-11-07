Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14A4C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.84.1667835426509180497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=n8VYwDSd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id z26so10990068pff.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz8g/rX5+9A+lzo5I6dWV8JPC4jDWn0PxKUa669YI7I=;
        b=n8VYwDSdKABClSoD3QxQhilUJ5+T3hd3F41RI19FDxpnJpJQvIIWiTOd0ap4tPm6BT
         Lk/e9Ga+ia3a5sBrXGGFvcWwxYF1muIdIm9m84Evg7C8kbMdP5LE0kOhLg4bkYdNwjRp
         FIgKqslHIdArT97CutGZvHFWE1B8vGLMwrH1dZlsKRMVDdSxY+qu0GnagSNwRbN2Qt+D
         GiPby3u4U+rHDqOn2IjfQNE3cVGbUWt9nu0e6ytv7Gyr9rhWgGEIM137kC9Q3PaZ487w
         ZBtZg9yui2Zvkz1Mvb6AZy2GIQDeG4H5tCH7J50xfHvCrEAHFhWv6LAePKrrHz6JfyWa
         zA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tz8g/rX5+9A+lzo5I6dWV8JPC4jDWn0PxKUa669YI7I=;
        b=bJgQGj63EE60TyoYTd8utcFG5KkQH2OV/6xyDsVW4hTW/hOK1JzCd8epPzr9mfLoYi
         y/QG6i5NYsHR/zTlimT4jZTQPU9406bWlS3B6Hqmeu1P6h22nt/4Qafos1LTkxVYraab
         xRosIa45gafZhnOClmA4KYa/aiz6A/VCFC5I+krUEIpAm0OhuhFWO4dRvnB5K3v4b98u
         jSGB3b/4FTn0x81W9qYA9h5ZSFIDdvn41mydOpfwIQxt+0PuzwZl+jqrnr9yKpu5NXxQ
         BTnUD8Nvdg2Wq0IEn7ay5rPKahWj5O7I2TdV1jzm6B40F47/WaAMXQSXRz3KB4wfpw4d
         2Auw==
X-Gm-Message-State: ACrzQf19vBtskLl5ZFntWzhMo0xIuosCMZquIotvRxbqepiryoveLWY8
	lxYURKU9RipMMFByQKxTNomwsL5hzbP8C/us
X-Google-Smtp-Source: AMsMyM4IddXUOOwhXRKw10AqptTcgACk4DCo6FgG4PjEGh8JlHUVHlezNfUESJWN0IIVtLKNapoqWA==
X-Received: by 2002:a63:6445:0:b0:470:34bc:c04b with SMTP id y66-20020a636445000000b0047034bcc04bmr16025608pgb.541.1667835425640;
        Mon, 07 Nov 2022 07:37:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/25] libksba: upgrade 1.6.0 -> 1.6.2
Date: Mon,  7 Nov 2022 05:36:25 -1000
Message-Id: <b58fa75b4cb0cc75034be5f952224d4bcee9aff6.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172905

From: wangmy <wangmy@fujitsu.com>

New upstream release fixing CVE-2022-3515

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4bef6fc673de958dfbab80bcbc2e0159803b97ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 8e453d64255ce6a01b193c3735bb0aefbaa6fb38)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba_1.6.0.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.0.bb
rename to meta/recipes-support/libksba/libksba_1.6.2.bb
index f9e83681dd..f6ecb9aec4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b"
+SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.25.1


