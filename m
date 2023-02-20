Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648D9C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:00 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14061.1676902731098171116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KdSdg8e4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id q5so1525957plh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIwnW9JaPCVAyPqAal3aEQDJH90RnAWtvYlrl4HwRmM=;
        b=KdSdg8e4fzEKxxhLZZI5gUqD7KP5gecVcO58wxDptn3Q7235AmmzYUOdOua2cgLDtn
         GRy7D24Igf5RHoF4fRavAAS4yQlPZWNVyOce7VL02hkJJgliYCUJsSqrn52NqdwrRslP
         cnPfTLGXX15Mx/BbnAjASqgT0951/jQN8pgz0ypQUfuIXsS0CJhqa/0mI8BawxT9uipi
         P+ZOX6HIKZWMgglz8b8D/i2xnNd9BC1n3zLQBO0kpIsgAofDregtAIBFwYtvV5bx+xG1
         9gqJPkSBJ1Ya+tiJhTrHf0SIg2i3o+Nic1AjGjQpofcDdn2C+oYdZvFF792pXuA8y9Uz
         WV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIwnW9JaPCVAyPqAal3aEQDJH90RnAWtvYlrl4HwRmM=;
        b=HVAkYIutZPzj+ydCxej7z1PaMT4q9QxR3+6yf2KZ1/ozQ+0Vb4pLa6FrmXypM8d3bS
         ORi9fsZWBI3p03oTqx+CVj10F/g4+SK7uq6ZD1dP7WuiP65kbcpL7fy2QYj3+HeP+PnC
         sFxfbPBPfw7xG6vbnBXKdoIEjeREP+yEKMEoo94ZTxraf/p2dd8o8Kr+Ld0vfNbqlbEH
         MsVuXEOPuOStNBMrlXbRm9DaRyEl78Ry00vmDI2D4h1Vr6G3RZCEeopkl1MESx/+Eli2
         l4HIxjEHrktDcvQfrMTAYW3TSftKsxV5+OyRd/L/T3Dokiu4iIBH4tUzgjddFNN4AvTN
         8pJQ==
X-Gm-Message-State: AO0yUKVgOciSzXkLgFtWXOVAGWqnUP2ZD6Kelsc2aAiHjOV1lTc826LI
	DdDKaFOWVbaqUcCZ7xPAq2ZYN2gdvJ+mq40vLpk=
X-Google-Smtp-Source: AK7set8eTl4iVU1sERoFMzbg7Rlz4A/vmQbxyGzm11cJ0viged2Bh1LSmqeZukdndqLI8CIcZ4RnTA==
X-Received: by 2002:a05:6a20:a692:b0:bf:8ee2:2009 with SMTP id ba18-20020a056a20a69200b000bf8ee22009mr867499pzb.26.1676902730057;
        Mon, 20 Feb 2023 06:18:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/22] libjpeg-turbo: upgrade 2.1.4 -> 2.1.5
Date: Mon, 20 Feb 2023 04:18:14 -1000
Message-Id: <ce9a7ce6edc0477aab7716df183232d8057758fa.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177413

From: Alexander Kanavin <alex.kanavin@gmail.com>

Significant changes relative to 2.1.4

Fixed issues in the build system whereby, when using the Ninja Multi-Config CMake generator, a static build of libjpeg-turbo (a build in which ENABLE_SHARED is 0) could not be installed, a Windows installer could not be built, and the Java regression tests failed.

Fixed a regression introduced by 2.0 beta1[15] that caused a buffer overrun in the progressive Huffman encoder when attempting to transform a specially-crafted malformed 12-bit-per-component JPEG image into a progressive 12-bit-per-component JPEG image using a 12-bit-per-component build of libjpeg-turbo (-DWITH_12BIT=1.) Given that the buffer overrun was fully contained within the progressive Huffman encoder structure and did not cause a segfault or other user-visible errant behavior, given that the lossless transformer (unlike the decompressor) is not generally exposed to arbitrary data exploits, and given that 12-bit-per-component builds of libjpeg-turbo are uncommon, this issue did not likely pose a security risk.

Fixed an issue whereby, when using a 12-bit-per-component build of libjpeg-turbo (-DWITH_12BIT=1), passing samples with values greater than 4095 or less than 0 to jpeg_write_scanlines() caused a buffer overrun or underrun in the RGB-to-YCbCr color converter.

Fixed a floating point exception that occurred when attempting to use the jpegtran -drop and -trim options to losslessly transform a specially-crafted malformed JPEG image.

Fixed an issue in tjBufSizeYUV2() whereby it returned a bogus result, rather than throwing an error, if the align parameter was not a power of 2. Fixed a similar issue in tjCompressFromYUV() whereby it generated a corrupt JPEG image in certain cases, rather than throwing an error, if the align parameter was not a power of 2.

Fixed an issue whereby tjDecompressToYUV2(), which is a wrapper for tjDecompressToYUVPlanes(), used the desired YUV image dimensions rather than the actual scaled image dimensions when computing the plane pointers and strides to pass to tjDecompressToYUVPlanes(). This caused a buffer overrun and subsequent segfault if the desired image dimensions exceeded the scaled image dimensions.

Fixed an issue whereby, when decompressing a 12-bit-per-component JPEG image (-DWITH_12BIT=1) using an alpha-enabled output color space such as JCS_EXT_RGBA, the alpha channel was set to 255 rather than 4095.

Fixed an issue whereby the Java version of TJBench did not accept a range of quality values.

Fixed an issue whereby, when -progressive was passed to TJBench, the JPEG input image was not transformed into a progressive JPEG image prior to decompression.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f779689c2c766b609be31222d71110c1a15145a8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jpeg/{libjpeg-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.4.bb => libjpeg-turbo_2.1.5.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
index 1708fa97f0..4d21ca1e1d 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b"
+SRC_URI[sha256sum] = "bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.34.1


