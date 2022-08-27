Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320AAECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:24 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.51796.1661624783691322570
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=COlicDWL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id f12so4188643plb.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=bXBdkaTwsbp9SY0BYN8Oyeq5PIAa5jKm7AKAu/OTehE=;
        b=COlicDWLi92BWW/t07wSsaqBOpUgddKVJm9PU0c8oJcPh9MWwK7zMAGiWKrJdQxNR/
         6LxLd8DDC7hzgVUNrGdq0iS/Xc7TBs3D8MT5UXKGaTFTz1rPEpIHASzXsZrB45Spa4Ad
         HtVa2FjLDWR/v9PLllp1+3SBb4kb5pI3/XtXRcke/D2lVwLRcSBZCBZXouDB5cnZBsmD
         6olycGGsvyYDhOTwDeWHEF+S6n+0WzQKDT738gCBITh8LBBBrLibYi4PWdSQ6H8n8BVv
         hfm9ycIZ6fNPxFvVHu9NgOs920BfM7GliXFOURlAEmEju9Y/o+8D72bzfiwDYwXNffJh
         g7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=bXBdkaTwsbp9SY0BYN8Oyeq5PIAa5jKm7AKAu/OTehE=;
        b=Zh9LaFCIl663Dnm9txSNOmxYUh29MOsFLZqa6aCPfIOeQyQJLiTybHcmhp7M2TKzhH
         amFQypfNZbkDWIppXvSDI12ivfBVDWjgVjRb/F5H1FBR9qx6WVM0857oxqBDnkg08Ccg
         OAo9VhBVlcdAsRJ6VRaj4jYcZSD3lvL5yhRtXyiJOsKzrb/wJamoWM75/7it66JXG40z
         yykTidlWUVvMa6w/MfR7Pu8LYXiQTus//fz1LpWP/l9UWbeJIIU2YCU7aAuS34RiCZtL
         HijW3Fe5mE1OS5u1U83FmLqSQdz1qlclR8I4DPTyDqehWdU+B7k3iCRT9Sr6mj+RMn0J
         iyJw==
X-Gm-Message-State: ACgBeo1lVq/9NDPMhcJbKvR7WpxmEaNoZ16BQE7WsxOTMRuAhfV0rDVy
	ixzpLKyytQZgVejCqOc0M5QYlo8kXlonyYNs
X-Google-Smtp-Source: 
 AA6agR7ihB2XzRwuGycCwOlBCDw5ER7g+oGW/23B5ceHeWYH+Pdt/aDKTfrOXKpcTf143729bYHM5w==
X-Received: by 2002:a17:90b:4c8d:b0:1f5:409b:b017 with SMTP id
 my13-20020a17090b4c8d00b001f5409bb017mr10770137pjb.52.1661624782718;
        Sat, 27 Aug 2022 11:26:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/24] libjpeg-turbo: upgrade 2.1.3 -> 2.1.4
Date: Sat, 27 Aug 2022 08:25:33 -1000
Message-Id: 
 <2ee0018ea02bc3964b1ec248306d8b91b362526c.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169950

From: Alexander Kanavin <alex.kanavin@gmail.com>

Significant changes relative to 2.1.3

- Fixed a regression introduced in 2.1.3 that caused build failures with Visual Studio 2010.

- The tjDecompressHeader3() function in the TurboJPEG C API and the TJDecompressor.setSourceImage()
method in the TurboJPEG Java API now accept "abbreviated table specification" (AKA "tables-only")
datastreams, which can be used to prime the decompressor with quantization and Huffman tables that
can be used when decompressing subsequent "abbreviated image" datastreams.

- libjpeg-turbo now performs run-time detection of AltiVec instructions on OS X/PowerPC systems if
AltiVec instructions are not enabled at compile time. This allows both AltiVec-equipped (PowerPC G4
and G5) and non-AltiVec-equipped (PowerPC G3) CPUs to be supported using the same build of libjpeg-turbo.

- Fixed an error ("Bogus virtual array access") that occurred when attempting to decompress a progressive
JPEG image with a height less than or equal to one iMCU (8 * the vertical sampling factor) using
buffered-image mode with interblock smoothing enabled. This was a regression introduced by 2.1 beta1[6(b)].

- Fixed two issues that prevented partial image decompression from working properly with buffered-image mode:
  * Attempting to call jpeg_crop_scanline() after jpeg_start_decompress() but before jpeg_start_output() resulted
    in an error ("Improper call to JPEG library in state 207".)
  * Attempting to use jpeg_skip_scanlines() resulted in an error ("Bogus virtual array access") under
    certain circumstances.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec92b905bca2ea773966672283d5f45872091b31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jpeg/{libjpeg-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.3.bb => libjpeg-turbo_2.1.4.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
index fdc035d5f7..1708fa97f0 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0"
+SRC_URI[sha256sum] = "d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.25.1


