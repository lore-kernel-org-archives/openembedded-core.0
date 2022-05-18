Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30574C4332F
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3576.1652871537727940583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k2WysYJY;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id y7so1540909ejr.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mWOHfmnzGOvcldlR5dPWCEWFHJBIUoyoxCIAIhWI5tI=;
        b=k2WysYJYgqicgsDQaxqi3wnNv8xgU3ed8ffCZQxQm7H3+ek4G/NNABsFcfqLfe7acL
         QITfdq3fQeXHX+KUdUtMBAwpinLS/zQdxnrXsnseyX689MXBKSnDGJO53jmswtRpDZBl
         h8U55RBzo5w0A3hAFrHrCe5I+z4CKOU2C0C0QqZ5xTOufevMlLXeOk2Xp27fwtgUMkCk
         fpl9p3gE8AFV+QRWNUG5MQnY8blNb1VfX7quI2oxEhsZp9fx+lmzADhFHwkobq4HG4Ls
         5Ym3GPW15R0XdzXBOBRHec9d5nKrsrxvG81c4JxTwIEPlcq4g+mEsyWb7XiHZXfVY/kE
         0DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mWOHfmnzGOvcldlR5dPWCEWFHJBIUoyoxCIAIhWI5tI=;
        b=6B0O8kywc894YSsZjQIzYCjeNuH+dN+jYIF6rFso1KSN0OjFoQ0x/AExvegr0KkbeN
         tWza7FCR6ikgvTjKXojDewlDxe6oXHqCtfUrX+neLapwk/jujP/dEVM0X13MxYYx5m6C
         KFmhjkeEex3LUIAtR8AfJtCGbO9Crj5rmKN+sflBbxoe33YYvTckwwMytIfPCHntlFR8
         JUVfZo4ON3mwRvPnZ3/DEg2v6tglLeLRWbxbI29FZ2GTG8Czg/Ke7Mgu5+bbqJ6TpE2T
         tK+H6rA5E6iQlMd18z2aTku3iTjj0o2pdHUSeMvg2jauNZ4IM/Tm6xtoUP1n1xhV10iF
         5nxg==
X-Gm-Message-State: AOAM533sJO/NVkmy+fKKPjna/1VuDTRSJBAB/exrN2AZMNgEtUV6k+dG
	5aVoLiIeHq0BnL1SY8rZ8v5srInN1+c=
X-Google-Smtp-Source: 
 ABdhPJw7ISthUStQ7vBm0s7d5ZeeVYB9EL5lx/K8pMObHn347oPl7hzolEZ3SnSBkdHdBikR52yAxw==
X-Received: by 2002:a17:906:6a0b:b0:6f4:d4d7:7c83 with SMTP id
 qw11-20020a1709066a0b00b006f4d4d77c83mr23757945ejc.667.1652871557590;
        Wed, 18 May 2022 03:59:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/49] librepo: upgrade 1.14.2 -> 1.14.3
Date: Wed, 18 May 2022 12:58:24 +0200
Message-Id: <20220518105843.3299331-30-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165827

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.3.bb
index 8dece946b4..2c8e592251 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "3b9a8d17188ba602d139f79b6e61305030f21109"
+SRCREV = "8fc7950795282d9c7c50071f45973006de5594ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


