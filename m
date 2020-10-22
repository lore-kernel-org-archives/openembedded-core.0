Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.777.1603381951825811016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cO8DD+JY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 144so1394808pfb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5wI3g4GppkNfGE9bWDxuw7bJWunM4wqpGD32ktr/phY=;
        b=cO8DD+JYAJ4CKUw2ZeZk18AQQwv2QcMJ9qYAczgovDUZR5l4+BuLM1Yhg4PCBdAdv1
         yFl95v/4DVDkW2aM6wZb5E38OVNtBr7FoproFWx8mgsnPW0oEwjPrPRXiK08JOQKzIiz
         sMzQ6wCP8JTyuhjhy7FCyBQtCkipH2/VeMEBaTkAsEo0fKvsuc1HVYzFxnq0oakR7rsQ
         3JEwtFCuml2+dF6z1iSaptnhQK7GIraW1S1Q2NEbICx3TRx4PJXu7EoSYZbqQg8NCPD7
         Df34Gr8TkxD/Gpp8IZQ9SC5u0Ho3Q93kSPOZvWyDD9BFNiZQNm20XusoBPbzEgP5FeTS
         W5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5wI3g4GppkNfGE9bWDxuw7bJWunM4wqpGD32ktr/phY=;
        b=rU9GuClOV7Q83Mer6fqaaREugQHJ7rC91wpYNMlUjBi/ZOfqxVjtVRby1ddu9xe7Ou
         2MhCDjNEPZaFmjdJ4adyFs9iu7yPVSglYKgvot9DhIaEo8X+ml0tjBTZ4G+R3iXQlsoq
         090X825P0bJTbLLDtiQPVj8njRBIJtUZjqhXC9JE9KNTnq4aIHhGA0dwxNZUDnvMQmlV
         ubgTwEQk84EJ4iZyDNPvyXA2blBtcLawWeo8sYuCkmdtVq8WZhrMkMYJvCW5QrgQEe24
         GYrDq6D/MkyjsQyH0NIkprf1iRQ8ByaitpgiTKR+89yBG9bxRpEGUZ6iOzkE+npuj5OH
         qWCw==
X-Gm-Message-State: AOAM532KWOF3pFZ0Ccz1mu6G27bIZ9e2ilqRcDWXBJKmSsRkm+xC8sJV
	jsyQpOsqjXJB+k4xbrptG4x3KNSpQjvGDasF
X-Google-Smtp-Source: ABdhPJyM3LXBCfzIf3g5sFBE+xoGUG09dNXcsZkWMAvhqZ7whzJGalNcN0HvCkU/vNKFXj55Z9C+8w==
X-Received: by 2002:a62:6496:0:b029:155:b152:f0cf with SMTP id y144-20020a6264960000b0290155b152f0cfmr3095917pfb.75.1603381950786;
        Thu, 22 Oct 2020 08:52:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] tune-mips64r6.inc: fix typo in mipsisa64r6-nf
Date: Thu, 22 Oct 2020 05:51:36 -1000
Message-Id: <5a5abae29fb0538fe92b29b8f708d147f207d3b4.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63cf38058283395eca1324a2c68701218a2a3768)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/tune-mips64r6.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-mips64r6.inc b/meta/conf/machine/include/tune-mips64r6.inc
index 4fe3eedf1b..e53239a38b 100644
--- a/meta/conf/machine/include/tune-mips64r6.inc
+++ b/meta/conf/machine/include/tune-mips64r6.inc
@@ -24,7 +24,7 @@ AVAILTUNES += "mipsisa64r6-nf mipsisa64r6el-nf"
 TUNE_FEATURES_tune-mipsisa64r6-nf = "bigendian r6 n64 mipsisa64r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa64r6-nf = "${TUNE_ARCH}"
 BASE_LIB_tune-mipsisa64r6-nf = "lib64"
-PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-nf = "mipsisa64r6"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-nf = "mipsisa64r6-nf"
 
 TUNE_FEATURES_tune-mipsisa64r6el-nf = "r6 n64 mipsisa64r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa64r6el-nf = "${TUNE_ARCH}"
-- 
2.17.1

