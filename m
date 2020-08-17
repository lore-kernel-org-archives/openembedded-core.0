Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.39650.1597656790676906592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 02:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZIZC0H64;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id w25so16666236ljo.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOB7D1vAX6sebMezoqmtoj1dZtxn61iSEN9S05TZmng=;
        b=ZIZC0H64MHve/xJ1yebb8LSUJOxx/ostN+aIn7a02r5/BBRBfQKGQxvIjwCsp5m8g1
         HFOiGdIUZCsMeHPtXrgeRzQ6E9BdJmhDFijWp1VuuktFBG92oG4XV9nzW0XoM5jZzSDf
         IXUMmNDk2/84YtsGtt187EA1xNNdN05KIPUR2aLHXEqojX9JkYkxJmiTkn4wpIyjmtNH
         DZIhi0zD+53Bt+KIrQqXKWOoW7e/+2DUHO9Fzvg4uGqhxh8Ikh/1GadpRqNousHq6RFk
         6uhoiyNqYkKOnxkwPtmHvA3WRXRghY4iq7fc3cfwsFsUSgclUwMcm2VvwWyuUG3ZBjcB
         JXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOB7D1vAX6sebMezoqmtoj1dZtxn61iSEN9S05TZmng=;
        b=aKURJDuiFqqjr9ZaaebbCfh1lOMSLywcGJSJydub4jEDfWVKJG5we8Bv2mUmdXijTQ
         6RiRWLSN/7WWAexQZKu/cfi/gArGByPXoy6k/8sxCf+WvphOuqj4DVru0lmbTvTlJSy4
         qm1MzduZH93SUcdEhZOmmoaJPEuiVmOgUN2BFfnyDgVuo1fvOf+Rn65HcsgBCqJ8BmF6
         xx7yfo6w12VK4SVa9y66OXRHG9YORfYMXr62CrPDsGTgj5VfrPvuo/bsFYWl/4GLbrA8
         MNHUVmuUJBd//6S1QgsO4rKJu9L26qTBTCEIoViLhPM9VcqfzihHljOyZ17fFu+jaPIE
         Nf1g==
X-Gm-Message-State: AOAM533gn4lzvLxj0EEPJiMKLupYJ+gwZ7Z0m+D9lCPhnkDXhqihhdZl
	p1Kq9P+i1sH1UYaoFeyVzhJAfZhTiEvCZg==
X-Google-Smtp-Source: ABdhPJz6F5r53fJf76KvlfBYnJGl134DmvbElYFznJMJYkD0qLCIuWMsL0w1ot7ykEdxm3NZLCqr2A==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr6594408lji.215.1597656788869;
        Mon, 17 Aug 2020 02:33:08 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u20sm4980097ljd.135.2020.08.17.02.33.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:33:08 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V4 2/3] multilib.conf: add u-boot to NON_MULTILIB_RECIPES
Date: Mon, 17 Aug 2020 11:32:55 +0200
Message-Id: <20200817093256.21644-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817093256.21644-1-liu.ming50@gmail.com>
References: <20200817093256.21644-1-liu.ming50@gmail.com>
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

