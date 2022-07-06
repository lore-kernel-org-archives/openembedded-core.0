Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABE8CCA482
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:52 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3675.1657094866686253270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eAJdJC7k;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id h23so25607591ejj.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xmGi2Ope4Ok+ecnHKjm1X1BEHyeo6DHqqeQsXHDHcl0=;
        b=eAJdJC7k06sgnLI0uHaAC34R5p3Hydq1pSDsJaYcr2wVhavBTRZMJvUIMLp+WGffFc
         ns0zN5JNgzXIBu5LBkazKbiNBnCkh0aho/MJio/MVVXICgyTyGAWb1Nnzlxeo51Vw3lz
         xyehifTGijuIV9W7U95BW0k+lqvm/lFkBtyBKU9bve17ilIJspM0g19mptORTAP3Uii/
         HjjWkAZRJQQF2HSXkZE6RzKvYkswioY3fufQKmn36qJmaF9HK2Sgp3CluRpE3O+EOisj
         cQnAJKc4DN9KFeDUizWsWCQJVviHFoJ73YOhF3w+0S6vqknPOozlOm768pSgfeHVB+5U
         fqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmGi2Ope4Ok+ecnHKjm1X1BEHyeo6DHqqeQsXHDHcl0=;
        b=SNh25lqWFVKPkV2RZV9nXxSvyOOfLoS2P8KA2B9PzoINL1R4oQLGy+51WYCKJ8whyl
         N5gC/L0mBW9PFwhKsI51Gb9Lzn7sz/9ej9kizkmnJ16FabYxW2W2pFRj8I6xIWkFKnaC
         l0qR46IQ+drn41/rAUnZj6j5e7HUdB0fPvs9KJaqt0XWmoQUyIEc1k1cIpMGsiofTlGI
         ooKUJf7ME+q/K0ulaOFMRdvHEi6d6YUzxQZ3LNLGeOZgfEce+dDz5jo2TwejebSA19ND
         9ZOwm2KTal97Mt71uVUBKuuSlFOs/QiLnhDX9+apq5dnDwx3MLwA4BzSiMkBFvc5R/+I
         A1Kw==
X-Gm-Message-State: AJIora/lH2Ds01hRQ7W2z+7oE29ZmuIIDInXVO1uHDVrFwSvts1mB4DA
	treZwF5N/T6cKEjZ1tq/wb8IadBFyVaahg==
X-Google-Smtp-Source: 
 AGRyM1uS6VQVPeWOxPrbHZsf7pEgrDys7izKH/bJbiaqkWBoj3HmskBMYbSqjR53kyBcdsRyyr+dvg==
X-Received: by 2002:a17:907:3f02:b0:6f3:5c42:321a with SMTP id
 hq2-20020a1709073f0200b006f35c42321amr37687151ejc.521.1657094865265;
        Wed, 06 Jul 2022 01:07:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/27] python3-mako: upgrade 1.2.0 -> 1.2.1
Date: Wed,  6 Jul 2022 10:07:14 +0200
Message-Id: <20220706080721.3072553-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167707

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.0.bb b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-mako_1.2.0.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.1.bb
index 11e5f326bd..8155c37984 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad08dd28df88e64b35bcac27c822ee34"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
+SRC_URI[sha256sum] = "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.30.2


