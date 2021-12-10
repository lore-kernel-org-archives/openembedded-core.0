Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3BCC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:38:40 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.8706.1639150719189622127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FZjeiKxy;
 spf=pass (domain: gmail.com, ip: 209.85.210.47,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso9998432ota.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VuSakwRVSW7ORmZcETgzIasPg8aAozCfBBTCCzdiW2c=;
        b=FZjeiKxy0QD1cYk8zl2tn5xCNFspPtvkXK8QvwVTR344CMe8uWys1C/fRimr+6G6ID
         2zPT38QcJ0vpDF+9WaBSeV9NTcr4QyHSesEPEfPV6WLSAZPOrpA+hInq5jdlAbw8tTu2
         WZXlET+i3RnbzGarTStZQTW/G9w2EMHFgUexepCLNYhyCJOtYYVVCfBWEeyO9DZrYMeX
         nQ3PJf7QRoTnbYNwzddG/jNAZUquBAojmiy9RiaPv6+mXk0X1IA2aq+JCJFKgvZcBt7c
         Uug9fNmx2/ROGEDj8ebN+Xs86cQ58GgvwrMO25RNNanvy05mPSc/CU06Af4xxzMz7IHM
         PkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VuSakwRVSW7ORmZcETgzIasPg8aAozCfBBTCCzdiW2c=;
        b=dx6IZS7KGNdaRDkabMnVVWZoK0pJwE/R3emZp8wv6jFnf6yVkusEyOrGdD+DB2g8Ya
         STmHXcpcMfV3o9sJwPqi3sACTNscs91ROTAEiSR+kyAJshvLA1y3uiGRXQ5H/NmDh+XG
         tV60toB25l2h3V+uuwY1fiAOncYc8wupGpSyYWTPq6bv504lLDo/10SHbyNAK39OjBWm
         87FDiF5rGH58OoaeYeqvFnt3QEZt3n4aTJYEam960St/E5yePol9RQlIp0pOyCHLPRbQ
         hqkkNKRY56vmGfJliiQWllrxQxI/BXxP4M5bKffWVOGG89t6uz6mLK9rDtKp5dQBZWGo
         7LTA==
X-Gm-Message-State: AOAM532Sfydrn9TeQMA1ba490rcNbu4IGPSvaT5T8wQeCwcVppjPmgGS
	pBRl3eh2zfQ3AaoAEDc9KHWZ1cZtlro=
X-Google-Smtp-Source: 
 ABdhPJycqs+p4FkcRhzL36q+fIpSusnaRPAJXyTxXSSM4d+4F/Dw5tiipooAVdK4zFENqLD8wth+Lg==
X-Received: by 2002:a9d:4e89:: with SMTP id v9mr11945891otk.352.1639150718245;
        Fri, 10 Dec 2021 07:38:38 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 y28sm318162oix.57.2021.12.10.07.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:38:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] epiphany: Add packageconfig for libsoup2
Date: Fri, 10 Dec 2021 09:38:34 -0600
Message-Id: <20211210153834.348522-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211209204432.3924129-1-JPEWhacker@gmail.com>
References: <20211209204432.3924129-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:38:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159547

Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
Including libsoup2 and libsoup3 in the same process can cause strange
runtime failures, and the latest release of each major version will
cause the process to exit if both are detected on startup.

The default is changed from libsoup3 back to libsoup2 to follow
webkitgtk.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_41.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
index 09210b68aa..8f3bd87340 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
@@ -30,10 +30,13 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            "
 SRC_URI[archive.sha256sum] = "b39d1825492595b0b74c5d6a6686a857f9419dfa4c02f8013c297bc870e26dd0"
 
-EXTRA_OEMESON += "-Dsoup2=disabled"
+PACKAGECONFIG_SOUP ?= "soup2"
+PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
+PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
+PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.33.0


