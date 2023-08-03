Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD7DC001DB
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 19:01:52 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.2606.1691089309835174999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 12:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K/5Aaq31;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-56334abe325so712775a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 12:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691089309; x=1691694109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHj9rvC5S5mvDziceCdxZLOuw+GSZcRIgAdnb4Ixw+A=;
        b=K/5Aaq31hwyCDQphe13ySaiqdEvpLGj7WAwKuSsZY8wdgEx2QUB1KArkpr6r6VsNR9
         T2yAse00WAvK4FCDdhckYXjudcqvADMbhrfAKsaqhHQeGWLYoN8Tk4WdtZhbUKMlFp1c
         VyP3H/GcgP4373kkMREEXcdQiGAB0AzCFYfx9/RkjN4oPRB15tzoMiX0A5aH+npDn0r7
         XUvehgP7pD1z8QZfJbvm/x/oS7pCKOmZH3RJy/EeODTJWy4ptffuNiA4d5trA6Yddv4Q
         TU2XN8dg3h5kZkcYx9LD8LsDDrmaEPfn5y5MVFECDKu1BWJA4lG8ZFXy00i5ypX9L8SR
         vscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691089309; x=1691694109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHj9rvC5S5mvDziceCdxZLOuw+GSZcRIgAdnb4Ixw+A=;
        b=lZdWhQyA4OFQWrhEwDBSwkT6JTnJMXjW+mR2BMTMYQ3yXq2lLzw6GXz3qQUcfnIwg1
         I/QO21m7dCZbJ4yrFYW+kTTdyKrnwBA40KzvSXu3GNSimzGge/SKv6Jn/2BxDcuMXmq3
         6Qi8VRKZ1XTFmA9Mlmyl7kg+6iCw+vJRLylG3idbcTvb4xALa0xSnfjA1FlCYzMMxiIc
         AGhVT6P8Z16A6Xk/4XEBf+/uFOrvybuWwDQdhKMXhvMBHmPsKmchN7C2PlafTqpc81Ud
         z9TnL+VbBOObe1Gfxhiw8yfE3YRfk0W2fBJDvmACt9GJtSheSfcvvvzmX2UQEF5POMQE
         CAEg==
X-Gm-Message-State: ABy/qLawEHtBqiy9FW5JUjLNnxQ67kKbrse6M6gkiz3E7itsyjR/2ymz
	RIkFRHDiXmbeJzthv+hCobxTcXCW3os=
X-Google-Smtp-Source: APBJJlGcqznGrKAtGL4ZwzKdvzYJa1daKLkuzIpGGPczMJxzvz8RLfwBZbdG+djJ4hOyNZ8k6q59dQ==
X-Received: by 2002:a17:90a:dc14:b0:263:3386:9da8 with SMTP id i20-20020a17090adc1400b0026333869da8mr14211238pjv.49.1691089308681;
        Thu, 03 Aug 2023 12:01:48 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:70d1:27f8:1df1:4ce4])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b001b9da7b6bc3sm195537pld.184.2023.08.03.12.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:01:48 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-chardet: upgrade 5.1.0 -> 5.2.0
Date: Thu,  3 Aug 2023 12:01:40 -0700
Message-Id: <20230803190140.2983341-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 19:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185497

https://github.com/chardet/chardet/compare/5.1.0...5.2.0

* Adds support for running chardet CLI via python -m chardet
  (0e9b7bc, @dan-blanchard)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-chardet_5.1.0.bb => python3-chardet_5.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-chardet_5.1.0.bb => python3-chardet_5.2.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-chardet_5.1.0.bb b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-chardet_5.1.0.bb
rename to meta/recipes-devtools/python/python3-chardet_5.2.0.bb
index 9b2644e6481..cea7ebc94d8 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.1.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/chardet/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "0d62712b956bc154f85fb0a266e2a3c5913c2967e00348701b32411d6def31e5"
+SRC_URI[sha256sum] = "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
 
 # setup.py of chardet needs this.
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-- 
2.34.1


