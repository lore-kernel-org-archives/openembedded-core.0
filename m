Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC54C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 21:24:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.2522.1655241861280361669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 14:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dvu7ctea;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id k19so12851517wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1f00ap30BgjvqyR7XCYf2QqPhYEsX5X7vWunF7KZhdE=;
        b=dvu7cteakX2Sm2bPtuF7UK4WlYpNoBD21jvwqdhSMZnZSF3t9e9xIJA2n4U47lDfhx
         OY8nXYdgpxX+G3P7pRvXwRAmciNgcHgd3b6OGZWIryyZ5xDZhIEd9SdS4VqwOZYmS7oV
         glFBcmELTnjyTa98xuFFwMeAsFEk/kXZ1Gs08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1f00ap30BgjvqyR7XCYf2QqPhYEsX5X7vWunF7KZhdE=;
        b=p6oTKdMNTjX+9ADG+qwRzuIXnGhuOYH4E7xeXw2IoU/nkWujJtdvuJwZaP7Qa83Z/y
         3Ei2WoiLIGFtb1us5F9UnrD9OfeGFINU1OSY3i8cXqA/zGTpb8ViKxBYvCLUlts/Aaae
         QSoetmN9IbAU4m4wNUH7AaYCQUzV9ZZYSHfJwR1gjUxV2IC/Ed+I2DF5mhQo/0TYa9b9
         UwygOZFbGJF1/ACoQqML7iQtvsUu+hWjrTl4kAlF5GP6rvvb3NF8WBHKBDFvP5xs9JCC
         IBPGv/rr2L3r5mb8NaV1tw64/1R8My5GhrkKAf9DoKSB0823iGYVEcaY2O4/QGM+4dKp
         SE1Q==
X-Gm-Message-State: AJIora90X1RFxgugn/wltz8PKKxHvDyF/3hUMNO/zG2+e3ZNl3ib6+fp
	1PTCxRCnMr4VfufQ2C/mnNq0cevtvn+P8g==
X-Google-Smtp-Source: 
 AGRyM1tNY5M+fGFBmILdrehIFvPxBuFBuwNCZgfjAH2jd30zpJBjFnmQGPuQccY6dT0++ezQOsK4RA==
X-Received: by 2002:a05:6000:1e0b:b0:219:d06:de6c with SMTP id
 bj11-20020a0560001e0b00b002190d06de6cmr6760193wrb.529.1655241859572;
        Tue, 14 Jun 2022 14:24:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5217:2b74:ee57:d3bc])
        by smtp.gmail.com with ESMTPSA id
 f5-20020adfdb45000000b00210352bf36fsm12788048wrj.33.2022.06.14.14.24.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 14:24:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 8.2.5034 -> 8.2.5083
Date: Tue, 14 Jun 2022 22:24:18 +0100
Message-Id: <20220614212418.55149-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 21:24:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166907

Includes fixes for CVE-2022-1927, CVE-2022-1942.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b22e8016abb..06707dbe112 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".5034"
-SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
+PV .= ".5083"
+SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


