Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web08.8321.1630503949101460976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JVbO1mUR;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so832234ood.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kEQc3FuxGJs8xyQqBhsmS0uSYL6L10q4E/S9I8hyjIo=;
        b=JVbO1mURLaIBAi+orkbJg7cS3l7Y4WuIoJLtSZZLskjqIwWgsY/w+D4meYLo3PHEhg
         2eAeqdNWlLUXdFlgR1UmzBH0dZozd+5gQV7WazlRKtnVw4nfTLM/UoFLFrWcKOBWZE5s
         xT35wOk+LvhYXJKBjs+1B6Mh7MAew5YY/puoS38WnRIPv8y4wcPgv8X2RTCU/Vwf0bVu
         NBFZIVDfXRu0V9fv7oQuj6dZZIT4sq1/UH4B9Ym+Nh/mXcOAzlme3F1T8cn/odNEMqQt
         zoCvfozkfeMQ8ThQ1XcJN3LlKFPGr0E3Ay+ShjFEPgeqf4P/EtFxZQ9pbWFkcoBPIeku
         x1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kEQc3FuxGJs8xyQqBhsmS0uSYL6L10q4E/S9I8hyjIo=;
        b=a8JlPRh6o2hugiNCDGVEHb3pmNvOhvkhSIZzT6MsmpI7yutNWUBqwpox7i9g/26aFv
         KQ1fYP17EkmG5ZJgyAEuMtowS942opfgv2mM/RyOOdznarTeov5P3pcQBDMUM6NCywjS
         GJcYxI5BxTAhX3ipJwrCbTcJidAKudW6cxjKDbxe1z3izBbBN22RW69RMklxKB1/uGXX
         zIKhmbAYWBereF0Zuma1/D0PYHCm2ctfzpE7KW/qJyAX/kFPedEu6b+TMiQl7e0gOfoT
         VP+ovUf5E4guakV2Hn2hweRRDrAoWj3QHhI4Nh72rQsd6B1t+gORZPtTf9/mnevL5Vm7
         ntGA==
X-Gm-Message-State: AOAM531bvKlRF9QyMTFzJ4+WHmmxtktlf10wYyF8//fXg1ZaiGCpLNIH
	E4xlR9QPj5LTS+IC1zdpaIf1UIkbfXo=
X-Google-Smtp-Source: ABdhPJxCl/iGphQamAowHsD2ZEt4DIzSvdkNUyTP4sirRjbQHTuyD87NV64NI+vLBygD4/WjhsQkTA==
X-Received: by 2002:a4a:6f4a:: with SMTP id i10mr19515135oof.64.1630503948251;
        Wed, 01 Sep 2021 06:45:48 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:47 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 30/31] flac: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:09 -0500
Message-Id: <20210901134510.29561-31-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/flac/flac_1.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index 57e6bcb244..c796cacd2c 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a lossless audio compr
 HOMEPAGE = "https://xiph.org/flac/"
 BUGTRACKER = "http://sourceforge.net/p/flac/bugs/"
 SECTION = "libs"
-LICENSE = "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD"
+LICENSE = "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://src/Makefile.am;beginline=1;endline=17;md5=09501c864f89dfc7ead65553129817ca \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.32.0

