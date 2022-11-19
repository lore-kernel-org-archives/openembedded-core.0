Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7DCC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.30639.1668892525080002197
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=o/YkKHWh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id k15so8056088pfg.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKV2WqU/qsMcsxsUZPS8zKLdLaA4TL9vrOOWhfqopW0=;
        b=o/YkKHWh3c5KS/qIQ1iGSbJ004FyRvAoGVgZFVs3S0wE6P20YWodVuv3NrVLsaDYtI
         0d1SRFs6fuReaSnAOpgI85bQ7NDzM9Vz8n4yUnC6JmgJo6Yx7wNa2tb/SkZ1n99g8ELu
         pzduSonPrXH6u0uhXTf/7TJaooIQIFNORuWhBuS/mOwjTo55pspgLJePKOj9+TzfYA3/
         Ctjjc2J4x2SUuCvbrmbKsqreU/iBtK0XKmstf1sMLzHhbnygGg1DgDqMFZIqEw3jZLhm
         ORpo3dXKdveqSpd62Cr0yDdSi14xpL79/DSl0b4WT3KZg/42uCkS2S2rk8fuhNoMXFLj
         GPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKV2WqU/qsMcsxsUZPS8zKLdLaA4TL9vrOOWhfqopW0=;
        b=JXY4TqDoYxNpKmxpXvgyOr1W9Y7FCKPuhb/jH8CeSTt2z+Iul/hswt5A7e90X6iZK/
         AgNO1d1CVHW8fQoDHVMdRlfjE9TBOQeYyuW7jotA7UUmZhpv5JR0SuZIT9vHemkwwbvh
         OE9Fx0Q5Y3Y4Mj9B3xDlrQQahEwKz8+odkAJtwGW7mu3ipIiAQiRqhgOzA+u4ubYi9V/
         JtltvFkoMyb5t+J8ObNzhwqlwSlmYI/z9bKhhqxLhCnRJ9LUTBX8bMWXRtBjoRu4SYcM
         0bZ5HFVIXVAZ1/YhwLb3jx/qLUpCGmAwOMVXVVr6kt+wQtYbjn/v1Bn5qmKZ0hHCVBku
         S8Kw==
X-Gm-Message-State: ANoB5pnHjv5Ed/HmW1us0Z3TFIYi7zpy/fXz1PjbXLxX8sI+Csgzd2uk
	G4JftQJlHFG09WSkCfMl5x2W1zFjKAgb5Whjc9Q=
X-Google-Smtp-Source: AA0mqf7RDRpWlhj4VqtGXSGwABHO43t0WviGXaTE+0+4t+H/a/KhKYbcrvi3P5WlA8pvfN0Sb2oO3g==
X-Received: by 2002:a63:f003:0:b0:45f:bf86:c917 with SMTP id k3-20020a63f003000000b0045fbf86c917mr11878030pgh.201.1668892523847;
        Sat, 19 Nov 2022 13:15:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/35] expat: upgrade to 2.5.0
Date: Sat, 19 Nov 2022 11:14:40 -1000
Message-Id: <5544b66484502a6353dcf4c220645a58bbec3af8.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173541

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
index 9561edd84f..aa8d439d5f 100644
--- a/meta/recipes-core/expat/expat_2.4.9.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "7f44d1469b110773a94b0d5abeeeffaef79f8bd6406b07e52394bcf48126437a"
+SRC_URI[sha256sum] = "6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f34998de11969ff67"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


