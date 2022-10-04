Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B711C4167B
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:28 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.12232.1664898681270807706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T9n35bVz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id r185so4289345pgr.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=PHto9Sc43nmo8BRpiBUeYirOGSh28YT7AunCK4Gtcgw=;
        b=T9n35bVzCLBo/xEkeUn3tNS7CyDqAtuPxixI+P31Ty9D+tR5qleW+O6XTaDjKBNjh/
         V64K2jkVmMPRxtVXF/h3DMxJu7rWKMxrfz7vA0sXYCiXqABEF3ZFEPQjg5XzQY2wpzj0
         pMFaPVN9OzB+kDYCTOnpsLRvjGDuynma/K4/soVpufovGceEOvdaOxe8p4vf36pP7AQw
         Nwj2R/nUGTmdfCILyuLBAFTvK9KgCsB9bd/2ZPKMY0JhYYr1Y5oeJKx4T3SK2kB4XMTA
         ruYOsfTH4XFIhHHSV0ds6lB8bD3WysCZ7KscGxLPRDV3Rxp8RN7AxXwad0yNbwm51tjh
         vG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PHto9Sc43nmo8BRpiBUeYirOGSh28YT7AunCK4Gtcgw=;
        b=C31hEcOKZzbbElRox7ux0uRhQIBYac34/a3AQp25HCnRRXIDydbBqo8D2MQWI/WhS3
         SQBXvp6XDSSJclj9CEifBG1jH5vHD+/OgnS+eBp+8Xe8yKtKYt/yBiSOEvuUWi4u7hVA
         LJD+5BDz1/MI19FzmZ3b1gRuxtFy+vS+p65+AOAwpqQAUvpPnfi7t8jZ+XAWPs5/a5HM
         O4sKcOV0/SqjZ0uWPSXw01UmMIuIu2LTA0fNJef8HEDbgry7dPmMksyoYbHpQLM2OFes
         FHPt26JMoIGzMaztopQ+btOANN54pWlwNLafr/hlq4b7HvjwGEytMrq6kNg4qNCITCmX
         JUpA==
X-Gm-Message-State: ACrzQf2qstLkxhbOtkVOtqRxw/HwzqOrp43mGcBkEZ+3Jc2KVfjXxB0E
	RV1cTxxgWzCwPjB89rxwAwtO2N4VLjFaiimM
X-Google-Smtp-Source: 
 AMsMyM5mvrN8WLCn5t3hEiEznPT58fH37l+MeM9LSqcvI6UJbaKDsJmjGAxG5BnmGlwDvyFhpaIiLw==
X-Received: by 2002:a05:6a00:248a:b0:561:e5e1:6ef4 with SMTP id
 c10-20020a056a00248a00b00561e5e16ef4mr1819555pfv.43.1664898680347;
        Tue, 04 Oct 2022 08:51:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/18] rsync: update 3.2.4 -> 3.2.5
Date: Tue,  4 Oct 2022 05:50:35 -1000
Message-Id: 
 <9431be33d8107e7c861b5b41411aae1532fb2c8c.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171413

From: Florin Diaconescu <florin.diaconescu009@gmail.com>

Changelog: https://download.samba.org/pub/rsync/NEWS#3.2.5

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rsync/{rsync_3.2.4.bb => rsync_3.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.4.bb => rsync_3.2.5.bb} (96%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.2.4.bb b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
similarity index 96%
rename from meta/recipes-devtools/rsync/rsync_3.2.4.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.5.bb
index e6f917b5cd..e43f35ea2f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.4.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            "
 
-SRC_URI[sha256sum] = "6f761838d08052b0b6579cf7f6737d93e47f01f4da04c5d24d3447b7f2a5fad1"
+SRC_URI[sha256sum] = "2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_IGNORE += " CVE-2017-16548 "
-- 
2.25.1


