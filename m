Return-Path: <dvorkin@tibbo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B52C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 23:51:57 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.3573.1644623515940186455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 15:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@tibbo.com
 header.s=google header.b=XPe3x288;
 spf=pass (domain: tibbo.com, ip: 209.85.167.65, mailfrom: dvorkin@tibbo.com)
Received: by mail-lf1-f65.google.com with SMTP id o2so19501796lfd.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 15:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibbo.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Ux64A/kSluTDVLeT6m263AqLs3qAuRv3lpGw/Pjz+c=;
        b=XPe3x288LZxBgcrV7jYpuRYXiojzGclW+7sr1riGocea+jt6CwHKcxSRiwwYdGuAg+
         G93DzmhaD5vYzHLWtyj7u6+M9zgLiqm48esFolfdoqUuH7wtcHwtS3NgNsEV47dFPPpy
         DkqADcmyVD4wT6hVDlR8yC+D6e0GsLS8JDujcO/gQwIMM5bPK16yWlx/1qHJcDuuJ4oQ
         4r8zH4eZ70Pnjxt/cxirloUvpea5Hr46Jzm8MZP1Nknl1bLqRNw2WCc9IJRrZXdBaU/I
         0sIY4o44LA3KjG4P0+AbuJfa4L3Sto4mHUVpR0qsRHPLL0UTaS1WnTI0i2hm8hf04zAl
         vI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Ux64A/kSluTDVLeT6m263AqLs3qAuRv3lpGw/Pjz+c=;
        b=Vrc3Ws2AeRwvzLh6Hc4cV/ztotbVTUEA41JpEtzbJRUyRsNbIuCWYSG6Pphi7qKynx
         VI5K4VTGf5weE3mTtL68udzvOtIoBWnMSGs502pRf1R66f+AQwq+TTWM+68IkzL/s958
         ZQxQffXyohlNpNTEH0D/+RtR777EKOnSBbMPC5266IfU9SLOyKbIIsx4DZoKhwlC8Tlv
         Vjn/Sia1JDnjG6O/lyrnbqO8dW/ivatZjcgEzcSpMJwikLt4D0T9VFJwqrnsfAQZEm5q
         y56Rtrn3ko5E2GSC5TLzGhCaSer1EtmpwKfbiQvSTovwaiouYyDHpC3iQm5ovpCGllVb
         JsSg==
X-Gm-Message-State: AOAM5317dRiTShCE9w9Cyjk/4+VVIzp13sWkAWN24MmIziAcCuQAyRJ/
	bhclGqIl/diliznxD7K0KIZ41MEBxPXP6NmkwIs=
X-Google-Smtp-Source: 
 ABdhPJwAtsTfwvP/1dKBRJDPIhLFxs1rBiZpYSlhWvypUtbPCOBlXSCLiIBpc7DrIxnPBS/B8aLyyA==
X-Received: by 2002:a05:6512:694:: with SMTP id
 t20mr1779030lfe.640.1644623513712;
        Fri, 11 Feb 2022 15:51:53 -0800 (PST)
Received: from localhost.localdomain ([5.167.98.73])
        by smtp.gmail.com with ESMTPSA id
 a5sm1296836lfl.179.2022.02.11.15.51.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Feb 2022 15:51:53 -0800 (PST)
From: Dvorkin Dmitry <dvorkin@tibbo.com>
To: openembedded-core@lists.openembedded.org
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>
Subject: [meta-oe][PATCH] php: Bump to v 7.4.27
Date: Sat, 12 Feb 2022 02:51:51 +0300
Message-Id: <20220211235151.28044-1-dvorkin@tibbo.com>
X-Mailer: git-send-email 2.21.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 23:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161665

---
 meta-oe/recipes-devtools/php/{php_7.4.21.bb => php_7.4.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_7.4.21.bb => php_7.4.27.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb b/meta-oe/recipes-devtools/php/php_7.4.27.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_7.4.21.bb
rename to meta-oe/recipes-devtools/php/php_7.4.27.bb
index c7c00ac30..6d9db6637 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.21.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.27.bb
@@ -33,7 +33,7 @@ SRC_URI_append_class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
+SRC_URI[sha256sum] = "184aaef313fbf28c9987f6aa07b655cd1b0eae9e7e17061775a3e7d880185563"
 
 
 inherit autotools pkgconfig python3native gettext
-- 
2.21.4


