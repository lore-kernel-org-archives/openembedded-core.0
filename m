Return-Path: <nilskruse97@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D159FD5302
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 06:57:19 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89840.1772175432361769973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 22:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hLba5jTt;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: nilskruse97@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-386b553c70eso17794161fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 22:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772175430; x=1772780230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sEtiQ1b+FVtBUpcbMtqFYEJAuWt5IOhO2UkivLDNtI=;
        b=hLba5jTtfAViBCAdLOYTaFPIuZGfcp5tIB1cEANi9Y3RjJXpEybfXCDk/UC5beA5YK
         rHXZj5GCMNIobtd3EbYDX+4pUyz8QNE3LCHT/7xreY37+xPwOr/U1f7mtsdRwG1csGSK
         NRMNCBFvu142sdv9yDUJwVNIGHucUZrCwg8GuCz3C1thgbx2FnRRe1l3OGpDQWCrfvBM
         WU+E+lEIMHpn9xIW+NXJq6xEo0vTCZCN2udjafQGZ1Wh64AuMU8M6vApZ3LvwCR0OFdF
         u2LvrODw/gaTBGJGHyVuzjuFoHayPAxkkl5z/uPHGr4inEeEnIleqoyix6uAOmeoJqvl
         gUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175430; x=1772780230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sEtiQ1b+FVtBUpcbMtqFYEJAuWt5IOhO2UkivLDNtI=;
        b=OVG6Y83EDQ8s7a0XWmvEF9pUxplv2KH8z9DFm2LmHykT/F4LazHEEpNgpgs9irLHCo
         ipnASapAKQo5k76IMjjlbVhjPx29UIFs7QZP1YnL375Nvqd5LxUscx8ty+XdaFMrv8YQ
         Mr+p1c7E/0pXGH5XI6au4GwJmTaZC2p+whSRqfKDgLBgL+AzuOn97U1J6+VfNxciqGpb
         QxcJbdR2QvPSoC6L4yo8r6PBskS9GMhl+aZvadf+HRnwdFDhsHSac7Ze902SDAuPHi+V
         /bkFwh0LDFts/R9O6iOSFarHUJMMtHj5earjnSuse2SwtDaswAfFz9y5lmCWv4gUqfcC
         hu9g==
X-Gm-Message-State: AOJu0YzMq+mJY/wZcc3zSv+oaplciTRYDMTw4B5rQdAQ1wYvERk1CfEm
	7zRbFNQV/xl7soEMaN3kD0CUJjzaF4kqVIcu2b3kg171Ka1GJevjlsgIOfJSTw==
X-Gm-Gg: ATEYQzxVG+3CqZ40GvC1qGMbYp2WcjBDc6iPflnOiKF6sTOHDl+vQ16i04YZC4QREwD
	wyp44btSGP9CLUzex45LccbZEcPAX7Q6SjsWwwa1TrAg4PzL9DmLVd0Dtq2usy/Fy/Tn4mpHrPd
	MTq/19kNWgHt9SClOo/yu4tXpEU66gHbeeh7dGgFtFm69AzSaxK7ZjGpIa1Lg6qAYtr83o65Y76
	xhYv9XAfCyOWFXU8vLvoM5pRlY5dCsiojVi49bIUBLaxm5KqOSeN2IQHWd+AqGRseKT//MdqYS0
	Eqy2KH4pdXi//hIzvd5vNLcxRAmS+KtbAISvk868itfsbz5JVuFqjT4ij3gHsbiH8uRJx+HsNzi
	7vZBWupSoNPrMEgWXVtn/+Nf7nUzrOp/RsbqdprtSJVjcA0qV115qiGa6BGxhVFrtV/G/neo323
	3Q+rcPoO2rthrDJHX3xRBc86rZdRsw+BdDgNAERs2L1VFdCcc=
X-Received: by 2002:a05:600c:548f:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-483c9ba7c15mr19242305e9.9.1772174956788;
        Thu, 26 Feb 2026 22:49:16 -0800 (PST)
Received: from 520AV-IT0280.du.espera.com ([2a02:908:825:7381:6da0:4798:b562:5db6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm210665585e9.13.2026.02.26.22.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:49:16 -0800 (PST)
From: Nils Kruse <nilskruse97@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Nils Kruse <nilskruse97@gmail.com>
Subject: [PATCH] pseudo: Update to pull in fixes for undefined __NR_openat2 and SYS_openat2
Date: Fri, 27 Feb 2026 07:49:14 +0100
Message-Id: <20260227064914.19315-1-nilskruse97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232078

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
 

