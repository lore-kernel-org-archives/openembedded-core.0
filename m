Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529FAC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11403.1634657699249772112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pZN9Yn0o;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 y16-20020a05600c17d000b0030db7a51ee2so2295395wmo.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yaeI2svu7xeS8opAo+lNiTfMy8IE8xb9Tldmy8jCBW8=;
        b=pZN9Yn0oX6a2WQ7qscjGqPvydY662bIpUmC5q7R/eAfJ75R3Lpveb/eHyzxoeatXmN
         mI2zA8Mj8RRGK3wDP6ZmuTIrUABuphKUwJz2yqqGTlj0AbEIBDWyKy2cXJ3Wom8ylQYU
         TRx8wasF0prSdhhXAG8w5p4AoFwpAq+5IEodqxc4Xr7Vbzmm14sbh5mcnEzgClxaKpp/
         X6/vBv3wxtV5dnD0bjdDI9SnZ46kOTeA4mFfr9zxmHPIT7R4hX3M0/uQqqAOV095V4nn
         iKm3uOSooAhAVqBp4PUi8kRDaB/2wE6hBYV6LBkMBPWNgQfaoGqiVxpvy2Y3lrGbgvMG
         cc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yaeI2svu7xeS8opAo+lNiTfMy8IE8xb9Tldmy8jCBW8=;
        b=GqbQlSb67+28d56K+a4mb7zt/squbFAffVxbMLN05M/D9L1kVcN9Dhf8NGXclBh20i
         T8QqTyVsxKM+Eu0UlyDbVs7GiiWagQF8wqvqjb8KBTIR5K6gqFhDkrVqzzmbsOEcKMmZ
         FIetK/aELOEbtto+Qu7Rx1ZHSQYw2DJixiOIlmWc3+sOX6RE/3wKDk8mMeIRODa+NfOO
         dhTpbAKqgjhdP625uSOZrMS8Aq4Gf4Wbj2od/ltQRG6FqlROiRmPkb0A1ubPBslYcygI
         H/Qk+aqEkPFRwXL5ILqX5ELX+emDAOmi7FPkujNnMUfPzfe9j7f4jEwoGNZZmivhyOat
         Qm5w==
X-Gm-Message-State: AOAM530jscs4tM/ukK9dsf04tgJ8+qVg7WudeAsmjfhG+8O28LVTQEKd
	mcA8vcNpyGo4qFcONzXB062nmc2bi0I=
X-Google-Smtp-Source: 
 ABdhPJwLVYHdojNOwgvPG93m2HBdA93LhKDFx0BGsd34syWkhU55UBNG9MHY6OIKz9MZmAdYnExeFw==
X-Received: by 2002:adf:b355:: with SMTP id
 k21mr44807049wrd.380.1634657697853;
        Tue, 19 Oct 2021 08:34:57 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 46/65] libdazzle: upgrade 3.40.0 -> 3.42.0
Date: Tue, 19 Oct 2021 17:34:00 +0200
Message-Id: <20211019153419.3319802-46-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157165

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdazzle/{libdazzle_3.40.0.bb => libdazzle_3.42.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.40.0.bb => libdazzle_3.42.0.bb} (88%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.40.0.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
similarity index 88%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.40.0.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
index ff9088a62f..1b6109d218 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.40.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase upstream-version-is-even vala features_check gobject-introspec
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.sha256sum] = "dba99a7e65fa6662c012b306e5d0f99ff3b466a46059ea7aa0104aaf65ce4ba5"
+SRC_URI[archive.sha256sum] = "eae67a3b3d9cce408ee9ec0ab6adecb83e52eb53f9bc93713f4df1e84da16925"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.20.1


