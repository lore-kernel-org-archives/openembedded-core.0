Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7719DC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9128.1635325673601118963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KY9fkuo+;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id z14so2877817wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oiVvTlYQkAW+Whf3voH5wzksZkJlXUzwBJuQDzqdD/A=;
        b=KY9fkuo+eeNosCaoMaBB5Uamaf3c+KfmRH/P9uzH2/HKXKXx2YGQRNXJF0QvPa9s0t
         gXtJPhpGIyV9hIZkJYT8N8PjtO/aNoLL47hrtgykUxXMy8BYPfS2JI7RBqqR94iUkLph
         hxQbStTKna3YdkucDIIgPFxjkG4YKJr2JVQvqXAsou/Nn9c2fgnjJZBLmv7B4ZWFv7qh
         Ti7sekj57GymHwdogN6Kwd36nCxSt2r9fSMRHDmPaa0DTUitt9Qa41B+CJafZ1N1TXN7
         V+SccgPsBIc2ISKOVn7SIkIviBU4iATMc3RdCJhQMArlndemK8Jh9x+fPVORoFEfy47e
         yS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oiVvTlYQkAW+Whf3voH5wzksZkJlXUzwBJuQDzqdD/A=;
        b=DrSmo579UahsWFH1dNWY7pZOXfLWCgp1W7lqfRAILVLlvDDjxosLMvXExv02lebLhM
         WzwhLdXDPY3AAk2Ggc/m1i5ouVMq7Lj4lwq0AJBjgKnw20e4YzXyhgapJk2HWnvF/8JM
         j18NJXiVx43v/WXSb69EYf9VakwqmzbnEZiGpbRVJFxw7WRCFgdAWyrcHgqQKqOH7D6N
         VTRpL1EtnyWTfqWco6Jma44WU5c3PCWl3px/CvI0LS7RPqpsgV5YVZnQSMO9X8ZoL2BX
         N1CQlmvCRyc2WIMKc5RfrPW6+yRFMy9Z7L7mHg6ZVmOOWmMe617uLdX2AiuDl/nvCNQ5
         vhpA==
X-Gm-Message-State: AOAM532rgnOKmQNKEMWzNYhL7Q80zqmDWfSu1hH+yahESSL7LVXrctY1
	AAJuZ+KAcZDL6RaDGnpG/6Jdnwm0EAU=
X-Google-Smtp-Source: 
 ABdhPJyCISqZLeiSpfdHtnYH4aI9UY39OflA8KJVSJt+B3Ozuxujb+SATYYEezwUOb85JDle0BvESg==
X-Received: by 2002:adf:a48e:: with SMTP id
 g14mr38740532wrb.327.1635325672205;
        Wed, 27 Oct 2021 02:07:52 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/30] asciidoc: update 9.1.1 -> 10.0.0
Date: Wed, 27 Oct 2021 11:07:27 +0200
Message-Id: <20211027090736.2546759-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157497

Convert from autotools to setuptools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{asciidoc_9.1.1.bb => asciidoc_10.0.0.bb}         | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_9.1.1.bb => asciidoc_10.0.0.bb} (77%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.1.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.0.0.bb
similarity index 77%
rename from meta/recipes-extended/asciidoc/asciidoc_9.1.1.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.0.0.bb
index f295b80733..f7fa66851d 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.1.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.0.0.bb
@@ -8,8 +8,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=9.x"
-SRCREV = "08b430eb317c584aa6f02a3c4372035a4d8b92c4"
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main"
+SRCREV = "4667219e473a24e8e645eb9b9fb0a7ddba322f44"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
@@ -19,14 +19,9 @@ S = "${WORKDIR}/git"
 # opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
 export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
 
-# Not using automake
-inherit autotools-brokensep
+inherit setuptools3
 CLEANBROKEN = "1"
 
-# target and nativesdk needs python3, but for native we can use the host.
-RDEPENDS:${PN} += "python3"
-RDEPENDS:remove:class-native = "python3"
-
 BBCLASSEXTEND = "native nativesdk"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.20.1


