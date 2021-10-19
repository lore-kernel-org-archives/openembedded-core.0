Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524D8C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.11598.1634657696400044003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NctYvHZa;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id g2so12486934wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R2M5uVBNE1XxPMzniVokFZ/qT3x+w7NKZrfbWXLCFRk=;
        b=NctYvHZakiD8SiEvBzyFkuZeggF+olD3QnKr/Prcys0a0QT5AORv+8VcCQRnk0IZP4
         GyKvx/VE31ouijDYNUtdnoPpM681Hd2zH1tuPVJGlpyNtyMhFzlAkr0SqRJZynivx3BA
         Pn0BtP6rjet90sq4mte0Yz1cs+ioy7+t72csllGMi/+h5cZSFLw35zyA/7KtWGH+Zc7X
         w7uABPI9vijgo8ary4mGnQ4v5BKn8igmCU1s9yx5/xO14V1anOOgrlX9QMawW9ZllsAi
         qzDNdSgK9R+Krq4fQr8FGfTQRURM/HVEja319Wa0ogEvUs+kevAsy1TPidnOzfp7vUEr
         4+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R2M5uVBNE1XxPMzniVokFZ/qT3x+w7NKZrfbWXLCFRk=;
        b=7w0dlSObQxfSW3n/svciatYqBs2Fz+xoNXKr3ZTNzzXLdSHEIWqb1yR+p7T0/Bf8VR
         RQ208A5Z1G0smk/pOfgLB4Z79oV5X+xoC1n9tpHjXB2DQusx2D3g07ouQwANNJj1tbxq
         Wixbg2lSlU3sJ8Ztbab9aKUzFaVPsBrf6N+HztZb1y+xVJB2MVidxDjS46iBfsGDzi/J
         A6SYzvi/D3CZSTCK1Ux/dTdTABctiU0+6ncVNPeLkeWeyalvlVm0aQVq4WZWUeCMbFTI
         PgAY7505NwHQ7SgWyohRRGTWlK5z2T8/u98txjFnFme3qaw5vGbVkGlc59TLGx4C4GE8
         0e7Q==
X-Gm-Message-State: AOAM5301bY0VEktGFVeeY6SvRELRzBPE5NNDwsQIWa98CcLyzFDnULxI
	nj0DFNm9UjJblpvVHJ7n+NyHK7T93Es=
X-Google-Smtp-Source: 
 ABdhPJxkkdLAnzYoA2WjXeJr5pqzqrV5Qq2AtRF6ncXMMTyI3VIjEl7+HXRL+jl/N3pMSbPKp74y/w==
X-Received: by 2002:adf:9147:: with SMTP id
 j65mr45030053wrj.163.1634657695062;
        Tue, 19 Oct 2021 08:34:55 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 44/65] gsettings-desktop-schemas: upgrade 40.0 -> 41.0
Date: Tue, 19 Oct 2021 17:33:58 +0200
Message-Id: <20211019153419.3319802-44-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157163

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...esktop-schemas_40.0.bb => gsettings-desktop-schemas_41.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_40.0.bb => gsettings-desktop-schemas_41.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_40.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_40.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
index 89751a8637..693ccd0148 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_40.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "f1b83bf023c0261eacd0ed36066b76f4a520bbcb14bb69c402b7959257125685"
+SRC_URI[archive.sha256sum] = "77289972e596d044583f0c056306d8f1dbd8adcf912910a50da0a663e65332ed"
-- 
2.20.1


