Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C066C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.11469.1634657667535510428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T9gKfAXh;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3394391wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=921wmY62/SwIOWQhm/WyHECaxJzOMIItIWounCalyus=;
        b=T9gKfAXhDewzTrk1T5HZWEXWCdf2jnAn9TdcAvhLfC0gXK4veNMiPhVTsoHyi2il5x
         Kw1iRPWleG+xKPWLh/6l0TlgO/K8aGgqddr0N/828xYiyGwTXXl2cjHOWQie119iPWGO
         a7PFsFiZ2m8wcS3FNfGbwyeQZZ00j+5AndsdEBa+GoEr0woKh4tFvuzMXnt4lNrR/Su8
         RvNYTJtNvL8YoZbihwhe7ShZ59kc8/0Gm8oV4+oxEAmt8OEo8uhj1oZFIEnb9AGcecwd
         nJEeNibDj4uP4gbK0gEJ+KQ0+Jil6ezdxN6oBXWaV3+SEPypeZ91y4SLff2yp5jWecA8
         a+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=921wmY62/SwIOWQhm/WyHECaxJzOMIItIWounCalyus=;
        b=mGee897ModVfl6+TMF2Di0pNYbu8teogJhATAFKOfPVNcRrSFYBdfa7WlhadPO0ur6
         7qpGBuhXJRY/vg0j/Oqcwpdxq3MtCHgsb+ljySvYKbwzJtBU1BsMSWXV3otcTMRyi5AY
         Wu/8IL09/G7D18HK4fuSDCyIii4p5i1nUn2cVaSLyoNh1enWI67bp8g7atjjBlxuVutZ
         fCHZ1XDyM+5NrPecAe7xiNUG89GxBzDSUKDrJRq9xnD0gPQ4zKcLsHaHTIMifmOifNun
         9zw5pYdqIx//iXz1anR4ulbkbjK50+zPX80Sv+xwntabAeLk28OyFIqYRsgZuzgE24cl
         jmmw==
X-Gm-Message-State: AOAM532t5OWoXv8Et5f2ROOVD+WmdTOX8vwsNnuL1mBt//LX30qdc+eC
	Kyo+mbzpjv4FfuVtqM0UsSO3FMQymvo=
X-Google-Smtp-Source: 
 ABdhPJy6L4CYvepyGNXds1w05GGLz8HaGRObMczFYq4gZ9EtNCdm9EM9uuNDr+gXS+WbAa15DsN05Q==
X-Received: by 2002:a5d:47ca:: with SMTP id o10mr8080166wrc.360.1634657666132;
        Tue, 19 Oct 2021 08:34:26 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/65] ghostscript: update 9.54.0 -> 9.55.0
Date: Tue, 19 Oct 2021 17:33:18 +0200
Message-Id: <20211019153419.3319802-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157123

jbig2dec seems no longer optional; the source for it
is bundle with ghostscript.

License-Update: removed patent references
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{ghostscript_9.54.0.bb => ghostscript_9.55.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.54.0.bb => ghostscript_9.55.0.bb} (94%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
similarity index 94%
rename from meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 59cc560cf8..3993603dc6 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -11,7 +11,7 @@ HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=70dc2bac4d0ce4448da873cd86b123fc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
 DEPENDS:class-native = "libpng-native"
@@ -45,7 +45,7 @@ SRC_URI:class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[sha256sum] = "0646bb97f6f4d10a763f4919c54fa28b4fbdd3dff8e7de3410431c81762cade0"
+SRC_URI[sha256sum] = "31e2064be67e15b478a8da007d96d6cd4d2bee253e5be220703a225f7f79a70b"
 
 # Put something like
 #
@@ -61,7 +61,7 @@ PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${ST
                       --without-x, virtual/libx11 libxext libxt gtk+3\
                       "
 
-EXTRA_OECONF = "--without-libpaper --with-system-libtiff --without-jbig2dec \
+EXTRA_OECONF = "--without-libpaper --with-system-libtiff --with-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
                 --with-cups-datadir=${datadir}/cups \
-- 
2.20.1


