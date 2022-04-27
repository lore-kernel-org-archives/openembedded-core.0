Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AACFC46467
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:27 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.5855.1651048826096252627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NSAYtY0z;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id p18so1086747edr.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VfhBUVK/ovN3goBcDFRvp4sLmEI41Qyk0820v/SAe1I=;
        b=NSAYtY0zktWyCDHaMfye/Hamb6gGNOHk+TWVQUW1ortJPI7PyKPll15d5whZoqdMlH
         ZWLg2EAo1sLGoJKX2/vvMNb8qpfPdojEIqKP9kFY3y0BHW6Io2f8JgKHxe9PFTrXWA60
         lpJOugo8p5LNx4icQqB6uQ+2lPNmTkVAr6Km9geZnOHCFg8EkT/HoOACfCtdkAF2ZHk0
         2n0Kmd74FTgpVZtaW2HqpJ3EnKo/QE0ucHm/k23p2t+Qa7E6qK6bVDO0GaI02JRJGigh
         epkgecsKzcfvWvQRhexu9cJzQUQ1c1kObMdw8GImu7MviDm/iFqpHWru2KKSkdQ3vCd7
         x5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VfhBUVK/ovN3goBcDFRvp4sLmEI41Qyk0820v/SAe1I=;
        b=Wkbb7F/xw3IGQDlPENzvX2z7orBU3I36oKcZrVRK5sNuh5DsPM3iQxKRknXZf/8/zB
         PjhkphWwO4xbGtjBgQIaPJjsy4OgIyyhE45fj0f2MBOdKIisLd0eoZGZBhL/la193pf+
         lH6PhuOxFhPdQLyxnzIXSbWO1pGGpRpJGCYuFwlOoa4xUOBAVmLnDySGecztIvl1fN4x
         lNpQeouYPeDfxpVyM8FAvTiGuqDqt6s/jSTPge3Vp8znYX+B65McyBN8U2cD0utB8kmP
         bxioOVjrNLXR+HPIfEy8gcEsb2STAWXnwoFNGCuTdhkzmDyYkPdms7ZgHgTSmRqttm+d
         rXbw==
X-Gm-Message-State: AOAM532+b47cp9Jkoe1kjcuikjZausa4x/jQGjYIbR+Y2hBN+AGWcpNN
	Pcmg6+RS5w+rfbbgSDvgUe28FhiYwbw=
X-Google-Smtp-Source: 
 ABdhPJyymuzRvL5asOeoBdGQrue2vV+agIcnKQSPSKvfAVBMAd4/d8WrxZiww+aty6Zx5tKtd2eRpw==
X-Received: by 2002:aa7:dcd5:0:b0:425:e49f:db86 with SMTP id
 w21-20020aa7dcd5000000b00425e49fdb86mr16137546edu.202.1651048824698;
        Wed, 27 Apr 2022 01:40:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/18] icu: update 70.1 -> 71.1
Date: Wed, 27 Apr 2022 10:40:05 +0200
Message-Id: <20220427084009.3406717-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164905

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/icu/{icu_70.1.bb => icu_71.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_70.1.bb => icu_71.1.bb} (95%)

diff --git a/meta/recipes-support/icu/icu_70.1.bb b/meta/recipes-support/icu/icu_71.1.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_70.1.bb
rename to meta/recipes-support/icu/icu_71.1.bb
index dd684fe5b9..d8ef2a3746 100644
--- a/meta/recipes-support/icu/icu_70.1.bb
+++ b/meta/recipes-support/icu/icu_71.1.bb
@@ -83,7 +83,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=dc9d616e558490c389609a0e8b81ae6d"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=a89d03060ff9c46552434dbd1fe3ed1f"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -112,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "8d205428c17bf13bb535300669ed28b338a157b1c01ae66d31d0d3e2d47c3fd5"
-SRC_URI[data.sha256sum] = "c72723ddba3300ffb231d6b09e2a728ea6e89de10ed5927f74bacbd77042336e"
+SRC_URI[code.sha256sum] = "67a7e6e51f61faf1306b6935333e13b2c48abd8da6d2f46ce6adca24b1e21ebf"
+SRC_URI[data.sha256sum] = "e3882b4fece6e5e039f22c3189b7ba224180fd26fdbfa9db284617455b93e804"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.30.2


