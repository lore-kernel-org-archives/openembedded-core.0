Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE93C4321E
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.3574.1652871531400334727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jULczUbz;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id m20so3005604ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66r4d6Wx9vLUkTw4csddqJSUElKJouoYtn//LPf1Mag=;
        b=jULczUbzGK7PAJuB9I8WS/ePvwEOeZhOPTK4MQsWcaaLs6BtTah0CjgPdhPFLgFAfL
         PQ99dnfXP6uRUjj3INQoxdtb6tJUsICrZqBpoWpLAg4zdlNathuPeMu1v+NQN8yvEk94
         IiVplpAhAZpdBJ7Y8bS7a57TzSs44o5WKMIetetcUmO2FDbyZkSO3SS/PG/Aiql31YZk
         mz1fGWrXGRzDMJq7+Vufx3OktPj2lNe2OUpH9dtz9RUF18SpcLkMZzwUVe9uMLMbgtaJ
         Y252nNVV7HTp9P0OK2HM6iAaKbzynzs4XY9XQlkMMZivnMUtS34FTV3mBAL8C+HbIh/4
         doug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66r4d6Wx9vLUkTw4csddqJSUElKJouoYtn//LPf1Mag=;
        b=F1vHgB374v3leaAIjas8vWVYDISoV1dtIIhsRyCX3x09qtLHCYQQpIfb3Puj5/ZkPY
         O3YgbCD1fUDIqX9AtB8lrdRf46xPIfddDEjwgAflSpV33EJfP9DUml8hkCIroxZVmlIm
         Bp9eBE0uRZpYaARX4Z2u61Mju2WaudrPHE4x/2E0nPFOcCDFLmZplNStQcm/4wRQOXGU
         fI+ahC+G7Y/vWaT47+L6FD9Z5wzgb7oVZnIggSryPryJG3Rg6otcghKAd59Z+9jUpRZa
         64X9VEEbsfqZ+XO1pIvgNw6Ilpyl8gSJfYKziVNEuS/tWefHlfw51NN8vOev75puuayR
         Wayg==
X-Gm-Message-State: AOAM531qYkYHEBV70eHPKVgUz43YWQaJaI1S6ghbaJNK41VDzfAidGj0
	LqUa5EHyBHnHC5tkWZOD2pTcoYTO1lY=
X-Google-Smtp-Source: 
 ABdhPJylWxi/bHFFoHTowMHPomUlH2ObCAmOo/OJd2+aHD3vEJYhbzyG4I0lQO7l/OSLOU5kRxjn7Q==
X-Received: by 2002:a17:906:6a0f:b0:6f5:15cf:2e5 with SMTP id
 qw15-20020a1709066a0f00b006f515cf02e5mr23143634ejc.584.1652871560700;
        Wed, 18 May 2022 03:59:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/49] mobile-broadband-provider-info: upgrade 20220315 ->
 20220511
Date: Wed, 18 May 2022 12:58:27 +0200
Message-Id: <20220518105843.3299331-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165830

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 781b9216c5..e6f216e5cb 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "4cbb44a9fe26aa6f0b28beb79f9488b37c097b5e"
-PV = "20220315"
+SRCREV = "3d5c8d0f7e0264768a2c000d0fd4b4d4a991e041"
+PV = "20220511"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.30.2


