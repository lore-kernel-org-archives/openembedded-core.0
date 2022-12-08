Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42820C4167B
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4569.1670539392101295192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bpCUsoPU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id p24so2990715plw.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHNvpewMCjhAtLNWcaTu81RWPIrqSAzTPu2+TTl5XQI=;
        b=bpCUsoPU+G3ViEGqLS3g5JizIGG+rETZT03bmtdrAjH4+FotxehyNI7jjiPsJOfTkW
         r8Nvtv2trLOkTeHHasJvgaOQ8WBzhCr/OaVUqMOJ+iIIoYVnHrau5++gTgsOZ4NFuYZb
         pRpy/V/LQMy7ZfUi95Pyv2h2P4GDhRAGeguqrg0lfKl30HvcoBLXZlx+qd77M9EL8fqR
         YV4TqCtrsduHY2O8lh1ynwUeuUa15jrx2YcjAHrUbp26u9kmduS/9O+kBCxW343pjI/r
         Iw0uRu1w+4JJdcQDs1OFDsLizegdCHuvwpTsV0FPX7XXRsSLCFynnVANF2mhCN0ZvlV8
         Nr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHNvpewMCjhAtLNWcaTu81RWPIrqSAzTPu2+TTl5XQI=;
        b=Lh+XH0KYhyLEyMIpNlyHlhTtA8B52UbcxoKjPQUeGGvnnBGJv0ETq8Do4ElzYsswx0
         vBh8sS3PgL/kN6nzk0gsp48c+P1s8Zw24ztwssh1w+6bVtcRnGfVIVfEikUq1brNM+KT
         vM9TMB1UJuIMncR4lToCWz8jTsym5Pxb5fu8p/Nkomi56c/LGl4TM7AE5Rb+/gc7X//R
         IzG6t0riLAf06NZoAEZ7bJvJ2woaiKnPt3FD5FdsIRDPaBUpibUAimriecSCApypQz3C
         CeUFuemkBo09dYt99scWvPxm1NePpkMGlhJqOEl/j45Zt5VbRD8IYNTHdJx+ryInr2b/
         r3qA==
X-Gm-Message-State: ANoB5pm3PghURgb+6TD4HF+hAQIxQ81eCUw2tM40y9QLSr/IyVDCI+V0
	Ynga5wetaxglr+DID4UAS7haRF9QnGTg7hdKfjxFpA==
X-Google-Smtp-Source: AA0mqf6ure6ekccSnx97kKyv42Oa7K3Gtrf82amIWsrHWaBGrd3vgEWVoJ97YYyis+POqlhYjd3jGg==
X-Received: by 2002:a17:902:e952:b0:189:dc3:ee9c with SMTP id b18-20020a170902e95200b001890dc3ee9cmr4372476pll.65.1670539391155;
        Thu, 08 Dec 2022 14:43:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/12] vim: upgrade 9.0.0820 -> 9.0.0947
Date: Thu,  8 Dec 2022 12:42:46 -1000
Message-Id: <33afca758f3099406211fe9c31631ce439c78dd2.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174418

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

Includes fixes for CVE-2022-4141
https://nvd.nist.gov/vuln/detail/CVE-2022-4141

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 160f459febc7fb36cc0fe85c63eb26780ace3bfd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 298a111853..d86841efaa 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0820"
-SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
+PV .= ".0947"
+SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


