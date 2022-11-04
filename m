Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1BDC4167D
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:47 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.7130.1667530899541612988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dhP+FoGk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id c2so3697230plz.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbVhGprp3khcAl8xOfjZy6Nq/4dGS+7fASFCF1ggR0Y=;
        b=dhP+FoGkrTQApdXB6f+5ZaB8kDGfjYH4/o0v/VO0nLBGaOVl9GP1vDnRp1XC2CZpOx
         YiZ/Uh7VM7Sa+L4VLfTApDDWmh/hzFo38z9HuKiP9HV732CWpNrFzf4ovYfuGa5q0+n4
         SBCcGFkRQv/GAvRZOmNJQVey+lW0OIvrlWH5eP706b0nN1xI0WV2/dseC0kBd5LzzWA5
         0fjiwARQ3zdrfU21k3mP1v3TP07DpAeeS0FmGwjU7lmSa3wsNKioFgDqqkc01c6p+o4w
         rVQqvWxykSxDr8JWbWvi1LZFyVCQwn1D22XUuyTG8u1gJSPsEqXpEPE8ukUBSIYPJ6gN
         4p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbVhGprp3khcAl8xOfjZy6Nq/4dGS+7fASFCF1ggR0Y=;
        b=WnhkH7oFsbu/Z7/sNvGt2BRsgoo17+3KqIza0vQ0zxtEnXqcz+wwp7B9943cfcv1jS
         OX3/Pj/Bx795GFDsIOBMyPhMMldESHYzudHYudvm66efkjJQtfMBfHju60pyOOGmr4Ck
         ivwNcHzQrf7yUJS6FFmb/OjO2OXfDoRDxe0vcYibwRXcVFSdQsmVjZSOi3a29qj7avwg
         pNVp3tT241H5uxri8xXH+33PuqPPYb/iFIXd+S+HJhVLs2TVq7mDLrEJwDPNRaV9c3Qo
         JkdAj583XYUZTS49KfPr96lOR7St22Kfn/LEOn7JKDJGLlbjOQknPAfDkjvndYznLwys
         hk8g==
X-Gm-Message-State: ACrzQf3lDa/XLIZbgAuS2f7su560P2CTmeAfpiIz/m/3gsxmIe+D3Yc8
	u/neIkCCcQQNx2XSZ7iv1TSFz4ULjON7d39L
X-Google-Smtp-Source: AMsMyM5V91qnmoSxB60qtaoprzVUe6mYzSGDQiGOUkhrDPPNxH6Mvx8Ft8nrVXY59Z3Ojyrf4OQQRQ==
X-Received: by 2002:a17:90b:4a42:b0:213:383f:cd21 with SMTP id lb2-20020a17090b4a4200b00213383fcd21mr50940767pjb.23.1667530898550;
        Thu, 03 Nov 2022 20:01:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/31] vim: Upgrade 9.0.0598 -> 9.0.0614
Date: Thu,  3 Nov 2022 17:00:45 -1000
Message-Id: <c3dec320468b7919bfec1aa8f2f63db5eea4367a.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172671

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Include fixes for CVE-2022-3352.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8aa707f80ae1cfe89d5e20ec1f1632a65149aed4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index cbc370100b..0710f6afbf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0598"
-SRCREV = "8279af514ca7e5fd3c31cf13b0864163d1a0bfeb"
+PV .= ".0614"
+SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


