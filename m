Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A1CC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:58:55 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.3535.1652871534738287932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KPi0bCjs;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id tk15so3032109ejc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVBu2Mpnw/sESXUFhSA4Gc+VG1Im8IiV5tPWs3jsCPE=;
        b=KPi0bCjssCJnvSWPq0TzQJ5luUHSdsyN5p+gb/gA5tqGSTO/tDRU9CppznN2Mwr3kE
         g9vhbr55XRNsXhyzdgD32bv23KroSF4Is2/NNC+SEiS/jwEKVVq29y85h4vJaRibIwLX
         Rcd6dvj2pEzHBjrMKyiXoCVsEs1km/sqMxUJMZmAvCDJLElUULPCWez9SlfD09ams4CG
         9WBz3TB8MGv5xWQkrEFgkLHfVUYlHcgz1jjE9vpWrPQaHMcwWkh2MKT+PIjAZC2nD+R8
         c/p0xw5utQcU3rIeAqL8PiWPIoevXVzyRIVXi2xLwTnXQ1SDtf3fhOt49O78D6be7zac
         +YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVBu2Mpnw/sESXUFhSA4Gc+VG1Im8IiV5tPWs3jsCPE=;
        b=D5jJ1M0o3jK1RSFluypRf94sVic6Vx1BcKlMwDiVm/UOoTxuOpP4rkQbrY/UisH48c
         iFvHHDs4r0VaVFh0rY6XSUP1mLyZDkks21vm/MRX/lCEiAcUbs0nWSWuMO46qjDKud35
         8u/1UDM6XRVlNdkqOrI5RHTxZLKoofBhNYJuos9nBM/uQA83beS2HgVQuxlRsTeeuM0V
         DwyHLDcs73Eqxsob3hrUX2p1q4nMj9UZ/avI8b7w2EajLelToIxZ/WJcDU4cvgdKpCqr
         mbYzHgrP26usIANJ4+ezdaNdJN+xh8eloMMQ+RZpCogqtaCHqJRL53Kp3GHsg0HjXCcw
         fp1g==
X-Gm-Message-State: AOAM530MgvDuNN/vlzqA3sIOpGQ/kO9iKtRLV+K/4hhxqA3lT3Kk27MR
	yIm4K7XAF4+B/TLyrzMUvluM9ogBEfY=
X-Google-Smtp-Source: 
 ABdhPJzdZhi145Tl6OYpX2bD4OX2euqMoE6gm/iIHWSwDxD30Lpe6PpBlRJlJH9leYEns7ck9HjM7Q==
X-Received: by 2002:a17:906:6a0b:b0:6f4:d4d7:7c83 with SMTP id
 qw11-20020a1709066a0b00b006f4d4d77c83mr23756473ejc.667.1652871533285;
        Wed, 18 May 2022 03:58:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/49] gnu-config: update to latest version
Date: Wed, 18 May 2022 12:58:00 +0200
Message-Id: <20220518105843.3299331-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165803

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 07aef75715..0b2bcc0b26 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "c179db1b6f2ae484bfca1e9f8bae273e3319fa7d"
-PV = "20220425+git${SRCPV}"
+SRCREV = "f56a7140386d08a531bcfd444d632b28c61a6329"
+PV = "20220516+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.30.2


