Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB1CC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 07:02:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6131.1634799767474737628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H8Ry8+GZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso13270160wms.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qAII8jTrm8yOyCO3k31xnvcTtRH8YcTPx/0BKUGzhyg=;
        b=H8Ry8+GZo9dazri/Yis8E32Gxj/kHqN4Zd+HWObBGi192k+26D+dRBNZK9eXTRpQ8S
         fxoZg8ts+39POP24wGGvSOK2fE9f9/8KPn8YPmJrK9bGXxvWmdObPMF55t652Kgg2TnJ
         D3kTr8nJyhE69z9F+sf+kWYGYX7TB4tNtslRhchr3SPNB5UPjPOK+ssoT+XSC6WQ+KOF
         RmB9wahc2I0RQmVD8ejJvt1C2x5xT1+n6VGb8ow6vyWZ9KC6miroCMfaxBJyPOGrEnYg
         /gQQvTfn6s6Kpley2rL1KmQq2L/XVzQ5luwvG2XqNJdm89z6gzvHqKzwbGIGbqqHUatY
         9KWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qAII8jTrm8yOyCO3k31xnvcTtRH8YcTPx/0BKUGzhyg=;
        b=T5yqcSVYrO/CxL/ZgnUpAFUx0OZ6X6R6G616jv9AvASAc+b/Qth+s8CVTRjJ+JG31q
         0Q3ps1wNmXtbyNSIU1IEOEKR3SLUb98oXkkL9qymAlTSMCGDWN7u97brT0McFXooKZ5O
         Pxch2waeWOP5+cjshc/Br7rSGMJS8eP1z5AVR9P1EBPhLqrhRiZXCofl8NVqoYwwfDoF
         AyuhMOFfQmRKqBDJK3HHzfghtB3fUm1Q3wulJojBv3VqnIdo/vb0ohWFIRT69To2PmYN
         lwa/Fgs9Tvaw0ab22vVuSutegoaylXfCK/4HDl/rJtP5gdIKd6NoBrEXFG+fgFoLZ6sa
         MDuw==
X-Gm-Message-State: AOAM530KIU1QTlHdXY+2C1EGnh9A7UD3cmRXrBIOsqZZNpKPwGVeBW42
	rj8KOiXjnsbPSadOQjWopL/23cUVhn8=
X-Google-Smtp-Source: 
 ABdhPJxQvM7DpPEGQZyRQcZrmLNiFYQZDDb3en/8FBp6tl1dR9av85xcGqq3NnS00TLg5xiDYXw1ow==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr4611085wmc.117.1634799766001;
        Thu, 21 Oct 2021 00:02:46 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f15sm3980274wrt.38.2021.10.21.00.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 00:02:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] stress-ng: convert to git, website is down
Date: Thu, 21 Oct 2021 09:02:42 +0200
Message-Id: <20211021070242.16025-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021070242.16025-1-alex@linutronix.de>
References: <20211021070242.16025-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 07:02:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157273

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
index 198f7e87c7..8a37940bc3 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
@@ -5,10 +5,11 @@ HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[sha256sum] = "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
+SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
+S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
 
-- 
2.20.1


