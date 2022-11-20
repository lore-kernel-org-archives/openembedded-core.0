Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89776C43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:15:50 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.13269.1668953748471738768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3IxL9D/v;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f9so4787555pgf.7
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frWKzJ0P7TYcenc2MBZbRYkFwYzDNQcYsrwrKmdLzu4=;
        b=3IxL9D/vRfJs4+l4q92zhxwJw1gsozHrHD9vSa7dwhtOEwlH3KwqwJgi8bea5yEc7w
         2lyZTTQHrSSiYw4ob/xdRRcaB7mTjgDlDTDPhkvU7BboPD0aWQVlHw3F9+oJzEFDwT45
         c/cUEHjcSXQ/eyKhjjUdEHYSDTnaTuvvAe4/cLFHDKDS8ejm/NcP1nxIJRP+Hrfpj2GO
         laTWIbAEZm+iJuREmGGKp7m2UE0kTOO9KMqpCsPXadQT9LdP95hhqhp9e/880BTzq2Ft
         iPlugnsvr+CknFzKmjvLJYGvndUchVG6oK760jCrotUAF8He1TNL3rdxoxBlDKA6vO9K
         gGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frWKzJ0P7TYcenc2MBZbRYkFwYzDNQcYsrwrKmdLzu4=;
        b=WUNuYtZzpLeTdw09Y0vGwoAhmtNcrFB/flBEXrbrvi7ePN4QojDVvOyqso+HSY/g3B
         7qfraUZ2t4VPDwKfUUUXtVvgOpSmMrzIKgt7Lx/0Vs2GWMX1uqeKg7rvtFv9KLXhewDt
         Jl8pYiovp6/ydMJtVSNXLe9IpE9TL10onsD8zXYlhwpRxFVJ44pAfQNCEs0qOvtifVQ1
         MlH3TwBmdgWH++GOMbdPin8PafwU0XIgTpOQugfozPTLZukRVOu7zM9ib+rxpdZ7naYq
         LO/6UMeJXckVGAO5XXLHTXQhJcS8mOl0X3+E1WBcBoCLbWDzWDO7FVGTFd7bVE7obNwy
         v01w==
X-Gm-Message-State: ANoB5pkPQ7Q4173zmnlV9yTKpwTD4GN6lKqB2VHuZX/da1M+2+WI4gz4
	Ja6UYKISqaE8EstBpZvtyPqkZR5JfH+Kq1EXXzA=
X-Google-Smtp-Source: AA0mqf6u8wfiEC1Fpza85VK+rNFz5omdlixHNzTja59zdFKmy4ERMdOLiypQkVLLnR7uwxFkiAlRlg==
X-Received: by 2002:a63:4046:0:b0:460:fa0c:ab73 with SMTP id n67-20020a634046000000b00460fa0cab73mr2394864pga.315.1668953747321;
        Sun, 20 Nov 2022 06:15:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/35] expat: upgrade to 2.5.0
Date: Sun, 20 Nov 2022 04:14:55 -1000
Message-Id: <8dda30a9c64a4ad1f8eee11deb2e5143ba5fd719.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173606

From: Ross Burton <ross.burton@arm.com>

Release 2.5.0 Tue October 25 2022
        Security fixes:
  #616 #649 #650  CVE-2022-43680 -- Fix heap use-after-free after overeager
                    destruction of a shared DTD in function
                    XML_ExternalEntityParserCreate in out-of-memory situations.
                    Expected impact is denial of service or potentially
                    arbitrary code execution.

        Bug fixes:
       #612 #645  Fix curruption from undefined entities
       #613 #654  Fix case when parsing was suspended while processing nested
                    entities
  #616 #652 #653  Stop leaking opening tag bindings after a closing tag
                    mismatch error where a parser is reset through
                    XML_ParserReset and then reused to parse
            #656  CMake: Fix generation of pkg-config file
            #658  MinGW|CMake: Fix static library name

        Other changes:
            #663  Protect header expat_config.h from multiple inclusion
            #666  examples: Make use of XML_GetBuffer and be more
                    consistent across examples
            #648  Address compiler warnings
       #667 #668  Version info bumped from 9:9:8 to 9:10:8;
                    see https://verbump.de/ for what these numbers do

Includes a fix for CVE-2022-43680.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a257a674272dc638f09167e9b9202adfb477ef1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/{expat_2.4.9.bb => expat_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.9.bb => expat_2.5.0.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.9.bb b/meta/recipes-core/expat/expat_2.5.0.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.9.bb
rename to meta/recipes-core/expat/expat_2.5.0.bb
index cb007708c7..7080f934d1 100644
--- a/meta/recipes-core/expat/expat_2.4.9.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "7f44d1469b110773a94b0d5abeeeffaef79f8bd6406b07e52394bcf48126437a"
+SRC_URI[sha256sum] = "6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f34998de11969ff67"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


