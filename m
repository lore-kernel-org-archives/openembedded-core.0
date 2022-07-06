Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB86C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:08:02 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.3728.1657094874410688758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bXUv6YXI;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id r6so6804250edd.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7nvpGUIbSJFa6qFlwqQk3KQxdpBghsuOsmd5vPvnxsU=;
        b=bXUv6YXIKh3QaDbL8Kd8Gw9rxipvOq/78qgZK49WWxwbged9Ch9mzB4jKF/oW4+GzV
         U3Ftdc8j0kxbWCvB+T0vO+6NqaTTIwMRvpQkx4MRkXLc2XDX8ITKOodRTXKIMIBFzdAK
         XhFqhQRuRpwEixQF796HqEcVzcQ+WbEzu7xxVSU+TFT66KLp+jNxZx92JMKZb/ZikSha
         LYCB/MmTXXqXfEJSXPOtBtqGebU+7jLSX98am4xNSCUHIohEwAyoow13vx1MYxw7n2i1
         iJ7PJxZwxZdDpz+f81DoJFN8mDBo0Mh5Qq/jflPOCeqM8M0W8RWe40GNu2HXBZPrTRxV
         vvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7nvpGUIbSJFa6qFlwqQk3KQxdpBghsuOsmd5vPvnxsU=;
        b=wcgMPRszfaPRc0vAYbbSG30umO/QDH1td+m4AKP8oCDbOZmk+xk3Rr2QOes4PauVrx
         F5OKzHAHH/4tmqkxiR3wKNiWn7dkOvqMm4FVST4davC6z7RK7suZsXsh01l942XkWQDw
         jEjiGKQfPjDqPWk3bNRfVb912FVIXnOqDT/EPgJxPcXDO13F+RpRzUV4XqAMcRuWTleh
         VrV9Z6jFzJdaHC8OZrD19KzeY38/xJTnd9CW6u/omKIIjjqIo4ztwQWFrFB0JzTx6PPX
         YPqLmfg2FWtUCfMdstmSYFwPcdhGlNZpCADWxtaJHM+/VCVCCkEQ3vduHQl+7/CPBp2U
         Qj3A==
X-Gm-Message-State: AJIora/ufRwdIRMVZ62d3cHaBIdUr4WLOHJpWBslrJD8KHicy39HZ/yl
	xvJ4ntMSa7RNDiq/g5MFOkQBEVRkSJslcA==
X-Google-Smtp-Source: 
 AGRyM1u1TdkAYbyqXEm/eIa2BfC9kdWBARCN0NA7EQWEWoK8mqWVzBOABGBStvn2MJnpGfaKWw0hWA==
X-Received: by 2002:a05:6402:34ce:b0:435:afb0:1d5a with SMTP id
 w14-20020a05640234ce00b00435afb01d5amr52576400edc.361.1657094872960;
        Wed, 06 Jul 2022 01:07:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/27] ncurses: mark upstream version as unknown
Date: Wed,  6 Jul 2022 10:07:21 +0200
Message-Id: <20220706080721.3072553-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:08:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167714

This is to avoid check-version reporting a broken current version
(6.3+nnnn sorts higher than 6.3 and isn't tagged in upstream git).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ncurses/ncurses_6.3+20220423.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index 1c46e79b30..9fba5b584b 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -9,6 +9,7 @@ SRCREV = "20db1fb41ec91cd8a1f528e770362092c5403378"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 # This is needed when using patchlevel versions like 6.1+20181013
 CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.30.2


