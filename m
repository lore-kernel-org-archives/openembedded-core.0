Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E06C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:15 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.1778.1645114215283375962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cV+nM3jB;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x5so10490421edd.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/31BCgFcPMhapVzB8KqKijNBL8E7vw97EsVb9gGI8k=;
        b=cV+nM3jBY0Py8ssGigEBFPu+IpIFSSh08NhUu4M2L1A8ayG8TeIJXptsCLxIQZHj9d
         8p6H0J+qGTrF+gWxfIwMK0NerZTQ3BSuMxXec7O9YyMaGl6u12N6S0vh0yb3557HLuau
         7pL6dBvIxW+GLmcKPXrpLvwQfGnZop+wyQ45Wg0VoVLO1wNKThAtdepn58FhJs84uUGt
         pmBTRNg9UuzKnJTbH4C6vbyikQVVpv5eGjKQ873E6y+IS8cdT1hz6PIoJ1/D1gHfjwX5
         OTqGXiPC3p1iuJ0LAIzcm5c3H1RtfXyT/cxwXwHB0hTN3sw1/TNzscikaPiNAPe0Ngsw
         oaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/31BCgFcPMhapVzB8KqKijNBL8E7vw97EsVb9gGI8k=;
        b=TJcNymks0suHG0u9mkh8EcEDCuOw+bA8FCcLhR+d0fi5LeEwbBD+v7m+n3DerDvvx+
         OVJLbcSEn071nKLC0uCHhnMJ+bjHvEn8e8r63fEw9G+tiEF5aJFmvyZoPfCSQd0IOeXf
         SMUfdFph+b3b2bnjW6XHYCadmUzMq4mznddC/uSOklbCYlyce1Pmd4F8Ussbfu+oOPiT
         FuuZH5L3leVFYCLY0GApPtZTY+rTALuz2yxrY5tr1BSJiIqrJNtV4rWy4iT7nPmKekrb
         EodrYD+4pbIdR1idrVlj9yD3vW1PI4EqkhOooBN8BzjYOh3W1k+chGT5Hso/iXf0kKM6
         RBAw==
X-Gm-Message-State: AOAM532uQjdJZ/la9G30U7tMoN+//5e9g042dzX5nPAvwS1xhjaf1mqf
	Ckh6hLwnZLqKGROxcx3/6bQmTHatpNM=
X-Google-Smtp-Source: 
 ABdhPJwBbS9a7W5YRg6CEONZCpbwSydg1KM0prBaQ8SKbO3ZhzxFXQcj3AZk7H7jfs8EOSSqaTcg1g==
X-Received: by 2002:aa7:c041:0:b0:410:ee83:3c91 with SMTP id
 k1-20020aa7c041000000b00410ee833c91mr3355873edo.407.1645114213904;
        Thu, 17 Feb 2022 08:10:13 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/28] diffoscope: upgrade 202 -> 204
Date: Thu, 17 Feb 2022 17:09:38 +0100
Message-Id: <20220217160939.1424397-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161844

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_202.bb => diffoscope_204.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_202.bb => diffoscope_204.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_202.bb b/meta/recipes-support/diffoscope/diffoscope_204.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_202.bb
rename to meta/recipes-support/diffoscope/diffoscope_204.bb
index 8273056c59..c06c38a16d 100644
--- a/meta/recipes-support/diffoscope/diffoscope_202.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_204.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cf0d4e1505818403ec8678fd9b8b4c3b955fb1d041c5d826e69f20021bff8a1e"
+SRC_URI[sha256sum] = "cc99eb4cd9555947b11d6abb7ba83e71234f92ad1372e3b61e934115192ecb4e"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


