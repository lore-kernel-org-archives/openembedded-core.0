Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B13C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:46 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.9655.1642084666192339384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QGVrKEyV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id t18so10227000plg.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sPsZpm0679vWB7IyH7Kp3GyZaZyUf9RfRXjHOY099oI=;
        b=QGVrKEyVPBTPEYNkXhP+cMtn6f6QMjDWQC+6m6BYmhzWPfA44X9086KoFiMI6fXR1M
         n8hG0pw3/0VmtvKsKu6wCFDqc3vRRaS0ECUizoporcZX4wAI6E1e9j/NJLNcwY6cuhmk
         dS4qpx82R/VJVZ/86HFrmaaAJ1UU2jFAWIABEUBcOY2U1ulnM2qlgggOpqCpqVNUXqDn
         kC/CjAYUzO1mmEdOAcPgG92DJWDYmrccLcqPIm3/Y2J6IrJa2CulrF8HVrdm8lzClSxm
         RcDzsXkwoDqH07bEqR3ENeIsM2pnw/tjydgMJiNwaMgJmSQ9IfrQnDWZjSALGVTAGL+L
         RJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sPsZpm0679vWB7IyH7Kp3GyZaZyUf9RfRXjHOY099oI=;
        b=YWCDoM8Fa39r4pGnVCmIYyHxMvItPkWl+kA99rEnrktNcsTfsWroIylKQYlTLS6Xt7
         k7BUS4SPWhfVuDt2v2Ith2HTIT6ZCw0uqGHiYmXqrCYgkQq2qvZgLVcbm/GQmGc17luC
         rxmpz80l/prQqJXcYroOR04HNA9APoCdOdh4D5h1cr2uNhfcQco3BP1l3GVXG9lKae1h
         bkyuJjt4VCIr/Vc0HAonv19wAFdvNnv+FvN+Pb1D+Z4pxmRjkgM1JAiNy+j/poismgSu
         /Dpq3vaV+32lFfoTht9fmBHZP5WDQ9YQmxKWBFcgunTw+T6f9tovUrjUBQSkzpanZngh
         NIdQ==
X-Gm-Message-State: AOAM532DZkBGsYhhbziBdYwmktbQTYHxBQaNe7GvSCDwdqZTB6AX4HmR
	Dfo64N1NGYFiBVurdqA8WVZHNSRVoiKr9oYnKSQ=
X-Google-Smtp-Source: 
 ABdhPJyEEHTj1eKW36B9K3TaWPPwLOncl8u28lO9hSVNtBAYw4FezETtXfinZrHCNGx3teVLjeliqg==
X-Received: by 2002:a17:90a:bd01:: with SMTP id
 y1mr14843934pjr.33.1642084665234;
        Thu, 13 Jan 2022 06:37:45 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] xserver-xorg: update CVE_PRODUCT
Date: Thu, 13 Jan 2022 04:37:09 -1000
Message-Id: 
 <183a62e7de1ded1f271d8ba4d1b149a85159f4bd.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160516

From: Anuj Mittal <anuj.mittal@intel.com>

Some of the CVEs have x_server as the product name.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d5d63cf8605515bb659b6b732683d7fe6540728)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b4f0760176..02daafc098 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -18,7 +18,7 @@ INC_PR = "r8"
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 
-CVE_PRODUCT = "xorg-server"
+CVE_PRODUCT = "xorg-server x_server"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.25.1


