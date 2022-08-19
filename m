Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EFEC32789
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:45 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.50679.1660876993920883649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Oigwb1+6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso2932179pjd.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=H08WO+CADCSbagt5JglzSlD3Q3/XxSNfkcDSeFg7uy0=;
        b=Oigwb1+6QBK89GleU0xVkML9Rb9KV2laeYfGazKO6L16998Xts5EwIs17DMfY6WHB1
         93d3EfCm/Fm5K307HCsTrHFm8Qgd+gH3XWV0ZveGHejwyn5xeBTIet/c420lmsynM35u
         B3cKagBvmJzRApZULsO6xMLu7OnJZat/VDon+jkIELdKU8HjwOfHDT0Ct0myc/wTD3Xh
         rZYcZJla6GwzksEqikFfHY+hpsbDCDtHbofTDvkmIhGQ9S9yDj0Zli0/4yYGyIDCfKIr
         W1jZ5WYqxnXZP8C5fHP2WQgSmfHT2DdxLSktI0/JOWclj8o1uXIyLNH3OmU1YSyGkBbM
         LhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=H08WO+CADCSbagt5JglzSlD3Q3/XxSNfkcDSeFg7uy0=;
        b=znKOxzHz1hWwFm0k2RCg0uLo5+kQ4zoUiLEBBKKm4KQjbC3VoulFN5k9kG5aJyZzHs
         hQdvyPUwo/35Id2UKcygAoDosbpprnoyduRATMW073NT07rlLS3VHxv9ryBvsIu8D8dy
         ++HHBJvIEPSfOHom6+Ri8mYIy3sEUdJgQMGBXJKVYy4klWqjdSC4dRgNdE61Wczm6DMH
         OynFV7A/bmafwzOKff1Ymra3z2O9CnaT2+clwdgyVpoG+MSkYDonGhEaL47x/1RUy9GF
         4uviLjkc6HquVRW2pPlNmdWffGd/iEPpdkWpfXGpPlkruoYIExUJQJpXYnLRUkLV3dXP
         dNMA==
X-Gm-Message-State: ACgBeo1L7/rHLSCRW3Qc0Hdl7CRE598S9PRo6v56ZTGraazd+teFHCdD
	iXVtRfPRYEB1Raa1tZAma4fVQZ4qpcmvX4gP
X-Google-Smtp-Source: 
 AA6agR6fyS8W+mGMfjv1OD7k8RXeLpnWk3kElbZlZgEEsIJeqIZtw5KDOm4N7C9Rh5O500SK/XsrGA==
X-Received: by 2002:a17:903:291:b0:172:ba83:71a8 with SMTP id
 j17-20020a170903029100b00172ba8371a8mr3649885plr.65.1660877019542;
        Thu, 18 Aug 2022 19:43:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/26] archiver.bbclass: remove unsed
 do_deploy_archives[dirs]
Date: Thu, 18 Aug 2022 16:42:37 -1000
Message-Id: 
 <31ed9d68cca4788c48e1e7c470218b80df61baa4.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169558

From: Jose Quaresma <quaresma.jose@gmail.com>

Remove as commit b3afe7d redifines it.

https://git.openembedded.org/openembedded-core/commit/?id=b3afe7d9bd25a943e947de3ec064ea245173c5a8

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf5e155a9c76a6e4ed7145118e7367ab6f2f53f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 33070cd17f..5da369d422 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -69,7 +69,6 @@ SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_SRC}/mirror"
 do_dumpdata[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_recipe[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
-do_deploy_archives[dirs] = "${WORKDIR}"
 
 # This is a convenience for the shell script to use it
 
-- 
2.25.1


