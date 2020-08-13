Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.7179.1597314099444239157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 03:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U4bGachx;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id bs17so3783089edb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOB7D1vAX6sebMezoqmtoj1dZtxn61iSEN9S05TZmng=;
        b=U4bGachxhmJMTLT8P41YcGTxFRnCKekzSiCPhHwKUaZybDigDdXr2aRCV0YspYtYN7
         EzhBbqhyIwh9WM5Nvxr/EHtyTsSXrVxH7IB4rTxOxPk1OQJkaxEptelAZifM7v6Lh5MA
         RJ8uTpJTELnFYxFaMIaY7XqEwrz5uOsXBhrqz2bg63kR2voYleTCHYFjKKkiMu3UyREi
         FwlH6BSIWKAPzWEFYBo90e3NTrKLzrTrKLp9UXlc59pos47Lm5Gz5x669UOEY4qq5Fr1
         1Ji4p7f6Urbg+fr+APWASYSqAJ0vNUrJr6KSeRy8SxJuzdTeKPjOrULuySIKFNhULXG7
         flxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOB7D1vAX6sebMezoqmtoj1dZtxn61iSEN9S05TZmng=;
        b=YaKvSXZluDnicQiqOFkdB3LZgcRujyhM441SmeBJDDnYYRyn7mS4jygGEeCQZ4oHJx
         tn0JkYNOVoSekmZnY2mlUP18aAAPp/JDlgiQd+1qF9Nkbj48YJZzlGhbRC661dejTMJZ
         95tvGC2Pr1/jq7NAL3gfJzuzYAdCNCMNqVgXIdkNVdTMBX5SFxUJQJRYWjVoWrK/qAHI
         bc5bOuxDmWa/nl1clLurF91Vc5Q0QxToMHZMTYEYbTc/JuvA7KycifbXNLCVdMoJxaFs
         zfXWdMqzOD6zFk232OBpuk5SC1RQSiPd+IqwYKw4kLtxEy4pwhiEgE9DtdVulA5Tmh0z
         oBZg==
X-Gm-Message-State: AOAM533Oxka1Q17zrmv1BQyR+zfpHguDiR5TRcOq4XsWTKcmOEy/7gHW
	JTnrydmCi6DkncXuZTHXRMPkmW8fPmA=
X-Google-Smtp-Source: ABdhPJydknQBxiQTdYnGSALEzcLftZCU0bxDS77FL+xRQISsGVQCO72q6Ufb0cYVcSYX46/HcfU1Kw==
X-Received: by 2002:aa7:da48:: with SMTP id w8mr3869036eds.329.1597314097723;
        Thu, 13 Aug 2020 03:21:37 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id v5sm3288017ede.13.2020.08.13.03.21.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 03:21:37 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 1/2] multilib.conf: add u-boot to NON_MULTILIB_RECIPES
Date: Thu, 13 Aug 2020 12:21:16 +0200
Message-Id: <20200813102117.8726-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813102117.8726-1-liu.ming50@gmail.com>
References: <20200813102117.8726-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

u-boot should be a non multilib recipe, add it in NON_MULTILIB_RECIPES.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 58f2ac5c86..d231107f8b 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -30,4 +30,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
-- 
2.28.0

