Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68900C4450E
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:41 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14873.1783866572989314817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=LnP5ExM5;
 spf=pass (domain: underview.tech, ip: 209.85.128.180, mailfrom: vince@underview.tech)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80a123ef90aso37555077b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866572; x=1784471372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkjp/Ui3z0NDyXIH3nQu13Rw8g+SlquhdVP/pxEgEuI=;
        b=LnP5ExM5B5d7cVPa9TwIjkCwyOLSeFym4XTQsIyowE4iKN9Hna5hh7RHGea9DTyVJV
         4hc40CJGpCIXMmqF5jpUuZ28aeGCnKMS1w3NRamD5/fgYkl2KUdUcpsZ9QzANRz7AgxP
         4urgfr3DSOqMTLcKcaH9269f+UEiYndsS4ohjduZN0nUlbsBkjDaXHiVVbGAHkyA4kcF
         cEmTaC6xUE0M9wIot/O2ogl5E9INPPHpBeQowKLWyFMc98thOS40QauSj9I8uUglgB2z
         x0az43n74/jkjUgimlCeNjWVAbPXzZyE8ZSXITwoWdM4YlfNRMBGJMXKotibjeof8dFC
         NjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866572; x=1784471372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkjp/Ui3z0NDyXIH3nQu13Rw8g+SlquhdVP/pxEgEuI=;
        b=ASTdkRPTF6HsBXxj3PwE8UYTr4kRK86VaBUF/JWbcKOCnwZc2uwvvZ+cxgTz8O/kvt
         QdusLtNU9+T0Y8sOuV9i7cgX/eYdCbxilKqL8/Fjswxdh5UwXxsAt132h0Np5VkXrBid
         v05oSiqRU+XtbTTcX1fQ++iXtu7aK56QLe+MCrbA2JiNprYNU9l4dGQhfcRmGA440IbJ
         4zVN/zu7dbB7f/cf73jmC7Z5jVNpybTJ2dz9tjOxivjMkaQuAS40AKME5WoAZLnUa4fQ
         Wir76FIXz/YyRv2kCl2CozFsy9QTXskP9NTbJkz4LER3ZW28hsSteXpN+h88yoNLf7a+
         jjhw==
X-Gm-Message-State: AOJu0YxKOYX0NXgxN0A9/W46ylZgB/NWAo1qnM/Ney5JrMl4nEOtnh5s
	v8vDheSoiY/0qgMYdcmc4pX9XfAXj9HydhU9mQjw2dta5w8Tybnwi+J3pp34s3CzqAmRPNv++FS
	RJx8yraU=
X-Gm-Gg: AfdE7cl654B/2Fiq7UE4gRReKfhfkwLv2/itscL3LA1l9F1HqC+OWOObnih4PVpBL+0
	Oewd+NVXRF+ODOkEBZ/gRJ/wzGfsL5Ja6oRydC8iX0spIfIJnhBC1mIMFYw9tB7Y0yE0N2yIxrY
	h1u1+f6RZcDPv1U4oWPs9tYiOCw/Xcu8lMSks11PmnOkvYS3KzSuWhDmIR+9FiAE93liRVBwshn
	oydg3AD7EvmLRnYVAx37cQqNObnN4w33qk+0syNswHUjO8BTLT79h8HrH/XYLL0sW70UwhhOjcF
	HP2mqT9RDxOHcd/Hnsx0aLAiHiTpTlJNDL7gWYRRQJBtCrRoh662K1sMeZkJbS7mIZfpSSl5Gmh
	wUH3z4CU9Qz/WergaUeoV75aGdJ63+iSQFurS7FLpEvDWZC2R/JJXfMIoVaU0RjkzLaSDWNqdiL
	I4MwgoO0OErb4Ryw==
X-Received: by 2002:a05:690c:4491:b0:80c:16ad:2f16 with SMTP id 00721157ae682-81e906eaaadmr40695127b3.8.1783866572086;
        Sun, 12 Jul 2026 07:29:32 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:31 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 09/24] ofono: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:01 -0400
Message-ID: <20260712142916.2573370-9-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240775

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/ofono/ofono_2.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.19.bb b/meta/recipes-connectivity/ofono/ofono_2.19.bb
index 74fa70f609..defbe5fbe8 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.19.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -44,4 +44,4 @@ RDEPENDS:${PN}-tests = "\
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)} \
 "
 
-RRECOMMENDS:${PN} += "kernel-module-tun mobile-broadband-provider-info"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-tun mobile-broadband-provider-info"
-- 
2.43.0


