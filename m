Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D554C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.7238.1654699235191198159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cSdf88di;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id c18so10746184pgh.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eckJoM8dPQW3gP6FoSRFD6z2f2kFMEpUWl+4iWPaX8U=;
        b=cSdf88diS5aIU21wLlEPR3/KHBjlNxhO5taMzwRXRiXm0GgsTjB24AXcU/JyRH5A6O
         LzSjn5RA+qD1e2Zr11AP5VQMw2Vh28iIv9llS7wc+icRXoBBohmjvPGUl72xaZX5o1HP
         6h7t+QkNLPs0jeyiUfTALzcvekWCN2AzDGUers5IWO9xfJV7k+ZO46OEppyZcgkxoV23
         zPFcWEgThCq0qjjcKKXs8OLotzqc4HksyGNCU5Ee9cRgz3bvy/QKjcwn2u+KkPM8qONo
         7P77wYKXmsfw5QJyFS9/uDrXJrVOFCqEsdeN7GEIU0ZPAOpCciiAKrrIicn2C85ul4Rk
         ZMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eckJoM8dPQW3gP6FoSRFD6z2f2kFMEpUWl+4iWPaX8U=;
        b=0XJnIUZn0cQ3GP074QT1RBrcnX22tMIlVJ7WVa7eBQGMx4zaOasqsaMLo5/O3TT4zS
         i3DV6ZfODJ3UsTnf5bw5hNZRFh2WRm4Jxh6pQsTp4G5JaxXdOuDzfuLt5pSvubWsGP04
         gZCt0XAj6cNGDK3tOpK6zxKgLCEiCkyOi5BEkZxoZv6fXr5J5rw28CYHtjeaopQQlJv/
         PAGYIyHq2+mVjT2DX6LohRh5ndU3n3dFYpYUqW3mvxSNZLLLqYOLEtkn3TRE9NXbOhZy
         LPsi5xyfCC0vImFWAGm1thylWlJvbxeoZC0eykharUb6OZv6QHy7aG+jtgMhcoY42IvO
         Ll4g==
X-Gm-Message-State: AOAM532nPzGJlMgE4tIwoxwDRQCeo3sWT+j79QewbZJlNhKHua/n0XQI
	AyXhRjOIihkHoYjlM9pityC7/vmyRuKUAKKj
X-Google-Smtp-Source: 
 ABdhPJyu9rTFyvvDfvI4nj49E2OaOtgkUQRjsxyTRdFUTI+rtinjPMk2dIvHS+nOdULfZkkNSwXLjQ==
X-Received: by 2002:a05:6a00:9a2:b0:505:974f:9fd6 with SMTP id
 u34-20020a056a0009a200b00505974f9fd6mr34952178pfg.12.1654699234197;
        Wed, 08 Jun 2022 07:40:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/22] gcc-cross-canadian: Add nativesdk-zstd
 dependency
Date: Wed,  8 Jun 2022 04:39:29 -1000
Message-Id: 
 <be70f51806d66daf1994a492dc446062838c0e21.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166727

From: Richard Purdie <richard.purdie@linuxfoundation.org>

To match the changes to gcc-cross, add a nativesdk-zstd dependency to ensure
our configurations match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c145e00710fe557b5a3832fdc556ad53434b3615)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 168486bd4e..a87b446c4f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -175,7 +175,7 @@ do_install () {
 }
 
 ELFUTILS = "nativesdk-elfutils"
-DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
+DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib nativesdk-zstd"
 RDEPENDS:${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
 
 SYSTEMHEADERS = "${target_includedir}/"
-- 
2.25.1


