Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4172C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:44:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.51640.1658306692472670656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gdrkEUvZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id os14so31833139ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fS7Tlj9KjH2/IVhp+969BSZ4HFSiAXoD9tjZEFTRrZU=;
        b=gdrkEUvZFDKhvH/d+DZyL3oYnAtk7zxpxQj8JOg/yRpo/s7+ijpox2qZNVXgNjxo3c
         frJOXpSS6suymOvcXzK7TVQF0+Xl8WrIQRG10xwwIOQ3dJvK7kJ6rCjpmcKCse6Yy4ss
         e/jUAkIWW/JRsBSZ6HsTWjyEDrWXjXB3TbpZmytjMNRcBoqSgI1F1Ogi8Vgdr3Orqanp
         0+Kwl7GPsLyu+JTo20kBQkyfzX8uOPoZPmpXBjz9GnvexndCN1WjWM0E4aTXHgeNU4vU
         K44zWia5Yd2ePfXEdymVtvBpLKF95waJmHj8AuP3B5/DRav+ykf1FOcwCwF1petenTta
         otiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fS7Tlj9KjH2/IVhp+969BSZ4HFSiAXoD9tjZEFTRrZU=;
        b=pS2XtyFGjv9RQDEvRWtqlD307kSl4TrtSnQ653DD15P8E3jFQOOAvHlN17aRvvwmp4
         IX7ReNsA+txBJFllzInNhT+mGhjcDyoBORKmbxeVbijhP/HUTL2MBP4fdAJCjVFVAeX7
         yovDe53ZbcUiTIxlHCDZShEN+WBFw/1aS9PSrjA8Hbf35aQKr3HAeKghsjAWhOqmrYGW
         5oY5l+Y9MF+eErOX+rk8lfz5oRiiWJqSAJQicoSMHwZEa/nVFFj6Fu6dJlp2FkIzD8/B
         RY6sc06v34esk/PncW8fbOFAq7hDeHCFqUp46nJ2fliUEqK/L/mH0KOMqHeN+shM4z2b
         FNxA==
X-Gm-Message-State: AJIora+JpC8COIhw+lB4pIcGms+IvnNWIH7FhSgIODGEYCdRNQ+EVLGi
	ADrCuNwtKFoQYIaYXGkRSkuC6/h0iCc=
X-Google-Smtp-Source: 
 AGRyM1u42n1ak4aQuKGBW3+WMKS2UXh8+sn79aBwD3BD5UhL05jvI1j2v/OLshmdKD7VMTtLkulFPg==
X-Received: by 2002:a17:907:6890:b0:72c:7533:8901 with SMTP id
 qy16-20020a170907689000b0072c75338901mr33686898ejc.100.1658306691010;
        Wed, 20 Jul 2022 01:44:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:44:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/51] libva: upgrade 2.14.0 -> 2.15.0
Date: Wed, 20 Jul 2022 10:43:57 +0200
Message-Id: <20220720084442.2940187-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:44:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168300

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libva/{libva-initial_2.14.0.bb => libva-initial_2.15.0.bb}  | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.14.0.bb => libva_2.15.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.14.0.bb => libva-initial_2.15.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.14.0.bb => libva_2.15.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb b/meta/recipes-graphics/libva/libva-initial_2.15.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.14.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.15.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 148bb03b5f..956cd50756 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "511e9a74d1ccfb548bc192290603082c11074ac59b17aadfd5d56a3f93e58454"
+SRC_URI[sha256sum] = "258ed409458d3e7a000e1908bc852619615ee6a933359c745fcd93eb3e461eca"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.14.0.bb b/meta/recipes-graphics/libva/libva_2.15.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.14.0.bb
rename to meta/recipes-graphics/libva/libva_2.15.0.bb
-- 
2.30.2


