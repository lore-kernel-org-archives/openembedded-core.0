Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F03C48BD2
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.7188.1649904758046603757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O4817FLR;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id q19so3568748pgm.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lZIhWWGwqkmxdebA1hh23//gl/mr060b21s3Jvn+Tzo=;
        b=O4817FLRKt7Ea2I2fMqflP7YrM2NQadXf5sB9B6mn9dyhkXDtmfezZu7nrn2EVTMmD
         4t/XWyyromXalCiAlFKdai87qJu/lOZPv5HxAewo6FrR1sBNk4vnuk9XPv5pBsPqw1bp
         LAoGgl4qYnXAzep7R9gi1mb2lKxFIC0zo6qgE9ysH5jQIhC0Ir3asr/xsUXlFI0VdqIN
         Fkna/ycDcn3Db+iASZe1Z25zcZfo6wZ/c+yOGI0rin4V1+FrDQtcCqz3ppl0jwi4uBdz
         gcWfzaydTrOZdPtu+xhPbqwAG5F2gVXd2yV3Nk+wYqXY/ngSnFrWQDM8DB+5DgvAeUxf
         8pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZIhWWGwqkmxdebA1hh23//gl/mr060b21s3Jvn+Tzo=;
        b=wTaSfnmINxvfeNtoPZOh+ZxiY3UPw+D9NQzGX6yoKvmM+NXZwnGTIT9pjamJNAWgII
         yGmJN3BuisWFa89IbDObDi+ViVxXr2qjkwv6AQp9/TNOAVWoQTF+acYMkaRIC25s7O8u
         jKMqioMU2+21M9IFVs4AvyHuYyZzm2k5VWwN0QFtsD3QeKW+p+d1wYDB6fOMOC/9PHgB
         lXcHwcdgxMGR3paUnued+bG7WrW88lUqzTjRZ3T3TkQjqkkRUFFpZV867rbgNgXytaTD
         gm1oUAH2Ng33ZMxrtX7I9EFOQ+LMM+Agz+h0VuSd5p0nTV53dt/JM1j3ieWuJU08/8J9
         Oc2w==
X-Gm-Message-State: AOAM530wu3rZhyCfdvzST+L4q/WAQVIeNPZwMaqPANwcSta1OivR2isZ
	9wkbkp68TpxVM+0DGSYWmqb72TyTthQuUw==
X-Google-Smtp-Source: 
 ABdhPJy6KOdyJjXo3Wujd78MTXgLv7p27/tXMlFo0nnYr3VsyaJDyXqfgoloaRUSJhqNoCZnCeuZzQ==
X-Received: by 2002:a05:6a00:198a:b0:505:91ad:782f with SMTP id
 d10-20020a056a00198a00b0050591ad782fmr1805071pfl.20.1649904757345;
        Wed, 13 Apr 2022 19:52:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm453735pfx.12.2022.04.13.19.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 19:52:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] pango: Upgrade to 1.50.6
Date: Wed, 13 Apr 2022 19:52:28 -0700
Message-Id: <20220414025230.1166825-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220414025230.1166825-1-raj.khem@gmail.com>
References: <20220414025230.1166825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164381

Changes in this release [1]

[1] https://github.com/GNOME/pango/commit/37a427018c92a2bc679ef104097e07a619609c9c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.4.bb
rename to meta/recipes-graphics/pango/pango_1.50.6.bb
index 0ea621bf670..b1b9054234d 100644
--- a/meta/recipes-graphics/pango/pango_1.50.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
+SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.35.2


