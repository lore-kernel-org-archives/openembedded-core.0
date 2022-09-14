Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279C7C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 23:40:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.4045.1663198842032372474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 16:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WHAw+zVP;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id x1so16666013plv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 16:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=dz7S/h7Mfff4bASLDTJd7haxfLuSiD1KLmAVNWtg0V8=;
        b=WHAw+zVPHonfyrO4h1QhjWi3HEx8bPnDSAXbKutZhH13j3g8O6mpQ6hPrb1o1P9tfF
         GnQKlxPaf2/NkfQlnBiUiQKMj/viNhSi10AvKfpbUvWMdZNawKjLyM03MrdGCgGHX2kh
         tZIGn3mYg1P4RYM1QyDiC6mkG3PXPAgdyzwD20aozdE9Ya9+9MgiukZkudvSOVcbmG88
         xSOkqsojDFzQaTlli8yalZOWyPd45KfpxdNqK4UOKopSSunk+yOP73aEHlcWFPZWYo2n
         OAH/OEfsXCBClMfRYDSoZ+oH6cRu5KrYHWFdzbThDO8wjTShjl6LdYX3zJ6mZXTRy5N1
         MLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=dz7S/h7Mfff4bASLDTJd7haxfLuSiD1KLmAVNWtg0V8=;
        b=24YU4P7+lSzX26jdzFmW8p8k1COrPLRrX8ejPO0Zpd+TUYES1LyPTYYjVxzvtviGkr
         5dPLPzBUTj4eCNS6HwSEuUYmiGPSD74hlw4PZstKCYcRAf8BSbDosDImmW/W+z6yQmcq
         R5+m61fSFYm2bpETkrz82llW9iyR81hEhrV7zl7ujBLevO4pfUa0PL/ApPwTJaqecbZF
         6mczG9rlbndUz8X3j5Gl7BqO8xdrzPnIfMDmCrqMspjAuoDBitZ2diubvSSwAgH8L3Z8
         4nT9WbE9XDxgOvcktU8wNAUVn7DLqdNgkNVNoOySPBfLKO9DbUSBrhdp1YWUtUVhvI+K
         Y/lQ==
X-Gm-Message-State: ACrzQf3FmXHzYo/zSd5gOYt+57Jqw/NSHMIGeX8gTSZHT0UseyFzXddb
	8wiA2Cr83yisIYr57V7B/5DgN4trKRMtHA==
X-Google-Smtp-Source: 
 AMsMyM7P11eD/llTNAv88X8G4/DlXTk7Z74FQWFFSa+FVkb9s27I/xhtXZuzxlFu6u3pE2Ks8f+y9Q==
X-Received: by 2002:a17:90b:4b8b:b0:203:203:3365 with SMTP id
 lr11-20020a17090b4b8b00b0020302033365mr7450201pjb.19.1663198841055;
        Wed, 14 Sep 2022 16:40:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ec90])
        by smtp.gmail.com with ESMTPSA id
 q17-20020a170902f35100b00172b87d9770sm11203830ple.81.2022.09.14.16.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 16:40:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] curl: Add missing perl modules in ptest rdepends
Date: Wed, 14 Sep 2022 16:40:38 -0700
Message-Id: <20220914234038.1198540-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 23:40:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170676

These modules outside of perl-modules are necessary to run curl-ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/curl/curl_7.85.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index 3b55830415..ad6a5175bc 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -100,7 +100,8 @@ do_install_ptest() {
 	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
 }
 
-RDEPENDS:${PN}-ptest += "bash perl-modules"
+RDEPENDS:${PN}-ptest += "bash perl-modules perl-module-time-hires perl-module-digest-md5 \
+                         perl-module-digest perl-module-ipc-open2"
 
 PACKAGES =+ "lib${BPN}"
 
-- 
2.37.3


