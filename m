Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03430C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:20 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.7918.1646406318982866116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J7bsx9Wp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 kx1-20020a17090b228100b001bf2dd26729so1075893pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hq/K6HUBdgjS5aWirAuMLAeknnFygmYIfmFuy6Y6/oQ=;
        b=J7bsx9WpVlkeZ7PuGf2b64XKvTx4hqtK9dE3q4mv99D+doXWTV+zQKzYe2sd2rO5wU
         YW80Rsi23qWZLEv4cuJIBp7yiHACm0PM2W6qLx7IwO7Vcw8pen1DG/x8oUrqYzDeo2PJ
         rF5yhqDM9/f132x71+RJwQaKrhjrGYhUJoT5k1ekBvgFyq7M3Id/dUcZXxB/cBF8G0Y7
         SBijd1WGlbBE23h55gSpVRpj1M6sRTPEVvtPkECUQrXxvh8TC2Cy2z6yS9SNkgZccKu4
         xa8ViLnxzxg9vecINbQ5u/tFxXADsZNff7NTRAO8rvH3RGp2a3U/2gW38zShswhV1maf
         FTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hq/K6HUBdgjS5aWirAuMLAeknnFygmYIfmFuy6Y6/oQ=;
        b=G4c7qECRlk4CiNZbbaeabRnqhmOP/Q2Ozhpd1vXrsbcc+CuXkvBlpSLhQlINZJU18q
         QWzSQjjgakVAz3oaYF9ZKuuuH2UmTkG6/NeICJ+TwU8r7MPo6eD7gh74djoG/bMoFDKj
         o/JlpUiMd/en5EIkig6V+2sgzYpBWFrx6HA2Eu3dB8vFRnlmULUxJID0y/r3IivpLDdZ
         srB51z6orFZqmy/Du+JKl8pmXrCGGIdIzTCHsmCYtb6rs8jwsGkPN5Rf2aXfW2s7IBDy
         7uHnJuKBrGjGc2wG1r6r2xmSe1G12yLCGIbv3JOb0YZ0ga4mrZkurvWVGjMTYZJQmvVD
         +2Yg==
X-Gm-Message-State: AOAM531I73xpkpYAi9qHQsRmzT9p5Ih+wLTOs9ZfF8xlCC+8N5h+VznA
	Pw4pVmwyYI9W3fG3jVdwO1xsFcAhRATbK3vD+cw=
X-Google-Smtp-Source: 
 ABdhPJxMnozgeJom5DLDjjMMSLwMkq7XOHdF93kp6YZ2R+++Cljqur1n+EAK4V32BtuXKRxy/3zIyw==
X-Received: by 2002:a17:90a:7884:b0:1be:ef64:2212 with SMTP id
 x4-20020a17090a788400b001beef642212mr11015055pjk.53.1646406317904;
        Fri, 04 Mar 2022 07:05:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/18] libxml-parser-perl: Add missing RDEPENDS
Date: Fri,  4 Mar 2022 05:04:23 -1000
Message-Id: 
 <6e98fdf7832fed3d93645ed69f62c8df5e89b96b.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162734

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Running the ptest package in an image alone highlighted missing module
dependencies. Add them to fix those errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3859f49db2d694c7b63fdbe25be0018afba5c738)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
index bc154bbdc5..ef2b292352 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
@@ -53,6 +53,7 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/samples
 }
 
+RDEPENDS_${PN} += "perl-module-carp perl-module-file-spec"
 RDEPENDS_${PN}-ptest += "perl-module-filehandle perl-module-if perl-module-test perl-module-test-more"
 
 BBCLASSEXTEND="native nativesdk"
-- 
2.25.1


