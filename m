Return-Path: <nilskruse97@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289E8FD8FFD
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 06:57:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89836.1772175420559448036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 22:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGngHdqR;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: nilskruse97@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso13223675e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 22:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772175419; x=1772780219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sEtiQ1b+FVtBUpcbMtqFYEJAuWt5IOhO2UkivLDNtI=;
        b=WGngHdqRWrFdwjfJTP5rMdORFf5BKWEqloM3rqKEQhAVOUzFIf0MBnaINPuRT2QJBP
         h+fOubR+wX+Nd8YuBWnr2CbLbq/xCWXYqMPFk3pNng57vfuQp6buSCZ2ABdydaiLVwTp
         dmAgpK+gf6lH0B0hzgCP3yIg72ax5J5tcVD/R4K6vpIiQwYaNJIF5P+psY6tJakOP9W+
         xRfFUFQELELoe19ZeBizadhBICRBxx6VHEiSNG9oltASmWZM7jVznnNNFzm9a5MTu5YP
         WiwbfULLodU41yS80lH0g70sAcc4Tm215lCazuheqUy946wTjvY+WTf1jxksqiR0rQev
         K0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175419; x=1772780219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sEtiQ1b+FVtBUpcbMtqFYEJAuWt5IOhO2UkivLDNtI=;
        b=p9vDCEMIne/i92K/Zkb3nPWHBTOBJsPJMGGa8FrAPeuO4WonGC3NqGdcBkJkcrq2O1
         BZKnSgIpR8INrGXO0BnnUZh7Eoqkvn3P8OTTN+OtXrRjBJKbWGvtNFtFBJnZiDvjCGHU
         kt9QcKJrE9Y9aV9Fq3o6wqoDptzveoayvhWBZ45HjEcH95Oy6duXXv8AingUNPcJTiyG
         g+YM4iefsTul4GvouCYkEXb8WvsvEuhHaBaNP6v50wX6sV/q/fM07Qu9FWm2cGk7cZLs
         A3e43zVt7vIJUAkiOvPjf0ke1b4Ixv5U/04MGUUzWKV6ankyaZ7HYolaIyDsJVyDKJNh
         +MFA==
X-Gm-Message-State: AOJu0YxFkkAtsNUDejgo9ng6Xv8YiEOPhw/J7KWPtDkRTmQl6jTqStT1
	iIf1kcQNbAWa59TPm52sgLPnRvt1CTUGqetvomBpCXO2Ru7r75jd1yVBBx+TZg==
X-Gm-Gg: ATEYQzzbBxwxAj5rpm1xl1CsdYnFvDinzN6uP+XOGLzPeXaB2lCReAMG6WlUpd/eG45
	5MpoFPWJbu+hzfe536yXGm7MP8FS/g7jDojaVH0sWmniLONTa7FqutCXbLEMSrE80fyhqXXra9Z
	piBY8TxR2e6wFxLVlXjj3bcwY5Um7VGaqYF7TqqP+r12fWMalyW5+QGJhSoCfwILTNEQMcGZSuC
	vKFO1bVg50E9OY97eeisXI1jS7bw55s40F+QqTpMjutyHr34/WiPigrLSCl4p2FinhJn7cCTjA9
	xkYJ0zm9Gp7Q5xKCBCg9NRF1ZxExP97Dc40U4OZubJA6a5cPgfRQkVpk/ee0qRaRiQGm9r2ICVM
	XLXfT0sQoXo3Yl04fdafHk17J4GW1LTUBDrr9STgFfQ3snV5hjlfRZ0SCe78LIWaX14SgEkl2CL
	XPY1iC2Y2BJ50Va+8pbo9cKrvMsQpWEjc2RndTcs9qmLFqwzO9c+sSzSBGCw==
X-Received: by 2002:a05:600c:470a:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-483c9ba68eemr20915775e9.6.1772175418713;
        Thu, 26 Feb 2026 22:56:58 -0800 (PST)
Received: from 520AV-IT0280.du.espera.com ([2a02:908:825:7381:6da0:4798:b562:5db6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bffc17dasm96218925e9.2.2026.02.26.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:56:58 -0800 (PST)
From: Nils Kruse <nilskruse97@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Nils Kruse <nilskruse97@gmail.com>
Subject: [PATCH] pseudo: Update to pull in fixes for undefined __NR_openat2 and SYS_openat2
Date: Fri, 27 Feb 2026 07:56:55 +0100
Message-Id: <20260227065655.20055-1-nilskruse97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232077

This fixes a compilation error on Ubuntu 20.04 hosts.

Signed-off-by: Nils Kruse <nilskruse97@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index bee6fcb149..0f063f1881 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ab513512d8b5180a430ae4fa738cb531154cdef"
+SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

