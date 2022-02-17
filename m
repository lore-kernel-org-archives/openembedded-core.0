Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D805FC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:08 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.1804.1645114208318953001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IIff/DoE;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id q17so10572149edd.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ohmbqsm3HkzC5ajfRPRDXU5+Gdv3frYC45KTTCs98fs=;
        b=IIff/DoEqX2xajX5Pds8xDkx+LsxezIrRYhha2NpK6kCnjkcZrTh+j54uYKK+ByAr+
         VA/+rugAK+epsdVzv+D3EfNSv5i/L2z5eTG4q6zbeywqeAq7UYV7wOx9RoCAGdHSixs4
         51IZ2Rx23bo5GECZGcdGC1rOV2nLH589m0ZgCHUESkqqBxj3wia7RKiFfOV59IOCcNXK
         RZy3GyeN/Kz7104fCS81ndXxmKW88r4Z6oiXjxwE6WR06b/yYWn61xrHXn1h1FaOFaSe
         JVKJntG8tnAY17QNEkPnjg+kBRw059qfgBj+0MvkIsnHFjBGtuz9CeT33rnC3cwJHmu9
         EI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ohmbqsm3HkzC5ajfRPRDXU5+Gdv3frYC45KTTCs98fs=;
        b=DhvvCd+VZDTJi/guSQGkN63OBkle/FWuPeIOGoDPeDgVbsOoQo3mF55pqywkhAtRsr
         gzXOkynjN2qeF/gy07mUQ5V83qwrCLUMWginjBh5Uyoyr2QZMTiRGGaC8F9ZO5a7CaLx
         gOu7zIxBrF1NU/nXrnL0ucTDHmOjhydiu/NmEFEOqfzykxnPzQPz4eASUnqe3tY3QPI0
         rCPEs2SGDS/9QroChYPcAp3OzBzfJIQlWsM9gqpWhMmNKpnkBqPddhOcyItzBrpyQpqN
         PslrJH72GcmUdO7TF1pELlMbESC3QxdcYbgwwczIfL9CjXMMx3Q9cQls9XTKGYYAXJEp
         Xipg==
X-Gm-Message-State: AOAM530Kungd0N2ugGCKqcUqu52uAowpDZaOkQhmlqjKN8R04mTFXXDq
	sL7YW1h02ZOWzocd6R/Q5gPCEMdVz0A=
X-Google-Smtp-Source: 
 ABdhPJwF4ErY2beQ2YCMHPLWuIKBbXWcNt7Up9shBQJb/o+Bus2EnC8b32CIp2ThtokcO797usNM6Q==
X-Received: by 2002:a50:fe08:0:b0:40f:932a:47b0 with SMTP id
 f8-20020a50fe08000000b0040f932a47b0mr3453679edt.64.1645114206922;
        Thu, 17 Feb 2022 08:10:06 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/28] python3-dtschema: upgrade 2021.12 -> 2022.1
Date: Thu, 17 Feb 2022 17:09:30 +0100
Message-Id: <20220217160939.1424397-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161836

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-dtschema_2021.12.bb => python3-dtschema_2022.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2021.12.bb => python3-dtschema_2022.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.12.bb b/meta/recipes-devtools/python/python3-dtschema_2022.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2021.12.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.1.bb
index 34d0bf61b3..d73e5810b8 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2021.12.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "f68af77fbce1ae00015c1fd2809fd20db8b72a27105c26a20e1ac0203aee1739"
+SRC_URI[sha256sum] = "1b92b3b9a31b6e4b8b2be70dbf3065775530bc4c52e991955b67be19741114c5"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.20.1


